// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAnalyticsDashboardImpl _$$UserAnalyticsDashboardImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAnalyticsDashboardImpl(
      userId: json['userId'] as String,
      totalOrders: (json['totalOrders'] as num).toInt(),
      totalSpent: (json['totalSpent'] as num).toDouble(),
      averageOrderValue: (json['averageOrderValue'] as num).toDouble(),
      favoriteRestaurantsCount:
          (json['favoriteRestaurantsCount'] as num).toInt(),
      topCuisines: (json['topCuisines'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      lastOrderDate: DateTime.parse(json['lastOrderDate'] as String),
      loyaltyPoints: (json['loyaltyPoints'] as num).toInt(),
      preferredDeliveryTime: json['preferredDeliveryTime'] as String,
      avgRating: (json['avgRating'] as num).toDouble(),
    );

Map<String, dynamic> _$$UserAnalyticsDashboardImplToJson(
        _$UserAnalyticsDashboardImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'totalOrders': instance.totalOrders,
      'totalSpent': instance.totalSpent,
      'averageOrderValue': instance.averageOrderValue,
      'favoriteRestaurantsCount': instance.favoriteRestaurantsCount,
      'topCuisines': instance.topCuisines,
      'lastOrderDate': instance.lastOrderDate.toIso8601String(),
      'loyaltyPoints': instance.loyaltyPoints,
      'preferredDeliveryTime': instance.preferredDeliveryTime,
      'avgRating': instance.avgRating,
    };

_$SpendingAnalyticsImpl _$$SpendingAnalyticsImplFromJson(
        Map<String, dynamic> json) =>
    _$SpendingAnalyticsImpl(
      monthlySpending: (json['monthlySpending'] as List<dynamic>)
          .map((e) => MonthlySpending.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalSpent: (json['totalSpent'] as num).toDouble(),
      averageMonthlySpending:
          (json['averageMonthlySpending'] as num).toDouble(),
      topSpendingCategory: json['topSpendingCategory'] as String,
      categoryBreakdown: (json['categoryBreakdown'] as List<dynamic>)
          .map((e) => CategorySpending.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SpendingAnalyticsImplToJson(
        _$SpendingAnalyticsImpl instance) =>
    <String, dynamic>{
      'monthlySpending': instance.monthlySpending,
      'totalSpent': instance.totalSpent,
      'averageMonthlySpending': instance.averageMonthlySpending,
      'topSpendingCategory': instance.topSpendingCategory,
      'categoryBreakdown': instance.categoryBreakdown,
    };

_$MonthlySpendingImpl _$$MonthlySpendingImplFromJson(
        Map<String, dynamic> json) =>
    _$MonthlySpendingImpl(
      month: json['month'] as String,
      amount: (json['amount'] as num).toDouble(),
      orderCount: (json['orderCount'] as num).toInt(),
    );

Map<String, dynamic> _$$MonthlySpendingImplToJson(
        _$MonthlySpendingImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'amount': instance.amount,
      'orderCount': instance.orderCount,
    };

_$CategorySpendingImpl _$$CategorySpendingImplFromJson(
        Map<String, dynamic> json) =>
    _$CategorySpendingImpl(
      category: json['category'] as String,
      amount: (json['amount'] as num).toDouble(),
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$$CategorySpendingImplToJson(
        _$CategorySpendingImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'amount': instance.amount,
      'percentage': instance.percentage,
    };

_$OrderAnalyticsImpl _$$OrderAnalyticsImplFromJson(Map<String, dynamic> json) =>
    _$OrderAnalyticsImpl(
      totalOrders: (json['totalOrders'] as num).toInt(),
      completedOrders: (json['completedOrders'] as num).toInt(),
      cancelledOrders: (json['cancelledOrders'] as num).toInt(),
      completionRate: (json['completionRate'] as num).toDouble(),
      averageDeliveryTime: (json['averageDeliveryTime'] as num).toDouble(),
      trends: (json['trends'] as List<dynamic>)
          .map((e) => OrderTrend.fromJson(e as Map<String, dynamic>))
          .toList(),
      ordersByDay: Map<String, int>.from(json['ordersByDay'] as Map),
    );

Map<String, dynamic> _$$OrderAnalyticsImplToJson(
        _$OrderAnalyticsImpl instance) =>
    <String, dynamic>{
      'totalOrders': instance.totalOrders,
      'completedOrders': instance.completedOrders,
      'cancelledOrders': instance.cancelledOrders,
      'completionRate': instance.completionRate,
      'averageDeliveryTime': instance.averageDeliveryTime,
      'trends': instance.trends,
      'ordersByDay': instance.ordersByDay,
    };

_$OrderTrendImpl _$$OrderTrendImplFromJson(Map<String, dynamic> json) =>
    _$OrderTrendImpl(
      period: json['period'] as String,
      orderCount: (json['orderCount'] as num).toInt(),
      totalValue: (json['totalValue'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderTrendImplToJson(_$OrderTrendImpl instance) =>
    <String, dynamic>{
      'period': instance.period,
      'orderCount': instance.orderCount,
      'totalValue': instance.totalValue,
    };

_$RestaurantPreferencesImpl _$$RestaurantPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantPreferencesImpl(
      favoriteRestaurants: (json['favoriteRestaurants'] as List<dynamic>)
          .map((e) => RestaurantStats.fromJson(e as Map<String, dynamic>))
          .toList(),
      preferredCuisines: (json['preferredCuisines'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      cuisineOrderCounts:
          Map<String, int>.from(json['cuisineOrderCounts'] as Map),
      averageDistanceFromRestaurants:
          (json['averageDistanceFromRestaurants'] as num).toDouble(),
    );

Map<String, dynamic> _$$RestaurantPreferencesImplToJson(
        _$RestaurantPreferencesImpl instance) =>
    <String, dynamic>{
      'favoriteRestaurants': instance.favoriteRestaurants,
      'preferredCuisines': instance.preferredCuisines,
      'cuisineOrderCounts': instance.cuisineOrderCounts,
      'averageDistanceFromRestaurants': instance.averageDistanceFromRestaurants,
    };

_$RestaurantStatsImpl _$$RestaurantStatsImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantStatsImpl(
      restaurantId: json['restaurantId'] as String,
      restaurantName: json['restaurantName'] as String,
      orderCount: (json['orderCount'] as num).toInt(),
      totalSpent: (json['totalSpent'] as num).toDouble(),
      avgRating: (json['avgRating'] as num).toDouble(),
    );

Map<String, dynamic> _$$RestaurantStatsImplToJson(
        _$RestaurantStatsImpl instance) =>
    <String, dynamic>{
      'restaurantId': instance.restaurantId,
      'restaurantName': instance.restaurantName,
      'orderCount': instance.orderCount,
      'totalSpent': instance.totalSpent,
      'avgRating': instance.avgRating,
    };

_$FoodCategoryAnalyticsImpl _$$FoodCategoryAnalyticsImplFromJson(
        Map<String, dynamic> json) =>
    _$FoodCategoryAnalyticsImpl(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => FoodCategoryStats.fromJson(e as Map<String, dynamic>))
          .toList(),
      mostOrderedCategory: json['mostOrderedCategory'] as String,
      healthScore: (json['healthScore'] as num).toDouble(),
      dietaryPreferences: (json['dietaryPreferences'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$FoodCategoryAnalyticsImplToJson(
        _$FoodCategoryAnalyticsImpl instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'mostOrderedCategory': instance.mostOrderedCategory,
      'healthScore': instance.healthScore,
      'dietaryPreferences': instance.dietaryPreferences,
    };

_$FoodCategoryStatsImpl _$$FoodCategoryStatsImplFromJson(
        Map<String, dynamic> json) =>
    _$FoodCategoryStatsImpl(
      category: json['category'] as String,
      orderCount: (json['orderCount'] as num).toInt(),
      percentage: (json['percentage'] as num).toDouble(),
      avgPrice: (json['avgPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$FoodCategoryStatsImplToJson(
        _$FoodCategoryStatsImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'orderCount': instance.orderCount,
      'percentage': instance.percentage,
      'avgPrice': instance.avgPrice,
    };

_$DeliveryAnalyticsImpl _$$DeliveryAnalyticsImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryAnalyticsImpl(
      averageDeliveryTime: (json['averageDeliveryTime'] as num).toDouble(),
      onTimeDeliveryRate: (json['onTimeDeliveryRate'] as num).toDouble(),
      preferredTimeSlots: (json['preferredTimeSlots'] as List<dynamic>)
          .map((e) => DeliveryTimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryTimesByDay:
          (json['deliveryTimesByDay'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$DeliveryAnalyticsImplToJson(
        _$DeliveryAnalyticsImpl instance) =>
    <String, dynamic>{
      'averageDeliveryTime': instance.averageDeliveryTime,
      'onTimeDeliveryRate': instance.onTimeDeliveryRate,
      'preferredTimeSlots': instance.preferredTimeSlots,
      'deliveryTimesByDay': instance.deliveryTimesByDay,
    };

_$DeliveryTimeSlotImpl _$$DeliveryTimeSlotImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryTimeSlotImpl(
      timeSlot: json['timeSlot'] as String,
      orderCount: (json['orderCount'] as num).toInt(),
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$$DeliveryTimeSlotImplToJson(
        _$DeliveryTimeSlotImpl instance) =>
    <String, dynamic>{
      'timeSlot': instance.timeSlot,
      'orderCount': instance.orderCount,
      'percentage': instance.percentage,
    };

_$LoyaltyAnalyticsImpl _$$LoyaltyAnalyticsImplFromJson(
        Map<String, dynamic> json) =>
    _$LoyaltyAnalyticsImpl(
      currentPoints: (json['currentPoints'] as num).toInt(),
      totalPointsEarned: (json['totalPointsEarned'] as num).toInt(),
      totalPointsRedeemed: (json['totalPointsRedeemed'] as num).toInt(),
      recentTransactions: (json['recentTransactions'] as List<dynamic>)
          .map((e) => LoyaltyTransaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentTier: json['currentTier'] as String,
      pointsToNextTier: (json['pointsToNextTier'] as num).toInt(),
    );

Map<String, dynamic> _$$LoyaltyAnalyticsImplToJson(
        _$LoyaltyAnalyticsImpl instance) =>
    <String, dynamic>{
      'currentPoints': instance.currentPoints,
      'totalPointsEarned': instance.totalPointsEarned,
      'totalPointsRedeemed': instance.totalPointsRedeemed,
      'recentTransactions': instance.recentTransactions,
      'currentTier': instance.currentTier,
      'pointsToNextTier': instance.pointsToNextTier,
    };

_$LoyaltyTransactionImpl _$$LoyaltyTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$LoyaltyTransactionImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      points: (json['points'] as num).toInt(),
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$LoyaltyTransactionImplToJson(
        _$LoyaltyTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'points': instance.points,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
    };

_$PersonalizedInsightImpl _$$PersonalizedInsightImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalizedInsightImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      actionText: json['actionText'] as String,
      actionData: json['actionData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$PersonalizedInsightImplToJson(
        _$PersonalizedInsightImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'actionText': instance.actionText,
      'actionData': instance.actionData,
    };

_$SavingsAnalyticsImpl _$$SavingsAnalyticsImplFromJson(
        Map<String, dynamic> json) =>
    _$SavingsAnalyticsImpl(
      totalSavings: (json['totalSavings'] as num).toDouble(),
      avgDiscountPercentage: (json['avgDiscountPercentage'] as num).toDouble(),
      discountUsageCount: (json['discountUsageCount'] as num).toInt(),
      savingsBreakdown: (json['savingsBreakdown'] as List<dynamic>)
          .map((e) => SavingsBreakdown.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SavingsAnalyticsImplToJson(
        _$SavingsAnalyticsImpl instance) =>
    <String, dynamic>{
      'totalSavings': instance.totalSavings,
      'avgDiscountPercentage': instance.avgDiscountPercentage,
      'discountUsageCount': instance.discountUsageCount,
      'savingsBreakdown': instance.savingsBreakdown,
    };

_$SavingsBreakdownImpl _$$SavingsBreakdownImplFromJson(
        Map<String, dynamic> json) =>
    _$SavingsBreakdownImpl(
      source: json['source'] as String,
      amount: (json['amount'] as num).toDouble(),
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$$SavingsBreakdownImplToJson(
        _$SavingsBreakdownImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'amount': instance.amount,
      'percentage': instance.percentage,
    };

_$BehavioralAnalyticsImpl _$$BehavioralAnalyticsImplFromJson(
        Map<String, dynamic> json) =>
    _$BehavioralAnalyticsImpl(
      orderingPatterns: (json['orderingPatterns'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      peakOrderingTime: json['peakOrderingTime'] as String,
      favoriteWeekdays: (json['favoriteWeekdays'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      sessionDuration: (json['sessionDuration'] as num).toDouble(),
      appOpenFrequency: (json['appOpenFrequency'] as num).toInt(),
    );

Map<String, dynamic> _$$BehavioralAnalyticsImplToJson(
        _$BehavioralAnalyticsImpl instance) =>
    <String, dynamic>{
      'orderingPatterns': instance.orderingPatterns,
      'peakOrderingTime': instance.peakOrderingTime,
      'favoriteWeekdays': instance.favoriteWeekdays,
      'sessionDuration': instance.sessionDuration,
      'appOpenFrequency': instance.appOpenFrequency,
    };

_$ComparativeAnalyticsImpl _$$ComparativeAnalyticsImplFromJson(
        Map<String, dynamic> json) =>
    _$ComparativeAnalyticsImpl(
      userVsAvgSpending: (json['userVsAvgSpending'] as num).toDouble(),
      userVsAvgOrders: (json['userVsAvgOrders'] as num).toDouble(),
      spendingPercentile: json['spendingPercentile'] as String,
      loyaltyRanking: json['loyaltyRanking'] as String,
    );

Map<String, dynamic> _$$ComparativeAnalyticsImplToJson(
        _$ComparativeAnalyticsImpl instance) =>
    <String, dynamic>{
      'userVsAvgSpending': instance.userVsAvgSpending,
      'userVsAvgOrders': instance.userVsAvgOrders,
      'spendingPercentile': instance.spendingPercentile,
      'loyaltyRanking': instance.loyaltyRanking,
    };

_$AnalyticsExportImpl _$$AnalyticsExportImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalyticsExportImpl(
      exportId: json['exportId'] as String,
      format: json['format'] as String,
      downloadUrl: json['downloadUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$$AnalyticsExportImplToJson(
        _$AnalyticsExportImpl instance) =>
    <String, dynamic>{
      'exportId': instance.exportId,
      'format': instance.format,
      'downloadUrl': instance.downloadUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'expiresAt': instance.expiresAt.toIso8601String(),
    };

_$RealTimeAnalyticsImpl _$$RealTimeAnalyticsImplFromJson(
        Map<String, dynamic> json) =>
    _$RealTimeAnalyticsImpl(
      activeUsers: (json['activeUsers'] as num).toInt(),
      ongoingOrders: (json['ongoingOrders'] as num).toInt(),
      avgOrderValue: (json['avgOrderValue'] as num).toDouble(),
      trendingRestaurants: (json['trendingRestaurants'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$RealTimeAnalyticsImplToJson(
        _$RealTimeAnalyticsImpl instance) =>
    <String, dynamic>{
      'activeUsers': instance.activeUsers,
      'ongoingOrders': instance.ongoingOrders,
      'avgOrderValue': instance.avgOrderValue,
      'trendingRestaurants': instance.trendingRestaurants,
    };

_$PredictiveAnalyticsImpl _$$PredictiveAnalyticsImplFromJson(
        Map<String, dynamic> json) =>
    _$PredictiveAnalyticsImpl(
      recommendedRestaurants: (json['recommendedRestaurants'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      predictedNextOrder: json['predictedNextOrder'] as String,
      churnRisk: (json['churnRisk'] as num).toDouble(),
      suggestedPromotions: (json['suggestedPromotions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$PredictiveAnalyticsImplToJson(
        _$PredictiveAnalyticsImpl instance) =>
    <String, dynamic>{
      'recommendedRestaurants': instance.recommendedRestaurants,
      'predictedNextOrder': instance.predictedNextOrder,
      'churnRisk': instance.churnRisk,
      'suggestedPromotions': instance.suggestedPromotions,
    };

_$EnvironmentalImpactImpl _$$EnvironmentalImpactImplFromJson(
        Map<String, dynamic> json) =>
    _$EnvironmentalImpactImpl(
      carbonFootprint: (json['carbonFootprint'] as num).toDouble(),
      packagingReduced: (json['packagingReduced'] as num).toInt(),
      sustainabilityScore: (json['sustainabilityScore'] as num).toDouble(),
      ecoFriendlyChoices: (json['ecoFriendlyChoices'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$EnvironmentalImpactImplToJson(
        _$EnvironmentalImpactImpl instance) =>
    <String, dynamic>{
      'carbonFootprint': instance.carbonFootprint,
      'packagingReduced': instance.packagingReduced,
      'sustainabilityScore': instance.sustainabilityScore,
      'ecoFriendlyChoices': instance.ecoFriendlyChoices,
    };

_$AnalyticsSummaryImpl _$$AnalyticsSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalyticsSummaryImpl(
      dashboard: UserAnalyticsDashboard.fromJson(
          json['dashboard'] as Map<String, dynamic>),
      spending:
          SpendingAnalytics.fromJson(json['spending'] as Map<String, dynamic>),
      orders: OrderAnalytics.fromJson(json['orders'] as Map<String, dynamic>),
      loyalty:
          LoyaltyAnalytics.fromJson(json['loyalty'] as Map<String, dynamic>),
      insights: (json['insights'] as List<dynamic>)
          .map((e) => PersonalizedInsight.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AnalyticsSummaryImplToJson(
        _$AnalyticsSummaryImpl instance) =>
    <String, dynamic>{
      'dashboard': instance.dashboard,
      'spending': instance.spending,
      'orders': instance.orders,
      'loyalty': instance.loyalty,
      'insights': instance.insights,
    };
