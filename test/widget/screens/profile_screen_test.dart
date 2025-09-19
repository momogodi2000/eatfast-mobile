import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  group('Profile Screen Widget Tests', () {
    testWidgets('should display user profile header', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  Container(
                    key: const Key('profile_header'),
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              key: const Key('profile_avatar'),
                              radius: 40,
                              backgroundColor: Colors.grey[300],
                              child: const Icon(Icons.person, size: 40),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                key: const Key('edit_profile_picture_button'),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'john.doe@example.com',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '+1 (555) 123-4567',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          key: const Key('edit_profile_button'),
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
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
      expect(find.byKey(const Key('profile_header')), findsOneWidget);
      expect(find.byKey(const Key('profile_avatar')), findsOneWidget);
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('john.doe@example.com'), findsOneWidget);
      expect(find.text('+1 (555) 123-4567'), findsOneWidget);
      expect(find.byKey(const Key('edit_profile_picture_button')), findsOneWidget);
      expect(find.byKey(const Key('edit_profile_button')), findsOneWidget);
    });

    testWidgets('should display loyalty stats', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Container(
                key: const Key('loyalty_stats_card'),
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.red],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Gold Member',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.stars, color: Colors.white),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                '2,450',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Points',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 40,
                          color: Colors.white30,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                '18',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Orders',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 40,
                          color: Colors.white30,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                '550',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'To Platinum',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
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
      expect(find.byKey(const Key('loyalty_stats_card')), findsOneWidget);
      expect(find.text('Gold Member'), findsOneWidget);
      expect(find.text('2,450'), findsOneWidget);
      expect(find.text('Points'), findsOneWidget);
      expect(find.text('18'), findsOneWidget);
      expect(find.text('Orders'), findsOneWidget);
      expect(find.text('550'), findsOneWidget);
      expect(find.text('To Platinum'), findsOneWidget);
    });

    testWidgets('should display profile menu items', (WidgetTester tester) async {
      // Arrange
      final menuItems = [
        {'title': 'Order History', 'icon': Icons.receipt, 'key': 'order_history'},
        {'title': 'Favorite Restaurants', 'icon': Icons.favorite, 'key': 'favorites'},
        {'title': 'Addresses', 'icon': Icons.location_on, 'key': 'addresses'},
        {'title': 'Payment Methods', 'icon': Icons.credit_card, 'key': 'payment_methods'},
        {'title': 'Notifications', 'icon': Icons.notifications, 'key': 'notifications'},
        {'title': 'Help & Support', 'icon': Icons.help, 'key': 'help'},
        {'title': 'About', 'icon': Icons.info, 'key': 'about'},
      ];

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ListView.builder(
                key: const Key('profile_menu_list'),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return ListTile(
                    key: Key('menu_item_${item['key']}'),
                    leading: Icon(item['icon'] as IconData),
                    title: Text(item['title'] as String),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  );
                },
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('profile_menu_list')), findsOneWidget);
      expect(find.byKey(const Key('menu_item_order_history')), findsOneWidget);
      expect(find.text('Order History'), findsOneWidget);
      expect(find.byKey(const Key('menu_item_favorites')), findsOneWidget);
      expect(find.text('Favorite Restaurants'), findsOneWidget);
      expect(find.byKey(const Key('menu_item_addresses')), findsOneWidget);
      expect(find.text('Addresses'), findsOneWidget);
      expect(find.byKey(const Key('menu_item_payment_methods')), findsOneWidget);
      expect(find.text('Payment Methods'), findsOneWidget);
      expect(find.text('Help & Support'), findsOneWidget);
    });

    testWidgets('should display settings section', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  Container(
                    key: const Key('settings_section'),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        SwitchListTile(
                          key: const Key('push_notifications_switch'),
                          title: const Text('Push Notifications'),
                          subtitle: const Text('Receive notifications about orders'),
                          value: true,
                          onChanged: (value) {},
                        ),
                        SwitchListTile(
                          key: const Key('email_notifications_switch'),
                          title: const Text('Email Notifications'),
                          subtitle: const Text('Receive promotional emails'),
                          value: false,
                          onChanged: (value) {},
                        ),
                        SwitchListTile(
                          key: const Key('location_services_switch'),
                          title: const Text('Location Services'),
                          subtitle: const Text('Help us find nearby restaurants'),
                          value: true,
                          onChanged: (value) {},
                        ),
                        ListTile(
                          key: const Key('language_setting'),
                          title: const Text('Language'),
                          subtitle: const Text('English'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        ListTile(
                          key: const Key('theme_setting'),
                          title: const Text('Theme'),
                          subtitle: const Text('System Default'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {},
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
      expect(find.byKey(const Key('settings_section')), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
      expect(find.byKey(const Key('push_notifications_switch')), findsOneWidget);
      expect(find.text('Push Notifications'), findsOneWidget);
      expect(find.text('Receive notifications about orders'), findsOneWidget);
      expect(find.byKey(const Key('email_notifications_switch')), findsOneWidget);
      expect(find.text('Email Notifications'), findsOneWidget);
      expect(find.byKey(const Key('location_services_switch')), findsOneWidget);
      expect(find.text('Location Services'), findsOneWidget);
      expect(find.byKey(const Key('language_setting')), findsOneWidget);
      expect(find.text('Language'), findsOneWidget);
      expect(find.text('English'), findsOneWidget);
      expect(find.byKey(const Key('theme_setting')), findsOneWidget);
      expect(find.text('Theme'), findsOneWidget);
      expect(find.text('System Default'), findsOneWidget);
    });

    testWidgets('should display logout button', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Center(
                child: Container(
                  key: const Key('logout_section'),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ListTile(
                        key: const Key('logout_button'),
                        leading: const Icon(Icons.logout, color: Colors.red),
                        title: const Text(
                          'Logout',
                          style: TextStyle(color: Colors.red),
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Version 1.0.0',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('logout_section')), findsOneWidget);
      expect(find.byKey(const Key('logout_button')), findsOneWidget);
      expect(find.text('Logout'), findsOneWidget);
      expect(find.text('Version 1.0.0'), findsOneWidget);
    });

    testWidgets('should handle logout confirmation dialog', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return ElevatedButton(
                    key: const Key('show_logout_dialog_button'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          key: const Key('logout_confirmation_dialog'),
                          title: const Text('Logout'),
                          content: const Text('Are you sure you want to logout?'),
                          actions: [
                            TextButton(
                              key: const Key('cancel_logout_button'),
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              key: const Key('confirm_logout_button'),
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Logout'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Show Logout Dialog'),
                  );
                },
              ),
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byKey(const Key('show_logout_dialog_button')));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byKey(const Key('logout_confirmation_dialog')), findsOneWidget);
      expect(find.text('Logout'), findsNWidgets(2));
      expect(find.text('Are you sure you want to logout?'), findsOneWidget);
      expect(find.byKey(const Key('cancel_logout_button')), findsOneWidget);
      expect(find.byKey(const Key('confirm_logout_button')), findsOneWidget);
    });

    testWidgets('should display edit profile form', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Edit Profile'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  key: const Key('edit_profile_form'),
                  children: [
                    const TextField(
                      key: Key('first_name_field'),
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const TextField(
                      key: Key('last_name_field'),
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const TextField(
                      key: Key('email_field'),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const TextField(
                      key: Key('phone_field'),
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            key: const Key('cancel_edit_button'),
                            onPressed: () {},
                            child: const Text('Cancel'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            key: const Key('save_profile_button'),
                            onPressed: () {},
                            child: const Text('Save Changes'),
                          ),
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
      expect(find.text('Edit Profile'), findsOneWidget);
      expect(find.byKey(const Key('edit_profile_form')), findsOneWidget);
      expect(find.byKey(const Key('first_name_field')), findsOneWidget);
      expect(find.byKey(const Key('last_name_field')), findsOneWidget);
      expect(find.byKey(const Key('email_field')), findsOneWidget);
      expect(find.byKey(const Key('phone_field')), findsOneWidget);
      expect(find.byKey(const Key('cancel_edit_button')), findsOneWidget);
      expect(find.byKey(const Key('save_profile_button')), findsOneWidget);
      expect(find.text('Save Changes'), findsOneWidget);
    });

    testWidgets('should display order history section', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ListView.builder(
                key: const Key('order_history_list'),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    key: Key('order_card_$index'),
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.restaurant),
                      ),
                      title: Text('Order from Restaurant ${index + 1}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order #EF${1000 + index}'),
                          const Text('Delivered • \$25.99'),
                          Text('Jan ${15 + index}, 2024'),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            key: Key('reorder_button_$index'),
                            onPressed: () {},
                            icon: const Icon(Icons.refresh),
                          ),
                          const Text('Reorder', style: TextStyle(fontSize: 12)),
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
      expect(find.byKey(const Key('order_history_list')), findsOneWidget);
      expect(find.byKey(const Key('order_card_0')), findsOneWidget);
      expect(find.text('Order from Restaurant 1'), findsOneWidget);
      expect(find.text('Order #EF1000'), findsOneWidget);
      expect(find.text('Delivered • \$25.99'), findsNWidgets(3));
      expect(find.byKey(const Key('reorder_button_0')), findsOneWidget);
      expect(find.text('Reorder'), findsNWidgets(3));
    });

    testWidgets('should display favorite restaurants', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: GridView.builder(
                key: const Key('favorites_grid'),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Card(
                    key: Key('favorite_card_$index'),
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(8),
                              ),
                            ),
                            child: Stack(
                              children: [
                                const Center(child: Icon(Icons.restaurant, size: 40)),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: IconButton(
                                    key: Key('unfavorite_button_$index'),
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Text('Restaurant ${index + 1}'),
                              const Text('★ 4.5 • 20-30 min'),
                              const Text('\$\$ • Italian'),
                            ],
                          ),
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

      // Act & Assert
      expect(find.byKey(const Key('favorites_grid')), findsOneWidget);
      expect(find.byKey(const Key('favorite_card_0')), findsOneWidget);
      expect(find.text('Restaurant 1'), findsOneWidget);
      expect(find.text('★ 4.5 • 20-30 min'), findsNWidgets(4));
      expect(find.byKey(const Key('unfavorite_button_0')), findsOneWidget);
    });
  });
}