import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/models/restaurant_models.dart';

/// Restaurant search provider
final restaurantSearchProvider = StateNotifierProvider<RestaurantSearchNotifier, RestaurantSearchState>((ref) {
  return RestaurantSearchNotifier();
});

/// Favorite restaurants provider
final favoriteRestaurantsProvider = StateNotifierProvider<FavoriteRestaurantsNotifier, Set<String>>((ref) {
  return FavoriteRestaurantsNotifier();
});

class RestaurantSearchNotifier extends StateNotifier<RestaurantSearchState> {
  RestaurantSearchNotifier() : super(const RestaurantSearchInitial());

  Future<void> searchRestaurants(String query) async {
    if (query.isEmpty) {
      state = const RestaurantSearchInitial();
      return;
    }

    state = const RestaurantSearchLoading();
    try {
      // TODO: Implement search API
      await Future.delayed(const Duration(seconds: 1));
      state = const RestaurantSearchLoaded([
        Restaurant(
          id: '1',
          name: 'Sample Restaurant',
          description: 'Delicious food',
          imageUrl: '',
          rating: 4.5,
          reviewCount: 100,
          cuisine: 'Italian',
          deliveryFee: 2.99,
          deliveryTime: 30,
        ),
      ]);
    } catch (e) {
      state = RestaurantSearchError(e.toString());
    }
  }

  void clearSearch() {
    state = const RestaurantSearchInitial();
  }
}

class FavoriteRestaurantsNotifier extends StateNotifier<Set<String>> {
  FavoriteRestaurantsNotifier() : super({});

  void toggleFavorite(String restaurantId) {
    if (state.contains(restaurantId)) {
      state = {...state}..remove(restaurantId);
    } else {
      state = {...state, restaurantId};
    }
  }
}
