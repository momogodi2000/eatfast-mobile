/// Wallet and payment models
library;

enum TransactionType {
  topup('topup'),
  payment('payment'),
  refund('refund'),
  bonus('bonus'),
  transfer('transfer'),
  withdrawal('withdrawal');

  const TransactionType(this.value);
  final String value;
}

enum PaymentMethod {
  mtnMoney('mtn_money'),
  orangeMoney('orange_money'),
  card('card'),
  bankTransfer('bank_transfer');

  const PaymentMethod(this.value);
  final String value;
}

class WalletTransaction {
  final String id;
  final TransactionType type;
  final double amount;
  final String description;
  final DateTime timestamp;
  final String? reference;

  const WalletTransaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.description,
    required this.timestamp,
    this.reference,
  });
}

class WalletState {
  final double balance;
  final List<WalletTransaction> transactions;
  final bool isLoading;
  final String? error;

  const WalletState({
    required this.balance,
    required this.transactions,
    this.isLoading = false,
    this.error,
  });

  WalletState copyWith({
    double? balance,
    List<WalletTransaction>? transactions,
    bool? isLoading,
    String? error,
  }) {
    return WalletState(
      balance: balance ?? this.balance,
      transactions: transactions ?? this.transactions,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class TopUpState {
  final double? amount;
  final PaymentMethod? paymentMethod;
  final String? phoneNumber;
  final bool isProcessing;
  final String? error;

  const TopUpState({
    this.amount,
    this.paymentMethod,
    this.phoneNumber,
    this.isProcessing = false,
    this.error,
  });

  TopUpState copyWith({
    double? amount,
    PaymentMethod? paymentMethod,
    String? phoneNumber,
    bool? isProcessing,
    String? error,
  }) {
    return TopUpState(
      amount: amount ?? this.amount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isProcessing: isProcessing ?? this.isProcessing,
      error: error,
    );
  }
}
