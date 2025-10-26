import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';

part 'live_order.freezed.dart';
part 'live_order.g.dart';

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String itemId,
    required String name,
    required double price,
    required int quantity,
    String? imageUrl,
    List<String>? customizations,
    String? specialNotes,
  }) = _OrderItem;

  const OrderItem._();

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  // Computed properties for backward compatibility
  String get itemName => name;
  double get totalPrice => price * quantity;
}

@freezed
class LiveOrder with _$LiveOrder {
  const factory LiveOrder({
    required String orderId,
    required String customerName,
    required String customerPhone,
    required DateTime orderTime,
    required double totalAmount,
    required OrderStatus status,
    required int estimatedPrepTime,
    required PaymentStatus paymentStatus,
    required DeliveryType deliveryType,
    String? driverId,
    String? driverName,
    String? driverPhone,
    String? specialInstructions,
    required List<OrderItem> items,
    DateTime? acceptedAt,
    DateTime? preparedAt,
    DateTime? deliveredAt,
  }) = _LiveOrder;

  factory LiveOrder.fromJson(Map<String, dynamic> json) =>
      _$LiveOrderFromJson(json);
}