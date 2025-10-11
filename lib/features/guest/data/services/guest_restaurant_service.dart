import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/services/api/api_client.dart';
import '../../../restaurants/data/models/restaurant_model.dart';

/// Guest restaurant service for discovering restaurants without authentication
/// Handles location-based search and public restaurant endpoints
class GuestRestaurantService {
  final ApiClient _apiClient;

  GuestRestaurantService(this._apiClient);

  /// Get nearby restaurants based on guest location
  Future<List<Restaurant>> getNearbyRestaurants({
    double? latitude,
    double? longitude,
    double radiusKm = 10.0,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
        'radius': radiusKm,
      };

      // Add location if provided
      if (latitude != null && longitude != null) {
        queryParams['lat'] = latitude;
        queryParams['lng'] = longitude;
      }

      final response = await _apiClient.get(
        ApiConstants.guestRestaurants,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final restaurants = (data['restaurants'] as List<dynamic>? ?? [])
            .map((json) => Restaurant.fromJson(json as Map<String, dynamic>))
            .toList();

        return restaurants;
      } else {
        throw Exception('Failed to fetch restaurants: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  /// Search restaurants by name or cuisine
  Future<List<Restaurant>> searchRestaurants({
    required String query,
    double? latitude,
    double? longitude,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'q': query,
        'page': page,
        'limit': limit,
      };

      // Add location for distance calculation if available
      if (latitude != null && longitude != null) {
        queryParams['lat'] = latitude;
        queryParams['lng'] = longitude;
      }

      final response = await _apiClient.get(
        ApiConstants.guestRestaurants,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final restaurants = (data['restaurants'] as List<dynamic>? ?? [])
            .map((json) => Restaurant.fromJson(json as Map<String, dynamic>))
            .toList();

        return restaurants;
      } else {
        throw Exception('Failed to search restaurants: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  /// Get restaurant details and menu (public access)
  Future<Restaurant> getRestaurantDetails(String restaurantId) async {
    try {
      final endpoint = ApiConstants.replacePathParams(
        ApiConstants.restaurantDetails,
        {'id': restaurantId},
      );

      final response = await _apiClient.get(endpoint);

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return Restaurant.fromJson(data['restaurant'] as Map<String, dynamic>);
      } else {
        throw Exception('Failed to fetch restaurant details: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  /// Get restaurant menu (public access)
  Future<List<MenuItem>> getRestaurantMenu(String restaurantId) async {
    try {
      final endpoint = ApiConstants.replacePathParams(
        ApiConstants.restaurantMenu,
        {'id': restaurantId},
      );

      final response = await _apiClient.get(endpoint);

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final menu = (data['menu'] as List<dynamic>? ?? [])
            .map((json) => MenuItem.fromJson(json as Map<String, dynamic>))
            .toList();

        return menu;
      } else {
        throw Exception('Failed to fetch restaurant menu: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  /// Get current device location
  Future<Position?> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled');
      }

      // Check location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permissions are permanently denied');
      }

      // Get current position
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      throw Exception('Failed to get location: $e');
    }
  }

  /// Calculate distance between two points in kilometers
  double calculateDistance({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) {
    return Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    ) / 1000.0; // Convert meters to kilometers
  }
}


/// Menu item model for restaurant menus
class MenuItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final List<String> images;
  final bool available;
  final Map<String, dynamic>? options;

  const MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    this.images = const [],
    this.available = true,
    this.options,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String? ?? 'general',
      images: (json['images'] as List<dynamic>?)?.cast<String>() ?? [],
      available: json['available'] as bool? ?? true,
      options: json['options'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'category': category,
      'images': images,
      'available': available,
      'options': options,
    };
  }
}