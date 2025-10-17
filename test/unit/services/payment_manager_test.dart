import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:eatfast_mobile/shared/services/payment/campay_service.dart';
import 'package:eatfast_mobile/shared/services/payment/noupai_service.dart';
import 'package:eatfast_mobile/shared/services/payment/stripe_service.dart';
import 'package:eatfast_mobile/shared/services/payment/payment_manager.dart';
import 'package:eatfast_mobile/shared/services/api_client.dart';

// Mocks
class MockCamPayService extends Mock implements CamPayService {}
class MockNouPayService extends Mock implements NouPayService {}
class MockStripeService extends Mock implements StripeService {}
class MockApiClient extends Mock implements ApiClient {}

void main() {
  late PaymentManager paymentManager;
  late MockCamPayService mockCamPay;
  late MockNouPayService mockNouPay;
  late MockStripeService mockStripe;
  late MockApiClient mockApiClient;

  setUp(() {
    mockCamPay = MockCamPayService();
    mockNouPay = MockNouPayService();
    mockStripe = MockStripeService();
    mockApiClient = MockApiClient();
    paymentManager = PaymentManager(mockCamPay, mockNouPay, mockStripe, mockApiClient);
  });

  group('PaymentManager', () {
    test('should attempt CamPay first', () async {
      // Arrange
      final request = PaymentRequest(
        amount: 100.0,
        currency: 'XAF',
        orderId: 'order123',
        phoneNumber: '237123456789',
      );

      when(mockCamPay.initiatePayment(
        amount: 100.0,
        phoneNumber: '237123456789',
        orderId: 'order123',
      )).thenAnswer((_) async => {'transactionId': 'tx123', 'status': 'success'});

      when(mockApiClient.post('/payments/verify', data: {
        'transactionId': 'tx123',
        'method': 'camPay',
        'idempotencyKey': any,
      })).thenAnswer((_) async => Response(
            data: {'status': 'success'},
            requestOptions: RequestOptions(path: '/payments/verify'),
          ));

      // Act
      final result = await paymentManager.processPayment(request);

      // Assert
      expect(result.status, PaymentStatus.success);
      expect(result.method, PaymentMethod.camPay);
      verify(mockCamPay.initiatePayment(
        amount: 100.0,
        phoneNumber: '237123456789',
        orderId: 'order123',
      )).called(1);
    });

    test('should fallback to NouPay on CamPay failure', () async {
      // Arrange
      final request = PaymentRequest(
        amount: 100.0,
        currency: 'XAF',
        orderId: 'order123',
        phoneNumber: '237123456789',
      );

      when(mockCamPay.initiatePayment(any, any, any))
          .thenThrow(Exception('CamPay failed'));

      when(mockNouPay.initiatePayment(
        amount: anyNamed('amount'),
        phoneNumber: anyNamed('phoneNumber'),
        orderId: anyNamed('orderId'),
      )).thenAnswer((_) async => {'transactionId': 'tx456', 'status': 'success'});

      when(mockApiClient.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => Response(data: {'status': 'success'}, requestOptions: RequestOptions()));

      // Act
      final result = await paymentManager.processPayment(request);

      // Assert
      expect(result.status, PaymentStatus.success);
      expect(result.method, PaymentMethod.nouPay);
      verify(mockNouPay.initiatePayment(
        amount: 100.0,
        phoneNumber: '237123456789',
        orderId: 'order123',
      )).called(1);
    });

    test('should use Stripe for card payments', () async {
      // Arrange
      final request = PaymentRequest(
        amount: 100.0,
        currency: 'XAF',
        orderId: 'order123',
        cardDetails: {'paymentMethodId': 'pm123'},
      );

      when(mockStripe.createPaymentIntent(
        amount: anyNamed('amount'),
        currency: anyNamed('currency'),
        orderId: anyNamed('orderId'),
      )).thenAnswer((_) async => {'id': 'pi123'});

      when(mockStripe.confirmPayment(
        paymentIntentId: anyNamed('paymentIntentId'),
        paymentMethodId: anyNamed('paymentMethodId'),
      )).thenAnswer((_) async => {'status': 'succeeded'});

      when(mockApiClient.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => Response(data: {'status': 'success'}, requestOptions: RequestOptions()));

      // Act
      final result = await paymentManager.processPayment(request);

      // Assert
      expect(result.status, PaymentStatus.success);
      expect(result.method, PaymentMethod.stripe);
    });
  });
}