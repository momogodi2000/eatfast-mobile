import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../shared/widgets/loading/shimmer_loading.dart';
import '../../../restaurants/providers/restaurant_provider.dart';
import '../../../restaurants/domain/models/menu_item.dart';

class FeaturedDishesSection extends ConsumerWidget {
  const FeaturedDishesSection({super.key});

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
              'Plats en vedette',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: DesignTokens.fontWeightBold,
              ),
            ),
            TextButton(
              onPressed: () {
                context.go('/restaurants?featured=true');
              },
              child: const Text('Voir tout'),
            ),
          ],
        ),
        
        const SizedBox(height: DesignTokens.spaceMD),
        
        switch (restaurantsState) {
          RestaurantListLoading() => const _LoadingDishes(),
          RestaurantListError(:final message) => Center(
            child: Text(
              'Erreur: $message',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: DesignTokens.errorColor,
              ),
            ),
          ),
          RestaurantListLoaded(:final restaurants) => _buildFeaturedDishes(context, restaurants),
        },
      ],
    );
  }

  Widget _buildFeaturedDishes(BuildContext context, List restaurants) {
    // Extract featured dishes from all restaurants
    final featuredDishes = <_DishWithRestaurant>[];
    
    for (final restaurant in restaurants.take(3)) {
      // Get a few menu items from each restaurant
      final menuItems = restaurant.menuItems.take(2);
      for (final item in menuItems) {
        featuredDishes.add(_DishWithRestaurant(
          dish: item,
          restaurantName: restaurant.name,
          restaurantId: restaurant.id,
        ));
      }
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: DesignTokens.spaceMD,
        mainAxisSpacing: DesignTokens.spaceMD,
        childAspectRatio: 0.75,
      ),
      itemCount: featuredDishes.take(6).length,
      itemBuilder: (context, index) {
        final dishWithRestaurant = featuredDishes[index];
        return _buildDishCard(context, dishWithRestaurant);
      },
    );
  }

  Widget _buildDishCard(BuildContext context, _DishWithRestaurant dishWithRestaurant) {
    final dish = dishWithRestaurant.dish;
    
    return GestureDetector(
      onTap: () {
        context.go('/restaurants/${dishWithRestaurant.restaurantId}?highlight=${dish.id}');
      },
      child: Container(
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
            // Dish Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(DesignTokens.radiusLG),
                topRight: Radius.circular(DesignTokens.radiusLG),
              ),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: dish.imageUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 120,
                      color: DesignTokens.lightGrey.withOpacity(0.3),
                      child: const Center(
                        child: Icon(
                          Icons.fastfood,
                          size: 32,
                          color: DesignTokens.textTertiary,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 120,
                      color: DesignTokens.lightGrey.withOpacity(0.3),
                      child: const Center(
                        child: Icon(
                          Icons.fastfood,
                          size: 32,
                          color: DesignTokens.textTertiary,
                        ),
                      ),
                    ),
                  ),
                  
                  // Popular badge
                  if (dish.isPopular)
                    Positioned(
                      top: DesignTokens.spaceXS,
                      left: DesignTokens.spaceXS,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: DesignTokens.spaceXS,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: DesignTokens.successColor,
                          borderRadius: BorderRadius.circular(DesignTokens.radiusXS),
                        ),
                        child: const Text(
                          'POPULAIRE',
                          style: TextStyle(
                            color: DesignTokens.white,
                            fontSize: 10,
                            fontWeight: DesignTokens.fontWeightBold,
                          ),
                        ),
                      ),
                    ),
                  
                  // Vegetarian icon
                  if (dish.dietaryTags.contains('Végétarien'))
                    Positioned(
                      top: DesignTokens.spaceXS,
                      right: DesignTokens.spaceXS,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: DesignTokens.white.withOpacity(0.9),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.eco,
                          color: DesignTokens.successColor,
                          size: 16,
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
                      dish.name,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: DesignTokens.fontWeightSemiBold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: DesignTokens.spaceXXS),
                    
                    Text(
                      dishWithRestaurant.restaurantName,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: DesignTokens.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    if (dish.description.isNotEmpty) ...[ 
                      const SizedBox(height: DesignTokens.spaceXXS),
                      Text(
                        dish.description,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: DesignTokens.textTertiary,
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    
                    const Spacer(),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (dish.rating > 0) ...[ 
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: DesignTokens.warningColor,
                                size: 14,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                dish.rating.toStringAsFixed(1),
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontWeight: DesignTokens.fontWeightMedium,
                                ),
                              ),
                            ],
                          ),
                        ] else 
                          const SizedBox.shrink(),
                        
                        Text(
                          '${dish.price.toInt()} FCFA',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: DesignTokens.primaryColor,
                            fontWeight: DesignTokens.fontWeightBold,
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

class _LoadingDishes extends StatelessWidget {
  const _LoadingDishes();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: DesignTokens.spaceMD,
        mainAxisSpacing: DesignTokens.spaceMD,
        childAspectRatio: 0.75,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return const ShimmerLoading(
          child: Card(
            child: SizedBox(height: 200),
          ),
        );
      },
    );
  }
}

class _DishWithRestaurant {
  final dynamic dish;
  final String restaurantName;
  final String restaurantId;

  const _DishWithRestaurant({
    required this.dish,
    required this.restaurantName,
    required this.restaurantId,
  });
}