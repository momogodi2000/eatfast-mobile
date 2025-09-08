/// Wallet models for the EatFast app
class Wallet {
  final String id;
  final String userId;
  final double balance;
  final String currency;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Transaction> recentTransactions;

  Wallet({
    required this.id,
    required this.userId,
    required this.balance,
    this.currency = 'XAF',
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
    this.recentTransactions = const [],
  });

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      balance: (json['balance'] ?? 0).toDouble(),
      currency: json['currency'] ?? 'XAF',
      isActive: json['isActive'] ?? true,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
      recentTransactions: json['recentTransactions'] != null
          ? (json['recentTransactions'] as List)
              .map((t) => Transaction.fromJson(t))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'balance': balance,
      'currency': currency,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'recentTransactions': recentTransactions.map((t) => t.toJson()).toList(),
    };
  }

  Wallet copyWith({
    String? id,
    String? userId,
    double? balance,
    String? currency,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Transaction>? recentTransactions,
  }) {
    return Wallet(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      recentTransactions: recentTransactions ?? this.recentTransactions,
    );
  }
}

/// Transaction model
class Transaction {
  final String id;
  final String walletId;
  final TransactionType type;
  final double amount;
  final String currency;
  final TransactionStatus status;
  final String? description;
  final String? reference;
  final String? orderId;
  final Map<String, dynamic>? metadata;
  final DateTime createdAt;

  Transaction({
    required this.id,
    required this.walletId,
    required this.type,
    required this.amount,
    this.currency = 'XAF',
    required this.status,
    this.description,
    this.reference,
    this.orderId,
    this.metadata,
    required this.createdAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] ?? '',
      walletId: json['walletId'] ?? '',
      type: TransactionType.fromString(json['type'] ?? 'unknown'),
      amount: (json['amount'] ?? 0).toDouble(),
      currency: json['currency'] ?? 'XAF',
      status: TransactionStatus.fromString(json['status'] ?? 'pending'),
      description: json['description'],
      reference: json['reference'],
      orderId: json['orderId'],
      metadata: json['metadata'],
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'walletId': walletId,
      'type': type.value,
      'amount': amount,
      'currency': currency,
      'status': status.value,
      'description': description,
      'reference': reference,
      'orderId': orderId,
      'metadata': metadata,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

/// Transaction types
enum TransactionType {
  topup('topup'),
  payment('payment'),
  refund('refund'),
  transfer('transfer'),
  bonus('bonus'),
  withdrawal('withdrawal');

  const TransactionType(this.value);
  final String value;

  static TransactionType fromString(String value) {
    return TransactionType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => TransactionType.payment,
    );
  }

  String get displayName {
    switch (this) {
      case TransactionType.topup:
        return 'Recharge';
      case TransactionType.payment:
        return 'Paiement';
      case TransactionType.refund:
        return 'Remboursement';
      case TransactionType.transfer:
        return 'Transfert';
      case TransactionType.bonus:
        return 'Bonus';
      case TransactionType.withdrawal:
        return 'Retrait';
    }
  }
}

/// Transaction status
enum TransactionStatus {
  pending('pending'),
  completed('completed'),
  failed('failed'),
  cancelled('cancelled');

  const TransactionStatus(this.value);
  final String value;

  static TransactionStatus fromString(String value) {
    return TransactionStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => TransactionStatus.pending,
    );
  }

  String get displayName {
    switch (this) {
      case TransactionStatus.pending:
        return 'En attente';
      case TransactionStatus.completed:
        return 'Terminé';
      case TransactionStatus.failed:
        return 'Échoué';
      case TransactionStatus.cancelled:
        return 'Annulé';
    }
  }
}

/// Top up request model
class TopUpRequest {
  final double amount;
  final String paymentMethod;
  final String? phoneNumber;
  final String? metadata;

  TopUpRequest({
    required this.amount,
    required this.paymentMethod,
    this.phoneNumber,
    this.metadata,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'paymentMethod': paymentMethod,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

/// Payment methods
enum PaymentMethod {
  campay('campay'),
  mtnMoney('mtn_money'),
  orangeMoney('orange_money'),
  card('card');

  const PaymentMethod(this.value);
  final String value;

  static PaymentMethod fromString(String value) {
    return PaymentMethod.values.firstWhere(
      (method) => method.value == value,
      orElse: () => PaymentMethod.campay,
    );
  }

  String get displayName {
    switch (this) {
      case PaymentMethod.campay:
        return 'CamPay';
      case PaymentMethod.mtnMoney:
        return 'MTN Money';
      case PaymentMethod.orangeMoney:
        return 'Orange Money';
      case PaymentMethod.card:
        return 'Carte bancaire';
    }
  }

  String get logoPath {
    switch (this) {
      case PaymentMethod.campay:
        return 'assets/images/campay_logo.png';
      case PaymentMethod.mtnMoney:
        return 'assets/images/mtn_logo.png';
      case PaymentMethod.orangeMoney:
        return 'assets/images/orange_logo.png';
      case PaymentMethod.card:
        return 'assets/images/card_logo.png';
    }
  }
}