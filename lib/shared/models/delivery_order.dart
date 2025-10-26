import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_order.freezed.dart';
part 'delivery_order.g.dart';

@freezed
class DeliveryOrder with _$DeliveryOrder {
  const factory DeliveryOrder({
    required String orderId,
    required String restaurantId,
    required String restaurantName,
    required String restaurantAddress,
    required double restaurantLatitude,
    required double restaurantLongitude,
    required String customerName,
    required String customerPhone,
    required String deliveryAddress,
    required double deliveryLatitude,
    required double deliveryLongitude,
    required DateTime orderTime,
    required DateTime expectedDeliveryTime,
    required double orderValue,
    required double deliveryFee,
    required DeliveryStatus status,
    required PaymentMethod paymentMethod,
    required bool isPaid,
    String? specialInstructions,
    String? customerNotes,
    double? distanceKm,
    int? estimatedDuration,
    DateTime? pickedUpAt,
    DateTime? deliveredAt,
    String? deliveryProofImageUrl,
    String? customerSignatureUrl,
    String? otpCode,
    @Default([]) List<OrderItem> items,
  }) = _DeliveryOrder;

  factory DeliveryOrder.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOrderFromJson(json);
}

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String itemName,
    required int quantity,
    required double price,
    @Default([]) List<String> customizations,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

enum DeliveryStatus {
  @JsonValue('assigned')
  assigned,
  @JsonValue('accepted')
  accepted,
  @JsonValue('picking_up')
  pickingUp,
  @JsonValue('picked_up')
  pickedUp,
  @JsonValue('delivering')
  delivering,
  @JsonValue('delivered')
  delivered,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('failed')
  failed,
}

enum PaymentMethod {
  @JsonValue('cash')
  cash,
  @JsonValue('mobile_money')
  mobileMoney,
  @JsonValue('card')
  card,
  @JsonValue('wallet')
  wallet,
}

extension DeliveryStatusExtension on DeliveryStatus {
  String get displayName {
    switch (this) {
      case DeliveryStatus.assigned:
        return 'Assigné';
      case DeliveryStatus.accepted:
        return 'Accepté';
      case DeliveryStatus.pickingUp:
        return 'En route vers restaurant';
      case DeliveryStatus.pickedUp:
        return 'Récupéré';
      case DeliveryStatus.delivering:
        return 'En livraison';
      case DeliveryStatus.delivered:
        return 'Livré';
      case DeliveryStatus.cancelled:
        return 'Annulé';
      case DeliveryStatus.failed:
        return 'Échec';
    }
  }

  bool get isActive {
    return this != DeliveryStatus.delivered && 
           this != DeliveryStatus.cancelled && 
           this != DeliveryStatus.failed;
  }

  bool get requiresAction {
    return this == DeliveryStatus.assigned || 
           this == DeliveryStatus.pickingUp ||
           this == DeliveryStatus.delivering;
  }
}

extension PaymentMethodExtension on PaymentMethod {
  String get displayName {
    switch (this) {
      case PaymentMethod.cash:
        return 'Espèces';
      case PaymentMethod.mobileMoney:
        return 'Mobile Money';
      case PaymentMethod.card:
        return 'Carte';
      case PaymentMethod.wallet:
        return 'Portefeuille';
    }
  }

  bool get requiresCashCollection {
    return this == PaymentMethod.cash;
  }
}