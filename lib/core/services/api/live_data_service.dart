/// Live Data Service
/// Replaces all mock data with real API calls to the backend
/// Centralizes data fetching and caching logic

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../constants/api_constants.dart';
import '../../config/app_config.dart';
import 'api_client.dart';

class LiveDataService {
  static final LiveDataService _instance = LiveDataService._internal();
  factory LiveDataService() => _instance;

  final ApiClient _apiClient = ApiClient();
  late Box _cacheBox;
  bool _isInitialized = false;

  LiveDataService._internal();

  /// Initialize the service and cache
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      await Hive.initFlutter();
      _cacheBox = await Hive.openBox('live_data_cache');
      _isInitialized = true;
      debugPrint('LiveDataService initialized successfully');
    } catch (e) {
      debugPrint('Failed to initialize LiveDataService: $e');
    }
  }

  /// Get restaurants with live data
  Future<List<Map<String, dynamic>>> getRestaurants({
    String? city,
    double? latitude,
    double? longitude,
    bool forceRefresh = false,
  }) async {
    const cacheKey = 'restaurants';

    // Check cache first
    if (!forceRefresh && _hasValidCache(cacheKey)) {
      final cached = _getFromCache(cacheKey);
      if (cached != null) {
        debugPrint('Returning cached restaurants data');
        return List<Map<String, dynamic>>.from(cached);
      }
    }

    try {
      final response = await _apiClient.get(
        ApiConstants.restaurants,
        queryParameters: {
          if (city != null) 'city': city,
          if (latitude != null) 'lat': latitude,
          if (longitude != null) 'lng': longitude,
          'include_menu': false,
          'include_ratings': true,
        },
      );

      if (response.statusCode == 200) {
        final restaurants = List<Map<String, dynamic>>.from(
          response.data['restaurants'] ?? response.data ?? [],
        );

        // Cache the results
        _saveToCache(cacheKey, restaurants);

        debugPrint('Fetched ${restaurants.length} restaurants from API');
        return restaurants;
      } else {
        throw ApiException('Failed to fetch restaurants: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      debugPrint('Network error fetching restaurants: ${e.message}');

      // Return cached data if available, otherwise use fallback
      final cached = _getFromCache(cacheKey);
      if (cached != null) {
        debugPrint('Returning cached restaurants due to network error');
        return List<Map<String, dynamic>>.from(cached);
      }

      // Return empty list if no backend data available
      return [];
    }
  }

  /// Get restaurant details with menu
  Future<Map<String, dynamic>> getRestaurantDetails(
    String restaurantId, {
    bool forceRefresh = false,
  }) async {
    final cacheKey = 'restaurant_$restaurantId';

    // Check cache first
    if (!forceRefresh && _hasValidCache(cacheKey)) {
      final cached = _getFromCache(cacheKey);
      if (cached != null) {
        debugPrint('Returning cached restaurant details');
        return Map<String, dynamic>.from(cached);
      }
    }

    try {
      final detailsUrl = ApiConstants.replacePathParams(
        ApiConstants.restaurantDetails,
        {'id': restaurantId},
      );

      final menuUrl = ApiConstants.replacePathParams(
        ApiConstants.restaurantMenu,
        {'id': restaurantId},
      );

      // Fetch both restaurant details and menu concurrently
      final responses = await Future.wait([
        _apiClient.get(detailsUrl),
        _apiClient.get(menuUrl),
      ]);

      final detailsResponse = responses[0];
      final menuResponse = responses[1];

      if (detailsResponse.statusCode == 200 && menuResponse.statusCode == 200) {
        final restaurant = Map<String, dynamic>.from(detailsResponse.data);
        final menu = List<Map<String, dynamic>>.from(
          menuResponse.data['menu'] ?? menuResponse.data ?? [],
        );

        restaurant['menu'] = menu;

        // Cache the results
        _saveToCache(cacheKey, restaurant);

        debugPrint('Fetched restaurant details and menu for $restaurantId');
        return restaurant;
      } else {
        throw ApiException('Failed to fetch restaurant details');
      }
    } on DioException catch (e) {
      debugPrint('Network error fetching restaurant details: ${e.message}');

      // Return cached data if available
      final cached = _getFromCache(cacheKey);
      if (cached != null) {
        return Map<String, dynamic>.from(cached);
      }

      throw ApiException('Restaurant not available: ${e.message}');
    }
  }

  /// Get user orders
  Future<List<Map<String, dynamic>>> getUserOrders({
    int page = 1,
    int limit = 20,
    String? status,
    bool forceRefresh = false,
  }) async {
    final cacheKey = 'user_orders_${page}_${limit}_${status ?? "all"}';

    // Check cache first
    if (!forceRefresh && _hasValidCache(cacheKey, duration: const Duration(minutes: 5))) {
      final cached = _getFromCache(cacheKey);
      if (cached != null) {
        debugPrint('Returning cached user orders');
        return List<Map<String, dynamic>>.from(cached);
      }
    }

    try {
      final response = await _apiClient.get(
        ApiConstants.orders,
        queryParameters: {
          'page': page,
          'limit': limit,
          if (status != null) 'status': status,
          'include_restaurant': true,
          'include_items': true,
        },
      );

      if (response.statusCode == 200) {
        final orders = List<Map<String, dynamic>>.from(
          response.data['orders'] ?? response.data ?? [],
        );

        // Cache the results
        _saveToCache(cacheKey, orders);

        debugPrint('Fetched ${orders.length} user orders from API');
        return orders;
      } else {
        throw ApiException('Failed to fetch orders: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      debugPrint('Network error fetching orders: ${e.message}');

      // Return cached data if available
      final cached = _getFromCache(cacheKey);
      if (cached != null) {
        return List<Map<String, dynamic>>.from(cached);
      }

      return []; // Return empty list if no cache
    }
  }

  /// Get user profile
  Future<Map<String, dynamic>> getUserProfile({
    bool forceRefresh = false,
  }) async {
    const cacheKey = 'user_profile';

    // Check cache first
    if (!forceRefresh && _hasValidCache(cacheKey)) {
      final cached = _getFromCache(cacheKey);
      if (cached != null) {
        debugPrint('Returning cached user profile');
        return Map<String, dynamic>.from(cached);
      }
    }

    try {
      final response = await _apiClient.get(ApiConstants.authMe);

      if (response.statusCode == 200) {
        final profile = Map<String, dynamic>.from(response.data);

        // Cache the results
        _saveToCache(cacheKey, profile);

        debugPrint('Fetched user profile from API');
        return profile;
      } else {
        throw ApiException('Failed to fetch profile: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      debugPrint('Network error fetching profile: ${e.message}');

      // Return cached data if available
      final cached = _getFromCache(cacheKey);
      if (cached != null) {
        return Map<String, dynamic>.from(cached);
      }

      throw ApiException('Profile not available: ${e.message}');
    }
  }

  /// Get order tracking details
  Future<Map<String, dynamic>> getOrderTracking(
    String orderId, {
    bool forceRefresh = false,
  }) async {
    final cacheKey = 'order_tracking_$orderId';

    // Always check for fresh data for order tracking (short cache)
    if (!forceRefresh && _hasValidCache(cacheKey, duration: const Duration(minutes: 1))) {
      final cached = _getFromCache(cacheKey);
      if (cached != null) {
        debugPrint('Returning cached order tracking');
        return Map<String, dynamic>.from(cached);
      }
    }

    try {
      final trackingUrl = ApiConstants.replacePathParams(
        '${ApiConstants.orderTracking}/$orderId/track',
        {},
      );

      final response = await _apiClient.get(trackingUrl);

      if (response.statusCode == 200) {
        final tracking = Map<String, dynamic>.from(response.data);

        // Cache with short duration for real-time data
        _saveToCache(cacheKey, tracking, duration: const Duration(minutes: 1));

        debugPrint('Fetched order tracking for $orderId');
        return tracking;
      } else {
        throw ApiException('Failed to fetch tracking: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      debugPrint('Network error fetching tracking: ${e.message}');

      // Return cached data if available
      final cached = _getFromCache(cacheKey);
      if (cached != null) {
        return Map<String, dynamic>.from(cached);
      }

      throw ApiException('Tracking not available: ${e.message}');
    }
  }

  /// Get dashboard analytics (for admin/restaurant owner)
  Future<Map<String, dynamic>> getDashboardAnalytics({
    String? period = '7d',
    bool forceRefresh = false,
  }) async {
    final cacheKey = 'dashboard_analytics_$period';

    // Check cache first
    if (!forceRefresh && _hasValidCache(cacheKey, duration: const Duration(hours: 1))) {
      final cached = _getFromCache(cacheKey);
      if (cached != null) {
        debugPrint('Returning cached dashboard analytics');
        return Map<String, dynamic>.from(cached);
      }
    }

    try {
      final response = await _apiClient.get(
        '/analytics/dashboard',
        queryParameters: {
          'period': period,
          'include_charts': true,
        },
      );

      if (response.statusCode == 200) {
        final analytics = Map<String, dynamic>.from(response.data);

        // Cache for 1 hour
        _saveToCache(cacheKey, analytics, duration: const Duration(hours: 1));

        debugPrint('Fetched dashboard analytics from API');
        return analytics;
      } else {
        throw ApiException('Failed to fetch analytics: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      debugPrint('Network error fetching analytics: ${e.message}');

      // Return cached data if available
      final cached = _getFromCache(cacheKey);
      if (cached != null) {
        return Map<String, dynamic>.from(cached);
      }

      // Return empty analytics if no backend data available
      return {
        'totalOrders': 0,
        'totalRevenue': 0,
        'totalCustomers': 0,
        'averageOrderValue': 0,
        'charts': {'ordersByDay': [], 'revenueByDay': []},
        'topRestaurants': [],
        'topMenuItems': [],
      };
    }
  }

  /// Search restaurants and menu items
  Future<Map<String, dynamic>> search({
    required String query,
    String? category,
    String? city,
    double? latitude,
    double? longitude,
    int limit = 20,
  }) async {
    try {
      final response = await _apiClient.get(
        '/search',
        queryParameters: {
          'q': query,
          if (category != null) 'category': category,
          if (city != null) 'city': city,
          if (latitude != null) 'lat': latitude,
          if (longitude != null) 'lng': longitude,
          'limit': limit,
          'include_menu': true,
        },
      );

      if (response.statusCode == 200) {
        debugPrint('Search results fetched for query: $query');
        return Map<String, dynamic>.from(response.data);
      } else {
        throw ApiException('Search failed: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      debugPrint('Network error during search: ${e.message}');
      throw ApiException('Search not available: ${e.message}');
    }
  }

  /// Cache management methods

  bool _hasValidCache(String key, {Duration? duration}) {
    if (!_isInitialized) return false;

    final cacheData = _cacheBox.get(key);
    if (cacheData == null) return false;

    final cacheTime = DateTime.parse(cacheData['timestamp']);
    final validDuration = duration ?? AppConfig.cacheTimeout;

    return DateTime.now().difference(cacheTime) < validDuration;
  }

  void _saveToCache(String key, dynamic data, {Duration? duration}) {
    if (!_isInitialized) return;

    try {
      _cacheBox.put(key, {
        'data': data,
        'timestamp': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      debugPrint('Failed to save to cache: $e');
    }
  }

  dynamic _getFromCache(String key) {
    if (!_isInitialized) return null;

    try {
      final cacheData = _cacheBox.get(key);
      return cacheData?['data'];
    } catch (e) {
      debugPrint('Failed to get from cache: $e');
      return null;
    }
  }

  /// Clear cache methods

  Future<void> clearCache() async {
    if (_isInitialized) {
      await _cacheBox.clear();
      debugPrint('Cache cleared');
    }
  }

  Future<void> clearExpiredCache() async {
    if (!_isInitialized) return;

    final keys = _cacheBox.keys.toList();
    final now = DateTime.now();

    for (final key in keys) {
      final cacheData = _cacheBox.get(key);
      if (cacheData != null) {
        final cacheTime = DateTime.parse(cacheData['timestamp']);
        if (now.difference(cacheTime) > AppConfig.cacheTimeout) {
          await _cacheBox.delete(key);
        }
      }
    }

    debugPrint('Expired cache entries cleared');
  }


  /// Preload data for better UX
  Future<void> preloadData() async {
    if (!_isInitialized) return;

    try {
      // Preload common data
      debugPrint('Preloading common data...');

      final futures = <Future>[
        getRestaurants(),
        // Add other common data preloading here
      ];

      await Future.wait(futures);
      debugPrint('Data preloading completed');
    } catch (e) {
      debugPrint('Data preloading failed: $e');
    }
  }

  /// Get cache size and statistics
  Map<String, dynamic> getCacheStats() {
    if (!_isInitialized) {
      return {'status': 'not_initialized'};
    }

    return {
      'status': 'initialized',
      'totalKeys': _cacheBox.length,
      'keys': _cacheBox.keys.toList(),
    };
  }
}

/// API Exception class
class ApiException implements Exception {
  final String message;
  final String? code;

  const ApiException(this.message, {this.code});

  @override
  String toString() => 'ApiException: $message${code != null ? ' (Code: $code)' : ''}';
}