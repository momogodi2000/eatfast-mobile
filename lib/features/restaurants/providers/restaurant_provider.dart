import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/restaurant_repository_impl.dart';
import '../domain/models/restaurant.dart';
import '../domain/models/menu_item.dart';
import '../domain/repositories/restaurant_repository.dart';

// Repository provider
final restaurantRepositoryProvider = Provider<RestaurantRepository>((ref) {
  return RestaurantRepositoryImpl();
});

// Restaurant list provider with filters
final restaurantListProvider = StateNotifierProvider.family<RestaurantListNotifier, RestaurantListState, RestaurantFilter?>(
  (ref, filter) => RestaurantListNotifier(ref.watch(restaurantRepositoryProvider), filter),
);

// Restaurant detail provider
final restaurantDetailProvider = FutureProvider.family<Restaurant?, String>((ref, restaurantId) async {
  final repository = ref.watch(restaurantRepositoryProvider);
  final result = await repository.getRestaurantById(restaurantId);
  
  return result.when(
    success: (restaurant) => restaurant,
    failure: (_) => null,
  );
});

// Menu categories provider
final menuCategoriesProvider = FutureProvider.family<List<MenuCategory>, String>((ref, restaurantId) async {
  final repository = ref.watch(restaurantRepositoryProvider);
  final result = await repository.getMenuCategories(restaurantId);
  
  return result.when(
    success: (categories) => categories,
    failure: (_) => <MenuCategory>[],
  );
});

// Menu items provider
final menuItemsProvider = FutureProvider.family<List<MenuItem>, MenuItemsParams>((ref, params) async {
  final repository = ref.watch(restaurantRepositoryProvider);
  final result = await repository.getMenuItems(params.restaurantId, categoryId: params.categoryId);
  
  return result.when(
    success: (items) => items,
    failure: (_) => <MenuItem>[],
  );
});

// Search provider
final restaurantSearchProvider = StateNotifierProvider<RestaurantSearchNotifier, RestaurantSearchState>(
  (ref) => RestaurantSearchNotifier(ref.watch(restaurantRepositoryProvider)),
);

// Favorite restaurants provider
final favoriteRestaurantsProvider = StateNotifierProvider<FavoriteRestaurantsNotifier, Set<String>>(
  (ref) => FavoriteRestaurantsNotifier(),
);

class RestaurantListNotifier extends StateNotifier<RestaurantListState> {
  final RestaurantRepository _repository;
  final RestaurantFilter? _filter;

  RestaurantListNotifier(this._repository, this._filter) : super(const RestaurantListState.initial()) {
    loadRestaurants();
  }

  Future<void> loadRestaurants({bool refresh = false}) async {
    if (!refresh && state is RestaurantListLoading) return;

    state = const RestaurantListState.loading();

    final result = await _repository.getRestaurants(
      page: 1,
      limit: 20,
      filter: _filter,
    );

    state = result.when(
      success: (restaurants) => RestaurantListState.loaded(restaurants),
      failure: (error) => RestaurantListState.error(error),
    );
  }

  Future<void> loadMoreRestaurants() async {
    if (state is! RestaurantListLoaded) return;

    final currentState = state as RestaurantListLoaded;
    final currentPage = (currentState.restaurants.length / 20).ceil() + 1;

    final result = await _repository.getRestaurants(
      page: currentPage,
      limit: 20,
      filter: _filter,
    );

    result.when(
      success: (newRestaurants) {
        if (newRestaurants.isNotEmpty) {
          state = RestaurantListState.loaded([
            ...currentState.restaurants,
            ...newRestaurants,
          ]);
        }
      },
      failure: (_) {
        // Keep current state on error
      },
    );
  }
}

class RestaurantSearchNotifier extends StateNotifier<RestaurantSearchState> {
  final RestaurantRepository _repository;

  RestaurantSearchNotifier(this._repository) : super(const RestaurantSearchState.initial());

  Future<void> searchRestaurants(String query, {RestaurantFilter? filter}) async {
    if (query.trim().isEmpty) {
      state = const RestaurantSearchState.initial();
      return;
    }

    state = const RestaurantSearchState.loading();

    final result = await _repository.searchRestaurants(query, filter: filter);

    state = result.when(
      success: (restaurants) => RestaurantSearchState.loaded(restaurants),
      failure: (error) => RestaurantSearchState.error(error),
    );
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