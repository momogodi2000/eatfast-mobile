import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../shared/widgets/loading/shimmer_loading.dart';
import '../../../restaurants/providers/restaurant_provider.dart';
import '../../../restaurants/domain/models/restaurant.dart';

class PopularRestaurantsSection extends ConsumerWidget {
  const PopularRestaurantsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantsState = ref.watch(restaurantListProvider(null));

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
              ),
            ),
            TextButton(
              onPressed: () {
                context.go('/restaurants?popular=true');
              },
              child: const Text('Voir tout'),
            ),
          ],
        ),
        
        const SizedBox(height: DesignTokens.spaceMD),
        
        SizedBox(
          height: 220,
          child: switch (restaurantsState) {
            RestaurantListInitial() || RestaurantListLoading() => const _LoadingRestaurants(),
            RestaurantListError(:final message) => Center(
              child: Text(
                'Erreur: $message',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: DesignTokens.errorColor,
                ),
              ),
            ),
            RestaurantListLoaded(:final restaurants) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: restaurants.take(5).length,
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];
                return _buildRestaurantCard(context, restaurant);
              },
            ),
          },
        ),
      ],
    );
  }

  Widget _buildRestaurantCard(BuildContext context, Restaurant restaurant) {
    return GestureDetector(
      onTap: () {
        context.go('/restaurants/${restaurant.id}');
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: DesignTokens.spaceMD),
        decoration: BoxDecoration(
          color: DesignTokens.white,
          borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Restaurant Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(DesignTokens.radiusLG),
                topRight: Radius.circular(DesignTokens.radiusLG),
              ),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: restaurant.imageUrl,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 100,
                      color: DesignTokens.lightGrey.withOpacity(0.3),
                      child: const Center(
                        child: Icon(
                          Icons.restaurant,
                          size: 32,
                          color: DesignTokens.textTertiary,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 100,
                      color: DesignTokens.lightGrey.withOpacity(0.3),
                      child: const Center(
                        child: Icon(
                          Icons.restaurant,
                          size: 32,
                          color: DesignTokens.textTertiary,
                        ),
                      ),
                    ),
                  ),
                  
                  // Promotion badge
                  if (restaurant.isPromoted)
                    Positioned(
                      top: DesignTokens.spaceXS,
                      right: DesignTokens.spaceXS,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: DesignTokens.spaceXS,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: DesignTokens.errorColor,
                          borderRadius: BorderRadius.circular(DesignTokens.radiusXS),
                        ),
                        child: const Text(
                          'PROMO',
                          style: TextStyle(
                            color: DesignTokens.white,
                            fontSize: 10,
                            fontWeight: DesignTokens.fontWeightBold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(DesignTokens.spaceSM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: DesignTokens.fontWeightSemiBold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: DesignTokens.spaceXXS),
                    
                    Text(
                      restaurant.cuisineTypes.join(', '),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: DesignTokens.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const Spacer(),
                    
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: DesignTokens.warningColor,
                          size: 14,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          restaurant.rating.toStringAsFixed(1),
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: DesignTokens.fontWeightMedium,
                          ),
                        ),
                        const SizedBox(width: DesignTokens.spaceXS),
                        Text(
                          '(${restaurant.reviewCount})',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: DesignTokens.textTertiary,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: DesignTokens.spaceXXS),
                    
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: DesignTokens.textSecondary,
                          size: 14,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '${restaurant.estimatedDeliveryTime} min',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: DesignTokens.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingRestaurants extends StatelessWidget {
  const _LoadingRestaurants();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          width: 160,
          margin: const EdgeInsets.only(right: DesignTokens.spaceMD),
          child: const ShimmerLoading(
            child: Card(
              child: SizedBox(height: 220),
            ),
          ),
        );
      },
    );
  }
}