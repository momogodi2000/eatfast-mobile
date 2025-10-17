import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eatfast_mobile/shared/models/menu_item.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  const factory Cart({
    required String id,
    required String userId,
    @Default([]) List<CartItem> items,
    @Default(0.0) double subtotal,
    @Default(0.0) double deliveryFee,
    @Default(0.0) double tax,
    @Default(0.0) double discount,
    @Default(0.0) double total,
    String? restaurantId,
    String? restaurantName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  const Cart._();

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);
  
  bool get isEmpty => items.isEmpty;
  
  bool get hasMultipleRestaurants {
    if (items.isEmpty) return false;
    final firstRestaurantId = items.first.menuItem.restaurantId;
    return items.any((item) => item.menuItem.restaurantId != firstRestaurantId);
  }
}

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required String id,
    required MenuItem menuItem,
    required int quantity,
    @Default([]) List<SelectedCustomization> customizations,
    String? specialInstructions,
    @Default(0.0) double itemTotal,
    DateTime? addedAt,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

  const CartItem._();

  double get basePrice => menuItem.price * quantity;
  
  double get customizationTotal {
    return customizations.fold(0.0, (total, customization) {
      return total + customization.options.fold(0.0, (optionTotal, option) {
        return optionTotal + option.additionalPrice;
      });
    }) * quantity;
  }
  
  double get totalPrice => basePrice + customizationTotal;
}

@freezed
class SelectedCustomization with _$SelectedCustomization {
  const factory SelectedCustomization({
    required String customizationId,
    required String customizationName,
    required List<CustomizationOption> options,
  }) = _SelectedCustomization;

  factory SelectedCustomization.fromJson(Map<String, dynamic> json) =>
      _$SelectedCustomizationFromJson(json);
}
