import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Complete Order Flow Integration Tests', () {
    testWidgets('should complete full order flow from home to tracking', (WidgetTester tester) async {
      // Arrange - Create a complete app mock
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const MockHomeScreen(),
            routes: {
              '/restaurant-detail': (context) => const MockRestaurantDetailScreen(),
              '/cart': (context) => const MockCartScreen(),
              '/checkout': (context) => const MockCheckoutScreen(),
              '/order-tracking': (context) => const MockOrderTrackingScreen(),
            },
          ),
        ),
      );

      // Step 1: Start from home screen
      expect(find.text('EatFast'), findsOneWidget);
      expect(find.text('Featured Restaurants'), findsOneWidget);

      // Step 2: Search for restaurants
      await tester.enterText(find.byKey(const Key('search_field')), 'Pizza');
      await tester.pump();
      expect(find.text('Pizza'), findsOneWidget);

      // Step 3: Select a restaurant
      await tester.tap(find.byKey(const Key('restaurant_card_0')));
      await tester.pumpAndSettle();
      expect(find.text('Restaurant Details'), findsOneWidget);

      // Step 4: Add items to cart
      await tester.tap(find.byKey(const Key('add_to_cart_0')));
      await tester.pump();
      await tester.tap(find.byKey(const Key('add_to_cart_1')));
      await tester.pump();

      // Step 5: View cart
      await tester.tap(find.byKey(const Key('view_cart_fab')));
      await tester.pumpAndSettle();
      expect(find.text('Your Cart'), findsOneWidget);
      expect(find.text('Proceed to Checkout'), findsOneWidget);

      // Step 6: Proceed to checkout
      await tester.tap(find.byKey(const Key('proceed_to_checkout_button')));
      await tester.pumpAndSettle();
      expect(find.text('Checkout'), findsOneWidget);

      // Step 7: Select delivery address
      expect(find.text('Delivery Address'), findsOneWidget);
      expect(find.text('123 Main Street'), findsOneWidget);

      // Step 8: Select payment method
      expect(find.text('Payment Method'), findsOneWidget);
      expect(find.text('Visa ending in 1234'), findsOneWidget);

      // Step 9: Place order
      await tester.tap(find.byKey(const Key('place_order_button')));
      await tester.pump();

      // Show loading state
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Placing your order...'), findsOneWidget);

      // Wait for order to be placed
      await tester.pump(const Duration(seconds: 2));

      // Step 10: Navigate to order tracking
      await tester.pumpAndSettle();
      expect(find.text('Track Order'), findsOneWidget);
      expect(find.text('Order #EF12345'), findsOneWidget);
      expect(find.text('Order Progress'), findsOneWidget);

      // Verify order tracking elements
      expect(find.text('Order Placed'), findsOneWidget);
      expect(find.text('Order Confirmed'), findsOneWidget);
      expect(find.text('Preparing Order'), findsOneWidget);
    });

    testWidgets('should handle add to cart and quantity updates', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const MockRestaurantDetailScreen(),
            routes: {
              '/cart': (context) => const MockCartScreen(),
            },
          ),
        ),
      );

      // Step 1: Add first item to cart
      await tester.tap(find.byKey(const Key('add_to_cart_0')));
      await tester.pump();

      // Step 2: Increase quantity
      await tester.tap(find.byKey(const Key('increase_quantity_0')));
      await tester.pump();
      await tester.tap(find.byKey(const Key('increase_quantity_0')));
      await tester.pump();

      // Step 3: Add second item
      await tester.tap(find.byKey(const Key('add_to_cart_1')));
      await tester.pump();

      // Step 4: View cart
      await tester.tap(find.byKey(const Key('view_cart_fab')));
      await tester.pumpAndSettle();

      // Verify cart contents
      expect(find.text('Your Cart'), findsOneWidget);
      expect(find.text('3'), findsOneWidget); // Quantity of first item
      expect(find.text('1'), findsOneWidget); // Quantity of second item

      // Step 5: Update quantities in cart
      await tester.tap(find.byKey(const Key('decrease_quantity_0')));
      await tester.pump();
      expect(find.text('2'), findsOneWidget);

      // Step 6: Remove item
      await tester.tap(find.byKey(const Key('remove_item_1')));
      await tester.pumpAndSettle();

      // Confirm removal dialog
      expect(find.text('Remove Item'), findsOneWidget);
      await tester.tap(find.byKey(const Key('confirm_remove_button')));
      await tester.pumpAndSettle();

      // Verify item was removed
      expect(find.text('Item 2'), findsNothing);
    });

    testWidgets('should handle checkout with different payment methods', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const MockCheckoutScreen(),
          ),
        ),
      );

      // Step 1: Verify default payment method
      expect(find.text('Visa ending in 1234'), findsOneWidget);

      // Step 2: Change to cash payment
      await tester.tap(find.byKey(const Key('cash_payment_option')));
      await tester.pump();

      // Step 3: Add special instructions
      await tester.enterText(
        find.byKey(const Key('special_instructions_field')),
        'Please ring doorbell twice',
      );
      await tester.pump();

      // Step 4: Select tip amount
      await tester.tap(find.byKey(const Key('tip_option_2'))); // 20%
      await tester.pump();

      // Step 5: Place order with cash
      await tester.tap(find.byKey(const Key('place_order_button')));
      await tester.pump();

      // Verify order placement
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should handle order tracking and status updates', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const MockOrderTrackingScreen(),
          ),
        ),
      );

      // Step 1: Verify initial tracking state
      expect(find.text('Order #EF12345'), findsOneWidget);
      expect(find.text('In Transit'), findsOneWidget);

      // Step 2: Check driver information
      expect(find.text('Mike Johnson'), findsOneWidget);
      expect(find.text('Delivery Driver'), findsOneWidget);

      // Step 3: Test communication buttons
      await tester.tap(find.byKey(const Key('call_driver_button')));
      await tester.pump();

      await tester.tap(find.byKey(const Key('message_driver_button')));
      await tester.pump();

      // Step 4: Test map controls
      await tester.tap(find.byKey(const Key('zoom_in_button')));
      await tester.pump();

      await tester.tap(find.byKey(const Key('my_location_button')));
      await tester.pump();

      // Step 5: Simulate status update
      await tester.tap(find.byKey(const Key('simulate_update_button')));
      await tester.pump();

      // Verify status changed
      expect(find.text('Out for Delivery'), findsOneWidget);
    });

    testWidgets('should handle order completion and rating', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const MockOrderCompletedScreen(),
          ),
        ),
      );

      // Step 1: Verify order completion state
      expect(find.text('Order Delivered!'), findsOneWidget);
      expect(find.text('Your order has been delivered successfully'), findsOneWidget);

      // Step 2: Rate the order
      await tester.tap(find.byKey(const Key('rate_order_button')));
      await tester.pumpAndSettle();

      // Verify rating dialog appears
      expect(find.text('Rate Your Order'), findsOneWidget);

      // Select 5 stars
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.byKey(Key('star_$i')));
        await tester.pump();
      }

      // Add review comment
      await tester.enterText(
        find.byKey(const Key('review_comment_field')),
        'Great food and fast delivery!',
      );
      await tester.pump();

      // Submit rating
      await tester.tap(find.byKey(const Key('submit_rating_button')));
      await tester.pumpAndSettle();

      // Step 3: Test reorder functionality
      await tester.tap(find.byKey(const Key('reorder_button')));
      await tester.pumpAndSettle();

      // Verify reorder flow starts
      expect(find.text('Reorder'), findsOneWidget);
    });
  });
}

// Mock Screens for Integration Testing

class MockHomeScreen extends StatelessWidget {
  const MockHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EatFast'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              key: Key('search_field'),
              decoration: InputDecoration(
                hintText: 'Search for restaurants...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Featured Restaurants',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  key: Key('restaurant_card_$index'),
                  child: ListTile(
                    title: Text('Restaurant ${index + 1}'),
                    subtitle: const Text('★ 4.5 • 20-30 min'),
                    onTap: () => Navigator.pushNamed(context, '/restaurant-detail'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MockRestaurantDetailScreen extends StatefulWidget {
  const MockRestaurantDetailScreen({super.key});

  @override
  State<MockRestaurantDetailScreen> createState() => _MockRestaurantDetailScreenState();
}

class _MockRestaurantDetailScreenState extends State<MockRestaurantDetailScreen> {
  int cartItemCount = 0;
  final List<int> quantities = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Details'),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Item ${index + 1}'),
              subtitle: Text('\$${(10 + index * 2).toStringAsFixed(2)}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (quantities[index] > 0) ...[
                    IconButton(
                      key: Key('decrease_quantity_$index'),
                      onPressed: () {
                        setState(() {
                          if (quantities[index] > 0) {
                            quantities[index]--;
                            cartItemCount--;
                          }
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text('${quantities[index]}'),
                    IconButton(
                      key: Key('increase_quantity_$index'),
                      onPressed: () {
                        setState(() {
                          quantities[index]++;
                          cartItemCount++;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ] else
                    IconButton(
                      key: Key('add_to_cart_$index'),
                      onPressed: () {
                        setState(() {
                          quantities[index] = 1;
                          cartItemCount++;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: cartItemCount > 0
          ? FloatingActionButton.extended(
              key: const Key('view_cart_fab'),
              onPressed: () => Navigator.pushNamed(context, '/cart'),
              label: Text('View Cart ($cartItemCount)'),
              icon: const Icon(Icons.shopping_cart),
            )
          : null,
    );
  }
}

class MockCartScreen extends StatelessWidget {
  const MockCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('Item ${index + 1}'),
                    subtitle: Text('\$${(10 + index * 2).toStringAsFixed(2)}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          key: Key('decrease_quantity_$index'),
                          onPressed: () {},
                          icon: const Icon(Icons.remove),
                        ),
                        Text('${index + 2}'),
                        IconButton(
                          key: Key('increase_quantity_$index'),
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                        ),
                        IconButton(
                          key: Key('remove_item_$index'),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Remove Item'),
                                content: const Text('Are you sure?'),
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
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              key: const Key('proceed_to_checkout_button'),
              onPressed: () => Navigator.pushNamed(context, '/checkout'),
              child: const Text('Proceed to Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}

class MockCheckoutScreen extends StatefulWidget {
  const MockCheckoutScreen({super.key});

  @override
  State<MockCheckoutScreen> createState() => _MockCheckoutScreenState();
}

class _MockCheckoutScreenState extends State<MockCheckoutScreen> {
  bool isLoading = false;
  int selectedTip = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Placing your order...'),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      const Text('Delivery Address'),
                      const Card(
                        child: ListTile(
                          title: Text('123 Main Street'),
                          subtitle: Text('New York, NY'),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Payment Method'),
                      const Card(
                        child: ListTile(
                          title: Text('Visa ending in 1234'),
                          subtitle: Text('Default'),
                        ),
                      ),
                      ListTile(
                        key: const Key('cash_payment_option'),
                        title: const Text('Cash on Delivery'),
                        leading: Radio<String>(
                          value: 'cash',
                          groupValue: 'card',
                          onChanged: (value) {},
                        ),
                      ),
                      const SizedBox(height: 16),
                      const TextField(
                        key: Key('special_instructions_field'),
                        decoration: InputDecoration(
                          labelText: 'Special Instructions',
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Tip'),
                      Row(
                        children: ['15%', '18%', '20%', '25%'].asMap().entries.map((entry) {
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: ChoiceChip(
                                key: Key('tip_option_${entry.key}'),
                                label: Text(entry.value),
                                selected: selectedTip == entry.key,
                                onSelected: (selected) {
                                  setState(() {
                                    selectedTip = entry.key;
                                  });
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    key: const Key('place_order_button'),
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pushNamed(context, '/order-tracking');
                      });
                    },
                    child: const Text('Place Order'),
                  ),
                ),
              ],
            ),
    );
  }
}

class MockOrderTrackingScreen extends StatefulWidget {
  const MockOrderTrackingScreen({super.key});

  @override
  State<MockOrderTrackingScreen> createState() => _MockOrderTrackingScreenState();
}

class _MockOrderTrackingScreenState extends State<MockOrderTrackingScreen> {
  String status = 'In Transit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Order'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text('Order #EF12345'),
                Text(status),
                const Text('Estimated arrival: 10-15 minutes'),
              ],
            ),
          ),
          const Text('Order Progress'),
          const ListTile(title: Text('Order Placed')),
          const ListTile(title: Text('Order Confirmed')),
          const ListTile(title: Text('Preparing Order')),
          const ListTile(title: Text('Out for Delivery')),
          const SizedBox(height: 16),
          const Card(
            child: ListTile(
              title: Text('Mike Johnson'),
              subtitle: Text('Delivery Driver'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    key: Key('call_driver_button'),
                    onPressed: null,
                    icon: Icon(Icons.phone),
                  ),
                  IconButton(
                    key: Key('message_driver_button'),
                    onPressed: null,
                    icon: Icon(Icons.message),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 200,
            margin: const EdgeInsets.all(16),
            color: Colors.grey[300],
            child: Stack(
              children: [
                const Center(child: Text('Map')),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Column(
                    children: [
                      FloatingActionButton.small(
                        key: const Key('zoom_in_button'),
                        onPressed: () {},
                        child: const Icon(Icons.add),
                      ),
                      FloatingActionButton.small(
                        key: const Key('my_location_button'),
                        onPressed: () {},
                        child: const Icon(Icons.my_location),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            key: const Key('simulate_update_button'),
            onPressed: () {
              setState(() {
                status = 'Out for Delivery';
              });
            },
            child: const Text('Simulate Update'),
          ),
        ],
      ),
    );
  }
}

class MockOrderCompletedScreen extends StatelessWidget {
  const MockOrderCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 60),
            const SizedBox(height: 16),
            const Text(
              'Order Delivered!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text('Your order has been delivered successfully'),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  key: const Key('rate_order_button'),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Rate Your Order'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(5, (index) {
                                return IconButton(
                                  key: Key('star_$index'),
                                  onPressed: () {},
                                  icon: const Icon(Icons.star),
                                );
                              }),
                            ),
                            const TextField(
                              key: Key('review_comment_field'),
                              decoration: InputDecoration(
                                hintText: 'Add a comment...',
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            key: const Key('submit_rating_button'),
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Submit'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text('Rate Order'),
                ),
                ElevatedButton(
                  key: const Key('reorder_button'),
                  onPressed: () {},
                  child: const Text('Reorder'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}