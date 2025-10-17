// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

_$GuestOrderResponseImpl _$$GuestOrderResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GuestOrderResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : GuestOrderData.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$GuestOrderResponseImplToJson(
        _$GuestOrderResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'error': instance.error,
    };

_$GuestOrderDataImpl _$$GuestOrderDataImplFromJson(Map<String, dynamic> json) =>
    _$GuestOrderDataImpl(
      orderId: json['orderId'] as String,
      trackingUrl: json['trackingUrl'] as String,
      paymentUrl: json['paymentUrl'] as String?,
      estimatedDeliveryTime: json['estimatedDeliveryTime'] as String?,
      orderNumber: json['orderNumber'] as String?,
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$$GuestOrderDataImplToJson(
        _$GuestOrderDataImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'trackingUrl': instance.trackingUrl,
      'paymentUrl': instance.paymentUrl,
      'estimatedDeliveryTime': instance.estimatedDeliveryTime,
      'orderNumber': instance.orderNumber,
      'totalAmount': instance.totalAmount,
      'currency': instance.currency,
    };

_$GuestOrderTrackingImpl _$$GuestOrderTrackingImplFromJson(
        Map<String, dynamic> json) =>
    _$GuestOrderTrackingImpl(
      orderId: json['orderId'] as String,
      orderNumber: json['orderNumber'] as String,
      status: $enumDecode(_$GuestOrderStatusEnumMap, json['status']),
      restaurantName: json['restaurantName'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => GuestOrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      currency: json['currency'] as String,
      deliveryAddress: json['deliveryAddress'] as String,
      driverName: json['driverName'] as String?,
      driverPhone: json['driverPhone'] as String?,
      driverLocation: json['driverLocation'] == null
          ? null
          : GuestOrderCoordinates.fromJson(
              json['driverLocation'] as Map<String, dynamic>),
      estimatedDeliveryTime: json['estimatedDeliveryTime'] as String?,
      statusHistory: (json['statusHistory'] as List<dynamic>?)
          ?.map(
              (e) => GuestOrderStatusUpdate.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$GuestOrderTrackingImplToJson(
        _$GuestOrderTrackingImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'orderNumber': instance.orderNumber,
      'status': _$GuestOrderStatusEnumMap[instance.status]!,
      'restaurantName': instance.restaurantName,
      'items': instance.items,
      'totalAmount': instance.totalAmount,
      'currency': instance.currency,
      'deliveryAddress': instance.deliveryAddress,
      'driverName': instance.driverName,
      'driverPhone': instance.driverPhone,
      'driverLocation': instance.driverLocation,
      'estimatedDeliveryTime': instance.estimatedDeliveryTime,
      'statusHistory': instance.statusHistory,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$GuestOrderStatusEnumMap = {
  GuestOrderStatus.pending: 'pending',
  GuestOrderStatus.confirmed: 'confirmed',
  GuestOrderStatus.preparing: 'preparing',
  GuestOrderStatus.ready: 'ready',
  GuestOrderStatus.assigned: 'assigned',
  GuestOrderStatus.pickedUp: 'picked_up',
  GuestOrderStatus.onTheWay: 'on_the_way',
  GuestOrderStatus.delivered: 'delivered',
  GuestOrderStatus.cancelled: 'cancelled',
};

_$GuestOrderStatusUpdateImpl _$$GuestOrderStatusUpdateImplFromJson(
        Map<String, dynamic> json) =>
    _$GuestOrderStatusUpdateImpl(
      status: $enumDecode(_$GuestOrderStatusEnumMap, json['status']),
      timestamp: DateTime.parse(json['timestamp'] as String),
      note: json['note'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$$GuestOrderStatusUpdateImplToJson(
        _$GuestOrderStatusUpdateImpl instance) =>
    <String, dynamic>{
      'status': _$GuestOrderStatusEnumMap[instance.status]!,
      'timestamp': instance.timestamp.toIso8601String(),
      'note': instance.note,
      'location': instance.location,
    };

_$GuestUserImpl _$$GuestUserImplFromJson(Map<String, dynamic> json) =>
    _$GuestUserImpl(
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      tempId: json['tempId'] as String?,
    );

Map<String, dynamic> _$$GuestUserImplToJson(_$GuestUserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'tempId': instance.tempId,
    };
