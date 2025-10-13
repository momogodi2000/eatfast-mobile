/// Payment Models
/// Shared data models for all payment services
library;

/// Payment providers enum
enum PaymentProvider {
  campay('campay', 'CamPay'),
  noupay('noupay', 'NouPay'),
  stripe('stripe', 'Stripe'),
  mtnMomo('mtn', 'MTN Mobile Money'),
  orangeMoney('orange', 'Orange Money'),
  expressUnion('eu_mobile', 'Express Union Mobile'),
  wallet('wallet', 'Wallet'),
  cash('cash', 'Cash');

  const PaymentProvider(this.value, this.displayName);
  final String value;
  final String displayName;

  static PaymentProvider? fromValue(String value) {
    for (final provider in PaymentProvider.values) {
      if (provider.value == value) return provider;
    }
    return null;
  }
}

/// Payment status enum
enum PaymentStatus {
  pending('pending', 'En attente'),
  processing('processing', 'En cours'),
  completed('completed', 'Complété'),
  failed('failed', 'Échoué'),
  cancelled('cancelled', 'Annulé'),
  expired('expired', 'Expiré'),
  unknown('unknown', 'Inconnu');

  const PaymentStatus(this.value, this.displayName);
  final String value;
  final String displayName;

  static PaymentStatus fromValue(String? value) {
    for (final status in PaymentStatus.values) {
      if (status.value == value) return status;
    }
    return PaymentStatus.unknown;
  }

  bool get isSuccess => this == PaymentStatus.completed;
  bool get isPending => this == PaymentStatus.pending || this == PaymentStatus.processing;
  bool get isFailed => this == PaymentStatus.failed || this == PaymentStatus.cancelled || this == PaymentStatus.expired;
}

/// Payment initialization response
class PaymentInitResponse {
  final bool success;
  final String transactionId;
  final String? paymentUrl;
  final String? instructions;
  final PaymentProvider provider;
  final DateTime? expiresAt;
  final Map<String, dynamic>? additionalData;

  const PaymentInitResponse({
    required this.success,
    required this.transactionId,
    this.paymentUrl,
    this.instructions,
    required this.provider,
    this.expiresAt,
    this.additionalData,
  });

  Map<String, dynamic> toJson() => {
        'success': success,
        'transactionId': transactionId,
        'paymentUrl': paymentUrl,
        'instructions': instructions,
        'provider': provider.value,
        'expiresAt': expiresAt?.toIso8601String(),
        'additionalData': additionalData,
      };

  factory PaymentInitResponse.fromJson(Map<String, dynamic> json) {
    return PaymentInitResponse(
      success: json['success'] ?? false,
      transactionId: json['transactionId'] ?? '',
      paymentUrl: json['paymentUrl'],
      instructions: json['instructions'],
      provider: PaymentProvider.fromValue(json['provider']) ?? PaymentProvider.campay,
      expiresAt: json['expiresAt'] != null ? DateTime.parse(json['expiresAt']) : null,
      additionalData: json['additionalData'],
    );
  }
}

/// Payment status response
class PaymentStatusResponse {
  final String transactionId;
  final PaymentStatus status;
  final double amount;
  final String currency;
  final PaymentProvider provider;
  final DateTime? paidAt;
  final String? failureReason;
  final Map<String, dynamic>? additionalData;

  const PaymentStatusResponse({
    required this.transactionId,
    required this.status,
    required this.amount,
    required this.currency,
    required this.provider,
    this.paidAt,
    this.failureReason,
    this.additionalData,
  });

  bool get isCompleted => status == PaymentStatus.completed;
  bool get isPending => status.isPending;
  bool get isFailed => status.isFailed;

  Map<String, dynamic> toJson() => {
        'transactionId': transactionId,
        'status': status.value,
        'amount': amount,
        'currency': currency,
        'provider': provider.value,
        'paidAt': paidAt?.toIso8601String(),
        'failureReason': failureReason,
        'additionalData': additionalData,
      };

  factory PaymentStatusResponse.fromJson(Map<String, dynamic> json) {
    return PaymentStatusResponse(
      transactionId: json['transactionId'] ?? '',
      status: PaymentStatus.fromValue(json['status']),
      amount: (json['amount'] ?? 0).toDouble(),
      currency: json['currency'] ?? 'XAF',
      provider: PaymentProvider.fromValue(json['provider']) ?? PaymentProvider.campay,
      paidAt: json['paidAt'] != null ? DateTime.parse(json['paidAt']) : null,
      failureReason: json['failureReason'],
      additionalData: json['additionalData'],
    );
  }
}

/// Payment request model
class PaymentRequest {
  final String orderId;
  final double amount;
  final String currency;
  final PaymentProvider preferredProvider;
  final String? phoneNumber;
  final String? stripePaymentMethodId;
  final String? description;
  final Map<String, dynamic>? metadata;

  const PaymentRequest({
    required this.orderId,
    required this.amount,
    this.currency = 'XAF',
    required this.preferredProvider,
    this.phoneNumber,
    this.stripePaymentMethodId,
    this.description,
    this.metadata,
  });

  Map<String, dynamic> toJson() => {
        'orderId': orderId,
        'amount': amount,
        'currency': currency,
        'preferredProvider': preferredProvider.value,
        if (phoneNumber != null) 'phoneNumber': phoneNumber,
        if (stripePaymentMethodId != null) 'stripePaymentMethodId': stripePaymentMethodId,
        if (description != null) 'description': description,
        if (metadata != null) 'metadata': metadata,
      };
}

/// Payment result (final outcome)
class PaymentResult {
  final bool success;
  final PaymentStatus status;
  final String transactionId;
  final String? orderId;
  final double? amount;
  final String? currency;
  final PaymentProvider? provider;
  final String? message;
  final String? errorCode;
  final DateTime? completedAt;
  final Map<String, dynamic>? metadata;

  const PaymentResult({
    required this.success,
    required this.status,
    required this.transactionId,
    this.orderId,
    this.amount,
    this.currency,
    this.provider,
    this.message,
    this.errorCode,
    this.completedAt,
    this.metadata,
  });

  factory PaymentResult.success({
    required String transactionId,
    required String orderId,
    required double amount,
    required String currency,
    required PaymentProvider provider,
    DateTime? completedAt,
    Map<String, dynamic>? metadata,
  }) {
    return PaymentResult(
      success: true,
      status: PaymentStatus.completed,
      transactionId: transactionId,
      orderId: orderId,
      amount: amount,
      currency: currency,
      provider: provider,
      completedAt: completedAt ?? DateTime.now(),
      metadata: metadata,
    );
  }

  factory PaymentResult.failure({
    required String transactionId,
    required String message,
    String? errorCode,
    PaymentStatus status = PaymentStatus.failed,
    PaymentProvider? provider,
    Map<String, dynamic>? metadata,
  }) {
    return PaymentResult(
      success: false,
      status: status,
      transactionId: transactionId,
      message: message,
      errorCode: errorCode,
      provider: provider,
      metadata: metadata,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'status': status.value,
        'transactionId': transactionId,
        if (orderId != null) 'orderId': orderId,
        if (amount != null) 'amount': amount,
        if (currency != null) 'currency': currency,
        if (provider != null) 'provider': provider!.value,
        if (message != null) 'message': message,
        if (errorCode != null) 'errorCode': errorCode,
        if (completedAt != null) 'completedAt': completedAt!.toIso8601String(),
        if (metadata != null) 'metadata': metadata,
      };
}

/// Refund request model
class RefundRequest {
  final String transactionId;
  final double amount;
  final String reason;
  final Map<String, dynamic>? metadata;

  const RefundRequest({
    required this.transactionId,
    required this.amount,
    required this.reason,
    this.metadata,
  });

  Map<String, dynamic> toJson() => {
        'transactionId': transactionId,
        'amount': amount,
        'reason': reason,
        if (metadata != null) 'metadata': metadata,
      };
}

/// Refund response model
class RefundResponse {
  final bool success;
  final String refundId;
  final double amount;
  final String status;
  final String? message;
  final DateTime? processedAt;

  const RefundResponse({
    required this.success,
    required this.refundId,
    required this.amount,
    required this.status,
    this.message,
    this.processedAt,
  });

  factory RefundResponse.fromJson(Map<String, dynamic> json) {
    return RefundResponse(
      success: json['success'] ?? false,
      refundId: json['refundId'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      status: json['status'] ?? 'pending',
      message: json['message'],
      processedAt: json['processedAt'] != null ? DateTime.parse(json['processedAt']) : null,
    );
  }
}
