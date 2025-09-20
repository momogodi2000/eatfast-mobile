import 'package:flutter/material.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../data/services/guest_session_service.dart';

/// Guest cart summary widget showing items and pricing
class GuestCartSummary extends StatelessWidget {
  final GuestCart cart;

  const GuestCartSummary({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      decoration: BoxDecoration(
        color: DesignTokens.white,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        boxShadow: [
          BoxShadow(
            color: DesignTokens.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Résumé de votre commande',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: DesignTokens.fontWeightBold,
              color: DesignTokens.textPrimary,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceMD),

          // Cart items
          ...cart.items.map((item) => _buildCartItem(context, item)),

          if (cart.items.isNotEmpty) ...[
            const Divider(height: DesignTokens.spaceLG),

            // Pricing breakdown
            _buildPriceRow(context, 'Sous-total', cart.subtotal),
            if (cart.deliveryFee > 0)
              _buildPriceRow(context, 'Livraison', cart.deliveryFee),
            if (cart.tax > 0)
              _buildPriceRow(context, 'Taxes', cart.tax),

            const Divider(height: DesignTokens.spaceMD),

            _buildPriceRow(
              context,
              'Total',
              cart.total,
              isTotal: true,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, GuestCartItem item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: DesignTokens.spaceSM),
      child: Row(
        children: [
          // Quantity badge
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: DesignTokens.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                item.quantity.toString(),
                style: const TextStyle(
                  color: DesignTokens.white,
                  fontSize: 12,
                  fontWeight: DesignTokens.fontWeightBold,
                ),
              ),
            ),
          ),
          const SizedBox(width: DesignTokens.spaceSM),

          // Item details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: DesignTokens.fontWeightSemiBold,
                    color: DesignTokens.textPrimary,
                  ),
                ),
                if (item.options != null && item.options!.isNotEmpty)
                  Text(
                    _formatOptions(item.options!),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: DesignTokens.textSecondary,
                    ),
                  ),
              ],
            ),
          ),

          // Price
          Text(
            '${item.total.toStringAsFixed(0)} FCFA',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: DesignTokens.fontWeightSemiBold,
              color: DesignTokens.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(
    BuildContext context,
    String label,
    double amount, {
    bool isTotal = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DesignTokens.spaceXS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: isTotal
                  ? DesignTokens.fontWeightBold
                  : DesignTokens.fontWeightMedium,
              color: isTotal
                  ? DesignTokens.textPrimary
                  : DesignTokens.textSecondary,
            ),
          ),
          Text(
            '${amount.toStringAsFixed(0)} FCFA',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: isTotal
                  ? DesignTokens.fontWeightBold
                  : DesignTokens.fontWeightMedium,
              color: isTotal
                  ? DesignTokens.primaryColor
                  : DesignTokens.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  String _formatOptions(Map<String, dynamic> options) {
    return options.entries
        .map((entry) => '${entry.key}: ${entry.value}')
        .join(', ');
  }
}