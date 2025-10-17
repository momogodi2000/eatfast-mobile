/// Stripe Payment Service
/// International card payment processing via Stripe
library;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:eatfast_mobile/shared/config/app_config.dart';
import '../domain/models/payment_models.dart';
import '../domain/models/payment_exceptions.dart';

class StripeService {
  final Dio _dio;

  /// Stripe publishable key reserved for client-side Stripe SDK initialization
  /// when implementing native payment sheet or card input UI.
  /// Currently, all Stripe operations are handled through the backend API.
  // ignore: unused_field
  final String _publishableKey;
  final String _backendBaseUrl;

  StripeService({Dio? dio, String? publishableKey, String? backendBaseUrl})
    : _dio = dio ?? Dio(),
      _publishableKey = publishableKey ?? AppConfig.stripePublishableKey,
      _backendBaseUrl = backendBaseUrl ?? AppConfig.apiBaseUrl {
    _configureDio();
  }

  void _configureDio() {
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.headers = {'Content-Type': 'application/json'};

    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (log) => debugPrint('[Stripe] $log'),
        ),
      );
    }
  }

  /// Create payment intent through backend
  /// Backend handles Stripe secret key for security
  Future<PaymentInitResponse> createPaymentIntent({
    required String orderId,
    required double amount,
    String? paymentMethodId,
    String? customerId,
    String? description,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      _validateAmount(amount);

      final payload = {
        'orderId': orderId,
        'amount': (amount * 100).toInt(), // Convert to cents
        'currency': 'xaf', // Stripe uses lowercase currency codes
        if (paymentMethodId != null) 'paymentMethodId': paymentMethodId,
        if (customerId != null) 'customerId': customerId,
        'description': description ?? 'Order #$orderId',
        if (metadata != null) 'metadata': metadata,
        'captureMethod': 'automatic',
      };

      debugPrint('[Stripe] Creating payment intent: $payload');

      // Call backend to create Stripe payment intent
      final response = await _dio.post(
        '$_backendBaseUrl/api/payments/stripe/create-intent',
        data: payload,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;

        return PaymentInitResponse(
          success: true,
          transactionId: data['paymentIntentId'] ?? '',
          paymentUrl: null, // Stripe uses client-side confirmation
          instructions:
              'Veuillez confirmer le paiement avec votre carte bancaire.',
          provider: PaymentProvider.stripe,
          expiresAt: null, // Stripe payment intents don't expire quickly
          additionalData: {
            'clientSecret': data['clientSecret'],
            'paymentIntentId': data['paymentIntentId'],
            'ephemeralKey': data['ephemeralKey'],
            'customerId': data['customerId'],
          },
        );
      }

      throw PaymentProviderException(
        'Stripe payment intent creation failed',
        provider: PaymentProvider.stripe,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      throw PaymentProviderException(
        'Unexpected error during Stripe payment: $e',
        provider: PaymentProvider.stripe,
      );
    }
  }

  /// Confirm payment intent
  /// Called after user confirms payment on client side
  Future<PaymentStatusResponse> confirmPayment(
    String paymentIntentId,
    String? paymentMethodId,
  ) async {
    try {
      final payload = {
        'paymentIntentId': paymentIntentId,
        if (paymentMethodId != null) 'paymentMethodId': paymentMethodId,
      };

      final response = await _dio.post(
        '$_backendBaseUrl/api/payments/stripe/confirm',
        data: payload,
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;

        return PaymentStatusResponse(
          transactionId: paymentIntentId,
          status: _mapStripeStatus(data['status']),
          amount: (data['amount'] ?? 0) / 100, // Convert from cents
          currency: data['currency']?.toUpperCase() ?? 'XAF',
          provider: PaymentProvider.stripe,
          paidAt: data['status'] == 'succeeded'
              ? DateTime.tryParse(data['created'] ?? '')
              : null,
          failureReason: data['last_payment_error']?['message'],
          additionalData: data,
        );
      }

      throw PaymentProviderException(
        'Stripe payment confirmation failed',
        provider: PaymentProvider.stripe,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      throw PaymentProviderException(
        'Unexpected error confirming Stripe payment: $e',
        provider: PaymentProvider.stripe,
      );
    }
  }

  /// Get payment status
  Future<PaymentStatusResponse> getPaymentStatus(String paymentIntentId) async {
    try {
      final response = await _dio.get(
        '$_backendBaseUrl/api/payments/stripe/intent/$paymentIntentId',
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;

        return PaymentStatusResponse(
          transactionId: paymentIntentId,
          status: _mapStripeStatus(data['status']),
          amount: (data['amount'] ?? 0) / 100,
          currency: data['currency']?.toUpperCase() ?? 'XAF',
          provider: PaymentProvider.stripe,
          paidAt: data['status'] == 'succeeded'
              ? DateTime.tryParse(data['created'] ?? '')
              : null,
          failureReason: data['last_payment_error']?['message'],
          additionalData: data,
        );
      }

      throw PaymentProviderException(
        'Failed to get Stripe payment status',
        provider: PaymentProvider.stripe,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      throw PaymentProviderException(
        'Unexpected error getting Stripe status: $e',
        provider: PaymentProvider.stripe,
      );
    }
  }

  /// Create customer for saved cards
  Future<String> createCustomer({
    required String email,
    required String name,
    String? phone,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final payload = {
        'email': email,
        'name': name,
        if (phone != null) 'phone': phone,
        if (metadata != null) 'metadata': metadata,
      };

      final response = await _dio.post(
        '$_backendBaseUrl/api/payments/stripe/customer',
        data: payload,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;
        return data['customerId'] ?? '';
      }

      throw PaymentProviderException(
        'Failed to create Stripe customer',
        provider: PaymentProvider.stripe,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      throw PaymentProviderException(
        'Unexpected error creating Stripe customer: $e',
        provider: PaymentProvider.stripe,
      );
    }
  }

  /// Get saved payment methods for customer
  Future<List<Map<String, dynamic>>> getSavedPaymentMethods(
    String customerId,
  ) async {
    try {
      final response = await _dio.get(
        '$_backendBaseUrl/api/payments/stripe/customer/$customerId/payment-methods',
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final methods = data['paymentMethods'] as List<dynamic>? ?? [];
        return methods.cast<Map<String, dynamic>>();
      }

      return [];
    } catch (e) {
      debugPrint('[Stripe] Error getting saved payment methods: $e');
      return [];
    }
  }

  /// Check if Stripe is available
  Future<bool> checkAvailability() async {
    try {
      final response = await _dio.get(
        '$_backendBaseUrl/api/payments/stripe/health',
        options: Options(
          sendTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      );
      return response.statusCode == 200;
    } catch (e) {
      debugPrint('[Stripe] Service unavailable: $e');
      return false;
    }
  }

  // ===================== PRIVATE HELPERS =====================

  void _validateAmount(double amount) {
    if (amount <= 0) {
      throw PaymentValidationException('Amount must be greater than zero');
    }

    // Stripe minimum is typically $0.50 or equivalent
    if (amount < 100) {
      throw PaymentValidationException('Minimum payment amount is 100 XAF');
    }

    // Stripe maximum varies by currency, XAF max is typically high
    if (amount > 99999999) {
      throw PaymentValidationException('Amount exceeds maximum allowed');
    }
  }

  PaymentStatus _mapStripeStatus(String? status) {
    switch (status) {
      case 'succeeded':
        return PaymentStatus.completed;
      case 'requires_payment_method':
      case 'requires_confirmation':
      case 'requires_action':
        return PaymentStatus.pending;
      case 'processing':
        return PaymentStatus.processing;
      case 'canceled':
        return PaymentStatus.cancelled;
      case 'failed':
        return PaymentStatus.failed;
      default:
        return PaymentStatus.unknown;
    }
  }

  PaymentProviderException _handleDioException(DioException error) {
    String message = 'Stripe service error';

    if (error.response != null) {
      final data = error.response!.data;
      if (data is Map<String, dynamic>) {
        message = data['error']?['message'] ?? data['message'] ?? message;
      }

      return PaymentProviderException(
        message,
        provider: PaymentProvider.stripe,
        statusCode: error.response!.statusCode,
        originalError: error,
      );
    }

    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return PaymentProviderException(
        'Stripe connection timeout. Please try again.',
        provider: PaymentProvider.stripe,
        isTimeout: true,
        originalError: error,
      );
    }

    if (error.type == DioExceptionType.connectionError) {
      return PaymentProviderException(
        'Cannot connect to Stripe. Please check your internet connection.',
        provider: PaymentProvider.stripe,
        isNetworkError: true,
        originalError: error,
      );
    }

    return PaymentProviderException(
      message,
      provider: PaymentProvider.stripe,
      originalError: error,
    );
  }
}
