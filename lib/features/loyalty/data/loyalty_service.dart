import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/api/api_client.dart';
import '../../../core/constants/api_constants.dart';
import '../domain/models/loyalty.dart';

/// Loyalty service for handling loyalty program operations
class LoyaltyService {
  final ApiClient _apiClient;

  LoyaltyService(this._apiClient);

  /// Get loyalty program information
  Future<LoyaltyResponse> getLoyaltyProgram() async {
    try {
      final response = await _apiClient.get(ApiConstants.clientLoyalty);

      if (response.statusCode == 200) {
        final loyaltyProgram = LoyaltyProgram.fromJson(response.data['data']);
        return LoyaltyResponse(
          loyaltyProgram: loyaltyProgram,
          success: true,
        );
      } else {
        return LoyaltyResponse(
          success: false,
          error: response.data['error'] ?? 'Failed to load loyalty program',
        );
      }
    } on DioException catch (e) {
      return LoyaltyResponse(
        success: false,
        error: _handleDioError(e),
      );
    } catch (e) {
      return LoyaltyResponse(
        success: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  /// Get available rewards
  Future<RewardsResponse> getAvailableRewards({
    RewardType? type,
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
            .map((json) => LoyaltyReward.fromJson(json))
            .toList();

        return RewardsResponse(
          rewards: rewards,
          success: true,
        );
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
  Future<RedemptionResponse> redeemPoints(LoyaltyRedemptionRequest request) async {
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
      return RedemptionResponse(
        success: false,
        error: _handleDioError(e),
      );
    } catch (e) {
      return RedemptionResponse(
        success: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  /// Get loyalty transaction history
  Future<LoyaltyTransactionHistoryResponse> getLoyaltyTransactionHistory({
    int page = 1,
    int limit = 20,
    LoyaltyTransactionType? type,
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
            .map((json) => LoyaltyTransaction.fromJson(json))
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

  /// Get tier information and benefits
  Future<TierInfoResponse> getTierInfo() async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.clientLoyalty}/tiers',
      );

      if (response.statusCode == 200) {
        final data = response.data['data'];
        return TierInfoResponse(
          tiers: LoyaltyTier.values,
          currentTier: LoyaltyTier.fromString(data['currentTier']),
          tierBenefits: data['tierBenefits'] ?? {},
          success: true,
        );
      } else {
        return TierInfoResponse(
          tiers: LoyaltyTier.values,
          currentTier: LoyaltyTier.bronze,
          tierBenefits: {},
          success: false,
          error: response.data['error'] ?? 'Failed to load tier information',
        );
      }
    } on DioException catch (e) {
      return TierInfoResponse(
        tiers: LoyaltyTier.values,
        currentTier: LoyaltyTier.bronze,
        tierBenefits: {},
        success: false,
        error: _handleDioError(e),
      );
    } catch (e) {
      return TierInfoResponse(
        tiers: LoyaltyTier.values,
        currentTier: LoyaltyTier.bronze,
        tierBenefits: {},
        success: false,
        error: 'An unexpected error occurred',
      );
    }
  }

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

/// Loyalty response models
class LoyaltyResponse {
  final LoyaltyProgram? loyaltyProgram;
  final bool success;
  final String? error;

  LoyaltyResponse({
    this.loyaltyProgram,
    required this.success,
    this.error,
  });
}

class RewardsResponse {
  final List<LoyaltyReward> rewards;
  final bool success;
  final String? error;

  RewardsResponse({
    required this.rewards,
    required this.success,
    this.error,
  });
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
  final List<LoyaltyTransaction> transactions;
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

class TierInfoResponse {
  final List<LoyaltyTier> tiers;
  final LoyaltyTier currentTier;
  final Map<String, dynamic> tierBenefits;
  final bool success;
  final String? error;

  TierInfoResponse({
    required this.tiers,
    required this.currentTier,
    required this.tierBenefits,
    required this.success,
    this.error,
  });
}

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
    return LoyaltyPaginationInfo(
      total: 0,
      page: 1,
      limit: 20,
      totalPages: 0,
    );
  }
}

/// Provider for loyalty service
final loyaltyServiceProvider = Provider<LoyaltyService>((ref) {
  return LoyaltyService(ApiClient());
});