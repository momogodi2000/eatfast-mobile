import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api/api_client.dart';
import '../../constants/api_constants.dart';

/// Payment service for handling wallet, transactions, and payment processing
class PaymentService {
  static final PaymentService _instance = PaymentService._internal();
  factory PaymentService() => _instance;
  
  final ApiClient _apiClient = ApiClient();
  
  PaymentService._internal();
  
  /// Get wallet balance and info
  Future<WalletResponse> getWalletInfo() async {
    try {
      final response = await _apiClient.get(ApiConstants.wallet);
      
      if (response.statusCode == 200) {
        final wallet = Wallet.fromJson(response.data);
        return WalletResponse(
          wallet: wallet,
          success: true,
        );
      } else {
        return WalletResponse(
          success: false,
          error: response.data['message'] ?? 'Failed to load wallet info',
        );
      }
    } catch (e) {
      return WalletResponse(
        success: false,
        error: _handleError(e),
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
        return TopUpResponse(
          paymentUrl: response.data['paymentUrl'],
          transactionId: response.data['transactionId'],
          success: true,
        );
      } else {
        return TopUpResponse(
          success: false,
          error: response.data['message'] ?? 'Failed to initiate top up',
        );
      }
    } catch (e) {
      return TopUpResponse(
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Create payment intent for order
  Future<PaymentIntentResponse> createPaymentIntent(PaymentIntentRequest request) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.createPaymentIntent,
        data: request.toJson(),
      );
      
      if (response.statusCode == 200) {
        return PaymentIntentResponse(
          clientSecret: response.data['clientSecret'],
          paymentIntentId: response.data['paymentIntentId'],
          paymentUrl: response.data['paymentUrl'],
          success: true,
        );
      } else {
        return PaymentIntentResponse(
          success: false,
          error: response.data['message'] ?? 'Failed to create payment intent',
        );
      }
    } catch (e) {
      return PaymentIntentResponse(
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Confirm payment after successful card/mobile money payment
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
      return false;
    }
  }
  
  /// Pay with wallet balance
  Future<WalletPaymentResponse> payWithWallet(String orderId, double amount) async {
    try {
      final response = await _apiClient.post(
        '${ApiConstants.wallet}/pay',
        data: {
          'orderId': orderId,
          'amount': amount,
        },
      );
      
      if (response.statusCode == 200) {
        return WalletPaymentResponse(
          transactionId: response.data['transactionId'],
          newBalance: (response.data['newBalance'] as num).toDouble(),
          success: true,
        );
      } else {
        return WalletPaymentResponse(
          success: false,
          error: response.data['message'] ?? 'Payment failed',
        );
      }
    } catch (e) {
      return WalletPaymentResponse(
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Get transaction history
  Future<TransactionHistoryResponse> getTransactionHistory({
    int page = 1,
    int limit = 20,
    String? type, // topup, payment, refund, cashback
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
        final data = response.data;
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
          error: response.data['message'] ?? 'Failed to load transactions',
        );
      }
    } catch (e) {
      return TransactionHistoryResponse(
        transactions: [],
        pagination: PaginationInfo.empty(),
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Get available payment methods
  Future<PaymentMethodsResponse> getPaymentMethods() async {
    try {
      final response = await _apiClient.get(ApiConstants.paymentMethods);
      
      if (response.statusCode == 200) {
        final methods = (response.data['methods'] as List)
            .map((json) => PaymentMethod.fromJson(json))
            .toList();
        
        return PaymentMethodsResponse(
          methods: methods,
          success: true,
        );
      } else {
        return PaymentMethodsResponse(
          methods: [],
          success: false,
          error: response.data['message'] ?? 'Failed to load payment methods',
        );
      }
    } catch (e) {
      return PaymentMethodsResponse(
        methods: [],
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Process mobile money payment (Noupai/Orange Money/MTN Mobile Money)
  Future<MobileMoneyResponse> processMobileMoney(MobileMoneyRequest request) async {
    try {
      final response = await _apiClient.post(
        '${ApiConstants.paymentMethods}/mobile-money',
        data: request.toJson(),
      );
      
      if (response.statusCode == 200) {
        return MobileMoneyResponse(
          transactionId: response.data['transactionId'],
          status: response.data['status'],
          reference: response.data['reference'],
          success: true,
        );
      } else {
        return MobileMoneyResponse(
          success: false,
          error: response.data['message'] ?? 'Mobile money payment failed',
        );
      }
    } catch (e) {
      return MobileMoneyResponse(
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Check payment status
  Future<PaymentStatusResponse> checkPaymentStatus(String transactionId) async {
    try {
      final response = await _apiClient.get('${ApiConstants.paymentStatus}/$transactionId');
      
      if (response.statusCode == 200) {
        return PaymentStatusResponse(
          status: response.data['status'],
          amount: (response.data['amount'] as num?)?.toDouble(),
          transactionId: response.data['transactionId'],
          success: true,
        );
      } else {
        return PaymentStatusResponse(
          status: 'failed',
          success: false,
          error: response.data['message'] ?? 'Failed to check payment status',
        );
      }
    } catch (e) {
      return PaymentStatusResponse(
        status: 'failed',
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Request refund
  Future<bool> requestRefund(RefundRequest request) async {
    try {
      final response = await _apiClient.post(
        '${ApiConstants.wallet}/refund',
        data: request.toJson(),
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Get cashback offers
  Future<CashbackOffersResponse> getCashbackOffers() async {
    try {
      final response = await _apiClient.get('${ApiConstants.wallet}/cashback');
      
      if (response.statusCode == 200) {
        final offers = (response.data['offers'] as List)
            .map((json) => CashbackOffer.fromJson(json))
            .toList();
        
        return CashbackOffersResponse(
          offers: offers,
          success: true,
        );
      } else {
        return CashbackOffersResponse(
          offers: [],
          success: false,
          error: response.data['message'] ?? 'Failed to load cashback offers',
        );
      }
    } catch (e) {
      return CashbackOffersResponse(
        offers: [],
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  String _handleError(dynamic error) {
    if (error.response != null) {
      final data = error.response.data;
      if (data is Map<String, dynamic> && data.containsKey('message')) {
        return data['message'];
      }
      return 'Server error: ${error.response.statusCode}';
    }
    return 'Network error occurred';
  }
}

// Response models

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
  final String? paymentUrl;
  final String? transactionId;
  final bool success;
  final String? error;
  
  TopUpResponse({
    this.paymentUrl,
    this.transactionId,
    required this.success,
    this.error,
  });
}

class PaymentIntentResponse {
  final String? clientSecret;
  final String? paymentIntentId;
  final String? paymentUrl;
  final bool success;
  final String? error;
  
  PaymentIntentResponse({
    this.clientSecret,
    this.paymentIntentId,
    this.paymentUrl,
    required this.success,
    this.error,
  });
}

class WalletPaymentResponse {
  final String? transactionId;
  final double? newBalance;
  final bool success;
  final String? error;
  
  WalletPaymentResponse({
    this.transactionId,
    this.newBalance,
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

class PaymentMethodsResponse {
  final List<PaymentMethod> methods;
  final bool success;
  final String? error;
  
  PaymentMethodsResponse({
    required this.methods,
    required this.success,
    this.error,
  });
}

class MobileMoneyResponse {
  final String? transactionId;
  final String? status;
  final String? reference;
  final bool success;
  final String? error;
  
  MobileMoneyResponse({
    this.transactionId,
    this.status,
    this.reference,
    required this.success,
    this.error,
  });
}

class PaymentStatusResponse {
  final String status;
  final double? amount;
  final String? transactionId;
  final bool success;
  final String? error;
  
  PaymentStatusResponse({
    required this.status,
    this.amount,
    this.transactionId,
    required this.success,
    this.error,
  });
}

class CashbackOffersResponse {
  final List<CashbackOffer> offers;
  final bool success;
  final String? error;
  
  CashbackOffersResponse({
    required this.offers,
    required this.success,
    this.error,
  });
}

// Data models

class Wallet {
  final double balance;
  final String currency;
  final double totalSpent;
  final double totalTopUp;
  final int transactionCount;
  final List<String> paymentMethods;
  
  Wallet({
    required this.balance,
    required this.currency,
    required this.totalSpent,
    required this.totalTopUp,
    required this.transactionCount,
    required this.paymentMethods,
  });
  
  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      balance: (json['balance'] ?? 0).toDouble(),
      currency: json['currency'] ?? 'XAF',
      totalSpent: (json['totalSpent'] ?? 0).toDouble(),
      totalTopUp: (json['totalTopUp'] ?? 0).toDouble(),
      transactionCount: json['transactionCount'] ?? 0,
      paymentMethods: List<String>.from(json['paymentMethods'] ?? []),
    );
  }
}

class TopUpRequest {
  final double amount;
  final String paymentMethod; // card, mobile-money, bank-transfer
  final Map<String, dynamic>? paymentDetails;
  
  TopUpRequest({
    required this.amount,
    required this.paymentMethod,
    this.paymentDetails,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'paymentMethod': paymentMethod,
      if (paymentDetails != null) ...paymentDetails!,
    };
  }
}

class PaymentIntentRequest {
  final String orderId;
  final double amount;
  final String paymentMethod;
  final Map<String, dynamic>? metadata;
  
  PaymentIntentRequest({
    required this.orderId,
    required this.amount,
    required this.paymentMethod,
    this.metadata,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'amount': amount,
      'paymentMethod': paymentMethod,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

class Transaction {
  final String transactionId;
  final String type; // topup, payment, refund, cashback
  final double amount;
  final String currency;
  final String status; // pending, completed, failed
  final String description;
  final DateTime createdAt;
  final String? orderId;
  final String? reference;
  
  Transaction({
    required this.transactionId,
    required this.type,
    required this.amount,
    required this.currency,
    required this.status,
    required this.description,
    required this.createdAt,
    this.orderId,
    this.reference,
  });
  
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      transactionId: json['transactionId'] as String,
      type: json['type'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] ?? 'XAF',
      status: json['status'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      orderId: json['orderId'] as String?,
      reference: json['reference'] as String?,
    );
  }
}

class PaymentMethod {
  final String id;
  final String name;
  final String type; // card, mobile-money, wallet, bank-transfer
  final String? logo;
  final bool isActive;
  final Map<String, dynamic>? metadata;
  
  PaymentMethod({
    required this.id,
    required this.name,
    required this.type,
    this.logo,
    required this.isActive,
    this.metadata,
  });
  
  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      logo: json['logo'] as String?,
      isActive: json['isActive'] ?? true,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }
}

class MobileMoneyRequest {
  final double amount;
  final String phoneNumber;
  final String provider; // noupai, orange, mtn
  final String orderId;
  
  MobileMoneyRequest({
    required this.amount,
    required this.phoneNumber,
    required this.provider,
    required this.orderId,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'phoneNumber': phoneNumber,
      'provider': provider,
      'orderId': orderId,
    };
  }
}

class RefundRequest {
  final String orderId;
  final String transactionId;
  final double amount;
  final String reason;
  
  RefundRequest({
    required this.orderId,
    required this.transactionId,
    required this.amount,
    required this.reason,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'transactionId': transactionId,
      'amount': amount,
      'reason': reason,
    };
  }
}

class CashbackOffer {
  final String id;
  final String title;
  final String description;
  final double percentage;
  final double? maxAmount;
  final double? minOrderAmount;
  final DateTime? validUntil;
  final bool isActive;
  final String? restaurantId;
  
  CashbackOffer({
    required this.id,
    required this.title,
    required this.description,
    required this.percentage,
    this.maxAmount,
    this.minOrderAmount,
    this.validUntil,
    required this.isActive,
    this.restaurantId,
  });
  
  factory CashbackOffer.fromJson(Map<String, dynamic> json) {
    return CashbackOffer(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      percentage: (json['percentage'] as num).toDouble(),
      maxAmount: (json['maxAmount'] as num?)?.toDouble(),
      minOrderAmount: (json['minOrderAmount'] as num?)?.toDouble(),
      validUntil: json['validUntil'] != null
          ? DateTime.parse(json['validUntil'] as String)
          : null,
      isActive: json['isActive'] ?? true,
      restaurantId: json['restaurantId'] as String?,
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
  
  factory PaginationInfo.empty() {
    return PaginationInfo(
      total: 0,
      page: 1,
      limit: 20,
      totalPages: 0,
    );
  }
}

// Provider for payment service
final paymentServiceProvider = Provider<PaymentService>((ref) => PaymentService());
