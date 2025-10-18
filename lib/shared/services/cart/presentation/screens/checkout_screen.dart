import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/l10n/arb/app_localizations.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';
import 'package:eatfast_mobile/shared/models/user_address.dart';
import 'package:eatfast_mobile/shared/services/cart/providers/cart_provider.dart';
import 'package:eatfast_mobile/shared/services/payment/domain/models/payment_method.dart';
import 'package:eatfast_mobile/modules/client_module/providers/domain/models/cart.dart';

/// Checkout screen for placing orders
class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  UserAddress? selectedAddress;
  PaymentMethod? selectedPaymentMethod;
  String specialInstructions = '';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cartState = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.checkout ?? 'Checkout'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: switch (cartState) {
        CartLoading() => const Center(child: CircularProgressIndicator()),
        CartError(:final message) => Center(
          child: Text('Error: $message'),
        ),
        CartLoaded(:final cart) => _buildCheckoutContent(context, l10n!, cart),
        _ => const Center(child: Text('Loading...')),
      },
    );
  }

  Widget _buildCheckoutContent(BuildContext context, AppLocalizations l10n, Cart cart) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Delivery Address Section
          _buildSectionHeader('Delivery Address'),
          const SizedBox(height: DesignTokens.spaceMD),
          _buildAddressSelection(l10n),
          
          const SizedBox(height: DesignTokens.spaceXL),
          
          // Payment Method Section
          _buildSectionHeader(l10n.paymentMethod),
          const SizedBox(height: DesignTokens.spaceMD),
          _buildPaymentMethodSelection(l10n),
          
          const SizedBox(height: DesignTokens.spaceXL),
          
          // Special Instructions
          _buildSectionHeader('Special Instructions'),
          const SizedBox(height: DesignTokens.spaceMD),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Add any special instructions for your order...',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
            onChanged: (value) => specialInstructions = value,
          ),
          
          const SizedBox(height: DesignTokens.spaceXL),
          
          // Order Summary
          _buildOrderSummary(l10n, cart),
          
          const SizedBox(height: DesignTokens.spaceXL),
          
          // Place Order Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _canPlaceOrder() ? () => _placeOrder(context, l10n) : null,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: DesignTokens.spaceMD),
                child: Text(
                  l10n.placeOrder,
                  style: const TextStyle(
                    fontSize: DesignTokens.fontSizeLG,
                    fontWeight: DesignTokens.fontWeightSemiBold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: DesignTokens.fontSizeLG,
        fontWeight: DesignTokens.fontWeightSemiBold,
        color: DesignTokens.textPrimary,
      ),
    );
  }

  Widget _buildAddressSelection(AppLocalizations l10n) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.location_on),
        title: Text(
          selectedAddress?.label ?? 'Select Address',
          style: const TextStyle(fontWeight: DesignTokens.fontWeightMedium),
        ),
        subtitle: selectedAddress != null 
            ? Text(selectedAddress!.fullAddress)
            : const Text('Tap to select delivery address'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // TODO: Navigate to address selection screen
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Address selection coming soon')),
          );
        },
      ),
    );
  }

  Widget _buildPaymentMethodSelection(AppLocalizations l10n) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.payment),
        title: Text(
          selectedPaymentMethod?.displayName ?? l10n.paymentMethod,
          style: const TextStyle(fontWeight: DesignTokens.fontWeightMedium),
        ),
        subtitle: selectedPaymentMethod != null 
            ? Text(selectedPaymentMethod!.type.toString())
            : const Text('Tap to select payment method'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // TODO: Navigate to payment method selection screen
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Payment method selection coming soon')),
          );
        },
      ),
    );
  }

  Widget _buildOrderSummary(AppLocalizations l10n, Cart cart) {
    final subtotal = cart.subtotal;
    final deliveryFee = cart.deliveryFee;
    final total = cart.total;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.orderTotal,
              style: const TextStyle(
                fontSize: DesignTokens.fontSizeLG,
                fontWeight: DesignTokens.fontWeightSemiBold,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            _buildSummaryRow(l10n.subtotal, subtotal),
            const SizedBox(height: DesignTokens.spaceXS),
            _buildSummaryRow(l10n.deliveryFee, deliveryFee),
            const Divider(),
            _buildSummaryRow(
              l10n.total, 
              total,
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, double amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? DesignTokens.fontSizeMD : DesignTokens.fontSizeSM,
            fontWeight: isTotal 
                ? DesignTokens.fontWeightSemiBold 
                : DesignTokens.fontWeightNormal,
          ),
        ),
        Text(
          '${amount.toStringAsFixed(0)} FCFA',
          style: TextStyle(
            fontSize: isTotal ? DesignTokens.fontSizeMD : DesignTokens.fontSizeSM,
            fontWeight: isTotal 
                ? DesignTokens.fontWeightSemiBold 
                : DesignTokens.fontWeightNormal,
            color: isTotal ? DesignTokens.primaryColor : DesignTokens.textPrimary,
          ),
        ),
      ],
    );
  }

  bool _canPlaceOrder() {
    return selectedAddress != null && selectedPaymentMethod != null;
  }

  void _placeOrder(BuildContext context, AppLocalizations l10n) {
    // TODO: Implement order placement logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Order Placed Successfully!'),
        backgroundColor: DesignTokens.successColor,
      ),
    );
    
    // Navigate back or to order tracking
    Navigator.of(context).pop();
  }
}
