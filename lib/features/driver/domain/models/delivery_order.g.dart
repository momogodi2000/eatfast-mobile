// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryOrderImpl _$$DeliveryOrderImplFromJson(Map<String, dynamic> json) =>
    _$DeliveryOrderImpl(
      orderId: json['orderId'] as String,
      restaurantId: json['restaurantId'] as String,
      restaurantName: json['restaurantName'] as String,
      restaurantAddress: json['restaurantAddress'] as String,
      restaurantLatitude: (json['restaurantLatitude'] as num).toDouble(),
      restaurantLongitude: (json['restaurantLongitude'] as num).toDouble(),
      customerName: json['customerName'] as String,
      customerPhone: json['customerPhone'] as String,
      deliveryAddress: json['deliveryAddress'] as String,
      deliveryLatitude: (json['deliveryLatitude'] as num).toDouble(),
      deliveryLongitude: (json['deliveryLongitude'] as num).toDouble(),
      orderTime: DateTime.parse(json['orderTime'] as String),
      expectedDeliveryTime:
          DateTime.parse(json['expectedDeliveryTime'] as String),
      orderValue: (json['orderValue'] as num).toDouble(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      status: $enumDecode(_$DeliveryStatusEnumMap, json['status']),
      paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['paymentMethod']),
      isPaid: json['isPaid'] as bool,
      specialInstructions: json['specialInstructions'] as String?,
      customerNotes: json['customerNotes'] as String?,
      distanceKm: (json['distanceKm'] as num?)?.toDouble(),
      estimatedDuration: (json['estimatedDuration'] as num?)?.toInt(),
      pickedUpAt: json['pickedUpAt'] == null
          ? null
          : DateTime.parse(json['pickedUpAt'] as String),
      deliveredAt: json['deliveredAt'] == null
          ? null
          : DateTime.parse(json['deliveredAt'] as String),
      deliveryProofImageUrl: json['deliveryProofImageUrl'] as String?,
      customerSignatureUrl: json['customerSignatureUrl'] as String?,
      otpCode: json['otpCode'] as String?,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DeliveryOrderImplToJson(_$DeliveryOrderImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'restaurantId': instance.restaurantId,
      'restaurantName': instance.restaurantName,
      'restaurantAddress': instance.restaurantAddress,
      'restaurantLatitude': instance.restaurantLatitude,
      'restaurantLongitude': instance.restaurantLongitude,
      'customerName': instance.customerName,
      'customerPhone': instance.customerPhone,
      'deliveryAddress': instance.deliveryAddress,
      'deliveryLatitude': instance.deliveryLatitude,
      'deliveryLongitude': instance.deliveryLongitude,
      'orderTime': instance.orderTime.toIso8601String(),
      'expectedDeliveryTime': instance.expectedDeliveryTime.toIso8601String(),
      'orderValue': instance.orderValue,
      'deliveryFee': instance.deliveryFee,
      'status': _$DeliveryStatusEnumMap[instance.status]!,
      'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
      'isPaid': instance.isPaid,
      'specialInstructions': instance.specialInstructions,
      'customerNotes': instance.customerNotes,
      'distanceKm': instance.distanceKm,
      'estimatedDuration': instance.estimatedDuration,
      'pickedUpAt': instance.pickedUpAt?.toIso8601String(),
      'deliveredAt': instance.deliveredAt?.toIso8601String(),
      'deliveryProofImageUrl': instance.deliveryProofImageUrl,
      'customerSignatureUrl': instance.customerSignatureUrl,
      'otpCode': instance.otpCode,
      'items': instance.items,
    };

const _$DeliveryStatusEnumMap = {
  DeliveryStatus.assigned: 'assigned',
  DeliveryStatus.accepted: 'accepted',
  DeliveryStatus.pickingUp: 'picking_up',
  DeliveryStatus.pickedUp: 'picked_up',
  DeliveryStatus.delivering: 'delivering',
  DeliveryStatus.delivered: 'delivered',
  DeliveryStatus.cancelled: 'cancelled',
  DeliveryStatus.failed: 'failed',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.mobileMoney: 'mobile_money',
  PaymentMethod.card: 'card',
  PaymentMethod.wallet: 'wallet',
};

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      itemName: json['itemName'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      customizations: (json['customizations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'quantity': instance.quantity,
      'price': instance.price,
      'customizations': instance.customizations,
    };
