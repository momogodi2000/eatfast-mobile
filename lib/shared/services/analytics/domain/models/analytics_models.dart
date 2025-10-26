import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_models.freezed.dart';
part 'analytics_models.g.dart';

@freezed
class UserAnalyticsDashboard with _$UserAnalyticsDashboard {
  const factory UserAnalyticsDashboard({
    required String userId,
    required int totalOrders,
    required double totalSpent,
    required double averageOrderValue,
    required int favoriteRestaurantsCount,
    required List<String> topCuisines,
    required DateTime lastOrderDate,
    required int loyaltyPoints,
    required String preferredDeliveryTime,
    required double avgRating,
  }) = _UserAnalyticsDashboard;

  factory UserAnalyticsDashboard.fromJson(Map<String, dynamic> json) =>
      _$UserAnalyticsDashboardFromJson(json);
}

@freezed
class SpendingAnalytics with _$SpendingAnalytics {
  const factory SpendingAnalytics({
    required List<MonthlySpending> monthlySpending,
    required double totalSpent,
    required double averageMonthlySpending,
    required String topSpendingCategory,
    required List<CategorySpending> categoryBreakdown,
  }) = _SpendingAnalytics;

  factory SpendingAnalytics.fromJson(Map<String, dynamic> json) =>
      _$SpendingAnalyticsFromJson(json);
}

@freezed
class MonthlySpending with _$MonthlySpending {
  const factory MonthlySpending({
    required String month,
    required double amount,
    required int orderCount,
  }) = _MonthlySpending;

  factory MonthlySpending.fromJson(Map<String, dynamic> json) =>
      _$MonthlySpendingFromJson(json);
}

@freezed
class CategorySpending with _$CategorySpending {
  const factory CategorySpending({
    required String category,
    required double amount,
    required double percentage,
  }) = _CategorySpending;

  factory CategorySpending.fromJson(Map<String, dynamic> json) =>
      _$CategorySpendingFromJson(json);
}

@freezed
class OrderAnalytics with _$OrderAnalytics {
  const factory OrderAnalytics({
    required int totalOrders,
    required int completedOrders,
    required int cancelledOrders,
    required double completionRate,
    required double averageDeliveryTime,
    required List<OrderTrend> trends,
    required Map<String, int> ordersByDay,
  }) = _OrderAnalytics;

  factory OrderAnalytics.fromJson(Map<String, dynamic> json) =>
      _$OrderAnalyticsFromJson(json);
}

@freezed
class OrderTrend with _$OrderTrend {
  const factory OrderTrend({
    required String period,
    required int orderCount,
    required double totalValue,
  }) = _OrderTrend;

  factory OrderTrend.fromJson(Map<String, dynamic> json) =>
      _$OrderTrendFromJson(json);
}

@freezed
class RestaurantPreferences with _$RestaurantPreferences {
  const factory RestaurantPreferences({
    required List<RestaurantStats> favoriteRestaurants,
    required List<String> preferredCuisines,
    required Map<String, int> cuisineOrderCounts,
    required double averageDistanceFromRestaurants,
  }) = _RestaurantPreferences;

  factory RestaurantPreferences.fromJson(Map<String, dynamic> json) =>
      _$RestaurantPreferencesFromJson(json);
}

@freezed
class RestaurantStats with _$RestaurantStats {
  const factory RestaurantStats({
    required String restaurantId,
    required String restaurantName,
    required int orderCount,
    required double totalSpent,
    required double avgRating,
  }) = _RestaurantStats;

  factory RestaurantStats.fromJson(Map<String, dynamic> json) =>
      _$RestaurantStatsFromJson(json);
}

@freezed
class FoodCategoryAnalytics with _$FoodCategoryAnalytics {
  const factory FoodCategoryAnalytics({
    required List<FoodCategoryStats> categories,
    required String mostOrderedCategory,
    required double healthScore,
    required List<String> dietaryPreferences,
  }) = _FoodCategoryAnalytics;

  factory FoodCategoryAnalytics.fromJson(Map<String, dynamic> json) =>
      _$FoodCategoryAnalyticsFromJson(json);
}

@freezed
class FoodCategoryStats with _$FoodCategoryStats {
  const factory FoodCategoryStats({
    required String category,
    required int orderCount,
    required double percentage,
    required double avgPrice,
  }) = _FoodCategoryStats;

  factory FoodCategoryStats.fromJson(Map<String, dynamic> json) =>
      _$FoodCategoryStatsFromJson(json);
}

@freezed
class DeliveryAnalytics with _$DeliveryAnalytics {
  const factory DeliveryAnalytics({
    required double averageDeliveryTime,
    required double onTimeDeliveryRate,
    required List<DeliveryTimeSlot> preferredTimeSlots,
    required Map<String, double> deliveryTimesByDay,
  }) = _DeliveryAnalytics;

  factory DeliveryAnalytics.fromJson(Map<String, dynamic> json) =>
      _$DeliveryAnalyticsFromJson(json);
}

@freezed
class DeliveryTimeSlot with _$DeliveryTimeSlot {
  const factory DeliveryTimeSlot({
    required String timeSlot,
    required int orderCount,
    required double percentage,
  }) = _DeliveryTimeSlot;

  factory DeliveryTimeSlot.fromJson(Map<String, dynamic> json) =>
      _$DeliveryTimeSlotFromJson(json);
}

@freezed
class LoyaltyAnalytics with _$LoyaltyAnalytics {
  const factory LoyaltyAnalytics({
    required int currentPoints,
    required int totalPointsEarned,
    required int totalPointsRedeemed,
    required List<LoyaltyTransaction> recentTransactions,
    required String currentTier,
    required int pointsToNextTier,
  }) = _LoyaltyAnalytics;

  factory LoyaltyAnalytics.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyAnalyticsFromJson(json);
}

@freezed
class LoyaltyTransaction with _$LoyaltyTransaction {
  const factory LoyaltyTransaction({
    required String id,
    required String type,
    required int points,
    required String description,
    required DateTime date,
  }) = _LoyaltyTransaction;

  factory LoyaltyTransaction.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyTransactionFromJson(json);
}

@freezed
class PersonalizedInsight with _$PersonalizedInsight {
  const factory PersonalizedInsight({
    required String id,
    required String title,
    required String description,
    required String type,
    required String actionText,
    required Map<String, dynamic>? actionData,
  }) = _PersonalizedInsight;

  factory PersonalizedInsight.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedInsightFromJson(json);
}

@freezed
class SavingsAnalytics with _$SavingsAnalytics {
  const factory SavingsAnalytics({
    required double totalSavings,
    required double avgDiscountPercentage,
    required int discountUsageCount,
    required List<SavingsBreakdown> savingsBreakdown,
  }) = _SavingsAnalytics;

  factory SavingsAnalytics.fromJson(Map<String, dynamic> json) =>
      _$SavingsAnalyticsFromJson(json);
}

@freezed
class SavingsBreakdown with _$SavingsBreakdown {
  const factory SavingsBreakdown({
    required String source,
    required double amount,
    required double percentage,
  }) = _SavingsBreakdown;

  factory SavingsBreakdown.fromJson(Map<String, dynamic> json) =>
      _$SavingsBreakdownFromJson(json);
}

@freezed
class BehavioralAnalytics with _$BehavioralAnalytics {
  const factory BehavioralAnalytics({
    required List<String> orderingPatterns,
    required String peakOrderingTime,
    required List<String> favoriteWeekdays,
    required double sessionDuration,
    required int appOpenFrequency,
  }) = _BehavioralAnalytics;

  factory BehavioralAnalytics.fromJson(Map<String, dynamic> json) =>
      _$BehavioralAnalyticsFromJson(json);
}

@freezed
class ComparativeAnalytics with _$ComparativeAnalytics {
  const factory ComparativeAnalytics({
    required double userVsAvgSpending,
    required double userVsAvgOrders,
    required String spendingPercentile,
    required String loyaltyRanking,
  }) = _ComparativeAnalytics;

  factory ComparativeAnalytics.fromJson(Map<String, dynamic> json) =>
      _$ComparativeAnalyticsFromJson(json);
}

@freezed
class AnalyticsExport with _$AnalyticsExport {
  const factory AnalyticsExport({
    required String exportId,
    required String format,
    required String downloadUrl,
    required DateTime createdAt,
    required DateTime expiresAt,
  }) = _AnalyticsExport;

  factory AnalyticsExport.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsExportFromJson(json);
}

@freezed
class RealTimeAnalytics with _$RealTimeAnalytics {
  const factory RealTimeAnalytics({
    required int activeUsers,
    required int ongoingOrders,
    required double avgOrderValue,
    required List<String> trendingRestaurants,
  }) = _RealTimeAnalytics;

  factory RealTimeAnalytics.fromJson(Map<String, dynamic> json) =>
      _$RealTimeAnalyticsFromJson(json);
}

@freezed
class PredictiveAnalytics with _$PredictiveAnalytics {
  const factory PredictiveAnalytics({
    required List<String> recommendedRestaurants,
    required String predictedNextOrder,
    required double churnRisk,
    required List<String> suggestedPromotions,
  }) = _PredictiveAnalytics;

  factory PredictiveAnalytics.fromJson(Map<String, dynamic> json) =>
      _$PredictiveAnalyticsFromJson(json);
}

@freezed
class EnvironmentalImpact with _$EnvironmentalImpact {
  const factory EnvironmentalImpact({
    required double carbonFootprint,
    required int packagingReduced,
    required double sustainabilityScore,
    required List<String> ecoFriendlyChoices,
  }) = _EnvironmentalImpact;

  factory EnvironmentalImpact.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentalImpactFromJson(json);
}

@freezed
class AnalyticsSummary with _$AnalyticsSummary {
  const factory AnalyticsSummary({
    required UserAnalyticsDashboard dashboard,
    required SpendingAnalytics spending,
    required OrderAnalytics orders,
    required LoyaltyAnalytics loyalty,
    required List<PersonalizedInsight> insights,
  }) = _AnalyticsSummary;

  factory AnalyticsSummary.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsSummaryFromJson(json);
}
