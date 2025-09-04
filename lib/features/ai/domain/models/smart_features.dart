import 'package:freezed_annotation/freezed_annotation.dart';

part 'smart_features.freezed.dart';
part 'smart_features.g.dart';

@freezed
class SmartOrder with _$SmartOrder {
  const factory SmartOrder({
    required String userId,
    required String sessionId,
    required List<SmartOrderItem> predictedItems,
    required Map<String, dynamic> orderContext,
    required double confidence,
    required DateTime generatedAt,
    String? restaurantId,
    double? estimatedTotal,
    int? estimatedDeliveryTime,
  }) = _SmartOrder;

  factory SmartOrder.fromJson(Map<String, dynamic> json) =>
      _$SmartOrderFromJson(json);
}

@freezed
class SmartOrderItem with _$SmartOrderItem {
  const factory SmartOrderItem({
    required String itemId,
    required String itemName,
    required String restaurantId,
    required int predictedQuantity,
    required double confidence,
    required List<String> reasons,
    double? price,
    String? imageUrl,
    @Default([]) List<String> suggestedCustomizations,
  }) = _SmartOrderItem;

  factory SmartOrderItem.fromJson(Map<String, dynamic> json) =>
      _$SmartOrderItemFromJson(json);
}

@freezed
class WeatherBasedSuggestion with _$WeatherBasedSuggestion {
  const factory WeatherBasedSuggestion({
    required WeatherCondition weatherCondition,
    required double temperature,
    required String temperatureUnit,
    required List<SuggestedDish> suggestedDishes,
    required String reasoning,
    DateTime? validUntil,
  }) = _WeatherBasedSuggestion;

  factory WeatherBasedSuggestion.fromJson(Map<String, dynamic> json) =>
      _$WeatherBasedSuggestionFromJson(json);
}

@freezed
class SuggestedDish with _$SuggestedDish {
  const factory SuggestedDish({
    required String dishId,
    required String name,
    required String restaurantName,
    required double relevanceScore,
    required String reason,
    String? imageUrl,
    double? price,
    int? estimatedDeliveryTime,
  }) = _SuggestedDish;

  factory SuggestedDish.fromJson(Map<String, dynamic> json) =>
      _$SuggestedDishFromJson(json);
}

@freezed
class SmartNotification with _$SmartNotification {
  const factory SmartNotification({
    required String notificationId,
    required String userId,
    required NotificationType type,
    required String title,
    required String message,
    required NotificationTrigger trigger,
    required DateTime scheduledFor,
    String? actionText,
    String? actionRoute,
    Map<String, dynamic>? actionData,
    @Default(NotificationStatus.pending) NotificationStatus status,
    DateTime? sentAt,
    DateTime? readAt,
  }) = _SmartNotification;

  factory SmartNotification.fromJson(Map<String, dynamic> json) =>
      _$SmartNotificationFromJson(json);
}

@freezed
class PredictiveAnalytics with _$PredictiveAnalytics {
  const factory PredictiveAnalytics({
    required String userId,
    required PredictiveInsights insights,
    required List<ChurnPrediction> churnPredictions,
    required List<OrderPrediction> nextOrderPredictions,
    required LifetimeValuePrediction lifetimeValue,
    DateTime? lastAnalyzed,
  }) = _PredictiveAnalytics;

  factory PredictiveAnalytics.fromJson(Map<String, dynamic> json) =>
      _$PredictiveAnalyticsFromJson(json);
}

@freezed
class PredictiveInsights with _$PredictiveInsights {
  const factory PredictiveInsights({
    required double nextOrderProbability,
    required int daysUntilNextOrder,
    required double churnRisk,
    required List<String> preferredRestaurants,
    required Map<String, double> cuisineAffinities,
    required OptimalOrderTime optimalOrderTime,
  }) = _PredictiveInsights;

  factory PredictiveInsights.fromJson(Map<String, dynamic> json) =>
      _$PredictiveInsightsFromJson(json);
}

@freezed
class ChurnPrediction with _$ChurnPrediction {
  const factory ChurnPrediction({
    required double churnProbability,
    required List<String> riskFactors,
    required List<RetentionAction> suggestedActions,
    required int daysToChurn,
    DateTime? predictedChurnDate,
  }) = _ChurnPrediction;

  factory ChurnPrediction.fromJson(Map<String, dynamic> json) =>
      _$ChurnPredictionFromJson(json);
}

@freezed
class OrderPrediction with _$OrderPrediction {
  const factory OrderPrediction({
    required DateTime predictedOrderTime,
    required double probability,
    required List<String> likelyItems,
    required String likelyRestaurant,
    required double estimatedOrderValue,
  }) = _OrderPrediction;

  factory OrderPrediction.fromJson(Map<String, dynamic> json) =>
      _$OrderPredictionFromJson(json);
}

@freezed
class LifetimeValuePrediction with _$LifetimeValuePrediction {
  const factory LifetimeValuePrediction({
    required double predictedLifetimeValue,
    required double confidence,
    required int predictedOrderCount,
    required double averagePredictedOrderValue,
    required int timeHorizonMonths,
  }) = _LifetimeValuePrediction;

  factory LifetimeValuePrediction.fromJson(Map<String, dynamic> json) =>
      _$LifetimeValuePredictionFromJson(json);
}

@freezed
class RetentionAction with _$RetentionAction {
  const factory RetentionAction({
    required RetentionActionType type,
    required String description,
    required double expectedImpact,
    required int priority,
    Map<String, dynamic>? parameters,
  }) = _RetentionAction;

  factory RetentionAction.fromJson(Map<String, dynamic> json) =>
      _$RetentionActionFromJson(json);
}

@freezed
class OptimalOrderTime with _$OptimalOrderTime {
  const factory OptimalOrderTime({
    required int hour,
    required int minute,
    required List<int> daysOfWeek,
    required double confidence,
  }) = _OptimalOrderTime;

  factory OptimalOrderTime.fromJson(Map<String, dynamic> json) =>
      _$OptimalOrderTimeFromJson(json);
}

@freezed
class AIInsight with _$AIInsight {
  const factory AIInsight({
    required String insightId,
    required String userId,
    required InsightType type,
    required String title,
    required String description,
    required double confidence,
    required List<String> supportingData,
    DateTime? generatedAt,
    DateTime? expiresAt,
    @Default(false) bool isActionable,
    String? recommendedAction,
  }) = _AIInsight;

  factory AIInsight.fromJson(Map<String, dynamic> json) =>
      _$AIInsightFromJson(json);
}

enum WeatherCondition {
  @JsonValue('sunny')
  sunny,
  @JsonValue('cloudy')
  cloudy,
  @JsonValue('rainy')
  rainy,
  @JsonValue('stormy')
  stormy,
  @JsonValue('snowy')
  snowy,
  @JsonValue('hot')
  hot,
  @JsonValue('cold')
  cold,
  @JsonValue('humid')
  humid,
}

enum NotificationType {
  @JsonValue('recommendation')
  recommendation,
  @JsonValue('reminder')
  reminder,
  @JsonValue('deal')
  deal,
  @JsonValue('loyalty')
  loyalty,
  @JsonValue('reorder')
  reorder,
  @JsonValue('retention')
  retention,
}

enum NotificationTrigger {
  @JsonValue('time_based')
  timeBased,
  @JsonValue('behavior_based')
  behaviorBased,
  @JsonValue('location_based')
  locationBased,
  @JsonValue('weather_based')
  weatherBased,
  @JsonValue('event_based')
  eventBased,
}

enum NotificationStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('sent')
  sent,
  @JsonValue('delivered')
  delivered,
  @JsonValue('read')
  read,
  @JsonValue('expired')
  expired,
  @JsonValue('failed')
  failed,
}

enum RetentionActionType {
  @JsonValue('discount_offer')
  discountOffer,
  @JsonValue('loyalty_points')
  loyaltyPoints,
  @JsonValue('personalized_recommendation')
  personalizedRecommendation,
  @JsonValue('free_delivery')
  freeDelivery,
  @JsonValue('exclusive_content')
  exclusiveContent,
  @JsonValue('reminder_notification')
  reminderNotification,
}

enum InsightType {
  @JsonValue('spending_pattern')
  spendingPattern,
  @JsonValue('order_timing')
  orderTiming,
  @JsonValue('cuisine_preference')
  cuisinePreference,
  @JsonValue('restaurant_loyalty')
  restaurantLoyalty,
  @JsonValue('price_sensitivity')
  priceSensitivity,
  @JsonValue('delivery_preference')
  deliveryPreference,
}

extension WeatherConditionExtension on WeatherCondition {
  String get displayName {
    switch (this) {
      case WeatherCondition.sunny:
        return 'Ensoleillé';
      case WeatherCondition.cloudy:
        return 'Nuageux';
      case WeatherCondition.rainy:
        return 'Pluvieux';
      case WeatherCondition.stormy:
        return 'Orageux';
      case WeatherCondition.snowy:
        return 'Neigeux';
      case WeatherCondition.hot:
        return 'Chaud';
      case WeatherCondition.cold:
        return 'Froid';
      case WeatherCondition.humid:
        return 'Humide';
    }
  }

  String get emoji {
    switch (this) {
      case WeatherCondition.sunny:
        return '☀️';
      case WeatherCondition.cloudy:
        return '☁️';
      case WeatherCondition.rainy:
        return '🌧️';
      case WeatherCondition.stormy:
        return '⛈️';
      case WeatherCondition.snowy:
        return '❄️';
      case WeatherCondition.hot:
        return '🔥';
      case WeatherCondition.cold:
        return '🧊';
      case WeatherCondition.humid:
        return '💧';
    }
  }
}