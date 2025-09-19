import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  group('Restaurant Detail Screen Widget Tests', () {
    testWidgets('should display restaurant header information', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  SizedBox(
                    key: const Key('restaurant_header'),
                    height: 250,
                    child: Stack(
                      children: [
                        Container(
                          height: 200,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: const Center(child: Icon(Icons.restaurant, size: 50)),
                        ),
                        Positioned(
                          top: 40,
                          left: 16,
                          child: IconButton(
                            key: const Key('back_button'),
                            icon: const Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                        Positioned(
                          top: 40,
                          right: 16,
                          child: Row(
                            children: [
                              IconButton(
                                key: const Key('favorite_button'),
                                icon: const Icon(Icons.favorite_border, color: Colors.white),
                                onPressed: () {},
                              ),
                              IconButton(
                                key: const Key('share_button'),
                                icon: const Icon(Icons.share, color: Colors.white),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 16,
                          right: 16,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Test Restaurant',
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.star, color: Colors.orange, size: 16),
                                      const Text('4.5'),
                                      const Text(' • '),
                                      const Text('20-30 min'),
                                      const Text(' • '),
                                      const Text('\$\$ • Italian'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
      expect(find.byKey(const Key('restaurant_header')), findsOneWidget);
      expect(find.byKey(const Key('back_button')), findsOneWidget);
      expect(find.byKey(const Key('favorite_button')), findsOneWidget);
      expect(find.byKey(const Key('share_button')), findsOneWidget);
      expect(find.text('Test Restaurant'), findsOneWidget);
      expect(find.text('4.5'), findsOneWidget);
      expect(find.text('20-30 min'), findsOneWidget);
    });

    testWidgets('should display restaurant info tabs', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: DefaultTabController(
              length: 3,
              child: Scaffold(
                body: Column(
                  children: [
                    TabBar(
                      key: const Key('restaurant_tabs'),
                      tabs: const [
                        Tab(text: 'Menu'),
                        Tab(text: 'Reviews'),
                        Tab(text: 'Info'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('restaurant_tabs')), findsOneWidget);
      expect(find.text('Menu'), findsOneWidget);
      expect(find.text('Reviews'), findsOneWidget);
      expect(find.text('Info'), findsOneWidget);
    });

    testWidgets('should display menu categories', (WidgetTester tester) async {
      // Arrange
      final categories = ['Appetizers', 'Main Courses', 'Desserts', 'Beverages'];

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      key: const Key('menu_categories'),
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          key: Key('category_$index'),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: FilterChip(
                            label: Text(categories[index]),
                            selected: index == 0,
                            onSelected: (selected) {},
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('menu_categories')), findsOneWidget);
      expect(find.text('Appetizers'), findsOneWidget);
      expect(find.text('Main Courses'), findsOneWidget);
      expect(find.text('Desserts'), findsOneWidget);
      expect(find.text('Beverages'), findsOneWidget);
    });

    testWidgets('should display menu items list', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ListView.builder(
                key: const Key('menu_items_list'),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    key: Key('menu_item_$index'),
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.fastfood),
                      ),
                      title: Text('Menu Item ${index + 1}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Delicious description of the menu item'),
                          const SizedBox(height: 4),
                          Text(
                            '\$${(12.99 + index * 2).toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        key: Key('add_to_cart_$index'),
                        icon: const Icon(Icons.add),
                        onPressed: () {},
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
      expect(find.byKey(const Key('menu_items_list')), findsOneWidget);
      expect(find.byKey(const Key('menu_item_0')), findsOneWidget);
      expect(find.text('Menu Item 1'), findsOneWidget);
      expect(find.text('\$12.99'), findsOneWidget);
      expect(find.byKey(const Key('add_to_cart_0')), findsOneWidget);
    });

    testWidgets('should display restaurant reviews', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  Container(
                    key: const Key('reviews_summary'),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const Text(
                              '4.5',
                              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  index < 4 ? Icons.star : Icons.star_border,
                                  color: Colors.orange,
                                  size: 16,
                                );
                              }),
                            ),
                            const Text('245 reviews'),
                          ],
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: Column(
                            children: List.generate(5, (rating) {
                              return Row(
                                children: [
                                  Text('${5 - rating}'),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      value: (5 - rating) * 0.2,
                                      backgroundColor: Colors.grey[300],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text('${(5 - rating) * 20}'),
                                ],
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      key: const Key('reviews_list'),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Card(
                          key: Key('review_$index'),
                          margin: const EdgeInsets.all(8),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      child: Text('U${index + 1}'),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('User ${index + 1}'),
                                          Row(
                                            children: List.generate(5, (starIndex) {
                                              return Icon(
                                                starIndex < 4 ? Icons.star : Icons.star_border,
                                                color: Colors.orange,
                                                size: 14,
                                              );
                                            }),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text('2 days ago'),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                const Text('Great food and excellent service! Would definitely order again.'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('reviews_summary')), findsOneWidget);
      expect(find.text('4.5'), findsOneWidget);
      expect(find.text('245 reviews'), findsOneWidget);
      expect(find.byKey(const Key('reviews_list')), findsOneWidget);
      expect(find.byKey(const Key('review_0')), findsOneWidget);
      expect(find.text('User 1'), findsOneWidget);
    });

    testWidgets('should display restaurant information', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  key: const Key('restaurant_info'),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Contact Information',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    const ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('123 Restaurant Street, Food City, FC 12345'),
                      subtitle: Text('Address'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('+1 (555) 123-4567'),
                      subtitle: Text('Phone'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.access_time),
                      title: Text('Mon-Sun: 10:00 AM - 10:00 PM'),
                      subtitle: Text('Opening Hours'),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'About Restaurant',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Welcome to our restaurant! We serve authentic Italian cuisine with fresh ingredients and traditional recipes.',
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Features',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: [
                        Chip(
                          label: const Text('Free Delivery'),
                          avatar: const Icon(Icons.delivery_dining, size: 16),
                        ),
                        Chip(
                          label: const Text('Accepts Cards'),
                          avatar: const Icon(Icons.credit_card, size: 16),
                        ),
                        Chip(
                          label: const Text('Vegetarian Options'),
                          avatar: const Icon(Icons.eco, size: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('restaurant_info')), findsOneWidget);
      expect(find.text('Contact Information'), findsOneWidget);
      expect(find.text('123 Restaurant Street, Food City, FC 12345'), findsOneWidget);
      expect(find.text('+1 (555) 123-4567'), findsOneWidget);
      expect(find.text('Free Delivery'), findsOneWidget);
      expect(find.text('Accepts Cards'), findsOneWidget);
      expect(find.text('Vegetarian Options'), findsOneWidget);
    });

    testWidgets('should handle add to cart action', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Center(
                child: ElevatedButton(
                  key: const Key('add_to_cart_button'),
                  onPressed: () {
                    // Add to cart logic
                  },
                  child: const Text('Add to Cart - \$12.99'),
                ),
              ),
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byKey(const Key('add_to_cart_button')));
      await tester.pump();

      // Assert
      expect(find.text('Add to Cart - \$12.99'), findsOneWidget);
    });

    testWidgets('should display floating cart button when items added', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: const Center(child: Text('Restaurant Content')),
              floatingActionButton: FloatingActionButton.extended(
                key: const Key('view_cart_fab'),
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
                label: const Text('View Cart (3) - \$38.97'),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('view_cart_fab')), findsOneWidget);
      expect(find.text('View Cart (3) - \$38.97'), findsOneWidget);
      expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
    });

    testWidgets('should handle menu item customization', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  const Text('Customize Your Order'),
                  ListTile(
                    title: const Text('Size'),
                    trailing: DropdownButton<String>(
                      value: 'Medium',
                      items: const [
                        DropdownMenuItem(value: 'Small', child: Text('Small')),
                        DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                        DropdownMenuItem(value: 'Large', child: Text('Large')),
                      ],
                      onChanged: null,
                    ),
                  ),
                  const TextField(
                    key: Key('special_instructions'),
                    decoration: InputDecoration(
                      labelText: 'Special Instructions',
                      hintText: 'Any special requests...',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        key: const Key('decrease_quantity'),
                        onPressed: null,
                        icon: const Icon(Icons.remove),
                      ),
                      const Text('1'),
                      IconButton(
                        key: const Key('increase_quantity'),
                        onPressed: null,
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.text('Customize Your Order'), findsOneWidget);
      expect(find.text('Size'), findsOneWidget);
      expect(find.text('Medium'), findsOneWidget);
      expect(find.byKey(const Key('special_instructions')), findsOneWidget);
      expect(find.byKey(const Key('decrease_quantity')), findsOneWidget);
      expect(find.byKey(const Key('increase_quantity')), findsOneWidget);
    });
  });
}