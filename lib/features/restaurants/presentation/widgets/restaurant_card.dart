import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../domain/models/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const RestaurantCard({
    super.key,
    required this.restaurant,
    required this.isFavorite,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Restaurant image with overlay info
            _buildImageSection(context),
            
            // Restaurant details
            _buildDetailsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(DesignTokens.radiusLG),
          topRight: Radius.circular(DesignTokens.radiusLG),
        ),
      ),
      child: Stack(
        children: [
          // Restaurant image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(DesignTokens.radiusLG),
              topRight: Radius.circular(DesignTokens.radiusLG),
            ),
            child: CachedNetworkImage(
              imageUrl: restaurant.imageUrl,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: DesignTokens.lightGrey.withValues(alpha: 0.3),
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: DesignTokens.lightGrey.withValues(alpha: 0.3),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.restaurant,
                      size: 48,
                      color: DesignTokens.textTertiary,
                    ),
                    SizedBox(height: DesignTokens.spaceXS),
                    Text(
                      'Image non disponible',
                      style: TextStyle(
                        color: DesignTokens.textTertiary,
                        fontSize: DesignTokens.fontSizeSM,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(DesignTokens.radiusLG),
                topRight: Radius.circular(DesignTokens.radiusLG),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.7),
                ],
              ),
            ),
          ),
          
          // Top overlay badges
          Positioned(
            top: DesignTokens.spaceMD,
            left: DesignTokens.spaceMD,
            right: DesignTokens.spaceMD,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Status badges
                Row(
                  children: [
                    if (restaurant.isPromoted)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: DesignTokens.spaceSM,
                          vertical: DesignTokens.spaceXS,
                        ),
                        decoration: BoxDecoration(
                          color: DesignTokens.accentColor,
                          borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                        ),
                        child: const Text(
                          'PROMU',
                          style: TextStyle(
                            color: DesignTokens.white,
                            fontSize: DesignTokens.fontSizeXS,
                            fontWeight: DesignTokens.fontWeightBold,
                          ),
                        ),
                      ),
                    const SizedBox(width: DesignTokens.spaceSM),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: DesignTokens.spaceSM,
                        vertical: DesignTokens.spaceXS,
                      ),
                      decoration: BoxDecoration(
                        color: restaurant.isOpen ? DesignTokens.successColor : DesignTokens.errorColor,
                        borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                      ),
                      child: Text(
                        restaurant.isOpen ? 'OUVERT' : 'FERMÉ',
                        style: const TextStyle(
                          color: DesignTokens.white,
                          fontSize: DesignTokens.fontSizeXS,
                          fontWeight: DesignTokens.fontWeightBold,
                        ),
                      ),
                    ),
                  ],
                ),
                
                // Favorite button
                GestureDetector(
                  onTap: onFavoriteToggle,
                  child: Container(
                    padding: const EdgeInsets.all(DesignTokens.spaceSM),
                    decoration: BoxDecoration(
                      color: DesignTokens.white.withValues(alpha: 0.9),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? DesignTokens.errorColor : DesignTokens.textSecondary,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Bottom overlay info
          Positioned(
            bottom: DesignTokens.spaceMD,
            left: DesignTokens.spaceMD,
            right: DesignTokens.spaceMD,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: DesignTokens.white,
                    fontWeight: DesignTokens.fontWeightBold,
                    shadows: [
                      const Shadow(
                        color: Colors.black,
                        blurRadius: 4,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: DesignTokens.spaceXS),
                Row(
                  children: [
                    // Rating
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: DesignTokens.spaceSM,
                        vertical: DesignTokens.spaceXS,
                      ),
                      decoration: BoxDecoration(
                        color: DesignTokens.white.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            color: DesignTokens.warningColor,
                            size: 16,
                          ),
                          const SizedBox(width: DesignTokens.spaceXXS),
                          Text(
                            restaurant.rating.toString(),
                            style: const TextStyle(
                              color: DesignTokens.textPrimary,
                              fontSize: DesignTokens.fontSizeSM,
                              fontWeight: DesignTokens.fontWeightMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const Spacer(),
                    
                    // Delivery time and fee
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: DesignTokens.spaceSM,
                        vertical: DesignTokens.spaceXS,
                      ),
                      decoration: BoxDecoration(
                        color: DesignTokens.black.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                      ),
                      child: Text(
                        '${restaurant.estimatedDeliveryTime}min • ${restaurant.deliveryFee} FCFA',
                        style: const TextStyle(
                          color: DesignTokens.white,
                          fontSize: DesignTokens.fontSizeSM,
                          fontWeight: DesignTokens.fontWeightMedium,
                        ),
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

  Widget _buildDetailsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Description
          Text(
            restaurant.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: DesignTokens.textSecondary,
              height: 1.4,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          
          const SizedBox(height: DesignTokens.spaceSM),
          
          // Cuisine types and price range
          Row(
            children: [
              // Cuisine types
              Expanded(
                child: Wrap(
                  spacing: DesignTokens.spaceXS,
                  runSpacing: DesignTokens.spaceXS,
                  children: restaurant.cuisineTypes.take(3).map((cuisineType) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: DesignTokens.spaceSM,
                        vertical: DesignTokens.spaceXXS,
                      ),
                      decoration: BoxDecoration(
                        color: DesignTokens.primaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                      ),
                      child: Text(
                        cuisineType,
                        style: const TextStyle(
                          color: DesignTokens.primaryColor,
                          fontSize: DesignTokens.fontSizeXS,
                          fontWeight: DesignTokens.fontWeightMedium,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              
              // Price range
              Text(
                restaurant.priceRange,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: DesignTokens.primaryColor,
                  fontWeight: DesignTokens.fontWeightBold,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: DesignTokens.spaceSM),
          
          // Reviews count and location
          Row(
            children: [
              Text(
                '${restaurant.reviewCount} avis',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: DesignTokens.textTertiary,
                ),
              ),
              
              const SizedBox(width: DesignTokens.spaceMD),
              
              const Icon(
                Icons.location_on_outlined,
                size: 16,
                color: DesignTokens.textTertiary,
              ),
              
              const SizedBox(width: DesignTokens.spaceXS),
              
              Expanded(
                child: Text(
                  '${restaurant.address.district}, ${restaurant.address.city}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: DesignTokens.textTertiary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}