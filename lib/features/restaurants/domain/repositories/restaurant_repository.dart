import '../../../../core/result.dart';
import '../models/restaurant.dart';
import '../models/menu_item.dart';

abstract class RestaurantRepository {
  /// Get restaurants with optional filtering and pagination
  Future<Result<List<Restaurant>, String>> getRestaurants({
    int page = 1,
    int limit = 10,
    RestaurantFilter? filter,
  });

  /// Get a specific restaurant by ID
  Future<Result<Restaurant, String>> getRestaurantById(String id);

  /// Get menu categories for a restaurant
  Future<Result<List<MenuCategory>, String>> getMenuCategories(String restaurantId);

  /// Get menu items for a restaurant or category
  Future<Result<List<MenuItem>, String>> getMenuItems(String restaurantId, {String? categoryId});

  /// Search restaurants by query
  Future<Result<List<Restaurant>, String>> searchRestaurants(String query, {RestaurantFilter? filter});

  /// Search menu items by query
  Future<Result<List<MenuItem>, String>> searchMenuItems(String query, {String? restaurantId});

  /// Toggle favorite status for a restaurant
  Future<Result<void, String>> toggleFavoriteRestaurant(String restaurantId);
}