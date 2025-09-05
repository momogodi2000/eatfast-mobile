// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
      deliveryAddress: json['deliveryAddress'] as String,
      specialInstructions: json['specialInstructions'] as String,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      driverId: json['driverId'] as String?,
      driverName: json['driverName'] as String?,
      driverPhone: json['driverPhone'] as String?,
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
      'deliveryAddress': instance.deliveryAddress,
      'specialInstructions': instance.specialInstructions,
      'items': instance.items,
      'driverId': instance.driverId,
      'driverName': instance.driverName,
      'driverPhone': instance.driverPhone,
      'acceptedAt': instance.acceptedAt?.toIso8601String(),
      'preparedAt': instance.preparedAt?.toIso8601String(),
      'deliveredAt': instance.deliveredAt?.toIso8601String(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.accepted: 'accepted',
  OrderStatus.preparing: 'preparing',
  OrderStatus.ready: 'ready',
  OrderStatus.pickedUp: 'picked_up',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
  OrderStatus.rejected: 'rejected',
};

const _$PaymentStatusEnumMap = {
  PaymentStatus.pending: 'pending',
  PaymentStatus.paid: 'paid',
  PaymentStatus.failed: 'failed',
  PaymentStatus.refunded: 'refunded',
};

const _$DeliveryTypeEnumMap = {
  DeliveryType.delivery: 'delivery',
  DeliveryType.pickup: 'pickup',
  DeliveryType.dineIn: 'dine_in',
};

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      itemId: json['itemId'] as String,
      itemName: json['itemName'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      customizations: (json['customizations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      specialNotes: json['specialNotes'] as String?,
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
      'customizations': instance.customizations,
      'specialNotes': instance.specialNotes,
    };
