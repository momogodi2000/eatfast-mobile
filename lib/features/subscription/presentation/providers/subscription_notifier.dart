import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/subscription.dart';

class SubscriptionNotifier extends StateNotifier<AsyncValue<UserSubscription?>> {
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
        plan: plan,
        status: SubscriptionStatus.active,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 30)),
        nextBillingDate: DateTime.now().add(const Duration(days: 30)),
        currentUsage: SubscriptionUsage(
          ordersUsed: 0,
          deliveriesUsed: 0,
          storageUsed: 0.0,
          apiCallsUsed: 0,
          lastUpdated: DateTime.now(),
        ),
        billingHistory: [],
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
        cancelledAt: DateTime.now(),
        cancellationReason: reason,
      );

      state = AsyncValue.data(updatedSubscription);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final subscriptionProvider = StateNotifierProvider<SubscriptionNotifier, AsyncValue<UserSubscription?>>((ref) {
  return SubscriptionNotifier();
});