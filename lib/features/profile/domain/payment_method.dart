/// Available payment method types in Cameroon
enum PaymentMethodType {
  mtnMobileMoney('mtn_mobile_money', 'MTN Mobile Money', 'assets/images/mtn_logo.png'),
  orangeMoney('orange_money', 'Orange Money', 'assets/images/orange_logo.png'),
  euMobile('eu_mobile', 'EU Mobile', 'assets/images/eu_mobile_logo.png'),
  cashOnDelivery('cash_on_delivery', 'Cash on Delivery', 'assets/images/cash_icon.png'),
  creditCard('credit_card', 'Credit Card', 'assets/images/card_icon.png'),
  bankTransfer('bank_transfer', 'Bank Transfer', 'assets/images/bank_icon.png');

  const PaymentMethodType(this.id, this.displayName, this.iconPath);

  final String id;
  final String displayName;
  final String iconPath;

  /// Get payment method by ID
  static PaymentMethodType? fromId(String id) {
    try {
      return PaymentMethodType.values.firstWhere((type) => type.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Check if this is a mobile money type
  bool get isMobileMoney {
    return this == PaymentMethodType.mtnMobileMoney ||
           this == PaymentMethodType.orangeMoney ||
           this == PaymentMethodType.euMobile;
  }

  /// Check if this requires phone number
  bool get requiresPhoneNumber => isMobileMoney;

  /// Check if this is cash payment
  bool get isCashPayment => this == PaymentMethodType.cashOnDelivery;

  /// Check if this is card payment
  bool get isCardPayment => this == PaymentMethodType.creditCard;
}

/// Represents a user's payment method
class PaymentMethod {
  final String id;
  final String userId;
  final PaymentMethodType type;
  final String displayName;
  final String? phoneNumber; // For mobile money
  final String? cardLastFour; // For credit cards
  final String? cardBrand; // For credit cards
  final String? accountNumber; // For bank transfers
  final String? bankName; // For bank transfers
  final bool isDefault;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Map<String, dynamic>? metadata;

  const PaymentMethod({
    required this.id,
    required this.userId,
    required this.type,
    required this.displayName,
    this.phoneNumber,
    this.cardLastFour,
    this.cardBrand,
    this.accountNumber,
    this.bankName,
    this.isDefault = false,
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
    this.metadata,
  });

  /// Create PaymentMethod from JSON
  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    final typeId = json['type'] as String? ?? json['payment_type'] as String;
    final type = PaymentMethodType.fromId(typeId) ?? PaymentMethodType.cashOnDelivery;

    return PaymentMethod(
      id: json['id'] as String,
      userId: json['userId'] as String? ?? json['user_id'] as String,
      type: type,
      displayName: json['displayName'] as String? ?? json['display_name'] as String? ?? type.displayName,
      phoneNumber: json['phoneNumber'] as String? ?? json['phone_number'] as String?,
      cardLastFour: json['cardLastFour'] as String? ?? json['card_last_four'] as String?,
      cardBrand: json['cardBrand'] as String? ?? json['card_brand'] as String?,
      accountNumber: json['accountNumber'] as String? ?? json['account_number'] as String?,
      bankName: json['bankName'] as String? ?? json['bank_name'] as String?,
      isDefault: json['isDefault'] as bool? ?? json['is_default'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? json['is_active'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String? ?? json['created_at'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String? ?? json['updated_at'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  /// Convert PaymentMethod to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'type': type.id,
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'cardLastFour': cardLastFour,
      'cardBrand': cardBrand,
      'accountNumber': accountNumber,
      'bankName': bankName,
      'isDefault': isDefault,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'metadata': metadata,
    };
  }

  /// Create a copy with updated values
  PaymentMethod copyWith({
    String? id,
    String? userId,
    PaymentMethodType? type,
    String? displayName,
    String? phoneNumber,
    String? cardLastFour,
    String? cardBrand,
    String? accountNumber,
    String? bankName,
    bool? isDefault,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, dynamic>? metadata,
  }) {
    return PaymentMethod(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      displayName: displayName ?? this.displayName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      cardLastFour: cardLastFour ?? this.cardLastFour,
      cardBrand: cardBrand ?? this.cardBrand,
      accountNumber: accountNumber ?? this.accountNumber,
      bankName: bankName ?? this.bankName,
      isDefault: isDefault ?? this.isDefault,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      metadata: metadata ?? this.metadata,
    );
  }

  /// Get display subtitle for the payment method
  String get subtitle {
    switch (type) {
      case PaymentMethodType.mtnMobileMoney:
      case PaymentMethodType.orangeMoney:
      case PaymentMethodType.euMobile:
        return phoneNumber != null ? 'Phone: $phoneNumber' : 'Mobile Money';
      
      case PaymentMethodType.creditCard:
        final brand = cardBrand ?? 'Card';
        final lastFour = cardLastFour ?? '****';
        return '$brand ending in $lastFour';
      
      case PaymentMethodType.bankTransfer:
        final bank = bankName ?? 'Bank';
        final account = accountNumber != null ? 
          '***${accountNumber!.substring(accountNumber!.length - 4)}' : '****';
        return '$bank - $account';
      
      case PaymentMethodType.cashOnDelivery:
        return 'Pay with cash upon delivery';
    }
  }

  /// Get masked account info for display
  String? get maskedAccountInfo {
    if (phoneNumber != null) {
      if (phoneNumber!.length >= 4) {
        return '***${phoneNumber!.substring(phoneNumber!.length - 4)}';
      }
      return phoneNumber;
    }
    
    if (accountNumber != null) {
      if (accountNumber!.length >= 4) {
        return '***${accountNumber!.substring(accountNumber!.length - 4)}';
      }
      return accountNumber;
    }
    
    return null;
  }

  /// Check if payment method has required information
  bool get isComplete {
    switch (type) {
      case PaymentMethodType.mtnMobileMoney:
      case PaymentMethodType.orangeMoney:
      case PaymentMethodType.euMobile:
        return phoneNumber != null && phoneNumber!.isNotEmpty;
      
      case PaymentMethodType.creditCard:
        return cardLastFour != null && cardLastFour!.isNotEmpty;
      
      case PaymentMethodType.bankTransfer:
        return accountNumber != null && accountNumber!.isNotEmpty &&
               bankName != null && bankName!.isNotEmpty;
      
      case PaymentMethodType.cashOnDelivery:
        return true; // No additional info needed
    }
  }

  /// Get verification status text
  String get verificationStatus {
    // In a real app, you would check with the backend
    if (type.isCashPayment) return 'Ready to use';
    return isComplete ? 'Verified' : 'Needs verification';
  }

  /// Check if payment method needs verification
  bool get needsVerification {
    return !type.isCashPayment && !isComplete;
  }

  @override
  String toString() {
    return 'PaymentMethod(id: $id, type: ${type.displayName}, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PaymentMethod && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
