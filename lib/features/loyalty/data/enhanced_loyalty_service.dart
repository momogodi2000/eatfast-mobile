import 'package:flutter/foundation.dart';
import '../../../core/services/api/api_client.dart';
import '../../../core/constants/api_constants.dart';
import '../domain/models/enhanced_loyalty_models.dart';

class EnhancedLoyaltyService {
  final ApiClient _apiClient = ApiClient();

  /// Get current loyalty status and points
  Future<LoyaltyStatus> getLoyaltyStatus() async {
    try {
      final response = await _apiClient.get(ApiConstants.loyaltyStatus);

      if (response.statusCode == 200) {
        return LoyaltyStatus.fromJson(response.data);
      } else {
        throw Exception('Failed to get loyalty status: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error getting loyalty status: $e');
      rethrow;
    }
  }

  /// Get loyalty transaction history
  Future<List<LoyaltyTransaction>> getLoyaltyHistory({
    int limit = 50,
    int offset = 0,
    String? type,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.loyaltyHistory,
        queryParameters: {
          'limit': limit,
          'offset': offset,
          if (type != null) 'type': type,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['transactions'] ?? [];
        return data.map((item) => LoyaltyTransaction.fromJson(item)).toList();
      } else {
        throw Exception('Failed to get loyalty history: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error getting loyalty history: $e');
      return [];
    }
  }

  /// Redeem points for rewards
  Future<RedemptionResult> redeemPoints({
    required String rewardId,
    required int pointsRequired,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.loyaltyRedeem,
        data: {
          'rewardId': rewardId,
          'pointsRequired': pointsRequired,
        },
      );

      if (response.statusCode == 200) {
        return RedemptionResult.fromJson(response.data);
      } else {
        throw Exception('Failed to redeem points: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error redeeming points: $e');
      rethrow;
    }
  }

  /// Get available rewards
  Future<List<LoyaltyReward>> getAvailableRewards() async {
    try {
      final response = await _apiClient.get('${ApiConstants.loyaltyConfig}/rewards');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['rewards'] ?? [];
        return data.map((item) => LoyaltyReward.fromJson(item)).toList();
      } else {
        throw Exception('Failed to get rewards: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error getting rewards: $e');
      return [];
    }
  }

  /// Get loyalty program configuration
  Future<LoyaltyConfig> getLoyaltyConfig() async {
    try {
      final response = await _apiClient.get(ApiConstants.loyaltyConfig);

      if (response.statusCode == 200) {
        return LoyaltyConfig.fromJson(response.data);
      } else {
        throw Exception('Failed to get loyalty config: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error getting loyalty config: $e');
      rethrow;
    }
  }

  /// Get loyalty dashboard data
  Future<LoyaltyDashboard> getLoyaltyDashboard() async {
    try {
      final response = await _apiClient.get(ApiConstants.loyaltyDashboard);

      if (response.statusCode == 200) {
        return LoyaltyDashboard.fromJson(response.data);
      } else {
        throw Exception('Failed to get loyalty dashboard: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error getting loyalty dashboard: $e');
      rethrow;
    }
  }

  /// Earn points for specific actions
  Future<PointsEarnResult> earnPoints({
    required String action,
    required int points,
    String? orderId,
    String? referenceId,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final response = await _apiClient.post(
        '${ApiConstants.loyaltyStatus}/earn',
        data: {
          'action': action,
          'points': points,
          'orderId': orderId,
          'referenceId': referenceId,
          'metadata': metadata,
        },
      );

      if (response.statusCode == 200) {
        return PointsEarnResult.fromJson(response.data);
      } else {
        throw Exception('Failed to earn points: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error earning points: $e');
      rethrow;
    }
  }

  /// Get tier benefits
  Future<List<TierBenefit>> getTierBenefits(String tierName) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.loyaltyConfig}/tiers/$tierName/benefits',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['benefits'] ?? [];
        return data.map((item) => TierBenefit.fromJson(item)).toList();
      } else {
        throw Exception('Failed to get tier benefits: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error getting tier benefits: $e');
      return [];
    }
  }

  /// Check reward eligibility
  Future<RewardEligibility> checkRewardEligibility(String rewardId) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.loyaltyRedeem}/check/$rewardId',
      );

      if (response.statusCode == 200) {
        return RewardEligibility.fromJson(response.data);
      } else {
        throw Exception('Failed to check eligibility: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error checking reward eligibility: $e');
      rethrow;
    }
  }

  /// Get point earning opportunities
  Future<List<EarningOpportunity>> getEarningOpportunities() async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.loyaltyConfig}/earning-opportunities',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['opportunities'] ?? [];
        return data.map((item) => EarningOpportunity.fromJson(item)).toList();
      } else {
        throw Exception('Failed to get earning opportunities: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error getting earning opportunities: $e');
      return [];
    }
  }

  /// Share loyalty program with friends
  Future<ShareResult> shareLoyaltyProgram({
    required String referralCode,
    required String platform,
  }) async {
    try {
      final response = await _apiClient.post(
        '${ApiConstants.loyaltyStatus}/share',
        data: {
          'referralCode': referralCode,
          'platform': platform,
        },
      );

      if (response.statusCode == 200) {
        return ShareResult.fromJson(response.data);
      } else {
        throw Exception('Failed to share loyalty program: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error sharing loyalty program: $e');
      rethrow;
    }
  }

  /// Get personalized recommendations
  Future<List<LoyaltyRecommendation>> getPersonalizedRecommendations() async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.loyaltyDashboard}/recommendations',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['recommendations'] ?? [];
        return data.map((item) => LoyaltyRecommendation.fromJson(item)).toList();
      } else {
        throw Exception('Failed to get recommendations: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error getting recommendations: $e');
      return [];
    }
  }

  /// Track special events and bonus points
  Future<List<SpecialEvent>> getActiveSpecialEvents() async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.loyaltyConfig}/special-events',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['events'] ?? [];
        return data.map((item) => SpecialEvent.fromJson(item)).toList();
      } else {
        throw Exception('Failed to get special events: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error getting special events: $e');
      return [];
    }
  }

  /// Submit feedback for loyalty program
  Future<bool> submitLoyaltyFeedback({
    required String feedback,
    required int rating,
    String? category,
  }) async {
    try {
      final response = await _apiClient.post(
        '${ApiConstants.loyaltyStatus}/feedback',
        data: {
          'feedback': feedback,
          'rating': rating,
          'category': category,
        },
      );

      return response.statusCode == 200;
    } catch (e) {
      if (kDebugMode) print('Error submitting feedback: $e');
      return false;
    }
  }
}