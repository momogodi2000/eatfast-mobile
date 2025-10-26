import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/models/loyalty_models.dart';
import 'package:eatfast_mobile/shared/services/loyalty/domain/models/rewards_filter_state.dart';
import 'package:eatfast_mobile/shared/services/loyalty/providers/loyalty_provider.dart';

/// Provider for rewards filter state
final rewardsFilterProvider = StateProvider<RewardsFilterState>((ref) {
  return const RewardsFilterState();
});

/// Provider for filtered rewards based on current filter state
final filteredRewardsProvider = Provider<List<LoyaltyReward>>((ref) {
  final loyaltyState = ref.watch(loyaltyProvider);
  final filter = ref.watch(rewardsFilterProvider);

  var rewards = loyaltyState.availableRewards;

  // Apply category filter
  if (filter.category != null) {
    rewards = rewards.where((reward) {
      return reward.type.toString() == filter.category;
    }).toList();
  }

  // Apply min points filter
  if (filter.minPoints != null) {
    rewards = rewards.where((reward) {
      return reward.pointsCost >= filter.minPoints!;
    }).toList();
  }

  // Apply max points filter
  if (filter.maxPoints != null) {
    rewards = rewards.where((reward) {
      return reward.pointsCost <= filter.maxPoints!;
    }).toList();
  }

  // Apply available only filter
  if (filter.availableOnly) {
    rewards = rewards.where((reward) => reward.isActive).toList();
  }

  // Apply sorting
  if (filter.sortBy != null) {
    switch (filter.sortBy) {
      case 'points_asc':
        rewards.sort((a, b) => a.pointsCost.compareTo(b.pointsCost));
        break;
      case 'points_desc':
        rewards.sort((a, b) => b.pointsCost.compareTo(a.pointsCost));
        break;
      case 'name_asc':
        rewards.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'name_desc':
        rewards.sort((a, b) => b.title.compareTo(a.title));
        break;
    }
  }

  return rewards;
});
