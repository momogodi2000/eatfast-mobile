import 'package:flutter/material.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';
import 'package:eatfast_mobile/shared/services/restaurants/domain/models/restaurant.dart';

/// Restaurant card widget optimized for guest users
/// Shows essential restaurant information with distance and ratings
class GuestRestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final String distance;
  final VoidCallback? onTap;

  const GuestRestaurantCard({
    super.key,
    required this.restaurant,
    this.distance = '',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            // Restaurant Image
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(DesignTokens.radiusMD),
                  topRight: Radius.circular(DesignTokens.radiusMD),
                ),
                color: DesignTokens.primaryColor.withValues(alpha: 0.1),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(DesignTokens.radiusMD),
                  topRight: Radius.circular(DesignTokens.radiusMD),
                ),
                child:
                    restaurant.images != null && restaurant.images!.isNotEmpty
                    ? Image.network(
                        restaurant.images!.first,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return _buildImagePlaceholder();
                        },
                      )
                    : _buildImagePlaceholder(),
              ),
            ),

            // Restaurant Info
            Padding(
              padding: const EdgeInsets.all(DesignTokens.spaceMD),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Restaurant Name and Status
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          restaurant.name,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: DesignTokens.fontWeightBold,
                                color: DesignTokens.textPrimary,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: DesignTokens.spaceSM,
                          vertical: DesignTokens.spaceXS,
                        ),
                        decoration: BoxDecoration(
                          color: restaurant.isOpen
                              ? DesignTokens.successColor.withValues(alpha: 0.1)
                              : DesignTokens.errorColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(
                            DesignTokens.radiusSM,
                          ),
                        ),
                        child: Text(
                          restaurant.isOpen ? 'Ouvert' : 'Ferm�',
                          style: TextStyle(
                            color: restaurant.isOpen
                                ? DesignTokens.successColor
                                : DesignTokens.errorColor,
                            fontSize: DesignTokens.fontSizeXS,
                            fontWeight: DesignTokens.fontWeightSemiBold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: DesignTokens.spaceXS),

                  // Cuisine Type
                  Text(
                    restaurant.cuisineType,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: DesignTokens.textSecondary,
                    ),
                  ),

                  const SizedBox(height: DesignTokens.spaceSM),

                  // Rating, Distance, and Delivery Info
                  Row(
                    children: [
                      // Rating
                      Icon(
                        Icons.star,
                        size: 16,
                        color: DesignTokens.warningColor,
                      ),
                      const SizedBox(width: DesignTokens.spaceXS),
                      Text(
                        restaurant.rating.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: DesignTokens.fontWeightSemiBold,
                          color: DesignTokens.textPrimary,
                        ),
                      ),
                      Text(
                        ' (${restaurant.reviewCount})',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: DesignTokens.textSecondary,
                        ),
                      ),

                      // Separator
                      if (distance.isNotEmpty ||
                          restaurant.estimatedDeliveryTime > 0)
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: DesignTokens.spaceSM,
                          ),
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: DesignTokens.textSecondary,
                            shape: BoxShape.circle,
                          ),
                        ),

                      // Distance
                      if (distance.isNotEmpty) ...[
                        Icon(
                          Icons.location_on,
                          size: 14,
                          color: DesignTokens.textSecondary,
                        ),
                        const SizedBox(width: DesignTokens.spaceXS),
                        Text(
                          distance,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: DesignTokens.textSecondary),
                        ),
                      ],

                      const Spacer(),

                      // Delivery Time
                      if (restaurant.estimatedDeliveryTime > 0)
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 14,
                              color: DesignTokens.textSecondary,
                            ),
                            const SizedBox(width: DesignTokens.spaceXS),
                            Text(
                              '${restaurant.estimatedDeliveryTime} min',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: DesignTokens.textSecondary),
                            ),
                          ],
                        ),
                    ],
                  ),

                  const SizedBox(height: DesignTokens.spaceSM),

                  // Delivery Fee and Minimum Order
                  Row(
                    children: [
                      if (restaurant.deliveryFee > 0) ...[
                        Text(
                          'Livraison: ${restaurant.deliveryFee.toStringAsFixed(0)} FCFA',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: DesignTokens.textSecondary),
                        ),
                      ] else ...[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: DesignTokens.spaceSM,
                            vertical: DesignTokens.spaceXS,
                          ),
                          decoration: BoxDecoration(
                            color: DesignTokens.successColor.withValues(
                              alpha: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(
                              DesignTokens.radiusSM,
                            ),
                          ),
                          child: Text(
                            'Livraison gratuite',
                            style: TextStyle(
                              color: DesignTokens.successColor,
                              fontSize: DesignTokens.fontSizeXS,
                              fontWeight: DesignTokens.fontWeightSemiBold,
                            ),
                          ),
                        ),
                      ],

                      const Spacer(),

                      if (restaurant.minimumOrder > 0)
                        Text(
                          'Min: ${restaurant.minimumOrder.toStringAsFixed(0)} FCFA',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: DesignTokens.textSecondary),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: DesignTokens.primaryColor.withValues(alpha: 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.restaurant,
            size: DesignTokens.iconLG,
            color: DesignTokens.primaryColor.withValues(alpha: 0.7),
          ),
          const SizedBox(height: DesignTokens.spaceSM),
          Text(
            restaurant.name,
            style: TextStyle(
              color: DesignTokens.primaryColor.withValues(alpha: 0.7),
              fontWeight: DesignTokens.fontWeightSemiBold,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
