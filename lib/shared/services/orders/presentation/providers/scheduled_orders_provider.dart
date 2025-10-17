import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/services/orders/domain/models/scheduled_order.dart';
import 'package:eatfast_mobile/shared/services/orders/data/repositories/scheduled_orders_repository.dart';

final scheduledOrdersRepositoryProvider = Provider<ScheduledOrdersRepository>((ref) {
  return ScheduledOrdersRepository();
});

final scheduledOrdersProvider = FutureProvider<List<ScheduledOrder>>((ref) async {
  final repository = ref.watch(scheduledOrdersRepositoryProvider);
  return repository.getScheduledOrders();
});

final scheduledOrdersNotifierProvider = StateNotifierProvider<ScheduledOrdersNotifier, AsyncValue<List<ScheduledOrder>>>((ref) {
  final repository = ref.watch(scheduledOrdersRepositoryProvider);
  return ScheduledOrdersNotifier(repository);
});

class ScheduledOrdersNotifier extends StateNotifier<AsyncValue<List<ScheduledOrder>>> {
  final ScheduledOrdersRepository _repository;

  ScheduledOrdersNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadScheduledOrders();
  }

  Future<void> loadScheduledOrders() async {
    try {
      state = const AsyncValue.loading();
      final orders = await _repository.getScheduledOrders();
      state = AsyncValue.data(orders);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> createScheduledOrder(CreateScheduledOrderRequest request) async {
    try {
      await _repository.createScheduledOrder(request);
      await loadScheduledOrders();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateScheduledOrder(String orderId, CreateScheduledOrderRequest request) async {
    try {
      await _repository.updateScheduledOrder(orderId, request);
      await loadScheduledOrders();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> cancelScheduledOrder(String orderId) async {
    try {
      await _repository.cancelScheduledOrder(orderId);
      await loadScheduledOrders();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> toggleRecurringOrder(String orderId) async {
    try {
      await _repository.toggleRecurringOrder(orderId);
      await loadScheduledOrders();
    } catch (error) {
      rethrow;
    }
  }
}
