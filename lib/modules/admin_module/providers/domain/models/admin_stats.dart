import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_stats.freezed.dart';
part 'admin_stats.g.dart';

@freezed
class AdminStats with _$AdminStats {
  const factory AdminStats({
    required int totalUsers,
    required int activeUsers,
    required int totalRestaurants,
    required int activeRestaurants,
    required int totalDrivers,
    required int activeDrivers,
    required int onlineDrivers,
    required double totalRevenue,
    required double todayRevenue,
    required double weekRevenue,
    required double monthRevenue,
    required int totalOrders,
    required int todayOrders,
    required int weekOrders,
    required int monthOrders,
    required int pendingOrders,
    required int completedOrders,
    required int cancelledOrders,
    required double averageOrderValue,
    required double averageDeliveryTime,
    required double customerSatisfaction,
    required double platformCommission,
    @Default([]) List<HourlyStats> hourlyStats,
    @Default([]) List<DailyStats> dailyStats,
    @Default([]) List<WeeklyStats> weeklyStats,
    @Default([]) List<MonthlyStats> monthlyStats,
    @Default([]) List<TopRestaurant> topRestaurants,
    @Default([]) List<TopDriver> topDrivers,
  }) = _AdminStats;

  factory AdminStats.fromJson(Map<String, dynamic> json) =>
      _$AdminStatsFromJson(json);
}

@freezed
class HourlyStats with _$HourlyStats {
  const factory HourlyStats({
    required DateTime hour,
    required int orders,
    required double revenue,
    required int activeDrivers,
    required int activeRestaurants,
  }) = _HourlyStats;

  factory HourlyStats.fromJson(Map<String, dynamic> json) =>
      _$HourlyStatsFromJson(json);
}

@freezed
class DailyStats with _$DailyStats {
  const factory DailyStats({
    required DateTime date,
    required int orders,
    required double revenue,
    required int newUsers,
    required int newRestaurants,
    required int newDrivers,
    required double averageOrderValue,
    required double customerSatisfaction,
  }) = _DailyStats;

  factory DailyStats.fromJson(Map<String, dynamic> json) =>
      _$DailyStatsFromJson(json);
}

@freezed
class WeeklyStats with _$WeeklyStats {
  const factory WeeklyStats({
    required DateTime weekStartDate,
    required int orders,
    required double revenue,
    required int newUsers,
    required int activeUsers,
    required double customerRetention,
    required double platformGrowth,
  }) = _WeeklyStats;

  factory WeeklyStats.fromJson(Map<String, dynamic> json) =>
      _$WeeklyStatsFromJson(json);
}

@freezed
class MonthlyStats with _$MonthlyStats {
  const factory MonthlyStats({
    required DateTime month,
    required int orders,
    required double revenue,
    required int newUsers,
    required int churnedUsers,
    required double monthlyRecurringRevenue,
    required double customerLifetimeValue,
  }) = _MonthlyStats;

  factory MonthlyStats.fromJson(Map<String, dynamic> json) =>
      _$MonthlyStatsFromJson(json);
}

@freezed
class TopRestaurant with _$TopRestaurant {
  const factory TopRestaurant({
    required String restaurantId,
    required String name,
    required String imageUrl,
    required int totalOrders,
    required double totalRevenue,
    required double averageRating,
    required double averageOrderValue,
    required int completedOrders,
    required double completionRate,
  }) = _TopRestaurant;

  factory TopRestaurant.fromJson(Map<String, dynamic> json) =>
      _$TopRestaurantFromJson(json);
}

@freezed
class TopDriver with _$TopDriver {
  const factory TopDriver({
    required String driverId,
    required String name,
    required String profileImageUrl,
    required int totalDeliveries,
    required double totalEarnings,
    required double averageRating,
    required double completionRate,
    required int onlineHours,
    required double averageDeliveryTime,
  }) = _TopDriver;

  factory TopDriver.fromJson(Map<String, dynamic> json) =>
      _$TopDriverFromJson(json);
}

@freezed
class PlatformMetrics with _$PlatformMetrics {
  const factory PlatformMetrics({
    required double orderFulfillmentRate,
    required double averageDeliveryTime,
    required double customerSatisfactionScore,
    required double driverUtilizationRate,
    required double restaurantActiveRate,
    required double peakHourEfficiency,
    required int supportTicketsOpen,
    required int supportTicketsResolved,
    required double systemUptime,
    required double apiResponseTime,
  }) = _PlatformMetrics;

  factory PlatformMetrics.fromJson(Map<String, dynamic> json) =>
      _$PlatformMetricsFromJson(json);
}
