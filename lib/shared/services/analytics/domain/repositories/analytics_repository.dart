import 'package:eatfast_mobile/shared/utils/result.dart';
import '../models/analytics.dart';

abstract class AnalyticsRepository {
  // Dashboard Management
  Future<Result<AnalyticsDashboard, String>> getDashboard(
    String userId,
    DashboardType type,
  );
  Future<Result<List<AnalyticsDashboard>, String>> getUserDashboards(
    String userId,
  );
  Future<Result<AnalyticsDashboard, String>> createCustomDashboard(
    String userId,
    String name,
    List<String> cardIds,
    List<String> chartIds,
  );
  Future<Result<void, String>> updateDashboard(
    String dashboardId,
    Map<String, dynamic> updates,
  );
  Future<Result<void, String>> deleteDashboard(String dashboardId);

  // Analytics Cards
  Future<Result<List<AnalyticsCard>, String>> getAnalyticsCards(
    String userId,
    DashboardType type, {
    List<String>? cardTypes,
    DateRange? dateRange,
  });
  Future<Result<AnalyticsCard, String>> getAnalyticsCard(String cardId);
  Future<Result<List<AnalyticsCard>, String>> getCustomCards(String userId);

  // Charts & Visualizations
  Future<Result<List<AnalyticsChart>, String>> getAnalyticsCharts(
    String userId,
    DashboardType type, {
    List<ChartType>? chartTypes,
    DateRange? dateRange,
  });
  Future<Result<AnalyticsChart, String>> getAnalyticsChart(String chartId);
  Future<Result<AnalyticsChart, String>> generateChart(
    String userId,
    ChartType type,
    List<String> metrics,
    DateRange dateRange, {
    Map<String, dynamic>? config,
  });

  // KPI Metrics
  Future<Result<List<KPIMetric>, String>> getKPIMetrics(
    String userId,
    DashboardType type,
  );
  Future<Result<KPIMetric, String>> getKPIMetric(String metricId);
  Future<Result<void, String>> setKPITarget(
    String metricId,
    double targetValue,
  );
  Future<Result<List<KPIMetric>, String>> getCustomKPIs(String userId);

  // Performance Insights
  Future<Result<PerformanceInsights, String>> getPerformanceInsights(
    String userId,
    DashboardType type,
  );
  Future<Result<List<Insight>, String>> getInsights(
    String userId, {
    InsightType? type,
    InsightSeverity? severity,
    int? limit,
  });
  Future<Result<List<Recommendation>, String>> getRecommendations(
    String userId, {
    RecommendationType? type,
    RecommendationPriority? priority,
    int? limit,
  });
  Future<Result<void, String>> dismissInsight(String insightId);
  Future<Result<void, String>> implementRecommendation(String recommendationId);

  // Alerts & Notifications
  Future<Result<List<Alert>, String>> getAlerts(
    String userId, {
    AlertType? type,
    AlertSeverity? severity,
    bool? isResolved,
  });
  Future<Result<void, String>> createAlert(
    String userId,
    String metricName,
    AlertType type,
    Map<String, dynamic> conditions,
  );
  Future<Result<void, String>> updateAlert(
    String alertId,
    Map<String, dynamic> updates,
  );
  Future<Result<void, String>> resolveAlert(String alertId);
  Future<Result<void, String>> deleteAlert(String alertId);

  // Real-time Metrics
  Future<Result<RealtimeMetrics, String>> getRealtimeMetrics(
    String userId,
    DashboardType type,
  );
  Stream<RealtimeMetrics> watchRealtimeMetrics(
    String userId,
    DashboardType type,
  );
  Stream<List<RealtimeAlert>> watchRealtimeAlerts(String userId);

  // Custom Reports
  Future<Result<List<CustomReport>, String>> getCustomReports(String userId);
  Future<Result<CustomReport, String>> createCustomReport(
    String userId,
    String name,
    List<String> metrics,
    DateRange dateRange,
    List<ReportFilter> filters,
    ReportFormat format,
  );
  Future<Result<String, String>> generateReport(
    String reportId,
  ); // Returns download URL
  Future<Result<void, String>> scheduleReport(
    String reportId,
    ReportSchedule schedule,
  );
  Future<Result<void, String>> deleteCustomReport(String reportId);

  // Data Export & Import
  Future<Result<String, String>> exportData(
    String userId,
    List<String> metrics,
    DateRange dateRange,
    String format,
  );
  Future<Result<Map<String, dynamic>, String>> getDataSummary(
    String userId,
    DateRange dateRange,
  );

  // Analytics Configuration
  Future<Result<Map<String, dynamic>, String>> getAnalyticsSettings(
    String userId,
  );
  Future<Result<void, String>> updateAnalyticsSettings(
    String userId,
    Map<String, dynamic> settings,
  );
  Future<Result<List<String>, String>> getAvailableMetrics(DashboardType type);
  Future<Result<Map<String, dynamic>, String>> getMetricDefinitions();

  // Historical Data
  Future<Result<List<DataPoint>, String>> getHistoricalData(
    String metric,
    String userId,
    DateRange dateRange, {
    String? aggregation, // 'hour', 'day', 'week', 'month'
  });
  Future<Result<Map<String, List<DataPoint>>, String>> getBulkHistoricalData(
    List<String> metrics,
    String userId,
    DateRange dateRange,
  );

  // Comparative Analytics
  Future<Result<Map<String, dynamic>, String>> getComparativeAnalytics(
    String userId,
    DateRange currentPeriod,
    DateRange comparisonPeriod,
    List<String> metrics,
  );
  Future<Result<Map<String, dynamic>, String>> getBenchmarkData(
    String userId,
    DashboardType type,
    List<String> metrics,
  );

  // Advanced Analytics
  Future<Result<Map<String, dynamic>, String>> getForecastData(
    String userId,
    String metric,
    int forecastDays,
  );
  Future<Result<Map<String, dynamic>, String>> getAnomalyDetection(
    String userId,
    String metric,
    DateRange dateRange,
  );
  Future<Result<Map<String, dynamic>, String>> getCorrelationAnalysis(
    String userId,
    List<String> metrics,
    DateRange dateRange,
  );

  // Event Tracking
  Future<Result<void, String>> trackEvent(
    String userId,
    String eventName,
    Map<String, dynamic> properties,
  );
  Future<Result<void, String>> trackUserAction(
    String userId,
    String action,
    String? entityId,
    Map<String, dynamic>? metadata,
  );
  Future<Result<Map<String, dynamic>, String>> getEventAnalytics(
    String userId,
    String eventName,
    DateRange dateRange,
  );

  // Segmentation & Cohort Analysis
  Future<Result<Map<String, dynamic>, String>> getUserSegmentation(
    String userId,
    List<String> segmentationCriteria,
  );
  Future<Result<Map<String, dynamic>, String>> getCohortAnalysis(
    String userId,
    String cohortMetric,
    DateRange dateRange,
  );

  // Performance Monitoring
  Future<Result<Map<String, dynamic>, String>> getSystemPerformance();
  Future<Result<Map<String, dynamic>, String>> getAPIPerformance(
    DateRange dateRange,
  );
  Future<Result<List<Map<String, dynamic>>, String>> getErrorLogs(
    DateRange dateRange, {
    String? severity,
    int? limit,
  });
}
