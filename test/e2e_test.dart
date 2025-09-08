// End-to-End tests for EatFast mobile app
//
// This file contains E2E tests that simulate complete user journeys
// from app launch to order completion and beyond.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/main.dart';

void main() {
  group('End-to-End User Journeys', () {
    testWidgets('New user onboarding to first order', (WidgetTester tester) async {
      // Launch app as new user
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Skip onboarding if shown
      if (find.text('Get Started').evaluate().isNotEmpty) {
        await tester.tap(find.text('Get Started'));
        await tester.pumpAndSettle();
      }

      // Create account
      await tester.tap(find.text('Create Account'));
      await tester.pumpAndSettle();

      // Fill registration form
      await tester.enterText(find.byKey(const Key('firstNameField')), 'Marie');
      await tester.enterText(find.byKey(const Key('lastNameField')), 'Nkounkou');
      await tester.enterText(find.byKey(const Key('emailField')), 'marie.nkounkou@email.com');
      await tester.enterText(find.byKey(const Key('phoneField')), '+237 6XX XXX XXX');
      await tester.enterText(find.byKey(const Key('passwordField')), 'SecurePass123!');
      await tester.pumpAndSettle();

      // Accept terms and conditions
      await tester.tap(find.byKey(const Key('termsCheckbox')));
      await tester.pumpAndSettle();

      // Submit registration
      await tester.tap(find.text('Create Account'));
      await tester.pumpAndSettle();

      // Complete profile setup
      await tester.tap(find.text('Complete Profile'));
      await tester.pumpAndSettle();

      // Add delivery address
      await tester.enterText(find.byKey(const Key('streetField')), '123 Avenue Kennedy');
      await tester.enterText(find.byKey(const Key('cityField')), 'Yaoundé');
      await tester.enterText(find.byKey(const Key('postalCodeField')), '237');
      await tester.enterText(find.byKey(const Key('countryField')), 'Cameroon');
      await tester.pumpAndSettle();

      // Save address
      await tester.tap(find.text('Save Address'));
      await tester.pumpAndSettle();

      // Set delivery preferences
      await tester.tap(find.text('Delivery Preferences'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Leave at door'));
      await tester.pumpAndSettle();

      // Complete onboarding
      await tester.tap(find.text('Finish Setup'));
      await tester.pumpAndSettle();

      // Verify user is logged in and on home screen
      expect(find.text('Welcome, Marie!'), findsOneWidget);

      // Start first order journey
      await tester.tap(find.text('Explore Restaurants'));
      await tester.pumpAndSettle();

      // Browse restaurants
      await tester.tap(find.text('Chez Marie'));
      await tester.pumpAndSettle();

      // Browse menu
      await tester.tap(find.text('Ndolé'));
      await tester.pumpAndSettle();

      // Add to cart
      await tester.tap(find.text('Add to Cart'));
      await tester.pumpAndSettle();

      // Customize order
      await tester.tap(find.text('Customize'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Extra Spicy'));
      await tester.pumpAndSettle();

      // Add another item
      await tester.tap(find.text('Add More Items'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Eru'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add to Cart'));
      await tester.pumpAndSettle();

      // View cart
      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();

      // Apply promo code
      await tester.tap(find.text('Add Promo Code'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'WELCOME10');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Apply'));
      await tester.pumpAndSettle();

      // Proceed to checkout
      await tester.tap(find.text('Checkout'));
      await tester.pumpAndSettle();

      // Select delivery time
      await tester.tap(find.text('Schedule Delivery'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('7:30 PM'));
      await tester.pumpAndSettle();

      // Select payment method
      await tester.tap(find.text('MTN Mobile Money'));
      await tester.pumpAndSettle();

      // Add payment details
      await tester.enterText(find.byKey(const Key('phoneNumberField')), '+237 6XX XXX XXX');
      await tester.pumpAndSettle();

      // Review order
      await tester.tap(find.text('Review Order'));
      await tester.pumpAndSettle();

      // Place order
      await tester.tap(find.text('Place Order'));
      await tester.pumpAndSettle();

      // Confirm payment
      await tester.tap(find.text('Confirm Payment'));
      await tester.pumpAndSettle();

      // Verify order confirmation
      expect(find.text('Order Confirmed!'), findsOneWidget);
      expect(find.text('Order #12345'), findsOneWidget);

      // Check order tracking
      await tester.tap(find.text('Track Order'));
      await tester.pumpAndSettle();

      // Verify loyalty points earned
      expect(find.text('Points earned: 50'), findsOneWidget);
    });

    testWidgets('Returning user: reorder favorite meal', (WidgetTester tester) async {
      // Launch app as returning user
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Login
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('emailField')), 'marie.nkounkou@email.com');
      await tester.enterText(find.byKey(const Key('passwordField')), 'SecurePass123!');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Verify login success
      expect(find.text('Welcome back, Marie!'), findsOneWidget);

      // Navigate to order history
      await tester.tap(find.text('Orders'));
      await tester.pumpAndSettle();

      // Find previous order
      await tester.tap(find.text('Order #12345'));
      await tester.pumpAndSettle();

      // Reorder
      await tester.tap(find.text('Reorder'));
      await tester.pumpAndSettle();

      // Modify order if needed
      await tester.tap(find.text('Modify Order'));
      await tester.pumpAndSettle();

      // Change quantity
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Update cart
      await tester.tap(find.text('Update Cart'));
      await tester.pumpAndSettle();

      // Proceed to checkout
      await tester.tap(find.text('Checkout'));
      await tester.pumpAndSettle();

      // Use saved payment method
      await tester.tap(find.text('Use Saved Card'));
      await tester.pumpAndSettle();

      // Place order
      await tester.tap(find.text('Place Order'));
      await tester.pumpAndSettle();

      // Verify order success
      expect(find.text('Order Placed Successfully'), findsOneWidget);
    });

    testWidgets('Restaurant owner: manage restaurant profile', (WidgetTester tester) async {
      // Launch app as restaurant owner
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Login as restaurant owner
      await tester.tap(find.text('Restaurant Login'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('emailField')), 'owner@chezmarie.com');
      await tester.enterText(find.byKey(const Key('passwordField')), 'RestaurantPass123!');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Verify restaurant dashboard
      expect(find.text('Restaurant Dashboard'), findsOneWidget);

      // Manage menu
      await tester.tap(find.text('Menu Management'));
      await tester.pumpAndSettle();

      // Add new item
      await tester.tap(find.text('Add Item'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('itemNameField')), 'New Dish');
      await tester.enterText(find.byKey(const Key('itemPriceField')), '15000');
      await tester.enterText(find.byKey(const Key('itemDescriptionField')), 'Delicious new dish');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Save Item'));
      await tester.pumpAndSettle();

      // Update restaurant info
      await tester.tap(find.text('Restaurant Settings'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Operating Hours'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('openingTimeField')), '08:00');
      await tester.enterText(find.byKey(const Key('closingTimeField')), '22:00');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Save Hours'));
      await tester.pumpAndSettle();

      // View orders
      await tester.tap(find.text('Orders'));
      await tester.pumpAndSettle();

      // Accept order
      await tester.tap(find.text('Accept Order #12346'));
      await tester.pumpAndSettle();

      // Update order status
      await tester.tap(find.text('Mark as Preparing'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Mark as Ready'));
      await tester.pumpAndSettle();

      // View analytics
      await tester.tap(find.text('Analytics'));
      await tester.pumpAndSettle();

      expect(find.text('Today\'s Revenue'), findsOneWidget);
      expect(find.text('Total Orders'), findsOneWidget);
    });

    testWidgets('Delivery driver: manage deliveries', (WidgetTester tester) async {
      // Launch app as delivery driver
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Login as driver
      await tester.tap(find.text('Driver Login'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('emailField')), 'driver@eatfast.com');
      await tester.enterText(find.byKey(const Key('passwordField')), 'DriverPass123!');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Verify driver dashboard
      expect(find.text('Driver Dashboard'), findsOneWidget);

      // View available deliveries
      await tester.tap(find.text('Available Deliveries'));
      await tester.pumpAndSettle();

      // Accept delivery
      await tester.tap(find.text('Accept Delivery #12347'));
      await tester.pumpAndSettle();

      // Navigate to pickup
      await tester.tap(find.text('Navigate to Restaurant'));
      await tester.pumpAndSettle();

      // Mark as picked up
      await tester.tap(find.text('Mark as Picked Up'));
      await tester.pumpAndSettle();

      // Navigate to delivery
      await tester.tap(find.text('Navigate to Customer'));
      await tester.pumpAndSettle();

      // Mark as delivered
      await tester.tap(find.text('Mark as Delivered'));
      await tester.pumpAndSettle();

      // View earnings
      await tester.tap(find.text('Earnings'));
      await tester.pumpAndSettle();

      expect(find.text('Today\'s Earnings'), findsOneWidget);
      expect(find.text('Total Deliveries'), findsOneWidget);
    });

    testWidgets('Admin: manage platform', (WidgetTester tester) async {
      // Launch app as admin
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Login as admin
      await tester.tap(find.text('Admin Login'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('emailField')), 'admin@eatfast.com');
      await tester.enterText(find.byKey(const Key('passwordField')), 'AdminPass123!');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Verify admin dashboard
      expect(find.text('Admin Dashboard'), findsOneWidget);

      // Manage users
      await tester.tap(find.text('User Management'));
      await tester.pumpAndSettle();

      // View user details
      await tester.tap(find.text('Marie Nkounkou'));
      await tester.pumpAndSettle();

      // Manage restaurants
      await tester.tap(find.text('Restaurant Management'));
      await tester.pumpAndSettle();

      // Approve new restaurant
      await tester.tap(find.text('Approve Chez Marie'));
      await tester.pumpAndSettle();

      // View analytics
      await tester.tap(find.text('Platform Analytics'));
      await tester.pumpAndSettle();

      expect(find.text('Total Users'), findsOneWidget);
      expect(find.text('Total Orders'), findsOneWidget);
      expect(find.text('Revenue'), findsOneWidget);

      // Manage promotions
      await tester.tap(find.text('Promotions'));
      await tester.pumpAndSettle();

      // Create new promotion
      await tester.tap(find.text('Create Promotion'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('promoCodeField')), 'SUMMER2024');
      await tester.enterText(find.byKey(const Key('discountField')), '20');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Create'));
      await tester.pumpAndSettle();
    });

    testWidgets('Complete loyalty program journey', (WidgetTester tester) async {
      // Launch app
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Login
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('emailField')), 'marie.nkounkou@email.com');
      await tester.enterText(find.byKey(const Key('passwordField')), 'SecurePass123!');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Navigate to loyalty
      await tester.tap(find.text('Loyalty'));
      await tester.pumpAndSettle();

      // View current status
      expect(find.text('Current Tier: Bronze'), findsOneWidget);
      expect(find.text('Points: 150'), findsOneWidget);

      // Place multiple orders to earn points
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.text('Restaurants'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Chez Marie'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Ndolé'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Add to Cart'));
        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Icons.shopping_cart));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Checkout'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('MTN Mobile Money'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Place Order'));
        await tester.pumpAndSettle();

        // Go back to home for next order
        await tester.tap(find.byIcon(Icons.home));
        await tester.pumpAndSettle();
      }

      // Check updated loyalty status
      await tester.tap(find.text('Loyalty'));
      await tester.pumpAndSettle();

      expect(find.text('Current Tier: Silver'), findsOneWidget);
      expect(find.text('Points: 650'), findsOneWidget);

      // Redeem reward
      await tester.tap(find.text('Available Rewards'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Free Delivery'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Redeem'));
      await tester.pumpAndSettle();

      // Confirm redemption
      await tester.tap(find.text('Confirm'));
      await tester.pumpAndSettle();

      // Verify points deduction
      expect(find.text('Points: 550'), findsOneWidget);
    });

    testWidgets('Multi-order management', (WidgetTester tester) async {
      // Launch app
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Login
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('emailField')), 'marie.nkounkou@email.com');
      await tester.enterText(find.byKey(const Key('passwordField')), 'SecurePass123!');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Place multiple orders simultaneously
      await tester.tap(find.text('Restaurants'));
      await tester.pumpAndSettle();

      // Order from first restaurant
      await tester.tap(find.text('Chez Marie'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Ndolé'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add to Cart'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Order from second restaurant
      await tester.tap(find.text('Italian Kitchen'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Margherita Pizza'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add to Cart'));
      await tester.pumpAndSettle();

      // View cart with multiple restaurants
      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();

      expect(find.text('Multiple Restaurants'), findsOneWidget);

      // Complete checkout
      await tester.tap(find.text('Checkout'));
      await tester.pumpAndSettle();

      // Verify order splitting
      expect(find.text('Order will be split'), findsOneWidget);

      // Place orders
      await tester.tap(find.text('Place Orders'));
      await tester.pumpAndSettle();

      // Verify multiple order confirmations
      expect(find.text('Orders Confirmed!'), findsOneWidget);
    });

    testWidgets('Offline functionality test', (WidgetTester tester) async {
      // Launch app
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Login
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('emailField')), 'marie.nkounkou@email.com');
      await tester.enterText(find.byKey(const Key('passwordField')), 'SecurePass123!');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Browse restaurants while online
      await tester.tap(find.text('Restaurants'));
      await tester.pumpAndSettle();

      // Simulate going offline
      // In real tests, this would disable network connectivity

      // Try to refresh
      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pumpAndSettle();

      // Verify offline mode
      expect(find.text('You\'re offline'), findsOneWidget);

      // Test cached data access
      expect(find.text('Chez Marie'), findsOneWidget); // Cached restaurant

      // Try to place order offline
      await tester.tap(find.text('Chez Marie'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Ndolé'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add to Cart'));
      await tester.pumpAndSettle();

      // Attempt checkout
      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Checkout'));
      await tester.pumpAndSettle();

      // Verify offline order queuing
      expect(find.text('Order will be placed when online'), findsOneWidget);

      // Simulate coming back online
      // In real tests, this would restore network connectivity

      // Sync pending orders
      await tester.tap(find.text('Sync Orders'));
      await tester.pumpAndSettle();

      // Verify order placement
      expect(find.text('Order Placed Successfully'), findsOneWidget);
    });
  });
}
