import 'dart:async';
import '../../../core/config/app_config.dart';
import '../../../core/result.dart';
import '../domain/models/order.dart';
import '../domain/repositories/order_repository.dart';
import '../../cart/domain/models/cart.dart';
import '../../profile/domain/models.dart';

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
        return const Result.failure('Le panier est vide');
      }

      final orderId = 'order_${_orderCounter++}_${DateTime.now().millisecondsSinceEpoch}';
      final now = DateTime.now();

      final order = Order(
        id: orderId,
        userId: cart.userId,
        restaurantId: cart.restaurantId!,
        restaurantName: cart.restaurantName!,
        items: List.from(cart.items),
        status: OrderStatus.pending,
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
            status: OrderStatus.pending,
            timestamp: now,
            message: 'Commande reçue et en attente de confirmation',
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
        return const Result.success([]);
      }

      final paginatedOrders = orders.sublist(
        startIndex,
        endIndex > orders.length ? orders.length : endIndex,
      );

      return Result.success(paginatedOrders);
    } catch (e) {
      return Result.failure('Erreur lors de la récupération des commandes: ${e.toString()}');
    }
  }

  @override
  Future<Result<Order, String>> getOrderById(String orderId) async {
    try {
      await _simulateDelay();

      final order = _orders.where((o) => o.id == orderId).firstOrNull;
      if (order == null) {
        return const Result.failure('Commande non trouvée');
      }

      return Result.success(order);
    } catch (e) {
      return Result.failure('Erreur lors de la récupération de la commande: ${e.toString()}');
    }
  }

  @override
  Future<Result<void, String>> cancelOrder(String orderId) async {
    try {
      await _simulateDelay();

      final orderIndex = _orders.indexWhere((o) => o.id == orderId);
      if (orderIndex == -1) {
        return const Result.failure('Commande non trouvée');
      }

      final order = _orders[orderIndex];
      if (!order.canBeCancelled) {
        return const Result.failure('Cette commande ne peut plus être annulée');
      }

      final updatedOrder = order.copyWith(
        status: OrderStatus.cancelled,
        statusUpdates: [
          ...order.statusUpdates,
          OrderStatusUpdate(
            id: '${orderId}_cancel',
            status: OrderStatus.cancelled,
            timestamp: DateTime.now(),
            message: 'Commande annulée par le client',
            updatedBy: 'customer',
          ),
        ],
        updatedAt: DateTime.now(),
      );

      _orders[orderIndex] = updatedOrder;

      return const Result.success(null);
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
        return const Result.failure('Commande originale non trouvée');
      }

      // Create a new order with the same items
      final newOrderId = 'order_${_orderCounter++}_${DateTime.now().millisecondsSinceEpoch}';
      final now = DateTime.now();

      final newOrder = originalOrder.copyWith(
        id: newOrderId,
        status: OrderStatus.pending,
        estimatedDeliveryTime: now.add(const Duration(minutes: 35)),
        actualDeliveryTime: null,
        statusUpdates: [
          OrderStatusUpdate(
            id: '${newOrderId}_status_1',
            status: OrderStatus.pending,
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
        return const Result.failure('Commande non trouvée');
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
      return Result.failure('Erreur lors de la mise à jour: ${e.toString()}');
    }
  }

  @override
  Future<Result<void, String>> rateOrder(String orderId, double rating, {String? review}) async {
    try {
      await _simulateDelay();

      final orderIndex = _orders.indexWhere((o) => o.id == orderId);
      if (orderIndex == -1) {
        return const Result.failure('Commande non trouvée');
      }

      final order = _orders[orderIndex];
      if (!order.isDelivered) {
        return const Result.failure('Vous ne pouvez évaluer que les commandes livrées');
      }

      // In a real app, this would save the rating to the database
      // For now, we'll just simulate success

      return const Result.success(null);
    } catch (e) {
      return Result.failure('Erreur lors de l\'évaluation: ${e.toString()}');
    }
  }

  // Simulate order progress with automatic status updates
  void _simulateOrderProgress(Order order) {
    if (!AppConfig.useMockAPI) return;

    // Simulate order confirmation after 30 seconds
    Timer(const Duration(seconds: 30), () {
      updateOrderStatus(order.id, OrderStatus.confirmed, 
        message: 'Commande confirmée par le restaurant');
    });

    // Simulate preparation after 2 minutes
    Timer(const Duration(minutes: 2), () {
      updateOrderStatus(order.id, OrderStatus.preparing, 
        message: 'Le restaurant prépare votre commande');
    });

    // Simulate ready after 10 minutes
    Timer(const Duration(minutes: 10), () {
      updateOrderStatus(order.id, OrderStatus.ready, 
        message: 'Commande prête pour la livraison');
    });

    // Simulate pickup after 12 minutes
    Timer(const Duration(minutes: 12), () {
      updateOrderStatus(order.id, OrderStatus.pickedUp, 
        message: 'Commande récupérée par le livreur');
    });

    // Simulate on the way after 15 minutes
    Timer(const Duration(minutes: 15), () {
      updateOrderStatus(order.id, OrderStatus.onTheWay, 
        message: 'Le livreur est en route');
    });

    // Simulate delivery after 25 minutes
    Timer(const Duration(minutes: 25), () {
      updateOrderStatus(order.id, OrderStatus.delivered, 
        message: 'Commande livrée avec succès');
    });
  }
}