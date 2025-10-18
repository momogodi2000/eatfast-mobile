import 'package:eatfast_mobile/shared/utils/result.dart';
import 'package:eatfast_mobile/modules/client_module/providers/domain/models/cart.dart';

abstract class CartRepository {
  /// Get the current cart
  Future<Result<Cart, String>> getCart();

  /// Add an item to the cart
  Future<Result<Cart, String>> addItem(CartItem item);

  /// Remove an item from the cart
  Future<Result<Cart, String>> removeItem(String itemId);

  /// Update the quantity of an item in the cart
  Future<Result<Cart, String>> updateItemQuantity(String itemId, int quantity);

  /// Update special instructions for an item
  Future<Result<Cart, String>> updateItemInstructions(
    String itemId,
    String? instructions,
  );

  /// Clear all items from the cart
  Future<Result<Cart, String>> clearCart();

  /// Calculate cart totals
  Future<Result<Cart, String>> calculateTotals();
}
