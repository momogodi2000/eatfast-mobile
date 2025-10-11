import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../core/services/api/api_client.dart';
import '../data/services/guest_session_service.dart';

/// Provider for guest session service
final guestSessionServiceProvider = Provider<GuestSessionService>((ref) {
  const storage = FlutterSecureStorage();
  final apiClient = ref.watch(apiClientProvider);
  return GuestSessionService(apiClient, storage);
});

/// State for guest session
class GuestSessionState {
  final GuestSession? session;
  final GuestCart? cart;
  final bool isLoading;
  final String? error;

  const GuestSessionState({
    this.session,
    this.cart,
    this.isLoading = false,
    this.error,
  });

  GuestSessionState copyWith({
    GuestSession? session,
    GuestCart? cart,
    bool? isLoading,
    String? error,
  }) {
    return GuestSessionState(
      session: session ?? this.session,
      cart: cart ?? this.cart,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  bool get hasActiveSession => session != null && !session!.isExpired;
  int get cartItemCount => cart?.itemCount ?? 0;
  double get cartTotal => cart?.total ?? 0.0;
  bool get hasItemsInCart => cart != null && cart!.isNotEmpty;
}

/// Guest session notifier
class GuestSessionNotifier extends StateNotifier<GuestSessionState> {
  final GuestSessionService _service;

  GuestSessionNotifier(this._service) : super(const GuestSessionState()) {
    _initializeSession();
  }

  /// Initialize guest session
  Future<void> _initializeSession() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final session = await _service.getOrCreateSession();
      state = state.copyWith(
        session: session,
        isLoading: false,
      );

      // Load cart if session exists
      await _loadCart();
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to initialize session: \$e',
        isLoading: false,
      );
    }
  }

  /// Load guest cart
  Future<void> _loadCart() async {
    if (!state.hasActiveSession) return;

    try {
      final cart = await _service.getCart();
      state = state.copyWith(cart: cart);
    } catch (e) {
      // Cart loading is not critical, continue without error
      state = state.copyWith(cart: null);
    }
  }

  /// Add item to cart
  Future<void> addToCart({
    required String restaurantId,
    required String itemId,
    required int quantity,
    Map<String, dynamic>? options,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final cart = await _service.addToCart(
        restaurantId: restaurantId,
        itemId: itemId,
        quantity: quantity,
        options: options,
      );

      state = state.copyWith(
        cart: cart,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to add item to cart: \$e',
        isLoading: false,
      );
    }
  }

  /// Update cart item quantity
  Future<void> updateCartItem({
    required String itemId,
    required int quantity,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final cart = await _service.updateCartItem(
        itemId: itemId,
        quantity: quantity,
      );

      state = state.copyWith(
        cart: cart,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to update cart item: \$e',
        isLoading: false,
      );
    }
  }

  /// Remove item from cart (set quantity to 0)
  Future<void> removeFromCart(String itemId) async {
    await updateCartItem(itemId: itemId, quantity: 0);
  }

  /// Refresh cart
  Future<void> refreshCart() async {
    await _loadCart();
  }

  /// Clear guest session
  Future<void> clearSession() async {
    try {
      await _service.clearSession();
      state = const GuestSessionState();
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to clear session: \$e',
      );
    }
  }

  /// Get or create session (for external use)
  Future<GuestSession?> ensureSession() async {
    if (state.hasActiveSession) {
      return state.session;
    }

    try {
      final session = await _service.getOrCreateSession();
      state = state.copyWith(session: session);
      return session;
    } catch (e) {
      state = state.copyWith(error: 'Failed to create session: \$e');
      return null;
    }
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// Provider for guest session management
final guestSessionProvider = StateNotifierProvider<GuestSessionNotifier, GuestSessionState>((ref) {
  final service = ref.watch(guestSessionServiceProvider);
  return GuestSessionNotifier(service);
});

/// Convenience providers
final guestCartProvider = Provider<GuestCart?>((ref) {
  final sessionState = ref.watch(guestSessionProvider);
  return sessionState.cart;
});

final guestCartItemCountProvider = Provider<int>((ref) {
  final sessionState = ref.watch(guestSessionProvider);
  return sessionState.cartItemCount;
});

final guestCartTotalProvider = Provider<double>((ref) {
  final sessionState = ref.watch(guestSessionProvider);
  return sessionState.cartTotal;
});

final hasGuestCartItemsProvider = Provider<bool>((ref) {
  final sessionState = ref.watch(guestSessionProvider);
  return sessionState.hasItemsInCart;
});