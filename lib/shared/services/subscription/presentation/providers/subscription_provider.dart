import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/services/subscription/domain/models/subscription.dart';
import 'package:eatfast_mobile/shared/services/subscription/data/repositories/subscription_repository.dart';

final subscriptionRepositoryProvider = Provider<SubscriptionRepository>((ref) {
  return SubscriptionRepository();
});

final availableSubscriptionPlansProvider =
    FutureProvider<List<SubscriptionPlan>>((ref) async {
      final repository = ref.watch(subscriptionRepositoryProvider);
      return repository.getAvailablePlans();
    });

final userSubscriptionProvider = FutureProvider<UserSubscription?>((ref) async {
  final repository = ref.watch(subscriptionRepositoryProvider);
  return repository.getUserSubscription();
});

final subscriptionProvider =
    StateNotifierProvider<SubscriptionNotifier, AsyncValue<UserSubscription?>>((
      ref,
    ) {
      final repository = ref.watch(subscriptionRepositoryProvider);
      return SubscriptionNotifier(repository);
    });

class SubscriptionNotifier
    extends StateNotifier<AsyncValue<UserSubscription?>> {
  final SubscriptionRepository _repository;

  SubscriptionNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadUserSubscription();
  }

  Future<void> loadUserSubscription() async {
    try {
      state = const AsyncValue.loading();
      final subscription = await _repository.getUserSubscription();
      state = AsyncValue.data(subscription);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> subscribeToPlan(String planId) async {
    try {
      await _repository.subscribeToPlan(planId);
      await loadUserSubscription();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> upgradePlan(String newPlanId) async {
    try {
      await _repository.upgradePlan(newPlanId);
      await loadUserSubscription();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> downgradePlan(String newPlanId) async {
    try {
      await _repository.downgradePlan(newPlanId);
      await loadUserSubscription();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> cancelSubscription(String reason) async {
    try {
      await _repository.cancelSubscription(reason);
      await loadUserSubscription();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> renewSubscription() async {
    try {
      await _repository.renewSubscription();
      await loadUserSubscription();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> pauseSubscription() async {
    try {
      await _repository.pauseSubscription();
      await loadUserSubscription();
    } catch (error) {
      rethrow;
    }
  }
}
