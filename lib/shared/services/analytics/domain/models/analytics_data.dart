import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eatfast_mobile/shared/models/analytics_data.dart' as base;

part 'analytics_data.freezed.dart';
part 'analytics_data.g.dart';

/// Analytics data response model
@freezed
class AnalyticsData with _$AnalyticsData {
  const factory AnalyticsData({
    required List<base.AnalyticsCard> cards,
    required List<base.RevenuePoint> revenueData,
    required List<base.OrderTrendPoint> orderTrendData,
    required base.PerformanceMetrics performanceMetrics,
    required base.CustomerInsights customerInsights,
    required DateTime generatedAt,
    String? error,
  }) = _AnalyticsData;

  factory AnalyticsData.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsDataFromJson(json);
}

/// Analytics request model
@freezed
class AnalyticsRequest with _$AnalyticsRequest {
  const factory AnalyticsRequest({
    required AnalyticsTimeRange timeRange,
    required AnalyticsUserType userType,
    DateTime? startDate,
    DateTime? endDate,
    List<String>? metrics,
    Map<String, dynamic>? filters,
  }) = _AnalyticsRequest;

  factory AnalyticsRequest.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsRequestFromJson(json);
}

/// Analytics time range enum
enum AnalyticsTimeRange {
  @JsonValue('today')
  today,
  @JsonValue('yesterday')
  yesterday,
  @JsonValue('last_7_days')
  last7Days,
  @JsonValue('last_30_days')
  last30Days,
  @JsonValue('this_month')
  month,
  @JsonValue('last_month')
  lastMonth,
  @JsonValue('this_year')
  year,
  @JsonValue('custom')
  custom,
}

/// Analytics user type enum
enum AnalyticsUserType {
  @JsonValue('all')
  all,
  @JsonValue('customer')
  customer,
  @JsonValue('restaurant')
  restaurant,
  @JsonValue('driver')
  driver,
  @JsonValue('admin')
  admin,
}
