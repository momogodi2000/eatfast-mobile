import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/services/api/api_client_service.dart';
import '../../../../core/error/exceptions.dart';

/// Guest session service for managing temporary user sessions
/// Handles guest session creation, cart management, and order processing
class GuestSessionService {
  final ApiClientService _apiClient;
  final FlutterSecureStorage _secureStorage;

  static const String _guestSessionKey = 'guest_session_id';
  static const String _guestDataKey = 'guest_data';

  GuestSessionService(this._apiClient, this._secureStorage);

  /// Get or create a guest session
  Future<GuestSession> getOrCreateSession() async {
    try {
      // Check if we already have a guest session
      final existingSessionId = await _secureStorage.read(key: _guestSessionKey);
      if (existingSessionId != null) {
        final existingData = await _secureStorage.read(key: _guestDataKey);
        if (existingData != null) {
          final sessionData = jsonDecode(existingData) as Map<String, dynamic>;
          return GuestSession.fromJson(sessionData);
        }
      }

      // Create new guest session
      return await _createNewSession();
    } catch (e) {
      throw CacheException('Failed to get or create guest session: $e');
    }
  }

  /// Create a new guest session
  Future<GuestSession> _createNewSession() async {
    try {
      final response = await _apiClient.post(ApiConstants.guestSession);

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final session = GuestSession.fromJson(data['session'] as Map<String, dynamic>);

        // Store session locally
        await _secureStorage.write(key: _guestSessionKey, value: session.id);
        await _secureStorage.write(key: _guestDataKey, value: jsonEncode(session.toJson()));

        return session;
      } else {
        throw ServerException('Failed to create guest session: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw ServerException('Network error creating guest session: ${e.message}');
    } catch (e) {
      throw ServerException('Unexpected error creating guest session: $e');
    }
  }

  /// Get current guest session
  Future<GuestSession?> getCurrentSession() async {
    try {
      final sessionId = await _secureStorage.read(key: _guestSessionKey);
      if (sessionId == null) return null;

      final sessionData = await _secureStorage.read(key: _guestDataKey);
      if (sessionData == null) return null;

      final data = jsonDecode(sessionData) as Map<String, dynamic>;
      return GuestSession.fromJson(data);
    } catch (e) {
      return null;
    }
  }

  /// Update guest session data
  Future<void> updateSession(GuestSession session) async {
    try {
      await _secureStorage.write(key: _guestSessionKey, value: session.id);
      await _secureStorage.write(key: _guestDataKey, value: jsonEncode(session.toJson()));
    } catch (e) {
      throw CacheException('Failed to update guest session: $e');
    }
  }

  /// Add item to guest cart
  Future<GuestCart> addToCart({
    required String restaurantId,
    required String itemId,
    required int quantity,
    Map<String, dynamic>? options,
  }) async {
    try {
      final session = await getOrCreateSession();

      final requestData = {
        'guestSessionId': session.id,
        'restaurantId': restaurantId,
        'itemId': itemId,
        'quantity': quantity,
        if (options != null) 'options': options,
      };

      final response = await _apiClient.post(
        ApiConstants.guestCartAdd,
        data: requestData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;
        return GuestCart.fromJson(data['cart'] as Map<String, dynamic>);
      } else {
        throw ServerException('Failed to add item to cart: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw ServerException('Network error adding to cart: ${e.message}');
    } catch (e) {
      throw ServerException('Unexpected error adding to cart: $e');
    }
  }

  /// Get guest cart
  Future<GuestCart> getCart() async {
    try {
      final session = await getOrCreateSession();

      final response = await _apiClient.get(
        ApiConstants.guestCart,
        queryParameters: {'guestSessionId': session.id},
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return GuestCart.fromJson(data['cart'] as Map<String, dynamic>);
      } else {
        throw ServerException('Failed to get cart: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw ServerException('Network error getting cart: ${e.message}');
    } catch (e) {
      throw ServerException('Unexpected error getting cart: $e');
    }
  }

  /// Update cart item quantity
  Future<GuestCart> updateCartItem({
    required String itemId,
    required int quantity,
  }) async {
    try {
      final session = await getOrCreateSession();

      final requestData = {
        'guestSessionId': session.id,
        'itemId': itemId,
        'quantity': quantity,
      };

      final response = await _apiClient.put(
        ApiConstants.guestCartItems,
        data: requestData,
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return GuestCart.fromJson(data['cart'] as Map<String, dynamic>);
      } else {
        throw ServerException('Failed to update cart item: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw ServerException('Network error updating cart: ${e.message}');
    } catch (e) {
      throw ServerException('Unexpected error updating cart: $e');
    }
  }

  /// Clear guest session (logout equivalent)
  Future<void> clearSession() async {
    try {
      await _secureStorage.delete(key: _guestSessionKey);
      await _secureStorage.delete(key: _guestDataKey);
    } catch (e) {
      throw CacheException('Failed to clear guest session: $e');
    }
  }

}

/// Guest session model
class GuestSession {
  final String id;
  final DateTime createdAt;
  final DateTime expiresAt;
  final Map<String, dynamic> metadata;

  const GuestSession({
    required this.id,
    required this.createdAt,
    required this.expiresAt,
    this.metadata = const {},
  });

  factory GuestSession.fromJson(Map<String, dynamic> json) {
    return GuestSession(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>? ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'expiresAt': expiresAt.toIso8601String(),
      'metadata': metadata,
    };
  }

  bool get isExpired => DateTime.now().isAfter(expiresAt);
}

/// Guest cart model
class GuestCart {
  final String id;
  final String guestSessionId;
  final String? restaurantId;
  final List<GuestCartItem> items;
  final double subtotal;
  final double deliveryFee;
  final double tax;
  final double total;
  final DateTime updatedAt;

  const GuestCart({
    required this.id,
    required this.guestSessionId,
    this.restaurantId,
    this.items = const [],
    this.subtotal = 0.0,
    this.deliveryFee = 0.0,
    this.tax = 0.0,
    this.total = 0.0,
    required this.updatedAt,
  });

  factory GuestCart.fromJson(Map<String, dynamic> json) {
    return GuestCart(
      id: json['id'] as String,
      guestSessionId: json['guestSessionId'] as String,
      restaurantId: json['restaurantId'] as String?,
      items: (json['items'] as List<dynamic>? ?? [])
          .map((item) => GuestCartItem.fromJson(item as Map<String, dynamic>))
          .toList(),
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0.0,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0.0,
      tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'guestSessionId': guestSessionId,
      'restaurantId': restaurantId,
      'items': items.map((item) => item.toJson()).toList(),
      'subtotal': subtotal,
      'deliveryFee': deliveryFee,
      'tax': tax,
      'total': total,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);
  bool get isEmpty => items.isEmpty;
  bool get isNotEmpty => items.isNotEmpty;
}

/// Guest cart item model
class GuestCartItem {
  final String id;
  final String itemId;
  final String name;
  final double price;
  final int quantity;
  final Map<String, dynamic>? options;
  final double total;

  const GuestCartItem({
    required this.id,
    required this.itemId,
    required this.name,
    required this.price,
    required this.quantity,
    this.options,
    required this.total,
  });

  factory GuestCartItem.fromJson(Map<String, dynamic> json) {
    return GuestCartItem(
      id: json['id'] as String,
      itemId: json['itemId'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      options: json['options'] as Map<String, dynamic>?,
      total: (json['total'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'itemId': itemId,
      'name': name,
      'price': price,
      'quantity': quantity,
      'options': options,
      'total': total,
    };
  }
}