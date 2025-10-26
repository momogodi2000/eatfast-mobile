import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics.freezed.dart';
part 'analytics.g.dart';

@freezed
class AnalyticsDashboard with _$AnalyticsDashboard {
  const factory AnalyticsDashboard({
    required String dashboardId,
    required String userId,
    required DashboardType type,
    required List<AnalyticsCard> cards,
    required List<AnalyticsChart> charts,
    required List<KPIMetric> kpis,
    required PerformanceInsights insights,
    required DateTime generatedAt,
    DateTime? lastUpdated,
  }) = _AnalyticsDashboard;

  factory AnalyticsDashboard.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsDashboardFromJson(json);
}

@freezed
class AnalyticsCard with _$AnalyticsCard {
  const factory AnalyticsCard({
    required String cardId,
    required String title,
    required String value,
    required CardType type,
    String? subtitle,
    String? unit,
    double? changePercent,
    TrendDirection? trend,
    String? period,
    @Default([]) List<DataPoint> historicalData,
    Map<String, dynamic>? metadata,
  }) = _AnalyticsCard;

  factory AnalyticsCard.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsCardFromJson(json);
}

@freezed
class AnalyticsChart with _$AnalyticsChart {
  const factory AnalyticsChart({
    required String chartId,
    required String title,
    required ChartType type,
    required List<ChartSeries> series,
    required ChartConfig config,
    String? subtitle,
    String? period,
    DateTime? startDate,
    DateTime? endDate,
  }) = _AnalyticsChart;

  factory AnalyticsChart.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsChartFromJson(json);
}

@freezed
class ChartSeries with _$ChartSeries {
  const factory ChartSeries({
    required String name,
    required List<DataPoint> data,
    required String color,
    ChartSeriesType? type,
    Map<String, dynamic>? config,
  }) = _ChartSeries;

  factory ChartSeries.fromJson(Map<String, dynamic> json) =>
      _$ChartSeriesFromJson(json);
}

@freezed
class DataPoint with _$DataPoint {
  const factory DataPoint({
    required DateTime timestamp,
    required double value,
    String? label,
    String? category,
    Map<String, dynamic>? metadata,
  }) = _DataPoint;

  factory DataPoint.fromJson(Map<String, dynamic> json) =>
      _$DataPointFromJson(json);
}

@freezed
class ChartConfig with _$ChartConfig {
  const factory ChartConfig({
    @Default(true) bool showGrid,
    @Default(true) bool showLegend,
    @Default(true) bool showTooltip,
    @Default(false) bool isAnimated,
    String? xAxisLabel,
    String? yAxisLabel,
    Map<String, dynamic>? customConfig,
  }) = _ChartConfig;

  factory ChartConfig.fromJson(Map<String, dynamic> json) =>
      _$ChartConfigFromJson(json);
}

@freezed
class KPIMetric with _$KPIMetric {
  const factory KPIMetric({
    required String metricId,
    required String name,
    required double currentValue,
    required double targetValue,
    required String unit,
    double? previousValue,
    double? changePercent,
    TrendDirection? trend,
    PerformanceStatus? status,
    String? description,
    DateTime? lastUpdated,
  }) = _KPIMetric;

  factory KPIMetric.fromJson(Map<String, dynamic> json) =>
      _$KPIMetricFromJson(json);
}

@freezed
class PerformanceInsights with _$PerformanceInsights {
  const factory PerformanceInsights({
    required List<Insight> insights,
    required List<Recommendation> recommendations,
    required List<Alert> alerts,
    required PerformanceSummary summary,
    DateTime? generatedAt,
  }) = _PerformanceInsights;

  factory PerformanceInsights.fromJson(Map<String, dynamic> json) =>
      _$PerformanceInsightsFromJson(json);
}

@freezed
class Insight with _$Insight {
  const factory Insight({
    required String insightId,
    required String title,
    required String description,
    required InsightType type,
    required InsightSeverity severity,
    required double confidence,
    @Default([]) List<String> supportingData,
    DateTime? generatedAt,
    @Default(false) bool isActionable,
    String? recommendedAction,
  }) = _Insight;

  factory Insight.fromJson(Map<String, dynamic> json) =>
      _$InsightFromJson(json);
}

@freezed
class Recommendation with _$Recommendation {
  const factory Recommendation({
    required String recommendationId,
    required String title,
    required String description,
    required RecommendationType type,
    required RecommendationPriority priority,
    required double expectedImpact,
    @Default([]) List<String> actionItems,
    DateTime? implementBy,
    Map<String, dynamic>? parameters,
  }) = _Recommendation;

  factory Recommendation.fromJson(Map<String, dynamic> json) =>
      _$RecommendationFromJson(json);
}

@freezed
class Alert with _$Alert {
  const factory Alert({
    required String alertId,
    required String title,
    required String message,
    required AlertType type,
    required AlertSeverity severity,
    required DateTime triggeredAt,
    String? metricName,
    double? thresholdValue,
    double? actualValue,
    @Default(false) bool isResolved,
    DateTime? resolvedAt,
  }) = _Alert;

  factory Alert.fromJson(Map<String, dynamic> json) =>
      _$AlertFromJson(json);
}

@freezed
class PerformanceSummary with _$PerformanceSummary {
  const factory PerformanceSummary({
    required double overallScore,
    required Map<String, double> categoryScores,
    required List<String> topPerformingAreas,
    required List<String> improvementAreas,
    required int totalMetrics,
    required int onTrackMetrics,
    required int belowTargetMetrics,
  }) = _PerformanceSummary;

  factory PerformanceSummary.fromJson(Map<String, dynamic> json) =>
      _$PerformanceSummaryFromJson(json);
}

@freezed
class RealtimeMetrics with _$RealtimeMetrics {
  const factory RealtimeMetrics({
    required String userId,
    required Map<String, dynamic> currentMetrics,
    required List<RealtimeAlert> activeAlerts,
    required DateTime lastUpdated,
    @Default(30) int updateIntervalSeconds,
  }) = _RealtimeMetrics;

  factory RealtimeMetrics.fromJson(Map<String, dynamic> json) =>
      _$RealtimeMetricsFromJson(json);
}

@freezed
class RealtimeAlert with _$RealtimeAlert {
  const factory RealtimeAlert({
    required String alertId,
    required String metric,
    required double threshold,
    required double currentValue,
    required DateTime triggeredAt,
  }) = _RealtimeAlert;

  factory RealtimeAlert.fromJson(Map<String, dynamic> json) =>
      _$RealtimeAlertFromJson(json);
}

@freezed
class CustomReport with _$CustomReport {
  const factory CustomReport({
    required String reportId,
    required String userId,
    required String name,
    required List<String> selectedMetrics,
    required DateRange dateRange,
    required List<ReportFilter> filters,
    required ReportFormat format,
    DateTime? lastGenerated,
    @Default(false) bool isScheduled,
    ReportSchedule? schedule,
  }) = _CustomReport;

  factory CustomReport.fromJson(Map<String, dynamic> json) =>
      _$CustomReportFromJson(json);
}

@freezed
class DateRange with _$DateRange {
  const factory DateRange({
    required DateTime startDate,
    required DateTime endDate,
    DateRangeType? type,
  }) = _DateRange;

  factory DateRange.fromJson(Map<String, dynamic> json) =>
      _$DateRangeFromJson(json);
}

@freezed
class ReportFilter with _$ReportFilter {
  const factory ReportFilter({
    required String field,
    required FilterOperator operator,
    required dynamic value,
  }) = _ReportFilter;

  factory ReportFilter.fromJson(Map<String, dynamic> json) =>
      _$ReportFilterFromJson(json);
}

@freezed
class ReportSchedule with _$ReportSchedule {
  const factory ReportSchedule({
    required ScheduleFrequency frequency,
    required List<int> daysOfWeek,
    required int hour,
    required int minute,
    required List<String> recipients,
  }) = _ReportSchedule;

  factory ReportSchedule.fromJson(Map<String, dynamic> json) =>
      _$ReportScheduleFromJson(json);
}

enum DashboardType {
  @JsonValue('customer')
  customer,
  @JsonValue('restaurant')
  restaurant,
  @JsonValue('driver')
  driver,
  @JsonValue('admin')
  admin,
}

enum CardType {
  @JsonValue('metric')
  metric,
  @JsonValue('trend')
  trend,
  @JsonValue('comparison')
  comparison,
  @JsonValue('gauge')
  gauge,
}

enum ChartType {
  @JsonValue('line')
  line,
  @JsonValue('bar')
  bar,
  @JsonValue('pie')
  pie,
  @JsonValue('donut')
  donut,
  @JsonValue('area')
  area,
  @JsonValue('scatter')
  scatter,
  @JsonValue('heatmap')
  heatmap,
}

enum ChartSeriesType {
  @JsonValue('primary')
  primary,
  @JsonValue('secondary')
  secondary,
  @JsonValue('comparison')
  comparison,
}

enum TrendDirection {
  @JsonValue('up')
  up,
  @JsonValue('down')
  down,
  @JsonValue('stable')
  stable,
}

enum PerformanceStatus {
  @JsonValue('excellent')
  excellent,
  @JsonValue('good')
  good,
  @JsonValue('warning')
  warning,
  @JsonValue('critical')
  critical,
}

enum InsightType {
  @JsonValue('performance')
  performance,
  @JsonValue('trend')
  trend,
  @JsonValue('anomaly')
  anomaly,
  @JsonValue('opportunity')
  opportunity,
}

enum InsightSeverity {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('critical')
  critical,
}

enum RecommendationType {
  @JsonValue('performance_improvement')
  performanceImprovement,
  @JsonValue('cost_optimization')
  costOptimization,
  @JsonValue('user_engagement')
  userEngagement,
  @JsonValue('operational_efficiency')
  operationalEfficiency,
}

enum RecommendationPriority {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('urgent')
  urgent,
}

enum AlertType {
  @JsonValue('threshold')
  threshold,
  @JsonValue('anomaly')
  anomaly,
  @JsonValue('trend')
  trend,
  @JsonValue('system')
  system,
}

enum AlertSeverity {
  @JsonValue('info')
  info,
  @JsonValue('warning')
  warning,
  @JsonValue('error')
  error,
  @JsonValue('critical')
  critical,
}

enum ReportFormat {
  @JsonValue('pdf')
  pdf,
  @JsonValue('excel')
  excel,
  @JsonValue('csv')
  csv,
  @JsonValue('json')
  json,
}

enum DateRangeType {
  @JsonValue('today')
  today,
  @JsonValue('yesterday')
  yesterday,
  @JsonValue('last_7_days')
  last7Days,
  @JsonValue('last_30_days')
  last30Days,
  @JsonValue('this_month')
  thisMonth,
  @JsonValue('last_month')
  lastMonth,
  @JsonValue('custom')
  custom,
}

enum FilterOperator {
  @JsonValue('equals')
  equals,
  @JsonValue('not_equals')
  notEquals,
  @JsonValue('greater_than')
  greaterThan,
  @JsonValue('less_than')
  lessThan,
  @JsonValue('contains')
  contains,
  @JsonValue('in')
  inList,
}

enum ScheduleFrequency {
  @JsonValue('daily')
  daily,
  @JsonValue('weekly')
  weekly,
  @JsonValue('monthly')
  monthly,
}
