/// Comprehensive payment service implementing all backend payment methods
/// Supports Cash, CamPay, Stripe, NouPay, Mobile Money (MTN, Orange), and Wallet

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import '../../../core/services/api/api_client.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/config/app_config.dart';
import '../domain/models/payment.dart';

class PaymentService {
  static final PaymentService _instance = PaymentService._internal();
  factory PaymentService() => _instance;
  
  final ApiClient _apiClient = ApiClient();
  
  PaymentService._internal();

  /// Initialize payment for an order
  Future<PaymentResponse> initiatePayment(PaymentRequest request) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.createPaymentIntent,
        data: request.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return PaymentResponse.fromJson(response.data);
      } else {
        throw PaymentException(
          'Failed to initiate payment: ${response.statusMessage}',
          code: 'PAYMENT_INITIATION_FAILED',
        );
      }
    } on DioException catch (e) {
      throw PaymentException(
        _handleDioError(e),
        code: 'NETWORK_ERROR',
      );
    } catch (e) {
      throw PaymentException(
        'Unexpected error during payment initiation: $e',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  /// Process CamPay payment (Cameroon specific)
  Future<PaymentResponse> processCamPayPayment({
    required String orderId,
    required double amount,
    required String phoneNumber,
    String currency = 'XAF',
  }) async {
    if (!AppConfig.enableCamPayPayments) {
      throw const PaymentException(
        'CamPay payments are not enabled',
        code: 'PAYMENT_METHOD_DISABLED',
      );
    }

    try {
      final response = await _apiClient.post(
        ApiConstants.paymentCampayInitiate,
        data: {
          'orderId': orderId,
          'amount': amount,
          'currency': currency,
          'phoneNumber': _formatCameroonPhone(phoneNumber),
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return PaymentResponse.fromJson(response.data);
      } else {
        throw PaymentException(
          'CamPay payment failed: ${response.statusMessage}',
          code: 'CAMPAY_PAYMENT_FAILED',
        );
      }
    } on DioException catch (e) {
      throw PaymentException(
        _handleDioError(e),
        code: 'CAMPAY_NETWORK_ERROR',
      );
    }
  }

  /// Confirm CamPay payment with reference
  Future<PaymentResponse> confirmCamPayPayment({
    required String paymentId,
    required String reference,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.paymentCampayConfirm,
        data: {
          'paymentId': paymentId,
          'reference': reference,
        },
      );

      if (response.statusCode == 200) {
        return PaymentResponse.fromJson(response.data);
      } else {
        throw PaymentException(
          'CamPay confirmation failed: ${response.statusMessage}',
          code: 'CAMPAY_CONFIRMATION_FAILED',
        );
      }
    } on DioException catch (e) {
      throw PaymentException(
        _handleDioError(e),
        code: 'CAMPAY_CONFIRMATION_ERROR',
      );
    }
  }

  /// Process mobile money payment (MTN, Orange)
  Future<PaymentResponse> processMobileMoneyPayment({
    required String orderId,
    required double amount,
    required String phoneNumber,
    required MobileMoneyProvider provider,
    String currency = 'XAF',
  }) async {
    if (!AppConfig.enableMobileMoneyPayments) {
      throw const PaymentException(
        'Mobile Money payments are not enabled',
        code: 'PAYMENT_METHOD_DISABLED',
      );
    }

    try {
      final response = await _apiClient.post(
        '/payments/mobile-money/initiate',
        data: {
          'orderId': orderId,
          'amount': amount,
          'currency': currency,
          'phoneNumber': _formatCameroonPhone(phoneNumber),
          'provider': provider.code,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return PaymentResponse.fromJson(response.data);
      } else {
        throw PaymentException(
          '${provider.name} payment failed: ${response.statusMessage}',
          code: 'MOBILE_MONEY_PAYMENT_FAILED',
        );
      }
    } on DioException catch (e) {
      throw PaymentException(
        _handleDioError(e),
        code: 'MOBILE_MONEY_NETWORK_ERROR',
      );
    }
  }

  /// Process Stripe payment (Credit/Debit cards)
  Future<PaymentResponse> processStripePayment({
    required String orderId,
    required double amount,
    required String paymentMethodId,
    String currency = 'XAF',
    Map<String, dynamic>? billingDetails,
  }) async {
    if (!AppConfig.enableStripePayments) {
      throw const PaymentException(
        'Card payments are not enabled',
        code: 'PAYMENT_METHOD_DISABLED',
      );
    }

    try {
      final response = await _apiClient.post(
        '/payments/stripe/process',
        data: {
          'orderId': orderId,
          'amount': amount,
          'currency': currency,
          'paymentMethodId': paymentMethodId,
          if (billingDetails != null) 'billingDetails': billingDetails,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return PaymentResponse.fromJson(response.data);
      } else {
        throw PaymentException(
          'Card payment failed: ${response.statusMessage}',
          code: 'STRIPE_PAYMENT_FAILED',
        );
      }
    } on DioException catch (e) {
      throw PaymentException(
        _handleDioError(e),
        code: 'STRIPE_NETWORK_ERROR',
      );
    }
  }

  /// Process wallet payment
  Future<PaymentResponse> processWalletPayment({
    required String orderId,
    required double amount,
    String currency = 'XAF',
  }) async {
    if (!AppConfig.enableWalletPayments) {
      throw const PaymentException(
        'Wallet payments are not enabled',
        code: 'PAYMENT_METHOD_DISABLED',
      );
    }

    try {
      final response = await _apiClient.post(
        '/payments/wallet/charge',
        data: {
          'orderId': orderId,
          'amount': amount,
          'currency': currency,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return PaymentResponse.fromJson(response.data);
      } else {
        throw PaymentException(
          'Wallet payment failed: ${response.statusMessage}',
          code: 'WALLET_PAYMENT_FAILED',
        );
      }
    } on DioException catch (e) {
      throw PaymentException(
        _handleDioError(e),
        code: 'WALLET_NETWORK_ERROR',
      );
    }
  }

  /// Get payment status
  Future<Payment> getPaymentStatus(String paymentId) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.paymentStatus}/$paymentId',
      );

      if (response.statusCode == 200) {
        return Payment.fromJson(response.data);
      } else {
        throw PaymentException(
          'Failed to get payment status: ${response.statusMessage}',
          code: 'PAYMENT_STATUS_ERROR',
        );
      }
    } on DioException catch (e) {
      throw PaymentException(
        _handleDioError(e),
        code: 'NETWORK_ERROR',
      );
    }
  }

  /// Get available payment methods for user/order
  Future<List<PaymentMethod>> getAvailablePaymentMethods({
    String? orderId,
    double? amount,
    String? country = 'CM',
  }) async {
    try {
      final response = await _apiClient.get(
        '/payments/methods/available',
        queryParameters: {
          if (orderId != null) 'orderId': orderId,
          if (amount != null) 'amount': amount,
          if (country != null) 'country': country,
        },
      );

      if (response.statusCode == 200) {
        final methods = (response.data['methods'] as List)
            .map((method) => PaymentMethod.values.firstWhere(
                  (m) => m.code == method['code'],
                  orElse: () => PaymentMethod.cash,
                ))
            .toList();
        
        return methods;
      } else {
        // Return default methods if API call fails
        return _getDefaultPaymentMethods();
      }
    } catch (e) {
      // Return default methods if API call fails
      return _getDefaultPaymentMethods();
    }
  }

  /// Validate payment method requirements
  bool validatePaymentMethodRequirements(PaymentMethod method, {
    String? phoneNumber,
    Map<String, dynamic>? additionalData,
  }) {
    switch (method) {
      case PaymentMethod.cash:
        return true; // Cash always available

      case PaymentMethod.mtn:
      case PaymentMethod.orange:
      case PaymentMethod.campay:
        return phoneNumber != null && _isValidCameroonPhone(phoneNumber);

      case PaymentMethod.stripe:
        return true; // Card validation handled by Stripe

      case PaymentMethod.wallet:
        return true; // Wallet validation handled by backend

      case PaymentMethod.noupay:
        return true; // NouPay validation handled by provider

      default:
        return false;
    }
  }

  /// Get payment method fees
  Future<Map<PaymentMethod, double>> getPaymentMethodFees({
    required double amount,
    String currency = 'XAF',
  }) async {
    try {
      final response = await _apiClient.get(
        '/payments/fees',
        queryParameters: {
          'amount': amount,
          'currency': currency,
        },
      );

      if (response.statusCode == 200) {
        final feesData = response.data['fees'] as Map<String, dynamic>;
        final fees = <PaymentMethod, double>{};
        
        for (final method in PaymentMethod.values) {
          final fee = feesData[method.code];
          if (fee != null) {
            fees[method] = (fee as num).toDouble();
          }
        }
        
        return fees;
      }
    } catch (e) {
      debugPrint('Failed to fetch payment fees: $e');
    }
    
    // Return default fees
    return _getDefaultFees();
  }

  /// Private helper methods

  List<PaymentMethod> _getDefaultPaymentMethods() {
    final methods = <PaymentMethod>[PaymentMethod.cash];
    
    if (AppConfig.enableCamPayPayments) methods.add(PaymentMethod.campay);
    if (AppConfig.enableStripePayments) methods.add(PaymentMethod.stripe);
    if (AppConfig.enableNouPayPayments) methods.add(PaymentMethod.noupay);
    if (AppConfig.enableWalletPayments) methods.add(PaymentMethod.wallet);
    if (AppConfig.enableMobileMoneyPayments) {
      methods.addAll([PaymentMethod.mtn, PaymentMethod.orange]);
    }
    
    return methods;
  }

  Map<PaymentMethod, double> _getDefaultFees() {
    return {
      PaymentMethod.cash: 0.0,
      PaymentMethod.wallet: 0.0,
      PaymentMethod.campay: 100.0, // 100 FCFA
      PaymentMethod.stripe: 150.0, // 150 FCFA
      PaymentMethod.noupay: 50.0,  // 50 FCFA
      PaymentMethod.mtn: 200.0,    // 200 FCFA
      PaymentMethod.orange: 200.0, // 200 FCFA
    };
  }

  String _formatCameroonPhone(String phone) {
    // Remove any spaces or special characters
    final String cleaned = phone.replaceAll(RegExp(r'\D'), '');
    
    // Add country code if missing
    if (cleaned.startsWith('6') && cleaned.length == 9) {
      return '+237$cleaned';
    } else if (cleaned.startsWith('237') && cleaned.length == 12) {
      return '+$cleaned';
    } else if (cleaned.startsWith('+237') && cleaned.length == 13) {
      return cleaned;
    }
    
    return phone; // Return as-is if format is unclear
  }

  bool _isValidCameroonPhone(String phone) {
    final cameroonPhoneRegex = RegExp(r'^\+237[679]\d{8}$');
    return cameroonPhoneRegex.hasMatch(_formatCameroonPhone(phone));
  }

  String _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.sendTimeout:
        return 'Request timeout. Please try again.';
      case DioExceptionType.receiveTimeout:
        return 'Response timeout. Please try again.';
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = e.response?.data['message'] ?? e.response?.statusMessage;
        return 'Request failed ($statusCode): $message';
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.connectionError:
        return 'Connection error. Please check your internet connection.';
      case DioExceptionType.unknown:
      default:
        return 'An unexpected error occurred: ${e.message}';
    }
  }
}

/// Payment exception class
class PaymentException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;

  const PaymentException(
    this.message, {
    this.code,
    this.originalError,
  });

  @override
  String toString() {
    return 'PaymentException: $message${code != null ? ' (Code: $code)' : ''}';
  }
}