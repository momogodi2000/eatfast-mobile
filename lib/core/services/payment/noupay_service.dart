/// NouPay Payment Service
/// Backup mobile money payment gateway for Cameroon
/// Acts as fallback when CamPay is unavailable
library;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../core/config/app_config.dart';
import 'payment_models.dart';
import 'payment_exceptions.dart';

class NouPayService {
  final Dio _dio;
  final String _baseUrl;
  final String _apiKey;

  NouPayService({
    Dio? dio,
    String? baseUrl,
    String? apiKey,
  })  : _dio = dio ?? Dio(),
        _baseUrl = baseUrl ?? AppConfig.noupayBaseUrl,
        _apiKey = apiKey ?? AppConfig.noupayApiKey {
    _configureDio();
  }

  void _configureDio() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'X-API-Key': _apiKey,
    };

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (log) => debugPrint('[NouPay] $log'),
      ));
    }
  }

  /// Initialize a payment transaction
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
        'amount': amount.toStringAsFixed(0),
        'currency': 'XAF',
        'phone_number': _formatPhoneNumber(phoneNumber),
        'description': description ?? 'Order #$orderId',
        'reference': orderId,
        'callback_url': AppConfig.noupayWebhookUrl,
        'return_url': AppConfig.noupayRedirectUrl,
        'payment_method': _mapProviderToNouPayMethod(provider),
        if (metadata != null) 'custom_data': metadata,
      };

      debugPrint('[NouPay] Initiating payment: $payload');

      final response = await _dio.post('/v1/payments/init', data: payload);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;

        return PaymentInitResponse(
          success: true,
          transactionId: data['transaction_id'] ?? data['id'] ?? '',
          paymentUrl: data['payment_url'],
          instructions: _getPaymentInstructions(provider, data),
          provider: PaymentProvider.noupay,
          expiresAt: DateTime.now().add(const Duration(minutes: 15)),
          additionalData: data,
        );
      }

      throw PaymentProviderException(
        'NouPay payment initialization failed',
        provider: PaymentProvider.noupay,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      throw PaymentProviderException(
        'Unexpected error during NouPay payment: $e',
        provider: PaymentProvider.noupay,
      );
    }
  }

  /// Check payment status
  Future<PaymentStatusResponse> checkPaymentStatus(String transactionId) async {
    try {
      final response = await _dio.get('/v1/payments/$transactionId/status');

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;

        return PaymentStatusResponse(
          transactionId: transactionId,
          status: _mapNouPayStatus(data['status']),
          amount: double.tryParse(data['amount']?.toString() ?? '0') ?? 0,
          currency: data['currency'] ?? 'XAF',
          provider: PaymentProvider.noupay,
          paidAt: data['status'] == 'completed' || data['status'] == 'success'
              ? DateTime.tryParse(data['completed_at'] ?? data['updated_at'] ?? '')
              : null,
          failureReason: data['status'] == 'failed' ? data['failure_reason'] : null,
          additionalData: data,
        );
      }

      throw PaymentProviderException(
        'Failed to check NouPay payment status',
        provider: PaymentProvider.noupay,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      throw PaymentProviderException(
        'Unexpected error checking NouPay status: $e',
        provider: PaymentProvider.noupay,
      );
    }
  }

  /// Verify webhook signature
  bool verifyWebhookSignature(String signature, String payload) {
    // Implementation would use HMAC verification with _apiKey
    if (kDebugMode) return true;

    // TODO: Implement proper signature verification
    return false;
  }

  /// Get supported payment providers
  List<PaymentProvider> getSupportedProviders() {
    return [
      PaymentProvider.mtnMomo,
      PaymentProvider.orangeMoney,
    ];
  }

  /// Check service health/availability
  Future<bool> checkAvailability() async {
    try {
      final response = await _dio.get(
        '/v1/health',
        options: Options(
          sendTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      );
      return response.statusCode == 200;
    } catch (e) {
      debugPrint('[NouPay] Service unavailable: $e');
      return false;
    }
  }

  // ===================== PRIVATE HELPERS =====================

  void _validatePaymentInputs(double amount, String phoneNumber) {
    if (amount <= 0) {
      throw PaymentValidationException('Amount must be greater than zero');
    }

    if (amount < 100) {
      throw PaymentValidationException('Minimum payment amount is 100 XAF');
    }

    if (amount > 2000000) {
      throw PaymentValidationException('Maximum payment amount is 2,000,000 XAF');
    }

    final cleanPhone = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    if (cleanPhone.length < 9) {
      throw PaymentValidationException('Invalid phone number format');
    }
  }

  String _formatPhoneNumber(String phoneNumber) {
    String cleaned = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

    // NouPay accepts numbers with or without country code
    if (cleaned.startsWith('237')) {
      return cleaned;
    } else if (cleaned.startsWith('6') && cleaned.length == 9) {
      return '237$cleaned';
    }

    return cleaned;
  }

  String _mapProviderToNouPayMethod(PaymentProvider provider) {
    switch (provider) {
      case PaymentProvider.mtnMomo:
        return 'MTN_MOMO';
      case PaymentProvider.orangeMoney:
        return 'ORANGE_MONEY';
      default:
        return 'MOBILE_MONEY';
    }
  }

  PaymentStatus _mapNouPayStatus(String? status) {
    switch (status?.toLowerCase()) {
      case 'completed':
      case 'success':
      case 'successful':
        return PaymentStatus.completed;
      case 'pending':
      case 'initiated':
        return PaymentStatus.pending;
      case 'processing':
        return PaymentStatus.processing;
      case 'failed':
      case 'error':
        return PaymentStatus.failed;
      case 'cancelled':
      case 'canceled':
        return PaymentStatus.cancelled;
      case 'expired':
        return PaymentStatus.expired;
      default:
        return PaymentStatus.unknown;
    }
  }

  String _getPaymentInstructions(PaymentProvider provider, Map<String, dynamic> data) {
    final ussdCode = data['ussd_code'] as String?;
    if (ussdCode != null) {
      return 'Composez $ussdCode sur votre téléphone pour confirmer le paiement.';
    }

    switch (provider) {
      case PaymentProvider.mtnMomo:
        return 'Vous recevrez une notification MTN MoMo pour confirmer le paiement. '
            'Vous pouvez aussi composer *126# pour vérifier.';
      case PaymentProvider.orangeMoney:
        return 'Vous recevrez une notification Orange Money pour confirmer le paiement. '
            'Vous pouvez aussi composer #150# pour vérifier.';
      default:
        return 'Veuillez suivre les instructions sur votre téléphone pour confirmer le paiement.';
    }
  }

  PaymentProviderException _handleDioException(DioException error) {
    String message = 'NouPay service error';

    if (error.response != null) {
      final data = error.response!.data;
      if (data is Map<String, dynamic>) {
        message = data['message'] ?? data['error'] ?? data['error_message'] ?? message;
      }

      return PaymentProviderException(
        message,
        provider: PaymentProvider.noupay,
        statusCode: error.response!.statusCode,
        originalError: error,
      );
    }

    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return PaymentProviderException(
        'NouPay connection timeout. Please try again.',
        provider: PaymentProvider.noupay,
        isTimeout: true,
        originalError: error,
      );
    }

    if (error.type == DioExceptionType.connectionError) {
      return PaymentProviderException(
        'Cannot connect to NouPay. Please check your internet connection.',
        provider: PaymentProvider.noupay,
        isNetworkError: true,
        originalError: error,
      );
    }

    return PaymentProviderException(
      message,
      provider: PaymentProvider.noupay,
      originalError: error,
    );
  }
}
