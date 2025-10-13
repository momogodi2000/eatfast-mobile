/// Payment Exceptions
/// Custom exception classes for payment processing
library;

import 'payment_models.dart';

/// Base payment exception class
abstract class PaymentException implements Exception {
  final String message;
  final String? code;
  final Exception? originalError;

  const PaymentException(this.message, {this.code, this.originalError});

  @override
  String toString() => 'PaymentException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Payment validation exception
/// Thrown when payment request parameters are invalid
class PaymentValidationException extends PaymentException {
  PaymentValidationException(String message, {String? code, Exception? originalError})
      : super(message, code: code ?? 'VALIDATION_ERROR', originalError: originalError);

  @override
  String toString() => 'PaymentValidationException: $message';
}

/// Payment provider exception
/// Thrown when payment provider (CamPay, NouPay, Stripe) encounters an error
class PaymentProviderException extends PaymentException {
  final PaymentProvider provider;
  final int? statusCode;
  final bool isTimeout;
  final bool isNetworkError;

  PaymentProviderException(
    String message, {
    required this.provider,
    String? code,
    this.statusCode,
    this.isTimeout = false,
    this.isNetworkError = false,
    Exception? originalError,
  }) : super(message, code: code ?? 'PROVIDER_ERROR', originalError: originalError);

  bool get shouldRetry => isTimeout || isNetworkError || statusCode == null || statusCode! >= 500;

  @override
  String toString() =>
      'PaymentProviderException [${provider.displayName}]: $message (Status: $statusCode)';
}

/// Payment network exception
/// Thrown when network connectivity issues occur
class PaymentNetworkException extends PaymentException {
  PaymentNetworkException(String message, {String? code, Exception? originalError})
      : super(message, code: code ?? 'NETWORK_ERROR', originalError: originalError);

  @override
  String toString() => 'PaymentNetworkException: $message';
}

/// Payment timeout exception
/// Thrown when payment operation times out
class PaymentTimeoutException extends PaymentException {
  final Duration timeout;

  PaymentTimeoutException(String message, this.timeout, {String? code, Exception? originalError})
      : super(message, code: code ?? 'TIMEOUT_ERROR', originalError: originalError);

  @override
  String toString() => 'PaymentTimeoutException: $message (Timeout: ${timeout.inSeconds}s)';
}

/// Payment not supported exception
/// Thrown when requested payment method is not supported
class PaymentNotSupportedException extends PaymentException {
  final PaymentProvider requestedProvider;
  final List<PaymentProvider> supportedProviders;

  PaymentNotSupportedException(
    this.requestedProvider,
    this.supportedProviders, {
    String? code,
  }) : super(
          'Payment provider ${requestedProvider.displayName} is not supported. '
          'Supported providers: ${supportedProviders.map((p) => p.displayName).join(', ')}',
          code: code ?? 'UNSUPPORTED_PROVIDER',
        );

  @override
  String toString() => 'PaymentNotSupportedException: ${requestedProvider.displayName} not supported';
}

/// Payment amount exception
/// Thrown when payment amount is invalid or out of range
class PaymentAmountException extends PaymentException {
  final double amount;
  final double? minAmount;
  final double? maxAmount;

  PaymentAmountException(
    this.amount, {
    this.minAmount,
    this.maxAmount,
    String? message,
    String? code,
  }) : super(
          message ??
              _buildDefaultMessage(amount, minAmount, maxAmount),
          code: code ?? 'INVALID_AMOUNT',
        );

  static String _buildDefaultMessage(double amount, double? minAmount, double? maxAmount) {
    if (minAmount != null && amount < minAmount) {
      return 'Amount $amount is below minimum $minAmount';
    }
    if (maxAmount != null && amount > maxAmount) {
      return 'Amount $amount exceeds maximum $maxAmount';
    }
    return 'Invalid payment amount: $amount';
  }

  @override
  String toString() => 'PaymentAmountException: $message';
}

/// Payment insufficient funds exception
/// Thrown when wallet or account has insufficient balance
class InsufficientFundsException extends PaymentException {
  final double required;
  final double available;

  InsufficientFundsException({
    required this.required,
    required this.available,
    String? message,
  }) : super(
          message ?? 'Insufficient funds. Required: $required, Available: $available',
          code: 'INSUFFICIENT_FUNDS',
        );

  @override
  String toString() =>
      'InsufficientFundsException: Required $required, Available $available';
}

/// Payment cancelled exception
/// Thrown when user cancels the payment
class PaymentCancelledException extends PaymentException {
  PaymentCancelledException({String? message})
      : super(
          message ?? 'Payment was cancelled by user',
          code: 'PAYMENT_CANCELLED',
        );

  @override
  String toString() => 'PaymentCancelledException: $message';
}

/// Payment already processed exception
/// Thrown when attempting to process a payment that's already been processed
class PaymentAlreadyProcessedException extends PaymentException {
  final String transactionId;
  final PaymentStatus currentStatus;

  PaymentAlreadyProcessedException(this.transactionId, this.currentStatus)
      : super(
          'Payment $transactionId has already been processed with status: ${currentStatus.displayName}',
          code: 'ALREADY_PROCESSED',
        );

  @override
  String toString() =>
      'PaymentAlreadyProcessedException: Transaction $transactionId (${currentStatus.displayName})';
}

/// Refund exception
/// Thrown when refund operation fails
class RefundException extends PaymentException {
  final String transactionId;

  RefundException(this.transactionId, String message, {String? code, Exception? originalError})
      : super(message, code: code ?? 'REFUND_ERROR', originalError: originalError);

  @override
  String toString() => 'RefundException[$transactionId]: $message';
}

/// Payment configuration exception
/// Thrown when payment service configuration is invalid
class PaymentConfigurationException extends PaymentException {
  PaymentConfigurationException(String message, {String? code})
      : super(message, code: code ?? 'CONFIGURATION_ERROR');

  @override
  String toString() => 'PaymentConfigurationException: $message';
}

/// All providers failed exception
/// Thrown when all payment providers in fallback chain fail
class AllProvidersFailedException extends PaymentException {
  final List<PaymentProviderException> failures;

  AllProvidersFailedException(this.failures)
      : super(
          'All payment providers failed. Tried: ${failures.map((f) => f.provider.displayName).join(', ')}',
          code: 'ALL_PROVIDERS_FAILED',
        );

  @override
  String toString() {
    final buffer = StringBuffer('AllProvidersFailedException:\n');
    for (final failure in failures) {
      buffer.writeln('  - ${failure.provider.displayName}: ${failure.message}');
    }
    return buffer.toString();
  }
}
