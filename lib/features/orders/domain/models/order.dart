import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../cart/domain/models/cart.dart';
import '../../../profile/domain/models.dart';
import '../../../profile/domain/user_address.dart';

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
    required OrderStatus status,
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

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);
  
  bool get canBeCancelled => status == OrderStatus.pending || status == OrderStatus.confirmed;
  
  bool get isDelivered => status == OrderStatus.delivered;
  
  bool get isActive => [
    OrderStatus.pending,
    OrderStatus.confirmed,
    OrderStatus.preparing,
    OrderStatus.ready,
    OrderStatus.pickedUp,
    OrderStatus.onTheWay,
  ].contains(status);
}

@freezed
class OrderStatusUpdate with _$OrderStatusUpdate {
  const factory OrderStatusUpdate({
    required String id,
    required OrderStatus status,
    required DateTime timestamp,
    String? message,
    String? updatedBy,
  }) = _OrderStatusUpdate;

  factory OrderStatusUpdate.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusUpdateFromJson(json);
}

enum OrderStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('preparing')
  preparing,
  @JsonValue('ready')
  ready,
  @JsonValue('picked_up')
  pickedUp,
  @JsonValue('on_the_way')
  onTheWay,
  @JsonValue('delivered')
  delivered,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('refunded')
  refunded,
}

extension OrderStatusExtension on OrderStatus {
  String get displayName {
    switch (this) {
      case OrderStatus.pending:
        return 'En attente';
      case OrderStatus.confirmed:
        return 'Confirmée';
      case OrderStatus.preparing:
        return 'En préparation';
      case OrderStatus.ready:
        return 'Prête';
      case OrderStatus.pickedUp:
        return 'Récupérée';
      case OrderStatus.onTheWay:
        return 'En route';
      case OrderStatus.delivered:
        return 'Livrée';
      case OrderStatus.cancelled:
        return 'Annulée';
      case OrderStatus.refunded:
        return 'Remboursée';
    }
  }

  String get description {
    switch (this) {
      case OrderStatus.pending:
        return 'Votre commande est en attente de confirmation';
      case OrderStatus.confirmed:
        return 'Le restaurant a confirmé votre commande';
      case OrderStatus.preparing:
        return 'Votre commande est en cours de préparation';
      case OrderStatus.ready:
        return 'Votre commande est prête pour la livraison';
      case OrderStatus.pickedUp:
        return 'Le livreur a récupéré votre commande';
      case OrderStatus.onTheWay:
        return 'Votre commande est en route';
      case OrderStatus.delivered:
        return 'Votre commande a été livrée';
      case OrderStatus.cancelled:
        return 'Votre commande a été annulée';
      case OrderStatus.refunded:
        return 'Votre commande a été remboursée';
    }
  }
}