import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
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
  
  bool get canBeCancelled => status == OrderStatus.created || status == OrderStatus.confirmed;
  
  bool get isDelivered => status == OrderStatus.delivered;
  
  bool get isActive => [
    OrderStatus.created,
    OrderStatus.confirmed,
    OrderStatus.accepted,
    OrderStatus.preparing,
    OrderStatus.readyForPickup,
    OrderStatus.assignedDriver,
    OrderStatus.pickedUp,
    OrderStatus.inTransit,
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
  @JsonValue('created')
  created,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('accepted')
  accepted,
  @JsonValue('rejected')
  rejected,
  @JsonValue('preparing')
  preparing,
  @JsonValue('ready_for_pickup')
  readyForPickup,
  @JsonValue('assigned_driver')
  assignedDriver,
  @JsonValue('picked_up')
  pickedUp,
  @JsonValue('in_transit')
  inTransit,
  @JsonValue('delivered')
  delivered,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('refunded')
  refunded,
  @JsonValue('expired')
  expired,
}

extension OrderStatusExtension on OrderStatus {
  String get displayName {
    switch (this) {
      case OrderStatus.created:
        return 'Créée';
      case OrderStatus.confirmed:
        return 'Confirmée';
      case OrderStatus.accepted:
        return 'Acceptée';
      case OrderStatus.rejected:
        return 'Rejetée';
      case OrderStatus.preparing:
        return 'En préparation';
      case OrderStatus.readyForPickup:
        return 'Prête pour récupération';
      case OrderStatus.assignedDriver:
        return 'Livreur assigné';
      case OrderStatus.pickedUp:
        return 'Récupérée';
      case OrderStatus.inTransit:
        return 'En route';
      case OrderStatus.delivered:
        return 'Livrée';
      case OrderStatus.completed:
        return 'Terminée';
      case OrderStatus.cancelled:
        return 'Annulée';
      case OrderStatus.refunded:
        return 'Remboursée';
      case OrderStatus.expired:
        return 'Expirée';
    }
  }

  String get description {
    switch (this) {
      case OrderStatus.created:
        return 'Votre commande a été créée';
      case OrderStatus.confirmed:
        return 'Le restaurant a confirmé votre commande';
      case OrderStatus.accepted:
        return 'Le restaurant a accepté votre commande';
      case OrderStatus.rejected:
        return 'Le restaurant a rejeté votre commande';
      case OrderStatus.preparing:
        return 'Votre commande est en cours de préparation';
      case OrderStatus.readyForPickup:
        return 'Votre commande est prête pour la livraison';
      case OrderStatus.assignedDriver:
        return 'Un livreur a été assigné à votre commande';
      case OrderStatus.pickedUp:
        return 'Le livreur a récupéré votre commande';
      case OrderStatus.inTransit:
        return 'Votre commande est en route';
      case OrderStatus.delivered:
        return 'Votre commande a été livrée';
      case OrderStatus.completed:
        return 'Votre commande est terminée';
      case OrderStatus.cancelled:
        return 'Votre commande a été annulée';
      case OrderStatus.refunded:
        return 'Votre commande a été remboursée';
      case OrderStatus.expired:
        return 'Votre commande a expiré';
    }
  }
}