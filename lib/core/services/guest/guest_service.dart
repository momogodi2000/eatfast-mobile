import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../api/api_client.dart';
import '../../constants/api_constants.dart';
import '../../../features/restaurants/domain/models/restaurant.dart';
import '../../../features/restaurants/domain/models/menu_item.dart';
import '../../../features/orders/domain/models/order.dart';
import '../../../features/cart/domain/models/cart.dart';

/// Guest service for unauthenticated users
/// Replaces all "visitor" functionality with "guest" as per backend
class GuestService {
  static final GuestService _instance = GuestService._internal();
  factory GuestService() => _instance;
  
  final ApiClient _apiClient = ApiClient();
  final _storage = const FlutterSecureStorage();
  
  GuestService._internal();
  
  String? _guestSessionId;
  
  /// Create guest session
  Future<String?> createGuestSession() async {
    try {
      final response = await _apiClient.post(ApiConstants.guestSession);
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        final sessionId = response.data['sessionId'] as String;
        _guestSessionId = sessionId;
        
        // Store session ID locally
        await _storage.write(key: 'guest_session_id', value: sessionId);
        
        return sessionId;
      }
      
      return null;
    } catch (e) {
      return null;
    }
  }
  
  /// Get current guest session ID
  Future<String?> getGuestSessionId() async {
    if (_guestSessionId != null) return _guestSessionId;
    
    _guestSessionId = await _storage.read(key: 'guest_session_id');
    return _guestSessionId;
  }
  
  /// Browse restaurants as guest
  Future<GuestRestaurantListResponse> browseRestaurants({
    String? city,
    String? cuisine,
    String? search,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.guestRestaurants,
        queryParameters: {
          if (city != null) 'city': city,
          if (cuisine != null) 'cuisine': cuisine,
          if (search != null) 'search': search,
          'page': page.toString(),
          'limit': limit.toString(),
        },
      );
      
      if (response.statusCode == 200) {
        final data = response.data;
        final restaurants = (data['restaurants'] as List)
            .map((json) => Restaurant.fromJson(json))
            .toList();
        
        return GuestRestaurantListResponse(
          restaurants: restaurants,
          pagination: GuestPaginationInfo.fromJson(data['pagination']),
          success: true,
        );
      } else {
        return GuestRestaurantListResponse(
          restaurants: [],
          pagination: GuestPaginationInfo.empty(),
          success: false,
          error: response.data['error'] ?? 'Failed to load restaurants',
        );
      }
    } catch (e) {
      return GuestRestaurantListResponse(
        restaurants: [],
        pagination: GuestPaginationInfo.empty(),
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Browse menu for a restaurant as guest
  Future<GuestMenuResponse> browseMenu(String restaurantId, {
    String? category,
    String? search,
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.guestMenu}/$restaurantId/menu',
        queryParameters: {
          if (category != null) 'category': category,
          if (search != null) 'search': search,
        },
      );
      
      if (response.statusCode == 200) {
        final data = response.data;
        final restaurant = Restaurant.fromJson(data['restaurant']);
        final menuItems = (data['menu'] as List)
            .map((json) => MenuItem.fromJson(json))
            .toList();
        
        return GuestMenuResponse(
          restaurant: restaurant,
          menuItems: menuItems,
          success: true,
        );
      } else {
        return GuestMenuResponse(
          menuItems: [],
          success: false,
          error: response.data['error'] ?? 'Failed to load menu',
        );
      }
    } catch (e) {
      return GuestMenuResponse(
        menuItems: [],
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Add item to guest cart
  Future<bool> addToCart({
    required String menuId,
    required int quantity,
    Map<String, dynamic>? options,
  }) async {
    try {
      final sessionId = await getGuestSessionId();
      
      final response = await _apiClient.post(
        '${ApiConstants.guestCart}/add',
        data: {
          if (sessionId != null) 'sessionId': sessionId,
          'menuId': menuId,
          'quantity': quantity,
          'options': options ?? {},
        },
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Update cart item quantity
  Future<bool> updateCartItem(String itemId, int quantity) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.guestCart}/items/$itemId',
        data: {'quantity': quantity},
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Remove item from cart
  Future<bool> removeFromCart(String itemId) async {
    try {
      final response = await _apiClient.delete(
        '${ApiConstants.guestCart}/items/$itemId',
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Get current guest cart
  Future<GuestCartResponse> getCart() async {
    try {
      final response = await _apiClient.get(ApiConstants.guestCart);
      
      if (response.statusCode == 200) {
        final data = response.data;
        final cartItems = (data['items'] as List)
            .map((json) => CartItem.fromJson(json))
            .toList();
        
        return GuestCartResponse(
          items: cartItems,
          total: (data['total'] as num).toDouble(),
          success: true,
        );
      } else {
        return GuestCartResponse(
          items: [],
          total: 0.0,
          success: false,
          error: response.data['error'] ?? 'Failed to load cart',
        );
      }
    } catch (e) {
      return GuestCartResponse(
        items: [],
        total: 0.0,
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Set guest personal information
  Future<bool> setGuestInfo({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String deliveryAddress,
    required double lat,
    required double lng,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.guestInfo,
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'phone': phone,
          'email': email,
          'deliveryAddress': deliveryAddress,
          'coordinates': {
            'lat': lat,
            'lng': lng,
          },
        },
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Create guest order and proceed to payment
  Future<GuestOrderResponse> createGuestOrder({
    required String paymentMethod,
    String? specialInstructions,
    DateTime? scheduledDeliveryTime,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.guestOrders,
        data: {
          'paymentMethod': paymentMethod,
          if (specialInstructions != null) 'specialInstructions': specialInstructions,
          if (scheduledDeliveryTime != null) 
            'scheduledDeliveryTime': scheduledDeliveryTime.toIso8601String(),
        },
      );
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        final order = Order.fromJson(response.data['order']);
        final paymentUrl = response.data['paymentUrl'] as String?;
        
        return GuestOrderResponse(
          order: order,
          paymentUrl: paymentUrl,
          success: true,
        );
      } else {
        return GuestOrderResponse(
          success: false,
          error: response.data['error'] ?? 'Failed to create order',
        );
      }
    } catch (e) {
      return GuestOrderResponse(
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Track guest order
  Future<GuestOrderTrackingResponse> trackOrder(String orderId) async {
    try {
      final response = await _apiClient.get('${ApiConstants.guestOrders}/$orderId/track');
      
      if (response.statusCode == 200) {
        final order = Order.fromJson(response.data['order']);
        final trackingInfo = response.data['tracking'] as Map<String, dynamic>?;
        
        return GuestOrderTrackingResponse(
          order: order,
          trackingInfo: trackingInfo,
          success: true,
        );
      } else {
        return GuestOrderTrackingResponse(
          success: false,
          error: response.data['error'] ?? 'Order not found',
        );
      }
    } catch (e) {
      return GuestOrderTrackingResponse(
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Clear guest session
  Future<void> clearGuestSession() async {
    _guestSessionId = null;
    await _storage.delete(key: 'guest_session_id');
  }
  
  String _handleError(dynamic error) {
    if (error.response != null) {
      final data = error.response.data;
      if (data is Map<String, dynamic> && data.containsKey('error')) {
        return data['error'];
      }
      return 'Server error: ${error.response.statusCode}';
    }
    return 'Network error occurred';
  }
}

// Response models for guest service

class GuestRestaurantListResponse {
  final List<Restaurant> restaurants;
  final GuestPaginationInfo pagination;
  final bool success;
  final String? error;
  
  GuestRestaurantListResponse({
    required this.restaurants,
    required this.pagination,
    required this.success,
    this.error,
  });
}

class GuestMenuResponse {
  final Restaurant? restaurant;
  final List<MenuItem> menuItems;
  final bool success;
  final String? error;
  
  GuestMenuResponse({
    this.restaurant,
    required this.menuItems,
    required this.success,
    this.error,
  });
}

class GuestCartResponse {
  final List<CartItem> items;
  final double total;
  final bool success;
  final String? error;
  
  GuestCartResponse({
    required this.items,
    required this.total,
    required this.success,
    this.error,
  });
}

class GuestOrderResponse {
  final Order? order;
  final String? paymentUrl;
  final bool success;
  final String? error;
  
  GuestOrderResponse({
    this.order,
    this.paymentUrl,
    required this.success,
    this.error,
  });
}

class GuestOrderTrackingResponse {
  final Order? order;
  final Map<String, dynamic>? trackingInfo;
  final bool success;
  final String? error;
  
  GuestOrderTrackingResponse({
    this.order,
    this.trackingInfo,
    required this.success,
    this.error,
  });
}

class GuestPaginationInfo {
  final int total;
  final int page;
  final int limit;
  final int totalPages;
  
  GuestPaginationInfo({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });
  
  factory GuestPaginationInfo.fromJson(Map<String, dynamic> json) {
    return GuestPaginationInfo(
      total: json['total'] ?? 0,
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 20,
      totalPages: json['totalPages'] ?? 0,
    );
  }
  
  factory GuestPaginationInfo.empty() {
    return GuestPaginationInfo(
      total: 0,
      page: 1,
      limit: 20,
      totalPages: 0,
    );
  }
}

// Provider for guest service
final guestServiceProvider = Provider<GuestService>((ref) => GuestService());
