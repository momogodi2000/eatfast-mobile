import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import '../../network/api_client.dart';
import '../guest/guest_service.dart';
import '../auth/auth_service.dart';
import '../../../features/auth/domain/models/register_request.dart';
import '../../../features/auth/domain/user.dart';

/// Service for managing guest to registered user conversion
class GuestMigrationService {
  final ApiClient _apiClient;
  final GuestService _guestService;
  final AuthService _authService;
  final Logger _logger = Logger('GuestMigrationService');
  
  GuestMigrationService({
    required ApiClient apiClient,
    required GuestService guestService,
    required AuthService authService,
  }) : _apiClient = apiClient,
       _guestService = guestService,
       _authService = authService;
  
  /// Check if user can convert from guest to registered
  Future<ConversionEligibility> checkConversionEligibility() async {
    try {
      final guestSessionId = await _guestService.getGuestSessionId();
      final hasGuestSession = guestSessionId != null;
      
      // Get guest cart to check for items
      final cartResponse = await _guestService.getCart();
      final hasCartItems = cartResponse.success && cartResponse.items.isNotEmpty;
      
      // Check for stored guest info
      const storage = FlutterSecureStorage();
      final hasGuestInfo = await storage.read(key: 'guest_info') != null;
      
      return ConversionEligibility(
        canConvert: hasGuestSession,
        hasCartItems: hasCartItems,
        hasPersonalInfo: hasGuestInfo,
        benefits: [
          'Keep your current cart items',
          'Save delivery addresses',
          'Track order history',
          'Get personalized recommendations',
          'Earn loyalty points',
          'Faster checkout in the future',
        ],
        incentives: ConversionIncentives(
          discountPercent: 10,
          freeDelivery: true,
          loyaltyPointsBonus: 500,
        ),
      );
    } catch (e) {
      return ConversionEligibility(
        canConvert: false,
        hasCartItems: false,
        hasPersonalInfo: false,
        benefits: [],
        incentives: ConversionIncentives(),
      );
    }
  }
  
  /// Convert guest user to registered user with data migration
  Future<ConversionResult> convertGuestToRegistered(RegisterRequest request) async {
    try {
      // Get current guest session data
      final guestSessionId = await _guestService.getGuestSessionId();
      if (guestSessionId == null) {
        return ConversionResult.failure('No guest session found');
      }
      
      // Get guest cart before conversion
      final cartResponse = await _guestService.getCart();
      final guestCartItems = cartResponse.success ? cartResponse.items : [];
      
      // Register the user
      final authResult = await _authService.register(
        email: request.email,
        password: request.password,
        firstName: request.firstName,
        lastName: request.lastName,
        phone: request.phone,
        city: request.city,
      );
      if (!authResult.isSuccess) {
        return ConversionResult.failure(authResult.error ?? 'Registration failed');
      }
      
      // Migrate guest data to registered user
      final migrationSuccess = await _migrateGuestData(guestSessionId, guestCartItems);
      
      // Clear guest session after successful migration
      if (migrationSuccess) {
        await _guestService.clearGuestSession();
      }
      
      // Note: AuthService register doesn't return user, would need to handle this properly
      // For now, registration is successful but user needs to login
      return ConversionResult.success(
        null, // User will need to login after registration
        migrationSuccess,
        guestCartItems.length,
      );
      
    } catch (e) {
      return ConversionResult.failure(_handleError(e));
    }
  }
  
  /// Migrate guest data to authenticated user account
  Future<bool> _migrateGuestData(String guestSessionId, List<dynamic> cartItems) async {
    try {
      // Call backend endpoint to migrate guest data
      final response = await _apiClient.post(
        '/client/migrate-guest-data',
        data: {
          'guestSessionId': guestSessionId,
          'cartItems': cartItems,
        },
      );
      
      return response.statusCode == 200;
    } catch (e) {
      // Return true even if migration fails - user is still registered
      _logger.warning('Guest data migration failed: $e');
      return false;
    }
  }
  
  /// Restore guest session (if user chooses not to register)
  Future<void> restoreGuestSession() async {
    // This can be used if user cancels registration
    // The guest session should still be active
  }
  
  /// Get conversion incentives from backend
  Future<ConversionIncentives> getConversionIncentives() async {
    try {
      final response = await _apiClient.get('/guest/conversion-incentives');
      
      if (response.statusCode == 200) {
        return ConversionIncentives.fromJson(response.data);
      }
      
      // Return default incentives if API call fails
      return ConversionIncentives(
        discountPercent: 10,
        freeDelivery: true,
        loyaltyPointsBonus: 500,
      );
    } catch (e) {
      return ConversionIncentives();
    }
  }
  
  String _handleError(dynamic error) {
    if (error.response != null) {
      final data = error.response.data;
      if (data is Map<String, dynamic> && data.containsKey('error')) {
        return data['error'];
      }
      return 'Server error: ${error.response.statusCode}';
    }
    return 'Network error occurred';
  }
}

// Models for guest conversion

class ConversionEligibility {
  final bool canConvert;
  final bool hasCartItems;
  final bool hasPersonalInfo;
  final List<String> benefits;
  final ConversionIncentives incentives;
  
  ConversionEligibility({
    required this.canConvert,
    required this.hasCartItems,
    required this.hasPersonalInfo,
    required this.benefits,
    required this.incentives,
  });
}

class ConversionIncentives {
  final double discountPercent;
  final bool freeDelivery;
  final int loyaltyPointsBonus;
  final String? promoCode;
  final DateTime? expiresAt;
  
  ConversionIncentives({
    this.discountPercent = 0,
    this.freeDelivery = false,
    this.loyaltyPointsBonus = 0,
    this.promoCode,
    this.expiresAt,
  });
  
  factory ConversionIncentives.fromJson(Map<String, dynamic> json) {
    return ConversionIncentives(
      discountPercent: json['discountPercent']?.toDouble() ?? 0.0,
      freeDelivery: json['freeDelivery'] ?? false,
      loyaltyPointsBonus: json['loyaltyPointsBonus'] ?? 0,
      promoCode: json['promoCode'],
      expiresAt: json['expiresAt'] != null 
          ? DateTime.parse(json['expiresAt']) 
          : null,
    );
  }
}

class ConversionResult {
  final bool isSuccess;
  final User? user;
  final bool dataMigrated;
  final int migratedItemsCount;
  final String? error;
  
  ConversionResult.success(this.user, this.dataMigrated, this.migratedItemsCount)
      : isSuccess = true,
        error = null;
        
  ConversionResult.failure(this.error)
      : isSuccess = false,
        user = null,
        dataMigrated = false,
        migratedItemsCount = 0;
}

// Provider for guest migration service
final guestMigrationServiceProvider = Provider<GuestMigrationService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final guestService = ref.watch(guestServiceProvider);
  final authService = ref.watch(authServiceProvider);
  
  return GuestMigrationService(
    apiClient: apiClient,
    guestService: guestService,
    authService: authService,
  );
});
