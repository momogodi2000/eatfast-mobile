// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      itemId: json['itemId'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      imageUrl: json['imageUrl'] as String?,
      customizations: (json['customizations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      specialNotes: json['specialNotes'] as String?,
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'name': instance.name,
      'price': instance.price,
      'quantity': instance.quantity,
      'imageUrl': instance.imageUrl,
      'customizations': instance.customizations,
      'specialNotes': instance.specialNotes,
    };

_$LiveOrderImpl _$$LiveOrderImplFromJson(Map<String, dynamic> json) =>
    _$LiveOrderImpl(
      orderId: json['orderId'] as String,
      customerName: json['customerName'] as String,
      customerPhone: json['customerPhone'] as String,
      orderTime: DateTime.parse(json['orderTime'] as String),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      estimatedPrepTime: (json['estimatedPrepTime'] as num).toInt(),
      paymentStatus: $enumDecode(_$PaymentStatusEnumMap, json['paymentStatus']),
      deliveryType: $enumDecode(_$DeliveryTypeEnumMap, json['deliveryType']),
      driverId: json['driverId'] as String?,
      driverName: json['driverName'] as String?,
      driverPhone: json['driverPhone'] as String?,
      specialInstructions: json['specialInstructions'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      acceptedAt: json['acceptedAt'] == null
          ? null
          : DateTime.parse(json['acceptedAt'] as String),
      preparedAt: json['preparedAt'] == null
          ? null
          : DateTime.parse(json['preparedAt'] as String),
      deliveredAt: json['deliveredAt'] == null
          ? null
          : DateTime.parse(json['deliveredAt'] as String),
    );

Map<String, dynamic> _$$LiveOrderImplToJson(_$LiveOrderImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'customerName': instance.customerName,
      'customerPhone': instance.customerPhone,
      'orderTime': instance.orderTime.toIso8601String(),
      'totalAmount': instance.totalAmount,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'estimatedPrepTime': instance.estimatedPrepTime,
      'paymentStatus': _$PaymentStatusEnumMap[instance.paymentStatus]!,
      'deliveryType': _$DeliveryTypeEnumMap[instance.deliveryType]!,
      'driverId': instance.driverId,
      'driverName': instance.driverName,
      'driverPhone': instance.driverPhone,
      'specialInstructions': instance.specialInstructions,
      'items': instance.items,
      'acceptedAt': instance.acceptedAt?.toIso8601String(),
      'preparedAt': instance.preparedAt?.toIso8601String(),
      'deliveredAt': instance.deliveredAt?.toIso8601String(),
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

const _$PaymentStatusEnumMap = {
  PaymentStatus.pending: 'pending',
  PaymentStatus.paid: 'paid',
  PaymentStatus.failed: 'failed',
  PaymentStatus.refunded: 'refunded',
};

const _$DeliveryTypeEnumMap = {
  DeliveryType.pickup: 'pickup',
  DeliveryType.delivery: 'delivery',
  DeliveryType.dineIn: 'dineIn',
};
