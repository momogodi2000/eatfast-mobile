enum PaymentMethod {
  cash('cash', 'Cash on Delivery'),
  noupay('noupay', 'NouPay'),
  campay('campay', 'CamPay'),
  stripe('stripe', 'Credit/Debit Card'),
  wallet('wallet', 'EatFast Wallet'),
  mtn('mtn', 'MTN Mobile Money'),
  orange('orange', 'Orange Money');

  const PaymentMethod(this.code, this.displayName);
  final String code;
  final String displayName;

  String get icon {
    switch (this) {
      case PaymentMethod.cash:
        return 'assets/icons/cash.png';
      case PaymentMethod.noupay:
        return 'assets/icons/noupay.png';
      case PaymentMethod.campay:
        return 'assets/icons/campay.png';
      case PaymentMethod.stripe:
        return 'assets/icons/stripe.png';
      case PaymentMethod.wallet:
        return 'assets/icons/wallet.png';
      case PaymentMethod.mtn:
        return 'assets/icons/mtn.png';
      case PaymentMethod.orange:
        return 'assets/icons/orange.png';
    }
  }

  bool get requiresPhoneNumber {
    return this == PaymentMethod.mtn || this == PaymentMethod.orange || this == PaymentMethod.campay;
  }

  bool get isDigitalWallet {
    return this == PaymentMethod.wallet || this == PaymentMethod.noupay;
  }

  bool get isMobileMoney {
    return this == PaymentMethod.mtn || this == PaymentMethod.orange;
  }
}

enum PaymentStatus {
  pending('pending'),
  processing('processing'),
  completed('completed'),
  failed('failed'),
  cancelled('cancelled'),
  refunded('refunded');

  const PaymentStatus(this.code);
  final String code;
}

class Payment {
  final String id;
  final String orderId;
  final String? customerId;
  final double amount;
  final String currency;
  final PaymentMethod method;
  final PaymentStatus status;
  final String? transactionId;
  final String? externalId;
  final Map<String, dynamic>? metadata;
  final DateTime createdAt;
  final DateTime? completedAt;
  final String? failureReason;
  final String? phoneNumber;
  final String? operatorReference;

  const Payment({
    required this.id,
    required this.orderId,
    this.customerId,
    required this.amount,
    required this.currency,
    required this.method,
    required this.status,
    this.transactionId,
    this.externalId,
    this.metadata,
    required this.createdAt,
    this.completedAt,
    this.failureReason,
    this.phoneNumber,
    this.operatorReference,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'] as String,
      orderId: json['orderId'] as String,
      customerId: json['customerId'] as String?,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String? ?? 'XAF',
      method: PaymentMethod.values.firstWhere(
        (m) => m.code == json['method'],
        orElse: () => PaymentMethod.cash,
      ),
      status: PaymentStatus.values.firstWhere(
        (s) => s.code == json['status'],
        orElse: () => PaymentStatus.pending,
      ),
      transactionId: json['transactionId'] as String?,
      externalId: json['externalId'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'] as String)
          : null,
      failureReason: json['failureReason'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      operatorReference: json['operatorReference'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderId': orderId,
      'customerId': customerId,
      'amount': amount,
      'currency': currency,
      'method': method.code,
      'status': status.code,
      'transactionId': transactionId,
      'externalId': externalId,
      'metadata': metadata,
      'createdAt': createdAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
      'failureReason': failureReason,
      'phoneNumber': phoneNumber,
      'operatorReference': operatorReference,
    };
  }

  Payment copyWith({
    String? id,
    String? orderId,
    String? customerId,
    double? amount,
    String? currency,
    PaymentMethod? method,
    PaymentStatus? status,
    String? transactionId,
    String? externalId,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? completedAt,
    String? failureReason,
    String? phoneNumber,
    String? operatorReference,
  }) {
    return Payment(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      customerId: customerId ?? this.customerId,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      method: method ?? this.method,
      status: status ?? this.status,
      transactionId: transactionId ?? this.transactionId,
      externalId: externalId ?? this.externalId,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      failureReason: failureReason ?? this.failureReason,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      operatorReference: operatorReference ?? this.operatorReference,
    );
  }
}

class PaymentRequest {
  final String orderId;
  final double amount;
  final String currency;
  final PaymentMethod method;
  final String? phoneNumber;
  final Map<String, dynamic>? metadata;
  final String? returnUrl;
  final String? cancelUrl;

  const PaymentRequest({
    required this.orderId,
    required this.amount,
    required this.currency,
    required this.method,
    this.phoneNumber,
    this.metadata,
    this.returnUrl,
    this.cancelUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'amount': amount,
      'currency': currency,
      'method': method.code,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (metadata != null) 'metadata': metadata,
      if (returnUrl != null) 'returnUrl': returnUrl,
      if (cancelUrl != null) 'cancelUrl': cancelUrl,
    };
  }
}

class PaymentResponse {
  final String paymentId;
  final PaymentStatus status;
  final String? paymentUrl;
  final String? qrCode;
  final String? instructions;
  final Map<String, dynamic>? additionalData;

  const PaymentResponse({
    required this.paymentId,
    required this.status,
    this.paymentUrl,
    this.qrCode,
    this.instructions,
    this.additionalData,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) {
    return PaymentResponse(
      paymentId: json['paymentId'] as String,
      status: PaymentStatus.values.firstWhere(
        (s) => s.code == json['status'],
        orElse: () => PaymentStatus.pending,
      ),
      paymentUrl: json['paymentUrl'] as String?,
      qrCode: json['qrCode'] as String?,
      instructions: json['instructions'] as String?,
      additionalData: json['additionalData'] as Map<String, dynamic>?,
    );
  }
}

class MobileMoneyProvider {
  final String code;
  final String name;
  final String icon;
  final String color;
  final List<String> supportedCountries;

  const MobileMoneyProvider({
    required this.code,
    required this.name,
    required this.icon,
    required this.color,
    required this.supportedCountries,
  });

  static const mtn = MobileMoneyProvider(
    code: 'mtn',
    name: 'MTN Mobile Money',
    icon: 'assets/icons/mtn.png',
    color: '#FFCF00',
    supportedCountries: ['CM', 'UG', 'RW', 'GH'],
  );

  static const orange = MobileMoneyProvider(
    code: 'orange',
    name: 'Orange Money',
    icon: 'assets/icons/orange.png',
    color: '#FF7900',
    supportedCountries: ['CM', 'CI', 'SN', 'ML'],
  );

  static const List<MobileMoneyProvider> providers = [mtn, orange];
}