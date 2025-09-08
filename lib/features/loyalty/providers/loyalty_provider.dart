import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/loyalty_service.dart';
import '../domain/models/loyalty.dart';

/// Loyalty state
class LoyaltyState {
  final LoyaltyProgram? loyaltyProgram;
  final List<LoyaltyReward> availableRewards;
  final List<LoyaltyTransaction> transactions;
  final bool isLoading;
  final bool isLoadingRewards;
  final bool isLoadingTransactions;
  final String? error;
  final LoyaltyPaginationInfo? transactionsPagination;

  const LoyaltyState({
    this.loyaltyProgram,
    this.availableRewards = const [],
    this.transactions = const [],
    this.isLoading = false,
    this.isLoadingRewards = false,
    this.isLoadingTransactions = false,
    this.error,
    this.transactionsPagination,
  });

  LoyaltyState copyWith({
    LoyaltyProgram? loyaltyProgram,
    List<LoyaltyReward>? availableRewards,
    List<LoyaltyTransaction>? transactions,
    bool? isLoading,
    bool? isLoadingRewards,
    bool? isLoadingTransactions,
    String? error,
    LoyaltyPaginationInfo? transactionsPagination,
  }) {
    return LoyaltyState(
      loyaltyProgram: loyaltyProgram ?? this.loyaltyProgram,
      availableRewards: availableRewards ?? this.availableRewards,
      transactions: transactions ?? this.transactions,
      isLoading: isLoading ?? this.isLoading,
      isLoadingRewards: isLoadingRewards ?? this.isLoadingRewards,
      isLoadingTransactions: isLoadingTransactions ?? this.isLoadingTransactions,
      error: error,
      transactionsPagination: transactionsPagination ?? this.transactionsPagination,
    );
  }

  bool get hasLoyaltyProgram => loyaltyProgram != null;
  int get totalPoints => loyaltyProgram?.totalPoints ?? 0;
  int get availablePoints => loyaltyProgram?.availablePoints ?? 0;
  LoyaltyTier get currentTier => loyaltyProgram?.currentTier ?? LoyaltyTier.bronze;
  int get pointsToNextTier => loyaltyProgram?.pointsToNextTier ?? 0;
  double get tierProgress => loyaltyProgram?.tierProgress ?? 0.0;
}

/// Loyalty notifier
class LoyaltyNotifier extends StateNotifier<LoyaltyState> {
  final LoyaltyService _loyaltyService;

  LoyaltyNotifier(this._loyaltyService) : super(const LoyaltyState()) {
    loadLoyaltyProgram();
  }

  /// Load loyalty program information
  Future<void> loadLoyaltyProgram() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _loyaltyService.getLoyaltyProgram();

      if (response.success && response.loyaltyProgram != null) {
        state = state.copyWith(
          loyaltyProgram: response.loyaltyProgram,
          isLoading: false,
          error: null,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.error ?? 'Failed to load loyalty program',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  /// Load available rewards
  Future<void> loadAvailableRewards({
    RewardType? type,
    int? maxPointsCost,
  }) async {
    state = state.copyWith(isLoadingRewards: true, error: null);

    try {
      final response = await _loyaltyService.getAvailableRewards(
        type: type,
        maxPointsCost: maxPointsCost,
      );

      if (response.success) {
        state = state.copyWith(
          availableRewards: response.rewards,
          isLoadingRewards: false,
          error: null,
        );
      } else {
        state = state.copyWith(
          isLoadingRewards: false,
          error: response.error ?? 'Failed to load rewards',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoadingRewards: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  /// Redeem points for reward
  Future<bool> redeemPoints(LoyaltyRedemptionRequest request) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _loyaltyService.redeemPoints(request);

      if (response.success) {
        // Reload loyalty program to get updated points
        await loadLoyaltyProgram();
        return true;
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.error ?? 'Failed to redeem points',
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred',
      );
      return false;
    }
  }

  /// Load loyalty transaction history
  Future<void> loadTransactionHistory({
    bool loadMore = false,
    LoyaltyTransactionType? type,
  }) async {
    if (!loadMore) {
      state = state.copyWith(
        isLoadingTransactions: true,
        transactions: [],
        error: null,
      );
    }

    try {
      final page = loadMore ? (state.transactionsPagination?.page ?? 0) + 1 : 1;
      
      final response = await _loyaltyService.getLoyaltyTransactionHistory(
        page: page,
        type: type,
      );

      if (response.success) {
        final newTransactions = loadMore 
            ? [...state.transactions, ...response.transactions]
            : response.transactions;

        state = state.copyWith(
          transactions: newTransactions,
          transactionsPagination: response.pagination,
          isLoadingTransactions: false,
          error: null,
        );
      } else {
        state = state.copyWith(
          isLoadingTransactions: false,
          error: response.error ?? 'Failed to load transaction history',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoadingTransactions: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  /// Refresh all loyalty data
  Future<void> refresh() async {
    await Future.wait([
      loadLoyaltyProgram(),
      loadAvailableRewards(),
      loadTransactionHistory(),
    ]);
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// Loyalty provider
final loyaltyProvider = StateNotifierProvider<LoyaltyNotifier, LoyaltyState>((ref) {
  final loyaltyService = ref.watch(loyaltyServiceProvider);
  return LoyaltyNotifier(loyaltyService);
});

/// Rewards filter state
class RewardsFilterState {
  final RewardType? selectedType;
  final int? maxPointsCost;
  final bool showOnlyAffordable;

  const RewardsFilterState({
    this.selectedType,
    this.maxPointsCost,
    this.showOnlyAffordable = true,
  });

  RewardsFilterState copyWith({
    RewardType? selectedType,
    int? maxPointsCost,
    bool? showOnlyAffordable,
  }) {
    return RewardsFilterState(
      selectedType: selectedType ?? this.selectedType,
      maxPointsCost: maxPointsCost ?? this.maxPointsCost,
      showOnlyAffordable: showOnlyAffordable ?? this.showOnlyAffordable,
    );
  }
}

/// Rewards filter notifier
class RewardsFilterNotifier extends StateNotifier<RewardsFilterState> {
  RewardsFilterNotifier() : super(const RewardsFilterState());

  void setType(RewardType? type) {
    state = state.copyWith(selectedType: type);
  }

  void setMaxPointsCost(int? maxCost) {
    state = state.copyWith(maxPointsCost: maxCost);
  }

  void setShowOnlyAffordable(bool showOnlyAffordable) {
    state = state.copyWith(showOnlyAffordable: showOnlyAffordable);
  }

  void reset() {
    state = const RewardsFilterState();
  }
}

/// Rewards filter provider
final rewardsFilterProvider = StateNotifierProvider<RewardsFilterNotifier, RewardsFilterState>((ref) {
  return RewardsFilterNotifier();
});

/// Filtered rewards provider
final filteredRewardsProvider = Provider<List<LoyaltyReward>>((ref) {
  final loyaltyState = ref.watch(loyaltyProvider);
  final filterState = ref.watch(rewardsFilterProvider);
  
  var rewards = loyaltyState.availableRewards;
  
  // Filter by type
  if (filterState.selectedType != null) {
    rewards = rewards.where((reward) => reward.type == filterState.selectedType).toList();
  }
  
  // Filter by max points cost
  if (filterState.maxPointsCost != null) {
    rewards = rewards.where((reward) => reward.pointsCost <= filterState.maxPointsCost!).toList();
  }
  
  // Filter by affordability
  if (filterState.showOnlyAffordable) {
    final availablePoints = loyaltyState.availablePoints;
    rewards = rewards.where((reward) => reward.pointsCost <= availablePoints).toList();
  }
  
  // Sort by points cost (ascending)
  rewards.sort((a, b) => a.pointsCost.compareTo(b.pointsCost));
  
  return rewards;
});