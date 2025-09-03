import 'package:flutter/material.dart';
import '../../../../core/theme/design_tokens.dart';

class CartConflictDialog extends StatelessWidget {
  final String currentRestaurantName;
  final String newRestaurantName;
  final VoidCallback onKeepCurrent;
  final VoidCallback onReplaceCart;

  const CartConflictDialog({
    super.key,
    required this.currentRestaurantName,
    required this.newRestaurantName,
    required this.onKeepCurrent,
    required this.onReplaceCart,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
      ),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(DesignTokens.spaceXS),
            decoration: BoxDecoration(
              color: DesignTokens.warningColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.warning_outlined,
              color: DesignTokens.warningColor,
              size: 24,
            ),
          ),
          const SizedBox(width: DesignTokens.spaceSM),
          Expanded(
            child: Text(
              'Restaurants différents',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: DesignTokens.fontWeightBold,
              ),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vous avez déjà des articles de "$currentRestaurantName" dans votre panier.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.4,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          Text(
            'Voulez-vous:',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: DesignTokens.fontWeightMedium,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceSM),
          
          // Option 1: Keep current cart
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(DesignTokens.spaceMD),
            decoration: BoxDecoration(
              color: DesignTokens.primaryColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
              border: Border.all(
                color: DesignTokens.primaryColor.withOpacity(0.2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: DesignTokens.primaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: DesignTokens.spaceXS),
                    Text(
                      'Garder le panier actuel',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: DesignTokens.fontWeightSemiBold,
                        color: DesignTokens.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: DesignTokens.spaceXS),
                Text(
                  'Continuer avec les articles de "$currentRestaurantName"',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: DesignTokens.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: DesignTokens.spaceSM),
          
          // Option 2: Replace cart
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(DesignTokens.spaceMD),
            decoration: BoxDecoration(
              color: DesignTokens.errorColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
              border: Border.all(
                color: DesignTokens.errorColor.withOpacity(0.2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.refresh,
                      color: DesignTokens.errorColor,
                      size: 20,
                    ),
                    const SizedBox(width: DesignTokens.spaceXS),
                    Text(
                      'Remplacer le panier',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: DesignTokens.fontWeightSemiBold,
                        color: DesignTokens.errorColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: DesignTokens.spaceXS),
                Text(
                  'Supprimer tous les articles et commencer avec "$newRestaurantName"',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: DesignTokens.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onKeepCurrent,
          child: Text(
            'Garder le panier',
            style: TextStyle(
              color: DesignTokens.primaryColor,
              fontWeight: DesignTokens.fontWeightMedium,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: onReplaceCart,
          style: ElevatedButton.styleFrom(
            backgroundColor: DesignTokens.errorColor,
            foregroundColor: DesignTokens.white,
          ),
          child: const Text('Remplacer'),
        ),
      ],
    );
  }
}