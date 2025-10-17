import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eatfast_mobile/modules/client_module/providers/domain/models/cart.dart';
import 'package:eatfast_mobile/modules/client_module/providers/domain/user_address.dart';
import 'package:eatfast_mobile/shared/services/payment/domain/models/payment_method.dart';
import 'package:eatfast_mobile/shared/services/orders/domain/models/order_status.dart';
import 'package:eatfast_mobile/shared/models/exports.dart' as shared_models;

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String userId,
    required String restaurantId,
    required String restaurantName,
    required List<CartItem> items,
  required shared_models.OrderStatus status,
    required double subtotal,
    required double deliveryFee,
    required double tax,
    required double discount,
    required double total,
    required UserAddress deliveryAddress,
    required PaymentMethod paymentMethod,
    String? specialInstructions,
    String? driverId,
    String? driverName,
    String? driverPhone,
    DateTime? estimatedDeliveryTime,
    DateTime? actualDeliveryTime,
  @Default([]) List<OrderStatusUpdate> statusUpdates,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  const Order._();

  int get itemCount => items.fold<int>(0, (sum, item) => sum + item.quantity);
  
  bool get canBeCancelled => status == shared_models.OrderStatus.created || status == shared_models.OrderStatus.confirmed;
  
  bool get isDelivered => status == shared_models.OrderStatus.delivered;
  
  bool get isActive => [
    shared_models.OrderStatus.created,
    shared_models.OrderStatus.confirmed,
    shared_models.OrderStatus.accepted,
    shared_models.OrderStatus.preparing,
    shared_models.OrderStatus.readyForPickup,
    shared_models.OrderStatus.assignedDriver,
    shared_models.OrderStatus.pickedUp,
    shared_models.OrderStatus.inTransit,
  ].contains(status);
}

@freezed
class OrderStatusUpdate with _$OrderStatusUpdate {
  const factory OrderStatusUpdate({
    required String id,
  required shared_models.OrderStatus status,
    required DateTime timestamp,
    String? message,
    String? updatedBy,
  }) = _OrderStatusUpdate;

  factory OrderStatusUpdate.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusUpdateFromJson(json);
}
