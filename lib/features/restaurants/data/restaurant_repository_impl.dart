import 'dart:async';
import '../../../core/config/app_config.dart';
import '../../../core/result.dart';
import '../../../data/mock/mock_restaurant_data.dart';
import '../domain/models/restaurant.dart';
import '../domain/models/menu_item.dart';
import '../domain/repositories/restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  // Simulate network delay for mock data
  Future<void> _simulateNetworkDelay() async {
    if (AppConfig.useMockAPI) {
      await Future.delayed(AppConfig.mockApiDelay);
    }
  }

  @override
  Future<Result<List<Restaurant>, String>> getRestaurants({
    int page = 1,
    int limit = 10,
    RestaurantFilter? filter,
  }) async {
    try {
      await _simulateNetworkDelay();

      var restaurants = List<Restaurant>.from(MockRestaurantData.restaurants);

      // Apply filters
      if (filter != null) {
        restaurants = _applyFilters(restaurants, filter);
      }

      // Apply sorting
      if (filter?.sortBy != null) {
        restaurants = _applySorting(restaurants, filter!.sortBy, filter.sortOrder);
      }

      // Apply pagination
      final startIndex = (page - 1) * limit;
      final endIndex = startIndex + limit;
      
      if (startIndex >= restaurants.length) {
        return const Result.success([]);
      }

      final paginatedResults = restaurants.sublist(
        startIndex,
        endIndex > restaurants.length ? restaurants.length : endIndex,
      );

      return Result.success(paginatedResults);
    } catch (e) {
      return Result.failure('Erreur lors de la récupération des restaurants: ${e.toString()}');
    }
  }

  @override
  Future<Result<Restaurant, String>> getRestaurantById(String id) async {
    try {
      await _simulateNetworkDelay();

      final restaurant = MockRestaurantData.getRestaurantById(id);
      if (restaurant == null) {
        return const Result.failure('Restaurant non trouvé');
      }

      return Result.success(restaurant);
    } catch (e) {
      return Result.failure('Erreur lors de la récupération du restaurant: ${e.toString()}');
    }
  }

  @override
  Future<Result<List<MenuCategory>, String>> getMenuCategories(String restaurantId) async {
    try {
      await _simulateNetworkDelay();

      final categories = MockRestaurantData.getCategoriesForRestaurant(restaurantId);
      return Result.success(categories);
    } catch (e) {
      return Result.failure('Erreur lors de la récupération des catégories: ${e.toString()}');
    }
  }

  @override
  Future<Result<List<MenuItem>, String>> getMenuItems(String restaurantId, {String? categoryId}) async {
    try {
      await _simulateNetworkDelay();

      List<MenuItem> items;
      if (categoryId != null) {
        items = MockRestaurantData.getMenuItemsForCategory(categoryId);
      } else {
        items = MockRestaurantData.getMenuItemsForRestaurant(restaurantId);
      }

      return Result.success(items);
    } catch (e) {
      return Result.failure('Erreur lors de la récupération des articles du menu: ${e.toString()}');
    }
  }

  @override
  Future<Result<List<Restaurant>, String>> searchRestaurants(String query, {RestaurantFilter? filter}) async {
    try {
      await _simulateNetworkDelay();

      var restaurants = MockRestaurantData.restaurants.where((restaurant) {
        final searchText = query.toLowerCase();
        return restaurant.name.toLowerCase().contains(searchText) ||
               restaurant.description.toLowerCase().contains(searchText) ||
               restaurant.cuisineTypes.any((type) => type.toLowerCase().contains(searchText)) ||
               restaurant.specialties.any((specialty) => specialty.toLowerCase().contains(searchText));
      }).toList();

      // Apply additional filters if provided
      if (filter != null) {
        restaurants = _applyFilters(restaurants, filter);
      }

      return Result.success(restaurants);
    } catch (e) {
      return Result.failure('Erreur lors de la recherche: ${e.toString()}');
    }
  }

  @override
  Future<Result<List<MenuItem>, String>> searchMenuItems(String query, {String? restaurantId}) async {
    try {
      await _simulateNetworkDelay();

      var items = MockRestaurantData.menuItems.where((item) {
        final searchText = query.toLowerCase();
        final matchesQuery = item.name.toLowerCase().contains(searchText) ||
                           item.description.toLowerCase().contains(searchText);
        
        if (restaurantId != null) {
          return matchesQuery && item.restaurantId == restaurantId;
        }
        
        return matchesQuery;
      }).toList();

      return Result.success(items);
    } catch (e) {
      return Result.failure('Erreur lors de la recherche d\'articles: ${e.toString()}');
    }
  }

  @override
  Future<Result<void, String>> toggleFavoriteRestaurant(String restaurantId) async {
    try {
      await _simulateNetworkDelay();

      // In a real app, this would make an API call
      // For now, we'll simulate success
      return const Result.success(null);
    } catch (e) {
      return Result.failure('Erreur lors de la modification des favoris: ${e.toString()}');
    }
  }

  List<Restaurant> _applyFilters(List<Restaurant> restaurants, RestaurantFilter filter) {
    return restaurants.where((restaurant) {
      // Search query filter
      if (filter.searchQuery != null && filter.searchQuery!.isNotEmpty) {
        final searchText = filter.searchQuery!.toLowerCase();
        final matchesSearch = restaurant.name.toLowerCase().contains(searchText) ||
                            restaurant.description.toLowerCase().contains(searchText) ||
                            restaurant.cuisineTypes.any((type) => type.toLowerCase().contains(searchText));
        if (!matchesSearch) return false;
      }

      // Cuisine types filter
      if (filter.cuisineTypes != null && filter.cuisineTypes!.isNotEmpty) {
        final hasMatchingCuisine = filter.cuisineTypes!.any(
          (filterType) => restaurant.cuisineTypes.contains(filterType)
        );
        if (!hasMatchingCuisine) return false;
      }

      // Rating filter
      if (filter.minRating != null && restaurant.rating < filter.minRating!) {
        return false;
      }
      if (filter.maxRating != null && restaurant.rating > filter.maxRating!) {
        return false;
      }

      // Delivery time filter
      if (filter.maxDeliveryTime != null && restaurant.estimatedDeliveryTime > filter.maxDeliveryTime!) {
        return false;
      }

      // Delivery fee filter
      if (filter.maxDeliveryFee != null && restaurant.deliveryFee > filter.maxDeliveryFee!) {
        return false;
      }

      // Price range filter
      if (filter.priceRange != null && restaurant.priceRange != filter.priceRange!) {
        return false;
      }

      // Open status filter
      if (filter.isOpen != null && restaurant.isOpen != filter.isOpen!) {
        return false;
      }

      return true;
    }).toList();
  }

  List<Restaurant> _applySorting(List<Restaurant> restaurants, RestaurantSortBy sortBy, SortOrder sortOrder) {
    restaurants.sort((a, b) {
      int comparison = 0;
      
      switch (sortBy) {
        case RestaurantSortBy.name:
          comparison = a.name.compareTo(b.name);
          break;
        case RestaurantSortBy.rating:
          comparison = a.rating.compareTo(b.rating);
          break;
        case RestaurantSortBy.deliveryTime:
          comparison = a.estimatedDeliveryTime.compareTo(b.estimatedDeliveryTime);
          break;
        case RestaurantSortBy.deliveryFee:
          comparison = a.deliveryFee.compareTo(b.deliveryFee);
          break;
        case RestaurantSortBy.distance:
          // For mock data, we'll use a random sorting
          comparison = a.id.compareTo(b.id);
          break;
      }

      return sortOrder == SortOrder.ascending ? comparison : -comparison;
    });

    return restaurants;
  }
}