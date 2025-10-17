// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      restaurantId: json['restaurantId'] as String,
      restaurantName: json['restaurantName'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      subtotal: (json['subtotal'] as num).toDouble(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      tax: (json['tax'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      deliveryAddress:
          UserAddress.fromJson(json['deliveryAddress'] as Map<String, dynamic>),
      paymentMethod:
          PaymentMethod.fromJson(json['paymentMethod'] as Map<String, dynamic>),
      specialInstructions: json['specialInstructions'] as String?,
      driverId: json['driverId'] as String?,
      driverName: json['driverName'] as String?,
      driverPhone: json['driverPhone'] as String?,
      estimatedDeliveryTime: json['estimatedDeliveryTime'] == null
          ? null
          : DateTime.parse(json['estimatedDeliveryTime'] as String),
      actualDeliveryTime: json['actualDeliveryTime'] == null
          ? null
          : DateTime.parse(json['actualDeliveryTime'] as String),
      statusUpdates: (json['statusUpdates'] as List<dynamic>?)
              ?.map(
                  (e) => OrderStatusUpdate.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'restaurantId': instance.restaurantId,
      'restaurantName': instance.restaurantName,
      'items': instance.items,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'subtotal': instance.subtotal,
      'deliveryFee': instance.deliveryFee,
      'tax': instance.tax,
      'discount': instance.discount,
      'total': instance.total,
      'deliveryAddress': instance.deliveryAddress,
      'paymentMethod': instance.paymentMethod,
      'specialInstructions': instance.specialInstructions,
      'driverId': instance.driverId,
      'driverName': instance.driverName,
      'driverPhone': instance.driverPhone,
      'estimatedDeliveryTime':
          instance.estimatedDeliveryTime?.toIso8601String(),
      'actualDeliveryTime': instance.actualDeliveryTime?.toIso8601String(),
      'statusUpdates': instance.statusUpdates,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.created: 'created',
  OrderStatus.pending: 'pending',
  OrderStatus.accepted: 'accepted',
  OrderStatus.confirmed: 'confirmed',
  OrderStatus.preparing: 'preparing',
  OrderStatus.ready: 'ready',
  OrderStatus.readyForPickup: 'readyForPickup',
  OrderStatus.assignedDriver: 'assignedDriver',
  OrderStatus.pickedUp: 'pickedUp',
  OrderStatus.onTheWay: 'onTheWay',
  OrderStatus.inTransit: 'inTransit',
  OrderStatus.delivered: 'delivered',
  OrderStatus.completed: 'completed',
  OrderStatus.cancelled: 'cancelled',
  OrderStatus.rejected: 'rejected',
  OrderStatus.refunded: 'refunded',
  OrderStatus.expired: 'expired',
};

_$OrderStatusUpdateImpl _$$OrderStatusUpdateImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderStatusUpdateImpl(
      id: json['id'] as String,
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      timestamp: DateTime.parse(json['timestamp'] as String),
      message: json['message'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );

Map<String, dynamic> _$$OrderStatusUpdateImplToJson(
        _$OrderStatusUpdateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'timestamp': instance.timestamp.toIso8601String(),
      'message': instance.message,
      'updatedBy': instance.updatedBy,
    };
