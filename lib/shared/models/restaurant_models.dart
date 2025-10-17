/// Restaurant search models
library;

enum RestaurantSearchStatus {
  initial,
  loading,
  loaded,
  error,
}

class RestaurantSearchState {
  final RestaurantSearchStatus status;
  final List<Restaurant> restaurants;
  final String? error;

  const RestaurantSearchState({
    required this.status,
    required this.restaurants,
    this.error,
  });

  RestaurantSearchState copyWith({
    RestaurantSearchStatus? status,
    List<Restaurant>? restaurants,
    String? error,
  }) {
    return RestaurantSearchState(
      status: status ?? this.status,
      restaurants: restaurants ?? this.restaurants,
      error: error,
    );
  }
}

class RestaurantSearchInitial extends RestaurantSearchState {
  const RestaurantSearchInitial()
      : super(status: RestaurantSearchStatus.initial, restaurants: const []);
}

class RestaurantSearchLoading extends RestaurantSearchState {
  const RestaurantSearchLoading()
      : super(status: RestaurantSearchStatus.loading, restaurants: const []);
}

class RestaurantSearchLoaded extends RestaurantSearchState {
  const RestaurantSearchLoaded(List<Restaurant> restaurants)
      : super(status: RestaurantSearchStatus.loaded, restaurants: restaurants);
}

class RestaurantSearchError extends RestaurantSearchState {
  const RestaurantSearchError(String error)
      : super(status: RestaurantSearchStatus.error, restaurants: const [], error: error);
}

// Assuming Restaurant model exists in shared/models
class Restaurant {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final String cuisine;
  final double deliveryFee;
  final int deliveryTime;

  const Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.cuisine,
    required this.deliveryFee,
    required this.deliveryTime,
  });
}
