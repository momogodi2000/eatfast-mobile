import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_data.freezed.dart';
part 'analytics_data.g.dart';

enum TrendDirection {
  up,
  down,
  stable,
}

enum CardType {
  revenue,
  orders,
  customers,
  performance,
}

enum KPIMetric {
  totalRevenue,
  totalOrders,
  averageOrderValue,
  customerRetention,
  deliveryTime,
  customerSatisfaction,
}

enum PerformanceStatus {
  excellent,
  good,
  average,
  poor,
}

@freezed
class AnalyticsCard with _$AnalyticsCard {
  const factory AnalyticsCard({
    required String title,
    String? subtitle,
    required String value,
    double? trend,
    TrendDirection? trendDirection,
    @JsonKey(includeFromJson: false, includeToJson: false) IconData? icon,
    @JsonKey(includeFromJson: false, includeToJson: false) Color? color,
    CardType? cardType,
  }) = _AnalyticsCard;

  factory AnalyticsCard.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsCardFromJson(json);
}

@freezed
class DataPoint with _$DataPoint {
  const factory DataPoint({
    required DateTime date,
    required double value,
  }) = _DataPoint;

  factory DataPoint.fromJson(Map<String, dynamic> json) =>
      _$DataPointFromJson(json);
}

@freezed
class CustomerInsights with _$CustomerInsights {
  const factory CustomerInsights({
    required List<CustomerSegment> segments,
    required Map<String, double> demographics,
    required List<String> topPreferences,
  }) = _CustomerInsights;

  factory CustomerInsights.fromJson(Map<String, dynamic> json) =>
      _$CustomerInsightsFromJson(json);
}

@freezed
class CustomerSegment with _$CustomerSegment {
  const factory CustomerSegment({
    required String name,
    required int count,
    required double percentage,
    required double avgOrderValue,
  }) = _CustomerSegment;

  factory CustomerSegment.fromJson(Map<String, dynamic> json) =>
      _$CustomerSegmentFromJson(json);
}

@freezed
class OrderTrendPoint with _$OrderTrendPoint {
  const factory OrderTrendPoint({
    required DateTime date,
    required int count,
    required double growthRate,
  }) = _OrderTrendPoint;

  factory OrderTrendPoint.fromJson(Map<String, dynamic> json) =>
      _$OrderTrendPointFromJson(json);
}

@freezed
class PerformanceMetrics with _$PerformanceMetrics {
  const factory PerformanceMetrics({
    required double deliveryTime,
    required double customerSatisfaction,
    required double orderAccuracy,
    required PerformanceStatus status,
  }) = _PerformanceMetrics;

  factory PerformanceMetrics.fromJson(Map<String, dynamic> json) =>
      _$PerformanceMetricsFromJson(json);
}

@freezed
class RevenuePoint with _$RevenuePoint {
  const factory RevenuePoint({
    required DateTime date,
    required double amount,
    required double growthRate,
  }) = _RevenuePoint;

  factory RevenuePoint.fromJson(Map<String, dynamic> json) =>
      _$RevenuePointFromJson(json);
}