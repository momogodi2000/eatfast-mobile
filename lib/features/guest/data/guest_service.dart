/// Comprehensive Guest Service
/// Handles all guest user functionality including ordering, tracking, and conversion

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import '../../../core/services/api/api_client.dart';
import '../../../core/constants/api_constants.dart';
import '../domain/models/guest_models.dart';
import '../../../core/services/payment/unified_payment_service.dart';

class GuestService {
  static final GuestService _instance = GuestService._internal();
  factory GuestService() => _instance;

  final ApiClient _apiClient = ApiClient();
  final UnifiedPaymentService _paymentService = UnifiedPaymentService();

  GuestService._internal();

  /// Initialize guest session
  Future<String> initializeGuestSession() async {
    try {
      final response = await _apiClient.post(ApiConstants.guestSession);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['sessionId'] as String;
      } else {
        throw GuestException(
          'Failed to initialize guest session: ${response.statusMessage}',
          code: 'SESSION_INIT_FAILED',
        );
      }
    } on DioException catch (e) {
      throw GuestException(
        _handleDioError(e),
        code: 'NETWORK_ERROR',
      );
    } catch (e) {
      throw GuestException(
        'Unexpected error during session initialization: $e',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  /// Get available restaurants for guests
  Future<List<Map<String, dynamic>>> getRestaurants({
    String? city,
    double? latitude,
    double? longitude,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.guestRestaurants,
        queryParameters: {
          if (city != null) 'city': city,
          if (latitude != null) 'lat': latitude,
          if (longitude != null) 'lng': longitude,
        },
      );

      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.data['restaurants'] ?? []);
      } else {
        throw GuestException(
          'Failed to get restaurants: ${response.statusMessage}',
          code: 'RESTAURANTS_FETCH_FAILED',
        );
      }
    } on DioException catch (e) {
      throw GuestException(
        _handleDioError(e),
        code: 'NETWORK_ERROR',
      );
    }
  }

  /// Get restaurant menu for guests
  Future<List<Map<String, dynamic>>> getRestaurantMenu(String restaurantId) async {
    try {
      final menuUrl = ApiConstants.replacePathParams(
        ApiConstants.guestMenu,
        {'id': restaurantId},
      );

      final response = await _apiClient.get(menuUrl);

      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.data['menu'] ?? []);
      } else {
        throw GuestException(
          'Failed to get menu: ${response.statusMessage}',
          code: 'MENU_FETCH_FAILED',
        );
      }
    } on DioException catch (e) {
      throw GuestException(
        _handleDioError(e),
        code: 'NETWORK_ERROR',
      );
    }
  }

  /// Add item to guest cart
  Future<Map<String, dynamic>> addToCart({
    required String sessionId,
    required String restaurantId,
    required String menuId,
    required int quantity,
    String? customizations,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.guestCartAdd,
        data: {
          'sessionId': sessionId,
          'restaurantId': restaurantId,
          'menuId': menuId,
          'quantity': quantity,
          if (customizations != null) 'customizations': customizations,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data as Map<String, dynamic>;
      } else {
        throw GuestException(
          'Failed to add to cart: ${response.statusMessage}',
          code: 'ADD_TO_CART_FAILED',
        );
      }
    } on DioException catch (e) {
      throw GuestException(
        _handleDioError(e),
        code: 'NETWORK_ERROR',
      );
    }
  }

  /// Get guest cart contents
  Future<Map<String, dynamic>> getCartContents(String sessionId) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.guestCartItems,
        queryParameters: {'sessionId': sessionId},
      );

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        throw GuestException(
          'Failed to get cart: ${response.statusMessage}',
          code: 'CART_FETCH_FAILED',
        );
      }
    } on DioException catch (e) {
      throw GuestException(
        _handleDioError(e),
        code: 'NETWORK_ERROR',
      );
    }
  }

  /// Calculate delivery fee for guest order
  Future<double> calculateDeliveryFee({
    required String restaurantId,
    required double latitude,
    required double longitude,
  }) async {
    try {
      final feeUrl = ApiConstants.replacePathParams(
        ApiConstants.guestDeliveryFee,
        {'restaurantId': restaurantId},
      );

      final response = await _apiClient.get(
        feeUrl,
        queryParameters: {
          'lat': latitude,
          'lng': longitude,
        },
      );

      if (response.statusCode == 200) {
        return (response.data['deliveryFee'] as num).toDouble();
      } else {
        // Return default fee if calculation fails
        return 1500.0; // Default delivery fee
      }
    } catch (e) {
      debugPrint('Failed to calculate delivery fee: $e');
      return 1500.0; // Default delivery fee
    }
  }

  /// Place guest order with payment processing
  Future<GuestOrderResponse> placeOrder({
    required GuestOrderRequest orderRequest,
    required String sessionId,
  }) async {
    try {
      // First, create the order
      final orderResponse = await _apiClient.post(
        ApiConstants.guestOrders,
        data: {
          'sessionId': sessionId,
          ...orderRequest.toJson(),
        },
      );

      if (orderResponse.statusCode != 200 && orderResponse.statusCode != 201) {
        throw GuestException(
          'Failed to create order: ${orderResponse.statusMessage}',
          code: 'ORDER_CREATION_FAILED',
        );
      }

      final orderData = orderResponse.data;
      final orderId = orderData['orderId'] as String;

      // Process payment if not cash
      if (orderRequest.paymentMethod != 'cash') {
        try {
          final paymentMethod = _convertPaymentMethod(orderRequest.paymentMethod);

          final paymentResult = await _paymentService.processPayment(
            orderId: orderId,
            amount: orderData['totalAmount'] as double,
            method: paymentMethod,
            phoneNumber: orderRequest.guestPhone,
            currency: 'XAF',
            metadata: {
              'guestOrder': true,
              'sessionId': sessionId,
              'guestName': orderRequest.guestName,
            },
          );

          // Update order data with payment information
          orderData['paymentId'] = paymentResult.paymentId;
          orderData['paymentUrl'] = paymentResult.paymentUrl;
          orderData['paymentInstructions'] = paymentResult.instructions;
        } catch (paymentError) {
          debugPrint('Payment processing failed: $paymentError');
          // Don't fail the order, just mark payment as failed
          orderData['paymentError'] = paymentError.toString();
        }
      }

      return GuestOrderResponse.fromJson({
        'success': true,
        'message': 'Commande créée avec succès',
        'data': GuestOrderData.fromJson(orderData).toJson(),
      });

    } on DioException catch (e) {
      throw GuestException(
        _handleDioError(e),
        code: 'NETWORK_ERROR',
      );
    } catch (e) {
      if (e is GuestException) rethrow;
      throw GuestException(
        'Unexpected error during order placement: $e',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  /// Track guest order
  Future<GuestOrderTracking> trackOrder(String orderId) async {
    try {
      final trackingUrl = ApiConstants.replacePathParams(
        ApiConstants.guestOrderTracking,
        {'id': orderId},
      );

      final response = await _apiClient.get(trackingUrl);

      if (response.statusCode == 200) {
        return GuestOrderTracking.fromJson(response.data);
      } else {
        throw GuestException(
          'Failed to track order: ${response.statusMessage}',
          code: 'ORDER_TRACKING_FAILED',
        );
      }
    } on DioException catch (e) {
      throw GuestException(
        _handleDioError(e),
        code: 'NETWORK_ERROR',
      );
    }
  }

  /// Convert guest order to customer account
  Future<Map<String, dynamic>> convertGuestToCustomer({
    required String orderId,
    required String email,
    required String password,
    String? firstName,
    String? lastName,
  }) async {
    try {
      final convertUrl = ApiConstants.replacePathParams(
        ApiConstants.guestConvert,
        {'id': orderId},
      );

      final response = await _apiClient.post(
        convertUrl,
        data: {
          'email': email,
          'password': password,
          if (firstName != null) 'firstName': firstName,
          if (lastName != null) 'lastName': lastName,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data as Map<String, dynamic>;
      } else {
        throw GuestException(
          'Failed to convert guest account: ${response.statusMessage}',
          code: 'CONVERSION_FAILED',
        );
      }
    } on DioException catch (e) {
      throw GuestException(
        _handleDioError(e),
        code: 'NETWORK_ERROR',
      );
    }
  }

  /// Get guest order history (if available)
  Future<List<Map<String, dynamic>>> getGuestOrderHistory(String sessionId) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.guestOrders,
        queryParameters: {'sessionId': sessionId},
      );

      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.data['orders'] ?? []);
      } else {
        return []; // Return empty list if no orders
      }
    } catch (e) {
      debugPrint('Failed to get guest order history: $e');
      return []; // Return empty list on error
    }
  }

  /// Validate guest order requirements
  bool validateGuestOrder(GuestOrderRequest order) {
    // Check required fields
    if (order.guestName.trim().isEmpty) return false;
    if (order.guestPhone.trim().isEmpty) return false;
    if (order.deliveryAddress.trim().isEmpty) return false;
    if (order.items.isEmpty) return false;

    // Validate phone number format for Cameroon
    final phoneRegex = RegExp(r'^\+237[679]\d{8}$');
    if (!phoneRegex.hasMatch(order.guestPhone)) return false;

    // Validate email if provided
    if (order.guestEmail != null && order.guestEmail!.isNotEmpty) {
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
      if (!emailRegex.hasMatch(order.guestEmail!)) return false;
    }

    return true;
  }

  /// Convert payment method string to PaymentMethod enum
  PaymentMethod _convertPaymentMethod(String paymentMethod) {
    switch (paymentMethod.toLowerCase()) {
      case 'cash':
        return PaymentMethod.cash;
      case 'campay':
        return PaymentMethod.campay;
      case 'noupay':
      case 'nopia':
        return PaymentMethod.noupay;
      case 'stripe':
      case 'card':
        return PaymentMethod.stripe;
      case 'mtn':
      case 'mtn_money':
        return PaymentMethod.mtn;
      case 'orange':
      case 'orange_money':
        return PaymentMethod.orange;
      case 'wallet':
        return PaymentMethod.wallet;
      default:
        return PaymentMethod.cash;
    }
  }

  /// Handle Dio errors
  String _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Délai de connexion dépassé. Vérifiez votre connexion internet.';
      case DioExceptionType.sendTimeout:
        return 'Délai d\'envoi dépassé. Veuillez réessayer.';
      case DioExceptionType.receiveTimeout:
        return 'Délai de réception dépassé. Veuillez réessayer.';
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = e.response?.data['message'] ?? e.response?.statusMessage;
        return 'Erreur de requête ($statusCode): $message';
      case DioExceptionType.cancel:
        return 'Requête annulée.';
      case DioExceptionType.connectionError:
        return 'Erreur de connexion. Vérifiez votre connexion internet.';
      case DioExceptionType.unknown:
      default:
        return 'Une erreur inattendue s\'est produite: ${e.message}';
    }
  }
}

/// Guest service exception
class GuestException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;

  const GuestException(
    this.message, {
    this.code,
    this.originalError,
  });

  @override
  String toString() {
    return 'GuestException: $message${code != null ? ' (Code: $code)' : ''}';
  }
}