/// Restaurant Service - Core business logic for restaurant operations
/// Provides unified interface for restaurant data and menu management
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/services/restaurants/domain/models/restaurant.dart';
import 'package:eatfast_mobile/shared/constants/api_constants.dart';
import 'package:eatfast_mobile/shared/services/api/api_client.dart';

class RestaurantService {
  static final RestaurantService _instance = RestaurantService._internal();
  factory RestaurantService() => _instance;

  final ApiClient _apiClient = ApiClient();

  RestaurantService._internal();

  /// Get list of restaurants with optional filtering
  Future<List<Restaurant>> getRestaurants({
    String? category,
    String? searchQuery,
    double? latitude,
    double? longitude,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.restaurants,
        queryParameters: {
          if (category != null) 'category': category,
          if (searchQuery != null) 'search': searchQuery,
          if (latitude != null) 'lat': latitude.toString(),
          if (longitude != null) 'lng': longitude.toString(),
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['restaurants'] ?? [];
        return data.map((json) => Restaurant.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to load restaurants: $e');
    }
  }

  /// Get restaurant details by ID
  Future<Restaurant?> getRestaurantById(String restaurantId) async {
    try {
      final endpoint = ApiConstants.replacePathParams(
        ApiConstants.restaurantDetails,
        {'id': restaurantId},
      );

      final response = await _apiClient.get(endpoint);

      if (response.statusCode == 200) {
        return Restaurant.fromJson(response.data);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to load restaurant details: $e');
    }
  }

  /// Get menu categories for a restaurant
  Future<List<MenuCategory>> getMenuCategories(String restaurantId) async {
    try {
      final endpoint = ApiConstants.replacePathParams(
        ApiConstants.restaurantMenu,
        {'id': restaurantId},
      );

      final response = await _apiClient.get(endpoint);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['categories'] ?? [];
        return data.map((json) => MenuCategory.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to load menu categories: $e');
    }
  }

  /// Get featured restaurants
  Future<List<Restaurant>> getFeaturedRestaurants() async {
    try {
      final response = await _apiClient.get(
        ApiConstants.restaurants,
        queryParameters: {'featured': 'true'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['restaurants'] ?? [];
        return data.map((json) => Restaurant.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to load featured restaurants: $e');
    }
  }
}

/// Menu Category Model
class MenuCategory {
  final String id;
  final String name;
  final String? description;
  final List<MenuItem> items;
  final int sortOrder;
  final bool isActive;

  const MenuCategory({
    required this.id,
    required this.name,
    this.description,
    this.items = const [],
    this.sortOrder = 0,
    this.isActive = true,
  });

  factory MenuCategory.fromJson(Map<String, dynamic> json) {
    return MenuCategory(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'],
      items: (json['items'] as List<dynamic>?)
          ?.map((item) => MenuItem.fromJson(item))
          .toList() ?? [],
      sortOrder: json['sortOrder'] ?? 0,
      isActive: json['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'items': items.map((item) => item.toJson()).toList(),
      'sortOrder': sortOrder,
      'isActive': isActive,
    };
  }
}

/// Menu Item Model
class MenuItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String? imageUrl;
  final bool isAvailable;
  final List<String> allergens;
  final Map<String, dynamic>? nutritionalInfo;

  const MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
    this.isAvailable = true,
    this.allergens = const [],
    this.nutritionalInfo,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      imageUrl: json['imageUrl'],
      isAvailable: json['isAvailable'] ?? true,
      allergens: List<String>.from(json['allergens'] ?? []),
      nutritionalInfo: json['nutritionalInfo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isAvailable': isAvailable,
      'allergens': allergens,
      'nutritionalInfo': nutritionalInfo,
    };
  }
}

/// Restaurant Service Provider
final restaurantServiceProvider = Provider<RestaurantService>((ref) {
  return RestaurantService();
});
