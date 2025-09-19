import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/features/cart/domain/models/cart.dart';

// Mock Cart models and provider for testing
class CartItem {
  final String id;
  final String menuItemId;
  final String name;
  final double price;
  final int quantity;
  final String? specialInstructions;

  const CartItem({
    required this.id,
    required this.menuItemId,
    required this.name,
    required this.price,
    required this.quantity,
    this.specialInstructions,
  });

  CartItem copyWith({
    String? id,
    String? menuItemId,
    String? name,
    double? price,
    int? quantity,
    String? specialInstructions,
  }) {
    return CartItem(
      id: id ?? this.id,
      menuItemId: menuItemId ?? this.menuItemId,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      specialInstructions: specialInstructions ?? this.specialInstructions,
    );
  }

  double get total => price * quantity;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          menuItemId == other.menuItemId &&
          name == other.name &&
          price == other.price &&
          quantity == other.quantity &&
          specialInstructions == other.specialInstructions;

  @override
  int get hashCode =>
      id.hashCode ^
      menuItemId.hashCode ^
      name.hashCode ^
      price.hashCode ^
      quantity.hashCode ^
      specialInstructions.hashCode;
}

class CartState {
  final List<CartItem> items;
  final String? restaurantId;
  final String? restaurantName;
  final double deliveryFee;
  final double tax;
  final double discount;

  const CartState({
    this.items = const [],
    this.restaurantId,
    this.restaurantName,
    this.deliveryFee = 0.0,
    this.tax = 0.0,
    this.discount = 0.0,
  });

  CartState copyWith({
    List<CartItem>? items,
    String? restaurantId,
    String? restaurantName,
    double? deliveryFee,
    double? tax,
    double? discount,
  }) {
    return CartState(
      items: items ?? this.items,
      restaurantId: restaurantId ?? this.restaurantId,
      restaurantName: restaurantName ?? this.restaurantName,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      tax: tax ?? this.tax,
      discount: discount ?? this.discount,
    );
  }

  // Calculated properties
  double get subtotal => items.fold(0.0, (sum, item) => sum + item.total);

  double get total => subtotal + deliveryFee + tax - discount;

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);

  bool get isEmpty => items.isEmpty;

  bool get isNotEmpty => items.isNotEmpty;

  // Check if cart contains items from a specific restaurant
  bool get hasRestaurant => restaurantId != null;

  bool canAddItemFromRestaurant(String newRestaurantId) {
    return isEmpty || restaurantId == newRestaurantId;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartState &&
          runtimeType == other.runtimeType &&
          const ListEquality().equals(items, other.items) &&
          restaurantId == other.restaurantId &&
          restaurantName == other.restaurantName &&
          deliveryFee == other.deliveryFee &&
          tax == other.tax &&
          discount == other.discount;

  @override
  int get hashCode =>
      const ListEquality().hash(items) ^
      restaurantId.hashCode ^
      restaurantName.hashCode ^
      deliveryFee.hashCode ^
      tax.hashCode ^
      discount.hashCode;
}

// Helper class for list comparison
class ListEquality<T> {
  const ListEquality();

  bool equals(List<T>? list1, List<T>? list2) {
    if (identical(list1, list2)) return true;
    if (list1 == null || list2 == null) return false;
    if (list1.length != list2.length) return false;

    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) return false;
    }
    return true;
  }

  int hash(List<T>? list) {
    if (list == null) return 0;
    int hash = 0;
    for (final item in list) {
      hash ^= item.hashCode;
    }
    return hash;
  }
}

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(const CartState());

  void addItem({
    required String menuItemId,
    required String name,
    required double price,
    required String restaurantId,
    required String restaurantName,
    String? specialInstructions,
  }) {
    // Check if cart can accept items from this restaurant
    if (!state.canAddItemFromRestaurant(restaurantId)) {
      throw Exception('Cannot add items from different restaurants');
    }

    // Check if item already exists
    final existingItemIndex = state.items.indexWhere(
      (item) => item.menuItemId == menuItemId &&
                item.specialInstructions == specialInstructions,
    );

    if (existingItemIndex != -1) {
      // Update quantity of existing item
      final existingItem = state.items[existingItemIndex];
      final updatedItem = existingItem.copyWith(
        quantity: existingItem.quantity + 1,
      );

      final updatedItems = List<CartItem>.from(state.items);
      updatedItems[existingItemIndex] = updatedItem;

      state = state.copyWith(items: updatedItems);
    } else {
      // Add new item
      final newItem = CartItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        menuItemId: menuItemId,
        name: name,
        price: price,
        quantity: 1,
        specialInstructions: specialInstructions,
      );

      state = state.copyWith(
        items: [...state.items, newItem],
        restaurantId: restaurantId,
        restaurantName: restaurantName,
      );
    }
  }

  void removeItem(String itemId) {
    final updatedItems = state.items.where((item) => item.id != itemId).toList();

    state = state.copyWith(
      items: updatedItems,
      restaurantId: updatedItems.isEmpty ? null : state.restaurantId,
      restaurantName: updatedItems.isEmpty ? null : state.restaurantName,
    );
  }

  void updateItemQuantity(String itemId, int newQuantity) {
    if (newQuantity <= 0) {
      removeItem(itemId);
      return;
    }

    final updatedItems = state.items.map((item) {
      if (item.id == itemId) {
        return item.copyWith(quantity: newQuantity);
      }
      return item;
    }).toList();

    state = state.copyWith(items: updatedItems);
  }

  void updateItemInstructions(String itemId, String? instructions) {
    final updatedItems = state.items.map((item) {
      if (item.id == itemId) {
        return item.copyWith(specialInstructions: instructions);
      }
      return item;
    }).toList();

    state = state.copyWith(items: updatedItems);
  }

  void clearCart() {
    state = const CartState();
  }

  void updateDeliveryFee(double fee) {
    state = state.copyWith(deliveryFee: fee);
  }

  void updateTax(double taxAmount) {
    state = state.copyWith(tax: taxAmount);
  }

  void applyDiscount(double discountAmount) {
    state = state.copyWith(discount: discountAmount);
  }

  void removeDiscount() {
    state = state.copyWith(discount: 0.0);
  }

  CartItem? getItem(String itemId) {
    try {
      return state.items.firstWhere((item) => item.id == itemId);
    } catch (e) {
      return null;
    }
  }

  int getItemQuantity(String menuItemId) {
    return state.items
        .where((item) => item.menuItemId == menuItemId)
        .fold(0, (sum, item) => sum + item.quantity);
  }

  bool hasItem(String menuItemId) {
    return state.items.any((item) => item.menuItemId == menuItemId);
  }
}

void main() {
  group('CartProvider Tests', () {
    late CartNotifier cartNotifier;

    setUp(() {
      cartNotifier = CartNotifier();
    });

    group('CartState', () {
      test('should create initial state correctly', () {
        // Arrange & Act
        const state = CartState();

        // Assert
        expect(state.items, isEmpty);
        expect(state.restaurantId, isNull);
        expect(state.restaurantName, isNull);
        expect(state.deliveryFee, equals(0.0));
        expect(state.tax, equals(0.0));
        expect(state.discount, equals(0.0));
        expect(state.subtotal, equals(0.0));
        expect(state.total, equals(0.0));
        expect(state.itemCount, equals(0));
        expect(state.isEmpty, isTrue);
        expect(state.isNotEmpty, isFalse);
        expect(state.hasRestaurant, isFalse);
      });

      test('should calculate subtotal correctly', () {
        // Arrange
        final items = [
          const CartItem(
            id: '1',
            menuItemId: 'menu-1',
            name: 'Pizza',
            price: 15.99,
            quantity: 2,
          ),
          const CartItem(
            id: '2',
            menuItemId: 'menu-2',
            name: 'Salad',
            price: 8.50,
            quantity: 1,
          ),
        ];

        // Act
        final state = CartState(items: items);

        // Assert
        expect(state.subtotal, equals(40.48)); // (15.99 * 2) + (8.50 * 1)
        expect(state.itemCount, equals(3)); // 2 + 1
        expect(state.isNotEmpty, isTrue);
      });

      test('should calculate total with fees and discounts', () {
        // Arrange
        final items = [
          const CartItem(
            id: '1',
            menuItemId: 'menu-1',
            name: 'Pizza',
            price: 20.00,
            quantity: 1,
          ),
        ];

        // Act
        final state = CartState(
          items: items,
          deliveryFee: 2.99,
          tax: 1.60,
          discount: 5.00,
        );

        // Assert
        expect(state.subtotal, equals(20.00));
        expect(state.total, equals(19.59)); // 20.00 + 2.99 + 1.60 - 5.00
      });

      test('should check restaurant compatibility', () {
        // Arrange
        const emptyState = CartState();
        final stateWithRestaurant = CartState(
          restaurantId: 'restaurant-1',
          items: [
            const CartItem(
              id: '1',
              menuItemId: 'menu-1',
              name: 'Pizza',
              price: 15.99,
              quantity: 1,
            ),
          ],
        );

        // Assert
        expect(emptyState.canAddItemFromRestaurant('restaurant-1'), isTrue);
        expect(emptyState.canAddItemFromRestaurant('restaurant-2'), isTrue);

        expect(stateWithRestaurant.canAddItemFromRestaurant('restaurant-1'), isTrue);
        expect(stateWithRestaurant.canAddItemFromRestaurant('restaurant-2'), isFalse);
      });

      test('should copy state with new values', () {
        // Arrange
        const originalState = CartState(deliveryFee: 2.99);

        // Act
        final newState = originalState.copyWith(
          tax: 1.60,
          discount: 5.00,
        );

        // Assert
        expect(newState.deliveryFee, equals(2.99)); // Should remain unchanged
        expect(newState.tax, equals(1.60));
        expect(newState.discount, equals(5.00));
      });
    });

    group('CartItem', () {
      test('should create cart item correctly', () {
        // Arrange & Act
        const item = CartItem(
          id: '1',
          menuItemId: 'menu-1',
          name: 'Margherita Pizza',
          price: 15.99,
          quantity: 2,
          specialInstructions: 'Extra cheese',
        );

        // Assert
        expect(item.id, equals('1'));
        expect(item.menuItemId, equals('menu-1'));
        expect(item.name, equals('Margherita Pizza'));
        expect(item.price, equals(15.99));
        expect(item.quantity, equals(2));
        expect(item.specialInstructions, equals('Extra cheese'));
        expect(item.total, equals(31.98));
      });

      test('should copy item with new values', () {
        // Arrange
        const originalItem = CartItem(
          id: '1',
          menuItemId: 'menu-1',
          name: 'Pizza',
          price: 15.99,
          quantity: 1,
        );

        // Act
        final updatedItem = originalItem.copyWith(
          quantity: 3,
          specialInstructions: 'No onions',
        );

        // Assert
        expect(updatedItem.id, equals('1')); // Should remain unchanged
        expect(updatedItem.name, equals('Pizza')); // Should remain unchanged
        expect(updatedItem.quantity, equals(3));
        expect(updatedItem.specialInstructions, equals('No onions'));
        expect(updatedItem.total, equals(47.97)); // 15.99 * 3
      });

      test('should compare items correctly', () {
        // Arrange
        const item1 = CartItem(
          id: '1',
          menuItemId: 'menu-1',
          name: 'Pizza',
          price: 15.99,
          quantity: 2,
        );

        const item2 = CartItem(
          id: '1',
          menuItemId: 'menu-1',
          name: 'Pizza',
          price: 15.99,
          quantity: 2,
        );

        const item3 = CartItem(
          id: '2',
          menuItemId: 'menu-2',
          name: 'Salad',
          price: 8.50,
          quantity: 1,
        );

        // Assert
        expect(item1, equals(item2));
        expect(item1, isNot(equals(item3)));
        expect(item1.hashCode, equals(item2.hashCode));
      });
    });

    group('CartNotifier', () {
      test('should have initial empty state', () {
        // Assert
        expect(cartNotifier.state.isEmpty, isTrue);
        expect(cartNotifier.state.restaurantId, isNull);
        expect(cartNotifier.state.itemCount, equals(0));
        expect(cartNotifier.state.total, equals(0.0));
      });

      test('should add item to empty cart', () {
        // Act
        cartNotifier.addItem(
          menuItemId: 'menu-1',
          name: 'Margherita Pizza',
          price: 15.99,
          restaurantId: 'restaurant-1',
          restaurantName: 'Pizza Palace',
        );

        // Assert
        expect(cartNotifier.state.items, hasLength(1));
        expect(cartNotifier.state.restaurantId, equals('restaurant-1'));
        expect(cartNotifier.state.restaurantName, equals('Pizza Palace'));
        expect(cartNotifier.state.itemCount, equals(1));
        expect(cartNotifier.state.subtotal, equals(15.99));

        final addedItem = cartNotifier.state.items.first;
        expect(addedItem.menuItemId, equals('menu-1'));
        expect(addedItem.name, equals('Margherita Pizza'));
        expect(addedItem.price, equals(15.99));
        expect(addedItem.quantity, equals(1));
      });

      test('should increase quantity when adding same item', () {
        // Arrange
        cartNotifier.addItem(
          menuItemId: 'menu-1',
          name: 'Pizza',
          price: 15.99,
          restaurantId: 'restaurant-1',
          restaurantName: 'Pizza Palace',
        );

        // Act
        cartNotifier.addItem(
          menuItemId: 'menu-1',
          name: 'Pizza',
          price: 15.99,
          restaurantId: 'restaurant-1',
          restaurantName: 'Pizza Palace',
        );

        // Assert
        expect(cartNotifier.state.items, hasLength(1));
        expect(cartNotifier.state.items.first.quantity, equals(2));
        expect(cartNotifier.state.itemCount, equals(2));
        expect(cartNotifier.state.subtotal, equals(31.98));
      });

      test('should add different items as separate entries', () {
        // Act
        cartNotifier.addItem(
          menuItemId: 'menu-1',
          name: 'Pizza',
          price: 15.99,
          restaurantId: 'restaurant-1',
          restaurantName: 'Pizza Palace',
        );

        cartNotifier.addItem(
          menuItemId: 'menu-2',
          name: 'Salad',
          price: 8.50,
          restaurantId: 'restaurant-1',
          restaurantName: 'Pizza Palace',
        );

        // Assert
        expect(cartNotifier.state.items, hasLength(2));
        expect(cartNotifier.state.itemCount, equals(2));
        expect(cartNotifier.state.subtotal, equals(24.49));
      });

      test('should treat items with different special instructions as separate', () {
        // Act
        cartNotifier.addItem(
          menuItemId: 'menu-1',
          name: 'Pizza',
          price: 15.99,
          restaurantId: 'restaurant-1',
          restaurantName: 'Pizza Palace',
          specialInstructions: 'Extra cheese',
        );

        cartNotifier.addItem(
          menuItemId: 'menu-1',
          name: 'Pizza',
          price: 15.99,
          restaurantId: 'restaurant-1',
          restaurantName: 'Pizza Palace',
          specialInstructions: 'No onions',
        );

        // Assert
        expect(cartNotifier.state.items, hasLength(2));
        expect(cartNotifier.state.items[0].specialInstructions, equals('Extra cheese'));
        expect(cartNotifier.state.items[1].specialInstructions, equals('No onions'));
      });

      test('should throw exception when adding items from different restaurant', () {
        // Arrange
        cartNotifier.addItem(
          menuItemId: 'menu-1',
          name: 'Pizza',
          price: 15.99,
          restaurantId: 'restaurant-1',
          restaurantName: 'Pizza Palace',
        );

        // Act & Assert
        expect(
          () => cartNotifier.addItem(
            menuItemId: 'menu-2',
            name: 'Burger',
            price: 12.99,
            restaurantId: 'restaurant-2',
            restaurantName: 'Burger Joint',
          ),
          throwsException,
        );
      });

      test('should remove item correctly', () {
        // Arrange
        cartNotifier.addItem(
          menuItemId: 'menu-1',
          name: 'Pizza',
          price: 15.99,
          restaurantId: 'restaurant-1',
          restaurantName: 'Pizza Palace',
        );

        cartNotifier.addItem(
          menuItemId: 'menu-2',
          name: 'Salad',
          price: 8.50,
          restaurantId: 'restaurant-1',
          restaurantName: 'Pizza Palace',
        );

        final itemToRemove = cartNotifier.state.items.first;

        // Act
        cartNotifier.removeItem(itemToRemove.id);

        // Assert
        expect(cartNotifier.state.items, hasLength(1));
        expect(cartNotifier.state.items.first.name, equals('Salad'));
        expect(cartNotifier.state.subtotal, equals(8.50));
      });

      test('should clear restaurant info when removing all items', () {
        // Arrange
        cartNotifier.addItem(
          menuItemId: 'menu-1',
          name: 'Pizza',
          price: 15.99,
          restaurantId: 'restaurant-1',
          restaurantName: 'Pizza Palace',
        );

        final itemId = cartNotifier.state.items.first.id;

        // Act
        cartNotifier.removeItem(itemId);

        // Assert
        expect(cartNotifier.state.isEmpty, isTrue);
        expect(cartNotifier.state.restaurantId, isNull);
        expect(cartNotifier.state.restaurantName, isNull);
      });

      test('should update item quantity correctly', () {
        // Arrange
        cartNotifier.addItem(
          menuItemId: 'menu-1',
          name: 'Pizza',
          price: 15.99,
          restaurantId: 'restaurant-1',
          restaurantName: 'Pizza Palace',
        );

        final itemId = cartNotifier.state.items.first.id;

        // Act
        cartNotifier.updateItemQuantity(itemId, 3);

        // Assert
        expect(cartNotifier.state.items.first.quantity, equals(3));
        expect(cartNotifier.state.itemCount, equals(3));
        expect(cartNotifier.state.subtotal, equals(47.97));
      });

      test('should remove item when quantity is set to zero', () {
        // Arrange
        cartNotifier.addItem(
          menuItemId: 'menu-1',
          name: 'Pizza',
          price: 15.99,
          restaurantId: 'restaurant-1',
          restaurantName: 'Pizza Palace',
        );

        final itemId = cartNotifier.state.items.first.id;

        // Act
        cartNotifier.updateItemQuantity(itemId, 0);

        // Assert
        expect(cartNotifier.state.isEmpty, isTrue);
      });

      test('should update item special instructions', () {
        // Arrange
        cartNotifier.addItem(
          menuItemId: 'menu-1',
          name: 'Pizza',
          price: 15.99,
          restaurantId: 'restaurant-1',
          restaurantName: 'Pizza Palace',
        );

        final itemId = cartNotifier.state.items.first.id;

        // Act
        cartNotifier.updateItemInstructions(itemId, 'Extra cheese, no onions');

        // Assert
        expect(cartNotifier.state.items.first.specialInstructions, equals('Extra cheese, no onions'));
      });

      test('should clear cart completely', () {
        // Arrange
        cartNotifier.addItem(
          menuItemId: 'menu-1',
          name: 'Pizza',
          price: 15.99,
          restaurantId: 'restaurant-1',
          restaurantName: 'Pizza Palace',
        );

        cartNotifier.updateDeliveryFee(2.99);
        cartNotifier.updateTax(1.60);

        // Act
        cartNotifier.clearCart();

        // Assert
        expect(cartNotifier.state.isEmpty, isTrue);
        expect(cartNotifier.state.restaurantId, isNull);
        expect(cartNotifier.state.deliveryFee, equals(0.0));
        expect(cartNotifier.state.tax, equals(0.0));
        expect(cartNotifier.state.discount, equals(0.0));
      });

      test('should update fees and discounts', () {
        // Act
        cartNotifier.updateDeliveryFee(2.99);
        cartNotifier.updateTax(1.60);
        cartNotifier.applyDiscount(5.00);

        // Assert
        expect(cartNotifier.state.deliveryFee, equals(2.99));
        expect(cartNotifier.state.tax, equals(1.60));
        expect(cartNotifier.state.discount, equals(5.00));

        // Act
        cartNotifier.removeDiscount();

        // Assert
        expect(cartNotifier.state.discount, equals(0.0));
      });

      test('should get item by id', () {
        // Arrange
        cartNotifier.addItem(
          menuItemId: 'menu-1',
          name: 'Pizza',
          price: 15.99,
          restaurantId: 'restaurant-1',
          restaurantName: 'Pizza Palace',
        );

        final itemId = cartNotifier.state.items.first.id;

        // Act
        final item = cartNotifier.getItem(itemId);
        final nonExistentItem = cartNotifier.getItem('non-existent');

        // Assert
        expect(item, isNotNull);
        expect(item!.name, equals('Pizza'));
        expect(nonExistentItem, isNull);
      });

      test('should check item existence and get quantity', () {
        // Arrange
        cartNotifier.addItem(
          menuItemId: 'menu-1',
          name: 'Pizza',
          price: 15.99,
          restaurantId: 'restaurant-1',
          restaurantName: 'Pizza Palace',
        );

        // Add same item again to increase quantity
        cartNotifier.addItem(
          menuItemId: 'menu-1',
          name: 'Pizza',
          price: 15.99,
          restaurantId: 'restaurant-1',
          restaurantName: 'Pizza Palace',
        );

        // Act & Assert
        expect(cartNotifier.hasItem('menu-1'), isTrue);
        expect(cartNotifier.hasItem('menu-2'), isFalse);
        expect(cartNotifier.getItemQuantity('menu-1'), equals(2));
        expect(cartNotifier.getItemQuantity('menu-2'), equals(0));
      });
    });

    group('Provider Integration', () {
      test('should work with Riverpod provider', () {
        // Arrange
        final container = ProviderContainer();
        final cartNotifierProvider = StateNotifierProvider<CartNotifier, CartState>(
          (ref) => CartNotifier(),
        );

        // Act
        final cartState = container.read(cartNotifierProvider);
        final cartNotifier = container.read(cartNotifierProvider.notifier);

        // Assert
        expect(cartState.isEmpty, isTrue);
        expect(cartNotifier, isA<CartNotifier>());

        // Cleanup
        container.dispose();
      });

      test('should notify listeners on state changes', () {
        // Arrange
        final container = ProviderContainer();
        final cartNotifierProvider = StateNotifierProvider<CartNotifier, CartState>(
          (ref) => CartNotifier(),
        );

        final states = <CartState>[];
        container.listen<CartState>(
          cartNotifierProvider,
          (previous, next) {
            states.add(next);
          },
        );

        // Act
        container.read(cartNotifierProvider.notifier).addItem(
          menuItemId: 'menu-1',
          name: 'Pizza',
          price: 15.99,
          restaurantId: 'restaurant-1',
          restaurantName: 'Pizza Palace',
        );

        // Assert
        expect(states.length, equals(1));
        expect(states.last.items, hasLength(1));
        expect(states.last.restaurantId, equals('restaurant-1'));

        // Cleanup
        container.dispose();
      });
    });
  });
}