// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPreferencesImpl _$$UserPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPreferencesImpl(
      userId: json['userId'] as String,
      favoriteRestaurants: (json['favoriteRestaurants'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      favoriteCuisines: (json['favoriteCuisines'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      dietaryRestrictions: (json['dietaryRestrictions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      allergens: (json['allergens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      preferredDeliveryTime: $enumDecodeNullable(
              _$PreferredDeliveryTimeEnumMap, json['preferredDeliveryTime']) ??
          PreferredDeliveryTime.anytime,
      budgetRange:
          $enumDecodeNullable(_$BudgetRangeEnumMap, json['budgetRange']) ??
              BudgetRange.medium,
      maxDeliveryDistance:
          (json['maxDeliveryDistance'] as num?)?.toDouble() ?? 5.0,
      spiceLevel:
          $enumDecodeNullable(_$SpiceLevelEnumMap, json['spiceLevel']) ??
              SpiceLevel.medium,
      portionSize:
          $enumDecodeNullable(_$PortionSizeEnumMap, json['portionSize']) ??
              PortionSize.regular,
      enableRecommendations: json['enableRecommendations'] as bool? ?? true,
      enableSmartOrdering: json['enableSmartOrdering'] as bool? ?? true,
      enableLocationBasedSuggestions:
          json['enableLocationBasedSuggestions'] as bool? ?? true,
      enableWeatherBasedSuggestions:
          json['enableWeatherBasedSuggestions'] as bool? ?? true,
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$UserPreferencesImplToJson(
        _$UserPreferencesImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'favoriteRestaurants': instance.favoriteRestaurants,
      'favoriteCuisines': instance.favoriteCuisines,
      'dietaryRestrictions': instance.dietaryRestrictions,
      'allergens': instance.allergens,
      'preferredDeliveryTime':
          _$PreferredDeliveryTimeEnumMap[instance.preferredDeliveryTime]!,
      'budgetRange': _$BudgetRangeEnumMap[instance.budgetRange]!,
      'maxDeliveryDistance': instance.maxDeliveryDistance,
      'spiceLevel': _$SpiceLevelEnumMap[instance.spiceLevel]!,
      'portionSize': _$PortionSizeEnumMap[instance.portionSize]!,
      'enableRecommendations': instance.enableRecommendations,
      'enableSmartOrdering': instance.enableSmartOrdering,
      'enableLocationBasedSuggestions': instance.enableLocationBasedSuggestions,
      'enableWeatherBasedSuggestions': instance.enableWeatherBasedSuggestions,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };

const _$PreferredDeliveryTimeEnumMap = {
  PreferredDeliveryTime.morning: 'morning',
  PreferredDeliveryTime.lunch: 'lunch',
  PreferredDeliveryTime.afternoon: 'afternoon',
  PreferredDeliveryTime.dinner: 'dinner',
  PreferredDeliveryTime.lateNight: 'late_night',
  PreferredDeliveryTime.anytime: 'anytime',
};

const _$BudgetRangeEnumMap = {
  BudgetRange.low: 'low',
  BudgetRange.medium: 'medium',
  BudgetRange.high: 'high',
  BudgetRange.premium: 'premium',
};

const _$SpiceLevelEnumMap = {
  SpiceLevel.mild: 'mild',
  SpiceLevel.medium: 'medium',
  SpiceLevel.hot: 'hot',
  SpiceLevel.extraHot: 'extra_hot',
};

const _$PortionSizeEnumMap = {
  PortionSize.small: 'small',
  PortionSize.regular: 'regular',
  PortionSize.large: 'large',
};

_$SmartRecommendationImpl _$$SmartRecommendationImplFromJson(
        Map<String, dynamic> json) =>
    _$SmartRecommendationImpl(
      recommendationId: json['recommendationId'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$RecommendationTypeEnumMap, json['type']),
      title: json['title'] as String,
      description: json['description'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      items: (json['items'] as List<dynamic>)
          .map((e) => RecommendedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      reasons:
          (json['reasons'] as List<dynamic>).map((e) => e as String).toList(),
      validUntil: json['validUntil'] == null
          ? null
          : DateTime.parse(json['validUntil'] as String),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$SmartRecommendationImplToJson(
        _$SmartRecommendationImpl instance) =>
    <String, dynamic>{
      'recommendationId': instance.recommendationId,
      'userId': instance.userId,
      'type': _$RecommendationTypeEnumMap[instance.type]!,
      'title': instance.title,
      'description': instance.description,
      'confidence': instance.confidence,
      'items': instance.items,
      'reasons': instance.reasons,
      'validUntil': instance.validUntil?.toIso8601String(),
      'tags': instance.tags,
      'metadata': instance.metadata,
    };

const _$RecommendationTypeEnumMap = {
  RecommendationType.personalFavorites: 'personal_favorites',
  RecommendationType.trendingItems: 'trending_items',
  RecommendationType.weatherBased: 'weather_based',
  RecommendationType.timeBased: 'time_based',
  RecommendationType.locationBased: 'location_based',
  RecommendationType.similarUsers: 'similar_users',
  RecommendationType.complementItems: 'complement_items',
  RecommendationType.seasonalSpecial: 'seasonal_special',
};

_$RecommendedItemImpl _$$RecommendedItemImplFromJson(
        Map<String, dynamic> json) =>
    _$RecommendedItemImpl(
      itemId: json['itemId'] as String,
      itemName: json['itemName'] as String,
      restaurantId: json['restaurantId'] as String,
      restaurantName: json['restaurantName'] as String,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      reviewCount: (json['reviewCount'] as num).toInt(),
      imageUrl: json['imageUrl'] as String?,
      description: json['description'] as String?,
      estimatedDeliveryTime:
          (json['estimatedDeliveryTime'] as num?)?.toInt() ?? 0,
      relevanceScore: (json['relevanceScore'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$RecommendedItemImplToJson(
        _$RecommendedItemImpl instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'restaurantId': instance.restaurantId,
      'restaurantName': instance.restaurantName,
      'price': instance.price,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'estimatedDeliveryTime': instance.estimatedDeliveryTime,
      'relevanceScore': instance.relevanceScore,
    };

_$PersonalizedFeedImpl _$$PersonalizedFeedImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalizedFeedImpl(
      userId: json['userId'] as String,
      sections: (json['sections'] as List<dynamic>)
          .map((e) => FeedSection.fromJson(e as Map<String, dynamic>))
          .toList(),
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$$PersonalizedFeedImplToJson(
        _$PersonalizedFeedImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'sections': instance.sections,
      'generatedAt': instance.generatedAt.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
    };

_$FeedSectionImpl _$$FeedSectionImplFromJson(Map<String, dynamic> json) =>
    _$FeedSectionImpl(
      sectionId: json['sectionId'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      type: $enumDecode(_$FeedSectionTypeEnumMap, json['type']),
      items: (json['items'] as List<dynamic>)
          .map((e) => FeedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      actionText: json['actionText'] as String?,
      actionRoute: json['actionRoute'] as String?,
      priority: (json['priority'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$FeedSectionImplToJson(_$FeedSectionImpl instance) =>
    <String, dynamic>{
      'sectionId': instance.sectionId,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'type': _$FeedSectionTypeEnumMap[instance.type]!,
      'items': instance.items,
      'actionText': instance.actionText,
      'actionRoute': instance.actionRoute,
      'priority': instance.priority,
    };

const _$FeedSectionTypeEnumMap = {
  FeedSectionType.recommendations: 'recommendations',
  FeedSectionType.trending: 'trending',
  FeedSectionType.nearby: 'nearby',
  FeedSectionType.favorites: 'favorites',
  FeedSectionType.deals: 'deals',
  FeedSectionType.recentlyOrdered: 'recently_ordered',
  FeedSectionType.newRestaurants: 'new_restaurants',
};

_$FeedItemImpl _$$FeedItemImplFromJson(Map<String, dynamic> json) =>
    _$FeedItemImpl(
      itemId: json['itemId'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      type: $enumDecode(_$FeedItemTypeEnumMap, json['type']),
      imageUrl: json['imageUrl'] as String?,
      route: json['route'] as String?,
      data: json['data'] as Map<String, dynamic>?,
      relevanceScore: (json['relevanceScore'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$FeedItemImplToJson(_$FeedItemImpl instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'type': _$FeedItemTypeEnumMap[instance.type]!,
      'imageUrl': instance.imageUrl,
      'route': instance.route,
      'data': instance.data,
      'relevanceScore': instance.relevanceScore,
    };

const _$FeedItemTypeEnumMap = {
  FeedItemType.restaurant: 'restaurant',
  FeedItemType.dish: 'dish',
  FeedItemType.deal: 'deal',
  FeedItemType.category: 'category',
};

_$UserBehaviorImpl _$$UserBehaviorImplFromJson(Map<String, dynamic> json) =>
    _$UserBehaviorImpl(
      userId: json['userId'] as String,
      orderPatterns: (json['orderPatterns'] as List<dynamic>)
          .map((e) => OrderPattern.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchPatterns: (json['searchPatterns'] as List<dynamic>)
          .map((e) => SearchPattern.fromJson(e as Map<String, dynamic>))
          .toList(),
      browsingPatterns: (json['browsingPatterns'] as List<dynamic>)
          .map((e) => BrowsingPattern.fromJson(e as Map<String, dynamic>))
          .toList(),
      cuisinePreferences:
          Map<String, int>.from(json['cuisinePreferences'] as Map),
      restaurantPreferences:
          Map<String, int>.from(json['restaurantPreferences'] as Map),
      averageOrderValues:
          (json['averageOrderValues'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      preferredOrderTimes: (json['preferredOrderTimes'] as List<dynamic>)
          .map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalOrders: (json['totalOrders'] as num?)?.toInt() ?? 0,
      averageOrderValue: (json['averageOrderValue'] as num?)?.toDouble() ?? 0.0,
      customerLifetimeValue:
          (json['customerLifetimeValue'] as num?)?.toDouble() ?? 0.0,
      lastAnalyzed: json['lastAnalyzed'] == null
          ? null
          : DateTime.parse(json['lastAnalyzed'] as String),
    );

Map<String, dynamic> _$$UserBehaviorImplToJson(_$UserBehaviorImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'orderPatterns': instance.orderPatterns,
      'searchPatterns': instance.searchPatterns,
      'browsingPatterns': instance.browsingPatterns,
      'cuisinePreferences': instance.cuisinePreferences,
      'restaurantPreferences': instance.restaurantPreferences,
      'averageOrderValues': instance.averageOrderValues,
      'preferredOrderTimes': instance.preferredOrderTimes,
      'totalOrders': instance.totalOrders,
      'averageOrderValue': instance.averageOrderValue,
      'customerLifetimeValue': instance.customerLifetimeValue,
      'lastAnalyzed': instance.lastAnalyzed?.toIso8601String(),
    };

_$OrderPatternImpl _$$OrderPatternImplFromJson(Map<String, dynamic> json) =>
    _$OrderPatternImpl(
      pattern: json['pattern'] as String,
      frequency: (json['frequency'] as num).toInt(),
      confidence: (json['confidence'] as num).toDouble(),
      associatedItems: (json['associatedItems'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      lastOccurrence: json['lastOccurrence'] == null
          ? null
          : DateTime.parse(json['lastOccurrence'] as String),
    );

Map<String, dynamic> _$$OrderPatternImplToJson(_$OrderPatternImpl instance) =>
    <String, dynamic>{
      'pattern': instance.pattern,
      'frequency': instance.frequency,
      'confidence': instance.confidence,
      'associatedItems': instance.associatedItems,
      'lastOccurrence': instance.lastOccurrence?.toIso8601String(),
    };

_$SearchPatternImpl _$$SearchPatternImplFromJson(Map<String, dynamic> json) =>
    _$SearchPatternImpl(
      query: json['query'] as String,
      count: (json['count'] as num).toInt(),
      resultClicks: (json['resultClicks'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      lastSearched: json['lastSearched'] == null
          ? null
          : DateTime.parse(json['lastSearched'] as String),
    );

Map<String, dynamic> _$$SearchPatternImplToJson(_$SearchPatternImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'count': instance.count,
      'resultClicks': instance.resultClicks,
      'lastSearched': instance.lastSearched?.toIso8601String(),
    };

_$BrowsingPatternImpl _$$BrowsingPatternImplFromJson(
        Map<String, dynamic> json) =>
    _$BrowsingPatternImpl(
      restaurantId: json['restaurantId'] as String,
      viewCount: (json['viewCount'] as num).toInt(),
      averageViewTime:
          Duration(microseconds: (json['averageViewTime'] as num).toInt()),
      viewedItems: (json['viewedItems'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      lastVisited: json['lastVisited'] == null
          ? null
          : DateTime.parse(json['lastVisited'] as String),
    );

Map<String, dynamic> _$$BrowsingPatternImplToJson(
        _$BrowsingPatternImpl instance) =>
    <String, dynamic>{
      'restaurantId': instance.restaurantId,
      'viewCount': instance.viewCount,
      'averageViewTime': instance.averageViewTime.inMicroseconds,
      'viewedItems': instance.viewedItems,
      'lastVisited': instance.lastVisited?.toIso8601String(),
    };

_$TimeSlotImpl _$$TimeSlotImplFromJson(Map<String, dynamic> json) =>
    _$TimeSlotImpl(
      hourStart: (json['hourStart'] as num).toInt(),
      hourEnd: (json['hourEnd'] as num).toInt(),
      frequency: (json['frequency'] as num).toInt(),
      daysOfWeek: (json['daysOfWeek'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$TimeSlotImplToJson(_$TimeSlotImpl instance) =>
    <String, dynamic>{
      'hourStart': instance.hourStart,
      'hourEnd': instance.hourEnd,
      'frequency': instance.frequency,
      'daysOfWeek': instance.daysOfWeek,
    };
