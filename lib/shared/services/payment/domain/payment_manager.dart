/// Payment Manager
/// Central payment orchestrator with automatic fallback logic
/// CamPay (Primary) → NouPay (Fallback) → Stripe (Card payments)
library;

import 'package:flutter/foundation.dart';
import '../data/campay_service.dart';
import '../data/noupay_service.dart';
import '../data/stripe_service.dart';
import 'models/payment_models.dart';
import 'models/payment_exceptions.dart';
import 'package:eatfast_mobile/shared/config/app_config.dart';

class PaymentManager {
  static final PaymentManager _instance = PaymentManager._internal();
  factory PaymentManager() => _instance;

  late final CamPayService _camPayService;
  late final NouPayService _nouPayService;
  late final StripeService _stripeService;

  bool _initialized = false;

  PaymentManager._internal();

  /// Initialize payment manager with all services
  void initialize({
    CamPayService? camPayService,
    NouPayService? nouPayService,
    StripeService? stripeService,
  }) {
    if (_initialized) return;

    _camPayService = camPayService ?? CamPayService();
    _nouPayService = nouPayService ?? NouPayService();
    _stripeService = stripeService ?? StripeService();
    _initialized = true;

    debugPrint('[PaymentManager] Initialized with all payment services');
  }

  /// Process payment with automatic fallback
  /// Strategy: Try CamPay → If fails, try NouPay → If mobile money not suitable, use Stripe
  Future<PaymentResult> processPayment(PaymentRequest request) async {
    _ensureInitialized();

    debugPrint(
      '[PaymentManager] Processing payment for order ${request.orderId}',
    );
    debugPrint(
      '[PaymentManager] Preferred provider: ${request.preferredProvider.displayName}',
    );

    // Validate request
    _validateRequest(request);

    // Choose payment flow based on provider
    if (request.preferredProvider == PaymentProvider.stripe ||
        request.preferredProvider == PaymentProvider.wallet) {
      // Direct card/wallet payment
      return await _processDirectPayment(request);
    } else {
      // Mobile money with fallback
      return await _processMobileMoneyWithFallback(request);
    }
  }

  /// Process mobile money payment with automatic CamPay → NouPay fallback
  Future<PaymentResult> _processMobileMoneyWithFallback(
    PaymentRequest request,
  ) async {
    final failures = <PaymentProviderException>[];

    // Try CamPay first (if enabled)
    if (AppConfig.enableCamPayPayments) {
      try {
        debugPrint('[PaymentManager] Attempting CamPay payment...');
        final result = await _processCamPayPayment(request);
        debugPrint('[PaymentManager] CamPay payment successful');
        return result;
      } on PaymentProviderException catch (e) {
        debugPrint('[PaymentManager] CamPay failed: ${e.message}');
        failures.add(e);

        // Don't retry if it's a validation error or non-retryable error
        if (!e.shouldRetry) {
          return PaymentResult.failure(
            transactionId: '',
            message: e.message,
            errorCode: e.code,
            provider: PaymentProvider.campay,
          );
        }
      } catch (e) {
        debugPrint('[PaymentManager] CamPay unexpected error: $e');
      }
    }

    // Fallback to NouPay (if enabled)
    if (AppConfig.enableNouPayPayments) {
      try {
        debugPrint('[PaymentManager] Falling back to NouPay...');

        // Check NouPay availability first
        final isAvailable = await _nouPayService.checkAvailability();
        if (!isAvailable) {
          throw PaymentProviderException(
            'NouPay service is currently unavailable',
            provider: PaymentProvider.noupay,
            isNetworkError: true,
          );
        }

        final result = await _processNouPayPayment(request);
        debugPrint('[PaymentManager] NouPay payment successful (fallback)');
        return result;
      } on PaymentProviderException catch (e) {
        debugPrint('[PaymentManager] NouPay failed: ${e.message}');
        failures.add(e);
      } catch (e) {
        debugPrint('[PaymentManager] NouPay unexpected error: $e');
      }
    }

    // All mobile money providers failed
    throw AllProvidersFailedException(failures);
  }

  /// Process direct payment (Stripe, Wallet)
  Future<PaymentResult> _processDirectPayment(PaymentRequest request) async {
    if (request.preferredProvider == PaymentProvider.stripe) {
      return await _processStripePayment(request);
    }

    // Wallet payments would be handled here
    throw PaymentNotSupportedException(request.preferredProvider, [
      PaymentProvider.stripe,
    ]);
  }

  /// Process CamPay payment
  Future<PaymentResult> _processCamPayPayment(PaymentRequest request) async {
    try {
      // Initiate payment
      final initResponse = await _camPayService.initiatePayment(
        orderId: request.orderId,
        amount: request.amount,
        phoneNumber: request.phoneNumber!,
        provider: request.preferredProvider,
        description: request.description,
        metadata: request.metadata,
      );

      if (!initResponse.success) {
        throw PaymentProviderException(
          'CamPay payment initiation failed',
          provider: PaymentProvider.campay,
        );
      }

      // Poll for payment status (with timeout)
      final statusResponse = await _pollPaymentStatus(
        transactionId: initResponse.transactionId,
        provider: PaymentProvider.campay,
        maxAttempts: 40, // 40 attempts * 3 seconds = 2 minutes
        pollInterval: const Duration(seconds: 3),
      );

      if (statusResponse.isCompleted) {
        return PaymentResult.success(
          transactionId: statusResponse.transactionId,
          orderId: request.orderId,
          amount: statusResponse.amount,
          currency: statusResponse.currency,
          provider: PaymentProvider.campay,
          completedAt: statusResponse.paidAt,
          metadata: statusResponse.additionalData,
        );
      } else if (statusResponse.isFailed) {
        return PaymentResult.failure(
          transactionId: statusResponse.transactionId,
          message: statusResponse.failureReason ?? 'CamPay payment failed',
          status: statusResponse.status,
          provider: PaymentProvider.campay,
        );
      }

      // Timeout or unknown status
      return PaymentResult.failure(
        transactionId: statusResponse.transactionId,
        message: 'Payment timeout or status unknown',
        status: PaymentStatus.expired,
        provider: PaymentProvider.campay,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Process NouPay payment
  Future<PaymentResult> _processNouPayPayment(PaymentRequest request) async {
    try {
      // Initiate payment
      final initResponse = await _nouPayService.initiatePayment(
        orderId: request.orderId,
        amount: request.amount,
        phoneNumber: request.phoneNumber!,
        provider: request.preferredProvider,
        description: request.description,
        metadata: request.metadata,
      );

      if (!initResponse.success) {
        throw PaymentProviderException(
          'NouPay payment initiation failed',
          provider: PaymentProvider.noupay,
        );
      }

      // Poll for payment status
      final statusResponse = await _pollPaymentStatus(
        transactionId: initResponse.transactionId,
        provider: PaymentProvider.noupay,
        maxAttempts: 50, // NouPay might take longer
        pollInterval: const Duration(seconds: 3),
      );

      if (statusResponse.isCompleted) {
        return PaymentResult.success(
          transactionId: statusResponse.transactionId,
          orderId: request.orderId,
          amount: statusResponse.amount,
          currency: statusResponse.currency,
          provider: PaymentProvider.noupay,
          completedAt: statusResponse.paidAt,
          metadata: statusResponse.additionalData,
        );
      } else if (statusResponse.isFailed) {
        return PaymentResult.failure(
          transactionId: statusResponse.transactionId,
          message: statusResponse.failureReason ?? 'NouPay payment failed',
          status: statusResponse.status,
          provider: PaymentProvider.noupay,
        );
      }

      return PaymentResult.failure(
        transactionId: statusResponse.transactionId,
        message: 'Payment timeout or status unknown',
        status: PaymentStatus.expired,
        provider: PaymentProvider.noupay,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Process Stripe payment
  Future<PaymentResult> _processStripePayment(PaymentRequest request) async {
    try {
      // Create payment intent
      final initResponse = await _stripeService.createPaymentIntent(
        orderId: request.orderId,
        amount: request.amount,
        paymentMethodId: request.stripePaymentMethodId,
        description: request.description,
        metadata: request.metadata,
      );

      if (!initResponse.success) {
        throw PaymentProviderException(
          'Stripe payment intent creation failed',
          provider: PaymentProvider.stripe,
        );
      }

      // Note: Stripe payment confirmation happens on client side with
      // the clientSecret. The app UI should handle this using Stripe SDK.
      // Here we just return the payment intent info.

      return PaymentResult.success(
        transactionId: initResponse.transactionId,
        orderId: request.orderId,
        amount: request.amount,
        currency: request.currency,
        provider: PaymentProvider.stripe,
        metadata: initResponse.additionalData,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Poll payment status until completion, failure, or timeout
  Future<PaymentStatusResponse> _pollPaymentStatus({
    required String transactionId,
    required PaymentProvider provider,
    required int maxAttempts,
    required Duration pollInterval,
  }) async {
    for (int attempt = 0; attempt < maxAttempts; attempt++) {
      try {
        await Future.delayed(pollInterval);

        PaymentStatusResponse status;
        switch (provider) {
          case PaymentProvider.campay:
            status = await _camPayService.checkPaymentStatus(transactionId);
            break;
          case PaymentProvider.noupay:
            status = await _nouPayService.checkPaymentStatus(transactionId);
            break;
          case PaymentProvider.stripe:
            status = await _stripeService.getPaymentStatus(transactionId);
            break;
          default:
            throw PaymentNotSupportedException(provider, [
              PaymentProvider.campay,
              PaymentProvider.noupay,
              PaymentProvider.stripe,
            ]);
        }

        // If payment is completed or failed, return immediately
        if (status.isCompleted || status.isFailed) {
          return status;
        }

        debugPrint(
          '[PaymentManager] Payment status (attempt ${attempt + 1}/$maxAttempts): ${status.status.displayName}',
        );
      } catch (e) {
        debugPrint('[PaymentManager] Error checking payment status: $e');
        // Continue polling unless it's the last attempt
        if (attempt == maxAttempts - 1) rethrow;
      }
    }

    // Timeout - return last known status or expired
    return PaymentStatusResponse(
      transactionId: transactionId,
      status: PaymentStatus.expired,
      amount: 0,
      currency: 'XAF',
      provider: provider,
      failureReason: 'Payment verification timeout',
    );
  }

  /// Get available payment methods
  List<PaymentProvider> getAvailablePaymentMethods() {
    final methods = <PaymentProvider>[];

    if (AppConfig.enableCamPayPayments) {
      methods.addAll([
        PaymentProvider.mtnMomo,
        PaymentProvider.orangeMoney,
        PaymentProvider.expressUnion,
      ]);
    }

    if (AppConfig.enableStripePayments) {
      methods.add(PaymentProvider.stripe);
    }

    if (AppConfig.enableWalletPayments) {
      methods.add(PaymentProvider.wallet);
    }

    methods.add(PaymentProvider.cash);

    return methods;
  }

  /// Validate payment request
  void _validateRequest(PaymentRequest request) {
    if (request.orderId.isEmpty) {
      throw PaymentValidationException('Order ID is required');
    }

    if (request.amount <= 0) {
      throw PaymentAmountException(request.amount, minAmount: 100);
    }

    // Validate mobile money requirements
    if (request.preferredProvider == PaymentProvider.mtnMomo ||
        request.preferredProvider == PaymentProvider.orangeMoney ||
        request.preferredProvider == PaymentProvider.expressUnion) {
      if (request.phoneNumber == null || request.phoneNumber!.isEmpty) {
        throw PaymentValidationException(
          'Phone number is required for mobile money payments',
        );
      }
    }

    // Validate Stripe requirements
    if (request.preferredProvider == PaymentProvider.stripe) {
      if (request.stripePaymentMethodId == null ||
          request.stripePaymentMethodId!.isEmpty) {
        throw PaymentValidationException(
          'Payment method is required for card payments',
        );
      }
    }
  }

  void _ensureInitialized() {
    if (!_initialized) {
      initialize();
    }
  }

  // ===================== PUBLIC UTILITY METHODS =====================

  /// Check service health for all providers
  Future<Map<PaymentProvider, bool>> checkServicesHealth() async {
    _ensureInitialized();

    final health = <PaymentProvider, bool>{};

    if (AppConfig.enableNouPayPayments) {
      health[PaymentProvider.noupay] = await _nouPayService.checkAvailability();
    }

    if (AppConfig.enableStripePayments) {
      health[PaymentProvider.stripe] = await _stripeService.checkAvailability();
    }

    // CamPay doesn't have a health endpoint, assume available if enabled
    if (AppConfig.enableCamPayPayments) {
      health[PaymentProvider.campay] = true;
    }

    return health;
  }

  /// Get payment status (unified across all providers)
  Future<PaymentStatusResponse> getPaymentStatus({
    required String transactionId,
    required PaymentProvider provider,
  }) async {
    _ensureInitialized();

    switch (provider) {
      case PaymentProvider.campay:
        return await _camPayService.checkPaymentStatus(transactionId);
      case PaymentProvider.noupay:
        return await _nouPayService.checkPaymentStatus(transactionId);
      case PaymentProvider.stripe:
        return await _stripeService.getPaymentStatus(transactionId);
      default:
        throw PaymentNotSupportedException(provider, [
          PaymentProvider.campay,
          PaymentProvider.noupay,
          PaymentProvider.stripe,
        ]);
    }
  }
}
