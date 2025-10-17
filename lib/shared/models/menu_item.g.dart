// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) => MenuItem(
      id: json['id'] as String,
      restaurantId: json['restaurantId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      isAvailable: json['isAvailable'] as bool,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      customizationOptions: (json['customizationOptions'] as List<dynamic>)
          .map((e) => CustomizationOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuItemToJson(MenuItem instance) => <String, dynamic>{
      'id': instance.id,
      'restaurantId': instance.restaurantId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'isAvailable': instance.isAvailable,
      'categories': instance.categories,
      'customizationOptions': instance.customizationOptions,
    };

CustomizationOption _$CustomizationOptionFromJson(Map<String, dynamic> json) =>
    CustomizationOption(
      id: json['id'] as String,
      name: json['name'] as String,
      choices:
          (json['choices'] as List<dynamic>).map((e) => e as String).toList(),
      isRequired: json['isRequired'] as bool,
      additionalPrice: (json['additionalPrice'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$CustomizationOptionToJson(
        CustomizationOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'choices': instance.choices,
      'isRequired': instance.isRequired,
      'additionalPrice': instance.additionalPrice,
    };
