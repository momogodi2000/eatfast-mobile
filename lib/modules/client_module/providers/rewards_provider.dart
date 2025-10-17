import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/models/loyalty_models.dart';
import 'package:eatfast_mobile/shared/services/loyalty/providers/loyalty_provider.dart';

class RewardsFilterState {
  final RewardType? type;
  final int? maxPointsCost;
  final bool showOnlyAffordable;

  const RewardsFilterState({
    this.type,
    this.maxPointsCost,
    this.showOnlyAffordable = false,
  });

  RewardsFilterState copyWith({
    RewardType? type,
    int? maxPointsCost,
    bool? showOnlyAffordable,
  }) {
    return RewardsFilterState(
      type: type ?? this.type,
      maxPointsCost: maxPointsCost ?? this.maxPointsCost,
      showOnlyAffordable: showOnlyAffordable ?? this.showOnlyAffordable,
    );
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

  return loyaltyState.availableRewards.where((reward) {
    if (filterState.type != null && reward.type != filterState.type) {
      return false;
    }
    if (filterState.maxPointsCost != null && reward.pointsCost > filterState.maxPointsCost!) {
      return false;
    }
    if (filterState.showOnlyAffordable && reward.pointsCost > loyaltyState.availablePoints) {
      return false;
    }
    return true;
  }).toList();
});

class RewardsFilterNotifier extends StateNotifier<RewardsFilterState> {
  RewardsFilterNotifier() : super(const RewardsFilterState());

  void setType(RewardType? type) {
    state = state.copyWith(type: type);
  }

  void setMaxPointsCost(int? maxPointsCost) {
    state = state.copyWith(maxPointsCost: maxPointsCost);
  }

  void setShowOnlyAffordable(bool showOnlyAffordable) {
    state = state.copyWith(showOnlyAffordable: showOnlyAffordable);
  }

  void reset() {
    state = const RewardsFilterState();
  }
}
