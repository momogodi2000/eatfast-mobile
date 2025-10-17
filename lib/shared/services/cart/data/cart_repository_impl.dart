import 'dart:async';
import 'package:eatfast_mobile/shared/config/app_config.dart';
import 'package:eatfast_mobile/shared/utils/result.dart';
import 'package:eatfast_mobile/shared/constants/app_constants.dart';
import 'package:eatfast_mobile/shared/services/cart/domain/models/cart.dart';
import 'package:eatfast_mobile/shared/services/cart/domain/models/cart_item.dart';
import 'package:eatfast_mobile/shared/services/cart/domain/repositories/cart_repository.dart';
import 'package:eatfast_mobile/shared/services/restaurants/domain/models/menu_item.dart';

class CartRepositoryImpl implements CartRepository {
  // In-memory cart storage for mock implementation
  static Cart _currentCart = Cart(
    id: 'cart_1',
    userId: 'user_123',
    items: const [],
    subtotal: 0.0,
    deliveryFee: AppConstants.deliveryFee,
    tax: 0.0,
    discount: 0.0,
    total: 0.0,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
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
      return Result.failure('Erreur lors de la r�cup�ration du panier: ${e.toString()}');
    }
  }

  @override
  Future<Result<Cart, String>> addItem(CartItem item) async {
    try {
      await _simulateDelay();

      // Check if item with same configuration already exists
      final existingItemIndex = _currentCart.items.indexWhere((existingItem) =>
          existingItem.menuItemId == item.menuItemId &&
          _haveSameCustomizations(existingItem.customizations, item.customizations));

      if (existingItemIndex != -1) {
        // Update quantity of existing item
        final existingItem = _currentCart.items[existingItemIndex];
        final newQuantity = existingItem.quantity + item.quantity;
        final updatedItem = existingItem.copyWith(
          quantity: newQuantity,
          total: existingItem.price * newQuantity,
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
          restaurantId: item.restaurantId,
          restaurantName: item.restaurantName ?? 'Restaurant',
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
        return Result.failure('Article non trouv� dans le panier');
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
      return Result.failure('Erreur lors de la mise � jour: ${e.toString()}');
    }
  }

  @override
  Future<Result<Cart, String>> updateItemInstructions(String itemId, String? instructions) async {
    try {
      await _simulateDelay();

      final itemIndex = _currentCart.items.indexWhere((item) => item.id == itemId);
      if (itemIndex == -1) {
        return Result.failure('Article non trouv� dans le panier');
      }

      final updatedItems = List<CartItem>.from(_currentCart.items);
      final item = updatedItems[itemIndex];
      
      final updatedItem = item.copyWith(specialInstructions: instructions);
      updatedItems[itemIndex] = updatedItem;
      _currentCart = _currentCart.copyWith(items: updatedItems);

      return Result.success(_currentCart);
    } catch (e) {
      return Result.failure('Erreur lors de la mise � jour: ${e.toString()}');
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
      subtotal += item.total;
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

  bool _haveSameCustomizations(
    Map<String, dynamic>? customizations1,
    Map<String, dynamic>? customizations2,
  ) {
    if (customizations1 == null && customizations2 == null) {
      return true;
    }
    if (customizations1 == null || customizations2 == null) {
      return false;
    }
    // Simple comparison - in production, this should be more sophisticated
    return customizations1.toString() == customizations2.toString();
  }
}
