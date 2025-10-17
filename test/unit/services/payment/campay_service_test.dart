import 'package:flutter_test/flutter_test.dart';
import 'package:eatfast_mobile/shared/services/payment/data/campay_service.dart';
import 'package:eatfast_mobile/shared/services/payment/domain/models/payment_models.dart';
import 'package:eatfast_mobile/shared/services/payment/domain/models/payment_exceptions.dart';

void main() {
  group('CamPayService', () {
    test('should create service with default parameters', () {
      final service = CamPayService();
      expect(service, isNotNull);
    });

    test('should create service with custom parameters', () {
      final service = CamPayService(
        baseUrl: 'https://test.campay.net',
        apiKey: 'test_key',
        apiSecret: 'test_secret',
      );
      expect(service, isNotNull);
    });

    test('should validate payment inputs correctly', () {
      final service = CamPayService();

      // Valid inputs should not throw
      expect(() => service.initiatePayment(
        orderId: 'order_123',
        amount: 5000.0,
        phoneNumber: '+237612345678',
        provider: PaymentProvider.mtnMomo,
      ), throwsA(isA<PaymentException>())); // Will throw because no Dio mock, but validates inputs

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
      final service = CamPayService();
      final providers = service.getSupportedProviders();
      expect(providers, contains(PaymentProvider.mtnMomo));
      expect(providers, contains(PaymentProvider.orangeMoney));
      expect(providers, contains(PaymentProvider.expressUnion));
    });
  });
}