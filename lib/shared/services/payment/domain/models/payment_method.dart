/// Payment method model for the payment system
enum PaymentMethodType {
  campay('campay'),
  noupay('noupay'),
  stripe('stripe'),
  wallet('wallet'),
  cash('cash'),
  bankTransfer('bank_transfer');

  const PaymentMethodType(this.value);
  final String value;

  static PaymentMethodType fromString(String value) {
    return PaymentMethodType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => PaymentMethodType.campay,
    );
  }

  String get displayName {
    switch (this) {
      case PaymentMethodType.campay:
        return 'Mobile Money (CamPay)';
      case PaymentMethodType.noupay:
        return 'Mobile Money (NouPay)';
      case PaymentMethodType.stripe:
        return 'Carte bancaire (Stripe)';
      case PaymentMethodType.wallet:
        return 'Portefeuille EatFast';
      case PaymentMethodType.cash:
        return 'Espèces à la livraison';
      case PaymentMethodType.bankTransfer:
        return 'Virement bancaire';
    }
  }

  bool get isOnline => [
    PaymentMethodType.campay,
    PaymentMethodType.noupay,
    PaymentMethodType.stripe,
    PaymentMethodType.wallet,
  ].contains(this);

  bool get requiresVerification => [
    PaymentMethodType.campay,
    PaymentMethodType.noupay,
    PaymentMethodType.stripe,
  ].contains(this);
}

/// Payment method model
class PaymentMethod {
  final String id;
  final PaymentMethodType type;
  final String displayName;
  final String? last4Digits;
  final String? cardBrand;
  final String? phoneNumber;
  final bool isDefault;
  final Map<String, dynamic>? metadata;
  final DateTime createdAt;
  final DateTime? expiresAt;

  const PaymentMethod({
    required this.id,
    required this.type,
    required this.displayName,
    this.last4Digits,
    this.cardBrand,
    this.phoneNumber,
    this.isDefault = false,
    this.metadata,
    required this.createdAt,
    this.expiresAt,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'] ?? '',
      type: PaymentMethodType.fromString(json['type'] ?? 'campay'),
      displayName: json['displayName'] ?? '',
      last4Digits: json['last4Digits'],
      cardBrand: json['cardBrand'],
      phoneNumber: json['phoneNumber'],
      isDefault: json['isDefault'] ?? false,
      metadata: json['metadata'],
      createdAt: DateTime.parse(
        json['createdAt'] ?? DateTime.now().toIso8601String(),
      ),
      expiresAt: json['expiresAt'] != null
          ? DateTime.parse(json['expiresAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.value,
      'displayName': displayName,
      if (last4Digits != null) 'last4Digits': last4Digits,
      if (cardBrand != null) 'cardBrand': cardBrand,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      'isDefault': isDefault,
      if (metadata != null) 'metadata': metadata,
      'createdAt': createdAt.toIso8601String(),
      if (expiresAt != null) 'expiresAt': expiresAt!.toIso8601String(),
    };
  }

  PaymentMethod copyWith({
    String? id,
    PaymentMethodType? type,
    String? displayName,
    String? last4Digits,
    String? cardBrand,
    String? phoneNumber,
    bool? isDefault,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? expiresAt,
  }) {
    return PaymentMethod(
      id: id ?? this.id,
      type: type ?? this.type,
      displayName: displayName ?? this.displayName,
      last4Digits: last4Digits ?? this.last4Digits,
      cardBrand: cardBrand ?? this.cardBrand,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isDefault: isDefault ?? this.isDefault,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  bool get isExpired {
    if (expiresAt == null) return false;
    return expiresAt!.isBefore(DateTime.now());
  }

  bool get isCard => type == PaymentMethodType.stripe;
  bool get isMobileMoney =>
      type == PaymentMethodType.campay || type == PaymentMethodType.noupay;
  bool get isWallet => type == PaymentMethodType.wallet;
  bool get isCash => type == PaymentMethodType.cash;

  /// Whether this payment method requires a phone number
  bool get requiresPhoneNumber => isMobileMoney;

  /// Icon name for this payment method type
  String get icon {
    switch (type) {
      case PaymentMethodType.campay:
      case PaymentMethodType.noupay:
        return 'phone';
      case PaymentMethodType.stripe:
        return 'credit_card';
      case PaymentMethodType.wallet:
        return 'account_balance_wallet';
      case PaymentMethodType.cash:
        return 'money';
      case PaymentMethodType.bankTransfer:
        return 'account_balance';
    }
  }

  String get shortDescription {
    if (isCard && last4Digits != null) {
      return '${cardBrand ?? 'Card'} •••• $last4Digits';
    } else if (isMobileMoney && phoneNumber != null) {
      final masked = phoneNumber!.length > 4
          ? '•••• ${phoneNumber!.substring(phoneNumber!.length - 4)}'
          : phoneNumber!;
      return '$displayName $masked';
    }
    return displayName;
  }

  @override
  String toString() => shortDescription;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PaymentMethod && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
