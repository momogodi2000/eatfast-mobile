/// Central Application Configuration
/// Single source of truth for all app settings, feature flags, and environment configs
class AppConfig {
  // App Information
  static const String appName = 'Eat Fast';
  static const String appVersion = '1.0.0';
  static const String environment =
      'development'; // 'development', 'staging', 'production'
  static const bool isProduction = false; // Set to true for production builds

  // Environment configuration
  static const bool useMockAPI = bool.fromEnvironment(
    'USE_MOCK_API',
    defaultValue: false,
  );
  static const bool useMockPayments = bool.fromEnvironment(
    'USE_MOCK_PAYMENTS',
    defaultValue: false,
  );
  static const bool enableDebugMode = bool.fromEnvironment(
    'DEBUG_MODE',
    defaultValue: true,
  );
  static const bool enableDebugLogging = true;
  static const bool enableMockData = false;

  // API Configuration
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://localhost:3000/api',
  );
  static const String apiBaseUrl = baseUrl;

  // Performance Configuration
  static const Duration apiRetryDelay = Duration(milliseconds: 800);
  static const Duration mockApiDelay = Duration(milliseconds: 500);
  static const int defaultItemsPerPage = 10;
  static const int maxCacheSize = 50 * 1024 * 1024; // 50MB
  static const Duration cacheTimeout = Duration(minutes: 5);
  static const Duration apiTimeout = Duration(seconds: 30);

  // Feature Flags - Production Ready
  static const bool enableBiometricAuth = true;
  static const bool enableLocationServices = true;
  static const bool enablePushNotifications = true;
  static const bool enableRealtimeTracking = true;
  static const bool enableWebSocketConnection = true;
  static const bool enableCrashReporting = true;

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

  // Logging and Analytics
  static const bool enableAPILogging = true;
  static const bool enableAnalytics = true;
  static const bool enablePerformanceMonitoring = true;
  static const bool enableErrorTracking = true;

  // Security Configuration
  static const bool enableTokenRefresh = true;
  static const bool enableBiometricLogin = true;
  static const Duration tokenRefreshThreshold = Duration(minutes: 5);

  // Localization
  static const List<String> supportedLanguages = ['en', 'fr'];
  static const String defaultLanguage = 'fr'; // Cameroon default

  // Cameroon specific configurations
  static const List<String> supportedCities = [
    'Yaoundé',
    'Douala',
    'Bafoussam',
    'Bamenda',
    'Autre',
  ];
  static const String defaultCity = 'Yaoundé';
  static const String countryCode = '+237';

  // Business Logic
  static const double defaultDeliveryFee = 1500.0; // FCFA
  static const double minimumOrderAmount = 2000.0; // FCFA
  static const int defaultDeliveryTime = 30; // minutes
  static const String currency = 'XAF';
  static const String currencySymbol = 'FCFA';
}
