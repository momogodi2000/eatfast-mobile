import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_models.freezed.dart';
part 'guest_models.g.dart';

/// Guest order request model matching backend API
@freezed
class GuestOrderRequest with _$GuestOrderRequest {
  const factory GuestOrderRequest({
    required String restaurantId,
    required List<GuestOrderItem> items,
    required String deliveryAddress,
    required GuestOrderCoordinates deliveryCoordinates,
    required String guestName,
    required String guestPhone,
    String? guestEmail,
    @Default('cash') String paymentMethod,
    String? specialInstructions,
    DateTime? scheduledDeliveryTime,
  }) = _GuestOrderRequest;

  factory GuestOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$GuestOrderRequestFromJson(json);
}

/// Guest order item
@freezed
class GuestOrderItem with _$GuestOrderItem {
  const factory GuestOrderItem({
    required String menuId,
    required int quantity,
    String? customizations,
  }) = _GuestOrderItem;

  factory GuestOrderItem.fromJson(Map<String, dynamic> json) =>
      _$GuestOrderItemFromJson(json);
}

/// Guest order coordinates
@freezed
class GuestOrderCoordinates with _$GuestOrderCoordinates {
  const factory GuestOrderCoordinates({
    required double lat,
    required double lng,
  }) = _GuestOrderCoordinates;

  factory GuestOrderCoordinates.fromJson(Map<String, dynamic> json) =>
      _$GuestOrderCoordinatesFromJson(json);
}

/// Guest order response from backend
@freezed
class GuestOrderResponse with _$GuestOrderResponse {
  const factory GuestOrderResponse({
    required bool success,
    String? message,
    GuestOrderData? data,
    String? error,
  }) = _GuestOrderResponse;

  factory GuestOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$GuestOrderResponseFromJson(json);
}

/// Guest order data
@freezed
class GuestOrderData with _$GuestOrderData {
  const factory GuestOrderData({
    required String orderId,
    required String trackingUrl,
    String? paymentUrl,
    String? estimatedDeliveryTime,
    String? orderNumber,
    double? totalAmount,
    String? currency,
  }) = _GuestOrderData;

  factory GuestOrderData.fromJson(Map<String, dynamic> json) =>
      _$GuestOrderDataFromJson(json);
}

/// Guest order tracking model
@freezed
class GuestOrderTracking with _$GuestOrderTracking {
  const factory GuestOrderTracking({
    required String orderId,
    required String orderNumber,
    required GuestOrderStatus status,
    required String restaurantName,
    required List<GuestOrderItem> items,
    required double totalAmount,
    required String currency,
    required String deliveryAddress,
    String? driverName,
    String? driverPhone,
    GuestOrderCoordinates? driverLocation,
    String? estimatedDeliveryTime,
    List<GuestOrderStatusUpdate>? statusHistory,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _GuestOrderTracking;

  factory GuestOrderTracking.fromJson(Map<String, dynamic> json) =>
      _$GuestOrderTrackingFromJson(json);
}

/// Guest order status update
@freezed
class GuestOrderStatusUpdate with _$GuestOrderStatusUpdate {
  const factory GuestOrderStatusUpdate({
    required GuestOrderStatus status,
    required DateTime timestamp,
    String? note,
    String? location,
  }) = _GuestOrderStatusUpdate;

  factory GuestOrderStatusUpdate.fromJson(Map<String, dynamic> json) =>
      _$GuestOrderStatusUpdateFromJson(json);
}

/// Guest order status enum
enum GuestOrderStatus {
  pending,
  confirmed,
  preparing,
  ready,
  assigned,
  @JsonValue('picked_up')
  pickedUp,
  @JsonValue('on_the_way')
  onTheWay,
  delivered,
  cancelled;

  String get displayName {
    switch (this) {
      case GuestOrderStatus.pending:
        return 'En Attente';
      case GuestOrderStatus.confirmed:
        return 'Confirmée';
      case GuestOrderStatus.preparing:
        return 'En Préparation';
      case GuestOrderStatus.ready:
        return 'Prête';
      case GuestOrderStatus.assigned:
        return 'Assignée';
      case GuestOrderStatus.pickedUp:
        return 'Récupérée';
      case GuestOrderStatus.onTheWay:
        return 'En Route';
      case GuestOrderStatus.delivered:
        return 'Livrée';
      case GuestOrderStatus.cancelled:
        return 'Annulée';
    }
  }

  String get description {
    switch (this) {
      case GuestOrderStatus.pending:
        return 'Votre commande est en attente de validation';
      case GuestOrderStatus.confirmed:
        return 'Le restaurant a confirmé votre commande';
      case GuestOrderStatus.preparing:
        return 'Votre repas est en cours de préparation';
      case GuestOrderStatus.ready:
        return 'Votre commande est prête';
      case GuestOrderStatus.assigned:
        return 'Un livreur a été assigné à votre commande';
      case GuestOrderStatus.pickedUp:
        return 'Le livreur a récupéré votre commande';
      case GuestOrderStatus.onTheWay:
        return 'Votre commande est en route';
      case GuestOrderStatus.delivered:
        return 'Votre commande a été livrée';
      case GuestOrderStatus.cancelled:
        return 'Votre commande a été annulée';
    }
  }

  bool get isActive => ![GuestOrderStatus.delivered, GuestOrderStatus.cancelled].contains(this);
  
  bool get canCancel => [
    GuestOrderStatus.pending,
    GuestOrderStatus.confirmed,
  ].contains(this);
}

/// Guest user info for order
@freezed
class GuestUser with _$GuestUser {
  const factory GuestUser({
    required String name,
    required String phone,
    String? email,
    String? tempId, // Temporary ID for session management
  }) = _GuestUser;

  factory GuestUser.fromJson(Map<String, dynamic> json) =>
      _$GuestUserFromJson(json);
}

/// Payment method for guest orders
enum GuestPaymentMethod {
  cash,
  campay,
  @JsonValue('mtn_money')
  mtnMoney,
  @JsonValue('orange_money')
  orangeMoney;

  String get displayName {
    switch (this) {
      case GuestPaymentMethod.cash:
        return 'Espèces à la livraison';
      case GuestPaymentMethod.campay:
        return 'CamPay';
      case GuestPaymentMethod.mtnMoney:
        return 'MTN Mobile Money';
      case GuestPaymentMethod.orangeMoney:
        return 'Orange Money';
    }
  }

  String get iconPath {
    switch (this) {
      case GuestPaymentMethod.cash:
        return 'assets/images/cash_icon.png';
      case GuestPaymentMethod.campay:
        return 'assets/images/campay_logo.png';
      case GuestPaymentMethod.mtnMoney:
        return 'assets/images/mtn_logo.png';
      case GuestPaymentMethod.orangeMoney:
        return 'assets/images/orange_logo.png';
    }
  }
}
