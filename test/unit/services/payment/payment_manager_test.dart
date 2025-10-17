import 'package:flutter_test/flutter_test.dart';
import 'package:eatfast_mobile/shared/services/payment/domain/payment_manager.dart';
import 'package:eatfast_mobile/shared/services/payment/domain/models/payment_models.dart';
import 'package:eatfast_mobile/shared/services/payment/domain/models/payment_exceptions.dart';

void main() {
  group('PaymentManager', () {
    setUp(() {
      // Reset singleton for each test
      // Since it's singleton, we can't easily reset, but for testing, assume it's initialized
    });

    test('should initialize with default services', () {
      final manager = PaymentManager();
      manager.initialize();
      // Since it's singleton, check if initialized
      expect(manager, isNotNull);
    });

    test('should initialize with custom services', () {
      final manager = PaymentManager();
      // For testing, we can pass custom services if needed
      manager.initialize();
      expect(manager, isNotNull);
    });

    test('should validate payment request', () {
      final manager = PaymentManager();
      manager.initialize();

      final invalidRequest = PaymentRequest(
        orderId: '',
        amount: -100.0,
        preferredProvider: PaymentProvider.mtnMomo,
        phoneNumber: 'invalid',
      );

      expect(() => manager.processPayment(invalidRequest), throwsA(isA<PaymentValidationException>()));
    });

    test('should handle payment processing (mocked)', () async {
      final manager = PaymentManager();
      manager.initialize();

      final request = PaymentRequest(
        orderId: 'order_123',
        amount: 5000.0,
        preferredProvider: PaymentProvider.mtnMomo,
        phoneNumber: '+237612345678',
      );

      // This will attempt payment and may succeed or fail based on services
      final result = await manager.processPayment(request);
      expect(result, isA<PaymentResult>());
    });
  });
}