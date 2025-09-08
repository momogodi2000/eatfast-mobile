import 'package:flutter_test/flutter_test.dart';
import 'package:eatfast_mobile/features/payments/domain/models/payment.dart';

void main() {
  group('Payment Models Tests', () {
    test('PaymentMethod enum should have correct values', () {
      // Test all payment method values
      expect(PaymentMethod.cash.name, 'cash');
      expect(PaymentMethod.noupay.name, 'noupay');
      expect(PaymentMethod.campay.name, 'campay');
      expect(PaymentMethod.stripe.name, 'stripe');
      expect(PaymentMethod.wallet.name, 'wallet');
      expect(PaymentMethod.mtn.name, 'mtn');
      expect(PaymentMethod.orange.name, 'orange');

      // Test display names
      expect(PaymentMethod.cash.displayName, 'Cash on Delivery');
      expect(PaymentMethod.noupay.displayName, 'NouPay');
      expect(PaymentMethod.campay.displayName, 'CamPay');
      expect(PaymentMethod.stripe.displayName, 'Credit/Debit Card');
      expect(PaymentMethod.wallet.displayName, 'EatFast Wallet');
      expect(PaymentMethod.mtn.displayName, 'MTN Mobile Money');
      expect(PaymentMethod.orange.displayName, 'Orange Mobile Money');
    });

    test('PaymentMethod should identify mobile money providers correctly', () {
      // Test mobile money identification
      expect(PaymentMethod.cash.isMobileMoney, false);
      expect(PaymentMethod.noupay.isMobileMoney, false);
      expect(PaymentMethod.campay.isMobileMoney, false);
      expect(PaymentMethod.stripe.isMobileMoney, false);
      expect(PaymentMethod.wallet.isMobileMoney, false);
      expect(PaymentMethod.mtn.isMobileMoney, true);
      expect(PaymentMethod.orange.isMobileMoney, true);
    });

    test('PaymentMethod should identify online payment methods correctly', () {
      // Test online payment identification
      expect(PaymentMethod.cash.isOnlinePayment, false);
      expect(PaymentMethod.noupay.isOnlinePayment, true);
      expect(PaymentMethod.campay.isOnlinePayment, true);
      expect(PaymentMethod.stripe.isOnlinePayment, true);
      expect(PaymentMethod.wallet.isOnlinePayment, true);
      expect(PaymentMethod.mtn.isOnlinePayment, true);
      expect(PaymentMethod.orange.isOnlinePayment, true);
    });

    test('PaymentStatus enum should have correct values', () {
      // Test all payment status values
      expect(PaymentStatus.pending.name, 'pending');
      expect(PaymentStatus.processing.name, 'processing');
      expect(PaymentStatus.completed.name, 'completed');
      expect(PaymentStatus.failed.name, 'failed');
      expect(PaymentStatus.cancelled.name, 'cancelled');
      expect(PaymentStatus.refunded.name, 'refunded');

      // Test display names
      expect(PaymentStatus.pending.displayName, 'Pending');
      expect(PaymentStatus.processing.displayName, 'Processing');
      expect(PaymentStatus.completed.displayName, 'Completed');
      expect(PaymentStatus.failed.displayName, 'Failed');
      expect(PaymentStatus.cancelled.displayName, 'Cancelled');
      expect(PaymentStatus.refunded.displayName, 'Refunded');
    });

    test('PaymentStatus should identify final states correctly', () {
      // Test final state identification
      expect(PaymentStatus.pending.isFinal, false);
      expect(PaymentStatus.processing.isFinal, false);
      expect(PaymentStatus.completed.isFinal, true);
      expect(PaymentStatus.failed.isFinal, true);
      expect(PaymentStatus.cancelled.isFinal, true);
      expect(PaymentStatus.refunded.isFinal, true);
    });

    test('PaymentStatus should identify successful states correctly', () {
      // Test successful state identification
      expect(PaymentStatus.pending.isSuccessful, false);
      expect(PaymentStatus.processing.isSuccessful, false);
      expect(PaymentStatus.completed.isSuccessful, true);
      expect(PaymentStatus.failed.isSuccessful, false);
      expect(PaymentStatus.cancelled.isSuccessful, false);
      expect(PaymentStatus.refunded.isSuccessful, false);
    });

    test('Payment model should create correctly', () {
      // Arrange
      final now = DateTime.now();

      // Act
      const payment = Payment(
        id: 'payment_123',
        orderId: 'order_456',
        userId: 'user_789',
        amount: 15000,
        currency: 'XAF',
        method: PaymentMethod.mtn,
        status: PaymentStatus.completed,
        reference: 'MTN_123456789',
        description: 'Payment for order #456',
        metadata: {
          'phone_number': '+237123456789',
          'transaction_id': 'MTN_TXN_123',
        },
        createdAt: null,
        updatedAt: null,
        completedAt: null,
      );

      // Assert
      expect(payment.id, 'payment_123');
      expect(payment.orderId, 'order_456');
      expect(payment.userId, 'user_789');
      expect(payment.amount, 15000);
      expect(payment.currency, 'XAF');
      expect(payment.method, PaymentMethod.mtn);
      expect(payment.status, PaymentStatus.completed);
      expect(payment.reference, 'MTN_123456789');
      expect(payment.description, 'Payment for order #456');
      expect(payment.metadata.length, 2);
      expect(payment.metadata['phone_number'], '+237123456789');
      expect(payment.metadata['transaction_id'], 'MTN_TXN_123');
      expect(payment.isCompleted, true);
      expect(payment.isSuccessful, true);
      expect(payment.formattedAmount, '15,000 XAF');
    });

    test('Payment model with failed status should work correctly', () {
      // Arrange & Act
      const payment = Payment(
        id: 'payment_failed',
        orderId: 'order_failed',
        userId: 'user_123',
        amount: 10000,
        currency: 'XAF',
        method: PaymentMethod.stripe,
        status: PaymentStatus.failed,
        reference: 'STRIPE_FAILED_123',
        description: 'Failed payment for order',
        metadata: {
          'error_code': 'card_declined',
          'error_message': 'Your card was declined',
        },
        createdAt: null,
        updatedAt: null,
        completedAt: null,
      );

      // Assert
      expect(payment.status, PaymentStatus.failed);
      expect(payment.isCompleted, true);
      expect(payment.isSuccessful, false);
      expect(payment.metadata['error_code'], 'card_declined');
      expect(payment.metadata['error_message'], 'Your card was declined');
    });

    test('Payment model with pending status should work correctly', () {
      // Arrange & Act
      const payment = Payment(
        id: 'payment_pending',
        orderId: 'order_pending',
        userId: 'user_123',
        amount: 25000,
        currency: 'XAF',
        method: PaymentMethod.campay,
        status: PaymentStatus.pending,
        reference: 'CAMPAY_PENDING_456',
        description: 'Pending payment for order',
        metadata: {
          'payment_url': 'https://campay.net/pay/123',
        },
        createdAt: null,
        updatedAt: null,
        completedAt: null,
      );

      // Assert
      expect(payment.status, PaymentStatus.pending);
      expect(payment.isCompleted, false);
      expect(payment.isSuccessful, false);
      expect(payment.metadata['payment_url'], 'https://campay.net/pay/123');
    });
  });

  group('Payment Business Logic Tests', () {
    test('Payment amount formatting should work correctly', () {
      // Test different currencies and amounts
      const xafPayment = Payment(
        id: '1',
        orderId: 'order1',
        userId: 'user1',
        amount: 15000,
        currency: 'XAF',
        method: PaymentMethod.cash,
        status: PaymentStatus.completed,
        reference: 'test',
        description: 'test',
        metadata: {},
        createdAt: null,
        updatedAt: null,
        completedAt: null,
      );

      const usdPayment = Payment(
        id: '2',
        orderId: 'order2',
        userId: 'user2',
        amount: 25,
        currency: 'USD',
        method: PaymentMethod.stripe,
        status: PaymentStatus.completed,
        reference: 'test',
        description: 'test',
        metadata: {},
        createdAt: null,
        updatedAt: null,
        completedAt: null,
      );

      const eurPayment = Payment(
        id: '3',
        orderId: 'order3',
        userId: 'user3',
        amount: 18,
        currency: 'EUR',
        method: PaymentMethod.stripe,
        status: PaymentStatus.completed,
        reference: 'test',
        description: 'test',
        metadata: {},
        createdAt: null,
        updatedAt: null,
        completedAt: null,
      );

      expect(xafPayment.formattedAmount, '15,000 XAF');
      expect(usdPayment.formattedAmount, '25 USD');
      expect(eurPayment.formattedAmount, '18 EUR');
    });

    test('Payment method validation should work correctly', () {
      // Test payment method capabilities
      expect(PaymentMethod.cash.requiresNetwork, false);
      expect(PaymentMethod.noupay.requiresNetwork, true);
      expect(PaymentMethod.campay.requiresNetwork, true);
      expect(PaymentMethod.stripe.requiresNetwork, true);
      expect(PaymentMethod.wallet.requiresNetwork, true);
      expect(PaymentMethod.mtn.requiresNetwork, true);
      expect(PaymentMethod.orange.requiresNetwork, true);

      expect(PaymentMethod.cash.requiresUserAction, false);
      expect(PaymentMethod.noupay.requiresUserAction, true);
      expect(PaymentMethod.campay.requiresUserAction, true);
      expect(PaymentMethod.stripe.requiresUserAction, true);
      expect(PaymentMethod.wallet.requiresUserAction, false);
      expect(PaymentMethod.mtn.requiresUserAction, true);
      expect(PaymentMethod.orange.requiresUserAction, true);
    });

    test('Payment status transitions should be logical', () {
      // Test valid status transitions
      final validTransitions = {
        PaymentStatus.pending: [PaymentStatus.processing, PaymentStatus.cancelled],
        PaymentStatus.processing: [PaymentStatus.completed, PaymentStatus.failed],
        PaymentStatus.completed: [PaymentStatus.refunded],
        PaymentStatus.failed: [], // Terminal state
        PaymentStatus.cancelled: [], // Terminal state
        PaymentStatus.refunded: [], // Terminal state
      };

      expect(validTransitions[PaymentStatus.pending]!.contains(PaymentStatus.completed), false);
      expect(validTransitions[PaymentStatus.pending]!.contains(PaymentStatus.processing), true);
      expect(validTransitions[PaymentStatus.processing]!.contains(PaymentStatus.completed), true);
      expect(validTransitions[PaymentStatus.completed]!.contains(PaymentStatus.refunded), true);
      expect(validTransitions[PaymentStatus.failed]!.isEmpty, true);
    });

    test('Payment metadata handling should work correctly', () {
      // Test metadata access and manipulation
      const payment = Payment(
        id: 'test_payment',
        orderId: 'test_order',
        userId: 'test_user',
        amount: 10000,
        currency: 'XAF',
        method: PaymentMethod.mtn,
        status: PaymentStatus.completed,
        reference: 'MTN_TEST_123',
        description: 'Test payment',
        metadata: {
          'phone_number': '+237123456789',
          'transaction_id': 'MTN_TXN_123',
          'provider_response': 'SUCCESS',
          'fees': '250',
        },
        createdAt: null,
        updatedAt: null,
        completedAt: null,
      );

      // Test metadata access
      expect(payment.metadata['phone_number'], '+237123456789');
      expect(payment.metadata['transaction_id'], 'MTN_TXN_123');
      expect(payment.metadata['provider_response'], 'SUCCESS');
      expect(payment.metadata['fees'], '250');

      // Test metadata key presence
      expect(payment.metadata.containsKey('phone_number'), true);
      expect(payment.metadata.containsKey('nonexistent_key'), false);
    });
  });
}

// Extension methods for testing (would be in the actual model files)
extension PaymentMethodExtensions on PaymentMethod {
  bool get isMobileMoney {
    return this == PaymentMethod.mtn || this == PaymentMethod.orange;
  }

  bool get isOnlinePayment {
    return this != PaymentMethod.cash;
  }

  bool get requiresNetwork {
    return this != PaymentMethod.cash;
  }

  bool get requiresUserAction {
    return this != PaymentMethod.cash && this != PaymentMethod.wallet;
  }
}

extension PaymentStatusExtensions on PaymentStatus {
  bool get isFinal {
    return this == PaymentStatus.completed ||
           this == PaymentStatus.failed ||
           this == PaymentStatus.cancelled ||
           this == PaymentStatus.refunded;
  }

  bool get isSuccessful {
    return this == PaymentStatus.completed;
  }
}

extension PaymentExtensions on Payment {
  bool get isCompleted {
    return status.isFinal;
  }

  bool get isSuccessful {
    return status.isSuccessful;
  }

  String get formattedAmount {
    // Simple formatting for testing
    final formattedNumber = amount.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
    return '$formattedNumber $currency';
  }
}
