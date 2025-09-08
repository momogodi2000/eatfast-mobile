import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../network/api_client.dart';
import '../../constants/api_constants.dart';
import '../../../features/restaurants/domain/models/restaurant.dart';
import '../../../features/restaurants/domain/models/menu_item.dart';

/// Restaurant service for browsing restaurants and menus
class RestaurantService {
  final ApiClient _apiClient;

  RestaurantService(this._apiClient);
  
  /// Get all restaurants (public endpoint)
  Future<RestaurantListResponse> getRestaurants({
    String? city,
    String? cuisine,
    List<String>? cuisineTypes,
    String? search,
    double? lat,
    double? lng,
    double? minRating,
    double? maxDeliveryFee,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.restaurants,
        queryParameters: {
          if (city != null) 'city': city,
          if (cuisine != null) 'cuisine': cuisine,
          if (cuisineTypes != null && cuisineTypes.isNotEmpty) 'cuisineTypes': cuisineTypes.join(','),
          if (search != null) 'search': search,
          if (lat != null) 'lat': lat.toString(),
          if (lng != null) 'lng': lng.toString(),
          if (minRating != null) 'minRating': minRating.toString(),
          if (maxDeliveryFee != null) 'maxDeliveryFee': maxDeliveryFee.toString(),
          'page': page.toString(),
          'limit': limit.toString(),
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final restaurants = (data['data']['restaurants'] as List)
            .map((json) => Restaurant.fromJson(json))
            .toList();

        return RestaurantListResponse(
          restaurants: restaurants,
          pagination: PaginationInfo.fromJson(data['data']['pagination']),
          success: true,
        );
      } else {
        return RestaurantListResponse(
          restaurants: [],
          pagination: PaginationInfo.empty(),
          success: false,
          error: response.data['error'] ?? 'Failed to load restaurants',
        );
      }
    } on DioException catch (e) {
      return RestaurantListResponse(
        restaurants: [],
        pagination: PaginationInfo.empty(),
        success: false,
        error: _handleDioError(e),
      );
    } catch (e) {
      return RestaurantListResponse(
        restaurants: [],
        pagination: PaginationInfo.empty(),
        success: false,
        error: 'An unexpected error occurred',
      );
    }
  }
  
  /// Get restaurant details by ID
  Future<RestaurantDetailResponse> getRestaurantDetails(String restaurantId) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.restaurantDetails}/$restaurantId',
      );

      if (response.statusCode == 200) {
        final restaurant = Restaurant.fromJson(response.data['data']);
        
        return RestaurantDetailResponse(
          restaurant: restaurant,
          success: true,
        );
      } else {
        return RestaurantDetailResponse(
          success: false,
          error: response.data['error'] ?? 'Restaurant not found',
        );
      }
    } on DioException catch (e) {
      return RestaurantDetailResponse(
        success: false,
        error: _handleDioError(e),
      );
    } catch (e) {
      return RestaurantDetailResponse(
        success: false,
        error: 'An unexpected error occurred',
      );
    }
  }
  
  /// Get restaurant menu categories
  Future<MenuCategoriesResponse> getMenuCategories(String restaurantId) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.restaurantMenu}/$restaurantId/categories',
      );

      if (response.statusCode == 200) {
        final data = response.data['data'];
        final categories = (data['categories'] as List)
            .map((json) => MenuCategory.fromJson(json))
            .toList();

        return MenuCategoriesResponse(
          categories: categories,
          success: true,
        );
      } else {
        return MenuCategoriesResponse(
          categories: [],
          success: false,
          error: response.data['error'] ?? 'Failed to load menu categories',
        );
      }
    } on DioException catch (e) {
      return MenuCategoriesResponse(
        categories: [],
        success: false,
        error: _handleDioError(e),
      );
    } catch (e) {
      return MenuCategoriesResponse(
        categories: [],
        success: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  /// Get restaurant menu
  Future<MenuResponse> getRestaurantMenu(
    String restaurantId, {
    String? category,
    String? search,
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.restaurantMenu}/$restaurantId/menu',
        queryParameters: {
          if (category != null) 'category': category,
          if (search != null) 'search': search,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data['data'];
        final restaurant = Restaurant.fromJson(data['restaurant']);
        final menuItems = (data['menu'] as List)
            .map((json) => MenuItem.fromJson(json))
            .toList();
        final categories = (data['categories'] as List?)
            ?.map((category) => category as String)
            .toList() ?? [];

        return MenuResponse(
          restaurant: restaurant,
          menuItems: menuItems,
          categories: categories,
          success: true,
        );
      } else {
        return MenuResponse(
          menuItems: [],
          categories: [],
          success: false,
          error: response.data['error'] ?? 'Failed to load menu',
        );
      }
    } on DioException catch (e) {
      return MenuResponse(
        menuItems: [],
        categories: [],
        success: false,
        error: _handleDioError(e),
      );
    } catch (e) {
      return MenuResponse(
        menuItems: [],
        categories: [],
        success: false,
        error: 'An unexpected error occurred',
      );
    }
  }
  
  /// Get menu (alias for getRestaurantMenu)
  Future<MenuResponse> getMenu(
    String restaurantId, {
    String? category,
    String? search,
  }) async {
    return getRestaurantMenu(
      restaurantId,
      category: category,
      search: search,
    );
  }
  
  /// Search restaurants
  Future<RestaurantListResponse> searchRestaurants({
    required String query,
    String? city,
    String? cuisine,
    int page = 1,
    int limit = 20,
  }) async {
    return getRestaurants(
      search: query,
      city: city,
      cuisine: cuisine,
      page: page,
      limit: limit,
    );
  }

  /// Get restaurants near location
  Future<RestaurantListResponse> getNearbyRestaurants({
    required double lat,
    required double lng,
    double radius = 10.0,
    int page = 1,
    int limit = 20,
  }) async {
    return getRestaurants(
      lat: lat,
      lng: lng,
      page: page,
      limit: limit,
    );
  }

  /// Get popular restaurants
  Future<RestaurantListResponse> getPopularRestaurants({
    String? city,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.restaurants}/popular',
        queryParameters: {
          if (city != null) 'city': city,
          'page': page.toString(),
          'limit': limit.toString(),
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final restaurants = (data['data']['restaurants'] as List)
            .map((json) => Restaurant.fromJson(json))
            .toList();

        return RestaurantListResponse(
          restaurants: restaurants,
          pagination: PaginationInfo.fromJson(data['data']['pagination']),
          success: true,
        );
      } else {
        return RestaurantListResponse(
          restaurants: [],
          pagination: PaginationInfo.empty(),
          success: false,
          error: response.data['error'] ?? 'Failed to load popular restaurants',
        );
      }
    } on DioException catch (e) {
      return RestaurantListResponse(
        restaurants: [],
        pagination: PaginationInfo.empty(),
        success: false,
        error: _handleDioError(e),
      );
    } catch (e) {
      return RestaurantListResponse(
        restaurants: [],
        pagination: PaginationInfo.empty(),
        success: false,
        error: 'An unexpected error occurred',
      );
    }
  }
  
  String _handleDioError(DioException e) {
    if (e.response?.data != null && e.response?.data['error'] != null) {
      return e.response!.data['error'];
    }
    
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.badResponse:
        return 'Server error. Please try again later.';
      case DioExceptionType.connectionError:
        return 'Network error. Please check your internet connection.';
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }
}

/// Restaurant list response model
class RestaurantListResponse {
  final List<Restaurant> restaurants;
  final PaginationInfo pagination;
  final bool success;
  final String? error;
  
  RestaurantListResponse({
    required this.restaurants,
    required this.pagination,
    required this.success,
    this.error,
  });
}

class RestaurantDetailResponse {
  final Restaurant? restaurant;
  final bool success;
  final String? error;

  RestaurantDetailResponse({
    this.restaurant,
    required this.success,
    this.error,
  });
}

class MenuResponse {
  final Restaurant? restaurant;
  final List<MenuItem> menuItems;
  final List<String> categories;
  final bool success;
  final String? error;

  MenuResponse({
    this.restaurant,
    required this.menuItems,
    required this.categories,
    required this.success,
    this.error,
  });
}

/// Menu categories response model
class MenuCategoriesResponse {
  final List<MenuCategory> categories;
  final bool success;
  final String? error;

  MenuCategoriesResponse({
    required this.categories,
    required this.success,
    this.error,
  });
}

/// Menu category model
class MenuCategory {
  final String id;
  final String name;
  final String? description;
  final String? imageUrl;
  final bool isActive;

  MenuCategory({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    this.isActive = true,
  });

  factory MenuCategory.fromJson(Map<String, dynamic> json) {
    return MenuCategory(
      id: json['id'] ?? json['_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'],
      imageUrl: json['imageUrl'],
      isActive: json['isActive'] ?? true,
    );
  }
}

/// Pagination info model
class PaginationInfo {
  final int total;
  final int page;
  final int limit;
  final int totalPages;
  
  PaginationInfo({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });
  
  factory PaginationInfo.fromJson(Map<String, dynamic> json) {
    return PaginationInfo(
      total: json['total'] ?? 0,
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 20,
      totalPages: json['totalPages'] ?? 0,
    );
  }
  
  factory PaginationInfo.empty() {
    return PaginationInfo(
      total: 0,
      page: 1,
      limit: 20,
      totalPages: 0,
    );
  }
}

// Provider for restaurant service
final restaurantServiceProvider = Provider<RestaurantService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return RestaurantService(apiClient);
});
