// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuItemImpl _$$MenuItemImplFromJson(Map<String, dynamic> json) =>
    _$MenuItemImpl(
      id: json['id'] as String,
      restaurantId: json['restaurantId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      categoryId: json['categoryId'] as String,
      allergens: (json['allergens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      dietaryTags: (json['dietaryTags'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$DietaryTagEnumMap, e))
              .toList() ??
          const [],
      customizations: (json['customizations'] as List<dynamic>?)
              ?.map((e) =>
                  MenuItemCustomization.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isAvailable: json['isAvailable'] as bool? ?? true,
      preparationTime: (json['preparationTime'] as num?)?.toInt() ?? 0,
      calories: (json['calories'] as num?)?.toDouble() ?? 0,
      nutritionalInfo: json['nutritionalInfo'] as String?,
      isPopular: json['isPopular'] as bool? ?? false,
      isRecommended: json['isRecommended'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$MenuItemImplToJson(_$MenuItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'restaurantId': instance.restaurantId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'categoryId': instance.categoryId,
      'allergens': instance.allergens,
      'dietaryTags':
          instance.dietaryTags.map((e) => _$DietaryTagEnumMap[e]!).toList(),
      'customizations': instance.customizations,
      'isAvailable': instance.isAvailable,
      'preparationTime': instance.preparationTime,
      'calories': instance.calories,
      'nutritionalInfo': instance.nutritionalInfo,
      'isPopular': instance.isPopular,
      'isRecommended': instance.isRecommended,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$DietaryTagEnumMap = {
  DietaryTag.vegetarian: 'vegetarian',
  DietaryTag.vegan: 'vegan',
  DietaryTag.glutenFree: 'gluten_free',
  DietaryTag.dairyFree: 'dairy_free',
  DietaryTag.halal: 'halal',
  DietaryTag.kosher: 'kosher',
  DietaryTag.spicy: 'spicy',
  DietaryTag.healthy: 'healthy',
  DietaryTag.organic: 'organic',
};

_$MenuCategoryImpl _$$MenuCategoryImplFromJson(Map<String, dynamic> json) =>
    _$MenuCategoryImpl(
      id: json['id'] as String,
      restaurantId: json['restaurantId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String? ?? '',
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
      isAvailable: json['isAvailable'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$MenuCategoryImplToJson(_$MenuCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'restaurantId': instance.restaurantId,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'sortOrder': instance.sortOrder,
      'isAvailable': instance.isAvailable,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$MenuItemCustomizationImpl _$$MenuItemCustomizationImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuItemCustomizationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      isRequired: json['isRequired'] as bool,
      options: (json['options'] as List<dynamic>?)
              ?.map((e) =>
                  CustomizationOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MenuItemCustomizationImplToJson(
        _$MenuItemCustomizationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'isRequired': instance.isRequired,
      'options': instance.options,
    };

_$CustomizationOptionImpl _$$CustomizationOptionImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomizationOptionImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      additionalPrice: (json['additionalPrice'] as num).toDouble(),
      isAvailable: json['isAvailable'] as bool? ?? true,
    );

Map<String, dynamic> _$$CustomizationOptionImplToJson(
        _$CustomizationOptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'additionalPrice': instance.additionalPrice,
      'isAvailable': instance.isAvailable,
    };
