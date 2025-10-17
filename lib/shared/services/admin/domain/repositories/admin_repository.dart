import 'package:eatfast_mobile/shared/utils/result.dart';
import 'package:eatfast_mobile/shared/models/admin_stats.dart';

/// Admin Repository Interface
abstract class AdminRepository {
  /// Get admin dashboard statistics
  Future<Result<AdminStats, String>> getAdminStats();

  /// Refresh admin statistics
  Future<Result<AdminStats, String>> refreshStats();

  /// Get dashboard stats with timeframe
  Future<Result<Map<String, dynamic>, String>> getDashboardStats({
    required String timeframe,
  });

  /// Get live deliveries
  Future<Result<List<Map<String, dynamic>>, String>> getLiveDeliveries();

  /// Get users with filters
  Future<Result<List<Map<String, dynamic>>, String>> getUsers({
    int page = 1,
    int limit = 20,
    String? role,
    String? status,
    String? city,
    String? search,
    String? sortBy,
    String? sortOrder,
  });

  /// Create user
  Future<Result<Map<String, dynamic>, String>> createUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String role,
    String? phone,
  });

  /// Update user status
  Future<Result<void, String>> updateUserStatus(String userId, String status);

  /// Delete user
  Future<Result<void, String>> deleteUser(String userId);

  /// Reset user password
  Future<Result<void, String>> resetUserPassword(String userId);

  /// Get restaurants
  Future<Result<List<Map<String, dynamic>>, String>> getRestaurants();

  /// Validate restaurant
  Future<Result<void, String>> validateRestaurant(String restaurantId);

  /// Set commission rate
  Future<Result<void, String>> setCommissionRate(
    String restaurantId,
    double rate,
  );

  /// Get orders
  Future<Result<List<Map<String, dynamic>>, String>> getOrders();

  /// Cancel order
  Future<Result<void, String>> cancelOrder(String orderId);

  /// Refund order
  Future<Result<void, String>> refundOrder(String orderId);

  /// Get financial report
  Future<Result<Map<String, dynamic>, String>> getFinancialReport({
    required String timeframe,
  });
}
