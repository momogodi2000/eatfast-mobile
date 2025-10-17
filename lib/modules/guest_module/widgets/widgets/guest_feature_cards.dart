import 'package:flutter/material.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';

/// Feature cards showcasing EatFast capabilities for guest users
class GuestFeatureCards extends StatelessWidget {
  const GuestFeatureCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pourquoi choisir EatFast ?',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: DesignTokens.fontWeightBold,
            color: DesignTokens.textPrimary,
          ),
        ),
        const SizedBox(height: DesignTokens.spaceMD),

        // Feature Cards Grid
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildFeatureCard(
                    context,
                    icon: Icons.location_on,
                    title: 'Restaurants � proximit�',
                    description: 'Trouvez les meilleurs restaurants pr�s de vous',
                    color: DesignTokens.primaryColor,
                  ),
                ),
                const SizedBox(width: DesignTokens.spaceMD),
                Expanded(
                  child: _buildFeatureCard(
                    context,
                    icon: Icons.delivery_dining,
                    title: 'Livraison rapide',
                    description: '30 minutes maximum',
                    color: DesignTokens.secondaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            Row(
              children: [
                Expanded(
                  child: _buildFeatureCard(
                    context,
                    icon: Icons.payment,
                    title: 'Paiement facile',
                    description: 'Mobile Money, cartes bancaires',
                    color: DesignTokens.accentColor,
                  ),
                ),
                const SizedBox(width: DesignTokens.spaceMD),
                Expanded(
                  child: _buildFeatureCard(
                    context,
                    icon: Icons.star,
                    title: 'Cuisine locale',
                    description: 'Plats authentiques camerounais',
                    color: DesignTokens.warningColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      decoration: BoxDecoration(
        color: DesignTokens.white,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
          width: 1,
        ),
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
          Container(
            padding: const EdgeInsets.all(DesignTokens.spaceSM),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
            ),
            child: Icon(
              icon,
              color: color,
              size: DesignTokens.iconMD,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: DesignTokens.fontWeightSemiBold,
              color: DesignTokens.textPrimary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: DesignTokens.spaceXS),
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: DesignTokens.textSecondary,
              height: 1.3,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
