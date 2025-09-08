/// API endpoints for the EatFast backend
class ApiEndpoints {
  ApiEndpoints._();

  // Base API path
  static const String _apiBase = '/api';

  // Authentication endpoints
  static const String login = '$_apiBase/auth/login';
  static const String register = '$_apiBase/auth/register';
  static const String logout = '$_apiBase/auth/logout';
  static const String refreshToken = '$_apiBase/auth/refresh';
  static const String revokeToken = '$_apiBase/auth/logout';
  static const String getCurrentUser = '$_apiBase/auth/me';
  static const String currentUser = '$_apiBase/auth/me'; // Alias for backward compatibility

  // Password management endpoints (matching backend exactly)
  static const String requestPasswordReset = '$_apiBase/auth/password/reset-request';
  static const String verifyResetCode = '$_apiBase/auth/password/verify-code';
  static const String resetPassword = '$_apiBase/auth/password/reset';
  static const String changePassword = '$_apiBase/auth/change-password';

  // OTP & SMS verification endpoints (matching backend exactly)
  static const String sendOtp = '$_apiBase/auth/send-otp';
  static const String verifyOtp = '$_apiBase/auth/verify-otp';
  static const String resendOtp = '$_apiBase/auth/resend-otp';
  static const String verifyPhone = '$_apiBase/auth/verify-phone';
  
  // Social login endpoints
  static const String socialLogin = '$_apiBase/auth/social-login';

  // Email verification endpoint
  static const String verifyEmail = '$_apiBase/auth/verify-email';

  // Two-factor authentication endpoints
  static const String enable2FA = '$_apiBase/auth/2fa/enable';
  static const String disable2FA = '$_apiBase/auth/2fa/disable';
  static const String verify2FA = '$_apiBase/auth/2fa/verify';

  // OAuth endpoints
  static const String googleOAuth = '$_apiBase/auth/oauth/google';
  static const String appleOAuth = '$_apiBase/auth/oauth/apple';

  // Client/User endpoints (matching backend exactly)
  static const String searchRestaurants = '$_apiBase/client/restaurants/search';
  static const String getRestaurantDetails = '$_apiBase/client/restaurants/{restaurantId}';
  
  // Order management endpoints
  static const String createOrder = '$_apiBase/client/orders';
  static const String getUserOrders = '$_apiBase/client/orders/history';
  static const String trackOrder = '$_apiBase/client/orders/{id}/track';
  static const String getOrderTimeline = '$_apiBase/client/orders/{id}/timeline';
  static const String cancelOrder = '$_apiBase/client/orders/{id}/cancel';
  static const String rateOrder = '$_apiBase/client/orders/{orderId}/rate';
  
  // Cart endpoints
  static const String cart = '$_apiBase/client/cart';
  
  // Loyalty program endpoints
  static const String getLoyaltyStatus = '$_apiBase/client/loyalty/status';
  static const String redeemPoints = '$_apiBase/client/loyalty/redeem';
  
  // Favorites endpoints
  static const String toggleFavorite = '$_apiBase/client/favorites/toggle';
  static const String getFavorites = '$_apiBase/client/favorites';
  
  // Wallet endpoints (matching backend exactly)
  static const String getWallet = '$_apiBase/client/wallet';
  static const String getWalletTransactions = '$_apiBase/client/wallet/transactions';
  static const String topupWallet = '$_apiBase/client/wallet/topup';
  static const String withdrawFromWallet = '$_apiBase/client/wallet/withdraw';
  
  // Review endpoints
  static const String reviews = '$_apiBase/client/reviews';
  
  // Subscription endpoints
  static const String subscription = '$_apiBase/client/subscription';

  // Admin endpoints
  static const String adminDashboard = '$_apiBase/admin/dashboard';
  static const String adminUsers = '$_apiBase/admin/users';
  static const String adminRestaurants = '$_apiBase/admin/restaurants';
  static const String adminOrders = '$_apiBase/admin/orders';
  static const String adminReports = '$_apiBase/admin/reports';

  // Restaurant owner endpoints
  static const String ownerDashboard = '$_apiBase/owner/dashboard';
  static const String ownerRestaurant = '$_apiBase/owner/restaurant';
  static const String ownerMenu = '$_apiBase/owner/menu';
  static const String ownerOrders = '$_apiBase/owner/orders';
  static const String ownerReports = '$_apiBase/owner/reports';

  // Driver endpoints
  static const String driverProfile = '$_apiBase/driver/profile';
  static const String driverOrders = '$_apiBase/driver/orders';
  static const String driverAvailability = '$_apiBase/driver/availability';
  static const String driverEarnings = '$_apiBase/driver/earnings';

  // Utility methods
  /// Replace path parameters in endpoint URLs
  static String replacePath(String endpoint, Map<String, String> params) {
    String result = endpoint;
    params.forEach((key, value) {
      result = result.replaceAll('{$key}', value);
    });
    return result;
  }

  /// Build restaurant details endpoint
  static String buildRestaurantDetails(String restaurantId) =>
      replacePath(getRestaurantDetails, {'restaurantId': restaurantId});

  /// Build full order tracking endpoint
  static String getOrderTracking(String orderId) =>
      replacePath(trackOrder, {'id': orderId});

  /// Build full order rating endpoint
  static String getOrderRating(String orderId) =>
      replacePath(rateOrder, {'id': orderId});
}
