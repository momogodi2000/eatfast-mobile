import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/constants/api_constants.dart';
import 'package:eatfast_mobile/shared/services/api/api_client.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';

/// Stripe Payment Widget
/// Integrates with Stripe PaymentSheet for secure card payments
class StripePaymentWidget extends ConsumerStatefulWidget {
  final double amount;
  final String currency;
  final String orderId;
  final Function(bool success, String? error) onPaymentComplete;

  const StripePaymentWidget({
    super.key,
    required this.amount,
    required this.currency,
    required this.orderId,
    required this.onPaymentComplete,
  });

  @override
  ConsumerState<StripePaymentWidget> createState() =>
      _StripePaymentWidgetState();
}

class _StripePaymentWidgetState extends ConsumerState<StripePaymentWidget> {
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializePaymentSheet();
  }

  Future<void> _initializePaymentSheet() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Create payment intent from backend
      final apiClient = ref.read(apiClientProvider);
      final response = await apiClient.post(
        ApiConstants.createPaymentIntent,
        data: {
          'orderId': widget.orderId,
          'amount': (widget.amount * 100).toInt(), // Convert to cents
          'currency': widget.currency.toLowerCase(),
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;
        final clientSecret = data['clientSecret'] as String;

        // Initialize PaymentSheet
        await stripe.Stripe.instance.initPaymentSheet(
          paymentSheetParameters: stripe.SetupPaymentSheetParameters(
            paymentIntentClientSecret: clientSecret,
            merchantDisplayName: 'Eat Fast',
            style: ThemeMode.system,
            allowsDelayedPaymentMethods: false,
          ),
        );

        setState(() {
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to create payment intent');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to initialize payment: $e';
      });
    }
  }

  Future<void> _presentPaymentSheet() async {
    try {
      await stripe.Stripe.instance.presentPaymentSheet();
      widget.onPaymentComplete(true, null);
    } catch (e) {
      widget.onPaymentComplete(false, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Card(
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    if (_errorMessage != null) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Payment Error',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: Colors.red),
              ),
              const SizedBox(height: 8),
              Text(_errorMessage!),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _initializePaymentSheet,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Secure Card Payment',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Amount: ${widget.amount.toStringAsFixed(2)} ${widget.currency}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _presentPaymentSheet,
                icon: const Icon(Icons.credit_card),
                label: const Text('Pay with Card'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: DesignTokens.primaryColor,
                  foregroundColor: DesignTokens.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Your payment information is secure and encrypted.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: DesignTokens.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
