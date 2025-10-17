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

// Restaurant Owner State Provider (Family)
final restaurantOwnerProvider =
    StateNotifierProvider.family<
      RestaurantOwnerNotifier,
      RestaurantOwnerState,
      String
    >((ref, restaurantId) {
      final repository = ref.watch(restaurantOwnerRepositoryProvider);
      return RestaurantOwnerNotifier(repository, restaurantId);
    });

// Live Orders Provider (Family) - Returns AsyncValue
final liveOrdersProvider =
    StateNotifierProvider.family<LiveOrdersNotifier, AsyncValue<List<LiveOrder>>, String>((
      ref,
      restaurantId,
    ) {
      final repository = ref.watch(restaurantOwnerRepositoryProvider);
      return LiveOrdersNotifier(repository, restaurantId);
    });

// Menu Categories Provider (Family)
final menuCategoriesProvider =
    StateNotifierProvider.family<
      MenuCategoriesNotifier,
      MenuCategoriesState,
      String
    >((ref, restaurantId) {
      final repository = ref.watch(restaurantOwnerRepositoryProvider);
      return MenuCategoriesNotifier(repository, restaurantId);
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
  final List<LiveOrder> liveOrders;

  const RestaurantOwnerState({
    this.isLoading = false,
    this.error,
    this.stats,
    this.liveOrders = const [],
  });

  RestaurantOwnerState copyWith({
    bool? isLoading,
    String? error,
    RestaurantStats? stats,
    List<LiveOrder>? liveOrders,
  }) {
    return RestaurantOwnerState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      stats: stats ?? this.stats,
      liveOrders: liveOrders ?? this.liveOrders,
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
  final String restaurantId;

  RestaurantOwnerNotifier(this._repository, this.restaurantId)
    : super(const RestaurantOwnerState()) {
    // Auto-load stats when notifier is created
    loadStats();
  }

  Future<void> loadStats() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final stats = await _repository.getRestaurantStats(restaurantId);
      state = state.copyWith(isLoading: false, stats: stats);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> refreshStats() async {
    await loadStats();
  }

  // Wallet management methods
  Future<void> getWalletBalance() async {
    // Implementation for wallet balance
    // This would typically call repository method
  }

  Future<void> getWalletTransactions() async {
    // Implementation for wallet transactions
  }

  Future<void> requestWithdrawal(double amount, String method) async {
    // Implementation for withdrawal request
  }
}

class LiveOrdersNotifier extends StateNotifier<AsyncValue<List<LiveOrder>>> {
  final RestaurantOwnerRepository _repository;
  final String restaurantId;

  LiveOrdersNotifier(this._repository, this.restaurantId)
    : super(const AsyncValue.loading()) {
    // Auto-load orders when notifier is created
    loadOrders();
  }

  Future<void> loadOrders() async {
    state = const AsyncValue.loading();
    try {
      final ordersResult = await _repository.getLiveOrders(restaurantId);

      // Handle Result type properly
      final orders = ordersResult.fold(
        (success) => success,
        (error) => throw Exception(error),
      );

      state = AsyncValue.data(orders);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> acceptOrder(String orderId) async {
    try {
      await _repository.updateOrderStatus(
        orderId,
        shared_models.OrderStatus.accepted,
      );
      await loadOrders();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> rejectOrder(String orderId, String reason) async {
    try {
      await _repository.updateOrderStatus(
        orderId,
        shared_models.OrderStatus.rejected,
      );
      await loadOrders();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> updateOrderStatus(
    String orderId,
    shared_models.OrderStatus status,
  ) async {
    try {
      await _repository.updateOrderStatus(orderId, status);
      await loadOrders();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

class MenuCategoriesNotifier extends StateNotifier<MenuCategoriesState> {
  final RestaurantOwnerRepository _repository;
  final String restaurantId;

  MenuCategoriesNotifier(this._repository, this.restaurantId)
    : super(const MenuCategoriesState()) {
    // Auto-load categories when notifier is created
    loadCategories();
  }

  Future<void> loadCategories() async {
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

  // Menu item management methods
  Future<void> createMenuItem(local_models.MenuItemDetails item) async {
    try {
      // Implementation for creating menu item
      await loadCategories(); // Reload to get updated data
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> updateMenuItem(local_models.MenuItemDetails item) async {
    try {
      // Implementation for updating menu item
      await loadCategories();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> deleteMenuItem(String itemId) async {
    try {
      // Implementation for deleting menu item
      await loadCategories();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> toggleItemAvailability(String itemId, bool available) async {
    try {
      // Implementation for toggling availability
      await loadCategories();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> bulkUpdateAvailability(List<String> itemIds, bool available) async {
    try {
      // Implementation for bulk update
      await loadCategories();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<String?> uploadItemImage(String itemId, String imagePath) async {
    try {
      // Implementation for image upload
      return 'uploaded_url';
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return null;
    }
  }

  Future<void> createMenuCategory(local_models.MenuCategory category) async {
    try {
      await addCategory(category);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> updateMenuCategory(local_models.MenuCategory category) async {
    try {
      await updateCategory(category);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> deleteMenuCategory(String categoryId) async {
    try {
      await deleteCategory(categoryId);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}
