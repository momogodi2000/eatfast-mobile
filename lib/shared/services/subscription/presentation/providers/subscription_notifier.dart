import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/services/subscription/domain/models/subscription.dart';

class SubscriptionNotifier
    extends StateNotifier<AsyncValue<UserSubscription?>> {
  SubscriptionNotifier() : super(const AsyncValue.loading());

  Future<void> loadSubscription() async {
    try {
      state = const AsyncValue.loading();
      // TODO: Implement actual API call
      await Future.delayed(const Duration(seconds: 1));
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> subscribeToplan(SubscriptionPlan plan) async {
    try {
      state = const AsyncValue.loading();
      // TODO: Implement actual subscription logic
      await Future.delayed(const Duration(seconds: 2));

      final subscription = UserSubscription(
        id: 'sub_123',
        userId: 'user_123',
        planId: plan.id,
        plan: plan,
        status: SubscriptionStatus.active,
        billingInterval: BillingInterval.fromString(plan.billingCycle),
        amount: plan.price,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 30)),
        nextBillingDate: DateTime.now().add(const Duration(days: 30)),
        autoRenew: true,
        ordersLimit: plan.maxOrders,
        ordersUsed: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      state = AsyncValue.data(subscription);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> pauseSubscription() async {
    final currentSubscription = state.value;
    if (currentSubscription == null) return;

    try {
      state = const AsyncValue.loading();
      // TODO: Implement actual pause logic
      await Future.delayed(const Duration(seconds: 1));

      final updatedSubscription = currentSubscription.copyWith(
        status: SubscriptionStatus.suspended,
      );

      state = AsyncValue.data(updatedSubscription);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> cancelSubscription(String reason) async {
    final currentSubscription = state.value;
    if (currentSubscription == null) return;

    try {
      state = const AsyncValue.loading();
      // TODO: Implement actual cancellation logic
      await Future.delayed(const Duration(seconds: 1));

      final updatedSubscription = currentSubscription.copyWith(
        status: SubscriptionStatus.cancelled,
        updatedAt: DateTime.now(),
      );

      state = AsyncValue.data(updatedSubscription);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final subscriptionProvider =
    StateNotifierProvider<SubscriptionNotifier, AsyncValue<UserSubscription?>>((
      ref,
    ) {
      return SubscriptionNotifier();
    });
