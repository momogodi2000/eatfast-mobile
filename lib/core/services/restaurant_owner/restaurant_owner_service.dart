import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api/api_client.dart';
import '../../constants/api_constants.dart';
import '../../../features/restaurants/domain/models/restaurant.dart';
import '../../../features/restaurants/domain/models/menu_item.dart';

/// Restaurant Owner service for restaurant management operations
class RestaurantOwnerService {
  static final RestaurantOwnerService _instance = RestaurantOwnerService._internal();
  factory RestaurantOwnerService() => _instance;
  
  final ApiClient _apiClient = ApiClient();
  
  RestaurantOwnerService._internal();
  
  /// Get restaurant profile/details
  Future<RestaurantOwnerProfileResponse> getRestaurantProfile() async {
    try {
      final response = await _apiClient.get(ApiConstants.restaurantOwnerProfile);
      
      if (response.statusCode == 200) {
        final restaurant = Restaurant.fromJson(response.data['restaurant']);
        return RestaurantOwnerProfileResponse(
          restaurant: restaurant,
          success: true,
        );
      } else {
        return RestaurantOwnerProfileResponse(
          success: false,
          error: response.data['message'] ?? 'Failed to load restaurant profile',
        );
      }
    } catch (e) {
      return RestaurantOwnerProfileResponse(
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Update restaurant profile
  Future<bool> updateRestaurantProfile(RestaurantUpdateRequest request) async {
    try {
      final response = await _apiClient.put(
        ApiConstants.restaurantOwnerProfile,
        data: request.toJson(),
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Get restaurant menu items
  Future<RestaurantMenuResponse> getMenus() async {
    try {
      final response = await _apiClient.get(ApiConstants.restaurantOwnerMenu);
      
      if (response.statusCode == 200) {
        final data = response.data;
        final menuItems = (data['menus'] as List)
            .map((json) => MenuItem.fromJson(json))
            .toList();
        
        return RestaurantMenuResponse(
          menuItems: menuItems,
          success: true,
        );
      } else {
        return RestaurantMenuResponse(
          menuItems: [],
          success: false,
          error: response.data['message'] ?? 'Failed to load menu',
        );
      }
    } catch (e) {
      return RestaurantMenuResponse(
        menuItems: [],
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Create new menu item
  Future<bool> createMenuItem(MenuItemCreateRequest request) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.restaurantOwnerMenu,
        data: request.toJson(),
      );
      
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }
  
  /// Update menu item
  Future<bool> updateMenuItem(String menuId, MenuItemUpdateRequest request) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.restaurantOwnerMenu}/$menuId',
        data: request.toJson(),
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Delete menu item
  Future<bool> deleteMenuItem(String menuId) async {
    try {
      final response = await _apiClient.delete('${ApiConstants.restaurantOwnerMenu}/$menuId');
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Update menu item stock/availability in bulk
  Future<bool> updateBulkStock(List<MenuStockUpdate> updates) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.restaurantOwnerMenu}/stock/bulk',
        data: {
          'updates': updates.map((update) => update.toJson()).toList(),
        },
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Get current orders for restaurant
  Future<RestaurantOrdersResponse> getCurrentOrders({
    String? status,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.restaurantOwnerOrders}/current',
        queryParameters: {
          if (status != null) 'status': status,
          'page': page.toString(),
          'limit': limit.toString(),
        },
      );
      
      if (response.statusCode == 200) {
        final data = response.data;
        final orders = (data['orders'] as List)
            .map((json) => RestaurantOrder.fromJson(json))
            .toList();
        
        return RestaurantOrdersResponse(
          orders: orders,
          pagination: RestaurantPaginationInfo.fromJson(data['pagination']),
          success: true,
        );
      } else {
        return RestaurantOrdersResponse(
          orders: [],
          pagination: RestaurantPaginationInfo.empty(),
          success: false,
          error: response.data['message'] ?? 'Failed to load orders',
        );
      }
    } catch (e) {
      return RestaurantOrdersResponse(
        orders: [],
        pagination: RestaurantPaginationInfo.empty(),
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Update order status (accepted, preparing, ready, etc.)
  Future<bool> updateOrderStatus(String orderId, String status) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.restaurantOwnerOrders}/$orderId/status',
        data: {'status': status},
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Get analytics dashboard
  Future<RestaurantAnalyticsResponse> getAnalyticsDashboard({
    String? period, // daily, weekly, monthly
    DateTime? fromDate,
    DateTime? toDate,
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.restaurantOwnerAnalytics}/dashboard',
        queryParameters: {
          if (period != null) 'period': period,
          if (fromDate != null) 'fromDate': fromDate.toIso8601String(),
          if (toDate != null) 'toDate': toDate.toIso8601String(),
        },
      );
      
      if (response.statusCode == 200) {
        final analytics = RestaurantAnalytics.fromJson(response.data);
        return RestaurantAnalyticsResponse(
          analytics: analytics,
          success: true,
        );
      } else {
        return RestaurantAnalyticsResponse(
          success: false,
          error: response.data['message'] ?? 'Failed to load analytics',
        );
      }
    } catch (e) {
      return RestaurantAnalyticsResponse(
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Get demand forecast
  Future<DemandForecastResponse> getDemandForecast() async {
    try {
      final response = await _apiClient.get('${ApiConstants.restaurantOwnerAnalytics}/forecast');
      
      if (response.statusCode == 200) {
        final forecast = DemandForecast.fromJson(response.data);
        return DemandForecastResponse(
          forecast: forecast,
          success: true,
        );
      } else {
        return DemandForecastResponse(
          success: false,
          error: response.data['message'] ?? 'Failed to load demand forecast',
        );
      }
    } catch (e) {
      return DemandForecastResponse(
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Set restaurant operating hours
  Future<bool> updateOperatingHours(List<OperatingHours> hours) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.restaurantOwnerProfile}/hours',
        data: {
          'operatingHours': hours.map((h) => h.toJson()).toList(),
        },
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Set restaurant availability status
  Future<bool> setRestaurantStatus(bool isOpen) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.restaurantOwnerProfile}/status',
        data: {'isOpen': isOpen},
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  String _handleError(dynamic error) {
    if (error.response != null) {
      final data = error.response.data;
      if (data is Map<String, dynamic> && data.containsKey('message')) {
        return data['message'];
      }
      return 'Server error: ${error.response.statusCode}';
    }
    return 'Network error occurred';
  }
}

// Response models

class RestaurantOwnerProfileResponse {
  final Restaurant? restaurant;
  final bool success;
  final String? error;
  
  RestaurantOwnerProfileResponse({
    this.restaurant,
    required this.success,
    this.error,
  });
}

class RestaurantMenuResponse {
  final List<MenuItem> menuItems;
  final bool success;
  final String? error;
  
  RestaurantMenuResponse({
    required this.menuItems,
    required this.success,
    this.error,
  });
}

class RestaurantOrdersResponse {
  final List<RestaurantOrder> orders;
  final RestaurantPaginationInfo pagination;
  final bool success;
  final String? error;
  
  RestaurantOrdersResponse({
    required this.orders,
    required this.pagination,
    required this.success,
    this.error,
  });
}

class RestaurantAnalyticsResponse {
  final RestaurantAnalytics? analytics;
  final bool success;
  final String? error;
  
  RestaurantAnalyticsResponse({
    this.analytics,
    required this.success,
    this.error,
  });
}

class DemandForecastResponse {
  final DemandForecast? forecast;
  final bool success;
  final String? error;
  
  DemandForecastResponse({
    this.forecast,
    required this.success,
    this.error,
  });
}

// Data models

class RestaurantUpdateRequest {
  final String? name;
  final String? description;
  final String? phone;
  final String? address;
  final List<String>? cuisineTypes;
  final String? logoUrl;
  final String? coverImageUrl;
  
  RestaurantUpdateRequest({
    this.name,
    this.description,
    this.phone,
    this.address,
    this.cuisineTypes,
    this.logoUrl,
    this.coverImageUrl,
  });
  
  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (cuisineTypes != null) 'cuisineTypes': cuisineTypes,
      if (logoUrl != null) 'logoUrl': logoUrl,
      if (coverImageUrl != null) 'coverImageUrl': coverImageUrl,
    };
  }
}

class MenuItemCreateRequest {
  final String name;
  final String description;
  final double price;
  final String category;
  final String? imageUrl;
  final int? preparationTime;
  final List<String>? ingredients;
  final List<String>? allergens;
  final bool isVegetarian;
  final bool isVegan;
  final bool isActive;
  
  MenuItemCreateRequest({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    this.imageUrl,
    this.preparationTime,
    this.ingredients,
    this.allergens,
    this.isVegetarian = false,
    this.isVegan = false,
    this.isActive = true,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'category': category,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (preparationTime != null) 'preparationTime': preparationTime,
      if (ingredients != null) 'ingredients': ingredients,
      if (allergens != null) 'allergens': allergens,
      'isVegetarian': isVegetarian,
      'isVegan': isVegan,
      'isActive': isActive,
    };
  }
}

class MenuItemUpdateRequest {
  final String? name;
  final String? description;
  final double? price;
  final String? category;
  final String? imageUrl;
  final int? preparationTime;
  final List<String>? ingredients;
  final List<String>? allergens;
  final bool? isVegetarian;
  final bool? isVegan;
  final bool? isActive;
  
  MenuItemUpdateRequest({
    this.name,
    this.description,
    this.price,
    this.category,
    this.imageUrl,
    this.preparationTime,
    this.ingredients,
    this.allergens,
    this.isVegetarian,
    this.isVegan,
    this.isActive,
  });
  
  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
      if (category != null) 'category': category,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (preparationTime != null) 'preparationTime': preparationTime,
      if (ingredients != null) 'ingredients': ingredients,
      if (allergens != null) 'allergens': allergens,
      if (isVegetarian != null) 'isVegetarian': isVegetarian,
      if (isVegan != null) 'isVegan': isVegan,
      if (isActive != null) 'isActive': isActive,
    };
  }
}

class MenuStockUpdate {
  final String menuId;
  final bool isAvailable;
  
  MenuStockUpdate({
    required this.menuId,
    required this.isAvailable,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'menuId': menuId,
      'isAvailable': isAvailable,
    };
  }
}

class RestaurantOrder {
  final String orderId;
  final String customerName;
  final String customerPhone;
  final List<RestaurantOrderItem> items;
  final double total;
  final String status;
  final DateTime createdAt;
  final DateTime? scheduledDeliveryTime;
  final String? specialInstructions;
  
  RestaurantOrder({
    required this.orderId,
    required this.customerName,
    required this.customerPhone,
    required this.items,
    required this.total,
    required this.status,
    required this.createdAt,
    this.scheduledDeliveryTime,
    this.specialInstructions,
  });
  
  factory RestaurantOrder.fromJson(Map<String, dynamic> json) {
    return RestaurantOrder(
      orderId: json['orderId'] as String,
      customerName: json['customerName'] as String,
      customerPhone: json['customerPhone'] as String,
      items: (json['items'] as List)
          .map((json) => RestaurantOrderItem.fromJson(json))
          .toList(),
      total: (json['total'] as num).toDouble(),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      scheduledDeliveryTime: json['scheduledDeliveryTime'] != null
          ? DateTime.parse(json['scheduledDeliveryTime'] as String)
          : null,
      specialInstructions: json['specialInstructions'] as String?,
    );
  }
}

class RestaurantOrderItem {
  final String name;
  final int quantity;
  final double price;
  final List<String> customizations;
  
  RestaurantOrderItem({
    required this.name,
    required this.quantity,
    required this.price,
    required this.customizations,
  });
  
  factory RestaurantOrderItem.fromJson(Map<String, dynamic> json) {
    return RestaurantOrderItem(
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
      customizations: List<String>.from(json['customizations'] ?? []),
    );
  }
}

class RestaurantAnalytics {
  final double todayRevenue;
  final double weekRevenue;
  final double monthRevenue;
  final int todayOrders;
  final int weekOrders;
  final int monthOrders;
  final double averageOrderValue;
  final double averageRating;
  final List<TopMenuItem> topMenuItems;
  
  RestaurantAnalytics({
    required this.todayRevenue,
    required this.weekRevenue,
    required this.monthRevenue,
    required this.todayOrders,
    required this.weekOrders,
    required this.monthOrders,
    required this.averageOrderValue,
    required this.averageRating,
    required this.topMenuItems,
  });
  
  factory RestaurantAnalytics.fromJson(Map<String, dynamic> json) {
    return RestaurantAnalytics(
      todayRevenue: (json['todayRevenue'] ?? 0).toDouble(),
      weekRevenue: (json['weekRevenue'] ?? 0).toDouble(),
      monthRevenue: (json['monthRevenue'] ?? 0).toDouble(),
      todayOrders: json['todayOrders'] ?? 0,
      weekOrders: json['weekOrders'] ?? 0,
      monthOrders: json['monthOrders'] ?? 0,
      averageOrderValue: (json['averageOrderValue'] ?? 0).toDouble(),
      averageRating: (json['averageRating'] ?? 0).toDouble(),
      topMenuItems: (json['topMenuItems'] as List? ?? [])
          .map((json) => TopMenuItem.fromJson(json))
          .toList(),
    );
  }
}

class TopMenuItem {
  final String name;
  final int orderCount;
  final double revenue;
  
  TopMenuItem({
    required this.name,
    required this.orderCount,
    required this.revenue,
  });
  
  factory TopMenuItem.fromJson(Map<String, dynamic> json) {
    return TopMenuItem(
      name: json['name'] as String,
      orderCount: json['orderCount'] as int,
      revenue: (json['revenue'] as num).toDouble(),
    );
  }
}

class DemandForecast {
  final List<HourlyForecast> hourlyForecast;
  final List<DailyForecast> weeklyForecast;
  final List<PopularItem> predictedPopularItems;
  
  DemandForecast({
    required this.hourlyForecast,
    required this.weeklyForecast,
    required this.predictedPopularItems,
  });
  
  factory DemandForecast.fromJson(Map<String, dynamic> json) {
    return DemandForecast(
      hourlyForecast: (json['hourlyForecast'] as List? ?? [])
          .map((json) => HourlyForecast.fromJson(json))
          .toList(),
      weeklyForecast: (json['weeklyForecast'] as List? ?? [])
          .map((json) => DailyForecast.fromJson(json))
          .toList(),
      predictedPopularItems: (json['predictedPopularItems'] as List? ?? [])
          .map((json) => PopularItem.fromJson(json))
          .toList(),
    );
  }
}

class HourlyForecast {
  final int hour;
  final int predictedOrders;
  
  HourlyForecast({
    required this.hour,
    required this.predictedOrders,
  });
  
  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    return HourlyForecast(
      hour: json['hour'] as int,
      predictedOrders: json['predictedOrders'] as int,
    );
  }
}

class DailyForecast {
  final String day;
  final int predictedOrders;
  final double predictedRevenue;
  
  DailyForecast({
    required this.day,
    required this.predictedOrders,
    required this.predictedRevenue,
  });
  
  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    return DailyForecast(
      day: json['day'] as String,
      predictedOrders: json['predictedOrders'] as int,
      predictedRevenue: (json['predictedRevenue'] as num).toDouble(),
    );
  }
}

class PopularItem {
  final String itemName;
  final int predictedOrders;
  
  PopularItem({
    required this.itemName,
    required this.predictedOrders,
  });
  
  factory PopularItem.fromJson(Map<String, dynamic> json) {
    return PopularItem(
      itemName: json['itemName'] as String,
      predictedOrders: json['predictedOrders'] as int,
    );
  }
}

class OperatingHours {
  final String day;
  final String openTime;
  final String closeTime;
  final bool isOpen;
  
  OperatingHours({
    required this.day,
    required this.openTime,
    required this.closeTime,
    required this.isOpen,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'openTime': openTime,
      'closeTime': closeTime,
      'isOpen': isOpen,
    };
  }
}

class RestaurantPaginationInfo {
  final int total;
  final int page;
  final int limit;
  final int totalPages;
  
  RestaurantPaginationInfo({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });
  
  factory RestaurantPaginationInfo.fromJson(Map<String, dynamic> json) {
    return RestaurantPaginationInfo(
      total: json['total'] ?? 0,
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 20,
      totalPages: json['totalPages'] ?? 0,
    );
  }
  
  factory RestaurantPaginationInfo.empty() {
    return RestaurantPaginationInfo(
      total: 0,
      page: 1,
      limit: 20,
      totalPages: 0,
    );
  }
}

// Provider for restaurant owner service
final restaurantOwnerServiceProvider = Provider<RestaurantOwnerService>((ref) => RestaurantOwnerService());
