// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalyticsDashboardImpl _$$AnalyticsDashboardImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalyticsDashboardImpl(
      dashboardId: json['dashboardId'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$DashboardTypeEnumMap, json['type']),
      cards: (json['cards'] as List<dynamic>)
          .map((e) => AnalyticsCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      charts: (json['charts'] as List<dynamic>)
          .map((e) => AnalyticsChart.fromJson(e as Map<String, dynamic>))
          .toList(),
      kpis: (json['kpis'] as List<dynamic>)
          .map((e) => KPIMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      insights: PerformanceInsights.fromJson(
          json['insights'] as Map<String, dynamic>),
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$AnalyticsDashboardImplToJson(
        _$AnalyticsDashboardImpl instance) =>
    <String, dynamic>{
      'dashboardId': instance.dashboardId,
      'userId': instance.userId,
      'type': _$DashboardTypeEnumMap[instance.type]!,
      'cards': instance.cards,
      'charts': instance.charts,
      'kpis': instance.kpis,
      'insights': instance.insights,
      'generatedAt': instance.generatedAt.toIso8601String(),
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };

const _$DashboardTypeEnumMap = {
  DashboardType.customer: 'customer',
  DashboardType.restaurant: 'restaurant',
  DashboardType.driver: 'driver',
  DashboardType.admin: 'admin',
};

_$AnalyticsCardImpl _$$AnalyticsCardImplFromJson(Map<String, dynamic> json) =>
    _$AnalyticsCardImpl(
      cardId: json['cardId'] as String,
      title: json['title'] as String,
      value: json['value'] as String,
      type: $enumDecode(_$CardTypeEnumMap, json['type']),
      subtitle: json['subtitle'] as String?,
      unit: json['unit'] as String?,
      changePercent: (json['changePercent'] as num?)?.toDouble(),
      trend: $enumDecodeNullable(_$TrendDirectionEnumMap, json['trend']),
      period: json['period'] as String?,
      historicalData: (json['historicalData'] as List<dynamic>?)
              ?.map((e) => DataPoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AnalyticsCardImplToJson(_$AnalyticsCardImpl instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'title': instance.title,
      'value': instance.value,
      'type': _$CardTypeEnumMap[instance.type]!,
      'subtitle': instance.subtitle,
      'unit': instance.unit,
      'changePercent': instance.changePercent,
      'trend': _$TrendDirectionEnumMap[instance.trend],
      'period': instance.period,
      'historicalData': instance.historicalData,
      'metadata': instance.metadata,
    };

const _$CardTypeEnumMap = {
  CardType.metric: 'metric',
  CardType.trend: 'trend',
  CardType.comparison: 'comparison',
  CardType.gauge: 'gauge',
};

const _$TrendDirectionEnumMap = {
  TrendDirection.up: 'up',
  TrendDirection.down: 'down',
  TrendDirection.stable: 'stable',
};

_$AnalyticsChartImpl _$$AnalyticsChartImplFromJson(Map<String, dynamic> json) =>
    _$AnalyticsChartImpl(
      chartId: json['chartId'] as String,
      title: json['title'] as String,
      type: $enumDecode(_$ChartTypeEnumMap, json['type']),
      series: (json['series'] as List<dynamic>)
          .map((e) => ChartSeries.fromJson(e as Map<String, dynamic>))
          .toList(),
      config: ChartConfig.fromJson(json['config'] as Map<String, dynamic>),
      subtitle: json['subtitle'] as String?,
      period: json['period'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$$AnalyticsChartImplToJson(
        _$AnalyticsChartImpl instance) =>
    <String, dynamic>{
      'chartId': instance.chartId,
      'title': instance.title,
      'type': _$ChartTypeEnumMap[instance.type]!,
      'series': instance.series,
      'config': instance.config,
      'subtitle': instance.subtitle,
      'period': instance.period,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
    };

const _$ChartTypeEnumMap = {
  ChartType.line: 'line',
  ChartType.bar: 'bar',
  ChartType.pie: 'pie',
  ChartType.donut: 'donut',
  ChartType.area: 'area',
  ChartType.scatter: 'scatter',
  ChartType.heatmap: 'heatmap',
};

_$ChartSeriesImpl _$$ChartSeriesImplFromJson(Map<String, dynamic> json) =>
    _$ChartSeriesImpl(
      name: json['name'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => DataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      color: json['color'] as String,
      type: $enumDecodeNullable(_$ChartSeriesTypeEnumMap, json['type']),
      config: json['config'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ChartSeriesImplToJson(_$ChartSeriesImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'data': instance.data,
      'color': instance.color,
      'type': _$ChartSeriesTypeEnumMap[instance.type],
      'config': instance.config,
    };

const _$ChartSeriesTypeEnumMap = {
  ChartSeriesType.primary: 'primary',
  ChartSeriesType.secondary: 'secondary',
  ChartSeriesType.comparison: 'comparison',
};

_$DataPointImpl _$$DataPointImplFromJson(Map<String, dynamic> json) =>
    _$DataPointImpl(
      timestamp: DateTime.parse(json['timestamp'] as String),
      value: (json['value'] as num).toDouble(),
      label: json['label'] as String?,
      category: json['category'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$DataPointImplToJson(_$DataPointImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'value': instance.value,
      'label': instance.label,
      'category': instance.category,
      'metadata': instance.metadata,
    };

_$ChartConfigImpl _$$ChartConfigImplFromJson(Map<String, dynamic> json) =>
    _$ChartConfigImpl(
      showGrid: json['showGrid'] as bool? ?? true,
      showLegend: json['showLegend'] as bool? ?? true,
      showTooltip: json['showTooltip'] as bool? ?? true,
      isAnimated: json['isAnimated'] as bool? ?? false,
      xAxisLabel: json['xAxisLabel'] as String?,
      yAxisLabel: json['yAxisLabel'] as String?,
      customConfig: json['customConfig'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ChartConfigImplToJson(_$ChartConfigImpl instance) =>
    <String, dynamic>{
      'showGrid': instance.showGrid,
      'showLegend': instance.showLegend,
      'showTooltip': instance.showTooltip,
      'isAnimated': instance.isAnimated,
      'xAxisLabel': instance.xAxisLabel,
      'yAxisLabel': instance.yAxisLabel,
      'customConfig': instance.customConfig,
    };

_$KPIMetricImpl _$$KPIMetricImplFromJson(Map<String, dynamic> json) =>
    _$KPIMetricImpl(
      metricId: json['metricId'] as String,
      name: json['name'] as String,
      currentValue: (json['currentValue'] as num).toDouble(),
      targetValue: (json['targetValue'] as num).toDouble(),
      unit: json['unit'] as String,
      previousValue: (json['previousValue'] as num?)?.toDouble(),
      changePercent: (json['changePercent'] as num?)?.toDouble(),
      trend: $enumDecodeNullable(_$TrendDirectionEnumMap, json['trend']),
      status: $enumDecodeNullable(_$PerformanceStatusEnumMap, json['status']),
      description: json['description'] as String?,
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$KPIMetricImplToJson(_$KPIMetricImpl instance) =>
    <String, dynamic>{
      'metricId': instance.metricId,
      'name': instance.name,
      'currentValue': instance.currentValue,
      'targetValue': instance.targetValue,
      'unit': instance.unit,
      'previousValue': instance.previousValue,
      'changePercent': instance.changePercent,
      'trend': _$TrendDirectionEnumMap[instance.trend],
      'status': _$PerformanceStatusEnumMap[instance.status],
      'description': instance.description,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };

const _$PerformanceStatusEnumMap = {
  PerformanceStatus.excellent: 'excellent',
  PerformanceStatus.good: 'good',
  PerformanceStatus.warning: 'warning',
  PerformanceStatus.critical: 'critical',
};

_$PerformanceInsightsImpl _$$PerformanceInsightsImplFromJson(
        Map<String, dynamic> json) =>
    _$PerformanceInsightsImpl(
      insights: (json['insights'] as List<dynamic>)
          .map((e) => Insight.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommendations: (json['recommendations'] as List<dynamic>)
          .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      alerts: (json['alerts'] as List<dynamic>)
          .map((e) => Alert.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary:
          PerformanceSummary.fromJson(json['summary'] as Map<String, dynamic>),
      generatedAt: json['generatedAt'] == null
          ? null
          : DateTime.parse(json['generatedAt'] as String),
    );

Map<String, dynamic> _$$PerformanceInsightsImplToJson(
        _$PerformanceInsightsImpl instance) =>
    <String, dynamic>{
      'insights': instance.insights,
      'recommendations': instance.recommendations,
      'alerts': instance.alerts,
      'summary': instance.summary,
      'generatedAt': instance.generatedAt?.toIso8601String(),
    };

_$InsightImpl _$$InsightImplFromJson(Map<String, dynamic> json) =>
    _$InsightImpl(
      insightId: json['insightId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$InsightTypeEnumMap, json['type']),
      severity: $enumDecode(_$InsightSeverityEnumMap, json['severity']),
      confidence: (json['confidence'] as num).toDouble(),
      supportingData: (json['supportingData'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      generatedAt: json['generatedAt'] == null
          ? null
          : DateTime.parse(json['generatedAt'] as String),
      isActionable: json['isActionable'] as bool? ?? false,
      recommendedAction: json['recommendedAction'] as String?,
    );

Map<String, dynamic> _$$InsightImplToJson(_$InsightImpl instance) =>
    <String, dynamic>{
      'insightId': instance.insightId,
      'title': instance.title,
      'description': instance.description,
      'type': _$InsightTypeEnumMap[instance.type]!,
      'severity': _$InsightSeverityEnumMap[instance.severity]!,
      'confidence': instance.confidence,
      'supportingData': instance.supportingData,
      'generatedAt': instance.generatedAt?.toIso8601String(),
      'isActionable': instance.isActionable,
      'recommendedAction': instance.recommendedAction,
    };

const _$InsightTypeEnumMap = {
  InsightType.performance: 'performance',
  InsightType.trend: 'trend',
  InsightType.anomaly: 'anomaly',
  InsightType.opportunity: 'opportunity',
};

const _$InsightSeverityEnumMap = {
  InsightSeverity.low: 'low',
  InsightSeverity.medium: 'medium',
  InsightSeverity.high: 'high',
  InsightSeverity.critical: 'critical',
};

_$RecommendationImpl _$$RecommendationImplFromJson(Map<String, dynamic> json) =>
    _$RecommendationImpl(
      recommendationId: json['recommendationId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$RecommendationTypeEnumMap, json['type']),
      priority: $enumDecode(_$RecommendationPriorityEnumMap, json['priority']),
      expectedImpact: (json['expectedImpact'] as num).toDouble(),
      actionItems: (json['actionItems'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      implementBy: json['implementBy'] == null
          ? null
          : DateTime.parse(json['implementBy'] as String),
      parameters: json['parameters'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$RecommendationImplToJson(
        _$RecommendationImpl instance) =>
    <String, dynamic>{
      'recommendationId': instance.recommendationId,
      'title': instance.title,
      'description': instance.description,
      'type': _$RecommendationTypeEnumMap[instance.type]!,
      'priority': _$RecommendationPriorityEnumMap[instance.priority]!,
      'expectedImpact': instance.expectedImpact,
      'actionItems': instance.actionItems,
      'implementBy': instance.implementBy?.toIso8601String(),
      'parameters': instance.parameters,
    };

const _$RecommendationTypeEnumMap = {
  RecommendationType.performanceImprovement: 'performance_improvement',
  RecommendationType.costOptimization: 'cost_optimization',
  RecommendationType.userEngagement: 'user_engagement',
  RecommendationType.operationalEfficiency: 'operational_efficiency',
};

const _$RecommendationPriorityEnumMap = {
  RecommendationPriority.low: 'low',
  RecommendationPriority.medium: 'medium',
  RecommendationPriority.high: 'high',
  RecommendationPriority.urgent: 'urgent',
};

_$AlertImpl _$$AlertImplFromJson(Map<String, dynamic> json) => _$AlertImpl(
      alertId: json['alertId'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      type: $enumDecode(_$AlertTypeEnumMap, json['type']),
      severity: $enumDecode(_$AlertSeverityEnumMap, json['severity']),
      triggeredAt: DateTime.parse(json['triggeredAt'] as String),
      metricName: json['metricName'] as String?,
      thresholdValue: (json['thresholdValue'] as num?)?.toDouble(),
      actualValue: (json['actualValue'] as num?)?.toDouble(),
      isResolved: json['isResolved'] as bool? ?? false,
      resolvedAt: json['resolvedAt'] == null
          ? null
          : DateTime.parse(json['resolvedAt'] as String),
    );

Map<String, dynamic> _$$AlertImplToJson(_$AlertImpl instance) =>
    <String, dynamic>{
      'alertId': instance.alertId,
      'title': instance.title,
      'message': instance.message,
      'type': _$AlertTypeEnumMap[instance.type]!,
      'severity': _$AlertSeverityEnumMap[instance.severity]!,
      'triggeredAt': instance.triggeredAt.toIso8601String(),
      'metricName': instance.metricName,
      'thresholdValue': instance.thresholdValue,
      'actualValue': instance.actualValue,
      'isResolved': instance.isResolved,
      'resolvedAt': instance.resolvedAt?.toIso8601String(),
    };

const _$AlertTypeEnumMap = {
  AlertType.threshold: 'threshold',
  AlertType.anomaly: 'anomaly',
  AlertType.trend: 'trend',
  AlertType.system: 'system',
};

const _$AlertSeverityEnumMap = {
  AlertSeverity.info: 'info',
  AlertSeverity.warning: 'warning',
  AlertSeverity.error: 'error',
  AlertSeverity.critical: 'critical',
};

_$PerformanceSummaryImpl _$$PerformanceSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$PerformanceSummaryImpl(
      overallScore: (json['overallScore'] as num).toDouble(),
      categoryScores: (json['categoryScores'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      topPerformingAreas: (json['topPerformingAreas'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      improvementAreas: (json['improvementAreas'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      totalMetrics: (json['totalMetrics'] as num).toInt(),
      onTrackMetrics: (json['onTrackMetrics'] as num).toInt(),
      belowTargetMetrics: (json['belowTargetMetrics'] as num).toInt(),
    );

Map<String, dynamic> _$$PerformanceSummaryImplToJson(
        _$PerformanceSummaryImpl instance) =>
    <String, dynamic>{
      'overallScore': instance.overallScore,
      'categoryScores': instance.categoryScores,
      'topPerformingAreas': instance.topPerformingAreas,
      'improvementAreas': instance.improvementAreas,
      'totalMetrics': instance.totalMetrics,
      'onTrackMetrics': instance.onTrackMetrics,
      'belowTargetMetrics': instance.belowTargetMetrics,
    };

_$RealtimeMetricsImpl _$$RealtimeMetricsImplFromJson(
        Map<String, dynamic> json) =>
    _$RealtimeMetricsImpl(
      userId: json['userId'] as String,
      currentMetrics: json['currentMetrics'] as Map<String, dynamic>,
      activeAlerts: (json['activeAlerts'] as List<dynamic>)
          .map((e) => RealtimeAlert.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      updateIntervalSeconds:
          (json['updateIntervalSeconds'] as num?)?.toInt() ?? 30,
    );

Map<String, dynamic> _$$RealtimeMetricsImplToJson(
        _$RealtimeMetricsImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'currentMetrics': instance.currentMetrics,
      'activeAlerts': instance.activeAlerts,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'updateIntervalSeconds': instance.updateIntervalSeconds,
    };

_$RealtimeAlertImpl _$$RealtimeAlertImplFromJson(Map<String, dynamic> json) =>
    _$RealtimeAlertImpl(
      alertId: json['alertId'] as String,
      metric: json['metric'] as String,
      threshold: (json['threshold'] as num).toDouble(),
      currentValue: (json['currentValue'] as num).toDouble(),
      triggeredAt: DateTime.parse(json['triggeredAt'] as String),
    );

Map<String, dynamic> _$$RealtimeAlertImplToJson(_$RealtimeAlertImpl instance) =>
    <String, dynamic>{
      'alertId': instance.alertId,
      'metric': instance.metric,
      'threshold': instance.threshold,
      'currentValue': instance.currentValue,
      'triggeredAt': instance.triggeredAt.toIso8601String(),
    };

_$CustomReportImpl _$$CustomReportImplFromJson(Map<String, dynamic> json) =>
    _$CustomReportImpl(
      reportId: json['reportId'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      selectedMetrics: (json['selectedMetrics'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      dateRange: DateRange.fromJson(json['dateRange'] as Map<String, dynamic>),
      filters: (json['filters'] as List<dynamic>)
          .map((e) => ReportFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      format: $enumDecode(_$ReportFormatEnumMap, json['format']),
      lastGenerated: json['lastGenerated'] == null
          ? null
          : DateTime.parse(json['lastGenerated'] as String),
      isScheduled: json['isScheduled'] as bool? ?? false,
      schedule: json['schedule'] == null
          ? null
          : ReportSchedule.fromJson(json['schedule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomReportImplToJson(_$CustomReportImpl instance) =>
    <String, dynamic>{
      'reportId': instance.reportId,
      'userId': instance.userId,
      'name': instance.name,
      'selectedMetrics': instance.selectedMetrics,
      'dateRange': instance.dateRange,
      'filters': instance.filters,
      'format': _$ReportFormatEnumMap[instance.format]!,
      'lastGenerated': instance.lastGenerated?.toIso8601String(),
      'isScheduled': instance.isScheduled,
      'schedule': instance.schedule,
    };

const _$ReportFormatEnumMap = {
  ReportFormat.pdf: 'pdf',
  ReportFormat.excel: 'excel',
  ReportFormat.csv: 'csv',
  ReportFormat.json: 'json',
};

_$DateRangeImpl _$$DateRangeImplFromJson(Map<String, dynamic> json) =>
    _$DateRangeImpl(
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      type: $enumDecodeNullable(_$DateRangeTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$DateRangeImplToJson(_$DateRangeImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'type': _$DateRangeTypeEnumMap[instance.type],
    };

const _$DateRangeTypeEnumMap = {
  DateRangeType.today: 'today',
  DateRangeType.yesterday: 'yesterday',
  DateRangeType.last7Days: 'last_7_days',
  DateRangeType.last30Days: 'last_30_days',
  DateRangeType.thisMonth: 'this_month',
  DateRangeType.lastMonth: 'last_month',
  DateRangeType.custom: 'custom',
};

_$ReportFilterImpl _$$ReportFilterImplFromJson(Map<String, dynamic> json) =>
    _$ReportFilterImpl(
      field: json['field'] as String,
      operator: $enumDecode(_$FilterOperatorEnumMap, json['operator']),
      value: json['value'],
    );

Map<String, dynamic> _$$ReportFilterImplToJson(_$ReportFilterImpl instance) =>
    <String, dynamic>{
      'field': instance.field,
      'operator': _$FilterOperatorEnumMap[instance.operator]!,
      'value': instance.value,
    };

const _$FilterOperatorEnumMap = {
  FilterOperator.equals: 'equals',
  FilterOperator.notEquals: 'not_equals',
  FilterOperator.greaterThan: 'greater_than',
  FilterOperator.lessThan: 'less_than',
  FilterOperator.contains: 'contains',
  FilterOperator.inList: 'in',
};

_$ReportScheduleImpl _$$ReportScheduleImplFromJson(Map<String, dynamic> json) =>
    _$ReportScheduleImpl(
      frequency: $enumDecode(_$ScheduleFrequencyEnumMap, json['frequency']),
      daysOfWeek: (json['daysOfWeek'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      hour: (json['hour'] as num).toInt(),
      minute: (json['minute'] as num).toInt(),
      recipients: (json['recipients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ReportScheduleImplToJson(
        _$ReportScheduleImpl instance) =>
    <String, dynamic>{
      'frequency': _$ScheduleFrequencyEnumMap[instance.frequency]!,
      'daysOfWeek': instance.daysOfWeek,
      'hour': instance.hour,
      'minute': instance.minute,
      'recipients': instance.recipients,
    };

const _$ScheduleFrequencyEnumMap = {
  ScheduleFrequency.daily: 'daily',
  ScheduleFrequency.weekly: 'weekly',
  ScheduleFrequency.monthly: 'monthly',
};
