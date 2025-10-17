import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eatfast_mobile/shared/models/exports.dart';

part 'live_order.freezed.dart';
part 'live_order.g.dart';

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
    required String deliveryAddress,
    required String specialInstructions,
    @Default([]) List<OrderItem> items,
    String? driverId,
    String? driverName,
    String? driverPhone,
    DateTime? acceptedAt,
    DateTime? preparedAt,
    DateTime? deliveredAt,
  }) = _LiveOrder;

  factory LiveOrder.fromJson(Map<String, dynamic> json) =>
      _$LiveOrderFromJson(json);
}

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String itemId,
    required String itemName,
    required int quantity,
    required double unitPrice,
    required double totalPrice,
    @Default([]) List<String> customizations,
    String? specialNotes,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

enum PaymentStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('paid')
  paid,
  @JsonValue('failed')
  failed,
  @JsonValue('refunded')
  refunded,
}

enum DeliveryType {
  @JsonValue('delivery')
  delivery,
  @JsonValue('pickup')
  pickup,
  @JsonValue('dine_in')
  dineIn,
}
