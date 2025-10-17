import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/services/orders/domain/models/scheduled_order.dart';
import 'package:eatfast_mobile/shared/models/restaurant_models.dart';

final scheduledOrdersNotifierProvider =
    StateNotifierProvider<ScheduledOrdersNotifier, List<ScheduledOrder>>((ref) {
  return ScheduledOrdersNotifier();
});

class ScheduledOrdersNotifier extends StateNotifier<List<ScheduledOrder>> {
  ScheduledOrdersNotifier() : super([]);

  Future<void> createScheduledOrder(CreateScheduledOrderRequest request) async {
    // Convert request to ScheduledOrder with generated values
    final order = _createOrderFromRequest(request);
    // Add the order to the list
    state = [...state, order];
  }

  Future<void> updateScheduledOrder(String orderId, CreateScheduledOrderRequest request) async {
    // Find existing order and update it
    final existingOrder = state.firstWhere((o) => o.id == orderId);
    final updatedOrder = _updateOrderFromRequest(existingOrder, request);

    // Update the order in the list
    state = [
      for (final order in state)
        if (order.id == orderId) updatedOrder else order
    ];
  }

  Future<void> deleteScheduledOrder(String orderId) async {
    // Remove the order from the list
    state = state.where((order) => order.id != orderId).toList();
  }

  Future<void> loadScheduledOrders() async {
    // Implement loading logic
  }

  ScheduledOrder _createOrderFromRequest(CreateScheduledOrderRequest request) {
    // Calculate totals with null safety
    final subtotal = request.items.fold<double>(0.0, (sum, item) {
      final price = item.price ?? 0.0;
      final quantity = item.quantity ?? 1;
      return sum + (price * quantity);
    });
    final deliveryFee = 2.5; // Default delivery fee
    final total = subtotal + deliveryFee;

    return ScheduledOrder(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: 'current_user', // TODO: Get from auth
      restaurantId: request.restaurantId,
      restaurant: Restaurant(
        id: request.restaurantId,
        name: 'Restaurant', // TODO: Get from cart or API
        description: '',
        imageUrl: '',
        rating: 0.0,
        reviewCount: 0,
        cuisine: '',
        deliveryFee: deliveryFee,
        deliveryTime: 30,
      ),
      items: request.items,
      subtotal: subtotal,
      deliveryFee: deliveryFee,
      total: total,
      currency: 'EUR',
      scheduledDate: request.scheduledDate,
      status: ScheduledOrderStatus.scheduled,
      deliveryAddress: request.deliveryAddress,
      deliveryInstructions: request.deliveryInstructions,
      isRecurring: request.isRecurring,
      recurrencePattern: request.recurrencePattern,
      paymentMethodId: request.paymentMethodId,
      maxExecutions: request.maxExecutions,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  ScheduledOrder _updateOrderFromRequest(ScheduledOrder existing, CreateScheduledOrderRequest request) {
    // Calculate new totals with null safety
    final subtotal = request.items.fold<double>(0.0, (sum, item) {
      final price = item.price ?? 0.0;
      final quantity = item.quantity ?? 1;
      return sum + (price * quantity);
    });
    final total = subtotal + existing.deliveryFee;

    return existing.copyWith(
      items: request.items,
      subtotal: subtotal,
      total: total,
      scheduledDate: request.scheduledDate,
      deliveryAddress: request.deliveryAddress,
      deliveryInstructions: request.deliveryInstructions,
      isRecurring: request.isRecurring,
      recurrencePattern: request.recurrencePattern,
      updatedAt: DateTime.now(),
    );
  }
}
