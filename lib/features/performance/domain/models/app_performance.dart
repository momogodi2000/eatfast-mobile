import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_performance.freezed.dart';
part 'app_performance.g.dart';

@freezed
class AppPerformance with _$AppPerformance {
  const factory AppPerformance({
    required String id,
    required DateTime timestamp,
    required double cpuUsage,
    required double memoryUsage,
    required double batteryUsage,
    required int networkRequests,
    required double avgResponseTime,
    required int errorCount,
    required double frameRate,
    required double startupTime,
    required Map<String, dynamic> customMetrics,
  }) = _AppPerformance;

  factory AppPerformance.fromJson(Map<String, dynamic> json) =>
      _$AppPerformanceFromJson(json);
}

@freezed
class PerformanceAlert with _$PerformanceAlert {
  const factory PerformanceAlert({
    required String id,
    required DateTime timestamp,
    required PerformanceAlertType type,
    required PerformanceAlertSeverity severity,
    required String message,
    required Map<String, dynamic> details,
    @Default(false) bool isResolved,
  }) = _PerformanceAlert;

  factory PerformanceAlert.fromJson(Map<String, dynamic> json) =>
      _$PerformanceAlertFromJson(json);
}

enum PerformanceAlertType {
  highMemoryUsage,
  highCpuUsage,
  highBatteryDrain,
  slowNetworkResponse,
  highErrorRate,
  lowFrameRate,
  slowStartup,
}

enum PerformanceAlertSeverity {
  low,
  medium,
  high,
  critical,
}

@freezed
class PerformanceTrend with _$PerformanceTrend {
  const factory PerformanceTrend({
    required List<AppPerformance> dataPoints,
    required Map<String, double> averages,
    required Map<String, TrendDirection> trends,
    required DateTime periodStart,
    required DateTime periodEnd,
  }) = _PerformanceTrend;

  factory PerformanceTrend.fromJson(Map<String, dynamic> json) =>
      _$PerformanceTrendFromJson(json);
}

enum TrendDirection {
  improving,
  stable,
  degrading,
}
