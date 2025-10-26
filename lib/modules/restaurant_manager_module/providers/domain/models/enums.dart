// ignore_for_file: constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

// Export shared OrderStatus instead of defining our own
export 'package:eatfast_mobile/shared/services/orders/domain/models/order_status.dart';

@JsonEnum()
enum PaymentStatus {
  pending,
  paid,
  failed,
  refunded,
}

@JsonEnum()
enum DeliveryType {
  pickup,
  delivery,
  dineIn,
}