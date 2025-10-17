/// Payment response model
class PaymentResponse {
  final bool success;
  final String? transactionId;
  final String? paymentUrl;
  final String? message;
  final String? error;
  final PaymentStatus status;
  final Map<String, dynamic>? metadata;
  final DateTime timestamp;

  const PaymentResponse({
    required this.success,
    this.transactionId,
    this.paymentUrl,
    this.message,
    this.error,
    required this.status,
    this.metadata,
    required this.timestamp,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) {
    return PaymentResponse(
      success: json['success'] as bool? ?? false,
      transactionId: json['transactionId'] as String?,
      paymentUrl: json['paymentUrl'] as String?,
      message: json['message'] as String?,
      error: json['error'] as String?,
      status: PaymentStatus.fromString(json['status'] as String? ?? 'pending'),
      metadata: json['metadata'] as Map<String, dynamic>?,
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'] as String)
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      if (transactionId != null) 'transactionId': transactionId,
      if (paymentUrl != null) 'paymentUrl': paymentUrl,
      if (message != null) 'message': message,
      if (error != null) 'error': error,
      'status': status.value,
      if (metadata != null) 'metadata': metadata,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  PaymentResponse copyWith({
    bool? success,
    String? transactionId,
    String? paymentUrl,
    String? message,
    String? error,
    PaymentStatus? status,
    Map<String, dynamic>? metadata,
    DateTime? timestamp,
  }) {
    return PaymentResponse(
      success: success ?? this.success,
      transactionId: transactionId ?? this.transactionId,
      paymentUrl: paymentUrl ?? this.paymentUrl,
      message: message ?? this.message,
      error: error ?? this.error,
      status: status ?? this.status,
      metadata: metadata ?? this.metadata,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

/// Payment status enum
enum PaymentStatus {
  pending('pending'),
  processing('processing'),
  completed('completed'),
  failed('failed'),
  cancelled('cancelled'),
  refunded('refunded');

  const PaymentStatus(this.value);
  final String value;

  static PaymentStatus fromString(String value) {
    return PaymentStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => PaymentStatus.pending,
    );
  }

  bool get isCompleted => this == PaymentStatus.completed;
  bool get isFailed => this == PaymentStatus.failed;
  bool get isPending => this == PaymentStatus.pending;
  bool get isProcessing => this == PaymentStatus.processing;
}

/// Payment exception
class PaymentException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;

  const PaymentException(this.message, {this.code, this.originalError});

  @override
  String toString() =>
      'PaymentException: $message${code != null ? ' ($code)' : ''}';
}
