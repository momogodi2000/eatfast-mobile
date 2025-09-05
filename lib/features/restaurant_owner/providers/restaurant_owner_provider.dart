import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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