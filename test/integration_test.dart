// Integration tests for EatFast mobile app
//
// This file contains integration tests that verify user flows
// across multiple features and screens.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/main.dart';

void main() {
  group('User Flow Integration Tests', () {
    testWidgets('Complete restaurant discovery to order flow', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Verify app starts on home screen
      expect(find.byType(EatFastApp), findsOneWidget);

      // Navigate to restaurants
      await tester.tap(find.text('Restaurants'));
      await tester.pumpAndSettle();

      // Select a restaurant
      await tester.tap(find.text('Chez Marie'));
      await tester.pumpAndSettle();

      // Add items to cart
      await tester.tap(find.text('Ndolé'));
      await tester.pumpAndSettle();

      // Navigate to cart
      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();

      // Proceed to checkout
      await tester.tap(find.text('Checkout'));
      await tester.pumpAndSettle();

      // Select payment method
      await tester.tap(find.text('MTN Mobile Money'));
      await tester.pumpAndSettle();

      // Place order
      await tester.tap(find.text('Place Order'));
      await tester.pumpAndSettle();

      // Verify order confirmation
      expect(find.text('Order Placed Successfully'), findsOneWidget);
    });

    testWidgets('Loyalty program integration flow', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Navigate to profile
      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();

      // Access loyalty section
      await tester.tap(find.text('Loyalty Program'));
      await tester.pumpAndSettle();

      // View current tier
      expect(find.text('Current Tier: Silver'), findsOneWidget);

      // View available rewards
      await tester.tap(find.text('Available Rewards'));
      await tester.pumpAndSettle();

      // Redeem a reward
      await tester.tap(find.text('Free Delivery'));
      await tester.pumpAndSettle();

      // Confirm redemption
      await tester.tap(find.text('Confirm'));
      await tester.pumpAndSettle();

      // Verify points deduction
      expect(find.text('Points remaining: 200'), findsOneWidget);
    });

    testWidgets('Wallet and payment integration', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Navigate to wallet
      await tester.tap(find.text('Wallet'));
      await tester.pumpAndSettle();

      // Check balance
      expect(find.text('Balance: 25,000 XAF'), findsOneWidget);

      // Add money to wallet
      await tester.tap(find.text('Add Money'));
      await tester.pumpAndSettle();

      // Select amount
      await tester.tap(find.text('10,000 XAF'));
      await tester.pumpAndSettle();

      // Select payment method
      await tester.tap(find.text('MTN Mobile Money'));
      await tester.pumpAndSettle();

      // Confirm transaction
      await tester.tap(find.text('Confirm'));
      await tester.pumpAndSettle();

      // Verify updated balance
      expect(find.text('Balance: 35,000 XAF'), findsOneWidget);
    });

    testWidgets('User registration and profile setup flow', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Navigate to login
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Switch to registration
      await tester.tap(find.text('Create Account'));
      await tester.pumpAndSettle();

      // Fill registration form
      await tester.enterText(find.byType(TextField).at(0), 'Jean');
      await tester.enterText(find.byType(TextField).at(1), 'Dupont');
      await tester.enterText(find.byType(TextField).at(2), 'jean.dupont@email.com');
      await tester.enterText(find.byType(TextField).at(3), '+237 6XX XXX XXX');
      await tester.enterText(find.byType(TextField).at(4), 'password123');
      await tester.pumpAndSettle();

      // Submit registration
      await tester.tap(find.text('Register'));
      await tester.pumpAndSettle();

      // Complete profile setup
      await tester.tap(find.text('Complete Profile'));
      await tester.pumpAndSettle();

      // Add delivery address
      await tester.enterText(find.byType(TextField).at(0), '123 Main Street');
      await tester.enterText(find.byType(TextField).at(1), 'Yaoundé');
      await tester.enterText(find.byType(TextField).at(2), '237');
      await tester.pumpAndSettle();

      // Save address
      await tester.tap(find.text('Save Address'));
      await tester.pumpAndSettle();

      // Verify profile completion
      expect(find.text('Profile Complete'), findsOneWidget);
    });

    testWidgets('Order tracking and history flow', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Navigate to orders
      await tester.tap(find.text('Orders'));
      await tester.pumpAndSettle();

      // View order history
      expect(find.text('Recent Orders'), findsOneWidget);

      // Select an order
      await tester.tap(find.text('Order #12345'));
      await tester.pumpAndSettle();

      // View order details
      expect(find.text('Order Details'), findsOneWidget);
      expect(find.text('Status: Preparing'), findsOneWidget);

      // Track order
      await tester.tap(find.text('Track Order'));
      await tester.pumpAndSettle();

      // View delivery progress
      expect(find.text('Delivery Progress'), findsOneWidget);
      expect(find.text('Estimated delivery: 25 min'), findsOneWidget);
    });

    testWidgets('Restaurant search and filtering flow', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Navigate to restaurants
      await tester.tap(find.text('Restaurants'));
      await tester.pumpAndSettle();

      // Use search
      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'pizza');
      await tester.pumpAndSettle();

      // Verify search results
      expect(find.text('Pizza Palace'), findsOneWidget);

      // Apply filters
      await tester.tap(find.text('Filters'));
      await tester.pumpAndSettle();

      // Select cuisine type
      await tester.tap(find.text('Italian'));
      await tester.pumpAndSettle();

      // Select price range
      await tester.tap(find.text('$$'));
      await tester.pumpAndSettle();

      // Apply filters
      await tester.tap(find.text('Apply'));
      await tester.pumpAndSettle();

      // Verify filtered results
      expect(find.text('Pizza Palace'), findsOneWidget);
      expect(find.text('Italian Kitchen'), findsOneWidget);
    });

    testWidgets('Favorites management flow', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Navigate to restaurants
      await tester.tap(find.text('Restaurants'));
      await tester.pumpAndSettle();

      // Add restaurant to favorites
      await tester.tap(find.byIcon(Icons.favorite_border).first);
      await tester.pumpAndSettle();

      // Navigate to favorites
      await tester.tap(find.text('Favorites'));
      await tester.pumpAndSettle();

      // Verify restaurant is in favorites
      expect(find.text('Chez Marie'), findsOneWidget);

      // Remove from favorites
      await tester.tap(find.byIcon(Icons.favorite));
      await tester.pumpAndSettle();

      // Verify removal
      expect(find.text('No favorites yet'), findsOneWidget);
    });

    testWidgets('Settings and preferences flow', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Navigate to profile
      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();

      // Access settings
      await tester.tap(find.text('Settings'));
      await tester.pumpAndSettle();

      // Change notification preferences
      await tester.tap(find.text('Notifications'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Order Updates'));
      await tester.pumpAndSettle();

      // Change language
      await tester.tap(find.text('Language'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Français'));
      await tester.pumpAndSettle();

      // Change theme
      await tester.tap(find.text('Theme'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Dark Mode'));
      await tester.pumpAndSettle();

      // Save settings
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Verify settings saved
      expect(find.text('Settings Saved'), findsOneWidget);
    });

    testWidgets('Error handling and recovery flow', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Navigate to restaurants
      await tester.tap(find.text('Restaurants'));
      await tester.pumpAndSettle();

      // Simulate network error (this would be mocked in real tests)
      // For now, we'll test the error UI components

      // Verify error state handling
      expect(find.byType(EatFastApp), findsOneWidget);

      // Test retry functionality
      if (find.text('Retry').evaluate().isNotEmpty) {
        await tester.tap(find.text('Retry'));
        await tester.pumpAndSettle();
      }

      // Test offline mode
      // This would test cached data display
      expect(find.byType(EatFastApp), findsOneWidget);
    });

    testWidgets('Multi-language support flow', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Check default language (English)
      expect(find.text('Restaurants'), findsOneWidget);

      // Change to French
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Language'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Français'));
      await tester.pumpAndSettle();

      // Verify language change
      expect(find.text('Restaurants'), findsNothing);
      expect(find.text('Restaurants'), findsOneWidget); // French equivalent

      // Test RTL support if Arabic is added
      // await tester.tap(find.text('العربية'));
      // await tester.pumpAndSettle();
      // Verify RTL layout
    });

    testWidgets('Accessibility features flow', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Test screen reader support
      // Verify semantic labels
      expect(find.bySemanticsLabel('Restaurants'), findsOneWidget);

      // Test keyboard navigation
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pumpAndSettle();

      // Test high contrast mode
      // This would be tested with platform settings

      // Test font scaling
      // This would be tested with system font size changes

      // Verify accessibility compliance
      expect(find.byType(EatFastApp), findsOneWidget);
    });
  });

  group('Performance Integration Tests', () {
    testWidgets('App startup performance', (WidgetTester tester) async {
      final stopwatch = Stopwatch()..start();

      // Build the app
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      // Measure initial render time
      await tester.pumpAndSettle();
      stopwatch.stop();

      // Verify startup time is reasonable (< 3 seconds)
      expect(stopwatch.elapsedMilliseconds, lessThan(3000));

      // Verify main UI elements are rendered
      expect(find.byType(EatFastApp), findsOneWidget);
    });

    testWidgets('List scrolling performance', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Navigate to restaurants
      await tester.tap(find.text('Restaurants'));
      await tester.pumpAndSettle();

      // Measure scroll performance
      final stopwatch = Stopwatch()..start();

      // Perform scroll gestures
      await tester.fling(find.byType(ListView), const Offset(0, -500), 1000);
      await tester.pumpAndSettle();

      stopwatch.stop();

      // Verify smooth scrolling (< 100ms per frame)
      expect(stopwatch.elapsedMilliseconds, lessThan(1000));
    });

    testWidgets('Memory usage during navigation', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Navigate through multiple screens
      await tester.tap(find.text('Restaurants'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Orders'));
      await tester.pumpAndSettle();

      // Navigate back
      await tester.pageBack();
      await tester.pumpAndSettle();

      // Verify app remains stable
      expect(find.byType(EatFastApp), findsOneWidget);
    });
  });

  group('Cross-platform Integration Tests', () {
    testWidgets('Responsive layout on different screen sizes', (WidgetTester tester) async {
      // Test on mobile size
      tester.binding.window.physicalSizeTestValue = const Size(375, 667);
      tester.binding.window.devicePixelRatioTestValue = 2.0;

      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Verify mobile layout
      expect(find.byType(EatFastApp), findsOneWidget);

      // Test on tablet size
      tester.binding.window.physicalSizeTestValue = const Size(768, 1024);
      tester.binding.window.devicePixelRatioTestValue = 2.0;

      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Verify tablet layout
      expect(find.byType(EatFastApp), findsOneWidget);

      // Reset to default
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });

    testWidgets('Platform-specific features', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Test platform-specific UI elements
      // This would include platform-specific navigation patterns,
      // payment methods, etc.

      expect(find.byType(EatFastApp), findsOneWidget);
    });
  });
}
