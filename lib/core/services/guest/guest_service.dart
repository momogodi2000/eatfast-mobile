import 'dart:async';
import 'package:logging/logging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../network/api_client.dart';
import '../../result.dart';
import '../../error/error_handler.dart';
import '../../error/app_error.dart';
import '../../../features/guest/domain/models/guest_models.dart';
import '../../../features/guest/domain/models/guest_cart_response.dart';

/// Service for handling guest user functionality (orders without registration)
class GuestService {
  final ApiClient _apiClient;
  final Logger _logger = Logger('GuestService');

  GuestService(this._apiClient);

  /// Get guest session ID
  Future<String?> getGuestSessionId() async {
    try {
      const storage = FlutterSecureStorage();
      return await storage.read(key: 'guest_session_id');
    } catch (e) {
      _logger.warning('Failed to get guest session ID', e);
      return null;
    }
  }

  /// Get guest cart
  Future<GuestCartResponse> getCart() async {
    try {
      final sessionId = await getGuestSessionId();
      if (sessionId == null) {
        return const GuestCartResponse(
          success: false,
          message: 'No guest session',
          items: [],
        );
      }

      final response = await _apiClient.get(
        '/public/guest/cart',
        queryParameters: {'sessionId': sessionId},
      );

      return GuestCartResponse.fromJson(response.data);
    } catch (e) {
      _logger.warning('Failed to get guest cart', e);
      return const GuestCartResponse(
        success: false,
        message: 'Failed to get cart',
        items: [],
      );
    }
  }

  /// Clear guest session data
  Future<void> clearGuestSession() async {
    try {
      const storage = FlutterSecureStorage();
      await storage.delete(key: 'guest_session_id');
      await storage.delete(key: 'guest_info');
      _logger.info('Guest session cleared');
    } catch (e) {
      _logger.warning('Failed to clear guest session', e);
    }
  }

  /// Create a guest order without user registration
  Future<Result<GuestOrderResponse, AppError>> createGuestOrder(
    GuestOrderRequest request,
  ) async {
    try {
      _logger.info('Creating guest order for ${request.guestName}');
      
      final response = await _apiClient.post(
        '/public/guest/orders', // Backend guest order endpoint
        data: request.toJson(),
      );

      final guestOrderResponse = GuestOrderResponse.fromJson(response.data);
      
      if (guestOrderResponse.success && guestOrderResponse.data != null) {
        _logger.info('Guest order created successfully: ${guestOrderResponse.data!.orderId}');
        return Result.success(guestOrderResponse);
      } else {
        final error = AppError.serverError(
          message: guestOrderResponse.error ?? 'Failed to create guest order',
          errorCode: 'GUEST_ORDER_CREATION_FAILED',
        );
        return Result.failure(error);
      }
    } catch (e, stackTrace) {
      _logger.severe('Failed to create guest order', e, stackTrace);
      final error = ErrorHandler.handleError(e, stackTrace);
      return Result.failure(error);
    }
  }

  /// Track a guest order using order ID and guest info
  Future<Result<GuestOrderTracking, AppError>> trackGuestOrder({
    required String orderId,
    required String guestPhone,
  }) async {
    try {
      _logger.info('Tracking guest order: $orderId');
      
      final response = await _apiClient.get(
        '/public/guest/orders/$orderId/track',
        queryParameters: {
          'phone': guestPhone,
        },
      );

      if (response.data['success'] == true && response.data['data'] != null) {
        final tracking = GuestOrderTracking.fromJson(response.data['data']);
        _logger.info('Guest order tracking retrieved: $orderId');
        return Result.success(tracking);
      } else {
        final error = AppError.notFoundError(
          message: response.data['error'] ?? 'Order not found',
          resource: 'guest_order',
        );
        return Result.failure(error);
      }
    } catch (e, stackTrace) {
      _logger.severe('Failed to track guest order: $orderId', e, stackTrace);
      final error = ErrorHandler.handleError(e, stackTrace);
      return Result.failure(error);
    }
  }

  /// Validate guest phone number format (Cameroon format)
  bool validateGuestPhone(String phone) {
    // Cameroon phone number format: +237[67]XXXXXXXX
    final phoneRegex = RegExp(r'^\+237[67]\d{8}$');
    return phoneRegex.hasMatch(phone);
  }

  /// Format phone number to Cameroon standard
  String formatPhoneNumber(String phone) {
    // Remove all non-digits
    final cleaned = phone.replaceAll(RegExp(r'[^0-9]'), '');
    
    // If it starts with 237, add +
    if (cleaned.startsWith('237') && cleaned.length == 11) {
      return '+$cleaned';
    }
    
    // If it starts with 6 or 7, add +237
    if ((cleaned.startsWith('6') || cleaned.startsWith('7')) && cleaned.length == 9) {
      return '+237$cleaned';
    }
    
    // Return original if can't format
    return phone;
  }

  /// Get available payment methods for guest orders
  List<GuestPaymentMethod> getAvailablePaymentMethods() {
    return [
      GuestPaymentMethod.cash,
      GuestPaymentMethod.campay, // Changed from creditCard to campay
      GuestPaymentMethod.mtnMoney,
      GuestPaymentMethod.orangeMoney,
    ];
  }
}

/// Guest order builder for easier order creation
class GuestOrderBuilder {
  String? _restaurantId;
  String? _guestName;
  String? _guestPhone;
  String? _guestEmail;
  String? _deliveryAddress;
  GuestOrderCoordinates? _coordinates;
  GuestPaymentMethod? _paymentMethod;
  String? _specialInstructions;
  DateTime? _scheduledDeliveryTime;
  final List<GuestOrderItem> _items = [];

  GuestOrderBuilder setRestaurant(String restaurantId) {
    _restaurantId = restaurantId;
    return this;
  }

  GuestOrderBuilder setGuest({
    required String name,
    required String phone,
    String? email,
  }) {
    _guestName = name;
    _guestPhone = phone;
    _guestEmail = email;
    return this;
  }

  GuestOrderBuilder setDeliveryAddress({
    required String address,
    required double lat,
    required double lng,
  }) {
    _deliveryAddress = address;
    _coordinates = GuestOrderCoordinates(lat: lat, lng: lng);
    return this;
  }

  GuestOrderBuilder addItem({
    required String menuId,
    required int quantity,
    String? customizations,
  }) {
    _items.add(GuestOrderItem(
      menuId: menuId,
      quantity: quantity,
      customizations: customizations,
    ));
    return this;
  }

  /// Build the guest order request
  GuestOrderRequest build() {
    if (_restaurantId == null ||
        _guestName == null ||
        _guestPhone == null ||
        _deliveryAddress == null ||
        _coordinates == null ||
        _items.isEmpty) {
      throw ArgumentError('Missing required fields for guest order');
    }

    return GuestOrderRequest(
      restaurantId: _restaurantId!,
      items: _items,
      deliveryAddress: _deliveryAddress!,
      deliveryCoordinates: _coordinates!,
      guestName: _guestName!,
      guestPhone: _guestPhone!,
      guestEmail: _guestEmail,
      paymentMethod: _paymentMethod?.name ?? 'cash',
      specialInstructions: _specialInstructions,
      scheduledDeliveryTime: _scheduledDeliveryTime,
    );
  }
}

/// Provider for the GuestService
final guestServiceProvider = Provider<GuestService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return GuestService(apiClient);
});