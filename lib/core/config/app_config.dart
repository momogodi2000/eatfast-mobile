class AppConfig {
  // Environment configuration
  static const bool useMockAPI = bool.fromEnvironment('USE_MOCK_API', defaultValue: true);
  static const bool useMockPayments = bool.fromEnvironment('USE_MOCK_PAYMENTS', defaultValue: true);
  static const bool enableDebugMode = bool.fromEnvironment('DEBUG_MODE', defaultValue: true);
  
  // API Configuration
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL', 
    defaultValue: 'https://api.eatfast.cm/v1'
  );
  
  // Mock Data Configuration
  static const Duration mockApiDelay = Duration(milliseconds: 800);
  static const int mockItemsPerPage = 10;
  
  // Feature Flags
  static const bool enableBiometricAuth = true;
  static const bool enableLocationServices = true;
  static const bool enablePushNotifications = true;
  static const bool enableRealtimeTracking = false; // Will be enabled in Phase 4
  
  // Performance Configuration
  static const int maxCacheSize = 50 * 1024 * 1024; // 50MB
  static const Duration cacheTimeout = Duration(hours: 1);
  
  // Logging
  static const bool enableAPILogging = true;
  static const bool enableAnalytics = false; // Will be enabled when analytics service is ready
}