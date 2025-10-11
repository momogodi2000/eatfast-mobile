import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../../../core/services/api/api_client.dart';
import '../../../features/restaurants/data/models/restaurant_model.dart';
import '../data/services/guest_restaurant_service.dart';

/// Provider for guest restaurant service
final guestRestaurantServiceProvider = Provider<GuestRestaurantService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return GuestRestaurantService(apiClient);
});

/// State for guest restaurant discovery
class GuestRestaurantState {
  final List<Restaurant> restaurants;
  final bool isLoading;
  final String? error;
  final Position? currentLocation;
  final bool hasLocation;
  final bool hasMoreData;
  final int currentPage;

  const GuestRestaurantState({
    this.restaurants = const [],
    this.isLoading = false,
    this.error,
    this.currentLocation,
    this.hasLocation = false,
    this.hasMoreData = true,
    this.currentPage = 1,
  });

  GuestRestaurantState copyWith({
    List<Restaurant>? restaurants,
    bool? isLoading,
    String? error,
    Position? currentLocation,
    bool? hasLocation,
    bool? hasMoreData,
    int? currentPage,
  }) {
    return GuestRestaurantState(
      restaurants: restaurants ?? this.restaurants,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      currentLocation: currentLocation ?? this.currentLocation,
      hasLocation: hasLocation ?? this.hasLocation,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

/// Guest restaurant discovery notifier
class GuestRestaurantNotifier extends StateNotifier<GuestRestaurantState> {
  final GuestRestaurantService _service;

  GuestRestaurantNotifier(this._service) : super(const GuestRestaurantState()) {
    _initializeLocation();
  }

  /// Initialize location and load nearby restaurants
  Future<void> _initializeLocation() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final position = await _service.getCurrentLocation();
      state = state.copyWith(
        currentLocation: position,
        hasLocation: position != null,
      );

      if (position != null) {
        await loadNearbyRestaurants();
      } else {
        await loadRestaurants();
      }
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to get location: \$e',
        isLoading: false,
      );
      // Still try to load restaurants without location
      await loadRestaurants();
    }
  }

  /// Load nearby restaurants based on current location
  Future<void> loadNearbyRestaurants({
    double radiusKm = 10.0,
    bool reset = false,
  }) async {
    if (state.isLoading && !reset) return;

    final page = reset ? 1 : state.currentPage;

    if (reset) {
      state = state.copyWith(
        isLoading: true,
        error: null,
        restaurants: [],
        currentPage: 1,
        hasMoreData: true,
      );
    } else {
      state = state.copyWith(isLoading: true, error: null);
    }

    try {
      final restaurants = await _service.getNearbyRestaurants(
        latitude: state.currentLocation?.latitude,
        longitude: state.currentLocation?.longitude,
        radiusKm: radiusKm,
        page: page,
        limit: 20,
      );

      final updatedRestaurants = reset
          ? restaurants
          : [...state.restaurants, ...restaurants];

      state = state.copyWith(
        restaurants: updatedRestaurants,
        isLoading: false,
        hasMoreData: restaurants.length >= 20,
        currentPage: page + 1,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  /// Load restaurants without location filter
  Future<void> loadRestaurants({bool reset = false}) async {
    if (state.isLoading && !reset) return;

    final page = reset ? 1 : state.currentPage;

    if (reset) {
      state = state.copyWith(
        isLoading: true,
        error: null,
        restaurants: [],
        currentPage: 1,
        hasMoreData: true,
      );
    } else {
      state = state.copyWith(isLoading: true, error: null);
    }

    try {
      final restaurants = await _service.getNearbyRestaurants(
        page: page,
        limit: 20,
      );

      final updatedRestaurants = reset
          ? restaurants
          : [...state.restaurants, ...restaurants];

      state = state.copyWith(
        restaurants: updatedRestaurants,
        isLoading: false,
        hasMoreData: restaurants.length >= 20,
        currentPage: page + 1,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  /// Search restaurants by query
  Future<void> searchRestaurants(String query) async {
    if (query.trim().isEmpty) {
      await loadNearbyRestaurants(reset: true);
      return;
    }

    state = state.copyWith(
      isLoading: true,
      error: null,
      restaurants: [],
      currentPage: 1,
      hasMoreData: true,
    );

    try {
      final restaurants = await _service.searchRestaurants(
        query: query,
        latitude: state.currentLocation?.latitude,
        longitude: state.currentLocation?.longitude,
        page: 1,
        limit: 20,
      );

      state = state.copyWith(
        restaurants: restaurants,
        isLoading: false,
        hasMoreData: restaurants.length >= 20,
        currentPage: 2,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  /// Load more restaurants (pagination)
  Future<void> loadMore() async {
    if (!state.hasMoreData || state.isLoading) return;

    await loadNearbyRestaurants();
  }

  /// Refresh restaurants
  Future<void> refresh() async {
    await loadNearbyRestaurants(reset: true);
  }

  /// Request location permission and refresh
  Future<void> requestLocationAndRefresh() async {
    await _initializeLocation();
  }

  /// Calculate distance to restaurant
  String getDistanceText(Restaurant restaurant) {
    if (state.currentLocation == null ||
        restaurant.latitude == null ||
        restaurant.longitude == null) {
      return '';
    }

    final distance = _service.calculateDistance(
      startLatitude: state.currentLocation!.latitude,
      startLongitude: state.currentLocation!.longitude,
      endLatitude: restaurant.latitude!,
      endLongitude: restaurant.longitude!,
    );

    if (distance < 1.0) {
      return '\${(distance * 1000).round()}m';
    } else {
      return '\${distance.toStringAsFixed(1)}km';
    }
  }
}

/// Provider for guest restaurant discovery
final guestRestaurantProvider = StateNotifierProvider<GuestRestaurantNotifier, GuestRestaurantState>((ref) {
  final service = ref.watch(guestRestaurantServiceProvider);
  return GuestRestaurantNotifier(service);
});

/// Provider for restaurant details
final guestRestaurantDetailsProvider = FutureProvider.family<Restaurant, String>((ref, restaurantId) async {
  final service = ref.watch(guestRestaurantServiceProvider);
  return service.getRestaurantDetails(restaurantId);
});

/// Provider for restaurant menu
final guestRestaurantMenuProvider = FutureProvider.family<List<MenuItem>, String>((ref, restaurantId) async {
  final service = ref.watch(guestRestaurantServiceProvider);
  return service.getRestaurantMenu(restaurantId);
});