import 'package:eatfast_mobile/shared/services/subscription/domain/models/subscription.dart';
import 'package:eatfast_mobile/shared/services/api/api_client.dart';

class SubscriptionRepository {
  final ApiClient _apiClient = ApiClient();

  Future<List<SubscriptionPlan>> getAvailablePlans() async {
    try {
      final response = await _apiClient.get('/subscriptions/plans');
      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => SubscriptionPlan.fromJson(json)).toList();
    } catch (error) {
      throw Exception('Failed to load subscription plans: $error');
    }
  }

  Future<UserSubscription?> getUserSubscription() async {
    try {
      final response = await _apiClient.get('/subscriptions/user');
      if (response.data['data'] != null) {
        return UserSubscription.fromJson(response.data['data']);
      }
      return null;
    } catch (error) {
      throw Exception('Failed to load user subscription: $error');
    }
  }

  Future<UserSubscription> subscribeToPlan(String planId) async {
    try {
      final response = await _apiClient.post(
        '/subscriptions/subscribe',
        data: {'planId': planId},
      );
      return UserSubscription.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to subscribe to plan: $error');
    }
  }

  Future<UserSubscription> upgradePlan(String newPlanId) async {
    try {
      final response = await _apiClient.post(
        '/subscriptions/upgrade',
        data: {'newPlanId': newPlanId},
      );
      return UserSubscription.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to upgrade plan: $error');
    }
  }

  Future<UserSubscription> downgradePlan(String newPlanId) async {
    try {
      final response = await _apiClient.post(
        '/subscriptions/downgrade',
        data: {'newPlanId': newPlanId},
      );
      return UserSubscription.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to downgrade plan: $error');
    }
  }

  Future<void> cancelSubscription(String reason) async {
    try {
      await _apiClient.post('/subscriptions/cancel', data: {'reason': reason});
    } catch (error) {
      throw Exception('Failed to cancel subscription: $error');
    }
  }

  Future<UserSubscription> pauseSubscription() async {
    try {
      final response = await _apiClient.post('/subscriptions/pause');
      return UserSubscription.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to pause subscription: $error');
    }
  }

  Future<UserSubscription> renewSubscription() async {
    try {
      final response = await _apiClient.post('/subscriptions/renew');
      return UserSubscription.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to renew subscription: $error');
    }
  }

  Future<SubscriptionUsage> getUsageStats() async {
    try {
      final response = await _apiClient.get('/subscriptions/usage');
      return SubscriptionUsage.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to load usage stats: $error');
    }
  }

  Future<List<BillingHistory>> getBillingHistory() async {
    try {
      final response = await _apiClient.get('/subscriptions/billing-history');
      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => BillingHistory.fromJson(json)).toList();
    } catch (error) {
      throw Exception('Failed to load billing history: $error');
    }
  }
}
