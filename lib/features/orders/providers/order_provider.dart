import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/result.dart';
import '../data/order_repository_impl.dart';
import '../domain/models/order.dart';
import '../domain/repositories/order_repository.dart';
import '../../cart/domain/models/cart.dart';
import '../../profile/domain/models.dart';

// Repository provider
final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  return OrderRepositoryImpl();
});

// Orders list provider
final ordersProvider = StateNotifierProvider<OrdersNotifier, OrdersState>((ref) {
  return OrdersNotifier(ref.watch(orderRepositoryProvider));
});

// Active order provider (currently being tracked)
final activeOrderProvider = StateNotifierProvider<ActiveOrderNotifier, ActiveOrderState>((ref) {
  return ActiveOrderNotifier(ref.watch(orderRepositoryProvider));
});

// Order detail provider
final orderDetailProvider = FutureProvider.family<Order?, String>((ref, orderId) async {
  final repository = ref.watch(orderRepositoryProvider);
  final result = await repository.getOrderById(orderId);
  
  return result.when(
    success: (order) => order,
    failure: (_) => null,
  );
});

class OrdersNotifier extends StateNotifier<OrdersState> {
  final OrderRepository _repository;

  OrdersNotifier(this._repository) : super(const OrdersState.initial()) {
    loadOrders();
  }

  Future<void> loadOrders({bool refresh = false}) async {
    if (!refresh && state is OrdersLoading) return;

    state = const OrdersState.loading();

    final result = await _repository.getOrders();

    state = result.when(
      success: (orders) => OrdersState.loaded(orders),
      failure: (error) => OrdersState.error(error),
    );
  }

  Future<void> loadMoreOrders() async {
    if (state is! OrdersLoaded) return;

    final currentState = state as OrdersLoaded;
    final currentPage = (currentState.orders.length / 20).ceil() + 1;

    final result = await _repository.getOrders(page: currentPage);

    result.when(
      success: (newOrders) {
        if (newOrders.isNotEmpty) {
          state = OrdersState.loaded([
            ...currentState.orders,
            ...newOrders,
          ]);
        }
      },
      failure: (_) {
        // Keep current state on error
      },
    );
  }

  Future<void> cancelOrder(String orderId) async {
    final result = await _repository.cancelOrder(orderId);
    
    result.when(
      success: (_) {
        // Reload orders to reflect changes
        loadOrders(refresh: true);
      },
      failure: (error) {
        state = OrdersState.error(error);
      },
    );
  }

  Future<void> reorderOrder(String orderId) async {
    final result = await _repository.reorderOrder(orderId);
    
    result.when(
      success: (newOrder) {
        // Reload orders to show the new order
        loadOrders(refresh: true);
      },
      failure: (error) {
        state = OrdersState.error(error);
      },
    );
  }
}

class ActiveOrderNotifier extends StateNotifier<ActiveOrderState> {
  final OrderRepository _repository;

  ActiveOrderNotifier(this._repository) : super(const ActiveOrderState.initial());

  Future<void> placeOrder({
    required Cart cart,
    required UserAddress deliveryAddress,
    required PaymentMethod paymentMethod,
    String? specialInstructions,
  }) async {
    state = const ActiveOrderState.placing();

    final result = await _repository.placeOrder(
      cart: cart,
      deliveryAddress: deliveryAddress,
      paymentMethod: paymentMethod,
      specialInstructions: specialInstructions,
    );

    state = result.when(
      success: (order) => ActiveOrderState.tracking(order),
      failure: (error) => ActiveOrderState.error(error),
    );
  }

  Future<void> trackOrder(String orderId) async {
    state = const ActiveOrderState.loading();

    final result = await _repository.getOrderById(orderId);

    state = result.when(
      success: (order) => ActiveOrderState.tracking(order),
      failure: (error) => ActiveOrderState.error(error),
    );
  }

  Future<void> refreshOrderStatus(String orderId) async {
    if (state is! ActiveOrderTracking) return;

    final result = await _repository.getOrderById(orderId);

    result.when(
      success: (order) {
        state = ActiveOrderState.tracking(order);
      },
      failure: (_) {
        // Keep current state on error
      },
    );
  }

  void clearActiveOrder() {
    state = const ActiveOrderState.initial();
  }
}

// Order states
abstract class OrdersState {
  const OrdersState();

  const factory OrdersState.initial() = OrdersInitial;
  const factory OrdersState.loading() = OrdersLoading;
  const factory OrdersState.loaded(List<Order> orders) = OrdersLoaded;
  const factory OrdersState.error(String message) = OrdersError;
}

class OrdersInitial extends OrdersState {
  const OrdersInitial();
}

class OrdersLoading extends OrdersState {
  const OrdersLoading();
}

class OrdersLoaded extends OrdersState {
  final List<Order> orders;
  const OrdersLoaded(this.orders);
}

class OrdersError extends OrdersState {
  final String message;
  const OrdersError(this.message);
}

abstract class ActiveOrderState {
  const ActiveOrderState();

  const factory ActiveOrderState.initial() = ActiveOrderInitial;
  const factory ActiveOrderState.loading() = ActiveOrderLoading;
  const factory ActiveOrderState.placing() = ActiveOrderPlacing;
  const factory ActiveOrderState.tracking(Order order) = ActiveOrderTracking;
  const factory ActiveOrderState.error(String message) = ActiveOrderError;
}

class ActiveOrderInitial extends ActiveOrderState {
  const ActiveOrderInitial();
}

class ActiveOrderLoading extends ActiveOrderState {
  const ActiveOrderLoading();
}

class ActiveOrderPlacing extends ActiveOrderState {
  const ActiveOrderPlacing();
}

class ActiveOrderTracking extends ActiveOrderState {
  final Order order;
  const ActiveOrderTracking(this.order);
}

class ActiveOrderError extends ActiveOrderState {
  final String message;
  const ActiveOrderError(this.message);
}

// Convenience providers
final hasActiveOrderProvider = Provider<bool>((ref) {
  final activeOrderState = ref.watch(activeOrderProvider);
  return activeOrderState is ActiveOrderTracking;
});

final orderCountProvider = Provider<int>((ref) {
  final ordersState = ref.watch(ordersProvider);
  return switch (ordersState) {
    OrdersLoaded(:final orders) => orders.length,
    _ => 0,
  };
});