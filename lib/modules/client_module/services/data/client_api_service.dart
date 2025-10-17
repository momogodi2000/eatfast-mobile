/// Client API Service - Aligned with Backend /api/v1/client/
/// Handles all authenticated client/customer operations
library;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:eatfast_mobile/shared/constants/api_constants.dart';
import 'package:eatfast_mobile/modules/client_module/providers/domain/models/client_models.dart';

class ClientApiService {
  final http.Client _httpClient;
  final FlutterSecureStorage _secureStorage;

  ClientApiService({
    http.Client? httpClient,
    FlutterSecureStorage? secureStorage,
  })  : _httpClient = httpClient ?? http.Client(),
        _secureStorage = secureStorage ?? const FlutterSecureStorage();

  /// Get authenticated client headers
  Future<Map<String, String>> _getHeaders() async {
    final token = await _secureStorage.read(key: 'access_token');
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // =================================================================
  // RESTAURANT & MENU BROWSING
  // =================================================================

  /// Search restaurants (client endpoint)
  Future<Map<String, dynamic>> searchRestaurants({
    String? query,
    String? category,
    double? latitude,
    double? longitude,
    int? radius,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final queryParams = <String, String>{
        if (query != null) 'query': query,
        if (category != null) 'category': category,
        if (latitude != null) 'lat': latitude.toString(),
        if (longitude != null) 'lng': longitude.toString(),
        if (radius != null) 'radius': radius.toString(),
        'page': page.toString(),
        'limit': limit.toString(),
      };

      final uri = Uri.parse('${ApiConstants.baseUrl}/client/restaurants/search')
          .replace(queryParameters: queryParams);

      final response = await _httpClient.get(uri, headers: await _getHeaders());

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to search restaurants: ${response.body}');
      }
    } catch (e) {
      throw Exception('Search restaurants error: $e');
    }
  }

  /// Get restaurant details
  Future<Map<String, dynamic>> getRestaurantDetails(String restaurantId) async {
    try {
      final uri = Uri.parse('${ApiConstants.baseUrl}/client/restaurants/$restaurantId');
      final response = await _httpClient.get(uri, headers: await _getHeaders());

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to get restaurant details: ${response.body}');
      }
    } catch (e) {
      throw Exception('Get restaurant details error: $e');
    }
  }

  // =================================================================
  // ORDER MANAGEMENT
  // =================================================================

  /// Create new order
  Future<Map<String, dynamic>> createOrder({
    required String restaurantId,
    required List<OrderItemRequest> items,
    required String deliveryAddress,
    required Map<String, double> deliveryCoordinates,
    required String paymentMethod,
    String? specialInstructions,
    DateTime? scheduledDeliveryTime,
    bool usePoints = false,
  }) async {
    try {
      final body = {
        'restaurantId': restaurantId,
        'items': items.map((item) => item.toJson()).toList(),
        'deliveryAddress': deliveryAddress,
        'deliveryCoordinates': deliveryCoordinates,
        'paymentMethod': paymentMethod,
        if (specialInstructions != null) 'specialInstructions': specialInstructions,
        if (scheduledDeliveryTime != null)
          'scheduledDeliveryTime': scheduledDeliveryTime.toIso8601String(),
        'usePoints': usePoints,
      };

      final uri = Uri.parse('${ApiConstants.baseUrl}/client/orders');
      final response = await _httpClient.post(
        uri,
        headers: await _getHeaders(),
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to create order: ${response.body}');
      }
    } catch (e) {
      throw Exception('Create order error: $e');
    }
  }

  /// Get user's order history
  Future<Map<String, dynamic>> getOrderHistory({
    int page = 1,
    int limit = 20,
    String? status,
  }) async {
    try {
      final queryParams = <String, String>{
        'page': page.toString(),
        'limit': limit.toString(),
        if (status != null) 'status': status,
      };

      final uri = Uri.parse('${ApiConstants.baseUrl}/client/orders/history')
          .replace(queryParameters: queryParams);

      final response = await _httpClient.get(uri, headers: await _getHeaders());

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to get order history: ${response.body}');
      }
    } catch (e) {
      throw Exception('Get order history error: $e');
    }
  }

  /// Track specific order
  Future<Map<String, dynamic>> trackOrder(String orderId) async {
    try {
      final uri = Uri.parse('${ApiConstants.baseUrl}/client/orders/$orderId/track');
      final response = await _httpClient.get(uri, headers: await _getHeaders());

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to track order: ${response.body}');
      }
    } catch (e) {
      throw Exception('Track order error: $e');
    }
  }

  /// Get order timeline
  Future<Map<String, dynamic>> getOrderTimeline(String orderId) async {
    try {
      final uri = Uri.parse('${ApiConstants.baseUrl}/client/orders/$orderId/timeline');
      final response = await _httpClient.get(uri, headers: await _getHeaders());

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to get order timeline: ${response.body}');
      }
    } catch (e) {
      throw Exception('Get order timeline error: $e');
    }
  }

  /// Cancel order
  Future<Map<String, dynamic>> cancelOrder({
    required String orderId,
    String? reason,
  }) async {
    try {
      final body = {
        if (reason != null) 'reason': reason,
      };

      final uri = Uri.parse('${ApiConstants.baseUrl}/client/orders/$orderId/cancel');
      final response = await _httpClient.post(
        uri,
        headers: await _getHeaders(),
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to cancel order: ${response.body}');
      }
    } catch (e) {
      throw Exception('Cancel order error: $e');
    }
  }

  // =================================================================
  // LOYALTY PROGRAM
  // =================================================================

  /// Get loyalty status
  Future<Map<String, dynamic>> getLoyaltyStatus() async {
    try {
      final uri = Uri.parse('${ApiConstants.baseUrl}/client/loyalty/status');
      final response = await _httpClient.get(uri, headers: await _getHeaders());

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to get loyalty status: ${response.body}');
      }
    } catch (e) {
      throw Exception('Get loyalty status error: $e');
    }
  }

  /// Redeem loyalty points
  Future<Map<String, dynamic>> redeemPoints({
    required int points,
    required String rewardId,
  }) async {
    try {
      final body = {
        'points': points,
        'rewardId': rewardId,
      };

      final uri = Uri.parse('${ApiConstants.baseUrl}/client/loyalty/redeem');
      final response = await _httpClient.post(
        uri,
        headers: await _getHeaders(),
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to redeem points: ${response.body}');
      }
    } catch (e) {
      throw Exception('Redeem points error: $e');
    }
  }

  // =================================================================
  // FAVORITES
  // =================================================================

  /// Toggle favorite restaurant
  Future<Map<String, dynamic>> toggleFavorite(String restaurantId) async {
    try {
      final body = {'restaurantId': restaurantId};

      final uri = Uri.parse('${ApiConstants.baseUrl}/client/favorites/toggle');
      final response = await _httpClient.post(
        uri,
        headers: await _getHeaders(),
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to toggle favorite: ${response.body}');
      }
    } catch (e) {
      throw Exception('Toggle favorite error: $e');
    }
  }

  /// Get favorites list
  Future<Map<String, dynamic>> getFavorites() async {
    try {
      final uri = Uri.parse('${ApiConstants.baseUrl}/client/favorites');
      final response = await _httpClient.get(uri, headers: await _getHeaders());

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to get favorites: ${response.body}');
      }
    } catch (e) {
      throw Exception('Get favorites error: $e');
    }
  }

  // =================================================================
  // RATINGS & REVIEWS
  // =================================================================

  /// Rate an order
  Future<Map<String, dynamic>> rateOrder({
    required String orderId,
    required int restaurantRating,
    int? driverRating,
    String? comment,
    List<String>? photos,
  }) async {
    try {
      final body = {
        'restaurantRating': restaurantRating,
        if (driverRating != null) 'driverRating': driverRating,
        if (comment != null) 'comment': comment,
        if (photos != null) 'photos': photos,
      };

      final uri = Uri.parse('${ApiConstants.baseUrl}/client/orders/$orderId/rate');
      final response = await _httpClient.post(
        uri,
        headers: await _getHeaders(),
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to rate order: ${response.body}');
      }
    } catch (e) {
      throw Exception('Rate order error: $e');
    }
  }

  // =================================================================
  // WALLET
  // =================================================================

  /// Get wallet balance
  Future<Map<String, dynamic>> getWallet() async {
    try {
      final uri = Uri.parse('${ApiConstants.baseUrl}/client/wallet');
      final response = await _httpClient.get(uri, headers: await _getHeaders());

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to get wallet: ${response.body}');
      }
    } catch (e) {
      throw Exception('Get wallet error: $e');
    }
  }

  /// Get wallet transactions
  Future<Map<String, dynamic>> getWalletTransactions({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final queryParams = {
        'page': page.toString(),
        'limit': limit.toString(),
      };

      final uri = Uri.parse('${ApiConstants.baseUrl}/client/wallet/transactions')
          .replace(queryParameters: queryParams);

      final response = await _httpClient.get(uri, headers: await _getHeaders());

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to get wallet transactions: ${response.body}');
      }
    } catch (e) {
      throw Exception('Get wallet transactions error: $e');
    }
  }

  /// Top up wallet
  Future<Map<String, dynamic>> topupWallet({
    required double amount,
    required String description,
    String? reference,
  }) async {
    try {
      final body = {
        'amount': amount,
        'description': description,
        if (reference != null) 'reference': reference,
      };

      final uri = Uri.parse('${ApiConstants.baseUrl}/client/wallet/topup');
      final response = await _httpClient.post(
        uri,
        headers: await _getHeaders(),
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to top up wallet: ${response.body}');
      }
    } catch (e) {
      throw Exception('Top up wallet error: $e');
    }
  }

  /// Withdraw from wallet
  Future<Map<String, dynamic>> withdrawFromWallet({
    required double amount,
    required String description,
    String? reference,
  }) async {
    try {
      final body = {
        'amount': amount,
        'description': description,
        if (reference != null) 'reference': reference,
      };

      final uri = Uri.parse('${ApiConstants.baseUrl}/client/wallet/withdraw');
      final response = await _httpClient.post(
        uri,
        headers: await _getHeaders(),
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to withdraw from wallet: ${response.body}');
      }
    } catch (e) {
      throw Exception('Withdraw from wallet error: $e');
    }
  }

  /// Clean up resources
  void dispose() {
    _httpClient.close();
  }
}

/// Order item request model for creating orders
class OrderItemRequest {
  final String menuId;
  final int quantity;
  final List<String> customizations;

  OrderItemRequest({
    required this.menuId,
    required this.quantity,
    this.customizations = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'menuId': menuId,
      'quantity': quantity,
      'customizations': customizations,
    };
  }
}

