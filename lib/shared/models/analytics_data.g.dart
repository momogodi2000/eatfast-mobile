// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalyticsCardImpl _$$AnalyticsCardImplFromJson(Map<String, dynamic> json) =>
    _$AnalyticsCardImpl(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      value: json['value'] as String,
      trend: (json['trend'] as num?)?.toDouble(),
      trendDirection:
          $enumDecodeNullable(_$TrendDirectionEnumMap, json['trendDirection']),
      cardType: $enumDecodeNullable(_$CardTypeEnumMap, json['cardType']),
    );

Map<String, dynamic> _$$AnalyticsCardImplToJson(_$AnalyticsCardImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'value': instance.value,
      'trend': instance.trend,
      'trendDirection': _$TrendDirectionEnumMap[instance.trendDirection],
      'cardType': _$CardTypeEnumMap[instance.cardType],
    };

const _$TrendDirectionEnumMap = {
  TrendDirection.up: 'up',
  TrendDirection.down: 'down',
  TrendDirection.stable: 'stable',
};

const _$CardTypeEnumMap = {
  CardType.revenue: 'revenue',
  CardType.orders: 'orders',
  CardType.customers: 'customers',
  CardType.performance: 'performance',
};

_$DataPointImpl _$$DataPointImplFromJson(Map<String, dynamic> json) =>
    _$DataPointImpl(
      date: DateTime.parse(json['date'] as String),
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$$DataPointImplToJson(_$DataPointImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'value': instance.value,
    };

_$CustomerInsightsImpl _$$CustomerInsightsImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerInsightsImpl(
      segments: (json['segments'] as List<dynamic>)
          .map((e) => CustomerSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
      demographics: (json['demographics'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      topPreferences: (json['topPreferences'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CustomerInsightsImplToJson(
        _$CustomerInsightsImpl instance) =>
    <String, dynamic>{
      'segments': instance.segments,
      'demographics': instance.demographics,
      'topPreferences': instance.topPreferences,
    };

_$CustomerSegmentImpl _$$CustomerSegmentImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerSegmentImpl(
      name: json['name'] as String,
      count: (json['count'] as num).toInt(),
      percentage: (json['percentage'] as num).toDouble(),
      avgOrderValue: (json['avgOrderValue'] as num).toDouble(),
    );

Map<String, dynamic> _$$CustomerSegmentImplToJson(
        _$CustomerSegmentImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
      'percentage': instance.percentage,
      'avgOrderValue': instance.avgOrderValue,
    };

_$OrderTrendPointImpl _$$OrderTrendPointImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderTrendPointImpl(
      date: DateTime.parse(json['date'] as String),
      count: (json['count'] as num).toInt(),
      growthRate: (json['growthRate'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderTrendPointImplToJson(
        _$OrderTrendPointImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'count': instance.count,
      'growthRate': instance.growthRate,
    };

_$PerformanceMetricsImpl _$$PerformanceMetricsImplFromJson(
        Map<String, dynamic> json) =>
    _$PerformanceMetricsImpl(
      deliveryTime: (json['deliveryTime'] as num).toDouble(),
      customerSatisfaction: (json['customerSatisfaction'] as num).toDouble(),
      orderAccuracy: (json['orderAccuracy'] as num).toDouble(),
      status: $enumDecode(_$PerformanceStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$PerformanceMetricsImplToJson(
        _$PerformanceMetricsImpl instance) =>
    <String, dynamic>{
      'deliveryTime': instance.deliveryTime,
      'customerSatisfaction': instance.customerSatisfaction,
      'orderAccuracy': instance.orderAccuracy,
      'status': _$PerformanceStatusEnumMap[instance.status]!,
    };

const _$PerformanceStatusEnumMap = {
  PerformanceStatus.excellent: 'excellent',
  PerformanceStatus.good: 'good',
  PerformanceStatus.average: 'average',
  PerformanceStatus.poor: 'poor',
};

_$RevenuePointImpl _$$RevenuePointImplFromJson(Map<String, dynamic> json) =>
    _$RevenuePointImpl(
      date: DateTime.parse(json['date'] as String),
      amount: (json['amount'] as num).toDouble(),
      growthRate: (json['growthRate'] as num).toDouble(),
    );

Map<String, dynamic> _$$RevenuePointImplToJson(_$RevenuePointImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'amount': instance.amount,
      'growthRate': instance.growthRate,
    };
