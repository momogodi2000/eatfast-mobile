import 'dart:io';
import 'package:eatfast_mobile/shared/models/exports.dart' hide MenuCategory;
import '../models/restaurant_stats.dart';
import '../models/live_order.dart';
import '../models/menu_management.dart' as menu_mgmt;
import '../models/menu_item_performance.dart';

abstract class RestaurantOwnerRepository {
  // Dashboard Statistics
  Future<Result<RestaurantStats, String>> getDashboardStats(
    String restaurantId,
  );
  Future<Result<List<HourlyStats>, String>> getHourlyStats(
    String restaurantId,
    DateTime date,
  );
  Future<Result<List<DailyStats>, String>> getWeeklyStats(String restaurantId);

  // Live Order Management
  Future<Result<List<LiveOrder>, String>> getLiveOrders(String restaurantId);
  Stream<List<LiveOrder>> watchLiveOrders(String restaurantId);
  Future<Result<LiveOrder, String>> acceptOrder(
    String orderId,
    int estimatedPrepTime,
  );
  Future<Result<LiveOrder, String>> rejectOrder(String orderId, String reason);
  Future<Result<LiveOrder, String>> updateOrderStatus(
    String orderId,
    OrderStatus status,
  );
  Future<Result<void, String>> updatePreparationTime(
    String orderId,
    int newPrepTime,
  );

  // Menu Management
  Future<Result<List<menu_mgmt.MenuCategory>, String>> getMenuCategories(
    String restaurantId,
  );
  Future<Result<menu_mgmt.MenuCategory, String>> createMenuCategory(
    String restaurantId,
    menu_mgmt.MenuCategory category,
  );
  Future<Result<menu_mgmt.MenuCategory, String>> updateMenuCategory(
    menu_mgmt.MenuCategory category,
  );
  Future<Result<void, String>> deleteMenuCategory(String categoryId);
  Future<Result<void, String>> reorderCategories(
    String restaurantId,
    List<String> categoryIds,
  );

  // Menu Item Management
  Future<Result<menu_mgmt.MenuItemDetails, String>> createMenuItem(
    String categoryId,
    menu_mgmt.MenuItemDetails item,
  );
  Future<Result<menu_mgmt.MenuItemDetails, String>> updateMenuItem(
    menu_mgmt.MenuItemDetails item,
  );
  Future<Result<void, String>> deleteMenuItem(String itemId);
  Future<Result<void, String>> toggleItemAvailability(
    String itemId,
    bool isAvailable,
  );
  Future<Result<void, String>> bulkUpdateAvailability(
    List<String> itemIds,
    bool isAvailable,
  );

  // Image Management
  Future<Result<String, String>> uploadItemImage(String itemId, File imageFile);
  Future<Result<String, String>> uploadCategoryImage(
    String categoryId,
    File imageFile,
  );
  Future<Result<void, String>> deleteImage(String imageUrl);

  // Analytics
  Future<Result<List<MenuItemPerformance>, String>> getItemPerformance(
    String restaurantId,
  );
  Future<Result<Map<String, dynamic>, String>> getRevenueAnalytics(
    String restaurantId,
    DateTime from,
    DateTime to,
  );
  Future<Result<List<PopularItem>, String>> getPopularItems(
    String restaurantId,
  );

  // Restaurant Profile
  Future<Result<Map<String, dynamic>, String>> getRestaurantProfile(
    String restaurantId,
  );
  Future<Result<void, String>> updateRestaurantProfile(
    String restaurantId,
    Map<String, dynamic> data,
  );
  Future<Result<void, String>> updateBusinessHours(
    String restaurantId,
    Map<String, dynamic> hours,
  );
  Future<Result<void, String>> updateDeliveryRadius(
    String restaurantId,
    double radius,
  );

  // Notifications
  Future<Result<void, String>> markNotificationAsRead(String notificationId);
  Future<Result<List<Map<String, dynamic>>, String>> getNotifications(
    String restaurantId,
  );

  // Wallet & Financials
  Future<Result<Map<String, dynamic>, String>> getWalletBalance(
    String restaurantId,
  );
  Future<Result<List<Map<String, dynamic>>, String>> getWalletTransactions(
    String restaurantId,
  );
  Future<Result<void, String>> requestWithdrawal(
    String restaurantId,
    double amount,
    String description,
  );

  /// Get restaurant statistics
  Future<RestaurantStats> getRestaurantStats(String restaurantId);
}
