import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/services/restaurants/domain/models/restaurant.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';
import 'package:eatfast_mobile/shared/widgets/common/loading_widget.dart';
import 'package:eatfast_mobile/shared/widgets/common/error_display_widget.dart';
import 'package:eatfast_mobile/shared/services/restaurants/presentation/widgets/restaurant_card.dart';

class RestaurantListScreen extends ConsumerWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Replace with actual restaurant provider
    final restaurantsAsync = AsyncValue.data(<Restaurant>[]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restaurants',
          style: TextStyle(
            fontWeight: DesignTokens.fontWeightBold,
            color: DesignTokens.textPrimary,
          ),
        ),
        backgroundColor: DesignTokens.backgroundPrimary,
        elevation: 0,
      ),
      body: restaurantsAsync.when(
        data: (restaurants) => _buildRestaurantList(restaurants),
        loading: () => const LoadingWidget(),
        error: (error, stack) => ErrorDisplayWidget(
          message: 'Failed to load restaurants',
          onRetry: () {
            // TODO: Implement retry logic
          },
        ),
      ),
    );
  }

  Widget _buildRestaurantList(List<Restaurant> restaurants) {
    if (restaurants.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant,
              size: DesignTokens.iconXL,
              color: DesignTokens.textSecondary,
            ),
            SizedBox(height: DesignTokens.spaceMD),
            Text(
              'No restaurants available',
              style: TextStyle(
                fontSize: DesignTokens.fontSizeLG,
                color: DesignTokens.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(DesignTokens.spaceMD),
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
        return Padding(
          padding: EdgeInsets.only(bottom: DesignTokens.spaceMD),
          child: RestaurantCard(restaurant: restaurant),
        );
      },
    );
  }
}
