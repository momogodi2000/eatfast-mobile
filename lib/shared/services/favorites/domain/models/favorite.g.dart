// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteItemImpl _$$FavoriteItemImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteItemImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      itemId: json['itemId'] as String,
      type: $enumDecode(_$FavoriteTypeEnumMap, json['type']),
      name: json['name'] as String,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      restaurantName: json['restaurantName'] as String?,
      restaurantId: json['restaurantId'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$FavoriteItemImplToJson(_$FavoriteItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'itemId': instance.itemId,
      'type': _$FavoriteTypeEnumMap[instance.type]!,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'restaurantName': instance.restaurantName,
      'restaurantId': instance.restaurantId,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'price': instance.price,
    };

const _$FavoriteTypeEnumMap = {
  FavoriteType.restaurant: 'restaurant',
  FavoriteType.dish: 'dish',
  FavoriteType.menuItem: 'menu_item',
};

_$ReorderItemImpl _$$ReorderItemImplFromJson(Map<String, dynamic> json) =>
    _$ReorderItemImpl(
      orderId: json['orderId'] as String,
      restaurantName: json['restaurantName'] as String,
      restaurantImage: json['restaurantImage'] as String,
      itemSummary: json['itemSummary'] as String,
      formattedTotal: json['formattedTotal'] as String,
      orderDate: json['orderDate'] as String,
    );

Map<String, dynamic> _$$ReorderItemImplToJson(_$ReorderItemImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'restaurantName': instance.restaurantName,
      'restaurantImage': instance.restaurantImage,
      'itemSummary': instance.itemSummary,
      'formattedTotal': instance.formattedTotal,
      'orderDate': instance.orderDate,
    };
