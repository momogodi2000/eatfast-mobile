class MobileMoneyResponse {
  final String? transactionId;
  final String? providerUsed;
  final String? verificationUrl;
  final String? orderId;
  final bool success;
  final String? error;
  
  MobileMoneyResponse({
    this.transactionId,
    this.providerUsed,
    this.verificationUrl,
    this.orderId,
    required this.success,
    this.error,
  });
}
