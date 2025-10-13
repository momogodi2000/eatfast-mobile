/// Admin Repository Implementation
/// Implements the AdminRepository interface and connects to backend APIs
library;

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import '../../../../core/result.dart';
import '../../domain/models/admin_stats.dart';
import '../../domain/models/user_management.dart';
import '../../domain/repositories/admin_repository.dart';
import '../services/admin_api_service.dart';

class AdminRepositoryImpl implements AdminRepository {
  final AdminApiService _apiService;

  AdminRepositoryImpl({AdminApiService? apiService})
      : _apiService = apiService ?? AdminApiService();

  // ===================== PLATFORM ANALYTICS & STATISTICS =====================

  @override
  Future<Result<AdminStats, String>> getPlatformStats() async {
    try {
      final response = await _apiService.getDashboardStats(timeframe: '24h');

      if (response['success'] == true) {
        // Transform backend response to match AdminStats model
        final overview = response['overview'] as Map<String, dynamic>;
        final topRestaurants = response['topRestaurants'] as List<dynamic>? ?? [];

        final stats = AdminStats(
          totalUsers: overview['totalUsers'] ?? 0,
          activeUsers: overview['activeUsers'] ?? 0,
          totalRestaurants: overview['totalRestaurants'] ?? 0,
          activeRestaurants: overview['activeRestaurants'] ?? 0,
          totalDrivers: 0, // Not provided by backend yet
          activeDrivers: 0, // Not provided by backend yet
          onlineDrivers: overview['activeDeliveries'] ?? 0,
          totalRevenue: (overview['revenue'] ?? 0).toDouble(),
          todayRevenue: (overview['revenue'] ?? 0).toDouble(),
          weekRevenue: 0.0, // Needs to be calculated from backend data
          monthRevenue: 0.0, // Needs to be calculated from backend data
          totalOrders: overview['totalOrders'] ?? 0,
          todayOrders: overview['totalOrders'] ?? 0,
          weekOrders: 0, // Needs to be calculated
          monthOrders: 0, // Needs to be calculated
          pendingOrders: 0, // Parse from ordersByStatus
          completedOrders: 0, // Parse from ordersByStatus
          cancelledOrders: 0, // Parse from ordersByStatus
          averageOrderValue: 0.0, // Needs calculation
          averageDeliveryTime: (overview['avgDeliveryTime'] ?? 0).toDouble(),
          customerSatisfaction: 0.0, // Not provided yet
          platformCommission: 0.0, // Needs to be calculated
          topRestaurants: topRestaurants.map((r) => TopRestaurant.fromJson(r)).toList(),
        );

        return Result.success(stats);
      }

      return Result.failure(response['error'] ?? 'Failed to fetch platform stats');
    } on DioException catch (e) {
      debugPrint('Get platform stats error: ${e.message}');
      return Result.failure(_handleDioError(e));
    } catch (e) {
      debugPrint('Get platform stats error: $e');
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<PlatformMetrics, String>> getPlatformMetrics() async {
    try {
      final response = await _apiService.getAnalytics();

      if (response['success'] == true) {
        final data = response['data'] as Map<String, dynamic>;
        final metrics = PlatformMetrics.fromJson(data);
        return Result.success(metrics);
      }

      return Result.failure(response['error'] ?? 'Failed to fetch platform metrics');
    } on DioException catch (e) {
      debugPrint('Get platform metrics error: ${e.message}');
      return Result.failure(_handleDioError(e));
    } catch (e) {
      debugPrint('Get platform metrics error: $e');
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<List<HourlyStats>, String>> getHourlyStats(DateTime date) async {
    try {
      final response = await _apiService.getDashboardStats(timeframe: '24h');

      if (response['success'] == true && response['charts'] != null) {
        final charts = response['charts'] as Map<String, dynamic>;
        final hourlyData = charts['hourlyOrders'] as List<dynamic>? ?? [];

        final stats = hourlyData
            .map((item) => HourlyStats.fromJson(item))
            .toList();

        return Result.success(stats);
      }

      return Result.failure(response['error'] ?? 'Failed to fetch hourly stats');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<List<DailyStats>, String>> getDailyStats(
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      final response = await _apiService.getFinancialReport(
        startDate: startDate,
        endDate: endDate,
      );

      if (response['success'] == true) {
        final dailyRevenue = response['report']?['dailyRevenue'] as List<dynamic>? ?? [];

        final stats = dailyRevenue
            .map((item) => DailyStats(
                  date: DateTime.parse(item['date']),
                  orders: 0,
                  revenue: (item['revenue'] ?? 0).toDouble(),
                  newUsers: 0,
                  newRestaurants: 0,
                  newDrivers: 0,
                  averageOrderValue: 0.0,
                  customerSatisfaction: 0.0,
                ))
            .toList();

        return Result.success(stats);
      }

      return Result.failure(response['error'] ?? 'Failed to fetch daily stats');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<List<WeeklyStats>, String>> getWeeklyStats(int weeksCount) async {
    // Not implemented in backend yet
    return Result.failure('Weekly stats not yet implemented');
  }

  @override
  Future<Result<List<MonthlyStats>, String>> getMonthlyStats(int monthsCount) async {
    // Not implemented in backend yet
    return Result.failure('Monthly stats not yet implemented');
  }

  // ===================== USER MANAGEMENT =====================

  @override
  Future<Result<List<UserAccount>, String>> getUsers({
    UserRole? role,
    UserStatus? status,
    String? searchQuery,
    int? limit,
    int? offset,
  }) async {
    try {
      final page = offset != null && limit != null ? (offset ~/ limit) + 1 : 1;

      final response = await _apiService.getUsers(
        page: page,
        limit: limit ?? 20,
        role: role?.name,
        status: status?.name,
        search: searchQuery,
      );

      if (response['success'] == true) {
        final users = (response['users'] as List<dynamic>)
            .map((json) => UserAccount.fromJson(json))
            .toList();

        return Result.success(users);
      }

      return Result.failure(response['error'] ?? 'Failed to fetch users');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      debugPrint('Get users error: $e');
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<UserAccount, String>> getUserDetails(String userId) async {
    try {
      final response = await _apiService.getUserById(userId);

      if (response['success'] == true) {
        final user = UserAccount.fromJson(response['user']);
        return Result.success(user);
      }

      return Result.failure(response['error'] ?? 'Failed to fetch user details');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<List<UserActivity>, String>> getUserActivity(
    String userId, {
    int? limit,
  }) async {
    try {
      final response = await _apiService.getUserAuditLog(
        userId,
        limit: limit ?? 50,
      );

      if (response['success'] == true) {
        final events = (response['events'] as List<dynamic>)
            .map((json) => UserActivity.fromJson(json))
            .toList();

        return Result.success(events);
      }

      return Result.failure(response['error'] ?? 'Failed to fetch user activity');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<void, String>> updateUserStatus(
    String userId,
    UserStatus status, {
    String? reason,
  }) async {
    try {
      final response = await _apiService.updateUserStatus(
        userId,
        status: status.name,
        reason: reason,
      );

      if (response['success'] == true) {
        return Result.success(null);
      }

      return Result.failure(response['error'] ?? 'Failed to update user status');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<void, String>> suspendUser(
    String userId,
    String reason,
    DateTime? until,
  ) async {
    try {
      final response = await _apiService.updateUserStatus(
        userId,
        status: 'suspended',
        reason: reason,
      );

      if (response['success'] == true) {
        return Result.success(null);
      }

      return Result.failure(response['error'] ?? 'Failed to suspend user');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<void, String>> unsuspendUser(String userId) async {
    try {
      final response = await _apiService.updateUserStatus(
        userId,
        status: 'active',
        reason: 'Unsuspended by admin',
      );

      if (response['success'] == true) {
        return Result.success(null);
      }

      return Result.failure(response['error'] ?? 'Failed to unsuspend user');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<void, String>> banUser(String userId, String reason) async {
    try {
      final response = await _apiService.updateUserStatus(
        userId,
        status: 'banned',
        reason: reason,
      );

      if (response['success'] == true) {
        return Result.success(null);
      }

      return Result.failure(response['error'] ?? 'Failed to ban user');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<void, String>> deleteUser(String userId) async {
    try {
      final response = await _apiService.deleteUser(
        userId,
        reason: 'Deleted by admin',
      );

      if (response['success'] == true) {
        return Result.success(null);
      }

      return Result.failure(response['error'] ?? 'Failed to delete user');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  // ===================== RESTAURANT MANAGEMENT =====================

  @override
  Future<Result<List<RestaurantAccount>, String>> getRestaurants({
    RestaurantStatus? status,
    String? searchQuery,
    String? cuisineType,
    int? limit,
    int? offset,
  }) async {
    try {
      final page = offset != null && limit != null ? (offset ~/ limit) + 1 : 1;

      final response = await _apiService.getRestaurants(
        page: page,
        limit: limit ?? 20,
        status: status?.name,
        search: searchQuery,
      );

      if (response['success'] == true) {
        final restaurants = (response['restaurants'] as List<dynamic>)
            .map((json) => RestaurantAccount.fromJson(json))
            .toList();

        return Result.success(restaurants);
      }

      return Result.failure(response['error'] ?? 'Failed to fetch restaurants');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<RestaurantAccount, String>> getRestaurantDetails(
    String restaurantId,
  ) async {
    // Implementation would call _apiService.getRestaurantById when backend endpoint is available
    return Result.failure('Get restaurant details not yet implemented');
  }

  @override
  Future<Result<void, String>> updateRestaurantStatus(
    String restaurantId,
    RestaurantStatus status, {
    String? reason,
  }) async {
    try {
      final response = await _apiService.validateRestaurant(
        restaurantId,
        status: status.name,
        reason: reason,
      );

      if (response['success'] == true) {
        return Result.success(null);
      }

      return Result.failure(response['error'] ?? 'Failed to update restaurant status');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<void, String>> verifyRestaurant(String restaurantId) async {
    try {
      final response = await _apiService.validateRestaurant(
        restaurantId,
        status: 'approved',
      );

      if (response['success'] == true) {
        return Result.success(null);
      }

      return Result.failure(response['error'] ?? 'Failed to verify restaurant');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<void, String>> rejectRestaurant(
    String restaurantId,
    String reason,
  ) async {
    try {
      final response = await _apiService.validateRestaurant(
        restaurantId,
        status: 'rejected',
        reason: reason,
      );

      if (response['success'] == true) {
        return Result.success(null);
      }

      return Result.failure(response['error'] ?? 'Failed to reject restaurant');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<void, String>> suspendRestaurant(
    String restaurantId,
    String reason,
    DateTime? until,
  ) async {
    try {
      final response = await _apiService.validateRestaurant(
        restaurantId,
        status: 'suspended',
        reason: reason,
      );

      if (response['success'] == true) {
        return Result.success(null);
      }

      return Result.failure(response['error'] ?? 'Failed to suspend restaurant');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<void, String>> updateCommissionRate(
    String restaurantId,
    double commissionRate,
  ) async {
    try {
      final response = await _apiService.setCommissionRate(
        restaurantId,
        commissionRate: commissionRate,
      );

      if (response['success'] == true) {
        return Result.success(null);
      }

      return Result.failure(response['error'] ?? 'Failed to update commission rate');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<List<RestaurantDocument>, String>> getRestaurantDocuments(
    String restaurantId,
  ) async {
    // Not implemented in backend yet
    return Result.failure('Get restaurant documents not yet implemented');
  }

  @override
  Future<Result<void, String>> verifyDocument(String documentId) async {
    // Not implemented in backend yet
    return Result.failure('Verify document not yet implemented');
  }

  @override
  Future<Result<void, String>> rejectDocument(
    String documentId,
    String reason,
  ) async {
    // Not implemented in backend yet
    return Result.failure('Reject document not yet implemented');
  }

  // ===================== DRIVER MANAGEMENT =====================

  @override
  Future<Result<List<DriverAccount>, String>> getDrivers({
    DriverAccountStatus? status,
    String? searchQuery,
    String? vehicleType,
    int? limit,
    int? offset,
  }) async {
    // Not fully implemented in backend yet
    return Result.failure('Get drivers not yet implemented');
  }

  @override
  Future<Result<DriverAccount, String>> getDriverDetails(String driverId) async {
    return Result.failure('Get driver details not yet implemented');
  }

  @override
  Future<Result<void, String>> updateDriverStatus(
    String driverId,
    DriverAccountStatus status, {
    String? reason,
  }) async {
    return Result.failure('Update driver status not yet implemented');
  }

  @override
  Future<Result<void, String>> verifyDriver(String driverId) async {
    return Result.failure('Verify driver not yet implemented');
  }

  @override
  Future<Result<void, String>> rejectDriver(String driverId, String reason) async {
    return Result.failure('Reject driver not yet implemented');
  }

  @override
  Future<Result<void, String>> suspendDriver(
    String driverId,
    String reason,
    DateTime? until,
  ) async {
    return Result.failure('Suspend driver not yet implemented');
  }

  @override
  Future<Result<List<DriverDocument>, String>> getDriverDocuments(
    String driverId,
  ) async {
    return Result.failure('Get driver documents not yet implemented');
  }

  // ===================== ORDER MANAGEMENT =====================

  @override
  Future<Result<List<Map<String, dynamic>>, String>> getAllOrders({
    String? status,
    String? searchQuery,
    DateTime? fromDate,
    DateTime? toDate,
    int? limit,
    int? offset,
  }) async {
    try {
      final page = offset != null && limit != null ? (offset ~/ limit) + 1 : 1;

      final response = await _apiService.getOrders(
        page: page,
        limit: limit ?? 20,
        status: status,
        search: searchQuery,
        fromDate: fromDate,
        toDate: toDate,
      );

      if (response['success'] == true) {
        final orders = response['orders'] as List<dynamic>;
        return Result.success(orders.cast<Map<String, dynamic>>());
      }

      return Result.failure(response['error'] ?? 'Failed to fetch orders');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<Map<String, dynamic>, String>> getOrderDetails(String orderId) async {
    return Result.failure('Get order details not yet implemented');
  }

  @override
  Future<Result<void, String>> refundOrder(
    String orderId,
    double amount,
    String reason,
  ) async {
    try {
      final response = await _apiService.refundOrder(
        orderId: orderId,
        amount: amount,
        reason: reason,
      );

      if (response['success'] == true) {
        return Result.success(null);
      }

      return Result.failure(response['error'] ?? 'Failed to refund order');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      debugPrint('Refund order error: $e');
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<void, String>> cancelOrder(String orderId, String reason) async {
    try {
      final response = await _apiService.cancelOrder(
        orderId: orderId,
        reason: reason,
      );

      if (response['success'] == true) {
        return Result.success(null);
      }

      return Result.failure(response['error'] ?? 'Failed to cancel order');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      debugPrint('Cancel order error: $e');
      return Result.failure('An unexpected error occurred');
    }
  }

  // ===================== FINANCIAL MANAGEMENT =====================

  @override
  Future<Result<Map<String, dynamic>, String>> getFinancialSummary() async {
    try {
      final endDate = DateTime.now();
      final startDate = endDate.subtract(const Duration(days: 30));

      final response = await _apiService.getFinancialReport(
        startDate: startDate,
        endDate: endDate,
      );

      if (response['success'] == true) {
        return Result.success(response['report'] as Map<String, dynamic>);
      }

      return Result.failure(response['error'] ?? 'Failed to fetch financial summary');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<List<Map<String, dynamic>>, String>> getTransactions({
    String? type,
    DateTime? fromDate,
    DateTime? toDate,
    int? limit,
    int? offset,
  }) async {
    return Result.failure('Get transactions not yet implemented');
  }

  @override
  Future<Result<List<Map<String, dynamic>>, String>> getPendingPayouts() async {
    return Result.failure('Get pending payouts not yet implemented');
  }

  @override
  Future<Result<void, String>> approvePayou(String payoutId) async {
    return Result.failure('Approve payout not yet implemented');
  }

  @override
  Future<Result<void, String>> rejectPayout(String payoutId, String reason) async {
    return Result.failure('Reject payout not yet implemented');
  }

  // ===================== SUPPORT & COMMUNICATIONS =====================

  @override
  Future<Result<List<Map<String, dynamic>>, String>> getSupportTickets({
    String? status,
    String? priority,
    int? limit,
    int? offset,
  }) async {
    return Result.failure('Get support tickets not yet implemented');
  }

  @override
  Future<Result<Map<String, dynamic>, String>> getSupportTicketDetails(
    String ticketId,
  ) async {
    return Result.failure('Get support ticket details not yet implemented');
  }

  @override
  Future<Result<void, String>> assignTicket(String ticketId, String adminId) async {
    return Result.failure('Assign ticket not yet implemented');
  }

  @override
  Future<Result<void, String>> updateTicketStatus(
    String ticketId,
    String status,
  ) async {
    return Result.failure('Update ticket status not yet implemented');
  }

  @override
  Future<Result<void, String>> addTicketResponse(
    String ticketId,
    String message,
  ) async {
    return Result.failure('Add ticket response not yet implemented');
  }

  // ===================== SYSTEM CONFIGURATION =====================

  @override
  Future<Result<Map<String, dynamic>, String>> getSystemConfig() async {
    try {
      final response = await _apiService.getSystemConfig();

      if (response['success'] == true) {
        return Result.success(response['config'] as Map<String, dynamic>);
      }

      return Result.failure(response['error'] ?? 'Failed to fetch system config');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<void, String>> updateSystemConfig(
    Map<String, dynamic> config,
  ) async {
    try {
      final response = await _apiService.updateSystemConfig(config: config);

      if (response['success'] == true) {
        return Result.success(null);
      }

      return Result.failure(response['error'] ?? 'Failed to update system config');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<List<String>, String>> getSystemLogs({
    DateTime? fromDate,
    String? level,
  }) async {
    return Result.failure('Get system logs not yet implemented');
  }

  @override
  Future<Result<Map<String, dynamic>, String>> getSystemHealth() async {
    return Result.failure('Get system health not yet implemented');
  }

  // ===================== NOTIFICATIONS & ALERTS =====================

  @override
  Future<Result<void, String>> sendGlobalNotification(
    String title,
    String message, {
    String? targetRole,
  }) async {
    return Result.failure('Send global notification not yet implemented');
  }

  @override
  Future<Result<void, String>> sendUserNotification(
    String userId,
    String title,
    String message,
  ) async {
    return Result.failure('Send user notification not yet implemented');
  }

  @override
  Future<Result<List<Map<String, dynamic>>, String>> getSystemAlerts() async {
    return Result.failure('Get system alerts not yet implemented');
  }

  @override
  Future<Result<void, String>> dismissAlert(String alertId) async {
    return Result.failure('Dismiss alert not yet implemented');
  }

  // ===================== REPORTS & ANALYTICS =====================

  @override
  Future<Result<Map<String, dynamic>, String>> generateRevenueReport(
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      final response = await _apiService.getFinancialReport(
        startDate: startDate,
        endDate: endDate,
      );

      if (response['success'] == true) {
        return Result.success(response['report'] as Map<String, dynamic>);
      }

      return Result.failure(response['error'] ?? 'Failed to generate revenue report');
    } on DioException catch (e) {
      return Result.failure(_handleDioError(e));
    } catch (e) {
      return Result.failure('An unexpected error occurred');
    }
  }

  @override
  Future<Result<Map<String, dynamic>, String>> generateUserActivityReport(
    DateTime startDate,
    DateTime endDate,
  ) async {
    return Result.failure('Generate user activity report not yet implemented');
  }

  @override
  Future<Result<Map<String, dynamic>, String>> generateOrderAnalyticsReport(
    DateTime startDate,
    DateTime endDate,
  ) async {
    return Result.failure('Generate order analytics report not yet implemented');
  }

  @override
  Future<Result<Map<String, dynamic>, String>> generateDriverPerformanceReport(
    DateTime startDate,
    DateTime endDate,
  ) async {
    return Result.failure('Generate driver performance report not yet implemented');
  }

  @override
  Future<Result<Map<String, dynamic>, String>> generateRestaurantPerformanceReport(
    DateTime startDate,
    DateTime endDate,
  ) async {
    return Result.failure('Generate restaurant performance report not yet implemented');
  }

  // ===================== REAL-TIME MONITORING =====================

  @override
  Stream<AdminStats> watchPlatformStats() {
    // Not implemented - would require WebSocket or polling
    throw UnimplementedError('Real-time platform stats not yet implemented');
  }

  @override
  Stream<List<Map<String, dynamic>>> watchActiveOrders() {
    throw UnimplementedError('Real-time active orders not yet implemented');
  }

  @override
  Stream<List<Map<String, dynamic>>> watchOnlineDrivers() {
    throw UnimplementedError('Real-time online drivers not yet implemented');
  }

  @override
  Stream<List<Map<String, dynamic>>> watchActiveRestaurants() {
    throw UnimplementedError('Real-time active restaurants not yet implemented');
  }

  @override
  Stream<List<Map<String, dynamic>>> watchSystemAlerts() {
    throw UnimplementedError('Real-time system alerts not yet implemented');
  }

  // ===================== ERROR HANDLING =====================

  String _handleDioError(DioException error) {
    if (error.response != null) {
      final data = error.response!.data;
      if (data is Map<String, dynamic> && data.containsKey('error')) {
        return data['error'] as String;
      }
      if (data is Map<String, dynamic> && data.containsKey('message')) {
        return data['message'] as String;
      }

      switch (error.response!.statusCode) {
        case 400:
          return 'Invalid request. Please check your input.';
        case 401:
          return 'Unauthorized. Please login again.';
        case 403:
          return 'Access denied. Insufficient permissions.';
        case 404:
          return 'Resource not found.';
        case 500:
          return 'Server error. Please try again later.';
        default:
          return 'Error: ${error.response!.statusCode}';
      }
    }

    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return 'Connection timeout. Please check your internet connection.';
    }

    if (error.type == DioExceptionType.connectionError) {
      return 'Connection error. Please check your internet connection.';
    }

    return 'Network error occurred. Please try again.';
  }
}
