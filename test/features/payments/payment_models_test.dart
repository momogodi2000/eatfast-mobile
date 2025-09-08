impor    test('PaymentMethod enum should have correct values', () {
      // Test all payment method values
      expect(PaymentMethod.cash.code, 'cash');
      expect(PaymentMethod.noupay.code, 'noupay');
      expect(PaymentMethod.campay.code, 'campay');
      expect(PaymentMethod.stripe.code, 'stripe');
      expect(PaymentMethod.wallet.code, 'wallet');
      expect(PaymentMethod.mtn.code, 'mtn');
      expect(PaymentMethod.orange.code, 'orange');

      // Test display names
      expect(PaymentMethod.cash.displayName, 'Cash on Delivery');
      expect(PaymentMethod.noupay.displayName, 'NouPay');
      expect(PaymentMethod.campay.displayName, 'CamPay');
      expect(PaymentMethod.stripe.displayName, 'Credit/Debit Card');
      expect(PaymentMethod.wallet.displayName, 'EatFast Wallet');
      expect(PaymentMethod.mtn.displayName, 'MTN Mobile Money');
      expect(PaymentMethod.orange.displayName, 'Orange Money');
    });test/flutter_test.dart';
import '../../../lib/features/payments/domain/models/payment.dart';

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

    test('PaymentMethod should identify digital wallets correctly', () {
      // Test digital wallet identification
      expect(PaymentMethod.cash.isDigitalWallet, false);
      expect(PaymentMethod.noupay.isDigitalWallet, true);
      expect(PaymentMethod.campay.isDigitalWallet, false);
      expect(PaymentMethod.stripe.isDigitalWallet, false);
      expect(PaymentMethod.wallet.isDigitalWallet, true);
      expect(PaymentMethod.mtn.isDigitalWallet, false);
      expect(PaymentMethod.orange.isDigitalWallet, false);
    });

    test('PaymentStatus enum should have correct values', () {
      // Test all payment status values
      expect(PaymentStatus.pending.code, 'pending');
      expect(PaymentStatus.processing.code, 'processing');
      expect(PaymentStatus.completed.code, 'completed');
      expect(PaymentStatus.failed.code, 'failed');
      expect(PaymentStatus.cancelled.code, 'cancelled');
      expect(PaymentStatus.refunded.code, 'refunded');
    });
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
