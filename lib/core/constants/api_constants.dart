class ApiConstants {
  // Backend URL - using the provided render URL
  static const String baseUrl = 'https://eat-fast-backend-express-js.onrender.com/api';
  
  // API Versions
  static const String apiV1 = '/v1';
  
  // Timeout configurations
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);
  
  // Auth endpoints - matching backend exactly
  static const String authLogin = '/auth/login';
  static const String authRegister = '/auth/register';
  static const String authRefresh = '/auth/refresh';
  static const String authLogout = '/auth/logout';
  static const String authRevoke = '/auth/revoke';
  static const String authForgotPassword = '/auth/password/reset-request';
  static const String authVerifyResetCode = '/auth/password/verify-code';
  static const String authResetPassword = '/auth/password/reset';
  static const String authSendOtp = '/auth/send-otp';
  static const String authVerifyOtp = '/auth/verify-otp';
  static const String authResendOtp = '/auth/resend-otp';
  static const String authVerifyTwoFactor = '/auth/verify-2fa';
  static const String authMe = '/auth/me';
  
  // OAuth endpoints
  static const String oauthGoogle = '/oauth/google';
  static const String oauthApple = '/oauth/apple';
  
  // Guest endpoints - matching backend exactly
  static const String guestSession = '/guest/session';
  static const String guestRestaurants = '/guest/restaurants';
  static const String guestMenu = '/guest/restaurants'; // + /{id}/menu
  static const String guestCart = '/guest/cart';
  static const String guestCartAdd = '/guest/cart/add';
  static const String guestCartItems = '/guest/cart/items';
  static const String guestInfo = '/guest/info';
  static const String guestOrders = '/guest/orders';
  
  // Client endpoints (authenticated users)
  static const String clientProfile = '/client/profile';
  static const String clientOrders = '/client/orders';
  static const String clientWallet = '/client/wallet';
  static const String clientLoyalty = '/client/loyalty';
  static const String clientReviews = '/client/reviews';
  static const String clientPaymentMethods = '/client/payment-methods';
  
  // Restaurant endpoints - matching backend exactly
  static const String restaurants = '/public/restaurants'; // Public restaurant browsing
  static const String restaurantDetails = '/public/restaurants'; // + /{id}
  static const String restaurantMenu = '/public/restaurants'; // + /{id}/menu
  
  // Order endpoints - matching backend exactly
  static const String orders = '/client/orders';
  static const String orderTracking = '/client/orders'; // + /{id}/track
  
  // Payment endpoints - matching backend exactly
  static const String payments = '/payments';
  static const String paymentMethods = '/client/payment-methods';
  static const String paymentCampayInitiate = '/payments/campay/initiate';
  static const String paymentCampayConfirm = '/payments/campay/confirm';
  static const String paymentStatus = '/payments/status';
  static const String createPaymentIntent = '/payments/intent';
  static const String confirmPayment = '/payments/confirm';
  static const String wallet = '/client/wallet';
  
  // Driver endpoints - matching backend exactly
  static const String driverProfile = '/driver/profile';
  static const String driverOrders = '/driver/orders';
  static const String driverLocation = '/driver/location';
  static const String driverEarnings = '/driver/earnings';
  
  // Restaurant Owner endpoints - matching backend exactly
  static const String restaurantOwnerProfile = '/restaurant/profile';
  static const String restaurantOwnerMenu = '/restaurant/menu';
  static const String restaurantOwnerOrders = '/restaurant/orders';
  static const String restaurantOwnerAnalytics = '/restaurant/analytics';
  
  // Admin endpoints - matching backend exactly
  static const String adminDashboard = '/admin/dashboard';
  static const String adminUsers = '/admin/users';
  static const String adminRestaurants = '/admin/restaurants';
  static const String adminOrders = '/admin/orders';
  static const String adminAnalytics = '/admin/analytics';
  static const String adminWhatsapp = '/admin/whatsapp';
  static const String adminMarketing = '/admin/marketing';
  
  // Public endpoints - matching backend exactly
  static const String publicContact = '/public/contact';
  static const String publicNewsletter = '/public/newsletter';
  static const String publicStats = '/public/stats';
  static const String publicHealth = '/public/health';
  
  // Shared endpoints
  static const String uploadFile = '/shared/upload';
  static const String notifications = '/shared/notifications';
  static const String users = '/users';
  
  // Socket.IO events - matching backend exactly
  static const String socketConnect = 'connect';
  static const String socketOrderUpdate = 'order_update';
  static const String socketLocationUpdate = 'location_update';
  static const String socketNotification = 'notification';
  static const String socketDriverStatus = 'driver_status_update';
  static const String socketRestaurantStatus = 'restaurant_status_update';
}
