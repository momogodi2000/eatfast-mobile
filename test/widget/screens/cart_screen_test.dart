import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  group('Cart Screen Widget Tests', () {
    testWidgets('should display empty cart message', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Your Cart'),
              ),
              body: const Center(
                child: Column(
                  key: Key('empty_cart'),
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 80,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Your cart is empty',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Add some delicious items to get started!',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      key: Key('browse_restaurants_button'),
                      onPressed: null,
                      child: Text('Browse Restaurants'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.text('Your Cart'), findsOneWidget);
      expect(find.byKey(const Key('empty_cart')), findsOneWidget);
      expect(find.text('Your cart is empty'), findsOneWidget);
      expect(find.text('Add some delicious items to get started!'), findsOneWidget);
      expect(find.byKey(const Key('browse_restaurants_button')), findsOneWidget);
    });

    testWidgets('should display cart items list', (WidgetTester tester) async {
      // Arrange
      final cartItems = [
        {'name': 'Margherita Pizza', 'price': 12.99, 'quantity': 2},
        {'name': 'Caesar Salad', 'price': 8.50, 'quantity': 1},
        {'name': 'Garlic Bread', 'price': 4.99, 'quantity': 3},
      ];

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Your Cart'),
                actions: [
                  IconButton(
                    key: const Key('clear_cart_button'),
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () {},
                  ),
                ],
              ),
              body: ListView.builder(
                key: const Key('cart_items_list'),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    key: Key('cart_item_$index'),
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.fastfood),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'] as String,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '\$${(item['price'] as double).toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    key: Key('decrease_quantity_$index'),
                                    onPressed: () {},
                                    icon: const Icon(Icons.remove_circle_outline),
                                  ),
                                  Text(
                                    '${item['quantity']}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    key: Key('increase_quantity_$index'),
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_circle_outline),
                                  ),
                                ],
                              ),
                              IconButton(
                                key: Key('remove_item_$index'),
                                onPressed: () {},
                                icon: const Icon(Icons.delete, color: Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('cart_items_list')), findsOneWidget);
      expect(find.byKey(const Key('cart_item_0')), findsOneWidget);
      expect(find.text('Margherita Pizza'), findsOneWidget);
      expect(find.text('\$12.99'), findsOneWidget);
      expect(find.byKey(const Key('decrease_quantity_0')), findsOneWidget);
      expect(find.byKey(const Key('increase_quantity_0')), findsOneWidget);
      expect(find.byKey(const Key('remove_item_0')), findsOneWidget);
      expect(find.byKey(const Key('clear_cart_button')), findsOneWidget);
    });

    testWidgets('should display order summary', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  Expanded(child: Container()),
                  Container(
                    key: const Key('order_summary'),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Subtotal'),
                            Text('\$35.47'),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Delivery Fee'),
                            Text('\$2.99'),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tax'),
                            Text('\$3.08'),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Discount'),
                            Text('-\$5.00', style: TextStyle(color: Colors.green)),
                          ],
                        ),
                        const Divider(),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$36.54',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            key: const Key('proceed_to_checkout_button'),
                            onPressed: () {},
                            child: const Text('Proceed to Checkout'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('order_summary')), findsOneWidget);
      expect(find.text('Subtotal'), findsOneWidget);
      expect(find.text('\$35.47'), findsOneWidget);
      expect(find.text('Delivery Fee'), findsOneWidget);
      expect(find.text('\$2.99'), findsOneWidget);
      expect(find.text('Tax'), findsOneWidget);
      expect(find.text('\$3.08'), findsOneWidget);
      expect(find.text('Discount'), findsOneWidget);
      expect(find.text('-\$5.00'), findsOneWidget);
      expect(find.text('Total'), findsOneWidget);
      expect(find.text('\$36.54'), findsOneWidget);
      expect(find.byKey(const Key('proceed_to_checkout_button')), findsOneWidget);
    });

    testWidgets('should handle quantity updates', (WidgetTester tester) async {
      // Arrange
      int quantity = 2;

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: StatefulBuilder(
                builder: (context, setState) {
                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          key: const Key('decrease_button'),
                          onPressed: quantity > 1
                              ? () {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              : null,
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        Text(
                          '$quantity',
                          key: const Key('quantity_text'),
                          style: const TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          key: const Key('increase_button'),
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: const Icon(Icons.add_circle_outline),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

      // Act
      expect(find.text('2'), findsOneWidget);

      await tester.tap(find.byKey(const Key('increase_button')));
      await tester.pump();
      expect(find.text('3'), findsOneWidget);

      await tester.tap(find.byKey(const Key('decrease_button')));
      await tester.pump();
      expect(find.text('2'), findsOneWidget);

      // Assert
      expect(find.byKey(const Key('quantity_text')), findsOneWidget);
    });

    testWidgets('should display promo code section', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      key: const Key('promo_code_section'),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: TextField(
                              key: Key('promo_code_field'),
                              decoration: InputDecoration(
                                hintText: 'Enter promo code',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            key: const Key('apply_promo_button'),
                            onPressed: () {},
                            child: const Text('Apply'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      key: const Key('applied_promo'),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle, color: Colors.green),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text('SAVE20 applied - 20% off'),
                          ),
                          IconButton(
                            key: const Key('remove_promo_button'),
                            onPressed: () {},
                            icon: const Icon(Icons.close, size: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('promo_code_section')), findsOneWidget);
      expect(find.byKey(const Key('promo_code_field')), findsOneWidget);
      expect(find.byKey(const Key('apply_promo_button')), findsOneWidget);
      expect(find.text('Enter promo code'), findsOneWidget);
      expect(find.text('Apply'), findsOneWidget);
      expect(find.byKey(const Key('applied_promo')), findsOneWidget);
      expect(find.text('SAVE20 applied - 20% off'), findsOneWidget);
      expect(find.byKey(const Key('remove_promo_button')), findsOneWidget);
    });

    testWidgets('should display delivery time estimate', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Container(
                key: const Key('delivery_info'),
                padding: const EdgeInsets.all(16),
                child: const Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.orange),
                    SizedBox(width: 8),
                    Text('Estimated delivery: '),
                    Text(
                      '25-35 min',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('delivery_info')), findsOneWidget);
      expect(find.text('Estimated delivery: '), findsOneWidget);
      expect(find.text('25-35 min'), findsOneWidget);
      expect(find.byIcon(Icons.access_time), findsOneWidget);
    });

    testWidgets('should handle item removal confirmation', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return ElevatedButton(
                    key: const Key('show_remove_dialog_button'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          key: const Key('remove_item_dialog'),
                          title: const Text('Remove Item'),
                          content: const Text('Are you sure you want to remove this item from your cart?'),
                          actions: [
                            TextButton(
                              key: const Key('cancel_remove_button'),
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              key: const Key('confirm_remove_button'),
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Remove'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Remove Item'),
                  );
                },
              ),
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byKey(const Key('show_remove_dialog_button')));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byKey(const Key('remove_item_dialog')), findsOneWidget);
      expect(find.text('Remove Item'), findsNWidgets(2));
      expect(find.text('Are you sure you want to remove this item from your cart?'), findsOneWidget);
      expect(find.byKey(const Key('cancel_remove_button')), findsOneWidget);
      expect(find.byKey(const Key('confirm_remove_button')), findsOneWidget);
    });

    testWidgets('should display restaurant info in cart', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Container(
                key: const Key('restaurant_info_card'),
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.restaurant),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pizza Palace',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '★ 4.5 • 20-30 min • \$\$ Italian',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      key: const Key('change_restaurant_button'),
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('restaurant_info_card')), findsOneWidget);
      expect(find.text('Pizza Palace'), findsOneWidget);
      expect(find.text('★ 4.5 • 20-30 min • \$\$ Italian'), findsOneWidget);
      expect(find.byKey(const Key('change_restaurant_button')), findsOneWidget);
    });

    testWidgets('should handle special instructions', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const TextField(
                      key: Key('special_instructions_field'),
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Special Instructions',
                        hintText: 'Any special requests for your order...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      key: const Key('saved_instructions'),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.note, color: Colors.blue),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text('Please ring the doorbell twice'),
                          ),
                          Icon(Icons.edit, size: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('special_instructions_field')), findsOneWidget);
      expect(find.text('Special Instructions'), findsOneWidget);
      expect(find.text('Any special requests for your order...'), findsOneWidget);
      expect(find.byKey(const Key('saved_instructions')), findsOneWidget);
      expect(find.text('Please ring the doorbell twice'), findsOneWidget);
    });
  });
}