import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/restaurant/restaurant_service.dart';
import '../domain/models/restaurant.dart';
import '../domain/models/menu_item.dart' hide MenuCategory;

// Restaurant list provider with filters
final restaurantListProvider = StateNotifierProvider.family<RestaurantListNotifier, RestaurantListState, RestaurantFilter?>(
  (ref, filter) => RestaurantListNotifier(ref.watch(restaurantServiceProvider), filter),
);

// Restaurant detail provider
final restaurantDetailProvider = FutureProvider.family<Restaurant?, String>((ref, restaurantId) async {
  final service = ref.watch(restaurantServiceProvider);
  final response = await service.getRestaurantDetails(restaurantId);
  
  if (response.success && response.restaurant != null) {
    return response.restaurant;
  }
  return null;
});

// Menu categories provider
final menuCategoriesProvider = FutureProvider.family<List<MenuCategory>, String>((ref, restaurantId) async {
  final service = ref.watch(restaurantServiceProvider);
  final response = await service.getMenuCategories(restaurantId);
  
  if (response.success) {
    return response.categories;
  }
  return <MenuCategory>[];
});

// Menu items provider
final menuItemsProvider = FutureProvider.family<List<MenuItem>, MenuItemsParams>((ref, params) async {
  final service = ref.watch(restaurantServiceProvider);
  final response = await service.getRestaurantMenu(params.restaurantId, category: params.categoryId);
  
  if (response.success) {
    return response.menuItems;
  }
  return <MenuItem>[];
});

// Search provider
final restaurantSearchProvider = StateNotifierProvider<RestaurantSearchNotifier, RestaurantSearchState>(
  (ref) => RestaurantSearchNotifier(ref.watch(restaurantServiceProvider)),
);

// Favorite restaurants provider
final favoriteRestaurantsProvider = StateNotifierProvider<FavoriteRestaurantsNotifier, Set<String>>(
  (ref) => FavoriteRestaurantsNotifier(),
);

class RestaurantListNotifier extends StateNotifier<RestaurantListState> {
  final RestaurantService _service;
  final RestaurantFilter? _filter;

  RestaurantListNotifier(this._service, this._filter) : super(const RestaurantListState.initial()) {
    loadRestaurants();
  }

  Future<void> loadRestaurants({bool refresh = false}) async {
    if (!refresh && state is RestaurantListLoading) return;

    state = const RestaurantListState.loading();

    final response = await _service.getRestaurants(
      page: 1,
      limit: 20,
      search: _filter?.searchQuery,
      cuisineTypes: _filter?.cuisineTypes,
      minRating: _filter?.minRating,
      maxDeliveryFee: _filter?.maxDeliveryFee,
    );

    if (response.success) {
      state = RestaurantListState.loaded(response.restaurants);
    } else {
      state = RestaurantListState.error(response.error ?? 'Failed to load restaurants');
    }
  }

  Future<void> loadMoreRestaurants() async {
    if (state is! RestaurantListLoaded) return;

    final currentState = state as RestaurantListLoaded;
    final currentPage = (currentState.restaurants.length / 20).ceil() + 1;

    final response = await _service.getRestaurants(
      page: currentPage,
      limit: 20,
      search: _filter?.searchQuery,
      cuisineTypes: _filter?.cuisineTypes,
      minRating: _filter?.minRating,
      maxDeliveryFee: _filter?.maxDeliveryFee,
    );

    if (response.success && response.restaurants.isNotEmpty) {
      state = RestaurantListState.loaded([
        ...currentState.restaurants,
        ...response.restaurants,
      ]);
    }
  }
}

class RestaurantSearchNotifier extends StateNotifier<RestaurantSearchState> {
  final RestaurantService _service;

  RestaurantSearchNotifier(this._service) : super(const RestaurantSearchState.initial());

  Future<void> searchRestaurants(String query, {RestaurantFilter? filter}) async {
    if (query.trim().isEmpty) {
      state = const RestaurantSearchState.initial();
      return;
    }

    state = const RestaurantSearchState.loading();

    final response = await _service.getRestaurants(
      search: query,
      cuisineTypes: filter?.cuisineTypes,
      minRating: filter?.minRating,
      maxDeliveryFee: filter?.maxDeliveryFee,
    );

    if (response.success) {
      state = RestaurantSearchState.loaded(response.restaurants);
    } else {
      state = RestaurantSearchState.error(response.error ?? 'Search failed');
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
  const factory RestaurantListState.loaded(List<Restaurant> restaurants) = RestaurantListLoaded;
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
  const factory RestaurantSearchState.loaded(List<Restaurant> restaurants) = RestaurantSearchLoaded;
  const factory RestaurantSearchState.error(String message) = RestaurantSearchError;
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

  const MenuItemsParams({
    required this.restaurantId,
    this.categoryId,
  });

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
