import 'package:eatfast_mobile/shared/utils/result.dart';
import 'package:eatfast_mobile/shared/models/admin_stats.dart';
import '../models/user_management.dart';

abstract class AdminRepository {
  // Platform Analytics & Statistics
  Future<Result<AdminStats, String>> getPlatformStats();
  Future<Result<PlatformMetrics, String>> getPlatformMetrics();
  Future<Result<List<HourlyStats>, String>> getHourlyStats(DateTime date);
  Future<Result<List<DailyStats>, String>> getDailyStats(DateTime startDate, DateTime endDate);
  Future<Result<List<WeeklyStats>, String>> getWeeklyStats(int weeksCount);
  Future<Result<List<MonthlyStats>, String>> getMonthlyStats(int monthsCount);
  
  // User Management
  Future<Result<List<UserAccount>, String>> getUsers({
    UserRole? role,
    UserStatus? status,
    String? searchQuery,
    int? limit,
    int? offset,
  });
  Future<Result<UserAccount, String>> getUserDetails(String userId);
  Future<Result<List<UserActivity>, String>> getUserActivity(String userId, {int? limit});
  Future<Result<void, String>> updateUserStatus(String userId, UserStatus status, {String? reason});
  Future<Result<void, String>> suspendUser(String userId, String reason, DateTime? until);
  Future<Result<void, String>> unsuspendUser(String userId);
  Future<Result<void, String>> banUser(String userId, String reason);
  Future<Result<void, String>> deleteUser(String userId);
  
  // Restaurant Management
  Future<Result<List<RestaurantAccount>, String>> getRestaurants({
    RestaurantStatus? status,
    String? searchQuery,
    String? cuisineType,
    int? limit,
    int? offset,
  });
  Future<Result<RestaurantAccount, String>> getRestaurantDetails(String restaurantId);
  Future<Result<void, String>> updateRestaurantStatus(String restaurantId, RestaurantStatus status, {String? reason});
  Future<Result<void, String>> verifyRestaurant(String restaurantId);
  Future<Result<void, String>> rejectRestaurant(String restaurantId, String reason);
  Future<Result<void, String>> suspendRestaurant(String restaurantId, String reason, DateTime? until);
  Future<Result<void, String>> updateCommissionRate(String restaurantId, double commissionRate);
  Future<Result<List<RestaurantDocument>, String>> getRestaurantDocuments(String restaurantId);
  Future<Result<void, String>> verifyDocument(String documentId);
  Future<Result<void, String>> rejectDocument(String documentId, String reason);
  
  // Driver Management
  Future<Result<List<DriverAccount>, String>> getDrivers({
    DriverAccountStatus? status,
    String? searchQuery,
    String? vehicleType,
    int? limit,
    int? offset,
  });
  Future<Result<DriverAccount, String>> getDriverDetails(String driverId);
  Future<Result<void, String>> updateDriverStatus(String driverId, DriverAccountStatus status, {String? reason});
  Future<Result<void, String>> verifyDriver(String driverId);
  Future<Result<void, String>> rejectDriver(String driverId, String reason);
  Future<Result<void, String>> suspendDriver(String driverId, String reason, DateTime? until);
  Future<Result<List<DriverDocument>, String>> getDriverDocuments(String driverId);
  
  // Order Management
  Future<Result<List<Map<String, dynamic>>, String>> getAllOrders({
    String? status,
    String? searchQuery,
    DateTime? fromDate,
    DateTime? toDate,
    int? limit,
    int? offset,
  });
  Future<Result<Map<String, dynamic>, String>> getOrderDetails(String orderId);
  Future<Result<void, String>> refundOrder(String orderId, double amount, String reason);
  Future<Result<void, String>> cancelOrder(String orderId, String reason);
  
  // Financial Management
  Future<Result<Map<String, dynamic>, String>> getFinancialSummary();
  Future<Result<List<Map<String, dynamic>>, String>> getTransactions({
    String? type,
    DateTime? fromDate,
    DateTime? toDate,
    int? limit,
    int? offset,
  });
  Future<Result<List<Map<String, dynamic>>, String>> getPendingPayouts();
  Future<Result<void, String>> approvePayou(String payoutId);
  Future<Result<void, String>> rejectPayout(String payoutId, String reason);
  
  // Support & Communications
  Future<Result<List<Map<String, dynamic>>, String>> getSupportTickets({
    String? status,
    String? priority,
    int? limit,
    int? offset,
  });
  Future<Result<Map<String, dynamic>, String>> getSupportTicketDetails(String ticketId);
  Future<Result<void, String>> assignTicket(String ticketId, String adminId);
  Future<Result<void, String>> updateTicketStatus(String ticketId, String status);
  Future<Result<void, String>> addTicketResponse(String ticketId, String message);
  
  // System Configuration
  Future<Result<Map<String, dynamic>, String>> getSystemConfig();
  Future<Result<void, String>> updateSystemConfig(Map<String, dynamic> config);
  Future<Result<List<String>, String>> getSystemLogs({DateTime? fromDate, String? level});
  Future<Result<Map<String, dynamic>, String>> getSystemHealth();
  
  // Notifications & Alerts
  Future<Result<void, String>> sendGlobalNotification(String title, String message, {String? targetRole});
  Future<Result<void, String>> sendUserNotification(String userId, String title, String message);
  Future<Result<List<Map<String, dynamic>>, String>> getSystemAlerts();
  Future<Result<void, String>> dismissAlert(String alertId);
  
  // Reports & Analytics
  Future<Result<Map<String, dynamic>, String>> generateRevenueReport(DateTime startDate, DateTime endDate);
  Future<Result<Map<String, dynamic>, String>> generateUserActivityReport(DateTime startDate, DateTime endDate);
  Future<Result<Map<String, dynamic>, String>> generateOrderAnalyticsReport(DateTime startDate, DateTime endDate);
  Future<Result<Map<String, dynamic>, String>> generateDriverPerformanceReport(DateTime startDate, DateTime endDate);
  Future<Result<Map<String, dynamic>, String>> generateRestaurantPerformanceReport(DateTime startDate, DateTime endDate);
  
  // Real-time Monitoring
  Stream<AdminStats> watchPlatformStats();
  Stream<List<Map<String, dynamic>>> watchActiveOrders();
  Stream<List<Map<String, dynamic>>> watchOnlineDrivers();
  Stream<List<Map<String, dynamic>>> watchActiveRestaurants();
  Stream<List<Map<String, dynamic>>> watchSystemAlerts();
}
