// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalyticsRequest _$AnalyticsRequestFromJson(Map<String, dynamic> json) =>
    AnalyticsRequest(
      userType: $enumDecode(_$AnalyticsUserTypeEnumMap, json['userType']),
      timeRange: $enumDecode(_$AnalyticsTimeRangeEnumMap, json['timeRange']),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      filters: json['filters'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AnalyticsRequestToJson(AnalyticsRequest instance) =>
    <String, dynamic>{
      'userType': _$AnalyticsUserTypeEnumMap[instance.userType]!,
      'timeRange': _$AnalyticsTimeRangeEnumMap[instance.timeRange]!,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'filters': instance.filters,
    };

const _$AnalyticsUserTypeEnumMap = {
  AnalyticsUserType.all: 'all',
  AnalyticsUserType.customer: 'customer',
  AnalyticsUserType.restaurant: 'restaurant',
  AnalyticsUserType.driver: 'driver',
  AnalyticsUserType.admin: 'admin',
};

const _$AnalyticsTimeRangeEnumMap = {
  AnalyticsTimeRange.today: 'today',
  AnalyticsTimeRange.week: 'week',
  AnalyticsTimeRange.month: 'month',
  AnalyticsTimeRange.quarter: 'quarter',
  AnalyticsTimeRange.year: 'year',
  AnalyticsTimeRange.custom: 'custom',
};
