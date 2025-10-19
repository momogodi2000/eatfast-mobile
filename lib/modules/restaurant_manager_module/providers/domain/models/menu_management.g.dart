// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_management.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuCategoryImpl _$$MenuCategoryImplFromJson(Map<String, dynamic> json) =>
    _$MenuCategoryImpl(
      categoryId: json['categoryId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      sortOrder: (json['sortOrder'] as num).toInt(),
      isActive: json['isActive'] as bool,
      imageUrl: json['imageUrl'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => MenuItemDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MenuCategoryImplToJson(_$MenuCategoryImpl instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'name': instance.name,
      'description': instance.description,
      'sortOrder': instance.sortOrder,
      'isActive': instance.isActive,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'items': instance.items,
    };

_$MenuItemDetailsImpl _$$MenuItemDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuItemDetailsImpl(
      itemId: json['itemId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      isAvailable: json['isAvailable'] as bool,
      preparationTime: (json['preparationTime'] as num).toInt(),
      imageUrl: json['imageUrl'] as String?,
      allergens: (json['allergens'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      dietaryTags: (json['dietaryTags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      customizations: (json['customizations'] as List<dynamic>?)
          ?.map((e) => CustomizationOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderCount: (json['orderCount'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
      isPopular: json['isPopular'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$MenuItemDetailsImplToJson(
        _$MenuItemDetailsImpl instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'isAvailable': instance.isAvailable,
      'preparationTime': instance.preparationTime,
      'imageUrl': instance.imageUrl,
      'allergens': instance.allergens,
      'dietaryTags': instance.dietaryTags,
      'customizations': instance.customizations,
      'orderCount': instance.orderCount,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'isPopular': instance.isPopular,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$CustomizationOptionImpl _$$CustomizationOptionImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomizationOptionImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$CustomizationTypeEnumMap, json['type']),
      required: json['required'] as bool,
      maxSelections: (json['maxSelections'] as num).toInt(),
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => CustomizationChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CustomizationOptionImplToJson(
        _$CustomizationOptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': _$CustomizationTypeEnumMap[instance.type]!,
      'required': instance.required,
      'maxSelections': instance.maxSelections,
      'choices': instance.choices,
    };

const _$CustomizationTypeEnumMap = {
  CustomizationType.SINGLE_SELECT: 'SINGLE_SELECT',
  CustomizationType.MULTI_SELECT: 'MULTI_SELECT',
  CustomizationType.QUANTITY: 'QUANTITY',
};

_$CustomizationChoiceImpl _$$CustomizationChoiceImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomizationChoiceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      isAvailable: json['isAvailable'] as bool,
      isDefault: json['isDefault'] as bool,
    );

Map<String, dynamic> _$$CustomizationChoiceImplToJson(
        _$CustomizationChoiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'isAvailable': instance.isAvailable,
      'isDefault': instance.isDefault,
    };
