/// Loyalty provider for state management
library;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/services/api/api_client.dart';
import 'package:eatfast_mobile/shared/services/loyalty/data/unified_loyalty_service.dart';
import 'package:eatfast_mobile/shared/services/loyalty/domain/models/loyalty.dart' as base;
import 'package:eatfast_mobile/shared/models/loyalty_models.dart';
import 'package:eatfast_mobile/shared/services/loyalty/domain/models/rewards_filter_state.dart';

/// Loyalty service provider
final loyaltyServiceProvider = Provider<UnifiedLoyaltyService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return UnifiedLoyaltyService(apiClient);
});

/// Rewards filter state provider
final rewardsFilterProvider = StateNotifierProvider<RewardsFilterNotifier, RewardsFilterState>(
  (ref) => RewardsFilterNotifier(),
);

/// Rewards filter notifier
class RewardsFilterNotifier extends StateNotifier<RewardsFilterState> {
  RewardsFilterNotifier() : super(const RewardsFilterState());

  void setCategory(String? category) {
    state = state.copyWith(category: category);
  }

  void setMinPoints(int? minPoints) {
    state = state.copyWith(minPoints: minPoints);
  }

  void setMaxPoints(int? maxPoints) {
    state = state.copyWith(maxPoints: maxPoints);
  }

  void setAvailableOnly(bool availableOnly) {
    state = state.copyWith(availableOnly: availableOnly);
  }

  void setSortBy(String? sortBy) {
    state = state.copyWith(sortBy: sortBy);
  }

  void reset() {
    state = state.clear();
  }
}

/// Filtered rewards provider
final filteredRewardsProvider = Provider<List<LoyaltyReward>>((ref) {
  final loyaltyState = ref.watch(loyaltyProvider);
  final filterState = ref.watch(rewardsFilterProvider);

  List<LoyaltyReward> rewards = loyaltyState.availableRewards;

  // Filter by category
  if (filterState.category != null) {
    rewards = rewards.where((r) => r.type.toString().contains(filterState.category!)).toList();
  }

  // Filter by points range
  if (filterState.minPoints != null) {
    rewards = rewards.where((r) => r.pointsCost >= filterState.minPoints!).toList();
  }
  if (filterState.maxPoints != null) {
    rewards = rewards.where((r) => r.pointsCost <= filterState.maxPoints!).toList();
  }

  // Filter by availability
  if (filterState.availableOnly) {
    final availablePoints = loyaltyState.availablePoints;
    rewards = rewards.where((r) => r.pointsCost <= availablePoints).toList();
  }

  // Sort rewards
  if (filterState.sortBy != null) {
    switch (filterState.sortBy) {
      case 'points_asc':
        rewards.sort((a, b) => a.pointsCost.compareTo(b.pointsCost));
        break;
      case 'points_desc':
        rewards.sort((a, b) => b.pointsCost.compareTo(a.pointsCost));
        break;
      case 'name':
        rewards.sort((a, b) => a.name.compareTo(b.name));
        break;
    }
  }

  return rewards;
});

/// Loyalty provider - manages loyalty program state
final loyaltyProvider = StateNotifierProvider<LoyaltyNotifier, LoyaltyState>(
  (ref) => LoyaltyNotifier(ref.read(loyaltyServiceProvider)),
);

/// Loyalty notifier
class LoyaltyNotifier extends StateNotifier<LoyaltyState> {
  final UnifiedLoyaltyService _loyaltyService;

  LoyaltyNotifier(this._loyaltyService)
    : super(
        const LoyaltyState(
          currentPoints: 0,
          currentTier: LoyaltyTier.bronze,
          pointsToNextTier: 1000,
          transactions: [],
          availableRewards: [],
        ),
      ) {
    loadLoyaltyData();
  }

  Future<void> loadLoyaltyData() async {
    state = state.copyWith(isLoading: true);

    try {
      final response = await _loyaltyService.getLoyaltyProgram();
      if (response.success && response.loyaltyProgram != null) {
        final base.LoyaltyProgram program = response.loyaltyProgram!;
        final rewardsResponse = await _loyaltyService.getAvailableRewards();

        state = state.copyWith(
          currentPoints: program.availablePoints,
          totalPoints: program.totalPoints,
          availablePoints: program.availablePoints,
          currentTier: program.currentTier,
          pointsToNextTier: program.pointsToNextTier,
          tierProgress: program.tierProgress,
          transactions: program.recentTransactions.cast<LoyaltyTransaction>(),
          availableRewards: rewardsResponse.rewards.cast<LoyaltyReward>(),
          isLoading: false,
          error: null,
        );
      } else {
        state = state.copyWith(isLoading: false, error: response.error);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  Future<void> refresh() async {
    await loadLoyaltyData();
  }

  Future<void> loadTransactionHistory({int page = 1, int limit = 20}) async {
    state = state.copyWith(isLoadingTransactions: true);

    try {
      final response = await _loyaltyService.getLoyaltyTransactionHistory(
        page: page,
        limit: limit,
      );

      state = state.copyWith(
        transactions: response.transactions as List<LoyaltyTransaction>,
        transactionsPagination: {
          'page': response.pagination.page,
          'limit': response.pagination.limit,
          'total': response.pagination.total,
          'totalPages': response.pagination.totalPages,
          'hasMore': response.pagination.page < response.pagination.totalPages,
        },
        isLoadingTransactions: false,
      );
    } catch (error) {
      state = state.copyWith(isLoadingTransactions: false);
    }
  }

  Future<void> loadAvailableRewards() async {
    state = state.copyWith(isLoadingRewards: true);

    try {
      final response = await _loyaltyService.getAvailableRewards();
      state = state.copyWith(
        availableRewards: response.rewards.cast<LoyaltyReward>(),
        isLoadingRewards: false,
      );
    } catch (error) {
      state = state.copyWith(isLoadingRewards: false);
    }
  }

  Future<void> redeemPoints(LoyaltyRedemptionRequest request) async {
    state = state.copyWith(isLoading: true);

    try {
      final baseRequest = base.LoyaltyRedemptionRequest(rewardId: request.rewardId);
      final response = await _loyaltyService.redeemPoints(baseRequest);

      if (response.success) {
        // Refresh loyalty data after redemption
        await loadLoyaltyData();
      } else {
        state = state.copyWith(isLoading: false, error: response.error);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  Future<void> redeemReward(String rewardId) async {
    try {
      final baseRequest = base.LoyaltyRedemptionRequest(rewardId: rewardId);
      await _loyaltyService.redeemPoints(baseRequest);
      await loadLoyaltyData(); // Refresh data after redemption
    } catch (error) {
      state = state.copyWith(error: error.toString());
      rethrow;
    }
  }

  Future<void> refreshPoints() async {
    try {
      final response = await _loyaltyService.getLoyaltyProgram();
      if (response.success && response.loyaltyProgram != null) {
        final base.LoyaltyProgram program = response.loyaltyProgram!;
        state = state.copyWith(
          currentPoints: program.availablePoints,
          currentTier: program.currentTier,
          pointsToNextTier: program.pointsToNextTier,
        );
      }
    } catch (error) {
      state = state.copyWith(error: error.toString());
    }
  }
}
