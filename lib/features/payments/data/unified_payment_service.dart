/// Unified Payment Service with Failover Logic
/// Mirrors the backend UnifiedPaymentService functionality
/// Implements automatic failover between CamPay, Nopia, and Stripe

import 'package:flutter/foundation.dart';
import '../../../core/config/app_config.dart';
import '../domain/models/payment.dart';
import 'payment_service.dart';

class UnifiedPaymentService {
  static final UnifiedPaymentService _instance = UnifiedPaymentService._internal();
  factory UnifiedPaymentService() => _instance;

  final PaymentService _paymentService = PaymentService();

  UnifiedPaymentService._internal();

  /// Payment gateway priority based on method and region
  static const Map<PaymentMethod, List<PaymentGateway>> _gatewayPriority = {
    PaymentMethod.campay: [PaymentGateway.campay],
    PaymentMethod.noupay: [PaymentGateway.noupay],
    PaymentMethod.stripe: [PaymentGateway.stripe],
    PaymentMethod.mtn: [PaymentGateway.campay, PaymentGateway.noupay],
    PaymentMethod.orange: [PaymentGateway.campay, PaymentGateway.noupay],
    PaymentMethod.cash: [], // No gateway needed
    PaymentMethod.wallet: [], // Handled separately
  };

  /// Default failover order for mobile money payments
  static const List<PaymentGateway> _defaultMobileMoneyFailover = [
    PaymentGateway.campay,
    PaymentGateway.noupay,
  ];

  /// Process payment with automatic failover
  Future<PaymentResponse> processPaymentWithFailover({
    required String orderId,
    required double amount,
    required PaymentMethod method,
    String currency = 'XAF',
    String? phoneNumber,
    String? paymentMethodId,
    Map<String, dynamic>? billingDetails,
    Map<String, dynamic>? metadata,
  }) async {
    // Cash payments don't need gateway processing
    if (method == PaymentMethod.cash) {
      return _createCashPaymentResponse(orderId);
    }

    // Wallet payments are handled directly
    if (method == PaymentMethod.wallet) {
      return await _paymentService.processWalletPayment(
        orderId: orderId,
        amount: amount,
        currency: currency,
      );
    }

    // For card payments, use Stripe directly
    if (method == PaymentMethod.stripe && paymentMethodId != null) {
      return await _paymentService.processStripePayment(
        orderId: orderId,
        amount: amount,
        currency: currency,
        paymentMethodId: paymentMethodId,
        billingDetails: billingDetails,
      );
    }

    // For mobile money and digital payments, use failover logic
    return await _processWithFailover(
      orderId: orderId,
      amount: amount,
      method: method,
      currency: currency,
      phoneNumber: phoneNumber,
      metadata: metadata,
    );
  }

  /// Process payment with gateway failover
  Future<PaymentResponse> _processWithFailover({
    required String orderId,
    required double amount,
    required PaymentMethod method,
    required String currency,
    String? phoneNumber,
    Map<String, dynamic>? metadata,
  }) async {
    final gateways = _determineGatewayPriority(method);

    if (gateways.isEmpty) {
      throw const PaymentException(
        'No suitable payment gateways available for this payment method',
        code: 'NO_GATEWAY_AVAILABLE',
      );
    }

    PaymentException? lastError;

    // Try each gateway in priority order
    for (final gateway in gateways) {
      try {
        debugPrint('Attempting payment with gateway: ${gateway.name}');

        final response = await _processWithGateway(
          gateway: gateway,
          orderId: orderId,
          amount: amount,
          method: method,
          currency: currency,
          phoneNumber: phoneNumber,
          metadata: metadata,
        );

        if (response.status == PaymentStatus.completed ||
            response.status == PaymentStatus.pending) {
          debugPrint('Payment successful with gateway: ${gateway.name}');
          return response;
        }
      } catch (e) {
        lastError = e is PaymentException ? e : PaymentException(
          'Gateway ${gateway.name} failed: $e',
          code: 'GATEWAY_FAILED',
        );

        debugPrint('Gateway ${gateway.name} failed: ${lastError.message}');
        // Continue to next gateway
      }
    }

    // All gateways failed
    throw PaymentException(
      'All payment gateways failed. Last error: ${lastError?.message ?? "Unknown error"}',
      code: 'ALL_GATEWAYS_FAILED',
      originalError: lastError,
    );
  }

  /// Process payment with specific gateway
  Future<PaymentResponse> _processWithGateway({
    required PaymentGateway gateway,
    required String orderId,
    required double amount,
    required PaymentMethod method,
    required String currency,
    String? phoneNumber,
    Map<String, dynamic>? metadata,
  }) async {
    switch (gateway) {
      case PaymentGateway.campay:
        if (phoneNumber == null) {
          throw const PaymentException(
            'Phone number required for CamPay payments',
            code: 'PHONE_NUMBER_REQUIRED',
          );
        }
        return await _paymentService.processCamPayPayment(
          orderId: orderId,
          amount: amount,
          phoneNumber: phoneNumber,
          currency: currency,
        );

      case PaymentGateway.noupay:
        if (phoneNumber == null) {
          throw const PaymentException(
            'Phone number required for NouPay payments',
            code: 'PHONE_NUMBER_REQUIRED',
          );
        }
        return await _paymentService.processNouPayPayment(
          orderId: orderId,
          amount: amount,
          phoneNumber: phoneNumber,
          currency: currency,
        );

      case PaymentGateway.stripe:
        throw const PaymentException(
          'Stripe requires payment method ID',
          code: 'PAYMENT_METHOD_ID_REQUIRED',
        );
    }
  }

  /// Determine gateway priority for payment method
  List<PaymentGateway> _determineGatewayPriority(PaymentMethod method) {
    final priority = _gatewayPriority[method];
    if (priority != null) return priority;

    // Default to mobile money failover for unknown methods
    return _defaultMobileMoneyFailover;
  }

  /// Create response for cash payments
  PaymentResponse _createCashPaymentResponse(String orderId) {
    return PaymentResponse(
      paymentId: 'cash_$orderId',
      status: PaymentStatus.pending,
      instructions: 'Préparez le montant exact en espèces pour le livreur',
      additionalData: {
        'paymentMethod': 'cash',
        'gateway': 'none',
      },
    );
  }

  /// Get available payment methods with failover support
  Future<List<PaymentMethod>> getAvailablePaymentMethods({
    String? orderId,
    double? amount,
    String? country = 'CM',
  }) async {
    try {
      // Try to get from backend first
      final backendMethods = await _paymentService.getAvailablePaymentMethods(
        orderId: orderId,
        amount: amount,
        country: country,
      );

      return backendMethods;
    } catch (e) {
      debugPrint('Failed to get payment methods from backend: $e');
      // Fallback to default methods
      return _getDefaultAvailablePaymentMethods();
    }
  }

  /// Get default payment methods based on configuration
  List<PaymentMethod> _getDefaultAvailablePaymentMethods() {
    final methods = <PaymentMethod>[PaymentMethod.cash];

    if (AppConfig.enableCamPayPayments) methods.add(PaymentMethod.campay);
    if (AppConfig.enableNouPayPayments) methods.add(PaymentMethod.noupay);
    if (AppConfig.enableStripePayments) methods.add(PaymentMethod.stripe);
    if (AppConfig.enableWalletPayments) methods.add(PaymentMethod.wallet);
    if (AppConfig.enableMobileMoneyPayments) {
      methods.addAll([PaymentMethod.mtn, PaymentMethod.orange]);
    }

    return methods;
  }

  /// Check payment status across all gateways
  Future<Payment> checkPaymentStatus(String paymentId) async {
    return await _paymentService.getPaymentStatus(paymentId);
  }

  /// Get payment method fees with gateway information
  Future<Map<PaymentMethod, PaymentMethodInfo>> getPaymentMethodFees({
    required double amount,
    String currency = 'XAF',
  }) async {
    try {
      final fees = await _paymentService.getPaymentMethodFees(
        amount: amount,
        currency: currency,
      );

      final methodInfo = <PaymentMethod, PaymentMethodInfo>{};

      for (final method in PaymentMethod.values) {
        final fee = fees[method] ?? 0.0;
        final gateways = _gatewayPriority[method] ?? [];

        methodInfo[method] = PaymentMethodInfo(
          method: method,
          fee: fee,
          availableGateways: gateways,
          isEnabled: _isPaymentMethodEnabled(method),
        );
      }

      return methodInfo;
    } catch (e) {
      debugPrint('Failed to get payment fees: $e');
      return _getDefaultPaymentMethodInfo();
    }
  }

  /// Check if payment method is enabled
  bool _isPaymentMethodEnabled(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.cash:
        return true;
      case PaymentMethod.campay:
        return AppConfig.enableCamPayPayments;
      case PaymentMethod.noupay:
        return AppConfig.enableNouPayPayments;
      case PaymentMethod.stripe:
        return AppConfig.enableStripePayments;
      case PaymentMethod.wallet:
        return AppConfig.enableWalletPayments;
      case PaymentMethod.mtn:
      case PaymentMethod.orange:
        return AppConfig.enableMobileMoneyPayments;
    }
  }

  /// Get default payment method information
  Map<PaymentMethod, PaymentMethodInfo> _getDefaultPaymentMethodInfo() {
    return {
      PaymentMethod.cash: PaymentMethodInfo(
        method: PaymentMethod.cash,
        fee: 0.0,
        availableGateways: [],
        isEnabled: true,
      ),
      PaymentMethod.campay: PaymentMethodInfo(
        method: PaymentMethod.campay,
        fee: 100.0,
        availableGateways: [PaymentGateway.campay],
        isEnabled: AppConfig.enableCamPayPayments,
      ),
      PaymentMethod.noupay: PaymentMethodInfo(
        method: PaymentMethod.noupay,
        fee: 50.0,
        availableGateways: [PaymentGateway.noupay],
        isEnabled: AppConfig.enableNouPayPayments,
      ),
      PaymentMethod.stripe: PaymentMethodInfo(
        method: PaymentMethod.stripe,
        fee: 150.0,
        availableGateways: [PaymentGateway.stripe],
        isEnabled: AppConfig.enableStripePayments,
      ),
      PaymentMethod.wallet: PaymentMethodInfo(
        method: PaymentMethod.wallet,
        fee: 0.0,
        availableGateways: [],
        isEnabled: AppConfig.enableWalletPayments,
      ),
      PaymentMethod.mtn: PaymentMethodInfo(
        method: PaymentMethod.mtn,
        fee: 200.0,
        availableGateways: _defaultMobileMoneyFailover,
        isEnabled: AppConfig.enableMobileMoneyPayments,
      ),
      PaymentMethod.orange: PaymentMethodInfo(
        method: PaymentMethod.orange,
        fee: 200.0,
        availableGateways: _defaultMobileMoneyFailover,
        isEnabled: AppConfig.enableMobileMoneyPayments,
      ),
    };
  }
}

/// Payment gateway enumeration
enum PaymentGateway {
  campay('CamPay'),
  noupay('NouPay/Nopia'),
  stripe('Stripe');

  const PaymentGateway(this.name);
  final String name;
}

/// Payment method information with gateway details
class PaymentMethodInfo {
  final PaymentMethod method;
  final double fee;
  final List<PaymentGateway> availableGateways;
  final bool isEnabled;

  const PaymentMethodInfo({
    required this.method,
    required this.fee,
    required this.availableGateways,
    required this.isEnabled,
  });

  bool get hasFailover => availableGateways.length > 1;

  String get primaryGateway => availableGateways.isNotEmpty
      ? availableGateways.first.name
      : 'None';

  List<String> get fallbackGateways => availableGateways.length > 1
      ? availableGateways.skip(1).map((g) => g.name).toList()
      : [];
}