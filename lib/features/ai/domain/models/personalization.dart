import 'package:freezed_annotation/freezed_annotation.dart';

part 'personalization.freezed.dart';
part 'personalization.g.dart';

@freezed
class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    required String userId,
    @Default([]) List<String> favoriteRestaurants,
    @Default([]) List<String> favoriteCuisines,
    @Default([]) List<String> dietaryRestrictions,
    @Default([]) List<String> allergens,
    @Default(PreferredDeliveryTime.anytime) PreferredDeliveryTime preferredDeliveryTime,
    @Default(BudgetRange.medium) BudgetRange budgetRange,
    @Default(5.0) double maxDeliveryDistance,
    @Default(SpiceLevel.medium) SpiceLevel spiceLevel,
    @Default(PortionSize.regular) PortionSize portionSize,
    @Default(true) bool enableRecommendations,
    @Default(true) bool enableSmartOrdering,
    @Default(true) bool enableLocationBasedSuggestions,
    @Default(true) bool enableWeatherBasedSuggestions,
    DateTime? lastUpdated,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);
}

@freezed
class SmartRecommendation with _$SmartRecommendation {
  const factory SmartRecommendation({
    required String recommendationId,
    required String userId,
    required RecommendationType type,
    required String title,
    required String description,
    required double confidence,
    required List<RecommendedItem> items,
    required List<String> reasons,
    DateTime? validUntil,
    @Default([]) List<String> tags,
    Map<String, dynamic>? metadata,
  }) = _SmartRecommendation;

  factory SmartRecommendation.fromJson(Map<String, dynamic> json) =>
      _$SmartRecommendationFromJson(json);
}

@freezed
class RecommendedItem with _$RecommendedItem {
  const factory RecommendedItem({
    required String itemId,
    required String itemName,
    required String restaurantId,
    required String restaurantName,
    required double price,
    required double rating,
    required int reviewCount,
    String? imageUrl,
    String? description,
    @Default(0) int estimatedDeliveryTime,
    @Default(0.0) double relevanceScore,
  }) = _RecommendedItem;

  factory RecommendedItem.fromJson(Map<String, dynamic> json) =>
      _$RecommendedItemFromJson(json);
}

@freezed
class PersonalizedFeed with _$PersonalizedFeed {
  const factory PersonalizedFeed({
    required String userId,
    required List<FeedSection> sections,
    required DateTime generatedAt,
    DateTime? expiresAt,
  }) = _PersonalizedFeed;

  factory PersonalizedFeed.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedFeedFromJson(json);
}

@freezed
class FeedSection with _$FeedSection {
  const factory FeedSection({
    required String sectionId,
    required String title,
    required String subtitle,
    required FeedSectionType type,
    required List<FeedItem> items,
    String? actionText,
    String? actionRoute,
    @Default(0) int priority,
  }) = _FeedSection;

  factory FeedSection.fromJson(Map<String, dynamic> json) =>
      _$FeedSectionFromJson(json);
}

@freezed
class FeedItem with _$FeedItem {
  const factory FeedItem({
    required String itemId,
    required String title,
    required String subtitle,
    required FeedItemType type,
    String? imageUrl,
    String? route,
    Map<String, dynamic>? data,
    @Default(0.0) double relevanceScore,
  }) = _FeedItem;

  factory FeedItem.fromJson(Map<String, dynamic> json) =>
      _$FeedItemFromJson(json);
}

@freezed
class UserBehavior with _$UserBehavior {
  const factory UserBehavior({
    required String userId,
    required List<OrderPattern> orderPatterns,
    required List<SearchPattern> searchPatterns,
    required List<BrowsingPattern> browsingPatterns,
    required Map<String, int> cuisinePreferences,
    required Map<String, int> restaurantPreferences,
    required Map<String, double> averageOrderValues,
    required List<TimeSlot> preferredOrderTimes,
    @Default(0) int totalOrders,
    @Default(0.0) double averageOrderValue,
    @Default(0.0) double customerLifetimeValue,
    DateTime? lastAnalyzed,
  }) = _UserBehavior;

  factory UserBehavior.fromJson(Map<String, dynamic> json) =>
      _$UserBehaviorFromJson(json);
}

@freezed
class OrderPattern with _$OrderPattern {
  const factory OrderPattern({
    required String pattern,
    required int frequency,
    required double confidence,
    required List<String> associatedItems,
    DateTime? lastOccurrence,
  }) = _OrderPattern;

  factory OrderPattern.fromJson(Map<String, dynamic> json) =>
      _$OrderPatternFromJson(json);
}

@freezed
class SearchPattern with _$SearchPattern {
  const factory SearchPattern({
    required String query,
    required int count,
    required List<String> resultClicks,
    DateTime? lastSearched,
  }) = _SearchPattern;

  factory SearchPattern.fromJson(Map<String, dynamic> json) =>
      _$SearchPatternFromJson(json);
}

@freezed
class BrowsingPattern with _$BrowsingPattern {
  const factory BrowsingPattern({
    required String restaurantId,
    required int viewCount,
    required Duration averageViewTime,
    required List<String> viewedItems,
    DateTime? lastVisited,
  }) = _BrowsingPattern;

  factory BrowsingPattern.fromJson(Map<String, dynamic> json) =>
      _$BrowsingPatternFromJson(json);
}

@freezed
class TimeSlot with _$TimeSlot {
  const factory TimeSlot({
    required int hourStart,
    required int hourEnd,
    required int frequency,
    required List<int> daysOfWeek,
  }) = _TimeSlot;

  factory TimeSlot.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotFromJson(json);
}

enum RecommendationType {
  @JsonValue('personal_favorites')
  personalFavorites,
  @JsonValue('trending_items')
  trendingItems,
  @JsonValue('weather_based')
  weatherBased,
  @JsonValue('time_based')
  timeBased,
  @JsonValue('location_based')
  locationBased,
  @JsonValue('similar_users')
  similarUsers,
  @JsonValue('complement_items')
  complementItems,
  @JsonValue('seasonal_special')
  seasonalSpecial,
}

enum FeedSectionType {
  @JsonValue('recommendations')
  recommendations,
  @JsonValue('trending')
  trending,
  @JsonValue('nearby')
  nearby,
  @JsonValue('favorites')
  favorites,
  @JsonValue('deals')
  deals,
  @JsonValue('recently_ordered')
  recentlyOrdered,
  @JsonValue('new_restaurants')
  newRestaurants,
}

enum FeedItemType {
  @JsonValue('restaurant')
  restaurant,
  @JsonValue('dish')
  dish,
  @JsonValue('deal')
  deal,
  @JsonValue('category')
  category,
}

enum PreferredDeliveryTime {
  @JsonValue('morning')
  morning,
  @JsonValue('lunch')
  lunch,
  @JsonValue('afternoon')
  afternoon,
  @JsonValue('dinner')
  dinner,
  @JsonValue('late_night')
  lateNight,
  @JsonValue('anytime')
  anytime,
}

enum BudgetRange {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('premium')
  premium,
}

enum SpiceLevel {
  @JsonValue('mild')
  mild,
  @JsonValue('medium')
  medium,
  @JsonValue('hot')
  hot,
  @JsonValue('extra_hot')
  extraHot,
}

enum PortionSize {
  @JsonValue('small')
  small,
  @JsonValue('regular')
  regular,
  @JsonValue('large')
  large,
}

extension RecommendationTypeExtension on RecommendationType {
  String get displayName {
    switch (this) {
      case RecommendationType.personalFavorites:
        return 'Vos favoris';
      case RecommendationType.trendingItems:
        return 'Tendances';
      case RecommendationType.weatherBased:
        return 'Selon la météo';
      case RecommendationType.timeBased:
        return 'Pour ce moment';
      case RecommendationType.locationBased:
        return 'Près de vous';
      case RecommendationType.similarUsers:
        return 'Clients similaires aiment';
      case RecommendationType.complementItems:
        return 'Parfait ensemble';
      case RecommendationType.seasonalSpecial:
        return 'Spécialités de saison';
    }
  }
}