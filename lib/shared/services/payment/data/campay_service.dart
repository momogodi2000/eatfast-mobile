/// CamPay Payment Service
/// Primary mobile money payment gateway for Cameroon
/// Supports MTN Mobile Money, Orange Money, and Express Union Mobile
library;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:eatfast_mobile/shared/config/app_config.dart';
import '../domain/models/payment_models.dart';
import '../domain/models/payment_exceptions.dart';

class CamPayService {
  final Dio _dio;
  final String _baseUrl;
  final String _apiKey;
  // ignore: unused_field
  final String _apiSecret; // Reserved for webhook signature verification

  CamPayService({Dio? dio, String? baseUrl, String? apiKey, String? apiSecret})
    : _dio = dio ?? Dio(),
      _baseUrl = baseUrl ?? AppConfig.campayBaseUrl,
      _apiKey = apiKey ?? AppConfig.campayApiKey,
      _apiSecret = apiSecret ?? AppConfig.campayApiSecret {
    _configureDio();
  }

  void _configureDio() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $_apiKey',
    };

    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (log) => debugPrint('[CamPay] $log'),
        ),
      );
    }
  }

  /// Initialize a payment transaction
  /// Returns PaymentInitResponse with payment URL and transaction reference
  Future<PaymentInitResponse> initiatePayment({
    required String orderId,
    required double amount,
    required String phoneNumber,
    required PaymentProvider provider,
    String? description,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      // Validate inputs
      _validatePaymentInputs(amount, phoneNumber);

      final payload = {
        'amount': amount.toStringAsFixed(0), // CamPay requires integer
        'currency': 'XAF',
        'from': _formatPhoneNumber(phoneNumber),
        'description': description ?? 'Order #$orderId',
        'external_reference': orderId,
        'redirect_url': AppConfig.campayRedirectUrl,
        'webhook_url': AppConfig.campayWebhookUrl,
        if (metadata != null) 'metadata': metadata,
      };

      debugPrint('[CamPay] Initiating payment: $payload');

      final response = await _dio.post('/collect/', data: payload);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;

        return PaymentInitResponse(
          success: true,
          transactionId: data['reference'] ?? '',
          paymentUrl: data['ussd_code'],
          instructions: _getPaymentInstructions(provider, data['ussd_code']),
          provider: PaymentProvider.campay,
          expiresAt: DateTime.now().add(const Duration(minutes: 10)),
          additionalData: data,
        );
      }

      throw PaymentProviderException(
        'CamPay payment initialization failed',
        provider: PaymentProvider.campay,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      throw PaymentProviderException(
        'Unexpected error during CamPay payment: $e',
        provider: PaymentProvider.campay,
      );
    }
  }

  /// Check payment status
  /// Returns current status of the transaction
  Future<PaymentStatusResponse> checkPaymentStatus(String transactionId) async {
    try {
      final response = await _dio.get('/transaction/$transactionId/');

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;

        return PaymentStatusResponse(
          transactionId: transactionId,
          status: _mapCamPayStatus(data['status']),
          amount: double.tryParse(data['amount']?.toString() ?? '0') ?? 0,
          currency: data['currency'] ?? 'XAF',
          provider: PaymentProvider.campay,
          paidAt: data['status'] == 'SUCCESSFUL'
              ? DateTime.tryParse(data['updated_at'] ?? '')
              : null,
          failureReason: data['status'] == 'FAILED' ? data['reason'] : null,
          additionalData: data,
        );
      }

      throw PaymentProviderException(
        'Failed to check CamPay payment status',
        provider: PaymentProvider.campay,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      throw PaymentProviderException(
        'Unexpected error checking CamPay status: $e',
        provider: PaymentProvider.campay,
      );
    }
  }

  /// Verify webhook signature for security
  bool verifyWebhookSignature(String signature, String payload) {
    // Implementation would use HMAC-SHA256 with _apiSecret
    // For now, return true in development
    if (kDebugMode) return true;

    // TODO: Implement proper signature verification
    return false;
  }

  /// Get supported payment providers
  List<PaymentProvider> getSupportedProviders() {
    return [
      PaymentProvider.mtnMomo,
      PaymentProvider.orangeMoney,
      PaymentProvider.expressUnion,
    ];
  }

  // ===================== PRIVATE HELPERS =====================

  void _validatePaymentInputs(double amount, String phoneNumber) {
    if (amount <= 0) {
      throw PaymentValidationException('Amount must be greater than zero');
    }

    if (amount < 100) {
      throw PaymentValidationException('Minimum payment amount is 100 XAF');
    }

    if (amount > 1000000) {
      throw PaymentValidationException(
        'Maximum payment amount is 1,000,000 XAF',
      );
    }

    final cleanPhone = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    if (cleanPhone.length < 9) {
      throw PaymentValidationException('Invalid phone number format');
    }
  }

  String _formatPhoneNumber(String phoneNumber) {
    // Remove all non-digit characters
    String cleaned = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

    // Ensure it starts with 237 (Cameroon country code)
    if (cleaned.startsWith('237')) {
      return cleaned;
    } else if (cleaned.startsWith('6')) {
      return '237$cleaned';
    } else if (cleaned.length == 9) {
      return '237$cleaned';
    }

    return cleaned;
  }

  PaymentStatus _mapCamPayStatus(String? status) {
    switch (status?.toUpperCase()) {
      case 'SUCCESSFUL':
        return PaymentStatus.completed;
      case 'PENDING':
        return PaymentStatus.pending;
      case 'FAILED':
        return PaymentStatus.failed;
      case 'EXPIRED':
        return PaymentStatus.expired;
      default:
        return PaymentStatus.unknown;
    }
  }

  String _getPaymentInstructions(PaymentProvider provider, String? ussdCode) {
    if (ussdCode != null) {
      return 'Composez $ussdCode sur votre téléphone pour confirmer le paiement.';
    }

    switch (provider) {
      case PaymentProvider.mtnMomo:
        return 'Vous recevrez une notification MTN MoMo. Composez *126# pour confirmer.';
      case PaymentProvider.orangeMoney:
        return 'Vous recevrez une notification Orange Money. Composez #150# pour confirmer.';
      case PaymentProvider.expressUnion:
        return 'Vous recevrez une notification Express Union Mobile. Vérifiez votre téléphone.';
      default:
        return 'Suivez les instructions sur votre téléphone pour confirmer le paiement.';
    }
  }

  PaymentProviderException _handleDioException(DioException error) {
    String message = 'CamPay service error';

    if (error.response != null) {
      final data = error.response!.data;
      if (data is Map<String, dynamic>) {
        message = data['message'] ?? data['error'] ?? message;
      }

      return PaymentProviderException(
        message,
        provider: PaymentProvider.campay,
        statusCode: error.response!.statusCode,
        originalError: error,
      );
    }

    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return PaymentProviderException(
        'CamPay connection timeout. Please try again.',
        provider: PaymentProvider.campay,
        isTimeout: true,
        originalError: error,
      );
    }

    if (error.type == DioExceptionType.connectionError) {
      return PaymentProviderException(
        'Cannot connect to CamPay. Please check your internet connection.',
        provider: PaymentProvider.campay,
        isNetworkError: true,
        originalError: error,
      );
    }

    return PaymentProviderException(
      message,
      provider: PaymentProvider.campay,
      originalError: error,
    );
  }
}
