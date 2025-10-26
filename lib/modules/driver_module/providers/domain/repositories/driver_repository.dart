import 'dart:io';
import 'package:eatfast_mobile/shared/models/exports.dart';

abstract class DriverRepository {
  // Driver Profile Management
  Future<Result<DriverProfile, String>> getDriverProfile(String driverId);
  Future<Result<DriverProfile, String>> updateDriverProfile(DriverProfile profile);
  Future<Result<void, String>> updateDriverLocation(String driverId, double latitude, double longitude);
  Future<Result<void, String>> setDriverOnlineStatus(String driverId, bool isOnline);
  Future<Result<void, String>> setDriverAvailability(String driverId, bool isAvailable);
  
  // Order Management
  Future<Result<List<DeliveryOrder>, String>> getAvailableOrders(String driverId);
  Future<Result<List<DeliveryOrder>, String>> getActiveDeliveries(String driverId);
  Future<Result<List<DeliveryOrder>, String>> getDeliveryHistory(String driverId, {int? limit, DateTime? fromDate});
  Stream<List<DeliveryOrder>> watchAvailableOrders(String driverId);
  Stream<List<DeliveryOrder>> watchActiveDeliveries(String driverId);
  
  // Order Actions
  Future<Result<DeliveryOrder, String>> acceptOrder(String orderId, String driverId);
  Future<Result<DeliveryOrder, String>> rejectOrder(String orderId, String driverId, String reason);
  Future<Result<DeliveryOrder, String>> updateOrderStatus(String orderId, DeliveryStatus status);
  Future<Result<void, String>> startNavigation(String orderId);
  
  // Delivery Completion
  Future<Result<void, String>> markAsPickedUp(String orderId, {String? notes});
  Future<Result<void, String>> markAsDelivered(
    String orderId, {
    File? proofImage,
    String? customerSignature,
    String? notes,
    String? otpCode,
  });
  Future<Result<void, String>> reportIssue(String orderId, String issueType, String description);
  
  // Earnings & Performance
  Future<Result<DriverEarnings, String>> getEarnings(String driverId);
  Future<Result<List<EarningTransaction>, String>> getEarningTransactions(
    String driverId, {
    DateTime? fromDate,
    DateTime? toDate,
    int? limit,
  });
  Future<Result<EarningsSummary, String>> getWeeklyEarningsSummary(String driverId, DateTime weekStart);
  Future<Result<void, String>> requestPayout(String driverId, double amount, String method);
  
  // Navigation & Location
  Future<Result<Map<String, dynamic>, String>> getNavigationRoute(
    double fromLat,
    double fromLng,
    double toLat,
    double toLng,
  );
  Future<Result<void, String>> trackLocation(String driverId, String orderId, double latitude, double longitude);
  
  // Performance Metrics
  Future<Result<Map<String, dynamic>, String>> getPerformanceMetrics(String driverId);
  Future<Result<List<String>, String>> getAchievements(String driverId);
  Future<Result<Map<String, dynamic>, String>> getRatingsAndReviews(String driverId);
  
  // Communication
  Future<Result<void, String>> sendMessageToCustomer(String orderId, String message);
  Future<Result<void, String>> callCustomer(String orderId);
  Future<Result<void, String>> callRestaurant(String orderId);
  
  // Emergency & Support
  Future<Result<void, String>> reportEmergency(String driverId, String type, String description, double latitude, double longitude);
  Future<Result<List<Map<String, dynamic>>, String>> getSupportContacts();
  
  // Documents & Verification
  Future<Result<String, String>> uploadDocument(String driverId, String documentType, File file);
  Future<Result<List<Map<String, dynamic>>, String>> getRequiredDocuments(String driverId);
  Future<Result<void, String>> submitForVerification(String driverId);
}
