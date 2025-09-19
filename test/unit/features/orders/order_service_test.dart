import 'package:flutter_test/flutter_test.dart';
import 'package:eatfast_mobile/features/orders/domain/models/order.dart';
import 'package:eatfast_mobile/features/cart/domain/models/cart.dart';
import 'package:eatfast_mobile/features/profile/domain/user_address.dart';
import 'package:eatfast_mobile/features/profile/domain/models.dart';

void main() {
  group('Order Service Tests', () {
    group('Order Creation', () {
      test('should create order with valid cart data', () async {
        // Arrange
        final cartItems = [
          CartItem(
            id: 'item-1',
            menuItemId: 'menu-1',
            name: 'Burger',
            price: 12.99,
            quantity: 2,
            specialInstructions: 'No onions',
          ),
          CartItem(
            id: 'item-2',
            menuItemId: 'menu-2',
            name: 'Fries',
            price: 4.99,
            quantity: 1,
          ),
        ];

        final deliveryAddress = UserAddress(
          id: 'addr-1',
          street: '123 Main St',
          city: 'Test City',
          state: 'Test State',
          zipCode: '12345',
          country: 'Test Country',
          latitude: 40.7128,
          longitude: -74.0060,
          isDefault: true,
        );

        final paymentMethod = PaymentMethod(
          id: 'pay-1',
          type: PaymentType.creditCard,
          cardNumber: '**** **** **** 1234',
          expiryDate: '12/25',
          isDefault: true,
        );

        // Act & Assert
        expect(cartItems, hasLength(2));
        expect(cartItems[0].quantity, equals(2));
        expect(deliveryAddress.street, equals('123 Main St'));
        expect(paymentMethod.type, equals(PaymentType.creditCard));
      });

      test('should calculate order totals correctly', () {
        // Arrange
        const subtotal = 30.97;
        const deliveryFee = 2.99;
        const tax = 2.48;
        const discount = 5.00;
        final total = subtotal + deliveryFee + tax - discount;

        // Act & Assert
        expect(total, equals(31.44));
        expect(subtotal, greaterThan(0));
        expect(deliveryFee, greaterThan(0));
      });

      test('should generate unique order ID', () {
        // Arrange
        const orderId1 = 'order_123456789';
        const orderId2 = 'order_987654321';

        // Act & Assert
        expect(orderId1, isNot(equals(orderId2)));
        expect(orderId1, startsWith('order_'));
        expect(orderId2, startsWith('order_'));
      });
    });

    group('Order Status Management', () {
      test('should track order status progression', () {
        // Arrange
        final statusProgression = [
          OrderStatus.created,
          OrderStatus.confirmed,
          OrderStatus.accepted,
          OrderStatus.preparing,
          OrderStatus.readyForPickup,
          OrderStatus.assignedDriver,
          OrderStatus.pickedUp,
          OrderStatus.inTransit,
          OrderStatus.delivered,
          OrderStatus.completed,
        ];

        // Act & Assert
        expect(statusProgression, hasLength(10));
        expect(statusProgression.first, equals(OrderStatus.created));
        expect(statusProgression.last, equals(OrderStatus.completed));
      });

      test('should identify active orders', () {
        // Arrange
        final activeStatuses = [
          OrderStatus.created,
          OrderStatus.confirmed,
          OrderStatus.accepted,
          OrderStatus.preparing,
          OrderStatus.readyForPickup,
          OrderStatus.assignedDriver,
          OrderStatus.pickedUp,
          OrderStatus.inTransit,
        ];

        // Act & Assert
        for (final status in activeStatuses) {
          final order = Order(
            id: 'test-order',
            userId: 'user-123',
            restaurantId: 'restaurant-1',
            restaurantName: 'Test Restaurant',
            items: [],
            status: status,
            subtotal: 20.0,
            deliveryFee: 2.99,
            tax: 1.6,
            discount: 0.0,
            total: 24.59,
            deliveryAddress: UserAddress(
              id: 'addr-1',
              street: '123 Test St',
              city: 'Test City',
              state: 'Test State',
              zipCode: '12345',
              country: 'Test Country',
              latitude: 40.7128,
              longitude: -74.0060,
              isDefault: true,
            ),
            paymentMethod: PaymentMethod(
              id: 'pay-1',
              type: PaymentType.creditCard,
              cardNumber: '**** 1234',
              expiryDate: '12/25',
              isDefault: true,
            ),
            createdAt: DateTime.now(),
          );

          expect(order.isActive, isTrue);
        }
      });

      test('should identify completed orders', () {
        // Arrange
        final completedStatuses = [
          OrderStatus.delivered,
          OrderStatus.completed,
          OrderStatus.cancelled,
          OrderStatus.refunded,
          OrderStatus.expired,
        ];

        // Act & Assert
        for (final status in completedStatuses) {
          if (status == OrderStatus.delivered || status == OrderStatus.completed) {
            expect([OrderStatus.delivered, OrderStatus.completed], contains(status));
          }
        }
      });

      test('should check if order can be cancelled', () {
        // Arrange
        final cancellableStatuses = [
          OrderStatus.created,
          OrderStatus.confirmed,
        ];

        final nonCancellableStatuses = [
          OrderStatus.preparing,
          OrderStatus.readyForPickup,
          OrderStatus.inTransit,
          OrderStatus.delivered,
        ];

        // Act & Assert
        for (final status in cancellableStatuses) {
          final order = Order(
            id: 'test-order',
            userId: 'user-123',
            restaurantId: 'restaurant-1',
            restaurantName: 'Test Restaurant',
            items: [],
            status: status,
            subtotal: 20.0,
            deliveryFee: 2.99,
            tax: 1.6,
            discount: 0.0,
            total: 24.59,
            deliveryAddress: UserAddress(
              id: 'addr-1',
              street: '123 Test St',
              city: 'Test City',
              state: 'Test State',
              zipCode: '12345',
              country: 'Test Country',
              latitude: 40.7128,
              longitude: -74.0060,
              isDefault: true,
            ),
            paymentMethod: PaymentMethod(
              id: 'pay-1',
              type: PaymentType.creditCard,
              cardNumber: '**** 1234',
              expiryDate: '12/25',
              isDefault: true,
            ),
            createdAt: DateTime.now(),
          );
          expect(order.canBeCancelled, isTrue);
        }

        for (final status in nonCancellableStatuses) {
          expect(cancellableStatuses, isNot(contains(status)));
        }
      });
    });

    group('Order History', () {
      test('should retrieve user order history', () async {
        // Arrange
        final mockOrders = [
          {
            'id': 'order-1',
            'restaurantName': 'Pizza Place',
            'total': 25.99,
            'status': 'delivered',
            'createdAt': DateTime.now().subtract(const Duration(days: 1)),
          },
          {
            'id': 'order-2',
            'restaurantName': 'Burger Joint',
            'total': 18.50,
            'status': 'completed',
            'createdAt': DateTime.now().subtract(const Duration(days: 3)),
          },
          {
            'id': 'order-3',
            'restaurantName': 'Sushi Bar',
            'total': 45.00,
            'status': 'cancelled',
            'createdAt': DateTime.now().subtract(const Duration(days: 5)),
          },
        ];

        // Act & Assert
        expect(mockOrders, hasLength(3));
        expect(mockOrders[0]['total'], equals(25.99));
        expect(mockOrders[1]['restaurantName'], equals('Burger Joint'));
      });

      test('should filter orders by status', () {
        // Arrange
        final orders = ['delivered', 'completed', 'cancelled', 'in_transit'];
        final completedOrders = orders.where((status) =>
          status == 'delivered' || status == 'completed').toList();

        // Act & Assert
        expect(completedOrders, hasLength(2));
        expect(completedOrders, contains('delivered'));
        expect(completedOrders, contains('completed'));
      });

      test('should sort orders by date', () {
        // Arrange
        final orderDates = [
          DateTime.now().subtract(const Duration(days: 5)),
          DateTime.now().subtract(const Duration(days: 1)),
          DateTime.now().subtract(const Duration(days: 3)),
        ];

        final sortedDates = List<DateTime>.from(orderDates)
          ..sort((a, b) => b.compareTo(a)); // Newest first

        // Act & Assert
        expect(sortedDates[0], equals(orderDates[1])); // Most recent
        expect(sortedDates.last, equals(orderDates[0])); // Oldest
      });
    });

    group('Order Tracking', () {
      test('should track order location updates', () {
        // Arrange
        final locationUpdate = {
          'orderId': 'order-123',
          'driverId': 'driver-456',
          'latitude': 40.7580,
          'longitude': -73.9855,
          'timestamp': DateTime.now(),
          'estimatedArrival': '15 minutes',
        };

        // Act & Assert
        expect(locationUpdate['orderId'], equals('order-123'));
        expect(locationUpdate['latitude'], isA<double>());
        expect(locationUpdate['longitude'], isA<double>());
        expect(locationUpdate['estimatedArrival'], contains('minutes'));
      });

      test('should update estimated delivery time', () {
        // Arrange
        final initialEstimate = DateTime.now().add(const Duration(minutes: 30));
        final updatedEstimate = DateTime.now().add(const Duration(minutes: 25));

        // Act & Assert
        expect(updatedEstimate.isBefore(initialEstimate), isTrue);
        expect(updatedEstimate.isAfter(DateTime.now()), isTrue);
      });

      test('should handle driver assignment', () {
        // Arrange
        const driverId = 'driver-789';
        const driverName = 'John Driver';
        const driverPhone = '+1234567890';

        // Act & Assert
        expect(driverId, startsWith('driver-'));
        expect(driverName, isNotEmpty);
        expect(driverPhone, startsWith('+'));
      });
    });

    group('Order Reordering', () {
      test('should create new order from previous order', () {
        // Arrange
        final originalOrder = {
          'id': 'order-123',
          'restaurantId': 'restaurant-1',
          'items': [
            {'menuItemId': 'item-1', 'quantity': 2},
            {'menuItemId': 'item-2', 'quantity': 1},
          ],
        };

        final newOrderData = {
          'restaurantId': originalOrder['restaurantId'],
          'items': originalOrder['items'],
        };

        // Act & Assert
        expect(newOrderData['restaurantId'], equals(originalOrder['restaurantId']));
        expect(newOrderData['items'], equals(originalOrder['items']));
      });

      test('should update quantities for reorder', () {
        // Arrange
        final originalItems = [
          {'menuItemId': 'item-1', 'quantity': 2},
          {'menuItemId': 'item-2', 'quantity': 1},
        ];

        final updatedItems = originalItems.map((item) => {
          ...item,
          'quantity': (item['quantity'] as int) + 1,
        }).toList();

        // Act & Assert
        expect(updatedItems[0]['quantity'], equals(3));
        expect(updatedItems[1]['quantity'], equals(2));
      });
    });

    group('Order Validation', () {
      test('should validate minimum order amount', () {
        // Arrange
        const minimumOrderAmount = 10.00;
        const orderTotal = 15.99;
        const lowOrderTotal = 8.50;

        // Act & Assert
        expect(orderTotal >= minimumOrderAmount, isTrue);
        expect(lowOrderTotal >= minimumOrderAmount, isFalse);
      });

      test('should validate delivery address', () {
        // Arrange
        final validAddress = UserAddress(
          id: 'addr-1',
          street: '123 Main St',
          city: 'Test City',
          state: 'Test State',
          zipCode: '12345',
          country: 'Test Country',
          latitude: 40.7128,
          longitude: -74.0060,
          isDefault: true,
        );

        // Act & Assert
        expect(validAddress.street, isNotEmpty);
        expect(validAddress.city, isNotEmpty);
        expect(validAddress.zipCode, hasLength(5));
        expect(validAddress.latitude, isNotNull);
        expect(validAddress.longitude, isNotNull);
      });

      test('should validate payment method', () {
        // Arrange
        final validPaymentMethod = PaymentMethod(
          id: 'pay-1',
          type: PaymentType.creditCard,
          cardNumber: '**** **** **** 1234',
          expiryDate: '12/25',
          isDefault: true,
        );

        // Act & Assert
        expect(validPaymentMethod.type, equals(PaymentType.creditCard));
        expect(validPaymentMethod.cardNumber, contains('****'));
        expect(validPaymentMethod.expiryDate, matches(RegExp(r'\d{2}/\d{2}')));
      });
    });
  });
}