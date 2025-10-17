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

// Item Performance Provider
final itemPerformanceProvider = FutureProvider.family<List<local_models.MenuItemPerformance>, String>((
  ref,
  restaurantId,
) async {
  final repository = ref.watch(restaurantOwnerRepositoryProvider);
  final result = await repository.getItemPerformance(restaurantId);
  return result.when(
    success: (performance) => performance,
    failure: (error) => throw Exception(error),
  );
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

  // Add .when() method for pattern matching
  T when<T>({
    required T Function() loading,
    required T Function(List<local_models.MenuCategory>) data,
    required T Function(String) error,
  }) {
    if (this.error != null) return error(this.error!);
    if (isLoading) return loading();
    return data(categories);
  }

  // Add .value getter for convenience
  List<local_models.MenuCategory> get value => categories;
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
  Future<shared_models.Result<Map<String, dynamic>, String>> getWalletBalance() async {
    try {
      return await _repository.getWalletBalance(restaurantId);
    } catch (e) {
      return shared_models.Result.failure(e.toString());
    }
  }

  Future<shared_models.Result<List<Map<String, dynamic>>, String>> getWalletTransactions() async {
    try {
      return await _repository.getWalletTransactions(restaurantId);
    } catch (e) {
      return shared_models.Result.failure(e.toString());
    }
  }

  Future<shared_models.Result<void, String>> requestWithdrawal(double amount, String description) async {
    try {
      return await _repository.requestWithdrawal(restaurantId, amount, description);
    } catch (e) {
      return shared_models.Result.failure(e.toString());
    }
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

      // Handle Result type properly using .when()
      final orders = ordersResult.when(
        success: (value) => value,
        failure: (error) => throw Exception(error),
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
      final result = await _repository.getMenuCategories(restaurantId);
      result.when(
        success: (categories) {
          state = state.copyWith(isLoading: false, categories: categories);
        },
        failure: (error) {
          state = state.copyWith(isLoading: false, error: error);
        },
      );
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
  Future<shared_models.Result<local_models.MenuItemDetails, String>> createMenuItem(String categoryId, local_models.MenuItemDetails item) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _repository.createMenuItem(categoryId, item);
      return result.when(
        success: (createdItem) async {
          await loadCategories(); // Reload to get updated data
          state = state.copyWith(isLoading: false);
          return shared_models.Result.success(createdItem);
        },
        failure: (error) {
          state = state.copyWith(isLoading: false, error: error);
          return shared_models.Result.failure(error);
        },
      );
    } catch (e) {
      final errorMessage = e.toString();
      state = state.copyWith(isLoading: false, error: errorMessage);
      return shared_models.Result.failure(errorMessage);
    }
  }

  Future<shared_models.Result<local_models.MenuItemDetails, String>> updateMenuItem(local_models.MenuItemDetails item) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _repository.updateMenuItem(item);
      return result.when(
        success: (updatedItem) async {
          await loadCategories();
          state = state.copyWith(isLoading: false);
          return shared_models.Result.success(updatedItem);
        },
        failure: (error) {
          state = state.copyWith(isLoading: false, error: error);
          return shared_models.Result.failure(error);
        },
      );
    } catch (e) {
      final errorMessage = e.toString();
      state = state.copyWith(isLoading: false, error: errorMessage);
      return shared_models.Result.failure(errorMessage);
    }
  }

  Future<shared_models.Result<void, String>> deleteMenuItem(String itemId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _repository.deleteMenuItem(itemId);
      return result.when(
        success: (_) async {
          await loadCategories();
          state = state.copyWith(isLoading: false);
          return shared_models.Result.success(null);
        },
        failure: (error) {
          state = state.copyWith(isLoading: false, error: error);
          return shared_models.Result.failure(error);
        },
      );
    } catch (e) {
      final errorMessage = e.toString();
      state = state.copyWith(isLoading: false, error: errorMessage);
      return shared_models.Result.failure(errorMessage);
    }
  }

  Future<shared_models.Result<void, String>> toggleItemAvailability(String itemId, bool available) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _repository.toggleItemAvailability(itemId, available);
      return result.when(
        success: (_) async {
          await loadCategories();
          state = state.copyWith(isLoading: false);
          return shared_models.Result.success(null);
        },
        failure: (error) {
          state = state.copyWith(isLoading: false, error: error);
          return shared_models.Result.failure(error);
        },
      );
    } catch (e) {
      final errorMessage = e.toString();
      state = state.copyWith(isLoading: false, error: errorMessage);
      return shared_models.Result.failure(errorMessage);
    }
  }

  Future<shared_models.Result<void, String>> bulkUpdateAvailability(List<String> itemIds, bool available) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _repository.bulkUpdateAvailability(itemIds, available);
      return result.when(
        success: (_) async {
          await loadCategories();
          state = state.copyWith(isLoading: false);
          return shared_models.Result.success(null);
        },
        failure: (error) {
          state = state.copyWith(isLoading: false, error: error);
          return shared_models.Result.failure(error);
        },
      );
    } catch (e) {
      final errorMessage = e.toString();
      state = state.copyWith(isLoading: false, error: errorMessage);
      return shared_models.Result.failure(errorMessage);
    }
  }

  Future<shared_models.Result<String, String>> uploadItemImage(String itemId, dynamic imageFile) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      // Convert dynamic imageFile to File if it's not already
      final file = imageFile is String ? null : imageFile;
      if (file == null) {
        state = state.copyWith(isLoading: false);
        return shared_models.Result.failure('Invalid image file');
      }

      final result = await _repository.uploadItemImage(itemId, file);
      return result.when(
        success: (imageUrl) {
          state = state.copyWith(isLoading: false);
          return shared_models.Result.success(imageUrl);
        },
        failure: (error) {
          state = state.copyWith(isLoading: false, error: error);
          return shared_models.Result.failure(error);
        },
      );
    } catch (e) {
      final errorMessage = e.toString();
      state = state.copyWith(isLoading: false, error: errorMessage);
      return shared_models.Result.failure(errorMessage);
    }
  }

  Future<shared_models.Result<local_models.MenuCategory, String>> createMenuCategory(local_models.MenuCategory category) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _repository.createMenuCategory(restaurantId, category);
      return result.when(
        success: (createdCategory) {
          final updatedCategories = [...state.categories, createdCategory];
          state = state.copyWith(isLoading: false, categories: updatedCategories);
          return shared_models.Result.success(createdCategory);
        },
        failure: (error) {
          state = state.copyWith(isLoading: false, error: error);
          return shared_models.Result.failure(error);
        },
      );
    } catch (e) {
      final errorMessage = e.toString();
      state = state.copyWith(isLoading: false, error: errorMessage);
      return shared_models.Result.failure(errorMessage);
    }
  }

  Future<shared_models.Result<local_models.MenuCategory, String>> updateMenuCategory(local_models.MenuCategory category) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _repository.updateMenuCategory(category);
      return result.when(
        success: (updatedCategory) {
          final updatedCategories = state.categories
              .map((c) => c.categoryId == updatedCategory.categoryId ? updatedCategory : c)
              .toList();
          state = state.copyWith(isLoading: false, categories: updatedCategories);
          return shared_models.Result.success(updatedCategory);
        },
        failure: (error) {
          state = state.copyWith(isLoading: false, error: error);
          return shared_models.Result.failure(error);
        },
      );
    } catch (e) {
      final errorMessage = e.toString();
      state = state.copyWith(isLoading: false, error: errorMessage);
      return shared_models.Result.failure(errorMessage);
    }
  }

  Future<shared_models.Result<void, String>> deleteMenuCategory(String categoryId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _repository.deleteMenuCategory(categoryId);
      return result.when(
        success: (_) {
          final updatedCategories = state.categories
              .where((c) => c.categoryId != categoryId)
              .toList();
          state = state.copyWith(isLoading: false, categories: updatedCategories);
          return shared_models.Result.success(null);
        },
        failure: (error) {
          state = state.copyWith(isLoading: false, error: error);
          return shared_models.Result.failure(error);
        },
      );
    } catch (e) {
      final errorMessage = e.toString();
      state = state.copyWith(isLoading: false, error: errorMessage);
      return shared_models.Result.failure(errorMessage);
    }
  }
}
