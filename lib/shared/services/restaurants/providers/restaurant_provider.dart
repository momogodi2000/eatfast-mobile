import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/services/restaurant/restaurant_service.dart'
    as restaurant_service;
import 'package:eatfast_mobile/shared/services/restaurants/domain/models/restaurant.dart';
import '../domain/models/menu_item.dart' as domain;

// Restaurant service provider
final restaurantServiceProvider =
    Provider<restaurant_service.RestaurantService>((ref) {
      return restaurant_service.RestaurantService();
    });

// Restaurant list provider with filters
final restaurantListProvider =
    StateNotifierProvider.family<
      RestaurantListNotifier,
      RestaurantListState,
      RestaurantFilter?
    >(
      (ref, filter) =>
          RestaurantListNotifier(ref.watch(restaurantServiceProvider), filter),
    );

// Restaurant detail provider
final restaurantDetailProvider = FutureProvider.family<Restaurant?, String>((
  ref,
  restaurantId,
) async {
  final service = ref.watch(restaurantServiceProvider);
  final restaurant = await service.getRestaurantById(restaurantId);
  return restaurant;
});

// Menu categories provider
final menuCategoriesProvider =
    FutureProvider.family<List<restaurant_service.MenuCategory>, String>((
      ref,
      restaurantId,
    ) async {
      final service = ref.watch(restaurantServiceProvider);
      final categories = await service.getMenuCategories(restaurantId);
      return categories;
    });

// Menu items provider
final menuItemsProvider =
    FutureProvider.family<List<domain.MenuItem>, MenuItemsParams>((
      ref,
      params,
    ) async {
      final service = ref.watch(restaurantServiceProvider);
      final categories = await service.getMenuCategories(params.restaurantId);

      if (params.categoryId != null) {
        final category = categories.firstWhere(
          (cat) => cat.id == params.categoryId,
          orElse: () => restaurant_service.MenuCategory(id: '', name: ''),
        );
        return category.items.map(_convertMenuItem).toList();
      }

      // Return all items from all categories
      return categories
          .expand((category) => category.items.map(_convertMenuItem))
          .toList();
    });

// Helper function to convert service MenuItem to domain MenuItem
domain.MenuItem _convertMenuItem(restaurant_service.MenuItem serviceItem) {
  return domain.MenuItem(
    id: serviceItem.id,
    restaurantId: '', // Will be set by the calling context
    name: serviceItem.name,
    description: serviceItem.description,
    price: serviceItem.price,
    imageUrl: serviceItem.imageUrl,
    category: '', // Will be set by the calling context
    allergens: serviceItem.allergens,
    isAvailable: serviceItem.isAvailable,
  );
}

// Search provider
final restaurantSearchProvider =
    StateNotifierProvider<RestaurantSearchNotifier, RestaurantSearchState>(
      (ref) => RestaurantSearchNotifier(ref.watch(restaurantServiceProvider)),
    );

// Favorite restaurants provider
final favoriteRestaurantsProvider =
    StateNotifierProvider<FavoriteRestaurantsNotifier, Set<String>>(
      (ref) => FavoriteRestaurantsNotifier(),
    );

class RestaurantListNotifier extends StateNotifier<RestaurantListState> {
  final restaurant_service.RestaurantService _service;
  final RestaurantFilter? _filter;

  RestaurantListNotifier(this._service, this._filter)
    : super(const RestaurantListState.initial()) {
    loadRestaurants();
  }

  Future<void> loadRestaurants({bool refresh = false}) async {
    if (!refresh && state is RestaurantListLoading) return;

    state = const RestaurantListState.loading();

    try {
      final restaurants = await _service.getRestaurants(
        searchQuery: _filter?.searchQuery,
      );
      state = RestaurantListState.loaded(restaurants);
    } catch (e) {
      state = RestaurantListState.error(e.toString());
    }
  }

  Future<void> loadMoreRestaurants() async {
    if (state is! RestaurantListLoaded) return;

    final currentState = state as RestaurantListLoaded;

    try {
      final restaurants = await _service.getRestaurants(
        searchQuery: _filter?.searchQuery,
      );

      if (restaurants.isNotEmpty) {
        state = RestaurantListState.loaded([
          ...currentState.restaurants,
          ...restaurants,
        ]);
      }
    } catch (e) {
      // Silently ignore pagination errors
    }
  }
}

class RestaurantSearchNotifier extends StateNotifier<RestaurantSearchState> {
  final restaurant_service.RestaurantService _service;

  RestaurantSearchNotifier(this._service)
    : super(const RestaurantSearchState.initial());

  Future<void> searchRestaurants(
    String query, {
    RestaurantFilter? filter,
  }) async {
    if (query.trim().isEmpty) {
      state = const RestaurantSearchState.initial();
      return;
    }

    state = const RestaurantSearchState.loading();

    try {
      final restaurants = await _service.getRestaurants(searchQuery: query);
      state = RestaurantSearchState.loaded(restaurants);
    } catch (e) {
      state = RestaurantSearchState.error(e.toString());
    }
  }

  void clearSearch() {
    state = const RestaurantSearchState.initial();
  }
}

class FavoriteRestaurantsNotifier extends StateNotifier<Set<String>> {
  FavoriteRestaurantsNotifier() : super(<String>{});

  void toggleFavorite(String restaurantId) {
    if (state.contains(restaurantId)) {
      state = Set.from(state)..remove(restaurantId);
    } else {
      state = Set.from(state)..add(restaurantId);
    }
  }

  bool isFavorite(String restaurantId) {
    return state.contains(restaurantId);
  }
}

// State classes
sealed class RestaurantListState {
  const RestaurantListState();

  const factory RestaurantListState.initial() = RestaurantListInitial;
  const factory RestaurantListState.loading() = RestaurantListLoading;
  const factory RestaurantListState.loaded(List<Restaurant> restaurants) =
      RestaurantListLoaded;
  const factory RestaurantListState.error(String message) = RestaurantListError;
}

class RestaurantListInitial extends RestaurantListState {
  const RestaurantListInitial();
}

class RestaurantListLoading extends RestaurantListState {
  const RestaurantListLoading();
}

class RestaurantListLoaded extends RestaurantListState {
  final List<Restaurant> restaurants;
  const RestaurantListLoaded(this.restaurants);
}

class RestaurantListError extends RestaurantListState {
  final String message;
  const RestaurantListError(this.message);
}

sealed class RestaurantSearchState {
  const RestaurantSearchState();

  const factory RestaurantSearchState.initial() = RestaurantSearchInitial;
  const factory RestaurantSearchState.loading() = RestaurantSearchLoading;
  const factory RestaurantSearchState.loaded(List<Restaurant> restaurants) =
      RestaurantSearchLoaded;
  const factory RestaurantSearchState.error(String message) =
      RestaurantSearchError;
}

class RestaurantSearchInitial extends RestaurantSearchState {
  const RestaurantSearchInitial();
}

class RestaurantSearchLoading extends RestaurantSearchState {
  const RestaurantSearchLoading();
}

class RestaurantSearchLoaded extends RestaurantSearchState {
  final List<Restaurant> restaurants;
  const RestaurantSearchLoaded(this.restaurants);
}

class RestaurantSearchError extends RestaurantSearchState {
  final String message;
  const RestaurantSearchError(this.message);
}

// Helper classes
class MenuItemsParams {
  final String restaurantId;
  final String? categoryId;

  const MenuItemsParams({required this.restaurantId, this.categoryId});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MenuItemsParams &&
        other.restaurantId == restaurantId &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode => restaurantId.hashCode ^ categoryId.hashCode;
}
