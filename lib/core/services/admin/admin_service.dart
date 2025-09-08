import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api/api_client.dart';
import '../../constants/api_constants.dart';
import '../../../features/auth/domain/user.dart';
import '../../../features/restaurants/domain/models/restaurant.dart';
import '../../../features/orders/domain/models/order.dart';

/// Admin service for administrative operations
/// Only accessible to users with admin role
class AdminService {
  static final AdminService _instance = AdminService._internal();
  factory AdminService() => _instance;
  
  final ApiClient _apiClient = ApiClient();
  
  AdminService._internal();
  
  /// Get admin dashboard stats
  Future<AdminDashboardResponse> getDashboardStats() async {
    try {
      final response = await _apiClient.get('${ApiConstants.adminDashboard}/stats');
      
      if (response.statusCode == 200) {
        final stats = AdminDashboardStats.fromJson(response.data);
        return AdminDashboardResponse(
          stats: stats,
          success: true,
        );
      } else {
        return AdminDashboardResponse(
          success: false,
          error: response.data['message'] ?? 'Failed to load dashboard stats',
        );
      }
    } catch (e) {
      return AdminDashboardResponse(
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Get all users with pagination and filtering
  Future<AdminUserListResponse> getUsers({
    String? role,
    String? status,
    String? search,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.adminUsers,
        queryParameters: {
          if (role != null) 'role': role,
          if (status != null) 'status': status,
          if (search != null) 'search': search,
          'page': page.toString(),
          'limit': limit.toString(),
        },
      );
      
      if (response.statusCode == 200) {
        final data = response.data;
        final users = (data['users'] as List)
            .map((json) => User.fromJson(json))
            .toList();
        
        return AdminUserListResponse(
          users: users,
          pagination: AdminPaginationInfo.fromJson(data['pagination']),
          success: true,
        );
      } else {
        return AdminUserListResponse(
          users: [],
          pagination: AdminPaginationInfo.empty(),
          success: false,
          error: response.data['message'] ?? 'Failed to load users',
        );
      }
    } catch (e) {
      return AdminUserListResponse(
        users: [],
        pagination: AdminPaginationInfo.empty(),
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Toggle user status (activate/deactivate)
  Future<bool> toggleUserStatus(String userId, String status) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.adminUsers}/$userId/status',
        data: {'status': status},
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Get all restaurants for admin management
  Future<AdminRestaurantListResponse> getRestaurants({
    String? status,
    String? city,
    String? search,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.adminRestaurants,
        queryParameters: {
          if (status != null) 'status': status,
          if (city != null) 'city': city,
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
        
        return AdminRestaurantListResponse(
          restaurants: restaurants,
          pagination: AdminPaginationInfo.fromJson(data['pagination']),
          success: true,
        );
      } else {
        return AdminRestaurantListResponse(
          restaurants: [],
          pagination: AdminPaginationInfo.empty(),
          success: false,
          error: response.data['message'] ?? 'Failed to load restaurants',
        );
      }
    } catch (e) {
      return AdminRestaurantListResponse(
        restaurants: [],
        pagination: AdminPaginationInfo.empty(),
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Validate/approve restaurant
  Future<bool> validateRestaurant(String restaurantId, bool approve, String? message) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.adminRestaurants}/$restaurantId/validate',
        data: {
          'approved': approve,
          if (message != null) 'message': message,
        },
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Set restaurant commission rate
  Future<bool> setRestaurantCommission(String restaurantId, double commissionRate) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.adminRestaurants}/$restaurantId/commission',
        data: {'commissionRate': commissionRate},
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Get all orders for admin oversight
  Future<AdminOrderListResponse> getAllOrders({
    String? status,
    String? restaurantId,
    String? customerId,
    DateTime? fromDate,
    DateTime? toDate,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.adminOrders,
        queryParameters: {
          if (status != null) 'status': status,
          if (restaurantId != null) 'restaurant': restaurantId,
          if (customerId != null) 'client': customerId,
          if (fromDate != null) 'fromDate': fromDate.toIso8601String(),
          if (toDate != null) 'toDate': toDate.toIso8601String(),
          'page': page.toString(),
          'limit': limit.toString(),
        },
      );
      
      if (response.statusCode == 200) {
        final data = response.data;
        final orders = (data['orders'] as List)
            .map((json) => Order.fromJson(json))
            .toList();
        
        return AdminOrderListResponse(
          orders: orders,
          pagination: AdminPaginationInfo.fromJson(data['pagination']),
          success: true,
        );
      } else {
        return AdminOrderListResponse(
          orders: [],
          pagination: AdminPaginationInfo.empty(),
          success: false,
          error: response.data['message'] ?? 'Failed to load orders',
        );
      }
    } catch (e) {
      return AdminOrderListResponse(
        orders: [],
        pagination: AdminPaginationInfo.empty(),
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Cancel order with admin privileges
  Future<bool> cancelOrder(String orderId, String reason, bool refund) async {
    try {
      final response = await _apiClient.post(
        '${ApiConstants.adminOrders}/$orderId/cancel',
        data: {
          'reason': reason,
          'refund': refund,
        },
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Reassign order to different driver
  Future<bool> reassignOrder(String orderId, String driverId, String reason) async {
    try {
      final response = await _apiClient.post(
        '${ApiConstants.adminOrders}/$orderId/reassign',
        data: {
          'driverId': driverId,
          'reason': reason,
        },
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  /// Get live deliveries for monitoring
  Future<AdminLiveDeliveriesResponse> getLiveDeliveries() async {
    try {
      final response = await _apiClient.get('${ApiConstants.adminDashboard}/deliveries/live');
      
      if (response.statusCode == 200) {
        final data = response.data;
        final deliveries = (data['deliveries'] as List)
            .map((json) => LiveDelivery.fromJson(json))
            .toList();
        
        return AdminLiveDeliveriesResponse(
          deliveries: deliveries,
          success: true,
        );
      } else {
        return AdminLiveDeliveriesResponse(
          deliveries: [],
          success: false,
          error: response.data['message'] ?? 'Failed to load live deliveries',
        );
      }
    } catch (e) {
      return AdminLiveDeliveriesResponse(
        deliveries: [],
        success: false,
        error: _handleError(e),
      );
    }
  }
  
  /// Get financial report
  Future<AdminFinancialReportResponse> getFinancialReport({
    DateTime? fromDate,
    DateTime? toDate,
    String? period, // daily, weekly, monthly
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.adminDashboard}/reports/financial',
        queryParameters: {
          if (fromDate != null) 'fromDate': fromDate.toIso8601String(),
          if (toDate != null) 'toDate': toDate.toIso8601String(),
          if (period != null) 'period': period,
        },
      );
      
      if (response.statusCode == 200) {
        final report = AdminFinancialReport.fromJson(response.data);
        return AdminFinancialReportResponse(
          report: report,
          success: true,
        );
      } else {
        return AdminFinancialReportResponse(
          success: false,
          error: response.data['message'] ?? 'Failed to load financial report',
        );
      }
    } catch (e) {
      return AdminFinancialReportResponse(
        success: false,
        error: _handleError(e),
      );
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

// Admin response models and data classes

class AdminDashboardResponse {
  final AdminDashboardStats? stats;
  final bool success;
  final String? error;
  
  AdminDashboardResponse({
    this.stats,
    required this.success,
    this.error,
  });
}

class AdminUserListResponse {
  final List<User> users;
  final AdminPaginationInfo pagination;
  final bool success;
  final String? error;
  
  AdminUserListResponse({
    required this.users,
    required this.pagination,
    required this.success,
    this.error,
  });
}

class AdminRestaurantListResponse {
  final List<Restaurant> restaurants;
  final AdminPaginationInfo pagination;
  final bool success;
  final String? error;
  
  AdminRestaurantListResponse({
    required this.restaurants,
    required this.pagination,
    required this.success,
    this.error,
  });
}

class AdminOrderListResponse {
  final List<Order> orders;
  final AdminPaginationInfo pagination;
  final bool success;
  final String? error;
  
  AdminOrderListResponse({
    required this.orders,
    required this.pagination,
    required this.success,
    this.error,
  });
}

class AdminLiveDeliveriesResponse {
  final List<LiveDelivery> deliveries;
  final bool success;
  final String? error;
  
  AdminLiveDeliveriesResponse({
    required this.deliveries,
    required this.success,
    this.error,
  });
}

class AdminFinancialReportResponse {
  final AdminFinancialReport? report;
  final bool success;
  final String? error;
  
  AdminFinancialReportResponse({
    this.report,
    required this.success,
    this.error,
  });
}

// Data models

class AdminDashboardStats {
  final int totalUsers;
  final int totalRestaurants;
  final int totalOrders;
  final double totalRevenue;
  final int activeDeliveries;
  final int pendingRestaurants;
  
  AdminDashboardStats({
    required this.totalUsers,
    required this.totalRestaurants,
    required this.totalOrders,
    required this.totalRevenue,
    required this.activeDeliveries,
    required this.pendingRestaurants,
  });
  
  factory AdminDashboardStats.fromJson(Map<String, dynamic> json) {
    return AdminDashboardStats(
      totalUsers: json['totalUsers'] ?? 0,
      totalRestaurants: json['totalRestaurants'] ?? 0,
      totalOrders: json['totalOrders'] ?? 0,
      totalRevenue: (json['totalRevenue'] ?? 0).toDouble(),
      activeDeliveries: json['activeDeliveries'] ?? 0,
      pendingRestaurants: json['pendingRestaurants'] ?? 0,
    );
  }
}

class LiveDelivery {
  final String orderId;
  final String restaurantName;
  final String customerName;
  final String driverName;
  final String status;
  final double? driverLat;
  final double? driverLng;
  final String estimatedDeliveryTime;
  
  LiveDelivery({
    required this.orderId,
    required this.restaurantName,
    required this.customerName,
    required this.driverName,
    required this.status,
    this.driverLat,
    this.driverLng,
    required this.estimatedDeliveryTime,
  });
  
  factory LiveDelivery.fromJson(Map<String, dynamic> json) {
    return LiveDelivery(
      orderId: json['orderId'] as String,
      restaurantName: json['restaurantName'] as String,
      customerName: json['customerName'] as String,
      driverName: json['driverName'] as String,
      status: json['status'] as String,
      driverLat: json['driverLocation']?['lat']?.toDouble(),
      driverLng: json['driverLocation']?['lng']?.toDouble(),
      estimatedDeliveryTime: json['estimatedDeliveryTime'] as String,
    );
  }
}

class AdminFinancialReport {
  final double totalRevenue;
  final double platformFees;
  final double restaurantPayouts;
  final double driverPayouts;
  final int totalOrders;
  final double averageOrderValue;
  
  AdminFinancialReport({
    required this.totalRevenue,
    required this.platformFees,
    required this.restaurantPayouts,
    required this.driverPayouts,
    required this.totalOrders,
    required this.averageOrderValue,
  });
  
  factory AdminFinancialReport.fromJson(Map<String, dynamic> json) {
    return AdminFinancialReport(
      totalRevenue: (json['totalRevenue'] ?? 0).toDouble(),
      platformFees: (json['platformFees'] ?? 0).toDouble(),
      restaurantPayouts: (json['restaurantPayouts'] ?? 0).toDouble(),
      driverPayouts: (json['driverPayouts'] ?? 0).toDouble(),
      totalOrders: json['totalOrders'] ?? 0,
      averageOrderValue: (json['averageOrderValue'] ?? 0).toDouble(),
    );
  }
}

class AdminPaginationInfo {
  final int total;
  final int page;
  final int limit;
  final int totalPages;
  
  AdminPaginationInfo({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });
  
  factory AdminPaginationInfo.fromJson(Map<String, dynamic> json) {
    return AdminPaginationInfo(
      total: json['total'] ?? 0,
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 20,
      totalPages: json['totalPages'] ?? 0,
    );
  }
  
  factory AdminPaginationInfo.empty() {
    return AdminPaginationInfo(
      total: 0,
      page: 1,
      limit: 20,
      totalPages: 0,
    );
  }
}

// Provider for admin service
final adminServiceProvider = Provider<AdminService>((ref) => AdminService());
