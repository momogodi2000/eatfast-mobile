class AppConfig {
  // Environment configuration - Updated for production
  static const bool useMockAPI = bool.fromEnvironment('USE_MOCK_API', defaultValue: false);
  static const bool useMockPayments = bool.fromEnvironment('USE_MOCK_PAYMENTS', defaultValue: false);
  static const bool enableDebugMode = bool.fromEnvironment('DEBUG_MODE', defaultValue: true);
  
  // API Configuration - Local development
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://localhost:3000/api'
  );
  
  // Development Configuration (remove mock references for production)
  static const Duration apiRetryDelay = Duration(milliseconds: 800);
  static const Duration mockApiDelay = Duration(milliseconds: 500);
  static const int defaultItemsPerPage = 10;
  
  // Feature Flags - Updated for production readiness
  static const bool enableBiometricAuth = true;
  static const bool enableLocationServices = true;
  static const bool enablePushNotifications = true;
  static const bool enableRealtimeTracking = true; // Enabled for real-time updates
  static const bool enableWebSocketConnection = true; // Enable WebSocket for real-time features
  
  // Backend Feature Compatibility
  static const bool enableGuestOrders = true;
  static const bool enableLoyaltyProgram = true;
  static const bool enableTwoFactorAuth = true;
  static const bool enableSocialLogin = true;
  static const bool enableMultiplePaymentMethods = true;
  
  // Payment Configuration
  static const bool enableCamPayPayments = true;
  static const bool enableStripePayments = true;
  static const bool enableNouPayPayments = true;
  static const bool enableMobileMoneyPayments = true;
  static const bool enableWalletPayments = true;

  // CamPay Configuration
  static const String campayBaseUrl = String.fromEnvironment(
    'CAMPAY_BASE_URL',
    defaultValue: 'https://demo.campay.net/api',
  );
  static const String campayApiKey = String.fromEnvironment(
    'CAMPAY_API_KEY',
    defaultValue: '',
  );
  static const String campayApiSecret = String.fromEnvironment(
    'CAMPAY_API_SECRET',
    defaultValue: '',
  );
  static const String campayWebhookUrl = String.fromEnvironment(
    'CAMPAY_WEBHOOK_URL',
    defaultValue: 'http://localhost:3000/api/webhooks/campay',
  );
  static const String campayRedirectUrl = String.fromEnvironment(
    'CAMPAY_REDIRECT_URL',
    defaultValue: 'eatfast://payment/callback',
  );

  // NouPay Configuration
  static const String noupayBaseUrl = String.fromEnvironment(
    'NOUPAY_BASE_URL',
    defaultValue: 'https://api.noupay.com',
  );
  static const String noupayApiKey = String.fromEnvironment(
    'NOUPAY_API_KEY',
    defaultValue: '',
  );
  static const String noupayWebhookUrl = String.fromEnvironment(
    'NOUPAY_WEBHOOK_URL',
    defaultValue: 'http://localhost:3000/api/webhooks/noupay',
  );
  static const String noupayRedirectUrl = String.fromEnvironment(
    'NOUPAY_REDIRECT_URL',
    defaultValue: 'eatfast://payment/callback',
  );

  // Stripe Configuration
  static const String stripePublishableKey = String.fromEnvironment(
    'STRIPE_PUBLISHABLE_KEY',
    defaultValue: '',
  );
  static const String apiBaseUrl = baseUrl;
  
  // Performance Configuration
  static const int maxCacheSize = 50 * 1024 * 1024; // 50MB
  static const Duration cacheTimeout = Duration(hours: 1);
  static const Duration apiTimeout = Duration(seconds: 30);
  
  // Logging and Analytics
  static const bool enableAPILogging = true;
  static const bool enableAnalytics = true; // Enabled for production
  static const bool enablePerformanceMonitoring = true;
  static const bool enableErrorTracking = true;
  
  // Security Configuration
  static const bool enableTokenRefresh = true;
  static const bool enableBiometricLogin = true;
  static const Duration tokenRefreshThreshold = Duration(minutes: 5);
  
  // Localization
  static const List<String> supportedLanguages = ['en', 'fr'];
  static const String defaultLanguage = 'fr'; // Cameroon default
  
  // Camera/Geolocation specific configurations
  static const List<String> supportedCities = ['Yaoundé', 'Douala', 'Bafoussam', 'Bamenda', 'Autre'];
  static const String defaultCity = 'Yaoundé';
  static const String countryCode = '+237';
  
  // Business Logic
  static const double defaultDeliveryFee = 1500.0; // FCFA
  static const double minimumOrderAmount = 2000.0; // FCFA
  static const int defaultDeliveryTime = 30; // minutes
  static const String currency = 'XAF';
  static const String currencySymbol = 'FCFA';
}