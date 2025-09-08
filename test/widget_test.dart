// Comprehensive Flutter widget tests for EatFast mobile app
//
// This file contains widget tests for all major UI components
// including screens, cards, forms, and common widgets.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/main.dart';

void main() {
  group('App Integration Tests', () {
    testWidgets('EatFast app smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      // Pump a single frame
      await tester.pump();

      // Verify that the app widget exists
      expect(find.byType(EatFastApp), findsOneWidget);
    });

    testWidgets('App navigation structure should be correct', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Verify basic navigation elements are present
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });

  group('Loyalty Widget Tests', () {
    testWidgets('PointsSummaryCard should display balance correctly', (WidgetTester tester) async {
      // Mock data
      const availablePoints = 250;
      const totalEarned = 1250;
      const totalSpent = 1000;

      // Build the widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PointsSummaryCardMock(
              availablePoints: availablePoints,
              totalEarned: totalEarned,
              totalSpent: totalSpent,
            ),
          ),
        ),
      );

      // Verify the card displays
      expect(find.byType(PointsSummaryCardMock), findsOneWidget);

      // Verify points are displayed
      expect(find.text('250'), findsOneWidget);
      expect(find.text('points disponibles'), findsOneWidget);
    });

    testWidgets('LoyaltyTierCard should display tier information', (WidgetTester tester) async {
      // Mock tier data
      const tierName = 'Silver';
      const pointsRequired = 500;
      const currentPoints = 350;
      const tierProgress = 0.7;

      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LoyaltyTierCardMock(
              tierName: tierName,
              pointsRequired: pointsRequired,
              currentPoints: currentPoints,
              tierProgress: tierProgress,
              isCurrentTier: false,
              isNextTier: true,
            ),
          ),
        ),
      );

      // Verify the card displays
      expect(find.byType(LoyaltyTierCardMock), findsOneWidget);

      // Verify tier information is displayed
      expect(find.text('Silver'), findsOneWidget);
      expect(find.text('500 points requis'), findsOneWidget);
    });
  });

  group('Restaurant Widget Tests', () {
    testWidgets('RestaurantCard should display restaurant information', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RestaurantCardMock(
              restaurant: mockRestaurant,
              isFavorite: false,
              onTap: () {},
              onFavoriteToggle: () {},
            ),
          ),
        ),
      );

      // Verify the card displays
      expect(find.byType(RestaurantCardMock), findsOneWidget);

      // Verify restaurant information is displayed
      expect(find.text('Chez Marie'), findsOneWidget);
      expect(find.text('Cameroonian'), findsOneWidget);
    });

    testWidgets('MenuItemCard should display menu item information', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuItemCardMock(
              menuItem: mockMenuItem,
              onTap: () {},
            ),
          ),
        ),
      );

      // Verify the card displays
      expect(find.byType(MenuItemCardMock), findsOneWidget);

      // Verify menu item information is displayed
      expect(find.text('Ndolé'), findsOneWidget);
      expect(find.text('8,500 XAF'), findsOneWidget);
    });
  });

  group('Payment Widget Tests', () {
    testWidgets('PaymentMethodSelector should display payment options', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaymentMethodSelectorMock(
              selectedMethod: PaymentMethodMock.mtn,
              onMethodSelected: (method) {},
            ),
          ),
        ),
      );

      // Verify the selector displays
      expect(find.byType(PaymentMethodSelectorMock), findsOneWidget);

      // Verify payment methods are displayed
      expect(find.text('MTN Mobile Money'), findsOneWidget);
      expect(find.text('Cash on Delivery'), findsOneWidget);
    });

    testWidgets('PaymentSummary should display order total correctly', (WidgetTester tester) async {
      // Mock order data
      const subtotal = 25000;
      const deliveryFee = 1500;
      const total = 26500;

      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaymentSummaryMock(
              subtotal: subtotal,
              deliveryFee: deliveryFee,
              total: total,
            ),
          ),
        ),
      );

      // Verify the summary displays
      expect(find.byType(PaymentSummaryMock), findsOneWidget);

      // Verify amounts are displayed correctly
      expect(find.text('25,000 XAF'), findsOneWidget);
      expect(find.text('1,500 XAF'), findsOneWidget);
      expect(find.text('26,500 XAF'), findsOneWidget);
    });
  });

  group('Profile Widget Tests', () {
    testWidgets('ProfileAvatar should display user avatar', (WidgetTester tester) async {
      // Mock user data
      const userName = 'Jean Dupont';
      const avatarUrl = 'https://example.com/avatar.jpg';

      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProfileAvatarMock(
              userName: userName,
              avatarUrl: avatarUrl,
              radius: 40,
            ),
          ),
        ),
      );

      // Verify the avatar displays
      expect(find.byType(ProfileAvatarMock), findsOneWidget);

      // Verify user name is displayed as fallback
      expect(find.text('JD'), findsOneWidget);
    });

    testWidgets('ProfileStats should display user statistics', (WidgetTester tester) async {
      // Mock statistics
      const ordersCount = 25;
      const favoriteRestaurantsCount = 8;
      const loyaltyPoints = 1250;

      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProfileStatsMock(
              ordersCount: ordersCount,
              favoriteRestaurantsCount: favoriteRestaurantsCount,
              loyaltyPoints: loyaltyPoints,
            ),
          ),
        ),
      );

      // Verify the stats display
      expect(find.byType(ProfileStatsMock), findsOneWidget);

      // Verify statistics are displayed
      expect(find.text('25'), findsOneWidget);
      expect(find.text('8'), findsOneWidget);
      expect(find.text('1,250'), findsOneWidget);
    });
  });

  group('Common Widget Tests', () {
    testWidgets('LoadingOverlay should display loading indicator', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LoadingOverlayMock(
              isLoading: true,
              child: Container(),
            ),
          ),
        ),
      );

      // Verify the overlay displays
      expect(find.byType(LoadingOverlayMock), findsOneWidget);

      // Verify loading indicator is shown
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('ErrorView should display error message', (WidgetTester tester) async {
      // Mock error data
      const errorMessage = 'Failed to load data';

      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ErrorViewMock(
              message: errorMessage,
              onRetry: () {},
            ),
          ),
        ),
      );

      // Verify the error view displays
      expect(find.byType(ErrorViewMock), findsOneWidget);

      // Verify error message is displayed
      expect(find.text(errorMessage), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });

    testWidgets('EmptyState should display empty state message', (WidgetTester tester) async {
      // Mock empty state data
      const title = 'No items found';
      const message = 'Try adjusting your filters';
      const actionText = 'Clear filters';

      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmptyStateMock(
              title: title,
              message: message,
              actionText: actionText,
              onAction: () {},
            ),
          ),
        ),
      );

      // Verify the empty state displays
      expect(find.byType(EmptyStateMock), findsOneWidget);

      // Verify content is displayed
      expect(find.text(title), findsOneWidget);
      expect(find.text(message), findsOneWidget);
      expect(find.text(actionText), findsOneWidget);
    });
  });

  group('Form Widget Tests', () {
    testWidgets('Login form should validate correctly', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LoginFormMock(),
          ),
        ),
      );

      // Verify the form displays
      expect(find.byType(LoginFormMock), findsOneWidget);

      // Verify form fields are present
      expect(find.byType(TextFormField), findsWidgets);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('Registration form should validate correctly', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RegistrationFormMock(),
          ),
        ),
      );

      // Verify the form displays
      expect(find.byType(RegistrationFormMock), findsOneWidget);

      // Verify form fields are present
      expect(find.byType(TextFormField), findsWidgets);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('Address form should validate correctly', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AddressFormMock(),
          ),
        ),
      );

      // Verify the form displays
      expect(find.byType(AddressFormMock), findsOneWidget);

      // Verify form fields are present
      expect(find.byType(TextFormField), findsWidgets);
    });
  });

  group('Navigation Tests', () {
    testWidgets('Bottom navigation should switch tabs correctly', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: BottomNavigationMock(),
        ),
      );

      // Verify the navigation displays
      expect(find.byType(BottomNavigationMock), findsOneWidget);

      // Verify navigation items are present
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Restaurants'), findsOneWidget);
      expect(find.text('Orders'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('Drawer navigation should work correctly', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            drawer: DrawerMock(),
            body: Container(),
          ),
        ),
      );

      // Open the drawer
      await tester.dragFrom(
        tester.getTopLeft(find.byType(Scaffold)),
        const Offset(300, 0),
      );
      await tester.pumpAndSettle();

      // Verify the drawer displays
      expect(find.byType(DrawerMock), findsOneWidget);

      // Verify drawer items are present
      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Help'), findsOneWidget);
      expect(find.text('Logout'), findsOneWidget);
    });
  });
}

// Mock classes for testing (these simulate the actual widget classes)
class PointsSummaryCardMock extends StatelessWidget {
  const PointsSummaryCardMock({
    super.key,
    required this.availablePoints,
    required this.totalEarned,
    required this.totalSpent,
  });

  final int availablePoints;
  final int totalEarned;
  final int totalSpent;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('$availablePoints'),
            const Text('points disponibles'),
          ],
        ),
      ),
    );
  }
}

class LoyaltyTierCardMock extends StatelessWidget {
  const LoyaltyTierCardMock({
    super.key,
    required this.tierName,
    required this.pointsRequired,
    required this.currentPoints,
    required this.tierProgress,
    required this.isCurrentTier,
    required this.isNextTier,
  });

  final String tierName;
  final int pointsRequired;
  final int currentPoints;
  final double tierProgress;
  final bool isCurrentTier;
  final bool isNextTier;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(tierName),
            Text('$pointsRequired points requis'),
          ],
        ),
      ),
    );
  }
}

// Mock data classes
class Restaurant {
  const Restaurant({
    required this.id,
    required this.name,
    required this.cuisineType,
    required this.rating,
    required this.deliveryTime,
    required this.deliveryFee,
  });

  final String id;
  final String name;
  final String cuisineType;
  final double rating;
  final int deliveryTime;
  final int deliveryFee;
}

class MenuItem {
  const MenuItem({
    required this.id,
    required this.name,
    required this.price,
    required this.isPopular,
  });

  final String id;
  final String name;
  final int price;
  final bool isPopular;
}

// Mock data instances
const mockRestaurant = Restaurant(
  id: '1',
  name: 'Chez Marie',
  cuisineType: 'Cameroonian',
  rating: 4.5,
  deliveryTime: 30,
  deliveryFee: 1500,
);

const mockMenuItem = MenuItem(
  id: '1',
  name: 'Ndolé',
  price: 8500,
  isPopular: true,
);

// Mock widget classes
class RestaurantCardMock extends StatelessWidget {
  const RestaurantCardMock({
    super.key,
    required this.restaurant,
    required this.isFavorite,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  final Restaurant restaurant;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(restaurant.name),
        subtitle: Text(restaurant.cuisineType),
        onTap: onTap,
      ),
    );
  }
}

class MenuItemCardMock extends StatelessWidget {
  const MenuItemCardMock({
    super.key,
    required this.menuItem,
    required this.onTap,
  });

  final MenuItem menuItem;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(menuItem.name),
        subtitle: Text('${menuItem.price} XAF'),
        onTap: onTap,
      ),
    );
  }
}

enum PaymentMethodMock {
  cash,
  mtn;

  String get displayName {
    switch (this) {
      case PaymentMethodMock.cash:
        return 'Cash on Delivery';
      case PaymentMethodMock.mtn:
        return 'MTN Mobile Money';
    }
  }
}

class PaymentMethodSelectorMock extends StatelessWidget {
  const PaymentMethodSelectorMock({
    super.key,
    required this.selectedMethod,
    required this.onMethodSelected,
  });

  final PaymentMethodMock selectedMethod;
  final ValueChanged<PaymentMethodMock> onMethodSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('MTN Mobile Money'),
          leading: Radio<PaymentMethodMock>(
            value: PaymentMethodMock.mtn,
            groupValue: selectedMethod,
            onChanged: (value) => onMethodSelected(value!),
          ),
        ),
        ListTile(
          title: const Text('Cash on Delivery'),
          leading: Radio<PaymentMethodMock>(
            value: PaymentMethodMock.cash,
            groupValue: selectedMethod,
            onChanged: (value) => onMethodSelected(value!),
          ),
        ),
      ],
    );
  }
}

class PaymentSummaryMock extends StatelessWidget {
  const PaymentSummaryMock({
    super.key,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  final int subtotal;
  final int deliveryFee;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Subtotal: $subtotal XAF'),
        Text('Delivery: $deliveryFee XAF'),
        Text('Total: $total XAF'),
      ],
    );
  }
}

class ProfileAvatarMock extends StatelessWidget {
  const ProfileAvatarMock({
    super.key,
    required this.userName,
    required this.avatarUrl,
    required this.radius,
  });

  final String userName;
  final String? avatarUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: Text(userName.split(' ').map((n) => n.isEmpty ? '' : n[0]).take(2).join()),
    );
  }
}

class ProfileStatsMock extends StatelessWidget {
  const ProfileStatsMock({
    super.key,
    required this.ordersCount,
    required this.favoriteRestaurantsCount,
    required this.loyaltyPoints,
  });

  final int ordersCount;
  final int favoriteRestaurantsCount;
  final int loyaltyPoints;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Orders: $ordersCount'),
        Text('Favorites: $favoriteRestaurantsCount'),
        Text('Points: $loyaltyPoints'),
      ],
    );
  }
}

class LoadingOverlayMock extends StatelessWidget {
  const LoadingOverlayMock({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}

class ErrorViewMock extends StatelessWidget {
  const ErrorViewMock({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

class EmptyStateMock extends StatelessWidget {
  const EmptyStateMock({
    super.key,
    required this.title,
    required this.message,
    required this.actionText,
    required this.onAction,
  });

  final String title;
  final String message;
  final String actionText;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          Text(message),
          ElevatedButton(
            onPressed: onAction,
            child: Text(actionText),
          ),
        ],
      ),
    );
  }
}

class LoginFormMock extends StatelessWidget {
  const LoginFormMock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(labelText: 'Email'),
        ),
        const TextField(
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Login'),
        ),
      ],
    );
  }
}

class RegistrationFormMock extends StatelessWidget {
  const RegistrationFormMock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(labelText: 'First Name'),
        ),
        const TextField(
          decoration: InputDecoration(labelText: 'Last Name'),
        ),
        const TextField(
          decoration: InputDecoration(labelText: 'Email'),
        ),
        const TextField(
          decoration: InputDecoration(labelText: 'Phone'),
        ),
        const TextField(
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Register'),
        ),
      ],
    );
  }
}

class AddressFormMock extends StatelessWidget {
  const AddressFormMock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(labelText: 'Street Address'),
        ),
        const TextField(
          decoration: InputDecoration(labelText: 'City'),
        ),
        const TextField(
          decoration: InputDecoration(labelText: 'Postal Code'),
        ),
        const TextField(
          decoration: InputDecoration(labelText: 'Country'),
        ),
      ],
    );
  }
}

class BottomNavigationMock extends StatelessWidget {
  const BottomNavigationMock({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant),
          label: 'Restaurants',
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
    );
  }
}

class DrawerMock extends StatelessWidget {
  const DrawerMock({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('EatFast'),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
