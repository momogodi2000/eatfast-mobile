import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';

/// Restaurant section widget for guest users showing nearby restaurants
class GuestRestaurantSection extends ConsumerWidget {
  final Function()? onSeeAllPressed;

  const GuestRestaurantSection({
    super.key,
    this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Restaurants populaires',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: DesignTokens.fontWeightBold,
                color: DesignTokens.textPrimary,
              ),
            ),
            if (onSeeAllPressed != null)
              TextButton(
                onPressed: onSeeAllPressed,
                child: const Text('Voir tout'),
              ),
          ],
        ),
        const SizedBox(height: DesignTokens.spaceMD),

        // Restaurant Cards - Placeholder for now
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3, // Placeholder count
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index < 2 ? DesignTokens.spaceMD : 0,
                ),
                child: _buildRestaurantCard(context, index),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRestaurantCard(BuildContext context, int index) {
    final restaurantNames = [
      'Restaurant Le Cameroun',
      'Chez Mama Africa',
      'Le Gourmet Tropical',
    ];

    final cuisines = [
      'Cuisine Camerounaise',
      'Plats Traditionnels',
      'Fusion Africaine',
    ];

    return Container(
      width: 160,
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
          // Restaurant Image Placeholder
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: DesignTokens.primaryColor.withValues(alpha: 0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(DesignTokens.radiusMD),
                topRight: Radius.circular(DesignTokens.radiusMD),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.restaurant,
                size: DesignTokens.iconLG,
                color: DesignTokens.primaryColor,
              ),
            ),
          ),

          // Restaurant Info
          Padding(
            padding: const EdgeInsets.all(DesignTokens.spaceSM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurantNames[index],
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: DesignTokens.fontWeightSemiBold,
                    color: DesignTokens.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: DesignTokens.spaceXS),
                Text(
                  cuisines[index],
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: DesignTokens.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: DesignTokens.spaceXS),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 14,
                      color: DesignTokens.warningColor,
                    ),
                    const SizedBox(width: DesignTokens.spaceXS),
                    Text(
                      '4.${5 - index}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: DesignTokens.textSecondary,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '20-30 min',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: DesignTokens.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
