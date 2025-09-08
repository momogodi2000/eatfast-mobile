import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_models.freezed.dart';
part 'wallet_models.g.dart';

/// Wallet model matching backend structure
@freezed
class Wallet with _$Wallet {
  const factory Wallet({
    required String id,
    required String userId,
    required double balance,
    required String currency,
    @Default(false) bool isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
}

/// Wallet transaction model
@freezed 
class WalletTransaction with _$WalletTransaction {
  const factory WalletTransaction({
    required String id,
    required String walletId,
    required String type, // 'credit', 'debit'
    required double amount,
    required String currency,
    required String description,
    String? reference,
    String? status,
    String? paymentMethod,
    Map<String, dynamic>? metadata,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _WalletTransaction;

  factory WalletTransaction.fromJson(Map<String, dynamic> json) => 
      _$WalletTransactionFromJson(json);
}

/// Wallet topup request
@freezed
class WalletTopupRequest with _$WalletTopupRequest {
  const factory WalletTopupRequest({
    required double amount,
    required String description,
    String? reference,
    @Default('campay') String paymentMethod,
  }) = _WalletTopupRequest;

  factory WalletTopupRequest.fromJson(Map<String, dynamic> json) => 
      _$WalletTopupRequestFromJson(json);
}

/// Wallet withdraw request  
@freezed
class WalletWithdrawRequest with _$WalletWithdrawRequest {
  const factory WalletWithdrawRequest({
    required double amount,
    required String description,
    String? reference,
    @Default('bank_transfer') String withdrawMethod,
    Map<String, dynamic>? withdrawDetails,
  }) = _WalletWithdrawRequest;

  factory WalletWithdrawRequest.fromJson(Map<String, dynamic> json) => 
      _$WalletWithdrawRequestFromJson(json);
}

/// Wallet response from API
@freezed
class WalletResponse with _$WalletResponse {
  const factory WalletResponse({
    required bool success,
    String? message,
    Wallet? data,
    String? error,
  }) = _WalletResponse;

  factory WalletResponse.fromJson(Map<String, dynamic> json) => 
      _$WalletResponseFromJson(json);
}

/// Wallet transactions response
@freezed
class WalletTransactionsResponse with _$WalletTransactionsResponse {
  const factory WalletTransactionsResponse({
    required bool success,
    String? message,
    List<WalletTransaction>? data,
    String? error,
    Map<String, dynamic>? pagination,
  }) = _WalletTransactionsResponse;

  factory WalletTransactionsResponse.fromJson(Map<String, dynamic> json) => 
      _$WalletTransactionsResponseFromJson(json);
}

/// Transaction type enum
enum TransactionType {
  credit,
  debit;

  String get displayName {
    switch (this) {
      case TransactionType.credit:
        return 'Crédit';
      case TransactionType.debit:
        return 'Débit';
    }
  }
}

/// Transaction status enum
enum TransactionStatus {
  pending,
  completed,
  failed,
  cancelled;

  String get displayName {
    switch (this) {
      case TransactionStatus.pending:
        return 'En Attente';
      case TransactionStatus.completed:
        return 'Terminée';
      case TransactionStatus.failed:
        return 'Échouée';
      case TransactionStatus.cancelled:
        return 'Annulée';
    }
  }
}