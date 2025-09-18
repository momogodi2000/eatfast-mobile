import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

/// Central service registry for all backend services providers
/// This file provides easy access to all services through Riverpod providers
class ServiceRegistry {
  // Note: Services are now accessed through Riverpod providers for proper dependency injection
  // Use the individual providers instead of static instances:
  // - apiClientProvider
  // - authServiceProvider  
  // - restaurantServiceProvider
  // - guestServiceProvider
  // - orderServiceProvider
  // - paymentServiceProvider
  // etc.
  
  /// Initialize all services that require setup
  static Future<void> initializeServices(WidgetRef ref) async {
    // Services are now initialized through Riverpod providers
    // WebSocket connection would be handled by WebSocketService when needed
    
    // Any other service initialization can go here
  }
  
  /// Clean up resources when app is closing
  static Future<void> cleanup(WidgetRef ref) async {
    // Services are managed by Riverpod, cleanup is handled automatically
    
    // Any other cleanup can go here
  }
}

/// Providers for all services - use these in your UI
/// 
/// Example usage:
/// ```dart
/// class MyWidget extends ConsumerWidget {
///   @override
///   Widget build(BuildContext context, WidgetRef ref) {
///     final authService = ref.read(authServiceProvider);
///     final restaurantService = ref.read(restaurantServiceProvider);
///     
///     return YourUI();
///   }
/// }
/// ```

// DEPRECATED: Service providers are now defined in their individual service files
// Use the following providers instead:
// - apiClientProvider (in ../../network/api_client.dart)
// - authServiceProvider (in ../services/auth/auth_service.dart)  
// - restaurantServiceProvider (in ../services/restaurant/restaurant_service.dart)
// - guestServiceProvider (in ../services/guest/guest_service.dart)
// etc.

/// Service status provider for monitoring backend connectivity
final serviceStatusProvider = StateNotifierProvider<ServiceStatusNotifier, ServiceStatus>((ref) {
  return ServiceStatusNotifier();
});

class ServiceStatusNotifier extends StateNotifier<ServiceStatus> {
  ServiceStatusNotifier() : super(const ServiceStatus());
  
  void updateApiStatus(bool isConnected) {
    state = state.copyWith(isApiConnected: isConnected);
  }
  
  void updateSocketStatus(bool isConnected) {
    state = state.copyWith(isSocketConnected: isConnected);
  }
  
  void updateLastSync(DateTime timestamp) {
    state = state.copyWith(lastSyncTime: timestamp);
  }
}

class ServiceStatus {
  final bool isApiConnected;
  final bool isSocketConnected;
  final DateTime? lastSyncTime;
  final String? lastError;
  
  const ServiceStatus({
    this.isApiConnected = false,
    this.isSocketConnected = false,
    this.lastSyncTime,
    this.lastError,
  });
  
  ServiceStatus copyWith({
    bool? isApiConnected,
    bool? isSocketConnected,
    DateTime? lastSyncTime,
    String? lastError,
  }) {
    return ServiceStatus(
      isApiConnected: isApiConnected ?? this.isApiConnected,
      isSocketConnected: isSocketConnected ?? this.isSocketConnected,
      lastSyncTime: lastSyncTime ?? this.lastSyncTime,
      lastError: lastError ?? this.lastError,
    );
  }
  
  bool get isFullyConnected => isApiConnected && isSocketConnected;
}

/// Migration helper to gradually replace mock data usage
class MockToServiceMigration {
  
  /// Replace mock restaurant data with real API calls
  static Future<void> migrateRestaurantData() async {
    // TODO: Update all restaurant list screens to use RestaurantService
    // TODO: Update restaurant detail screens to use RestaurantService  
    // TODO: Update menu screens to use RestaurantService
  }
  
  /// Replace mock order data with real API calls
  static Future<void> migrateOrderData() async {
    // TODO: Update order creation to use OrderService
    // TODO: Update order history to use OrderService
    // TODO: Update order tracking to use OrderService with real-time updates
  }
  
  /// Replace mock user data with real API calls  
  static Future<void> migrateUserData() async {
    // TODO: Update profile screens to use AuthService
    // TODO: Update authentication flows to use AuthService
  }
  
  /// Replace mock payment data with real API calls
  static Future<void> migratePaymentData() async {
    // TODO: Update wallet screens to use PaymentService
    // TODO: Update payment processing to use PaymentService
    // TODO: Update transaction history to use PaymentService
  }
}

/// Service health checker
class ServiceHealthChecker {
  static Future<Map<String, bool>> checkAllServices() async {
    final results = <String, bool>{};
    
    try {
      // TODO: Update to use Riverpod providers for health checking
      results['api'] = true; // Placeholder
      results['socket'] = true; // Placeholder  
      results['auth'] = true; // Placeholder
      
    } catch (e) {
      // Log error
      results['error'] = false;
    }
    
    return results;
  }
}

/// Development helper for testing services
class ServiceTestHelper {
  static final Logger _logger = Logger('ServiceTestHelper');
  
  /// Test guest user flow
  static Future<void> testGuestFlow() async {
    // TODO: Use guestServiceProvider with ProviderContainer for testing
    _logger.info('Guest flow test - TODO: Update to use Riverpod providers');
  }
  
  /// Test authenticated user flow
  static Future<void> testAuthFlow() async {
    // TODO: Use authServiceProvider with ProviderContainer for testing
    _logger.info('Auth flow test - TODO: Update to use Riverpod providers');
  }
  
  /// Test real-time features
  static Future<void> testRealtimeFeatures() async {
    // TODO: Use WebSocketService and orderServiceProvider for testing
    _logger.info('Real-time features test - TODO: Update to use Riverpod providers');
  }
}

/// Backend integration status tracker
enum IntegrationStatus {
  notStarted,
  inProgress, 
  completed,
  failed
}

class BackendIntegrationTracker {
  static const Map<String, IntegrationStatus> _integrationStatus = {
    // Core services
    'api_client': IntegrationStatus.completed,
    'auth_service': IntegrationStatus.completed,
    'websocket_service': IntegrationStatus.completed,
    
    // Feature services
    'guest_service': IntegrationStatus.completed,
    'restaurant_service': IntegrationStatus.completed, 
    'order_service': IntegrationStatus.completed,
    'payment_service': IntegrationStatus.completed,
    
    // Role services
    'admin_service': IntegrationStatus.completed,
    'driver_service': IntegrationStatus.completed,
    'restaurant_owner_service': IntegrationStatus.completed,
    
    // UI Integration (next phase)
    'auth_screens': IntegrationStatus.notStarted,
    'restaurant_screens': IntegrationStatus.notStarted,
    'order_screens': IntegrationStatus.notStarted,
    'payment_screens': IntegrationStatus.notStarted,
    'admin_screens': IntegrationStatus.notStarted,
    'driver_screens': IntegrationStatus.notStarted,
    'restaurant_owner_screens': IntegrationStatus.notStarted,
    
    // Data migration
    'mock_data_removal': IntegrationStatus.notStarted,
    'model_validation': IntegrationStatus.inProgress,
    'offline_caching': IntegrationStatus.notStarted,
    'error_handling': IntegrationStatus.inProgress,
  };
  
  static IntegrationStatus getStatus(String component) {
    return _integrationStatus[component] ?? IntegrationStatus.notStarted;
  }
  
  static Map<String, IntegrationStatus> getAllStatuses() {
    return Map.from(_integrationStatus);
  }
  
  static double getOverallProgress() {
    final completed = _integrationStatus.values
        .where((status) => status == IntegrationStatus.completed)
        .length;
    return completed / _integrationStatus.length;
  }
}
