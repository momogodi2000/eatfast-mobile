// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationInfoImpl _$$PaginationInfoImplFromJson(Map<String, dynamic> json) =>
    _$PaginationInfoImpl(
      currentPage: (json['currentPage'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
      itemsPerPage: (json['itemsPerPage'] as num).toInt(),
      hasNextPage: json['hasNextPage'] as bool,
      hasPreviousPage: json['hasPreviousPage'] as bool,
    );

Map<String, dynamic> _$$PaginationInfoImplToJson(
        _$PaginationInfoImpl instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
      'itemsPerPage': instance.itemsPerPage,
      'hasNextPage': instance.hasNextPage,
      'hasPreviousPage': instance.hasPreviousPage,
    };

_$GuestOrderResponseImpl _$$GuestOrderResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GuestOrderResponseImpl(
      orderId: json['orderId'] as String,
      trackingUrl: json['trackingUrl'] as String,
      paymentUrl: json['paymentUrl'] as String?,
      estimatedDeliveryTime: json['estimatedDeliveryTime'] as String?,
      success: json['success'] as bool,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$GuestOrderResponseImplToJson(
        _$GuestOrderResponseImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'trackingUrl': instance.trackingUrl,
      'paymentUrl': instance.paymentUrl,
      'estimatedDeliveryTime': instance.estimatedDeliveryTime,
      'success': instance.success,
      'error': instance.error,
    };

_$GuestOrderRequestImpl _$$GuestOrderRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$GuestOrderRequestImpl(
      restaurantId: json['restaurantId'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => GuestOrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryAddress: json['deliveryAddress'] as String,
      deliveryCoordinates: GuestOrderCoordinates.fromJson(
          json['deliveryCoordinates'] as Map<String, dynamic>),
      guestName: json['guestName'] as String,
      guestPhone: json['guestPhone'] as String,
      guestEmail: json['guestEmail'] as String?,
      paymentMethod: json['paymentMethod'] as String? ?? 'cash',
      specialInstructions: json['specialInstructions'] as String?,
      scheduledDeliveryTime: json['scheduledDeliveryTime'] == null
          ? null
          : DateTime.parse(json['scheduledDeliveryTime'] as String),
    );

Map<String, dynamic> _$$GuestOrderRequestImplToJson(
        _$GuestOrderRequestImpl instance) =>
    <String, dynamic>{
      'restaurantId': instance.restaurantId,
      'items': instance.items,
      'deliveryAddress': instance.deliveryAddress,
      'deliveryCoordinates': instance.deliveryCoordinates,
      'guestName': instance.guestName,
      'guestPhone': instance.guestPhone,
      'guestEmail': instance.guestEmail,
      'paymentMethod': instance.paymentMethod,
      'specialInstructions': instance.specialInstructions,
      'scheduledDeliveryTime':
          instance.scheduledDeliveryTime?.toIso8601String(),
    };

_$GuestOrderItemImpl _$$GuestOrderItemImplFromJson(Map<String, dynamic> json) =>
    _$GuestOrderItemImpl(
      menuId: json['menuId'] as String,
      quantity: (json['quantity'] as num).toInt(),
      customizations: json['customizations'] as String?,
    );

Map<String, dynamic> _$$GuestOrderItemImplToJson(
        _$GuestOrderItemImpl instance) =>
    <String, dynamic>{
      'menuId': instance.menuId,
      'quantity': instance.quantity,
      'customizations': instance.customizations,
    };

_$GuestOrderCoordinatesImpl _$$GuestOrderCoordinatesImplFromJson(
        Map<String, dynamic> json) =>
    _$GuestOrderCoordinatesImpl(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$GuestOrderCoordinatesImplToJson(
        _$GuestOrderCoordinatesImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$WalletResponseImpl _$$WalletResponseImplFromJson(Map<String, dynamic> json) =>
    _$WalletResponseImpl(
      balance: (json['balance'] as num).toDouble(),
      currency: json['currency'] as String,
      recentTransactions: (json['recentTransactions'] as List<dynamic>)
          .map((e) => WalletTransaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$WalletResponseImplToJson(
        _$WalletResponseImpl instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'currency': instance.currency,
      'recentTransactions': instance.recentTransactions,
      'success': instance.success,
      'error': instance.error,
    };

_$WalletTransactionImpl _$$WalletTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletTransactionImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      reference: json['reference'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$WalletTransactionImplToJson(
        _$WalletTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'amount': instance.amount,
      'currency': instance.currency,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'reference': instance.reference,
      'status': instance.status,
    };

_$LoyaltyResponseImpl _$$LoyaltyResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LoyaltyResponseImpl(
      points: (json['points'] as num).toInt(),
      tier: json['tier'] as String,
      availableRewards: (json['availableRewards'] as List<dynamic>)
          .map((e) => LoyaltyReward.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalEarned: (json['totalEarned'] as num).toInt(),
      totalRedeemed: (json['totalRedeemed'] as num).toInt(),
      success: json['success'] as bool,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$LoyaltyResponseImplToJson(
        _$LoyaltyResponseImpl instance) =>
    <String, dynamic>{
      'points': instance.points,
      'tier': instance.tier,
      'availableRewards': instance.availableRewards,
      'totalEarned': instance.totalEarned,
      'totalRedeemed': instance.totalRedeemed,
      'success': instance.success,
      'error': instance.error,
    };

_$LoyaltyRewardImpl _$$LoyaltyRewardImplFromJson(Map<String, dynamic> json) =>
    _$LoyaltyRewardImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      pointsCost: (json['pointsCost'] as num).toInt(),
      type: json['type'] as String,
      imageUrl: json['imageUrl'] as String?,
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      isAvailable: json['isAvailable'] as bool,
    );

Map<String, dynamic> _$$LoyaltyRewardImplToJson(_$LoyaltyRewardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'pointsCost': instance.pointsCost,
      'type': instance.type,
      'imageUrl': instance.imageUrl,
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'isAvailable': instance.isAvailable,
    };

_$OrderTrackingResponseImpl _$$OrderTrackingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderTrackingResponseImpl(
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      driverLocation: json['driverLocation'] == null
          ? null
          : DriverLocation.fromJson(
              json['driverLocation'] as Map<String, dynamic>),
      statusHistory: (json['statusHistory'] as List<dynamic>)
          .map((e) => OrderStatusHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      estimatedArrival: json['estimatedArrival'] as String?,
      success: json['success'] as bool,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$OrderTrackingResponseImplToJson(
        _$OrderTrackingResponseImpl instance) =>
    <String, dynamic>{
      'order': instance.order,
      'driverLocation': instance.driverLocation,
      'statusHistory': instance.statusHistory,
      'estimatedArrival': instance.estimatedArrival,
      'success': instance.success,
      'error': instance.error,
    };

_$DriverLocationImpl _$$DriverLocationImplFromJson(Map<String, dynamic> json) =>
    _$DriverLocationImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      accuracy: (json['accuracy'] as num?)?.toDouble(),
      bearing: (json['bearing'] as num?)?.toDouble(),
      speed: (json['speed'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DriverLocationImplToJson(
        _$DriverLocationImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timestamp': instance.timestamp.toIso8601String(),
      'accuracy': instance.accuracy,
      'bearing': instance.bearing,
      'speed': instance.speed,
    };

_$OrderStatusHistoryImpl _$$OrderStatusHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderStatusHistoryImpl(
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      timestamp: DateTime.parse(json['timestamp'] as String),
      note: json['note'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );

Map<String, dynamic> _$$OrderStatusHistoryImplToJson(
        _$OrderStatusHistoryImpl instance) =>
    <String, dynamic>{
      'status': _$OrderStatusEnumMap[instance.status]!,
      'timestamp': instance.timestamp.toIso8601String(),
      'note': instance.note,
      'updatedBy': instance.updatedBy,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.created: 'created',
  OrderStatus.confirmed: 'confirmed',
  OrderStatus.accepted: 'accepted',
  OrderStatus.rejected: 'rejected',
  OrderStatus.preparing: 'preparing',
  OrderStatus.readyForPickup: 'ready_for_pickup',
  OrderStatus.assignedDriver: 'assigned_driver',
  OrderStatus.pickedUp: 'picked_up',
  OrderStatus.inTransit: 'in_transit',
  OrderStatus.delivered: 'delivered',
  OrderStatus.completed: 'completed',
  OrderStatus.cancelled: 'cancelled',
  OrderStatus.refunded: 'refunded',
  OrderStatus.expired: 'expired',
};

_$ReviewResponseImpl _$$ReviewResponseImplFromJson(Map<String, dynamic> json) =>
    _$ReviewResponseImpl(
      id: json['id'] as String,
      message: json['message'] as String,
      success: json['success'] as bool,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$ReviewResponseImplToJson(
        _$ReviewResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'success': instance.success,
      'error': instance.error,
    };

_$ReviewRequestImpl _$$ReviewRequestImplFromJson(Map<String, dynamic> json) =>
    _$ReviewRequestImpl(
      orderId: json['orderId'] as String,
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ReviewRequestImplToJson(_$ReviewRequestImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'rating': instance.rating,
      'comment': instance.comment,
      'tags': instance.tags,
    };

_$OrderStatusUpdateImpl _$$OrderStatusUpdateImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderStatusUpdateImpl(
      orderId: json['orderId'] as String,
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      timestamp: DateTime.parse(json['timestamp'] as String),
      message: json['message'] as String?,
      updatedBy: json['updatedBy'] as String?,
      driverLocation: json['driverLocation'] == null
          ? null
          : DriverLocation.fromJson(
              json['driverLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderStatusUpdateImplToJson(
        _$OrderStatusUpdateImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'timestamp': instance.timestamp.toIso8601String(),
      'message': instance.message,
      'updatedBy': instance.updatedBy,
      'driverLocation': instance.driverLocation,
    };
