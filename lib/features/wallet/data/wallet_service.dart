import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/api/api_client.dart';
import '../../../core/constants/api_constants.dart';
import '../domain/models/wallet.dart';

/// Wallet service for handling wallet operations
class WalletService {
  final ApiClient _apiClient;

  WalletService(this._apiClient);

  /// Get wallet information
  Future<WalletResponse> getWallet() async {
    try {
      final response = await _apiClient.get(ApiConstants.wallet);

      if (response.statusCode == 200) {
        final wallet = Wallet.fromJson(response.data['data']);
        return WalletResponse(
          wallet: wallet,
          success: true,
        );
      } else {
        return WalletResponse(
          success: false,
          error: response.data['error'] ?? 'Failed to load wallet',
        );
      }
    } on DioException catch (e) {
      return WalletResponse(
        success: false,
        error: _handleDioError(e),
      );
    } catch (e) {
      return WalletResponse(
        success: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  /// Top up wallet
  Future<TopUpResponse> topUpWallet(TopUpRequest request) async {
    try {
      final response = await _apiClient.post(
        '${ApiConstants.wallet}/topup',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        final data = response.data['data'];
        return TopUpResponse(
          transactionId: data['transactionId'],
          paymentUrl: data['paymentUrl'],
          reference: data['reference'],
          success: true,
        );
      } else {
        return TopUpResponse(
          success: false,
          error: response.data['error'] ?? 'Failed to initiate top up',
        );
      }
    } on DioException catch (e) {
      return TopUpResponse(
        success: false,
        error: _handleDioError(e),
      );
    } catch (e) {
      return TopUpResponse(
        success: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  /// Get transaction history
  Future<TransactionHistoryResponse> getTransactionHistory({
    int page = 1,
    int limit = 20,
    TransactionType? type,
    TransactionStatus? status,
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.wallet}/transactions',
        queryParameters: {
          'page': page.toString(),
          'limit': limit.toString(),
          if (type != null) 'type': type.value,
          if (status != null) 'status': status.value,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data['data'];
        final transactions = (data['transactions'] as List)
            .map((json) => Transaction.fromJson(json))
            .toList();

        return TransactionHistoryResponse(
          transactions: transactions,
          pagination: PaginationInfo.fromJson(data['pagination']),
          success: true,
        );
      } else {
        return TransactionHistoryResponse(
          transactions: [],
          pagination: PaginationInfo.empty(),
          success: false,
          error: response.data['error'] ?? 'Failed to load transactions',
        );
      }
    } on DioException catch (e) {
      return TransactionHistoryResponse(
        transactions: [],
        pagination: PaginationInfo.empty(),
        success: false,
        error: _handleDioError(e),
      );
    } catch (e) {
      return TransactionHistoryResponse(
        transactions: [],
        pagination: PaginationInfo.empty(),
        success: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  /// Check transaction status
  Future<TransactionStatusResponse> getTransactionStatus(String transactionId) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.wallet}/transactions/$transactionId',
      );

      if (response.statusCode == 200) {
        final transaction = Transaction.fromJson(response.data['data']);
        return TransactionStatusResponse(
          transaction: transaction,
          success: true,
        );
      } else {
        return TransactionStatusResponse(
          success: false,
          error: response.data['error'] ?? 'Failed to get transaction status',
        );
      }
    } on DioException catch (e) {
      return TransactionStatusResponse(
        success: false,
        error: _handleDioError(e),
      );
    } catch (e) {
      return TransactionStatusResponse(
        success: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  String _handleDioError(DioException e) {
    if (e.response?.data != null && e.response?.data['error'] != null) {
      return e.response!.data['error'];
    }

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.badResponse:
        return 'Server error. Please try again later.';
      case DioExceptionType.connectionError:
        return 'Network error. Please check your internet connection.';
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }
}

/// Wallet response models
class WalletResponse {
  final Wallet? wallet;
  final bool success;
  final String? error;

  WalletResponse({
    this.wallet,
    required this.success,
    this.error,
  });
}

class TopUpResponse {
  final String? transactionId;
  final String? paymentUrl;
  final String? reference;
  final bool success;
  final String? error;

  TopUpResponse({
    this.transactionId,
    this.paymentUrl,
    this.reference,
    required this.success,
    this.error,
  });
}

class TransactionHistoryResponse {
  final List<Transaction> transactions;
  final PaginationInfo pagination;
  final bool success;
  final String? error;

  TransactionHistoryResponse({
    required this.transactions,
    required this.pagination,
    required this.success,
    this.error,
  });
}

class TransactionStatusResponse {
  final Transaction? transaction;
  final bool success;
  final String? error;

  TransactionStatusResponse({
    this.transaction,
    required this.success,
    this.error,
  });
}

/// Pagination info model
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

  factory PaginationInfo.empty() {
    return PaginationInfo(
      total: 0,
      page: 1,
      limit: 20,
      totalPages: 0,
    );
  }
}

/// Provider for wallet service
final walletServiceProvider = Provider<WalletService>((ref) {
  return WalletService(ApiClient());
});