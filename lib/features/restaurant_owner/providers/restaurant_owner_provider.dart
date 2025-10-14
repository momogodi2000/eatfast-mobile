import 'dart:async';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/result.dart';
import '../domain/models/restaurant_stats.dart';
import '../domain/models/live_order.dart';
import '../domain/models/menu_management.dart';
import '../domain/repositories/restaurant_owner_repository.dart';
import '../data/restaurant_owner_repository_impl.dart';

// Repository provider
final restaurantOwnerRepositoryProvider = Provider<RestaurantOwnerRepository>((ref) {
  return RestaurantOwnerRepositoryImpl();
});

// Dashboard stats provider
final dashboardStatsProvider = FutureProvider.family<RestaurantStats, String>((ref, restaurantId) async {
  final repository = ref.watch(restaurantOwnerRepositoryProvider);
  final result = await repository.getDashboardStats(restaurantId);
  
  return result.when(
    success: (stats) => stats,
    failure: (error) => throw Exception(error),
  );
});

// Live orders provider with real-time updates
final liveOrdersProvider = StreamProvider.family<List<LiveOrder>, String>((ref, restaurantId) {
  final repository = ref.watch(restaurantOwnerRepositoryProvider);
  return repository.watchLiveOrders(restaurantId);
});

// Restaurant Owner State Management
class RestaurantOwnerState {
  final bool isLoading;
  final String? error;
  final RestaurantStats? stats;
  final List<LiveOrder> liveOrders;
  final List<MenuCategory> menuCategories;
  final String? selectedOrderId;
  final OrderFilter orderFilter;

  const RestaurantOwnerState({
    this.isLoading = false,
    this.error,
    this.stats,
    this.liveOrders = const [],
    this.menuCategories = const [],
    this.selectedOrderId,
    this.orderFilter = OrderFilter.all,
  });

  RestaurantOwnerState copyWith({
    bool? isLoading,
    String? error,
    RestaurantStats? stats,
    List<LiveOrder>? liveOrders,
    List<MenuCategory>? menuCategories,
    String? selectedOrderId,
    OrderFilter? orderFilter,
  }) {
    return RestaurantOwnerState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      stats: stats ?? this.stats,
      liveOrders: liveOrders ?? this.liveOrders,
      menuCategories: menuCategories ?? this.menuCategories,
      selectedOrderId: selectedOrderId,
      orderFilter: orderFilter ?? this.orderFilter,
    );
  }
}

enum OrderFilter {
  all,
  pending,
  preparing,
  ready,
  completed,
}

class RestaurantOwnerNotifier extends StateNotifier<RestaurantOwnerState> {
  final RestaurantOwnerRepository _repository;
  final String _restaurantId;
  StreamSubscription<List<LiveOrder>>? _liveOrdersSubscription;

  RestaurantOwnerNotifier(this._repository, this._restaurantId) : super(const RestaurantOwnerState()) {
    _initializeLiveOrders();
    loadDashboardStats();
  }

  void _initializeLiveOrders() {
    _liveOrdersSubscription = _repository.watchLiveOrders(_restaurantId).listen(
      (orders) {
        state = state.copyWith(liveOrders: orders);
      },
      onError: (error) {
        state = state.copyWith(error: error.toString());
      },
    );
  }

  Future<void> loadDashboardStats() async {
    state = state.copyWith(isLoading: true, error: null);
    
    final result = await _repository.getDashboardStats(_restaurantId);
    
    result.when(
      success: (stats) {
        state = state.copyWith(
          isLoading: false,
          stats: stats,
        );
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          error: error,
        );
      },
    );
  }

  Future<void> acceptOrder(String orderId, int estimatedPrepTime) async {
    final result = await _repository.acceptOrder(orderId, estimatedPrepTime);
    
    result.when(
      success: (updatedOrder) {
        final updatedOrders = state.liveOrders.map((order) {
          return order.orderId == orderId ? updatedOrder : order;
        }).toList();
        
        state = state.copyWith(liveOrders: updatedOrders);
      },
      failure: (error) {
        state = state.copyWith(error: error);
      },
    );
  }

  Future<void> rejectOrder(String orderId, String reason) async {
    final result = await _repository.rejectOrder(orderId, reason);
    
    result.when(
      success: (updatedOrder) {
        final updatedOrders = state.liveOrders.map((order) {
          return order.orderId == orderId ? updatedOrder : order;
        }).toList();
        
        state = state.copyWith(liveOrders: updatedOrders);
      },
      failure: (error) {
        state = state.copyWith(error: error);
      },
    );
  }

  Future<void> updateOrderStatus(String orderId, OrderStatus status) async {
    final result = await _repository.updateOrderStatus(orderId, status);
    
    result.when(
      success: (updatedOrder) {
        final updatedOrders = state.liveOrders.map((order) {
          return order.orderId == orderId ? updatedOrder : order;
        }).toList();
        
        state = state.copyWith(liveOrders: updatedOrders);
      },
      failure: (error) {
        state = state.copyWith(error: error);
      },
    );
  }

  void setOrderFilter(OrderFilter filter) {
    state = state.copyWith(orderFilter: filter);
  }

  void selectOrder(String? orderId) {
    state = state.copyWith(selectedOrderId: orderId);
  }

  // Menu Management Methods
  Future<Result<MenuCategory, String>> createMenuCategory(MenuCategory category) async {
    return await _repository.createMenuCategory(_restaurantId, category);
  }

  Future<Result<MenuCategory, String>> updateMenuCategory(MenuCategory category) async {
    return await _repository.updateMenuCategory(category);
  }

  Future<Result<void, String>> deleteMenuCategory(String categoryId) async {
    return await _repository.deleteMenuCategory(categoryId);
  }

  Future<Result<MenuItemDetails, String>> createMenuItem(String categoryId, MenuItemDetails item) async {
    return await _repository.createMenuItem(categoryId, item);
  }

  Future<Result<MenuItemDetails, String>> updateMenuItem(MenuItemDetails item) async {
    return await _repository.updateMenuItem(item);
  }

  Future<Result<void, String>> deleteMenuItem(String itemId) async {
    return await _repository.deleteMenuItem(itemId);
  }

  Future<Result<void, String>> toggleItemAvailability(String itemId, bool isAvailable) async {
    return await _repository.toggleItemAvailability(itemId, isAvailable);
  }

  Future<Result<void, String>> bulkUpdateAvailability(List<String> itemIds, bool isAvailable) async {
    return await _repository.bulkUpdateAvailability(itemIds, isAvailable);
  }

  // Image Management Methods
  Future<Result<String, String>> uploadItemImage(String itemId, File imageFile) async {
    return await _repository.uploadItemImage(itemId, imageFile);
  }

  Future<Result<String, String>> uploadCategoryImage(String categoryId, File imageFile) async {
    return await _repository.uploadCategoryImage(categoryId, imageFile);
  }

  // Wallet & Financials Methods
  Future<Result<Map<String, dynamic>, String>> getWalletBalance() async {
    return await _repository.getWalletBalance(_restaurantId);
  }

  Future<Result<List<Map<String, dynamic>>, String>> getWalletTransactions() async {
    return await _repository.getWalletTransactions(_restaurantId);
  }

  Future<Result<void, String>> requestWithdrawal(double amount, String description) async {
    return await _repository.requestWithdrawal(_restaurantId, amount, description);
  }

  List<LiveOrder> get filteredOrders {
    switch (state.orderFilter) {
      case OrderFilter.all:
        return state.liveOrders;
      case OrderFilter.pending:
        return state.liveOrders.where((order) => order.status == OrderStatus.pending).toList();
      case OrderFilter.preparing:
        return state.liveOrders.where((order) => order.status == OrderStatus.preparing).toList();
      case OrderFilter.ready:
        return state.liveOrders.where((order) => order.status == OrderStatus.ready).toList();
      case OrderFilter.completed:
        return state.liveOrders.where((order) => order.status == OrderStatus.delivered).toList();
    }
  }

  @override
  void dispose() {
    _liveOrdersSubscription?.cancel();
    super.dispose();
  }
}

final restaurantOwnerProvider = StateNotifierProvider.family<RestaurantOwnerNotifier, RestaurantOwnerState, String>(
  (ref, restaurantId) {
    final repository = ref.watch(restaurantOwnerRepositoryProvider);
    return RestaurantOwnerNotifier(repository, restaurantId);
  },
);

// Menu management provider
final menuCategoriesProvider = FutureProvider.family<List<MenuCategory>, String>((ref, restaurantId) async {
  final repository = ref.watch(restaurantOwnerRepositoryProvider);
  final result = await repository.getMenuCategories(restaurantId);
  
  return result.when(
    success: (categories) => categories,
    failure: (error) => throw Exception(error),
  );
});

// Item performance provider
final itemPerformanceProvider = FutureProvider.family<List<MenuItemPerformance>, String>((ref, restaurantId) async {
  final repository = ref.watch(restaurantOwnerRepositoryProvider);
  final result = await repository.getItemPerformance(restaurantId);
  
  return result.when(
    success: (performance) => performance,
    failure: (error) => throw Exception(error),
  );
});