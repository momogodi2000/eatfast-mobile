/// Unified Payment Service - Backend Aligned
/// Consolidates all payment functionality with proper CamPay->NouPay->Stripe failover
/// Mirrors exactly the backend payment processing logic

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import '../api/api_client.dart';
import '../../constants/api_constants.dart';
import '../../config/app_config.dart';

class UnifiedPaymentService {
  static final UnifiedPaymentService _instance = UnifiedPaymentService._internal();
  factory UnifiedPaymentService() => _instance;

  final ApiClient _apiClient = ApiClient();

  UnifiedPaymentService._internal();

  /// Process payment with automatic failover (CamPay -> NouPay -> Stripe)
  /// This mirrors the backend failover logic exactly
  Future<PaymentResponse> processPayment({
    required String orderId,
    required double amount,
    required PaymentMethod method,
    String currency = 'XAF',
    String? phoneNumber,
    String? paymentMethodId,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      // Use backend payment endpoint with failover logic
      final response = await _apiClient.post(
        ApiConstants.createPaymentIntent,
        data: {
          'orderId': orderId,
          'amount': amount,
          'paymentMethod': method.backendValue,
          'currency': currency,
          if (phoneNumber != null) 'phoneNumber': phoneNumber,
          if (paymentMethodId != null) 'paymentMethodId': paymentMethodId,
          if (metadata != null) 'metadata': metadata,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return PaymentResponse.fromJson(response.data);
      } else {
        throw PaymentException(
          'Payment failed: ${response.statusMessage}',
          code: 'PAYMENT_FAILED',
        );
      }
    } on DioException catch (e) {
      throw PaymentException(
        _handleDioError(e),
        code: 'NETWORK_ERROR',
      );
    }
  }

  /// Confirm payment (called after successful payment)
  Future<bool> confirmPayment(String paymentIntentId, String orderId) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.confirmPayment,
        data: {
          'paymentIntentId': paymentIntentId,
          'orderId': orderId,
        },
      );
      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Payment confirmation failed: $e');
      return false;
    }
  }

  /// Check payment status
  Future<PaymentStatusResponse> checkPaymentStatus(String paymentId) async {
    try {
      final response = await _apiClient.get('${ApiConstants.paymentStatus}/$paymentId');

      if (response.statusCode == 200) {
        return PaymentStatusResponse.fromJson(response.data);
      } else {
        throw PaymentException(
          'Failed to check payment status',
          code: 'STATUS_CHECK_FAILED',
        );
      }
    } on DioException catch (e) {
      throw PaymentException(
        _handleDioError(e),
        code: 'NETWORK_ERROR',
      );
    }
  }

  /// Get available payment methods from backend
  Future<List<PaymentMethod>> getAvailablePaymentMethods() async {
    try {
      final response = await _apiClient.get(ApiConstants.paymentMethods);

      if (response.statusCode == 200) {
        final methods = (response.data['methods'] as List)
            .map((method) => PaymentMethod.fromBackendValue(method['type']))
            .where((method) => method != null)
            .cast<PaymentMethod>()
            .toList();
        return methods;
      }

      // Fallback to default methods if backend call fails
      return _getDefaultPaymentMethods();
    } catch (e) {
      debugPrint('Failed to get payment methods from backend: $e');
      return _getDefaultPaymentMethods();
    }
  }

  /// Wallet operations
  Future<WalletResponse> getWalletInfo() async {
    try {
      final response = await _apiClient.get(ApiConstants.wallet);

      if (response.statusCode == 200) {
        return WalletResponse.fromJson(response.data);
      } else {
        throw PaymentException(
          'Failed to load wallet info',
          code: 'WALLET_LOAD_FAILED',
        );
      }
    } on DioException catch (e) {
      throw PaymentException(
        _handleDioError(e),
        code: 'NETWORK_ERROR',
      );
    }
  }

  /// Top up wallet
  Future<PaymentResponse> topUpWallet({
    required double amount,
    required PaymentMethod method,
    String? phoneNumber,
    String? paymentMethodId,
  }) async {
    try {
      final response = await _apiClient.post(
        '${ApiConstants.wallet}/topup',
        data: {
          'amount': amount,
          'paymentMethod': method.backendValue,
          if (phoneNumber != null) 'phoneNumber': phoneNumber,
          if (paymentMethodId != null) 'paymentMethodId': paymentMethodId,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return PaymentResponse.fromJson(response.data);
      } else {
        throw PaymentException(
          'Wallet top-up failed',
          code: 'TOPUP_FAILED',
        );
      }
    } on DioException catch (e) {
      throw PaymentException(
        _handleDioError(e),
        code: 'NETWORK_ERROR',
      );
    }
  }

  /// Pay with wallet
  Future<PaymentResponse> payWithWallet({
    required String orderId,
    required double amount,
  }) async {
    try {
      final response = await _apiClient.post(
        '${ApiConstants.wallet}/pay',
        data: {
          'orderId': orderId,
          'amount': amount,
        },
      );

      if (response.statusCode == 200) {
        return PaymentResponse.fromJson(response.data);
      } else {
        throw PaymentException(
          'Wallet payment failed',
          code: 'WALLET_PAYMENT_FAILED',
        );
      }
    } on DioException catch (e) {
      throw PaymentException(
        _handleDioError(e),
        code: 'NETWORK_ERROR',
      );
    }
  }

  /// Get transaction history
  Future<TransactionHistoryResponse> getTransactionHistory({
    int page = 1,
    int limit = 20,
    String? type,
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.wallet}/transactions',
        queryParameters: {
          'page': page.toString(),
          'limit': limit.toString(),
          if (type != null) 'type': type,
        },
      );

      if (response.statusCode == 200) {
        return TransactionHistoryResponse.fromJson(response.data);
      } else {
        throw PaymentException(
          'Failed to load transaction history',
          code: 'TRANSACTION_HISTORY_FAILED',
        );
      }
    } on DioException catch (e) {
      throw PaymentException(
        _handleDioError(e),
        code: 'NETWORK_ERROR',
      );
    }
  }

  /// Private helper methods

  List<PaymentMethod> _getDefaultPaymentMethods() {
    final methods = <PaymentMethod>[PaymentMethod.cash];

    if (AppConfig.enableCamPayPayments) methods.add(PaymentMethod.campay);
    if (AppConfig.enableNouPayPayments) methods.add(PaymentMethod.noupay);
    if (AppConfig.enableStripePayments) methods.add(PaymentMethod.stripe);
    if (AppConfig.enableWalletPayments) methods.add(PaymentMethod.wallet);
    if (AppConfig.enableMobileMoneyPayments) {
      methods.addAll([PaymentMethod.mtn, PaymentMethod.orange]);
    }

    return methods;
  }

  String _handleDioError(DioException error) {
    if (error.response != null) {
      final data = error.response!.data;
      if (data is Map<String, dynamic> && data.containsKey('message')) {
        return data['message'];
      }
      return 'Server error: ${error.response!.statusCode}';
    }
    return 'Network error occurred';
  }
}

// Data Models

enum PaymentMethod {
  cash('cash'),
  campay('campay'),
  noupay('noupay'),
  stripe('stripe'),
  wallet('wallet'),
  mtn('mtn'),
  orange('orange');

  const PaymentMethod(this.backendValue);
  final String backendValue;

  static PaymentMethod? fromBackendValue(String value) {
    for (final method in PaymentMethod.values) {
      if (method.backendValue == value) return method;
    }
    return null;
  }

  String get displayName {
    switch (this) {
      case PaymentMethod.cash:
        return 'Espèces';
      case PaymentMethod.campay:
        return 'CamPay';
      case PaymentMethod.noupay:
        return 'NouPay';
      case PaymentMethod.stripe:
        return 'Carte bancaire';
      case PaymentMethod.wallet:
        return 'Portefeuille';
      case PaymentMethod.mtn:
        return 'MTN Mobile Money';
      case PaymentMethod.orange:
        return 'Orange Money';
    }
  }
}

enum PaymentStatus {
  pending('pending'),
  processing('processing'),
  completed('completed'),
  failed('failed'),
  cancelled('cancelled');

  const PaymentStatus(this.value);
  final String value;

  static PaymentStatus fromValue(String value) {
    for (final status in PaymentStatus.values) {
      if (status.value == value) return status;
    }
    return PaymentStatus.failed;
  }
}

class PaymentResponse {
  final String paymentId;
  final PaymentStatus status;
  final String? paymentUrl;
  final String? instructions;
  final String? gatewayUsed;
  final Map<String, dynamic>? additionalData;

  PaymentResponse({
    required this.paymentId,
    required this.status,
    this.paymentUrl,
    this.instructions,
    this.gatewayUsed,
    this.additionalData,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) {
    return PaymentResponse(
      paymentId: json['paymentId'] ?? json['id'] ?? '',
      status: PaymentStatus.fromValue(json['status'] ?? 'pending'),
      paymentUrl: json['paymentUrl'],
      instructions: json['instructions'],
      gatewayUsed: json['gateway'] ?? json['provider'],
      additionalData: json['additionalData'] ?? json['metadata'],
    );
  }
}

class PaymentStatusResponse {
  final PaymentStatus status;
  final double? amount;
  final String? transactionId;
  final String? gatewayUsed;

  PaymentStatusResponse({
    required this.status,
    this.amount,
    this.transactionId,
    this.gatewayUsed,
  });

  factory PaymentStatusResponse.fromJson(Map<String, dynamic> json) {
    return PaymentStatusResponse(
      status: PaymentStatus.fromValue(json['status']),
      amount: (json['amount'] as num?)?.toDouble(),
      transactionId: json['transactionId'],
      gatewayUsed: json['gateway'] ?? json['provider'],
    );
  }
}

class WalletResponse {
  final double balance;
  final String currency;
  final List<Transaction> recentTransactions;

  WalletResponse({
    required this.balance,
    required this.currency,
    required this.recentTransactions,
  });

  factory WalletResponse.fromJson(Map<String, dynamic> json) {
    return WalletResponse(
      balance: (json['balance'] ?? 0).toDouble(),
      currency: json['currency'] ?? 'XAF',
      recentTransactions: (json['recentTransactions'] as List? ?? [])
          .map((t) => Transaction.fromJson(t))
          .toList(),
    );
  }
}

class TransactionHistoryResponse {
  final List<Transaction> transactions;
  final PaginationInfo pagination;

  TransactionHistoryResponse({
    required this.transactions,
    required this.pagination,
  });

  factory TransactionHistoryResponse.fromJson(Map<String, dynamic> json) {
    return TransactionHistoryResponse(
      transactions: (json['transactions'] as List? ?? [])
          .map((t) => Transaction.fromJson(t))
          .toList(),
      pagination: PaginationInfo.fromJson(json['pagination'] ?? {}),
    );
  }
}

class Transaction {
  final String id;
  final String type;
  final double amount;
  final String currency;
  final PaymentStatus status;
  final DateTime createdAt;
  final String? description;
  final String? orderId;

  Transaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.currency,
    required this.status,
    required this.createdAt,
    this.description,
    this.orderId,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] ?? json['transactionId'] ?? '',
      type: json['type'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      currency: json['currency'] ?? 'XAF',
      status: PaymentStatus.fromValue(json['status'] ?? 'pending'),
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      description: json['description'],
      orderId: json['orderId'],
    );
  }
}

class PaginationInfo {
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  PaginationInfo({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory PaginationInfo.fromJson(Map<String, dynamic> json) {
    return PaginationInfo(
      total: json['total'] ?? 0,
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 20,
      totalPages: json['totalPages'] ?? 0,
    );
  }
}

class PaymentException implements Exception {
  final String message;
  final String code;
  final Exception? originalError;

  const PaymentException(
    this.message, {
    required this.code,
    this.originalError,
  });

  @override
  String toString() => 'PaymentException: $message (Code: $code)';
}