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
              .toList() ??
          const [],
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
      isPopular: json['isPopular'] as bool,
      preparationTime: (json['preparationTime'] as num).toInt(),
      imageUrl: json['imageUrl'] as String?,
      allergens: (json['allergens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      dietaryTags: (json['dietaryTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      customizations: (json['customizations'] as List<dynamic>?)
              ?.map((e) =>
                  CustomizationOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      orderCount: (json['orderCount'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
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
      'isPopular': instance.isPopular,
      'preparationTime': instance.preparationTime,
      'imageUrl': instance.imageUrl,
      'allergens': instance.allergens,
      'dietaryTags': instance.dietaryTags,
      'customizations': instance.customizations,
      'orderCount': instance.orderCount,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$CustomizationOptionImpl _$$CustomizationOptionImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomizationOptionImpl(
      optionId: json['optionId'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$CustomizationTypeEnumMap, json['type']),
      isRequired: json['isRequired'] as bool,
      choices: (json['choices'] as List<dynamic>?)
              ?.map((e) =>
                  CustomizationChoice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CustomizationOptionImplToJson(
        _$CustomizationOptionImpl instance) =>
    <String, dynamic>{
      'optionId': instance.optionId,
      'name': instance.name,
      'type': _$CustomizationTypeEnumMap[instance.type]!,
      'isRequired': instance.isRequired,
      'choices': instance.choices,
    };

const _$CustomizationTypeEnumMap = {
  CustomizationType.singleChoice: 'single_choice',
  CustomizationType.multipleChoice: 'multiple_choice',
  CustomizationType.textInput: 'text_input',
};

_$CustomizationChoiceImpl _$$CustomizationChoiceImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomizationChoiceImpl(
      choiceId: json['choiceId'] as String,
      name: json['name'] as String,
      additionalPrice: (json['additionalPrice'] as num).toDouble(),
      isDefault: json['isDefault'] as bool,
      isAvailable: json['isAvailable'] as bool,
    );

Map<String, dynamic> _$$CustomizationChoiceImplToJson(
        _$CustomizationChoiceImpl instance) =>
    <String, dynamic>{
      'choiceId': instance.choiceId,
      'name': instance.name,
      'additionalPrice': instance.additionalPrice,
      'isDefault': instance.isDefault,
      'isAvailable': instance.isAvailable,
    };

_$MenuItemPerformanceImpl _$$MenuItemPerformanceImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuItemPerformanceImpl(
      itemId: json['itemId'] as String,
      itemName: json['itemName'] as String,
      totalOrders: (json['totalOrders'] as num).toInt(),
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      averageRating: (json['averageRating'] as num).toDouble(),
      reviewCount: (json['reviewCount'] as num).toInt(),
      profitMargin: (json['profitMargin'] as num).toDouble(),
      dailyStats: (json['dailyStats'] as List<dynamic>?)
              ?.map((e) => DailyPerformance.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MenuItemPerformanceImplToJson(
        _$MenuItemPerformanceImpl instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'totalOrders': instance.totalOrders,
      'totalRevenue': instance.totalRevenue,
      'averageRating': instance.averageRating,
      'reviewCount': instance.reviewCount,
      'profitMargin': instance.profitMargin,
      'dailyStats': instance.dailyStats,
    };

_$DailyPerformanceImpl _$$DailyPerformanceImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyPerformanceImpl(
      date: DateTime.parse(json['date'] as String),
      orders: (json['orders'] as num).toInt(),
      revenue: (json['revenue'] as num).toDouble(),
    );

Map<String, dynamic> _$$DailyPerformanceImplToJson(
        _$DailyPerformanceImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'orders': instance.orders,
      'revenue': instance.revenue,
    };
