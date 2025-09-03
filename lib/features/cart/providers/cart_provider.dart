import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/result.dart';
import '../domain/models/cart.dart';
import '../domain/repositories/cart_repository.dart';
import '../data/cart_repository_impl.dart';
import '../../restaurants/domain/models/menu_item.dart';

// Repository provider
final cartRepositoryProvider = Provider<CartRepository>((ref) {
  return CartRepositoryImpl();
});

// Cart provider
final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier(ref.watch(cartRepositoryProvider));
});

class CartNotifier extends StateNotifier<CartState> {
  final CartRepository _repository;

  CartNotifier(this._repository) : super(const CartState.initial()) {
    _loadCart();
  }

  Future<void> _loadCart() async {
    state = const CartState.loading();
    
    final result = await _repository.getCart();
    
    state = result.when(
      success: (cart) => CartState.loaded(cart),
      failure: (error) => CartState.error(error),
    );
  }

  Future<void> addItem(
    MenuItem menuItem, {
    int quantity = 1,
    List<SelectedCustomization> customizations = const [],
    String? specialInstructions,
  }) async {
    // Check if cart has items from different restaurants
    if (state is CartLoaded) {
      final currentCart = (state as CartLoaded).cart;
      if (currentCart.restaurantId != null && 
          currentCart.restaurantId != menuItem.restaurantId) {
        // Show dialog to clear cart or cancel
        state = CartState.conflictingRestaurant(
          currentRestaurantName: currentCart.restaurantName ?? 'Restaurant actuel',
          newRestaurantName: 'Nouveau restaurant',
          pendingItem: menuItem,
          pendingQuantity: quantity,
          pendingCustomizations: customizations,
          pendingInstructions: specialInstructions,
        );
        return;
      }
    }

    final cartItem = CartItem(
      id: '${menuItem.id}_${DateTime.now().millisecondsSinceEpoch}',
      menuItem: menuItem,
      quantity: quantity,
      customizations: customizations,
      specialInstructions: specialInstructions,
      itemTotal: _calculateItemTotal(menuItem, quantity, customizations),
      addedAt: DateTime.now(),
    );

    final result = await _repository.addItem(cartItem);
    
    result.when(
      success: (cart) => state = CartState.loaded(cart),
      failure: (error) => state = CartState.error(error),
    );
  }

  Future<void> removeItem(String itemId) async {
    final result = await _repository.removeItem(itemId);
    
    result.when(
      success: (cart) => state = CartState.loaded(cart),
      failure: (error) => state = CartState.error(error),
    );
  }

  Future<void> updateItemQuantity(String itemId, int quantity) async {
    if (quantity <= 0) {
      await removeItem(itemId);
      return;
    }

    final result = await _repository.updateItemQuantity(itemId, quantity);
    
    result.when(
      success: (cart) => state = CartState.loaded(cart),
      failure: (error) => state = CartState.error(error),
    );
  }

  Future<void> updateItemInstructions(String itemId, String? instructions) async {
    final result = await _repository.updateItemInstructions(itemId, instructions);
    
    result.when(
      success: (cart) => state = CartState.loaded(cart),
      failure: (error) => state = CartState.error(error),
    );
  }

  Future<void> clearCart() async {
    final result = await _repository.clearCart();
    
    result.when(
      success: (cart) => state = CartState.loaded(cart),
      failure: (error) => state = CartState.error(error),
    );
  }

  Future<void> clearAndAddItem(
    MenuItem menuItem, {
    int quantity = 1,
    List<SelectedCustomization> customizations = const [],
    String? specialInstructions,
  }) async {
    await clearCart();
    await addItem(
      menuItem,
      quantity: quantity,
      customizations: customizations,
      specialInstructions: specialInstructions,
    );
  }

  void dismissConflict() {
    if (state is CartConflictingRestaurant) {
      final currentState = state as CartConflictingRestaurant;
      // Restore the loaded state with the current cart
      _loadCart();
    }
  }

  double _calculateItemTotal(
    MenuItem menuItem, 
    int quantity, 
    List<SelectedCustomization> customizations,
  ) {
    double basePrice = menuItem.price * quantity;
    double customizationPrice = 0.0;
    
    for (final customization in customizations) {
      for (final option in customization.options) {
        customizationPrice += option.additionalPrice * quantity;
      }
    }
    
    return basePrice + customizationPrice;
  }
}

// Cart state
abstract class CartState {
  const CartState();

  const factory CartState.initial() = CartInitial;
  const factory CartState.loading() = CartLoading;
  const factory CartState.loaded(Cart cart) = CartLoaded;
  const factory CartState.error(String message) = CartError;
  const factory CartState.conflictingRestaurant({
    required String currentRestaurantName,
    required String newRestaurantName,
    required MenuItem pendingItem,
    required int pendingQuantity,
    required List<SelectedCustomization> pendingCustomizations,
    required String? pendingInstructions,
  }) = CartConflictingRestaurant;
}

class CartInitial extends CartState {
  const CartInitial();
}

class CartLoading extends CartState {
  const CartLoading();
}

class CartLoaded extends CartState {
  final Cart cart;
  const CartLoaded(this.cart);
}

class CartError extends CartState {
  final String message;
  const CartError(this.message);
}

class CartConflictingRestaurant extends CartState {
  final String currentRestaurantName;
  final String newRestaurantName;
  final MenuItem pendingItem;
  final int pendingQuantity;
  final List<SelectedCustomization> pendingCustomizations;
  final String? pendingInstructions;

  const CartConflictingRestaurant({
    required this.currentRestaurantName,
    required this.newRestaurantName,
    required this.pendingItem,
    required this.pendingQuantity,
    required this.pendingCustomizations,
    required this.pendingInstructions,
  });
}

// Convenience providers
final cartItemCountProvider = Provider<int>((ref) {
  final cartState = ref.watch(cartProvider);
  return switch (cartState) {
    CartLoaded(:final cart) => cart.itemCount,
    _ => 0,
  };
});

final cartTotalProvider = Provider<double>((ref) {
  final cartState = ref.watch(cartProvider);
  return switch (cartState) {
    CartLoaded(:final cart) => cart.total,
    _ => 0.0,
  };
});

final isCartEmptyProvider = Provider<bool>((ref) {
  final cartState = ref.watch(cartProvider);
  return switch (cartState) {
    CartLoaded(:final cart) => cart.isEmpty,
    _ => true,
  };
});