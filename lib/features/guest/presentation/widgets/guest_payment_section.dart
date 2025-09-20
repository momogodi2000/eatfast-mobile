import 'package:flutter/material.dart';
import '../../../../core/theme/design_tokens.dart';

/// Guest payment method selection widget
class GuestPaymentSection extends StatelessWidget {
  final String selectedPaymentMethod;
  final String selectedMobileProvider;
  final Function(String) onPaymentMethodChanged;
  final Function(String) onMobileProviderChanged;

  const GuestPaymentSection({
    super.key,
    required this.selectedPaymentMethod,
    required this.selectedMobileProvider,
    required this.onPaymentMethodChanged,
    required this.onMobileProviderChanged,
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
          Row(
            children: [
              Icon(
                Icons.payment,
                color: DesignTokens.primaryColor,
                size: DesignTokens.iconMD,
              ),
              const SizedBox(width: DesignTokens.spaceSM),
              Text(
                'Mode de paiement',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: DesignTokens.fontWeightBold,
                  color: DesignTokens.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: DesignTokens.spaceMD),

          // Mobile Money option
          _buildPaymentOption(
            context,
            value: 'mobile_money',
            title: 'Mobile Money',
            subtitle: 'MTN Mobile Money, Orange Money',
            icon: Icons.phone_android,
            isSelected: selectedPaymentMethod == 'mobile_money',
          ),

          // Mobile Money providers (shown when mobile money is selected)
          if (selectedPaymentMethod == 'mobile_money') ...[
            const SizedBox(height: DesignTokens.spaceMD),
            Padding(
              padding: const EdgeInsets.only(left: DesignTokens.spaceLG),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choisissez votre opérateur:',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: DesignTokens.fontWeightSemiBold,
                      color: DesignTokens.textPrimary,
                    ),
                  ),
                  const SizedBox(height: DesignTokens.spaceSM),

                  Row(
                    children: [
                      Expanded(
                        child: _buildMobileProviderOption(
                          context,
                          value: 'mtn',
                          title: 'MTN MoMo',
                          color: const Color(0xFFFFD500),
                        ),
                      ),
                      const SizedBox(width: DesignTokens.spaceMD),
                      Expanded(
                        child: _buildMobileProviderOption(
                          context,
                          value: 'orange',
                          title: 'Orange Money',
                          color: const Color(0xFFFF6600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: DesignTokens.spaceMD),

          // Cash on delivery option
          _buildPaymentOption(
            context,
            value: 'cash',
            title: 'Paiement à la livraison',
            subtitle: 'Payez en espèces au livreur',
            icon: Icons.money,
            isSelected: selectedPaymentMethod == 'cash',
          ),

          const SizedBox(height: DesignTokens.spaceMD),

          // Card payment option (for future implementation)
          _buildPaymentOption(
            context,
            value: 'card',
            title: 'Carte bancaire',
            subtitle: 'Visa, Mastercard',
            icon: Icons.credit_card,
            isSelected: selectedPaymentMethod == 'card',
            isEnabled: false, // Disabled for now
          ),

          const SizedBox(height: DesignTokens.spaceMD),

          // Payment info
          Container(
            padding: const EdgeInsets.all(DesignTokens.spaceSM),
            decoration: BoxDecoration(
              color: DesignTokens.accentColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
              border: Border.all(
                color: DesignTokens.accentColor.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.security,
                  color: DesignTokens.accentColor,
                  size: DesignTokens.iconSM,
                ),
                const SizedBox(width: DesignTokens.spaceSM),
                Expanded(
                  child: Text(
                    'Vos informations de paiement sont sécurisées et cryptées.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: DesignTokens.accentColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(
    BuildContext context, {
    required String value,
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    bool isEnabled = true,
  }) {
    return GestureDetector(
      onTap: isEnabled ? () => onPaymentMethodChanged(value) : null,
      child: Container(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        decoration: BoxDecoration(
          color: isSelected
              ? DesignTokens.primaryColor.withValues(alpha: 0.1)
              : DesignTokens.backgroundLight,
          borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
          border: Border.all(
            color: isSelected
                ? DesignTokens.primaryColor
                : DesignTokens.borderColor,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isEnabled
                  ? (isSelected ? DesignTokens.primaryColor : DesignTokens.textSecondary)
                  : DesignTokens.textSecondary.withValues(alpha: 0.5),
              size: DesignTokens.iconMD,
            ),
            const SizedBox(width: DesignTokens.spaceMD),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: DesignTokens.fontWeightSemiBold,
                      color: isEnabled
                          ? DesignTokens.textPrimary
                          : DesignTokens.textSecondary.withValues(alpha: 0.5),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isEnabled
                          ? DesignTokens.textSecondary
                          : DesignTokens.textSecondary.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
            Radio<String>(
              value: value,
              groupValue: selectedPaymentMethod,
              onChanged: isEnabled ? (val) => onPaymentMethodChanged(val!) : null,
              activeColor: DesignTokens.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileProviderOption(
    BuildContext context, {
    required String value,
    required String title,
    required Color color,
  }) {
    final isSelected = selectedMobileProvider == value;

    return GestureDetector(
      onTap: () => onMobileProviderChanged(value),
      child: Container(
        padding: const EdgeInsets.all(DesignTokens.spaceSM),
        decoration: BoxDecoration(
          color: isSelected
              ? color.withValues(alpha: 0.1)
              : DesignTokens.backgroundLight,
          borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
          border: Border.all(
            color: isSelected ? color : DesignTokens.borderColor,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: DesignTokens.spaceSM),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: isSelected
                      ? DesignTokens.fontWeightBold
                      : DesignTokens.fontWeightMedium,
                  color: DesignTokens.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}