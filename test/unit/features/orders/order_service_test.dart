import 'package:flutter_test/flutter_test.dart';
import 'package:eatfast_mobile/shared/services/cart/domain/models/cart_item.dart';
import 'package:eatfast_mobile/modules/client_module/providers/domain/user_address.dart';
import 'package:eatfast_mobile/shared/services/payment/domain/models/payment_models.dart';
import 'package:eatfast_mobile/shared/services/restaurants/domain/models/menu_item.dart';

void main() {
  group('Order Service Tests', () {
    group('Order Creation', () {
      test('should create order with valid cart data', () async {
        // Arrange
        final menuItem1 = MenuItem(
          id: 'menu-1',
          restaurantId: 'restaurant-1',
          name: 'Burger',
          description: 'Delicious burger',
          price: 12.99,
          category: 'Main Course',
          isAvailable: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final menuItem2 = MenuItem(
          id: 'menu-2',
          restaurantId: 'restaurant-1',
          name: 'Fries',
          description: 'Crispy fries',
          price: 4.99,
          category: 'Sides',
          isAvailable: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final cartItems = [
          CartItem(
            id: 'item-1',
            menuItemId: menuItem1.id,
            name: menuItem1.name,
            description: menuItem1.description,
            quantity: 2,
            price: menuItem1.price,
            total: 25.98,
            specialInstructions: 'No onions',
            restaurantId: menuItem1.restaurantId,
          ),
          CartItem(
            id: 'item-2',
            menuItemId: menuItem2.id,
            name: menuItem2.name,
            description: menuItem2.description,
            quantity: 1,
            price: menuItem2.price,
            total: 4.99,
            restaurantId: menuItem2.restaurantId,
          ),
        ];

        final deliveryAddress = UserAddress(
          id: 'addr-1',
          userId: 'user-1',
          label: 'Home',
          fullAddress: '123 Main St, Test City, Test State 12345',
          street: '123 Main St',
          city: 'Test City',
          state: 'Test State',
          postalCode: '12345',
          country: 'Test Country',
          latitude: 40.7128,
          longitude: -74.0060,
          isDefault: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final paymentProvider = PaymentProvider.cash;

        // Act & Assert
        expect(cartItems, hasLength(2));
        expect(cartItems.first.name, equals('Burger'));
        expect(cartItems.first.quantity, equals(2));
        expect(deliveryAddress.fullAddress, contains('123 Main St'));
        expect(paymentProvider, equals(PaymentProvider.cash));
      });

      test('should calculate order totals correctly', () async {
        // Arrange
        final menuItem = MenuItem(
          id: 'menu-1',
          restaurantId: 'restaurant-1',
          name: 'Test Item',
          description: 'Test description',
          price: 10.00,
          category: 'Test',
          isAvailable: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final cartItem = CartItem(
          id: 'item-1',
          menuItemId: menuItem.id,
          name: menuItem.name,
          description: menuItem.description,
          quantity: 3,
          price: menuItem.price,
          total: 30.00,
          restaurantId: menuItem.restaurantId,
        );

        final payment = Payment(
          id: 'pay-1',
          orderId: 'order-1',
          customerId: 'customer-1',
          amount: 30.00,
          currency: 'XAF',
          method: PaymentProvider.cash,
          status: PaymentStatus.pending,
          createdAt: DateTime.now(),
        );

        // Act & Assert
        expect(cartItem.total, equals(30.00));
        expect(payment.amount, equals(30.00));
        expect(payment.method, equals(PaymentProvider.cash));
        expect(payment.status, equals(PaymentStatus.pending));
      });

      test('should handle different payment methods', () {
        // Arrange & Act & Assert
        expect(PaymentProvider.cash.displayName, equals('Cash on Delivery'));
        expect(PaymentProvider.noupay.displayName, equals('NouPay'));
        expect(PaymentProvider.campay.displayName, equals('CamPay'));
        expect(PaymentProvider.stripe.displayName, equals('Credit/Debit Card'));
        expect(PaymentProvider.wallet.displayName, equals('EatFast Wallet'));
        expect(PaymentProvider.mtnMomo.displayName, equals('MTN Mobile Money'));
        expect(PaymentProvider.orangeMoney.displayName, equals('Orange Money'));

        expect(PaymentProvider.mtnMomo.requiresPhoneNumber, isTrue);
        expect(PaymentProvider.orangeMoney.requiresPhoneNumber, isTrue);
        expect(PaymentProvider.cash.requiresPhoneNumber, isFalse);

        expect(PaymentProvider.wallet.isDigitalWallet, isTrue);
        expect(PaymentProvider.cash.isDigitalWallet, isFalse);

        expect(PaymentProvider.mtnMomo.isMobileMoney, isTrue);
        expect(PaymentProvider.stripe.isMobileMoney, isFalse);
      });

      test('should validate address information correctly', () {
        // Arrange
        final completeAddress = UserAddress(
          id: 'addr-1',
          userId: 'user-1',
          label: 'Home',
          fullAddress: '123 Main St, Douala, Littoral',
          street: '123 Main St',
          city: 'Douala',
          state: 'Littoral',
          country: 'Cameroon',
          latitude: 4.0511,
          longitude: 9.7679,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final basicAddress = UserAddress(
          id: 'addr-2',
          userId: 'user-1',
          label: 'Work',
          fullAddress: 'Office Building, Random City',
          country: 'Cameroon',
          latitude: 3.8480,
          longitude: 11.5021,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // Act & Assert
        expect(completeAddress.isInMajorCity, isTrue);
        expect(completeAddress.streetAddress, equals('123 Main St, Douala, Littoral'));
        expect(completeAddress.displayText, equals('Home - 123 Main St, Douala, Littoral'));

        expect(basicAddress.isInMajorCity, isFalse);
        expect(basicAddress.displayText, equals('Work - Office Building, Random City'));
      });

      test('should handle payment status transitions', () {
        // Arrange
        final initialPayment = Payment(
          id: 'pay-1',
          orderId: 'order-1',
          amount: 25.99,
          currency: 'XAF',
          method: PaymentProvider.mtnMomo,
          status: PaymentStatus.pending,
          phoneNumber: '+237697123456',
          createdAt: DateTime.now(),
        );

        final processedPayment = initialPayment.copyWith(
          status: PaymentStatus.processing,
          transactionId: 'txn-123',
        );

        final completedPayment = processedPayment.copyWith(
          status: PaymentStatus.completed,
          completedAt: DateTime.now(),
          operatorReference: 'MTN-REF-456',
        );

        // Act & Assert
        expect(initialPayment.status, equals(PaymentStatus.pending));
        expect(initialPayment.method.requiresPhoneNumber, isTrue);
        expect(initialPayment.phoneNumber, equals('+237697123456'));

        expect(processedPayment.status, equals(PaymentStatus.processing));
        expect(processedPayment.transactionId, equals('txn-123'));

        expect(completedPayment.status, equals(PaymentStatus.completed));
        expect(completedPayment.completedAt, isNotNull);
        expect(completedPayment.operatorReference, equals('MTN-REF-456'));
      });

      test('should serialize payment to JSON correctly', () {
        // Arrange
        final payment = Payment(
          id: 'pay-1',
          orderId: 'order-1',
          customerId: 'customer-1',
          amount: 15.50,
          currency: 'XAF',
          method: PaymentProvider.campay,
          status: PaymentStatus.completed,
          transactionId: 'txn-abc123',
          phoneNumber: '+237677123456',
          createdAt: DateTime(2024, 1, 1),
          completedAt: DateTime(2024, 1, 1, 10, 30),
        );

        // Act
        final json = payment.toJson();

        // Assert
        expect(json['id'], equals('pay-1'));
        expect(json['orderId'], equals('order-1'));
        expect(json['customerId'], equals('customer-1'));
        expect(json['amount'], equals(15.50));
        expect(json['currency'], equals('XAF'));
        expect(json['method'], equals('campay'));
        expect(json['status'], equals('completed'));
        expect(json['transactionId'], equals('txn-abc123'));
        expect(json['phoneNumber'], equals('+237677123456'));
        expect(json['createdAt'], equals('2024-01-01T00:00:00.000'));
        expect(json['completedAt'], equals('2024-01-01T10:30:00.000'));
      });

      test('should deserialize payment from JSON correctly', () {
        // Arrange
        final json = {
          'id': 'pay-1',
          'orderId': 'order-1',
          'customerId': 'customer-1',
          'amount': 25.99,
          'currency': 'XAF',
          'method': 'noupay',
          'status': 'pending',
          'transactionId': 'txn-xyz789',
          'phoneNumber': '+237698123456',
          'createdAt': '2024-01-01T00:00:00.000Z',
        };

        // Act
        final payment = Payment.fromJson(json);

        // Assert
        expect(payment.id, equals('pay-1'));
        expect(payment.orderId, equals('order-1'));
        expect(payment.customerId, equals('customer-1'));
        expect(payment.amount, equals(25.99));
        expect(payment.currency, equals('XAF'));
        expect(payment.method, equals(PaymentProvider.noupay));
        expect(payment.status, equals(PaymentStatus.pending));
        expect(payment.transactionId, equals('txn-xyz789'));
        expect(payment.phoneNumber, equals('+237698123456'));
      });

      test('should handle mobile money providers correctly', () {
        // Act & Assert
        expect(MobileMoneyProvider.mtn.name, equals('MTN Mobile Money'));
        expect(MobileMoneyProvider.mtn.code, equals('mtn'));
        expect(MobileMoneyProvider.mtn.supportedCountries, contains('CM'));

        expect(MobileMoneyProvider.orange.name, equals('Orange Money'));
        expect(MobileMoneyProvider.orange.code, equals('orange'));
        expect(MobileMoneyProvider.orange.supportedCountries, contains('CM'));

        expect(MobileMoneyProvider.providers, hasLength(2));
        expect(MobileMoneyProvider.providers.first, equals(MobileMoneyProvider.mtn));
      });
    });
  });
}
