import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  group('Home Screen Widget Tests', () {
    testWidgets('should display app bar with title and actions', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: const Text('EatFast'),
                actions: [
                  IconButton(
                    key: const Key('search_button'),
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    key: const Key('notifications_button'),
                    icon: const Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                  IconButton(
                    key: const Key('cart_button'),
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {},
                  ),
                ],
              ),
              body: const Center(child: Text('Home Content')),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.text('EatFast'), findsOneWidget);
      expect(find.byKey(const Key('search_button')), findsOneWidget);
      expect(find.byKey(const Key('notifications_button')), findsOneWidget);
      expect(find.byKey(const Key('cart_button')), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.notifications), findsOneWidget);
      expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
    });

    testWidgets('should display delivery address selector', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  Container(
                    key: const Key('address_selector'),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.red),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Deliver to',
                                style: TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              Text(
                                '123 Main Street, Test City',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          key: const Key('change_address_button'),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          onPressed: () {},
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
      expect(find.byKey(const Key('address_selector')), findsOneWidget);
      expect(find.text('Deliver to'), findsOneWidget);
      expect(find.text('123 Main Street, Test City'), findsOneWidget);
      expect(find.byKey(const Key('change_address_button')), findsOneWidget);
      expect(find.byIcon(Icons.location_on), findsOneWidget);
    });

    testWidgets('should display search bar', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      key: const Key('search_field'),
                      decoration: InputDecoration(
                        hintText: 'Search for restaurants, cuisines...',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          key: const Key('filter_button'),
                          icon: const Icon(Icons.tune),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('search_field')), findsOneWidget);
      expect(find.text('Search for restaurants, cuisines...'), findsOneWidget);
      expect(find.byKey(const Key('filter_button')), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.tune), findsOneWidget);
    });

    testWidgets('should display banner carousel', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: SizedBox(
                height: 200,
                child: PageView(
                  key: const Key('banner_carousel'),
                  children: [
                    Container(
                      key: const Key('banner_1'),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text('Special Offer 1', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      key: const Key('banner_2'),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text('Special Offer 2', style: TextStyle(color: Colors.white)),
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
      expect(find.byKey(const Key('banner_carousel')), findsOneWidget);
      expect(find.byKey(const Key('banner_1')), findsOneWidget);
      expect(find.text('Special Offer 1'), findsOneWidget);
    });

    testWidgets('should display category filters', (WidgetTester tester) async {
      // Arrange
      final categories = ['All', 'Pizza', 'Burger', 'Asian', 'Healthy', 'Desserts'];

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: SizedBox(
                height: 50,
                child: ListView.builder(
                  key: const Key('category_list'),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = index == 0;

                    return Container(
                      key: Key('category_$index'),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: FilterChip(
                        label: Text(category),
                        selected: isSelected,
                        onSelected: (selected) {},
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('category_list')), findsOneWidget);
      expect(find.byKey(const Key('category_0')), findsOneWidget);
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Pizza'), findsOneWidget);
    });

    testWidgets('should display featured restaurants section', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Featured Restaurants',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      key: const Key('featured_restaurants_list'),
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          key: Key('restaurant_card_$index'),
                          width: 160,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Card(
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(8),
                                    ),
                                  ),
                                  child: const Center(child: Icon(Icons.restaurant)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Restaurant ${index + 1}'),
                                      const Text('★ 4.5 • 20-30 min'),
                                      const Text('\$\$ • Italian'),
                                    ],
                                  ),
                                ),
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
      expect(find.text('Featured Restaurants'), findsOneWidget);
      expect(find.text('See All'), findsOneWidget);
      expect(find.byKey(const Key('featured_restaurants_list')), findsOneWidget);
      expect(find.byKey(const Key('restaurant_card_0')), findsOneWidget);
      expect(find.text('Restaurant 1'), findsOneWidget);
    });

    testWidgets('should display quick actions section', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.count(
                  key: const Key('quick_actions_grid'),
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _QuickActionItem(
                      key: const Key('action_delivery'),
                      icon: Icons.delivery_dining,
                      label: 'Delivery',
                      onTap: () {},
                    ),
                    _QuickActionItem(
                      key: const Key('action_pickup'),
                      icon: Icons.store,
                      label: 'Pickup',
                      onTap: () {},
                    ),
                    _QuickActionItem(
                      key: const Key('action_offers'),
                      icon: Icons.local_offer,
                      label: 'Offers',
                      onTap: () {},
                    ),
                    _QuickActionItem(
                      key: const Key('action_loyalty'),
                      icon: Icons.stars,
                      label: 'Rewards',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('quick_actions_grid')), findsOneWidget);
      expect(find.byKey(const Key('action_delivery')), findsOneWidget);
      expect(find.text('Delivery'), findsOneWidget);
      expect(find.text('Pickup'), findsOneWidget);
      expect(find.text('Offers'), findsOneWidget);
      expect(find.text('Rewards'), findsOneWidget);
    });

    testWidgets('should display recent orders section', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Recent Orders',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListView.builder(
                    key: const Key('recent_orders_list'),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ListTile(
                        key: Key('recent_order_$index'),
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: const Icon(Icons.restaurant),
                        ),
                        title: Text('Order from Restaurant ${index + 1}'),
                        subtitle: const Text('Delivered • \$25.99'),
                        trailing: IconButton(
                          icon: const Icon(Icons.refresh),
                          onPressed: () {},
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.text('Recent Orders'), findsOneWidget);
      expect(find.byKey(const Key('recent_orders_list')), findsOneWidget);
      expect(find.byKey(const Key('recent_order_0')), findsOneWidget);
      expect(find.text('Order from Restaurant 1'), findsOneWidget);
      expect(find.text('Delivered • \$25.99'), findsOneWidget);
    });

    testWidgets('should handle pull to refresh', (WidgetTester tester) async {
      // Arrange
      bool refreshCalled = false;

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: RefreshIndicator(
                key: const Key('refresh_indicator'),
                onRefresh: () async {
                  refreshCalled = true;
                },
                child: const ListView(
                  children: [
                    ListTile(title: Text('Content')),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act
      await tester.fling(find.text('Content'), const Offset(0, 300), 1000);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      // Assert
      expect(find.byKey(const Key('refresh_indicator')), findsOneWidget);
    });

    testWidgets('should display bottom navigation bar', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: const Center(child: Text('Home Content')),
              bottomNavigationBar: BottomNavigationBar(
                key: const Key('bottom_navigation'),
                type: BottomNavigationBarType.fixed,
                currentIndex: 0,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.receipt),
                    label: 'Orders',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('bottom_navigation')), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Cart'), findsOneWidget);
      expect(find.text('Orders'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });
  });
}

class _QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32),
          const SizedBox(height: 4),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}