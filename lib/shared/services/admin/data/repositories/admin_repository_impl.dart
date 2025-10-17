import 'package:eatfast_mobile/shared/utils/result.dart';
import 'package:eatfast_mobile/shared/models/admin_stats.dart';
import 'package:eatfast_mobile/shared/services/admin/domain/repositories/admin_repository.dart';
import 'package:eatfast_mobile/shared/services/admin/data/services/admin_api_service.dart';

/// Admin Repository Implementation
class AdminRepositoryImpl implements AdminRepository {
  final AdminApiService _apiService;

  AdminRepositoryImpl({required AdminApiService apiService})
      : _apiService = apiService;

  @override
  Future<Result<AdminStats>> getAdminStats() async {
    try {
      // TODO: Implement actual API call
      // For now, return mock data
      final stats = AdminStats.empty();
      return Result.success(stats);
    } catch (e) {
      return Result.failure('Failed to load admin stats: $e');
    }
  }

  @override
  Future<Result<AdminStats>> refreshStats() async {
    // Same as getAdminStats for now
    return getAdminStats();
  }

  @override
  Future<Result<Map<String, dynamic>, String>> getDashboardStats({required String timeframe}) async {
    try {
      final data = await _apiService.getDashboardStats(timeframe: timeframe);
      return Result.success(data);
    } catch (e) {
      return Result.failure('Failed to get dashboard stats: $e');
    }
  }

  @override
  Future<Result<List<Map<String, dynamic>>, String>> getLiveDeliveries() async {
    try {
      final data = await _apiService.getLiveDeliveries();
      return Result.success(data);
    } catch (e) {
      return Result.failure('Failed to get live deliveries: $e');
    }
  }

  @override
  Future<Result<List<Map<String, dynamic>>, String>> getUsers({
    int page = 1,
    int limit = 20,
    String? role,
    String? status,
    String? city,
    String? search,
    String? sortBy,
    String? sortOrder,
  }) async {
    try {
      final data = await _apiService.getUsers(
        page: page,
        limit: limit,
        role: role,
        status: status,
        city: city,
        search: search,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );
      return Result.success(data);
    } catch (e) {
      return Result.failure('Failed to get users: $e');
    }
  }

  @override
  Future<Result<Map<String, dynamic>, String>> createUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String role,
    String? phone,
  }) async {
    try {
      final data = await _apiService.createUser(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        role: role,
        phone: phone,
      );
      return Result.success(data);
    } catch (e) {
      return Result.failure('Failed to create user: $e');
    }
  }

  @override
  Future<Result<void, String>> updateUserStatus(String userId, String status) async {
    try {
      await _apiService.updateUserStatus(userId, status);
      return Result.success(null);
    } catch (e) {
      return Result.failure('Failed to update user status: $e');
    }
  }

  @override
  Future<Result<void, String>> deleteUser(String userId) async {
    try {
      await _apiService.deleteUser(userId);
      return Result.success(null);
    } catch (e) {
      return Result.failure('Failed to delete user: $e');
    }
  }

  @override
  Future<Result<void, String>> resetUserPassword(String userId) async {
    try {
      await _apiService.resetUserPassword(userId);
      return Result.success(null);
    } catch (e) {
      return Result.failure('Failed to reset user password: $e');
    }
  }

  @override
  Future<Result<List<Map<String, dynamic>>, String>> getRestaurants() async {
    try {
      final data = await _apiService.getRestaurants();
      return Result.success(data);
    } catch (e) {
      return Result.failure('Failed to get restaurants: $e');
    }
  }

  @override
  Future<Result<void, String>> validateRestaurant(String restaurantId) async {
    try {
      await _apiService.validateRestaurant(restaurantId);
      return Result.success(null);
    } catch (e) {
      return Result.failure('Failed to validate restaurant: $e');
    }
  }

  @override
  Future<Result<void, String>> setCommissionRate(String restaurantId, double rate) async {
    try {
      await _apiService.setCommissionRate(restaurantId, rate);
      return Result.success(null);
    } catch (e) {
      return Result.failure('Failed to set commission rate: $e');
    }
  }

  @override
  Future<Result<List<Map<String, dynamic>>, String>> getOrders() async {
    try {
      final data = await _apiService.getOrders();
      return Result.success(data);
    } catch (e) {
      return Result.failure('Failed to get orders: $e');
    }
  }

  @override
  Future<Result<void, String>> cancelOrder(String orderId) async {
    try {
      await _apiService.cancelOrder(orderId);
      return Result.success(null);
    } catch (e) {
      return Result.failure('Failed to cancel order: $e');
    }
  }

  @override
  Future<Result<void, String>> refundOrder(String orderId) async {
    try {
      await _apiService.refundOrder(orderId);
      return Result.success(null);
    } catch (e) {
      return Result.failure('Failed to refund order: $e');
    }
  }

  @override
  Future<Result<Map<String, dynamic>, String>> getFinancialReport({required String timeframe}) async {
    try {
      final data = await _apiService.getFinancialReport(timeframe: timeframe);
      return Result.success(data);
    } catch (e) {
      return Result.failure('Failed to get financial report: $e');
    }
  }
}
