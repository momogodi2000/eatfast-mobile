import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/modules/restaurant_manager_module/providers/domain/models/restaurant_stats.dart';
import 'package:eatfast_mobile/modules/restaurant_manager_module/providers/domain/models/live_order.dart';
import 'package:eatfast_mobile/modules/restaurant_manager_module/providers/domain/models/menu_management.dart';
import 'package:eatfast_mobile/modules/restaurant_manager_module/providers/domain/repositories/restaurant_owner_repository.dart';
import 'package:eatfast_mobile/modules/restaurant_manager_module/services/data/restaurant_owner_repository_impl.dart';
import 'package:eatfast_mobile/shared/services/api/api_client.dart';
import 'package:eatfast_mobile/shared/models/exports.dart' as shared_models;
import 'package:eatfast_mobile/modules/restaurant_manager_module/providers/domain/models/menu_management.dart'
    as local_models;

// Repository provider
final restaurantOwnerRepositoryProvider = Provider<RestaurantOwnerRepository>((
  ref,
) {
  final apiClient = ref.watch(apiClientProvider);
  return RestaurantOwnerRepositoryImpl(apiClient);
});

// Restaurant Owner State Provider
final restaurantOwnerProvider =
    StateNotifierProvider<RestaurantOwnerNotifier, RestaurantOwnerState>((ref) {
      final repository = ref.watch(restaurantOwnerRepositoryProvider);
      return RestaurantOwnerNotifier(repository);
    });

// Live Orders Provider
final liveOrdersProvider =
    StateNotifierProvider<LiveOrdersNotifier, LiveOrdersState>((ref) {
      final repository = ref.watch(restaurantOwnerRepositoryProvider);
      return LiveOrdersNotifier(repository);
    });

// Menu Categories Provider
final menuCategoriesProvider =
    StateNotifierProvider<MenuCategoriesNotifier, MenuCategoriesState>((ref) {
      final repository = ref.watch(restaurantOwnerRepositoryProvider);
      return MenuCategoriesNotifier(repository);
    });

// Dashboard Stats Provider
final dashboardStatsProvider = FutureProvider.family<RestaurantStats, String>((
  ref,
  restaurantId,
) async {
  final repository = ref.watch(restaurantOwnerRepositoryProvider);
  return await repository.getRestaurantStats(restaurantId);
});

// ============================================================================
// State Classes
// ============================================================================

class RestaurantOwnerState {
  final bool isLoading;
  final String? error;
  final RestaurantStats? stats;

  const RestaurantOwnerState({this.isLoading = false, this.error, this.stats});

  RestaurantOwnerState copyWith({
    bool? isLoading,
    String? error,
    RestaurantStats? stats,
  }) {
    return RestaurantOwnerState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      stats: stats ?? this.stats,
    );
  }
}

class LiveOrdersState {
  final bool isLoading;
  final String? error;
  final List<LiveOrder> orders;
  final Map<String, LiveOrder> ordersMap;

  const LiveOrdersState({
    this.isLoading = false,
    this.error,
    this.orders = const [],
    this.ordersMap = const {},
  });

  LiveOrdersState copyWith({
    bool? isLoading,
    String? error,
    List<LiveOrder>? orders,
    Map<String, LiveOrder>? ordersMap,
  }) {
    return LiveOrdersState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      orders: orders ?? this.orders,
      ordersMap: ordersMap ?? this.ordersMap,
    );
  }
}

class MenuCategoriesState {
  final bool isLoading;
  final String? error;
  final List<local_models.MenuCategory> categories;

  const MenuCategoriesState({
    this.isLoading = false,
    this.error,
    this.categories = const [],
  });

  MenuCategoriesState copyWith({
    bool? isLoading,
    String? error,
    List<local_models.MenuCategory>? categories,
  }) {
    return MenuCategoriesState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      categories: categories ?? this.categories,
    );
  }
}

// ============================================================================
// State Notifiers
// ============================================================================

class RestaurantOwnerNotifier extends StateNotifier<RestaurantOwnerState> {
  final RestaurantOwnerRepository _repository;

  RestaurantOwnerNotifier(this._repository)
    : super(const RestaurantOwnerState());

  Future<void> loadStats(String restaurantId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final stats = await _repository.getRestaurantStats(restaurantId);
      state = state.copyWith(isLoading: false, stats: stats);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> refreshStats(String restaurantId) async {
    await loadStats(restaurantId);
  }
}

class LiveOrdersNotifier extends StateNotifier<LiveOrdersState> {
  final RestaurantOwnerRepository _repository;

  LiveOrdersNotifier(this._repository) : super(const LiveOrdersState());

  Future<void> loadOrders(String restaurantId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final orders = await _repository.getLiveOrders(restaurantId);
      final ordersMap = {for (var order in orders) order.orderId: order};
      state = state.copyWith(
        isLoading: false,
        orders: orders,
        ordersMap: ordersMap,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> acceptOrder(String orderId) async {
    try {
      await _repository.updateOrderStatus(
        orderId,
        shared_models.OrderStatus.accepted,
      );
      await _refreshCurrentOrders();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> rejectOrder(String orderId, String reason) async {
    try {
      await _repository.updateOrderStatus(
        orderId,
        shared_models.OrderStatus.rejected,
      );
      await _refreshCurrentOrders();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> updateOrderStatus(
    String orderId,
    shared_models.OrderStatus status,
  ) async {
    try {
      await _repository.updateOrderStatus(orderId, status);
      await _refreshCurrentOrders();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> _refreshCurrentOrders() async {
    // Get restaurant ID from first order or state
    if (state.orders.isNotEmpty) {
      final restaurantId = state.orders.first.orderId.split('-').first;
      await loadOrders(restaurantId);
    }
  }
}

class MenuCategoriesNotifier extends StateNotifier<MenuCategoriesState> {
  final RestaurantOwnerRepository _repository;

  MenuCategoriesNotifier(this._repository) : super(const MenuCategoriesState());

  Future<void> loadCategories(String restaurantId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      // This would call the repository method when implemented
      // For now, returning empty list
      state = state.copyWith(isLoading: false, categories: []);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> addCategory(local_models.MenuCategory category) async {
    try {
      // Add category logic
      final updatedCategories = [...state.categories, category];
      state = state.copyWith(categories: updatedCategories);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> updateCategory(local_models.MenuCategory category) async {
    try {
      final updatedCategories = state.categories
          .map((c) => c.categoryId == category.categoryId ? category : c)
          .toList();
      state = state.copyWith(categories: updatedCategories);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> deleteCategory(String categoryId) async {
    try {
      final updatedCategories = state.categories
          .where((c) => c.categoryId != categoryId)
          .toList();
      state = state.copyWith(categories: updatedCategories);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}
