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
  static const String currentUser = '$_apiBase/auth/me';

  // Password management
  static const String requestPasswordReset = '$_apiBase/auth/forgot-password';
  static const String resetPassword = '$_apiBase/auth/reset-password';
  static const String changePassword = '$_apiBase/auth/change-password';

  // OTP & Verification
  static const String verifyOtp = '$_apiBase/auth/verify-otp';
  static const String resendOtp = '$_apiBase/auth/resend-otp';
  static const String verifyEmail = '$_apiBase/auth/verify-email';
  static const String verifyPhone = '$_apiBase/auth/verify-phone';

  // Social login
  static const String socialLogin = '$_apiBase/auth/social';

  // Client/User endpoints
  static const String clientProfile = '$_apiBase/client/profile';
  static const String clientAddresses = '$_apiBase/client/addresses';
  static const String clientOrders = '$_apiBase/client/orders';
  static const String clientCart = '$_apiBase/client/cart';
  static const String clientFavorites = '$_apiBase/client/favorite-restaurants';
  static const String clientLoyalty = '$_apiBase/client/loyalty';
  static const String clientWallet = '$_apiBase/client/wallet';
  static const String clientPaymentMethods = '$_apiBase/client/payment-methods';

  // Restaurant endpoints
  static const String restaurants = '$_apiBase/restaurants';
  static const String restaurantSearch = '$_apiBase/restaurants/search';
  static const String restaurantMenu = '$_apiBase/restaurants/{id}/menu';
  static const String restaurantReviews = '$_apiBase/restaurants/{id}/reviews';

  // Order endpoints
  static const String placeOrder = '$_apiBase/client/orders';
  static const String trackOrder = '$_apiBase/client/orders/{id}/track';
  static const String rateOrder = '$_apiBase/client/orders/{id}/rate';

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

  /// Build full restaurant menu endpoint
  static String getRestaurantMenu(String restaurantId) =>
      replacePath(restaurantMenu, {'id': restaurantId});

  /// Build full restaurant reviews endpoint  
  static String getRestaurantReviews(String restaurantId) =>
      replacePath(restaurantReviews, {'id': restaurantId});

  /// Build full order tracking endpoint
  static String getOrderTracking(String orderId) =>
      replacePath(trackOrder, {'id': orderId});

  /// Build full order rating endpoint
  static String getOrderRating(String orderId) =>
      replacePath(rateOrder, {'id': orderId});
}
