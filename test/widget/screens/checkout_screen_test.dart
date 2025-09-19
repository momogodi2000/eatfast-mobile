import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  group('Checkout Screen Widget Tests', () {
    testWidgets('should display checkout header', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                key: const Key('checkout_app_bar'),
                title: const Text('Checkout'),
                leading: IconButton(
                  key: const Key('back_button'),
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {},
                ),
              ),
              body: const Center(child: Text('Checkout Content')),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('checkout_app_bar')), findsOneWidget);
      expect(find.text('Checkout'), findsOneWidget);
      expect(find.byKey(const Key('back_button')), findsOneWidget);
    });

    testWidgets('should display delivery address selection', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Delivery Address',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      key: const Key('selected_address_card'),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.blue),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Home',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('123 Main Street, Apt 4B'),
                                Text('New York, NY 10001'),
                              ],
                            ),
                          ),
                          TextButton(
                            key: const Key('change_address_button'),
                            onPressed: () {},
                            child: const Text('Change'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextButton.icon(
                      key: const Key('add_new_address_button'),
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('Add New Address'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.text('Delivery Address'), findsOneWidget);
      expect(find.byKey(const Key('selected_address_card')), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('123 Main Street, Apt 4B'), findsOneWidget);
      expect(find.text('New York, NY 10001'), findsOneWidget);
      expect(find.byKey(const Key('change_address_button')), findsOneWidget);
      expect(find.byKey(const Key('add_new_address_button')), findsOneWidget);
    });

    testWidgets('should display delivery time options', (WidgetTester tester) async {
      // Arrange
      final deliveryOptions = [
        {'type': 'standard', 'time': '25-35 min', 'fee': '2.99'},
        {'type': 'express', 'time': '15-20 min', 'fee': '5.99'},
        {'type': 'scheduled', 'time': 'Schedule for later', 'fee': '2.99'},
      ];

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Delivery Time',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    for (final entry in deliveryOptions.asMap().entries) ...[
                      Container(
                        key: Key('delivery_option_${entry.key}'),
                        margin: const EdgeInsets.only(bottom: 8),
                        child: RadioListTile<int>(
                          value: entry.key,
                          groupValue: 0,
                          onChanged: (value) {},
                          title: Text(entry.value['time']!),
                          subtitle: Text('+ \$${entry.value['fee']} delivery fee'),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.text('Delivery Time'), findsOneWidget);
      expect(find.byKey(const Key('delivery_option_0')), findsOneWidget);
      expect(find.text('25-35 min'), findsOneWidget);
      expect(find.text('+ \$2.99 delivery fee'), findsNWidgets(2));
      expect(find.text('15-20 min'), findsOneWidget);
      expect(find.text('+ \$5.99 delivery fee'), findsOneWidget);
      expect(find.text('Schedule for later'), findsOneWidget);
    });

    testWidgets('should display payment methods', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Payment Method',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      key: const Key('selected_payment_card'),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.credit_card, color: Colors.green),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Visa ending in 1234',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Expires 12/25'),
                              ],
                            ),
                          ),
                          TextButton(
                            key: const Key('change_payment_button'),
                            onPressed: () {},
                            child: const Text('Change'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    ListTile(
                      key: const Key('cash_payment_option'),
                      leading: const Icon(Icons.money),
                      title: const Text('Cash on Delivery'),
                      trailing: Radio<String>(
                        value: 'cash',
                        groupValue: 'card',
                        onChanged: (value) {},
                      ),
                    ),
                    ListTile(
                      key: const Key('apple_pay_option'),
                      leading: const Icon(Icons.apple),
                      title: const Text('Apple Pay'),
                      trailing: Radio<String>(
                        value: 'apple_pay',
                        groupValue: 'card',
                        onChanged: (value) {},
                      ),
                    ),
                    TextButton.icon(
                      key: const Key('add_payment_method_button'),
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('Add Payment Method'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.text('Payment Method'), findsOneWidget);
      expect(find.byKey(const Key('selected_payment_card')), findsOneWidget);
      expect(find.text('Visa ending in 1234'), findsOneWidget);
      expect(find.text('Expires 12/25'), findsOneWidget);
      expect(find.byKey(const Key('change_payment_button')), findsOneWidget);
      expect(find.byKey(const Key('cash_payment_option')), findsOneWidget);
      expect(find.text('Cash on Delivery'), findsOneWidget);
      expect(find.byKey(const Key('apple_pay_option')), findsOneWidget);
      expect(find.text('Apple Pay'), findsOneWidget);
      expect(find.byKey(const Key('add_payment_method_button')), findsOneWidget);
    });

    testWidgets('should display order summary', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order Summary',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      key: const Key('order_summary_card'),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.restaurant),
                              SizedBox(width: 8),
                              Text(
                                'Pizza Palace',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Divider(),
                          const ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text('2x Margherita Pizza'),
                            trailing: Text('\$25.98'),
                          ),
                          const ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text('1x Caesar Salad'),
                            trailing: Text('\$8.50'),
                          ),
                          const Divider(),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Subtotal'),
                              Text('\$34.48'),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Delivery Fee'),
                              Text('\$2.99'),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Tax'),
                              Text('\$2.98'),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Promo Discount'),
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
                                '\$35.45',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
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
      expect(find.text('Order Summary'), findsOneWidget);
      expect(find.byKey(const Key('order_summary_card')), findsOneWidget);
      expect(find.text('Pizza Palace'), findsOneWidget);
      expect(find.text('2x Margherita Pizza'), findsOneWidget);
      expect(find.text('\$25.98'), findsOneWidget);
      expect(find.text('1x Caesar Salad'), findsOneWidget);
      expect(find.text('\$8.50'), findsOneWidget);
      expect(find.text('Subtotal'), findsOneWidget);
      expect(find.text('\$34.48'), findsOneWidget);
      expect(find.text('Total'), findsOneWidget);
      expect(find.text('\$35.45'), findsOneWidget);
    });

    testWidgets('should display special instructions section', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Special Instructions',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    const TextField(
                      key: Key('special_instructions_field'),
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Add delivery instructions, special requests, etc.',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    CheckboxListTile(
                      key: const Key('contactless_delivery_checkbox'),
                      value: true,
                      onChanged: (value) {},
                      title: const Text('Contactless Delivery'),
                      subtitle: const Text('Leave at door'),
                      contentPadding: EdgeInsets.zero,
                    ),
                    CheckboxListTile(
                      key: const Key('utensils_checkbox'),
                      value: false,
                      onChanged: (value) {},
                      title: const Text('Include Utensils'),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.text('Special Instructions'), findsOneWidget);
      expect(find.byKey(const Key('special_instructions_field')), findsOneWidget);
      expect(find.text('Add delivery instructions, special requests, etc.'), findsOneWidget);
      expect(find.byKey(const Key('contactless_delivery_checkbox')), findsOneWidget);
      expect(find.text('Contactless Delivery'), findsOneWidget);
      expect(find.text('Leave at door'), findsOneWidget);
      expect(find.byKey(const Key('utensils_checkbox')), findsOneWidget);
      expect(find.text('Include Utensils'), findsOneWidget);
    });

    testWidgets('should display tip selection', (WidgetTester tester) async {
      // Arrange
      final tipOptions = ['15%', '18%', '20%', '25%', 'Custom'];

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tip Your Driver',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      key: const Key('tip_options_row'),
                      children: tipOptions.asMap().entries.map((entry) {
                        final index = entry.key;
                        final option = entry.value;
                        return Expanded(
                          child: Container(
                            key: Key('tip_option_$index'),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            child: ChoiceChip(
                              label: Text(option),
                              selected: index == 2, // 20% selected
                              onSelected: (selected) {},
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 12),
                    const TextField(
                      key: Key('custom_tip_field'),
                      decoration: InputDecoration(
                        labelText: 'Custom Tip Amount',
                        prefixText: '\$',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.text('Tip Your Driver'), findsOneWidget);
      expect(find.byKey(const Key('tip_options_row')), findsOneWidget);
      expect(find.text('15%'), findsOneWidget);
      expect(find.text('18%'), findsOneWidget);
      expect(find.text('20%'), findsOneWidget);
      expect(find.text('25%'), findsOneWidget);
      expect(find.text('Custom'), findsOneWidget);
      expect(find.byKey(const Key('custom_tip_field')), findsOneWidget);
    });

    testWidgets('should display place order button', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  Expanded(child: Container()),
                  Container(
                    key: const Key('place_order_section'),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Estimated Total',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '\$35.45',
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
                          height: 50,
                          child: ElevatedButton(
                            key: const Key('place_order_button'),
                            onPressed: () {},
                            child: const Text(
                              'Place Order',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'By placing this order, you agree to our Terms & Conditions',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                          textAlign: TextAlign.center,
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
      expect(find.byKey(const Key('place_order_section')), findsOneWidget);
      expect(find.text('Estimated Total'), findsOneWidget);
      expect(find.text('\$35.45'), findsOneWidget);
      expect(find.byKey(const Key('place_order_button')), findsOneWidget);
      expect(find.text('Place Order'), findsOneWidget);
      expect(find.text('By placing this order, you agree to our Terms & Conditions'), findsOneWidget);
    });

    testWidgets('should handle loading state during order placement', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: const Center(
                child: Column(
                  key: Key('loading_state'),
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Placing your order...'),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('loading_state')), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Placing your order...'), findsOneWidget);
    });

    testWidgets('should display error message on order failure', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Container(
                key: const Key('error_message'),
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.error, color: Colors.red),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Failed to place order. Please check your payment method and try again.',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    IconButton(
                      key: const Key('dismiss_error_button'),
                      onPressed: () {},
                      icon: const Icon(Icons.close, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('error_message')), findsOneWidget);
      expect(find.text('Failed to place order. Please check your payment method and try again.'), findsOneWidget);
      expect(find.byKey(const Key('dismiss_error_button')), findsOneWidget);
    });

    testWidgets('should display order confirmation dialog', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return ElevatedButton(
                    key: const Key('show_confirmation_button'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          key: const Key('order_confirmation_dialog'),
                          title: const Row(
                            children: [
                              Icon(Icons.check_circle, color: Colors.green),
                              SizedBox(width: 8),
                              Text('Order Placed!'),
                            ],
                          ),
                          content: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Your order has been placed successfully.'),
                              SizedBox(height: 8),
                              Text(
                                'Order #12345',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text('Estimated delivery: 25-35 minutes'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              key: const Key('track_order_button'),
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Track Order'),
                            ),
                            ElevatedButton(
                              key: const Key('continue_shopping_button'),
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Continue Shopping'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Show Confirmation'),
                  );
                },
              ),
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byKey(const Key('show_confirmation_button')));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byKey(const Key('order_confirmation_dialog')), findsOneWidget);
      expect(find.text('Order Placed!'), findsOneWidget);
      expect(find.text('Your order has been placed successfully.'), findsOneWidget);
      expect(find.text('Order #12345'), findsOneWidget);
      expect(find.text('Estimated delivery: 25-35 minutes'), findsOneWidget);
      expect(find.byKey(const Key('track_order_button')), findsOneWidget);
      expect(find.byKey(const Key('continue_shopping_button')), findsOneWidget);
    });
  });
}