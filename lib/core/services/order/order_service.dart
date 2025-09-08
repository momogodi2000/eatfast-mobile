import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../api/api_client.dart';
import '../../constants/api_constants.dart';
import '../../../features/orders/domain/models/order.dart';

/// Order service for managing orders, tracking, and order history
class OrderService {
  static final OrderService _instance = OrderService._internal();
  factory OrderService() => _instance;
  
  final ApiClient _apiClient = ApiClient();
  
  OrderService._internal();
  
  /// Create new order for authenticated users
  Future<OrderResponse> createOrder(CreateOrderRequest request) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.orders,
        data: request.toJson(),
      );
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        final order = Order.fromJson(response.data['order']);
        return OrderResponse(
          order: order,
          paymentUrl: response.data['paymentUrl'],
          success: true,
        );
      } else {
        return OrderResponse(
          success: false,
          error: response.data['error'] ?? 'Failed to create order',
        );
      }
    } catch (e) {
      return OrderResponse(
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Get user's order history
  Future<OrderListResponse> getOrderHistory({
    OrderStatus? status,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.clientOrders,
        queryParameters: {
          if (status != null) 'status': status.name,
          'page': page.toString(),
          'limit': limit.toString(),
        },
      );
      
      if (response.statusCode == 200) {
        final data = response.data;
        final orders = (data['orders'] as List)
            .map((json) => Order.fromJson(json))
            .toList();
        
        return OrderListResponse(
          orders: orders,
          pagination: OrderPaginationInfo.fromJson(data['pagination']),
          success: true,
        );
      } else {
        return OrderListResponse(
          orders: [],
          pagination: OrderPaginationInfo.empty(),
          success: false,
          error: response.data['error'] ?? 'Failed to load orders',
        );
      }
    } catch (e) {
      return OrderListResponse(
        orders: [],
        pagination: OrderPaginationInfo.empty(),
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Get order details by ID
  Future<OrderDetailsResponse> getOrderDetails(String orderId) async {
    try {
      final response = await _apiClient.get('${ApiConstants.clientOrders}/$orderId');
      
      if (response.statusCode == 200) {
        final order = Order.fromJson(response.data['order']);
        return OrderDetailsResponse(
          order: order,
          success: true,
        );
      } else {
        return OrderDetailsResponse(
          success: false,
          error: response.data['error'] ?? 'Order not found',
        );
      }
    } catch (e) {
      return OrderDetailsResponse(
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Track order real-time
  Future<OrderTrackingResponse> trackOrder(String orderId) async {
    try {
      final response = await _apiClient.get('${ApiConstants.orderTracking}/$orderId/track');
      
      if (response.statusCode == 200) {
        final data = response.data;
        final order = Order.fromJson(data['order']);
        final trackingInfo = OrderTrackingInfo.fromJson(data['tracking']);
        
        return OrderTrackingResponse(
          order: order,
          trackingInfo: trackingInfo,
          success: true,
        );
      } else {
        return OrderTrackingResponse(
          success: false,
          error: response.data['error'] ?? 'Unable to track order',
        );
      }
    } catch (e) {
      return OrderTrackingResponse(
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Cancel order
  Future<bool> cancelOrder(String orderId, String reason) async {
    try {
      final response = await _apiClient.patch(
        '${ApiConstants.clientOrders}/$orderId/cancel',
        data: {'reason': reason},
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Rate order
  Future<bool> rateOrder(String orderId, OrderRatingRequest rating) async {
    try {
      final response = await _apiClient.post(
        '${ApiConstants.clientOrders}/$orderId/rate',
        data: rating.toJson(),
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Reorder (create new order from existing one)
  Future<OrderResponse> reorder(String orderId) async {
    try {
      final response = await _apiClient.post(
        '${ApiConstants.clientOrders}/$orderId/reorder',
      );
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        final order = Order.fromJson(response.data['order']);
        return OrderResponse(
          order: order,
          paymentUrl: response.data['paymentUrl'],
          success: true,
        );
      } else {
        return OrderResponse(
          success: false,
          error: response.data['error'] ?? 'Failed to reorder',
        );
      }
    } catch (e) {
      return OrderResponse(
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Get active orders (orders in progress)
  Future<OrderListResponse> getActiveOrders() async {
    return await getOrderHistory(status: null); // Backend will filter active orders
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

// Request models

class CreateOrderRequest {
  final String restaurantId;
  final List<OrderItemRequest> items;
  final String deliveryAddressId;
  final PaymentMethod paymentMethod;
  final String? specialInstructions;
  final DateTime? scheduledDeliveryTime;
  final String? promoCode;
  
  CreateOrderRequest({
    required this.restaurantId,
    required this.items,
    required this.deliveryAddressId,
    required this.paymentMethod,
    this.specialInstructions,
    this.scheduledDeliveryTime,
    this.promoCode,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'restaurantId': restaurantId,
      'items': items.map((item) => item.toJson()).toList(),
      'deliveryAddressId': deliveryAddressId,
      'paymentMethod': paymentMethod.name,
      if (specialInstructions != null) 'specialInstructions': specialInstructions,
      if (scheduledDeliveryTime != null) 'scheduledDeliveryTime': scheduledDeliveryTime!.toIso8601String(),
      if (promoCode != null) 'promoCode': promoCode,
    };
  }
}

class OrderItemRequest {
  final String menuItemId;
  final int quantity;
  final Map<String, dynamic>? customizations;
  final String? notes;
  
  OrderItemRequest({
    required this.menuItemId,
    required this.quantity,
    this.customizations,
    this.notes,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'menuItemId': menuItemId,
      'quantity': quantity,
      if (customizations != null) 'customizations': customizations,
      if (notes != null) 'notes': notes,
    };
  }
}

class OrderRatingRequest {
  final double restaurantRating;
  final double deliveryRating;
  final String? restaurantReview;
  final String? deliveryReview;
  final List<String>? tags;
  
  OrderRatingRequest({
    required this.restaurantRating,
    required this.deliveryRating,
    this.restaurantReview,
    this.deliveryReview,
    this.tags,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'restaurantRating': restaurantRating,
      'deliveryRating': deliveryRating,
      if (restaurantReview != null) 'restaurantReview': restaurantReview,
      if (deliveryReview != null) 'deliveryReview': deliveryReview,
      if (tags != null) 'tags': tags,
    };
  }
}

// Response models

class OrderResponse {
  final Order? order;
  final String? paymentUrl;
  final bool success;
  final String? error;
  
  OrderResponse({
    this.order,
    this.paymentUrl,
    required this.success,
    this.error,
  });
}

class OrderListResponse {
  final List<Order> orders;
  final OrderPaginationInfo pagination;
  final bool success;
  final String? error;
  
  OrderListResponse({
    required this.orders,
    required this.pagination,
    required this.success,
    this.error,
  });
}

class OrderDetailsResponse {
  final Order? order;
  final bool success;
  final String? error;
  
  OrderDetailsResponse({
    this.order,
    required this.success,
    this.error,
  });
}

class OrderTrackingResponse {
  final Order? order;
  final OrderTrackingInfo? trackingInfo;
  final bool success;
  final String? error;
  
  OrderTrackingResponse({
    this.order,
    this.trackingInfo,
    required this.success,
    this.error,
  });
}

// Additional models

class OrderTrackingInfo {
  final String orderId;
  final OrderStatus currentStatus;
  final List<OrderStatusUpdate> statusHistory;
  final DriverInfo? driver;
  final LocationInfo? currentLocation;
  final DateTime? estimatedDeliveryTime;
  final double? completionPercentage;
  
  OrderTrackingInfo({
    required this.orderId,
    required this.currentStatus,
    required this.statusHistory,
    this.driver,
    this.currentLocation,
    this.estimatedDeliveryTime,
    this.completionPercentage,
  });
  
  factory OrderTrackingInfo.fromJson(Map<String, dynamic> json) {
    return OrderTrackingInfo(
      orderId: json['orderId'],
      currentStatus: OrderStatus.values.firstWhere(
        (status) => status.name == json['currentStatus'],
      ),
      statusHistory: (json['statusHistory'] as List)
          .map((update) => OrderStatusUpdate.fromJson(update))
          .toList(),
      driver: json['driver'] != null ? DriverInfo.fromJson(json['driver']) : null,
      currentLocation: json['currentLocation'] != null 
          ? LocationInfo.fromJson(json['currentLocation']) 
          : null,
      estimatedDeliveryTime: json['estimatedDeliveryTime'] != null 
          ? DateTime.parse(json['estimatedDeliveryTime']) 
          : null,
      completionPercentage: json['completionPercentage']?.toDouble(),
    );
  }
}

class DriverInfo {
  final String id;
  final String name;
  final String phone;
  final double rating;
  final String? photo;
  final String? vehicleInfo;
  
  DriverInfo({
    required this.id,
    required this.name,
    required this.phone,
    required this.rating,
    this.photo,
    this.vehicleInfo,
  });
  
  factory DriverInfo.fromJson(Map<String, dynamic> json) {
    return DriverInfo(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      rating: json['rating']?.toDouble() ?? 0.0,
      photo: json['photo'],
      vehicleInfo: json['vehicleInfo'],
    );
  }
}

class LocationInfo {
  final double latitude;
  final double longitude;
  final DateTime timestamp;
  final String? address;
  
  LocationInfo({
    required this.latitude,
    required this.longitude,
    required this.timestamp,
    this.address,
  });
  
  factory LocationInfo.fromJson(Map<String, dynamic> json) {
    return LocationInfo(
      latitude: json['latitude']?.toDouble() ?? 0.0,
      longitude: json['longitude']?.toDouble() ?? 0.0,
      timestamp: DateTime.parse(json['timestamp']),
      address: json['address'],
    );
  }
}

class OrderPaginationInfo {
  final int total;
  final int page;
  final int limit;
  final int totalPages;
  
  OrderPaginationInfo({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });
  
  factory OrderPaginationInfo.fromJson(Map<String, dynamic> json) {
    return OrderPaginationInfo(
      total: json['total'] ?? 0,
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 20,
      totalPages: json['totalPages'] ?? 0,
    );
  }
  
  factory OrderPaginationInfo.empty() {
    return OrderPaginationInfo(
      total: 0,
      page: 1,
      limit: 20,
      totalPages: 0,
    );
  }
}

// Payment method enum - should match backend
enum PaymentMethod {
  @JsonValue('wallet')
  wallet,
  @JsonValue('campay')
  campay,
  @JsonValue('orange_money')
  orangeMoney,
  @JsonValue('mtn_momo')
  mtnMomo,
  @JsonValue('cash')
  cash,
}

// Provider for order service
final orderServiceProvider = Provider<OrderService>((ref) => OrderService());
