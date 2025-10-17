/// Unified Loyalty Service - Production Ready
/// Consolidated from loyalty_service.dart and enhanced_loyalty_service.dart
/// Aligned with backend API endpoints
library;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/services/api/api_client.dart';
import 'package:eatfast_mobile/shared/constants/api_constants.dart';
import 'package:eatfast_mobile/shared/services/loyalty/domain/models/loyalty.dart' as base;
import 'package:eatfast_mobile/shared/services/loyalty/domain/models/enhanced_loyalty_models.dart' as enhanced;

/// Unified loyalty service for handling all loyalty program operations
class UnifiedLoyaltyService {
  final ApiClient _apiClient;

  UnifiedLoyaltyService(this._apiClient);

  // ========================================================================
  // CORE LOYALTY PROGRAM OPERATIONS
  // ========================================================================

  /// Get loyalty program information and user status
  Future<LoyaltyResponse> getLoyaltyProgram() async {
    try {
      final response = await _apiClient.get(ApiConstants.clientLoyalty);

      if (response.statusCode == 200) {
        final loyaltyProgram = base.LoyaltyProgram.fromJson(response.data['data']);
        return LoyaltyResponse(loyaltyProgram: loyaltyProgram, success: true);
      } else {
        return LoyaltyResponse(
          success: false,
          error: response.data['error'] ?? 'Failed to load loyalty program',
        );
      }
    } on DioException catch (e) {
      return LoyaltyResponse(success: false, error: _handleDioError(e));
    } catch (e) {
      return LoyaltyResponse(
        success: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  /// Get current loyalty status and points (Enhanced)
  Future<enhanced.LoyaltyStatus> getLoyaltyStatus() async {
    try {
      final response = await _apiClient.get(ApiConstants.loyaltyStatus);

      if (response.statusCode == 200) {
        return enhanced.LoyaltyStatus.fromJson(response.data);
      } else {
        throw Exception('Failed to get loyalty status: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error getting loyalty status: $e');
      rethrow;
    }
  }

  /// Get loyalty dashboard data
  Future<enhanced.LoyaltyDashboard> getLoyaltyDashboard() async {
    try {
      final response = await _apiClient.get(ApiConstants.loyaltyDashboard);

      if (response.statusCode == 200) {
        return enhanced.LoyaltyDashboard.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to get loyalty dashboard: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error getting loyalty dashboard: $e');
      rethrow;
    }
  }

  // ========================================================================
  // REWARDS MANAGEMENT
  // ========================================================================

  /// Get available rewards with optional filters
  Future<RewardsResponse> getAvailableRewards({
    base.RewardType? type,
    int? maxPointsCost,
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.clientLoyalty}/rewards',
        queryParameters: {
          if (type != null) 'type': type.value,
          if (maxPointsCost != null) 'maxPointsCost': maxPointsCost.toString(),
        },
      );

      if (response.statusCode == 200) {
        final rewards = (response.data['data']['rewards'] as List)
            .map((json) => base.LoyaltyReward.fromJson(json))
            .toList();

        return RewardsResponse(rewards: rewards, success: true);
      } else {
        return RewardsResponse(
          rewards: [],
          success: false,
          error: response.data['error'] ?? 'Failed to load rewards',
        );
      }
    } on DioException catch (e) {
      return RewardsResponse(
        rewards: [],
        success: false,
        error: _handleDioError(e),
      );
    } catch (e) {
      return RewardsResponse(
        rewards: [],
        success: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  /// Redeem loyalty points for reward
  Future<RedemptionResponse> redeemPoints(
    base.LoyaltyRedemptionRequest request,
  ) async {
    try {
      final response = await _apiClient.post(
        '${ApiConstants.clientLoyalty}/redeem',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        final data = response.data['data'];
        return RedemptionResponse(
          redemptionId: data['redemptionId'],
          pointsUsed: data['pointsUsed'],
          remainingPoints: data['remainingPoints'],
          rewardCode: data['rewardCode'],
          success: true,
        );
      } else {
        return RedemptionResponse(
          success: false,
          error: response.data['error'] ?? 'Failed to redeem points',
        );
      }
    } on DioException catch (e) {
      return RedemptionResponse(success: false, error: _handleDioError(e));
    } catch (e) {
      return RedemptionResponse(
        success: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  /// Redeem points (Enhanced version)
  Future<enhanced.RedemptionResult> redeemPointsEnhanced({
    required String rewardId,
    required int pointsRequired,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.loyaltyRedeem,
        data: {'rewardId': rewardId, 'pointsRequired': pointsRequired},
      );

      if (response.statusCode == 200) {
        return enhanced.RedemptionResult.fromJson(response.data);
      } else {
        throw Exception('Failed to redeem points: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error redeeming points: $e');
      rethrow;
    }
  }

  /// Check reward eligibility
  Future<enhanced.RewardEligibility> checkRewardEligibility(String rewardId) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.loyaltyRedeem}/check/$rewardId',
      );

      if (response.statusCode == 200) {
        return enhanced.RewardEligibility.fromJson(response.data);
      } else {
        throw Exception('Failed to check eligibility: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error checking reward eligibility: $e');
      rethrow;
    }
  }

  // ========================================================================
  // TRANSACTION HISTORY
  // ========================================================================

  /// Get loyalty transaction history with pagination
  Future<LoyaltyTransactionHistoryResponse> getLoyaltyTransactionHistory({
    int page = 1,
    int limit = 20,
    base.LoyaltyTransactionType? type,
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.clientLoyalty}/transactions',
        queryParameters: {
          'page': page.toString(),
          'limit': limit.toString(),
          if (type != null) 'type': type.value,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data['data'];
        final transactions = (data['transactions'] as List)
            .map((json) => base.LoyaltyTransaction.fromJson(json))
            .toList();

        return LoyaltyTransactionHistoryResponse(
          transactions: transactions,
          pagination: LoyaltyPaginationInfo.fromJson(data['pagination']),
          success: true,
        );
      } else {
        return LoyaltyTransactionHistoryResponse(
          transactions: [],
          pagination: LoyaltyPaginationInfo.empty(),
          success: false,
          error: response.data['error'] ?? 'Failed to load transaction history',
        );
      }
    } on DioException catch (e) {
      return LoyaltyTransactionHistoryResponse(
        transactions: [],
        pagination: LoyaltyPaginationInfo.empty(),
        success: false,
        error: _handleDioError(e),
      );
    } catch (e) {
      return LoyaltyTransactionHistoryResponse(
        transactions: [],
        pagination: LoyaltyPaginationInfo.empty(),
        success: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  /// Get loyalty history (Enhanced version)
  Future<List<enhanced.LoyaltyTransaction>> getLoyaltyHistory({
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
        return data.map((item) => enhanced.LoyaltyTransaction.fromJson(item)).toList();
      } else {
        throw Exception(
          'Failed to get loyalty history: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error getting loyalty history: $e');
      return [];
    }
  }

  // ========================================================================
  // TIERS AND BENEFITS
  // ========================================================================

  // TODO: getTierInfo() needs to be reimplemented to match enhanced.LoyaltyTier structure
  // The enhanced.LoyaltyTier class requires id, displayName, name, requiredPoints, benefits,
  // icon, color, description, and discountPercentage - incompatible with current implementation

  /// Get tier benefits
  Future<List<enhanced.TierBenefit>> getTierBenefits(String tierName) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.loyaltyConfig}/tiers/$tierName/benefits',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['benefits'] ?? [];
        return data.map((item) => enhanced.TierBenefit.fromJson(item)).toList();
      } else {
        throw Exception('Failed to get tier benefits: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error getting tier benefits: $e');
      return [];
    }
  }

  // ========================================================================
  // EARNING POINTS
  // ========================================================================

  /// Earn points for specific actions
  Future<enhanced.PointsEarnResult> earnPoints({
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
        return enhanced.PointsEarnResult.fromJson(response.data);
      } else {
        throw Exception('Failed to earn points: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error earning points: $e');
      rethrow;
    }
  }

  /// Get point earning opportunities
  Future<List<enhanced.EarningOpportunity>> getEarningOpportunities() async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.loyaltyConfig}/earning-opportunities',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['opportunities'] ?? [];
        return data.map((item) => enhanced.EarningOpportunity.fromJson(item)).toList();
      } else {
        throw Exception(
          'Failed to get earning opportunities: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error getting earning opportunities: $e');
      return [];
    }
  }

  // ========================================================================
  // CONFIGURATION & EXTRAS
  // ========================================================================

  /// Get loyalty program configuration
  Future<enhanced.LoyaltyConfig> getLoyaltyConfig() async {
    try {
      final response = await _apiClient.get(ApiConstants.loyaltyConfig);

      if (response.statusCode == 200) {
        return enhanced.LoyaltyConfig.fromJson(response.data);
      } else {
        throw Exception('Failed to get loyalty config: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error getting loyalty config: $e');
      rethrow;
    }
  }

  /// Share loyalty program with friends
  Future<enhanced.ShareResult> shareLoyaltyProgram({
    required String referralCode,
    required String platform,
  }) async {
    try {
      final response = await _apiClient.post(
        '${ApiConstants.loyaltyStatus}/share',
        data: {'referralCode': referralCode, 'platform': platform},
      );

      if (response.statusCode == 200) {
        return enhanced.ShareResult.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to share loyalty program: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error sharing loyalty program: $e');
      rethrow;
    }
  }

  /// Get personalized recommendations
  Future<List<enhanced.LoyaltyRecommendation>> getPersonalizedRecommendations() async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.loyaltyDashboard}/recommendations',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['recommendations'] ?? [];
        return data
            .map((item) => enhanced.LoyaltyRecommendation.fromJson(item))
            .toList();
      } else {
        throw Exception(
          'Failed to get recommendations: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error getting recommendations: $e');
      return [];
    }
  }

  /// Track special events and bonus points
  Future<List<enhanced.SpecialEvent>> getActiveSpecialEvents() async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.loyaltyConfig}/special-events',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['events'] ?? [];
        return data.map((item) => enhanced.SpecialEvent.fromJson(item)).toList();
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
        data: {'feedback': feedback, 'rating': rating, 'category': category},
      );

      return response.statusCode == 200;
    } catch (e) {
      if (kDebugMode) print('Error submitting feedback: $e');
      return false;
    }
  }

  // ========================================================================
  // ERROR HANDLING
  // ========================================================================

  String _handleDioError(DioException e) {
    if (e.response?.data != null && e.response?.data['error'] != null) {
      return e.response!.data['error'];
    }

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.badResponse:
        return 'Server error. Please try again later.';
      case DioExceptionType.connectionError:
        return 'Network error. Please check your internet connection.';
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }
}

// ========================================================================
// RESPONSE MODELS (keeping existing models intact)
// ========================================================================

/// Loyalty response models
class LoyaltyResponse {
  final base.LoyaltyProgram? loyaltyProgram;
  final bool success;
  final String? error;

  LoyaltyResponse({this.loyaltyProgram, required this.success, this.error});
}

class RewardsResponse {
  final List<base.LoyaltyReward> rewards;
  final bool success;
  final String? error;

  RewardsResponse({required this.rewards, required this.success, this.error});
}

class RedemptionResponse {
  final String? redemptionId;
  final int? pointsUsed;
  final int? remainingPoints;
  final String? rewardCode;
  final bool success;
  final String? error;

  RedemptionResponse({
    this.redemptionId,
    this.pointsUsed,
    this.remainingPoints,
    this.rewardCode,
    required this.success,
    this.error,
  });
}

class LoyaltyTransactionHistoryResponse {
  final List<base.LoyaltyTransaction> transactions;
  final LoyaltyPaginationInfo pagination;
  final bool success;
  final String? error;

  LoyaltyTransactionHistoryResponse({
    required this.transactions,
    required this.pagination,
    required this.success,
    this.error,
  });
}

// TODO: TierInfoResponse removed - needs reimplementation for enhanced.LoyaltyTier
// class TierInfoResponse {
//   final List<enhanced.LoyaltyTier> tiers;
//   final enhanced.LoyaltyTier currentTier;
//   final Map<String, dynamic> tierBenefits;
//   final bool success;
//   final String? error;
//   TierInfoResponse({
//     required this.tiers,
//     required this.currentTier,
//     required this.tierBenefits,
//     required this.success,
//     this.error,
//   });
// }

/// Pagination info model for loyalty
class LoyaltyPaginationInfo {
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  LoyaltyPaginationInfo({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory LoyaltyPaginationInfo.fromJson(Map<String, dynamic> json) {
    return LoyaltyPaginationInfo(
      total: json['total'] ?? 0,
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 20,
      totalPages: json['totalPages'] ?? 0,
    );
  }

  factory LoyaltyPaginationInfo.empty() {
    return LoyaltyPaginationInfo(total: 0, page: 1, limit: 20, totalPages: 0);
  }
}

/// Provider for unified loyalty service
final unifiedLoyaltyServiceProvider = Provider<UnifiedLoyaltyService>((ref) {
  return UnifiedLoyaltyService(ApiClient());
});
