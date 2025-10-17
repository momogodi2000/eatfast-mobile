import 'dart:async';
import 'package:eatfast_mobile/shared/config/app_config.dart';
import 'package:eatfast_mobile/shared/utils/result.dart';
import 'package:eatfast_mobile/shared/services/orders/domain/models/order.dart';
import 'package:eatfast_mobile/shared/services/orders/domain/repositories/order_repository.dart';
import 'package:eatfast_mobile/shared/services/cart/domain/models/cart.dart';
import 'package:eatfast_mobile/shared/services/profile/domain/models/user_address.dart';
import 'package:eatfast_mobile/shared/services/payment/domain/models/payment_method.dart';

class OrderRepositoryImpl implements OrderRepository {
  // Mock orders storage
  static final List<Order> _orders = [];
  static int _orderCounter = 1;

  // Simulate network delay
  Future<void> _simulateDelay() async {
    if (AppConfig.useMockAPI) {
      await Future.delayed(AppConfig.mockApiDelay);
    }
  }

  @override
  Future<Result<Order, String>> placeOrder({
    required Cart cart,
    required UserAddress deliveryAddress,
    required PaymentMethod paymentMethod,
    String? specialInstructions,
  }) async {
    try {
      await _simulateDelay();

      if (cart.isEmpty) {
        return Result.failure('Le panier est vide');
      }

      final orderId = 'order_${_orderCounter++}_${DateTime.now().millisecondsSinceEpoch}';
      final now = DateTime.now();

      final order = Order(
        id: orderId,
        userId: cart.userId,
        restaurantId: cart.restaurantId!,
        restaurantName: cart.restaurantName!,
        items: List.from(cart.items),
        status: OrderStatus.created,
        subtotal: cart.subtotal,
        deliveryFee: cart.deliveryFee,
        tax: cart.tax,
        discount: cart.discount,
        total: cart.total,
        deliveryAddress: deliveryAddress,
        paymentMethod: paymentMethod,
        specialInstructions: specialInstructions,
        estimatedDeliveryTime: now.add(const Duration(minutes: 35)),
        statusUpdates: [
          OrderStatusUpdate(
            id: '${orderId}_status_1',
            status: OrderStatus.created,
            timestamp: now,
            message: 'Commande re�ue et en attente de confirmation',
            updatedBy: 'system',
          ),
        ],
        createdAt: now,
        updatedAt: now,
      );

      _orders.insert(0, order); // Add to beginning for newest first

      // Simulate automatic status updates
      _simulateOrderProgress(order);

      return Result.success(order);
    } catch (e) {
      return Result.failure('Erreur lors de la commande: ${e.toString()}');
    }
  }

  @override
  Future<Result<List<Order>, String>> getOrders({
    int page = 1,
    int limit = 20,
    OrderStatus? status,
  }) async {
    try {
      await _simulateDelay();

      var orders = List<Order>.from(_orders);

      // Filter by status if provided
      if (status != null) {
        orders = orders.where((order) => order.status == status).toList();
      }

      // Apply pagination
      final startIndex = (page - 1) * limit;
      final endIndex = startIndex + limit;
      
      if (startIndex >= orders.length) {
        return Result.success([]);
      }

      final paginatedOrders = orders.sublist(
        startIndex,
        endIndex > orders.length ? orders.length : endIndex,
      );

      return Result.success(paginatedOrders);
    } catch (e) {
      return Result.failure('Erreur lors de la r�cup�ration des commandes: ${e.toString()}');
    }
  }

  @override
  Future<Result<Order, String>> getOrderById(String orderId) async {
    try {
      await _simulateDelay();

      final order = _orders.where((o) => o.id == orderId).firstOrNull;
      if (order == null) {
        return Result.failure('Commande non trouv�e');
      }

      return Result.success(order);
    } catch (e) {
      return Result.failure('Erreur lors de la r�cup�ration de la commande: ${e.toString()}');
    }
  }

  @override
  Future<Result<void, String>> cancelOrder(String orderId) async {
    try {
      await _simulateDelay();

      final orderIndex = _orders.indexWhere((o) => o.id == orderId);
      if (orderIndex == -1) {
        return Result.failure('Commande non trouv�e');
      }

      final order = _orders[orderIndex];
      if (!order.canBeCancelled) {
        return Result.failure('Cette commande ne peut plus �tre annul�e');
      }

      final updatedOrder = order.copyWith(
        status: OrderStatus.cancelled,
        statusUpdates: [
          ...order.statusUpdates,
          OrderStatusUpdate(
            id: '${orderId}_cancel',
            status: OrderStatus.cancelled,
            timestamp: DateTime.now(),
            message: 'Commande annul�e par le client',
            updatedBy: 'customer',
          ),
        ],
        updatedAt: DateTime.now(),
      );

      _orders[orderIndex] = updatedOrder;

      return Result.success(null);
    } catch (e) {
      return Result.failure('Erreur lors de l\'annulation: ${e.toString()}');
    }
  }

  @override
  Future<Result<Order, String>> reorderOrder(String orderId) async {
    try {
      await _simulateDelay();

      final originalOrder = _orders.where((o) => o.id == orderId).firstOrNull;
      if (originalOrder == null) {
        return Result.failure('Commande originale non trouv�e');
      }

      // Create a new order with the same items
      final newOrderId = 'order_${_orderCounter++}_${DateTime.now().millisecondsSinceEpoch}';
      final now = DateTime.now();

      final newOrder = originalOrder.copyWith(
        id: newOrderId,
        status: OrderStatus.created,
        estimatedDeliveryTime: now.add(const Duration(minutes: 35)),
        actualDeliveryTime: null,
        statusUpdates: [
          OrderStatusUpdate(
            id: '${newOrderId}_status_1',
            status: OrderStatus.created,
            timestamp: now,
            message: 'Nouvelle commande (recomande)',
            updatedBy: 'system',
          ),
        ],
        createdAt: now,
        updatedAt: now,
      );

      _orders.insert(0, newOrder);

      // Simulate automatic status updates
      _simulateOrderProgress(newOrder);

      return Result.success(newOrder);
    } catch (e) {
      return Result.failure('Erreur lors de la recommande: ${e.toString()}');
    }
  }

  @override
  Future<Result<Order, String>> updateOrderStatus(
    String orderId, 
    OrderStatus status, {
    String? message,
  }) async {
    try {
      await _simulateDelay();

      final orderIndex = _orders.indexWhere((o) => o.id == orderId);
      if (orderIndex == -1) {
        return Result.failure('Commande non trouv�e');
      }

      final order = _orders[orderIndex];
      final now = DateTime.now();

      final updatedOrder = order.copyWith(
        status: status,
        statusUpdates: [
          ...order.statusUpdates,
          OrderStatusUpdate(
            id: '${orderId}_status_${order.statusUpdates.length + 1}',
            status: status,
            timestamp: now,
            message: message ?? status.description,
            updatedBy: 'system',
          ),
        ],
        actualDeliveryTime: status == OrderStatus.delivered ? now : order.actualDeliveryTime,
        updatedAt: now,
      );

      _orders[orderIndex] = updatedOrder;

      return Result.success(updatedOrder);
    } catch (e) {
      return Result.failure('Erreur lors de la mise � jour: ${e.toString()}');
    }
  }

  @override
  Future<Result<void, String>> rateOrder(String orderId, double rating, {String? review}) async {
    try {
      await _simulateDelay();

      final orderIndex = _orders.indexWhere((o) => o.id == orderId);
      if (orderIndex == -1) {
        return Result.failure('Commande non trouv�e');
      }

      final order = _orders[orderIndex];
      if (!order.isDelivered) {
        return Result.failure('Vous ne pouvez �valuer que les commandes livr�es');
      }

      // In a real app, this would save the rating to the database
      // For now, we'll just simulate success

      return Result.success(null);
    } catch (e) {
      return Result.failure('Erreur lors de l\'�valuation: ${e.toString()}');
    }
  }

  // Simulate order progress with automatic status updates
  void _simulateOrderProgress(Order order) {
    if (!AppConfig.useMockAPI) return;

    // Simulate order confirmation after 30 seconds
    Timer(const Duration(seconds: 30), () {
      updateOrderStatus(order.id, OrderStatus.confirmed, 
        message: 'Commande confirm�e par le restaurant');
    });

    // Simulate preparation after 2 minutes
    Timer(const Duration(minutes: 2), () {
      updateOrderStatus(order.id, OrderStatus.preparing, 
        message: 'Le restaurant pr�pare votre commande');
    });

    // Simulate ready for pickup after 10 minutes
    Timer(const Duration(minutes: 10), () {
      updateOrderStatus(order.id, OrderStatus.readyForPickup, 
        message: 'Commande pr�te pour la livraison');
    });

    // Simulate pickup after 12 minutes
    Timer(const Duration(minutes: 12), () {
      updateOrderStatus(order.id, OrderStatus.pickedUp, 
        message: 'Commande r�cup�r�e par le livreur');
    });

    // Simulate in transit after 15 minutes
    Timer(const Duration(minutes: 15), () {
      updateOrderStatus(order.id, OrderStatus.inTransit, 
        message: 'Le livreur est en route');
    });

    // Simulate delivery after 25 minutes
    Timer(const Duration(minutes: 25), () {
      updateOrderStatus(order.id, OrderStatus.delivered, 
        message: 'Commande livr�e avec succ�s');
    });
  }
}
