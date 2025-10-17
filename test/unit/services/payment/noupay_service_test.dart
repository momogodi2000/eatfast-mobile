import 'package:flutter_test/flutter_test.dart';
import 'package:eatfast_mobile/shared/services/payment/data/noupay_service.dart';
import 'package:eatfast_mobile/shared/services/payment/domain/models/payment_models.dart';
import 'package:eatfast_mobile/shared/services/payment/domain/models/payment_exceptions.dart';

void main() {
  group('NouPayService', () {
    test('should create service with default parameters', () {
      final service = NouPayService();
      expect(service, isNotNull);
    });

    test('should create service with custom parameters', () {
      final service = NouPayService(
        baseUrl: 'https://test.noupay.net',
        apiKey: 'test_key',
      );
      expect(service, isNotNull);
    });

    test('should validate payment inputs correctly', () {
      final service = NouPayService();

      // Invalid amount should throw
      expect(() => service.initiatePayment(
        orderId: 'order_123',
        amount: -100.0,
        phoneNumber: '+237612345678',
        provider: PaymentProvider.mtnMomo,
      ), throwsA(isA<PaymentProviderException>()));

      // Invalid phone number should throw
      expect(() => service.initiatePayment(
        orderId: 'order_123',
        amount: 5000.0,
        phoneNumber: '123',
        provider: PaymentProvider.mtnMomo,
      ), throwsA(isA<PaymentProviderException>()));
    });

    test('should return supported providers', () {
      final service = NouPayService();
      final providers = service.getSupportedProviders();
      expect(providers, contains(PaymentProvider.mtnMomo));
      expect(providers, contains(PaymentProvider.orangeMoney));
    });
  });
}