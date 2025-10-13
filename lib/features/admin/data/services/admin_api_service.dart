/// Admin API Service
/// Handles all HTTP requests for admin operations using the backend API
library;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/services/api/api_client.dart';
import '../../../../core/constants/api_constants.dart';

class AdminApiService {
  final ApiClient _apiClient;

  AdminApiService({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  // ===================== DASHBOARD & ANALYTICS =====================

  /// Get platform statistics for dashboard
  /// Backend: GET /admin/dashboard/stats
  Future<Map<String, dynamic>> getDashboardStats({
    String timeframe = '24h',
  }) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.adminDashboard}/stats',
        queryParameters: {'timeframe': timeframe},
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Get dashboard stats failed: ${e.message}');
      rethrow;
    }
  }

  /// Get live deliveries for real-time tracking
  /// Backend: GET /admin/dashboard/live-deliveries
  Future<Map<String, dynamic>> getLiveDeliveries() async {
    try {
      final response = await _apiClient.get('${ApiConstants.adminDashboard}/live-deliveries');
      return response.data;
    } on DioException catch (e) {
      debugPrint('Get live deliveries failed: ${e.message}');
      rethrow;
    }
  }

  // ===================== USER MANAGEMENT =====================

  /// Get all users with filters
  /// Backend: GET /admin/users
  Future<Map<String, dynamic>> getUsers({
    int page = 1,
    int limit = 20,
    String? role,
    String? status,
    String? city,
    String? search,
    String sortBy = 'createdAt',
    String sortOrder = 'DESC',
  }) async {
    try {
      final queryParams = {
        'page': page.toString(),
        'limit': limit.toString(),
        'sortBy': sortBy,
        'sortOrder': sortOrder,
      };

      if (role != null) queryParams['role'] = role;
      if (status != null) queryParams['status'] = status;
      if (city != null) queryParams['city'] = city;
      if (search != null) queryParams['search'] = search;

      final response = await _apiClient.get(
        ApiConstants.adminUsers,
        queryParameters: queryParams,
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Get users failed: ${e.message}');
      rethrow;
    }
  }

  /// Get user details by ID
  /// Backend: GET /admin/users/:userId
  Future<Map<String, dynamic>> getUserById(String userId) async {
    try {
      final endpoint = ApiConstants.replacePathParams(
        ApiConstants.adminUserById,
        {'userId': userId},
      );
      final response = await _apiClient.get(endpoint);
      return response.data;
    } on DioException catch (e) {
      debugPrint('Get user by ID failed: ${e.message}');
      rethrow;
    }
  }

  /// Create a new user
  /// Backend: POST /admin/users
  Future<Map<String, dynamic>> createUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String role,
    String? city,
    String? address,
    String status = 'active',
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.adminUsers,
        data: {
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
          'phone': phone,
          'role': role,
          if (city != null) 'city': city,
          if (address != null) 'address': address,
          'status': status,
        },
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Create user failed: ${e.message}');
      rethrow;
    }
  }

  /// Update user details
  /// Backend: PUT /admin/users/:userId
  Future<Map<String, dynamic>> updateUser(
    String userId, {
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    String? role,
    String? city,
    String? status,
    bool? emailVerified,
    bool? phoneVerified,
  }) async {
    try {
      final endpoint = ApiConstants.replacePathParams(
        ApiConstants.adminUserUpdate,
        {'userId': userId},
      );

      final data = <String, dynamic>{};
      if (firstName != null) data['firstName'] = firstName;
      if (lastName != null) data['lastName'] = lastName;
      if (phone != null) data['phone'] = phone;
      if (email != null) data['email'] = email;
      if (role != null) data['role'] = role;
      if (city != null) data['city'] = city;
      if (status != null) data['status'] = status;
      if (emailVerified != null) data['emailVerified'] = emailVerified;
      if (phoneVerified != null) data['phoneVerified'] = phoneVerified;

      final response = await _apiClient.put(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      debugPrint('Update user failed: ${e.message}');
      rethrow;
    }
  }

  /// Update user status (suspend/activate)
  /// Backend: PUT /admin/users/:userId/status
  Future<Map<String, dynamic>> updateUserStatus(
    String userId, {
    required String status,
    String? reason,
  }) async {
    try {
      final endpoint = ApiConstants.replacePathParams(
        ApiConstants.adminUserStatus,
        {'userId': userId},
      );

      final response = await _apiClient.put(
        endpoint,
        data: {
          'status': status,
          if (reason != null) 'reason': reason,
        },
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Update user status failed: ${e.message}');
      rethrow;
    }
  }

  /// Delete user (soft delete)
  /// Backend: DELETE /admin/users/:userId
  Future<Map<String, dynamic>> deleteUser(
    String userId, {
    String? reason,
  }) async {
    try {
      final endpoint = ApiConstants.replacePathParams(
        ApiConstants.adminUserDelete,
        {'userId': userId},
      );

      final response = await _apiClient.delete(
        endpoint,
        data: {
          if (reason != null) 'reason': reason,
        },
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Delete user failed: ${e.message}');
      rethrow;
    }
  }

  /// Reset user password
  /// Backend: POST /admin/users/:userId/reset-password
  Future<Map<String, dynamic>> resetUserPassword(
    String userId, {
    required String newPassword,
    bool sendEmail = true,
  }) async {
    try {
      final endpoint = ApiConstants.replacePathParams(
        ApiConstants.adminUserResetPassword,
        {'userId': userId},
      );

      final response = await _apiClient.post(
        endpoint,
        data: {
          'newPassword': newPassword,
          'sendEmail': sendEmail,
        },
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Reset user password failed: ${e.message}');
      rethrow;
    }
  }

  /// Get user audit log
  /// Backend: GET /admin/users/:userId/audit-log
  Future<Map<String, dynamic>> getUserAuditLog(
    String userId, {
    int page = 1,
    int limit = 50,
    String? eventType,
  }) async {
    try {
      final endpoint = ApiConstants.replacePathParams(
        ApiConstants.adminUserAuditLog,
        {'userId': userId},
      );

      final queryParams = {
        'page': page.toString(),
        'limit': limit.toString(),
      };
      if (eventType != null) queryParams['eventType'] = eventType;

      final response = await _apiClient.get(
        endpoint,
        queryParameters: queryParams,
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Get user audit log failed: ${e.message}');
      rethrow;
    }
  }

  // ===================== RESTAURANT MANAGEMENT =====================

  /// Get all restaurants with filters
  /// Backend: GET /admin/restaurants
  Future<Map<String, dynamic>> getRestaurants({
    int page = 1,
    int limit = 20,
    String? status,
    String? search,
    String? city,
  }) async {
    try {
      final queryParams = {
        'page': page.toString(),
        'limit': limit.toString(),
      };

      if (status != null) queryParams['status'] = status;
      if (search != null) queryParams['search'] = search;
      if (city != null) queryParams['city'] = city;

      final response = await _apiClient.get(
        ApiConstants.adminRestaurants,
        queryParameters: queryParams,
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Get restaurants failed: ${e.message}');
      rethrow;
    }
  }

  /// Validate or reject restaurant
  /// Backend: POST /admin/restaurants/:restaurantId/validate
  Future<Map<String, dynamic>> validateRestaurant(
    String restaurantId, {
    required String status,
    String? reason,
    double? commissionRate,
  }) async {
    try {
      final response = await _apiClient.post(
        '/admin/restaurants/$restaurantId/validate',
        data: {
          'status': status,
          if (reason != null) 'reason': reason,
          if (commissionRate != null) 'commissionRate': commissionRate,
        },
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Validate restaurant failed: ${e.message}');
      rethrow;
    }
  }

  /// Set commission rate for restaurant
  /// Backend: PUT /admin/restaurants/:restaurantId/commission
  Future<Map<String, dynamic>> setCommissionRate(
    String restaurantId, {
    required double commissionRate,
    DateTime? effectiveDate,
    String? reason,
  }) async {
    try {
      final response = await _apiClient.put(
        '/admin/restaurants/$restaurantId/commission',
        data: {
          'commissionRate': commissionRate,
          if (effectiveDate != null)
            'effectiveDate': effectiveDate.toIso8601String(),
          if (reason != null) 'reason': reason,
        },
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Set commission rate failed: ${e.message}');
      rethrow;
    }
  }

  // ===================== ORDER MANAGEMENT =====================

  /// Get all orders with filters
  /// Backend: GET /admin/orders
  Future<Map<String, dynamic>> getOrders({
    int page = 1,
    int limit = 20,
    String? status,
    String? search,
    DateTime? fromDate,
    DateTime? toDate,
  }) async {
    try {
      final queryParams = {
        'page': page.toString(),
        'limit': limit.toString(),
      };

      if (status != null) queryParams['status'] = status;
      if (search != null) queryParams['search'] = search;
      if (fromDate != null) queryParams['fromDate'] = fromDate.toIso8601String();
      if (toDate != null) queryParams['toDate'] = toDate.toIso8601String();

      final response = await _apiClient.get(
        ApiConstants.adminOrders,
        queryParameters: queryParams,
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Get orders failed: ${e.message}');
      rethrow;
    }
  }

  /// Cancel an order
  /// Backend: POST /admin/orders/:orderId/cancel
  Future<Map<String, dynamic>> cancelOrder({
    required String orderId,
    required String reason,
    bool notifyCustomer = true,
  }) async {
    try {
      final response = await _apiClient.post(
        '/admin/orders/$orderId/cancel',
        data: {
          'reason': reason,
          'notifyCustomer': notifyCustomer,
        },
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Cancel order failed: ${e.message}');
      rethrow;
    }
  }

  /// Refund an order
  /// Backend: POST /admin/orders/:orderId/refund
  Future<Map<String, dynamic>> refundOrder({
    required String orderId,
    required double amount,
    required String reason,
    String? refundMethod,
  }) async {
    try {
      final response = await _apiClient.post(
        '/admin/orders/$orderId/refund',
        data: {
          'amount': amount,
          'reason': reason,
          if (refundMethod != null) 'refundMethod': refundMethod,
        },
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Refund order failed: ${e.message}');
      rethrow;
    }
  }

  // ===================== ANALYTICS & REPORTS =====================

  /// Get platform analytics
  /// Backend: GET /admin/analytics
  Future<Map<String, dynamic>> getAnalytics({
    String? period,
    DateTime? fromDate,
    DateTime? toDate,
  }) async {
    try {
      final queryParams = <String, String>{};
      if (period != null) queryParams['period'] = period;
      if (fromDate != null) queryParams['fromDate'] = fromDate.toIso8601String();
      if (toDate != null) queryParams['toDate'] = toDate.toIso8601String();

      final response = await _apiClient.get(
        ApiConstants.adminAnalytics,
        queryParameters: queryParams.isNotEmpty ? queryParams : null,
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Get analytics failed: ${e.message}');
      rethrow;
    }
  }

  /// Generate financial report
  /// Backend: GET /admin/reports/financial
  Future<Map<String, dynamic>> getFinancialReport({
    required DateTime startDate,
    required DateTime endDate,
    String? restaurantId,
  }) async {
    try {
      final queryParams = {
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
      };
      if (restaurantId != null) queryParams['restaurantId'] = restaurantId;

      final response = await _apiClient.get(
        '/admin/reports/financial',
        queryParameters: queryParams,
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Get financial report failed: ${e.message}');
      rethrow;
    }
  }

  // ===================== WHATSAPP MANAGEMENT =====================

  /// Get WhatsApp configuration
  /// Backend: GET /admin/whatsapp
  Future<Map<String, dynamic>> getWhatsappConfig() async {
    try {
      final response = await _apiClient.get(ApiConstants.adminWhatsapp);
      return response.data;
    } on DioException catch (e) {
      debugPrint('Get WhatsApp config failed: ${e.message}');
      rethrow;
    }
  }

  /// Update WhatsApp configuration
  /// Backend: PUT /admin/whatsapp
  Future<Map<String, dynamic>> updateWhatsappConfig({
    required Map<String, dynamic> config,
  }) async {
    try {
      final response = await _apiClient.put(
        ApiConstants.adminWhatsapp,
        data: config,
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Update WhatsApp config failed: ${e.message}');
      rethrow;
    }
  }

  // ===================== MARKETING CAMPAIGNS =====================

  /// Get marketing campaigns
  /// Backend: GET /admin/marketing
  Future<Map<String, dynamic>> getMarketingCampaigns({
    int page = 1,
    int limit = 20,
    String? status,
  }) async {
    try {
      final queryParams = {
        'page': page.toString(),
        'limit': limit.toString(),
      };
      if (status != null) queryParams['status'] = status;

      final response = await _apiClient.get(
        ApiConstants.adminMarketing,
        queryParameters: queryParams,
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Get marketing campaigns failed: ${e.message}');
      rethrow;
    }
  }

  /// Create marketing campaign
  /// Backend: POST /admin/marketing
  Future<Map<String, dynamic>> createMarketingCampaign({
    required Map<String, dynamic> campaignData,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.adminMarketing,
        data: campaignData,
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Create marketing campaign failed: ${e.message}');
      rethrow;
    }
  }

  // ===================== SYSTEM SETTINGS =====================

  /// Get system configuration
  /// Backend: GET /admin/system/config
  Future<Map<String, dynamic>> getSystemConfig() async {
    try {
      final response = await _apiClient.get('/admin/system/config');
      return response.data;
    } on DioException catch (e) {
      debugPrint('Get system config failed: ${e.message}');
      rethrow;
    }
  }

  /// Update system configuration
  /// Backend: PUT /admin/system/config
  Future<Map<String, dynamic>> updateSystemConfig({
    required Map<String, dynamic> config,
  }) async {
    try {
      final response = await _apiClient.put(
        '/admin/system/config',
        data: config,
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Update system config failed: ${e.message}');
      rethrow;
    }
  }

  // ===================== DELIVERY ZONES =====================

  /// Manage delivery zones
  /// Backend: POST /admin/delivery-zones
  Future<Map<String, dynamic>> manageDeliveryZones({
    required String city,
    required List<Map<String, dynamic>> zones,
    required Map<String, dynamic> deliveryFees,
  }) async {
    try {
      final response = await _apiClient.post(
        '/admin/delivery-zones',
        data: {
          'city': city,
          'zones': zones,
          'deliveryFees': deliveryFees,
        },
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('Manage delivery zones failed: ${e.message}');
      rethrow;
    }
  }
}
