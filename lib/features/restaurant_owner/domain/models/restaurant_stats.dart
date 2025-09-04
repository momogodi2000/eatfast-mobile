import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_stats.freezed.dart';
part 'restaurant_stats.g.dart';

@freezed
class RestaurantStats with _$RestaurantStats {
  const factory RestaurantStats({
    required int totalOrders,
    required double totalRevenue,
    required double averageRating,
    required int activeOrders,
    required int completedToday,
    required double todayRevenue,
    required int totalCustomers,
    required double averageOrderValue,
    required int pendingOrders,
    required int rejectedOrders,
    @Default([]) List<HourlyStats> hourlyStats,
    @Default([]) List<DailyStats> weeklyStats,
    @Default([]) List<PopularItem> popularItems,
  }) = _RestaurantStats;

  factory RestaurantStats.fromJson(Map<String, dynamic> json) =>
      _$RestaurantStatsFromJson(json);
}

@freezed
class HourlyStats with _$HourlyStats {
  const factory HourlyStats({
    required int hour,
    required int orders,
    required double revenue,
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
  }) = _DailyStats;

  factory DailyStats.fromJson(Map<String, dynamic> json) =>
      _$DailyStatsFromJson(json);
}

@freezed
class PopularItem with _$PopularItem {
  const factory PopularItem({
    required String itemId,
    required String itemName,
    required String imageUrl,
    required int orderCount,
    required double revenue,
    required double rating,
  }) = _PopularItem;

  factory PopularItem.fromJson(Map<String, dynamic> json) =>
      _$PopularItemFromJson(json);
}