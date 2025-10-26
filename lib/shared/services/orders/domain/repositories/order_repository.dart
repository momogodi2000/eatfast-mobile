import 'package:eatfast_mobile/shared/models/exports.dart';

abstract class OrderRepository {
  /// Place a new order
  Future<Result<Order, String>> placeOrder({
    required Cart cart,
    required UserAddress deliveryAddress,
    required PaymentMethod paymentMethod,
    String? specialInstructions,
  });

  /// Get all orders for the current user
  Future<Result<List<Order>, String>> getOrders({
    int page = 1,
    int limit = 20,
    OrderStatus? status,
  });

  /// Get a specific order by ID
  Future<Result<Order, String>> getOrderById(String orderId);

  /// Cancel an order
  Future<Result<void, String>> cancelOrder(String orderId);

  /// Reorder a previous order
  Future<Result<Order, String>> reorderOrder(String orderId);

  /// Update order status (for restaurant/driver use)
  Future<Result<Order, String>> updateOrderStatus(
    String orderId,
    OrderStatus status, {
    String? message,
  });

  /// Rate an order
  Future<Result<void, String>> rateOrder(
    String orderId,
    double rating, {
    String? review,
  });
}
