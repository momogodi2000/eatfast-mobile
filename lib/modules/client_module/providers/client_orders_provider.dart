import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/services/orders/domain/models/order.dart';

/// Client orders state
class ClientOrdersState {
  final List<Order> activeOrders;
  final List<Order> pastOrders;
  final bool isLoading;
  final String? error;

  const ClientOrdersState({
    this.activeOrders = const [],
    this.pastOrders = const [],
    this.isLoading = false,
    this.error,
  });

  ClientOrdersState copyWith({
    List<Order>? activeOrders,
    List<Order>? pastOrders,
    bool? isLoading,
    String? error,
  }) {
    return ClientOrdersState(
      activeOrders: activeOrders ?? this.activeOrders,
      pastOrders: pastOrders ?? this.pastOrders,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  List<Order> get allOrders => [...activeOrders, ...pastOrders];
  int get activeOrdersCount => activeOrders.length;
  int get totalOrdersCount => allOrders.length;
}

/// Client orders notifier
class ClientOrdersNotifier extends StateNotifier<ClientOrdersState> {
  ClientOrdersNotifier() : super(const ClientOrdersState());

  Future<void> loadOrders() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      // TODO: Implement API call to load client orders
      await Future.delayed(const Duration(seconds: 1));

      // For now, return empty lists
      state = state.copyWith(
        isLoading: false,
        activeOrders: [],
        pastOrders: [],
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load orders: $e',
      );
    }
  }

  Future<void> refreshOrders() async {
    await loadOrders();
  }

  Future<void> cancelOrder(String orderId) async {
    try {
      // TODO: Implement API call to cancel order
      final updatedActive = state.activeOrders
          .where((order) => order.id != orderId)
          .toList();
      state = state.copyWith(activeOrders: updatedActive);
    } catch (e) {
      state = state.copyWith(error: 'Failed to cancel order: $e');
    }
  }
}

/// Client orders provider
final clientOrdersProvider =
    StateNotifierProvider<ClientOrdersNotifier, ClientOrdersState>((ref) {
  final notifier = ClientOrdersNotifier();
  notifier.loadOrders();
  return notifier;
});
