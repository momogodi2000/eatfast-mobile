/// Advanced Analytics Service for EatFast
/// Comprehensive analytics and reporting system
library;

import 'package:flutter/foundation.dart';
import 'package:eatfast_mobile/shared/services/api/api_client.dart';
import 'package:eatfast_mobile/shared/constants/api_constants.dart';
import '../domain/models/analytics_models.dart';

class AdvancedAnalyticsService {
  final ApiClient _apiClient = ApiClient();

  /// Get user analytics dashboard
  Future<UserAnalyticsDashboard> getUserAnalytics({
    String period = '30d',
    bool includeComparisons = true,
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.analytics}/user/dashboard',
        queryParameters: {
          'period': period,
          'include_comparisons': includeComparisons,
        },
      );

      if (response.statusCode == 200) {
        return UserAnalyticsDashboard.fromJson(response.data);
      } else {
        throw Exception('Failed to get user analytics: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error getting user analytics: $e');
      rethrow;
    }
  }

  /// Get spending analytics
  Future<SpendingAnalytics> getSpendingAnalytics({
    String period = '12m',
    String groupBy = 'month',
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.analytics}/user/spending',
        queryParameters: {'period': period, 'group_by': groupBy},
      );

      if (response.statusCode == 200) {
        return SpendingAnalytics.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to get spending analytics: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error getting spending analytics: $e');
      rethrow;
    }
  }

  /// Get order analytics
  Future<OrderAnalytics> getOrderAnalytics({
    String period = '6m',
    bool includePatterns = true,
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.analytics}/user/orders',
        queryParameters: {
          'period': period,
          'include_patterns': includePatterns,
        },
      );

      if (response.statusCode == 200) {
        return OrderAnalytics.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to get order analytics: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error getting order analytics: $e');
      rethrow;
    }
  }

  /// Get restaurant preferences analytics
  Future<RestaurantPreferences> getRestaurantPreferences({
    String period = '6m',
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.analytics}/user/restaurants',
        queryParameters: {'period': period},
      );

      if (response.statusCode == 200) {
        return RestaurantPreferences.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to get restaurant preferences: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error getting restaurant preferences: $e');
      rethrow;
    }
  }

  /// Get food category analytics
  Future<FoodCategoryAnalytics> getFoodCategoryAnalytics({
    String period = '6m',
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.analytics}/user/categories',
        queryParameters: {'period': period},
      );

      if (response.statusCode == 200) {
        return FoodCategoryAnalytics.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to get category analytics: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error getting category analytics: $e');
      rethrow;
    }
  }

  /// Get delivery analytics
  Future<DeliveryAnalytics> getDeliveryAnalytics({String period = '6m'}) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.analytics}/user/delivery',
        queryParameters: {'period': period},
      );

      if (response.statusCode == 200) {
        return DeliveryAnalytics.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to get delivery analytics: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error getting delivery analytics: $e');
      rethrow;
    }
  }

  /// Get loyalty analytics
  Future<LoyaltyAnalytics> getLoyaltyAnalytics({String period = '12m'}) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.analytics}/user/loyalty',
        queryParameters: {'period': period},
      );

      if (response.statusCode == 200) {
        return LoyaltyAnalytics.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to get loyalty analytics: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error getting loyalty analytics: $e');
      rethrow;
    }
  }

  /// Get personalized insights
  Future<List<PersonalizedInsight>> getPersonalizedInsights({
    int limit = 10,
    String? category,
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.analytics}/user/insights',
        queryParameters: {
          'limit': limit,
          if (category != null) 'category': category,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['insights'] ?? [];
        return data.map((item) => PersonalizedInsight.fromJson(item)).toList();
      } else {
        throw Exception('Failed to get insights: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error getting insights: $e');
      return [];
    }
  }

  /// Get savings analytics
  Future<SavingsAnalytics> getSavingsAnalytics({String period = '12m'}) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.analytics}/user/savings',
        queryParameters: {'period': period},
      );

      if (response.statusCode == 200) {
        return SavingsAnalytics.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to get savings analytics: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error getting savings analytics: $e');
      rethrow;
    }
  }

  /// Get behavioral analytics
  Future<BehavioralAnalytics> getBehavioralAnalytics({
    String period = '6m',
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.analytics}/user/behavior',
        queryParameters: {'period': period},
      );

      if (response.statusCode == 200) {
        return BehavioralAnalytics.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to get behavioral analytics: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error getting behavioral analytics: $e');
      rethrow;
    }
  }

  /// Track custom event
  Future<bool> trackEvent({
    required String eventName,
    required Map<String, dynamic> properties,
    String? category,
  }) async {
    try {
      final response = await _apiClient.post(
        '${ApiConstants.analytics}/track',
        data: {
          'event': eventName,
          'properties': properties,
          'category': category,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      return response.statusCode == 200;
    } catch (e) {
      if (kDebugMode) print('Error tracking event: $e');
      return false;
    }
  }

  /// Get comparative analytics (compare with similar users)
  Future<ComparativeAnalytics> getComparativeAnalytics({
    String period = '3m',
    List<String> metrics = const ['orders', 'spending', 'savings'],
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.analytics}/user/comparative',
        queryParameters: {'period': period, 'metrics': metrics.join(',')},
      );

      if (response.statusCode == 200) {
        return ComparativeAnalytics.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to get comparative analytics: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error getting comparative analytics: $e');
      rethrow;
    }
  }

  /// Export analytics data
  Future<AnalyticsExport> exportAnalyticsData({
    required String format, // 'pdf', 'csv', 'json'
    String period = '12m',
    List<String> sections = const ['all'],
  }) async {
    try {
      final response = await _apiClient.post(
        '${ApiConstants.analytics}/user/export',
        data: {'format': format, 'period': period, 'sections': sections},
      );

      if (response.statusCode == 200) {
        return AnalyticsExport.fromJson(response.data);
      } else {
        throw Exception('Failed to export analytics: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error exporting analytics: $e');
      rethrow;
    }
  }

  /// Get real-time analytics (for current session)
  Future<RealTimeAnalytics> getRealTimeAnalytics() async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.analytics}/user/realtime',
      );

      if (response.statusCode == 200) {
        return RealTimeAnalytics.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to get real-time analytics: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error getting real-time analytics: $e');
      rethrow;
    }
  }

  /// Get predictive analytics
  Future<PredictiveAnalytics> getPredictiveAnalytics({
    int forecastDays = 30,
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.analytics}/user/predictive',
        queryParameters: {'forecast_days': forecastDays},
      );

      if (response.statusCode == 200) {
        return PredictiveAnalytics.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to get predictive analytics: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error getting predictive analytics: $e');
      rethrow;
    }
  }

  /// Get environmental impact analytics
  Future<EnvironmentalImpact> getEnvironmentalImpact({
    String period = '12m',
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.analytics}/user/environmental',
        queryParameters: {'period': period},
      );

      if (response.statusCode == 200) {
        return EnvironmentalImpact.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to get environmental impact: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error getting environmental impact: $e');
      rethrow;
    }
  }

  /// Set analytics preferences
  Future<bool> setAnalyticsPreferences({
    required bool enablePersonalization,
    required bool enableComparisons,
    required bool enablePredictions,
    required bool enableEnvironmentalTracking,
    List<String> excludeCategories = const [],
  }) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.analytics}/user/preferences',
        data: {
          'enablePersonalization': enablePersonalization,
          'enableComparisons': enableComparisons,
          'enablePredictions': enablePredictions,
          'enableEnvironmentalTracking': enableEnvironmentalTracking,
          'excludeCategories': excludeCategories,
        },
      );

      return response.statusCode == 200;
    } catch (e) {
      if (kDebugMode) print('Error setting analytics preferences: $e');
      return false;
    }
  }

  /// Get analytics summary for quick view
  Future<AnalyticsSummary> getAnalyticsSummary() async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.analytics}/user/summary',
      );

      if (response.statusCode == 200) {
        return AnalyticsSummary.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to get analytics summary: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error getting analytics summary: $e');
      rethrow;
    }
  }
}
