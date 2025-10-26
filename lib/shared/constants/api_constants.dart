/// API Constants - Centralized API endpoint definitions
/// Single source of truth for all backend API paths
class ApiConstants {
  ApiConstants._();

  // Base URLs
  static const String baseUrl = 'https://api.eatfast.com';
  static const String baseUrlDev = 'https://dev-api.eatfast.com';

  // ==================== Authentication ====================
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';
  static const String verifyEmail = '/auth/verify-email';
  static const String resendVerification = '/auth/resend-verification';
  static const String authMe = '/auth/me';

  // Social Authentication
  static const String googleSignIn = '/auth/google';
  static const String appleSignIn = '/auth/apple';
  static const String facebookSignIn = '/auth/facebook';

  // OTP & 2FA
  static const String sendOtp = '/auth/send-otp';
  static const String verifyOtp = '/auth/verify-otp';
  static const String twoFactorSetup = '/auth/2fa/setup';
  static const String twoFactorVerify = '/auth/2fa/verify';
  static const String twoFactorDisable = '/auth/2fa/disable';

  // ==================== Restaurants ====================
  static const String restaurants = '/restaurants';
  static const String restaurantDetails = '/restaurants/{id}';
  static const String restaurantMenu = '/restaurants/{id}/menu';
  static const String restaurantReviews = '/restaurants/{id}/reviews';
  static const String restaurantSearch = '/restaurants/search';
  static const String featuredRestaurants = '/restaurants/featured';
  static const String nearbyRestaurants = '/restaurants/nearby';

  // ==================== Orders ====================
  static const String orders = '/orders';
  static const String createOrder = '/orders';
  static const String orderDetails = '/orders/{id}';
  static const String orderTracking = '/orders/{id}/tracking';
  static const String cancelOrder = '/orders/{id}/cancel';
  static const String orderHistory = '/orders/history';
  static const String activeOrders = '/orders/active';

  // ==================== Payment ====================
  static const String createPaymentIntent = '/payments/create-intent';
  static const String confirmPayment = '/payments/confirm';
  static const String paymentStatus = '/payments/status';
  static const String paymentMethods = '/payments/methods';
  static const String paymentHistory = '/payments/history';

  // ==================== Wallet ====================
  static const String wallet = '/wallet';
  static const String walletBalance = '/wallet/balance';
  static const String walletTopup = '/wallet/topup';
  static const String walletTransactions = '/wallet/transactions';
  static const String walletPay = '/wallet/pay';

  // ==================== Loyalty ====================
  static const String loyalty = '/loyalty';
  static const String clientLoyalty = '/client/loyalty';
  static const String loyaltyPoints = '/loyalty/points';
  static const String loyaltyRewards = '/loyalty/rewards';
  static const String loyaltyRedeem = '/loyalty/redeem';
  static const String redeemReward = '/loyalty/redeem';
  static const String loyaltyHistory = '/loyalty/history';
  static const String loyaltyStatus = '/loyalty/status';
  static const String loyaltyDashboard = '/loyalty/dashboard';
  static const String loyaltyConfig = '/loyalty/config';

  // ==================== User Profile ====================
  static const String profile = '/user/profile';
  static const String clientProfile = '/client/profile';
  static const String updateProfile = '/user/profile';
  static const String addresses = '/user/addresses';
  static const String addAddress = '/user/addresses';
  static const String updateAddress = '/user/addresses/{id}';
  static const String deleteAddress = '/user/addresses/{id}';
  static const String clientPaymentMethods = '/client/payment-methods';

  // ==================== Promotions ====================
  static const String promotions = '/promotions';
  static const String activePromotions = '/promotions/active';
  static const String applyPromoCode = '/promotions/apply';
  static const String validatePromoCode = '/promotions/validate';

  // ==================== Notifications ====================
  static const String notifications = '/notifications';
  static const String unreadNotifications = '/notifications/unread';
  static const String markNotificationRead = '/notifications/{id}/read';
  static const String notificationMarkRead = '/notifications/{id}/read';
  static const String notificationSettings = '/notifications/settings';
  static const String notificationPreferences = '/notifications/preferences';
  static const String notificationHistory = '/notifications/history';

  // ==================== Social & Sharing ====================
  static const String socialShareCreate = '/social/share';
  static const String socialReferralCreate = '/social/referral';
  static const String socialStats = '/social/stats';

  // ==================== Admin ====================
  static const String adminDashboard = '/admin/dashboard';
  static const String adminUsers = '/admin/users';
  static const String adminRestaurants = '/admin/restaurants';
  static const String adminOrders = '/admin/orders';
  static const String adminAnalytics = '/admin/analytics';
  static const String adminReports = '/admin/reports';

  // ==================== Driver ====================
  static const String driverProfile = '/driver/profile';
  static const String driverEarnings = '/driver/earnings';
  static const String availableOrders = '/driver/orders/available';
  static const String activeDelivery = '/driver/delivery/active';
  static const String driverStatus = '/driver/status';
  static const String driverStatistics = '/driver/statistics';
  static const String driverOrders = '/driver/orders';
  static const String acceptOrder = '/driver/orders/{id}/accept';
  static const String rejectOrder = '/driver/orders/{id}/reject';
  static const String completeDelivery = '/driver/orders/{id}/complete';
  static const String driverLocation = '/driver/location';
  static const String driverStats = '/driver/stats';

  // ==================== Restaurant Manager ====================
  static const String managerDashboard = '/manager/dashboard';
  static const String managerMenu = '/manager/menu';
  static const String managerOrders = '/manager/orders';
  static const String managerAnalytics = '/manager/analytics';
  static const String updateOrderStatus = '/manager/orders/{id}/status';

  // ==================== Guest ====================
  static const String guestSession = '/guest/session';
  static const String guestRestaurants = '/guest/restaurants';
  static const String guestRestaurantDetails = '/guest/restaurants/{id}';
  static const String guestMenu = '/guest/restaurants/{id}/menu';
  static const String guestCart = '/guest/cart';
  static const String guestCartAdd = '/guest/cart/add';
  static const String guestCartUpdate = '/guest/cart/update';
  static const String guestCartRemove = '/guest/cart/remove';
  static const String guestOrders = '/guest/orders';
  static const String guestOrder = '/guest/order';
  static const String guestOrderTracking = '/guest/orders/{orderId}/tracking';
  static const String guestTracking = '/guest/tracking/{orderId}';
  static const String guestDeliveryFee = '/guest/delivery-fee';
  static const String guestConvert = '/guest/convert';

  // ==================== Public/Company ====================
  static const String publicContact = '/api/public/contact';
  static const String publicNewsletter = '/api/public/newsletter';

  // ==================== Cart ====================
  static const String cart = '/cart';
  static const String addToCart = '/cart/items';
  static const String updateCartItem = '/cart/items/{id}';
  static const String removeFromCart = '/cart/items/{id}';
  static const String clearCart = '/cart/clear';

  // ==================== Reviews & Ratings ====================
  static const String reviews = '/reviews';
  static const String createReview = '/reviews';
  static const String updateReview = '/reviews/{id}';
  static const String deleteReview = '/reviews/{id}';

  // ==================== Settings ====================
  static const String appSettings = '/settings';
  static const String systemStatus = '/system/status';
  static const String appVersion = '/system/version';

  // ==================== Analytics ====================
  static const String analytics = '/analytics';
  static const String analyticsRevenue = '/analytics/revenue';
  static const String analyticsDashboard = '/analytics/dashboard';
  static const String analyticsReports = '/analytics/reports';

  // ==================== Media & Files ====================
  static const String uploadFile = '/upload';
  static const String uploadImage = '/upload/image';

  // ==================== WebSocket Events ====================
  static const String socketOrderUpdate = 'order_update';
  static const String socketLocationUpdate = 'location_update';
  static const String socketNotification = 'notification';
  static const String socketDriverStatusUpdate = 'driver_status_update';
  static const String socketRestaurantStatusUpdate = 'restaurant_status_update';

  // Timeouts
  static const int connectTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds

  // Headers
  static const String contentTypeJson = 'application/json';
  static const String authorization = 'Authorization';
  static const String bearerPrefix = 'Bearer';

  /// Helper method to replace path parameters
  /// Example: replacePathParams('/orders/{id}/tracking', {'id': '123'})
  /// Returns: '/orders/123/tracking'
  static String replacePathParams(String path, Map<String, String> params) {
    var result = path;
    params.forEach((key, value) {
      result = result.replaceAll('{$key}', value);
    });
    return result;
  }
}
