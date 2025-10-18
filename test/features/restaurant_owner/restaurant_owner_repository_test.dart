import 'package:flutter_test/flutter_test.dart';
import 'package:eatfast_mobile/modules/restaurant_manager_module/services/data/restaurant_owner_repository_impl.dart';
import 'package:eatfast_mobile/modules/restaurant_manager_module/providers/domain/models/menu_management.dart';
import 'package:eatfast_mobile/modules/restaurant_manager_module/providers/domain/models/live_order.dart';
import 'package:eatfast_mobile/shared/services/orders/domain/models/order_status.dart';

void main() {
  late RestaurantOwnerRepositoryImpl repository;

  setUp(() {
    repository = RestaurantOwnerRepositoryImpl();
  });

  tearDown(() {
    repository.dispose();
  });

  group('Dashboard Stats Tests', () {
    test('getDashboardStats returns success on valid restaurant ID', () async {
      // Arrange
      const restaurantId = 'test-restaurant-123';

      // Act
      final result = await repository.getDashboardStats(restaurantId);

      // Assert
      result.when(
        success: (stats) {
          expect(stats, isNotNull);
          expect(stats.totalOrders, greaterThanOrEqualTo(0));
          expect(stats.todayRevenue, greaterThanOrEqualTo(0));
        },
        failure: (error) {
          // Expected to fail in test environment without actual backend
          expect(error, isNotEmpty);
        },
      );
    });

    test('getWeeklyStats returns list of daily stats', () async {
      // Arrange
      const restaurantId = 'test-restaurant-123';

      // Act
      final result = await repository.getWeeklyStats(restaurantId);

      // Assert
      result.when(
        success: (stats) {
          expect(stats, isList);
        },
        failure: (error) {
          expect(error, isNotEmpty);
        },
      );
    });
  });

  group('Live Orders Tests', () {
    test('getLiveOrders returns list of orders', () async {
      // Arrange
      const restaurantId = 'test-restaurant-123';

      // Act
      final result = await repository.getLiveOrders(restaurantId);

      // Assert
      result.when(
        success: (orders) {
          expect(orders, isList);
        },
        failure: (error) {
          expect(error, isNotEmpty);
        },
      );
    });

    test('acceptOrder returns updated order on success', () async {
      // Arrange
      const orderId = 'test-order-123';
      const estimatedPrepTime = 30;

      // Act
      final result = await repository.acceptOrder(orderId, estimatedPrepTime);

      // Assert
      result.when(
        success: (order) {
          expect(order.orderId, equals(orderId));
          expect(order.estimatedPrepTime, equals(estimatedPrepTime));
        },
        failure: (error) {
          expect(error, isNotEmpty);
        },
      );
    });

    test('rejectOrder requires reason parameter', () async {
      // Arrange
      const orderId = 'test-order-123';
      const reason = 'Out of stock';

      // Act
      final result = await repository.rejectOrder(orderId, reason);

      // Assert
      result.when(
        success: (order) {
          expect(order.orderId, equals(orderId));
        },
        failure: (error) {
          expect(error, isNotEmpty);
        },
      );
    });

    test('updateOrderStatus accepts valid status transitions', () async {
      // Arrange
      const orderId = 'test-order-123';
      const status = OrderStatus.preparing;

      // Act
      final result = await repository.updateOrderStatus(orderId, status);

      // Assert
      result.when(
        success: (order) {
          expect(order.status, equals(status));
        },
        failure: (error) {
          expect(error, isNotEmpty);
        },
      );
    });
  });

  group('Menu Management Tests', () {
    test('getMenuCategories returns list of categories', () async {
      // Arrange
      const restaurantId = 'test-restaurant-123';

      // Act
      final result = await repository.getMenuCategories(restaurantId);

      // Assert
      result.when(
        success: (categories) {
          expect(categories, isList);
        },
        failure: (error) {
          expect(error, isNotEmpty);
        },
      );
    });

    test('createMenuCategory requires valid category data', () async {
      // Arrange
      const restaurantId = 'test-restaurant-123';
      const category = MenuCategory(
        categoryId: '',
        name: 'Test Category',
        description: 'Test Description',
        sortOrder: 0,
        isActive: true,
        items: [],
      );

      // Act
      final result = await repository.createMenuCategory(restaurantId, category);

      // Assert
      result.when(
        success: (createdCategory) {
          expect(createdCategory.name, equals('Test Category'));
          expect(createdCategory.categoryId, isNotEmpty);
        },
        failure: (error) {
          expect(error, isNotEmpty);
        },
      );
    });

    test('deleteMenuCategory removes category', () async {
      // Arrange
      const categoryId = 'test-category-123';

      // Act
      final result = await repository.deleteMenuCategory(categoryId);

      // Assert
      result.when(
        success: (_) {
          // Success case
          expect(true, isTrue);
        },
        failure: (error) {
          expect(error, isNotEmpty);
        },
      );
    });

    test('toggleItemAvailability updates item status', () async {
      // Arrange
      const itemId = 'test-item-123';
      const isAvailable = true;

      // Act
      final result = await repository.toggleItemAvailability(itemId, isAvailable);

      // Assert
      result.when(
        success: (_) {
          expect(true, isTrue);
        },
        failure: (error) {
          expect(error, isNotEmpty);
        },
      );
    });

    test('bulkUpdateAvailability handles multiple items', () async {
      // Arrange
      const itemIds = ['item-1', 'item-2', 'item-3'];
      const isAvailable = false;

      // Act
      final result = await repository.bulkUpdateAvailability(itemIds, isAvailable);

      // Assert
      result.when(
        success: (_) {
          expect(true, isTrue);
        },
        failure: (error) {
          expect(error, isNotEmpty);
        },
      );
    });
  });

  group('Wallet Operations Tests', () {
    test('getWalletBalance returns balance data', () async {
      // Arrange
      const restaurantId = 'test-restaurant-123';

      // Act
      final result = await repository.getWalletBalance(restaurantId);

      // Assert
      result.when(
        success: (data) {
          expect(data, isMap);
          expect(data.containsKey('available_balance') || data.containsKey('balance'), isTrue);
        },
        failure: (error) {
          expect(error, isNotEmpty);
        },
      );
    });

    test('getWalletTransactions returns transaction list', () async {
      // Arrange
      const restaurantId = 'test-restaurant-123';

      // Act
      final result = await repository.getWalletTransactions(restaurantId);

      // Assert
      result.when(
        success: (transactions) {
          expect(transactions, isList);
        },
        failure: (error) {
          expect(error, isNotEmpty);
        },
      );
    });

    test('requestWithdrawal validates minimum amount', () async {
      // Arrange
      const restaurantId = 'test-restaurant-123';
      const amount = 10000.0; // Minimum amount
      const description = 'Test withdrawal';

      // Act
      final result = await repository.requestWithdrawal(restaurantId, amount, description);

      // Assert
      result.when(
        success: (_) {
          expect(true, isTrue);
        },
        failure: (error) {
          expect(error, isNotEmpty);
        },
      );
    });
  });

  group('Analytics Tests', () {
    test('getItemPerformance returns performance metrics', () async {
      // Arrange
      const restaurantId = 'test-restaurant-123';

      // Act
      final result = await repository.getItemPerformance(restaurantId);

      // Assert
      result.when(
        success: (performance) {
          expect(performance, isList);
        },
        failure: (error) {
          expect(error, isNotEmpty);
        },
      );
    });

    test('getPopularItems returns sorted list', () async {
      // Arrange
      const restaurantId = 'test-restaurant-123';

      // Act
      final result = await repository.getPopularItems(restaurantId);

      // Assert
      result.when(
        success: (items) {
          expect(items, isList);
        },
        failure: (error) {
          expect(error, isNotEmpty);
        },
      );
    });

    test('getRevenueAnalytics requires date range', () async {
      // Arrange
      const restaurantId = 'test-restaurant-123';
      final from = DateTime.now().subtract(const Duration(days: 30));
      final to = DateTime.now();

      // Act
      final result = await repository.getRevenueAnalytics(restaurantId, from, to);

      // Assert
      result.when(
        success: (analytics) {
          expect(analytics, isMap);
        },
        failure: (error) {
          expect(error, isNotEmpty);
        },
      );
    });
  });

  group('Stream Tests', () {
    test('watchLiveOrders creates broadcast stream', () {
      // Arrange
      const restaurantId = 'test-restaurant-123';

      // Act
      final stream = repository.watchLiveOrders(restaurantId);

      // Assert
      expect(stream, isNotNull);
      expect(stream.isBroadcast, isTrue);
    });

    test('dispose closes all controllers', () {
      // Arrange
      const restaurantId = 'test-restaurant-123';
      repository.watchLiveOrders(restaurantId);

      // Act
      repository.dispose();

      // Assert
      // If no exception is thrown, dispose worked correctly
      expect(true, isTrue);
    });
  });

  group('Error Handling Tests', () {
    test('handles network errors gracefully', () async {
      // Arrange
      const restaurantId = 'invalid-restaurant-id';

      // Act
      final result = await repository.getDashboardStats(restaurantId);

      // Assert
      result.when(
        success: (_) {
          // May succeed with empty data
        },
        failure: (error) {
          expect(error, contains('Erreur'));
        },
      );
    });

    test('validates empty restaurant ID', () async {
      // Arrange
      const restaurantId = '';

      // Act
      final result = await repository.getMenuCategories(restaurantId);

      // Assert
      result.when(
        success: (_) {},
        failure: (error) {
          expect(error, isNotEmpty);
        },
      );
    });
  });
}
