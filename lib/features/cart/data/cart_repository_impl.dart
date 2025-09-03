import 'dart:async';
import '../../../core/config/app_config.dart';
import '../../../core/result.dart';
import '../../../core/constants/app_constants.dart';
import '../domain/models/cart.dart';
import '../domain/repositories/cart_repository.dart';
import '../../restaurants/domain/models/menu_item.dart';

class CartRepositoryImpl implements CartRepository {
  // In-memory cart storage for mock implementation
  static Cart _currentCart = const Cart(
    id: 'cart_1',
    userId: 'user_123',
    items: [],
    subtotal: 0.0,
    deliveryFee: AppConstants.deliveryFee,
    tax: 0.0,
    discount: 0.0,
    total: 0.0,
  );

  // Simulate network delay
  Future<void> _simulateDelay() async {
    if (AppConfig.useMockAPI) {
      await Future.delayed(AppConfig.mockApiDelay);
    }
  }

  @override
  Future<Result<Cart, String>> getCart() async {
    try {
      await _simulateDelay();
      return Result.success(_currentCart);
    } catch (e) {
      return Result.failure('Erreur lors de la récupération du panier: ${e.toString()}');
    }
  }

  @override
  Future<Result<Cart, String>> addItem(CartItem item) async {
    try {
      await _simulateDelay();

      // Check if item with same configuration already exists
      final existingItemIndex = _currentCart.items.indexWhere((existingItem) =>
          existingItem.menuItem.id == item.menuItem.id &&
          _haveSameCustomizations(existingItem.customizations, item.customizations));

      if (existingItemIndex != -1) {
        // Update quantity of existing item
        final existingItem = _currentCart.items[existingItemIndex];
        final updatedItem = existingItem.copyWith(
          quantity: existingItem.quantity + item.quantity,
          itemTotal: _calculateItemTotal(
            existingItem.menuItem,
            existingItem.quantity + item.quantity,
            existingItem.customizations,
          ),
        );

        final updatedItems = List<CartItem>.from(_currentCart.items);
        updatedItems[existingItemIndex] = updatedItem;

        _currentCart = _currentCart.copyWith(items: updatedItems);
      } else {
        // Add new item
        final updatedItems = List<CartItem>.from(_currentCart.items)..add(item);
        _currentCart = _currentCart.copyWith(items: updatedItems);
      }

      // Update restaurant info if this is the first item
      if (_currentCart.items.length == 1) {
        _currentCart = _currentCart.copyWith(
          restaurantId: item.menuItem.restaurantId,
          restaurantName: 'Restaurant', // In real app, get from restaurant data
        );
      }

      // Recalculate totals
      await _recalculateTotals();

      return Result.success(_currentCart);
    } catch (e) {
      return Result.failure('Erreur lors de l\'ajout au panier: ${e.toString()}');
    }
  }

  @override
  Future<Result<Cart, String>> removeItem(String itemId) async {
    try {
      await _simulateDelay();

      final updatedItems = _currentCart.items.where((item) => item.id != itemId).toList();
      _currentCart = _currentCart.copyWith(items: updatedItems);

      // Clear restaurant info if cart is empty
      if (_currentCart.items.isEmpty) {
        _currentCart = _currentCart.copyWith(
          restaurantId: null,
          restaurantName: null,
        );
      }

      await _recalculateTotals();

      return Result.success(_currentCart);
    } catch (e) {
      return Result.failure('Erreur lors de la suppression: ${e.toString()}');
    }
  }

  @override
  Future<Result<Cart, String>> updateItemQuantity(String itemId, int quantity) async {
    try {
      await _simulateDelay();

      final itemIndex = _currentCart.items.indexWhere((item) => item.id == itemId);
      if (itemIndex == -1) {
        return Result.failure('Article non trouvé dans le panier');
      }

      final updatedItems = List<CartItem>.from(_currentCart.items);
      final item = updatedItems[itemIndex];
      
      final updatedItem = item.copyWith(
        quantity: quantity,
        itemTotal: _calculateItemTotal(item.menuItem, quantity, item.customizations),
      );

      updatedItems[itemIndex] = updatedItem;
      _currentCart = _currentCart.copyWith(items: updatedItems);

      await _recalculateTotals();

      return Result.success(_currentCart);
    } catch (e) {
      return Result.failure('Erreur lors de la mise à jour: ${e.toString()}');
    }
  }

  @override
  Future<Result<Cart, String>> updateItemInstructions(String itemId, String? instructions) async {
    try {
      await _simulateDelay();

      final itemIndex = _currentCart.items.indexWhere((item) => item.id == itemId);
      if (itemIndex == -1) {
        return Result.failure('Article non trouvé dans le panier');
      }

      final updatedItems = List<CartItem>.from(_currentCart.items);
      final item = updatedItems[itemIndex];
      
      final updatedItem = item.copyWith(specialInstructions: instructions);
      updatedItems[itemIndex] = updatedItem;
      _currentCart = _currentCart.copyWith(items: updatedItems);

      return Result.success(_currentCart);
    } catch (e) {
      return Result.failure('Erreur lors de la mise à jour: ${e.toString()}');
    }
  }

  @override
  Future<Result<Cart, String>> clearCart() async {
    try {
      await _simulateDelay();

      _currentCart = _currentCart.copyWith(
        items: [],
        restaurantId: null,
        restaurantName: null,
        subtotal: 0.0,
        tax: 0.0,
        discount: 0.0,
        total: 0.0,
      );

      return Result.success(_currentCart);
    } catch (e) {
      return Result.failure('Erreur lors de la suppression du panier: ${e.toString()}');
    }
  }

  @override
  Future<Result<Cart, String>> calculateTotals() async {
    try {
      await _recalculateTotals();
      return Result.success(_currentCart);
    } catch (e) {
      return Result.failure('Erreur lors du calcul: ${e.toString()}');
    }
  }

  Future<void> _recalculateTotals() async {
    double subtotal = 0.0;
    
    for (final item in _currentCart.items) {
      subtotal += item.totalPrice;
    }

    // Calculate tax (10% in Cameroon)
    final double tax = subtotal * 0.1;
    
    // Delivery fee (free delivery if order is above minimum)
    final double deliveryFee = subtotal >= AppConstants.minimumOrderAmount 
        ? 0.0 
        : AppConstants.deliveryFee;
    
    // Apply any discounts (mock implementation)
    final double discount = 0.0;
    
    // Calculate total
    final double total = subtotal + tax + deliveryFee - discount;

    _currentCart = _currentCart.copyWith(
      subtotal: subtotal,
      deliveryFee: deliveryFee,
      tax: tax,
      discount: discount,
      total: total,
      updatedAt: DateTime.now(),
    );
  }

  double _calculateItemTotal(
    MenuItem menuItem,
    int quantity,
    List<SelectedCustomization> customizations,
  ) {
    final double basePrice = menuItem.price * quantity;
    double customizationPrice = 0.0;

    for (final customization in customizations) {
      for (final option in customization.options) {
        customizationPrice += option.additionalPrice * quantity;
      }
    }

    return basePrice + customizationPrice;
  }

  bool _haveSameCustomizations(
    List<SelectedCustomization> customizations1,
    List<SelectedCustomization> customizations2,
  ) {
    if (customizations1.length != customizations2.length) {
      return false;
    }

    for (int i = 0; i < customizations1.length; i++) {
      final custom1 = customizations1[i];
      final custom2 = customizations2[i];

      if (custom1.customizationId != custom2.customizationId ||
          custom1.options.length != custom2.options.length) {
        return false;
      }

      for (int j = 0; j < custom1.options.length; j++) {
        if (custom1.options[j].id != custom2.options[j].id) {
          return false;
        }
      }
    }

    return true;
  }
}