import 'package:eatfast_mobile/shared/models/analytics_data.dart';
import 'package:eatfast_mobile/shared/models/analytics_request.dart';
import 'package:eatfast_mobile/shared/services/api/api_client.dart';

class AnalyticsRepository {
  final ApiClient _apiClient = ApiClient();

  Future<AnalyticsData> getAnalytics(AnalyticsRequest request) async {
    return getAnalyticsData(
      timeRange: request.timeRange,
      userType: request.userType,
      startDate: request.startDate,
      endDate: request.endDate,
    );
  }

  Future<AnalyticsData> getAnalyticsData({
    required AnalyticsTimeRange timeRange,
    required AnalyticsUserType userType,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'timeRange': timeRange.name,
        'userType': userType.name,
        if (startDate != null) 'startDate': startDate.toIso8601String(),
        if (endDate != null) 'endDate': endDate.toIso8601String(),
      };

      final response = await _apiClient.get(
        '/analytics/dashboard',
        queryParameters: queryParams,
      );

      return AnalyticsData.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to load analytics: $error');
    }
  }

  Future<List<RevenuePoint>> getRevenueData({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final response = await _apiClient.get(
        '/analytics/revenue',
        queryParameters: {
          'startDate': startDate.toIso8601String(),
          'endDate': endDate.toIso8601String(),
        },
      );

      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => RevenuePoint.fromJson(json)).toList();
    } catch (error) {
      throw Exception('Failed to load revenue data: $error');
    }
  }

  Future<List<OrderTrendPoint>> getOrderTrends({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final response = await _apiClient.get(
        '/analytics/order-trends',
        queryParameters: {
          'startDate': startDate.toIso8601String(),
          'endDate': endDate.toIso8601String(),
        },
      );

      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => OrderTrendPoint.fromJson(json)).toList();
    } catch (error) {
      throw Exception('Failed to load order trends: $error');
    }
  }

  Future<CustomerInsights> getCustomerInsights({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final response = await _apiClient.get(
        '/analytics/customer-insights',
        queryParameters: {
          'startDate': startDate.toIso8601String(),
          'endDate': endDate.toIso8601String(),
        },
      );

      return CustomerInsights.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to load customer insights: $error');
    }
  }

  Future<PerformanceMetrics> getPerformanceMetrics({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final response = await _apiClient.get(
        '/analytics/performance',
        queryParameters: {
          'startDate': startDate.toIso8601String(),
          'endDate': endDate.toIso8601String(),
        },
      );

      return PerformanceMetrics.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to load performance metrics: $error');
    }
  }

  Future<void> exportAnalytics(String format) async {
    try {
      await _apiClient.get(
        '/analytics/export',
        queryParameters: {'format': format},
      );
    } catch (error) {
      throw Exception('Failed to export analytics: $error');
    }
  }
}
