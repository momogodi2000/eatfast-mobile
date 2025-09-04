// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_performance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppPerformanceImpl _$$AppPerformanceImplFromJson(Map<String, dynamic> json) =>
    _$AppPerformanceImpl(
      id: json['id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      cpuUsage: (json['cpuUsage'] as num).toDouble(),
      memoryUsage: (json['memoryUsage'] as num).toDouble(),
      batteryUsage: (json['batteryUsage'] as num).toDouble(),
      networkRequests: (json['networkRequests'] as num).toInt(),
      avgResponseTime: (json['avgResponseTime'] as num).toDouble(),
      errorCount: (json['errorCount'] as num).toInt(),
      frameRate: (json['frameRate'] as num).toDouble(),
      startupTime: (json['startupTime'] as num).toDouble(),
      customMetrics: json['customMetrics'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$AppPerformanceImplToJson(
        _$AppPerformanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'cpuUsage': instance.cpuUsage,
      'memoryUsage': instance.memoryUsage,
      'batteryUsage': instance.batteryUsage,
      'networkRequests': instance.networkRequests,
      'avgResponseTime': instance.avgResponseTime,
      'errorCount': instance.errorCount,
      'frameRate': instance.frameRate,
      'startupTime': instance.startupTime,
      'customMetrics': instance.customMetrics,
    };

_$PerformanceAlertImpl _$$PerformanceAlertImplFromJson(
        Map<String, dynamic> json) =>
    _$PerformanceAlertImpl(
      id: json['id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      type: $enumDecode(_$PerformanceAlertTypeEnumMap, json['type']),
      severity:
          $enumDecode(_$PerformanceAlertSeverityEnumMap, json['severity']),
      message: json['message'] as String,
      details: json['details'] as Map<String, dynamic>,
      isResolved: json['isResolved'] as bool? ?? false,
    );

Map<String, dynamic> _$$PerformanceAlertImplToJson(
        _$PerformanceAlertImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'type': _$PerformanceAlertTypeEnumMap[instance.type]!,
      'severity': _$PerformanceAlertSeverityEnumMap[instance.severity]!,
      'message': instance.message,
      'details': instance.details,
      'isResolved': instance.isResolved,
    };

const _$PerformanceAlertTypeEnumMap = {
  PerformanceAlertType.highMemoryUsage: 'highMemoryUsage',
  PerformanceAlertType.highCpuUsage: 'highCpuUsage',
  PerformanceAlertType.highBatteryDrain: 'highBatteryDrain',
  PerformanceAlertType.slowNetworkResponse: 'slowNetworkResponse',
  PerformanceAlertType.highErrorRate: 'highErrorRate',
  PerformanceAlertType.lowFrameRate: 'lowFrameRate',
  PerformanceAlertType.slowStartup: 'slowStartup',
};

const _$PerformanceAlertSeverityEnumMap = {
  PerformanceAlertSeverity.low: 'low',
  PerformanceAlertSeverity.medium: 'medium',
  PerformanceAlertSeverity.high: 'high',
  PerformanceAlertSeverity.critical: 'critical',
};

_$PerformanceTrendImpl _$$PerformanceTrendImplFromJson(
        Map<String, dynamic> json) =>
    _$PerformanceTrendImpl(
      dataPoints: (json['dataPoints'] as List<dynamic>)
          .map((e) => AppPerformance.fromJson(e as Map<String, dynamic>))
          .toList(),
      averages: (json['averages'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      trends: (json['trends'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, $enumDecode(_$TrendDirectionEnumMap, e)),
      ),
      periodStart: DateTime.parse(json['periodStart'] as String),
      periodEnd: DateTime.parse(json['periodEnd'] as String),
    );

Map<String, dynamic> _$$PerformanceTrendImplToJson(
        _$PerformanceTrendImpl instance) =>
    <String, dynamic>{
      'dataPoints': instance.dataPoints,
      'averages': instance.averages,
      'trends': instance.trends
          .map((k, e) => MapEntry(k, _$TrendDirectionEnumMap[e]!)),
      'periodStart': instance.periodStart.toIso8601String(),
      'periodEnd': instance.periodEnd.toIso8601String(),
    };

const _$TrendDirectionEnumMap = {
  TrendDirection.improving: 'improving',
  TrendDirection.stable: 'stable',
  TrendDirection.degrading: 'degrading',
};
