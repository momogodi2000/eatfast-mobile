import 'package:flutter_test/flutter_test.dart';
import 'package:eatfast_mobile/shared/services/payment/data/stripe_service.dart';
import 'package:eatfast_mobile/shared/services/payment/domain/models/payment_exceptions.dart';

void main() {
  group('StripeService', () {
    test('should create service with default parameters', () {
      final service = StripeService();
      expect(service, isNotNull);
    });

    test('should create service with custom parameters', () {
      final service = StripeService(
        publishableKey: 'pk_test_123',
        backendBaseUrl: 'https://test.api.com',
      );
      expect(service, isNotNull);
    });

    test('should validate payment inputs correctly', () {
      final service = StripeService();

      // Invalid amount should throw
      expect(() => service.createPaymentIntent(
        orderId: 'order_123',
        amount: -100.0,
      ), throwsA(isA<PaymentProviderException>()));

      // Valid amount should not throw validation error (though will fail without backend)
      expect(() => service.createPaymentIntent(
        orderId: 'order_123',
        amount: 5000.0,
      ), throwsA(isA<PaymentException>())); // Will throw due to no backend mock
    });
  });
}