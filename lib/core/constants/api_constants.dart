class ApiConstants {
  // Base URL for API requests - using the provided render URL
  static const String baseUrl = 'https://eatfast-backend-api.onrender.com/api/v1';
  
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
  
  // Guest endpoints - matching backend exactly (public routes)
  static const String guestSession = '/public/guest/session';
  static const String guestRestaurants = '/public/restaurants';
  static const String guestMenu = '/public/restaurants/{id}/menu';
  static const String guestCart = '/public/guest/cart';
  static const String guestCartAdd = '/public/guest/cart/add';
  static const String guestCartItems = '/public/guest/cart/items';
  static const String guestInfo = '/public/guest/info';
  static const String guestOrders = '/public/guest/orders';
  
  // Client endpoints (authenticated users)
  static const String clientProfile = '/client/profile';
  static const String clientOrders = '/client/orders';
  static const String clientWallet = '/client/wallet';
  static const String clientLoyalty = '/client/loyalty';
  static const String clientReviews = '/client/reviews';
  static const String clientPaymentMethods = '/client/payment-methods';
  
  // Payment endpoints
  static const String createPaymentIntent = '/payments/create-intent';
  static const String confirmPayment = '/payments/confirm';
  static const String processMobilePayment = '/payments/mobile';
  static const String paymentStatus = '/payments/status';
  
  // Restaurant endpoints - matching backend exactly
  static const String restaurants = '/public/restaurants'; // Public restaurant browsing
  static const String restaurantDetails = '/public/restaurants/{id}'; // Fixed with ID parameter
  static const String restaurantMenu = '/public/restaurants/{id}/menu'; // Fixed with ID parameter
  
  // Order endpoints - matching backend exactly
  static const String orders = '/client/orders';
  static const String orderTracking = '/client/orders'; // + /{id}/track
  
  // Payment endpoints - matching backend exactly
  static const String payments = '/payments';
  static const String paymentMethods = '/client/payment-methods';
  static const String paymentCampayInitiate = '/payments/campay/initiate';
  static const String paymentCampayConfirm = '/payments/campay/confirm';
  static const String paymentNoupayInitiate = '/payments/noupay/initiate';
  static const String paymentNoupayConfirm = '/payments/noupay/confirm';
  static const String paymentStripeInitiate = '/payments/stripe/initiate';
  static const String paymentStripeConfirm = '/payments/stripe/confirm';
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
  
  // Shared endpoints - aligned with backend implementation
  static const String uploadFile = '/shared/upload';

  // Notification endpoints - backend uses nodemailer for email + WhatsApp Business API
  static const String notificationPreferences = '/mvp/notifications/preferences';
  static const String notificationHistory = '/mvp/notifications/history';
  static const String notificationRegisterPush = '/mvp/notifications/register-subscription';
  static const String notificationTest = '/mvp/notifications/test';
  static const String notificationMarkRead = '/mvp/notifications/{notificationId}/read';

  // WhatsApp Business API endpoints - directly from backend
  static const String whatsappOrderStatus = '/messaging/whatsapp/orders/{orderId}/status';
  static const String whatsappDeliveryLocation = '/messaging/whatsapp/deliveries/{deliveryId}/location';
  static const String whatsappOrderReceipt = '/messaging/whatsapp/orders/{orderId}/receipt';
  static const String whatsappUserLink = '/messaging/whatsapp/users/{userId}/link';
  static const String whatsappUserLanguage = '/messaging/whatsapp/users/{userId}/language';
  static const String whatsappUserStatus = '/messaging/whatsapp/users/{userId}/status';
  static const String whatsappCustomMessage = '/messaging/whatsapp/contacts/{contactId}/message';

  // Scheduled orders - from backend shared routes
  static const String scheduledOrderCreate = '/shared/scheduled-orders/create';
  static const String scheduledOrderList = '/shared/scheduled-orders/list';
  static const String scheduledOrderUpdate = '/shared/scheduled-orders/{orderId}';
  static const String scheduledOrderCancel = '/shared/scheduled-orders/{orderId}';

  // Loyalty program - from backend shared routes
  static const String loyaltyStatus = '/shared/mvp/loyalty/status';
  static const String loyaltyHistory = '/shared/mvp/loyalty/history';
  static const String loyaltyRedeem = '/shared/mvp/loyalty/redeem';
  static const String loyaltyConfig = '/shared/mvp/loyalty/config';
  static const String loyaltyDashboard = '/shared/mvp/loyalty/dashboard';

  // Social & Referral - from backend shared routes
  static const String socialReferralCreate = '/shared/mvp/social/referral/create';
  static const String socialReferralProcess = '/shared/mvp/social/referral/process';
  static const String socialShareCreate = '/shared/mvp/social/share/create';
  static const String socialShareClick = '/shared/mvp/social/share/{shareId}/click';
  static const String socialStats = '/shared/mvp/social/stats';
  static const String socialPlatforms = '/shared/mvp/social/platforms';

  static const String users = '/users';
  
  // Additional guest endpoints
  static const String guestOrderTracking = '/public/guest/orders/{id}/track';
  static const String guestDeliveryFee = '/public/guest/delivery-fee/{restaurantId}';
  static const String guestConvert = '/public/guest/orders/{id}/convert';
  
  // Utility method to replace path parameters
  static String replacePathParams(String endpoint, Map<String, String> params) {
    String result = endpoint;
    params.forEach((key, value) {
      result = result.replaceAll('{$key}', value);
    });
    return result;
  }
  
  // Socket.IO events - matching backend exactly
  static const String socketConnect = 'connect';
  static const String socketOrderUpdate = 'order_update';
  static const String socketLocationUpdate = 'location_update';
  static const String socketNotification = 'notification';
  static const String socketDriverStatus = 'driver_status_update';
  static const String socketRestaurantStatus = 'restaurant_status_update';
}
