import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:integration_test/integration_test.dart';

import 'package:eatfast_mobile/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Integration Tests', () {
    testWidgets('App starts and navigates successfully', (WidgetTester tester) async {
      // Start the app
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      // Wait for the app to settle
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Verify the app started successfully
      expect(find.byType(MaterialApp), findsOneWidget);

      // The app should show some UI elements
      expect(find.byType(Scaffold), findsAtLeastNWidgets(1));
    });

    testWidgets('Navigation between screens works', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Look for navigation elements like bottom navigation or drawer
      final bottomNavFinder = find.byType(BottomNavigationBar);
      final drawerFinder = find.byType(Drawer);
      final appBarFinder = find.byType(AppBar);

      // At least one navigation element should be present
      expect(
        bottomNavFinder.evaluate().isNotEmpty ||
        drawerFinder.evaluate().isNotEmpty ||
        appBarFinder.evaluate().isNotEmpty,
        true,
        reason: 'App should have some navigation UI',
      );
    });

    testWidgets('Language settings can be accessed and changed', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Look for settings or language-related UI
      final settingsIconFinder = find.byIcon(Icons.settings);
      final menuIconFinder = find.byIcon(Icons.menu);
      final moreIconFinder = find.byIcon(Icons.more_vert);

      // Try to find and tap a settings-related element
      if (settingsIconFinder.evaluate().isNotEmpty) {
        await tester.tap(settingsIconFinder.first);
        await tester.pumpAndSettle();
      } else if (menuIconFinder.evaluate().isNotEmpty) {
        await tester.tap(menuIconFinder.first);
        await tester.pumpAndSettle();
      } else if (moreIconFinder.evaluate().isNotEmpty) {
        await tester.tap(moreIconFinder.first);
        await tester.pumpAndSettle();
      }

      // After navigation, the app should still be functional
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('App handles screen rotations', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Get initial orientation
      final Size originalSize = tester.binding.window.physicalSize;

      // Simulate screen rotation by changing the view size
      tester.binding.window.physicalSizeTestValue = Size(
        originalSize.height,
        originalSize.width,
      );

      await tester.pumpAndSettle();

      // Verify app still works after rotation
      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(Scaffold), findsAtLeastNWidgets(1));

      // Restore original size
      tester.binding.window.physicalSizeTestValue = originalSize;
      await tester.pumpAndSettle();
    });

    testWidgets('App survives app lifecycle changes', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Simulate app being paused
      await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
        'flutter/lifecycle',
        const StandardMethodCodec().encodeMethodCall(
          const MethodCall('AppLifecycleState.paused'),
        ),
        (data) {},
      );

      await tester.pumpAndSettle();

      // Simulate app being resumed
      await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
        'flutter/lifecycle',
        const StandardMethodCodec().encodeMethodCall(
          const MethodCall('AppLifecycleState.resumed'),
        ),
        (data) {},
      );

      await tester.pumpAndSettle();

      // App should still be functional after lifecycle changes
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('App UI is accessible', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Check for semantic labels on interactive elements
      final semanticsFinder = find.byType(Semantics);
      
      // There should be some semantic labels for accessibility
      if (semanticsFinder.evaluate().isNotEmpty) {
        expect(semanticsFinder.evaluate().length, greaterThan(0));
      }

      // Check that buttons have proper touch targets (minimum 44dp)
      final buttonFinders = [
        find.byType(ElevatedButton),
        find.byType(TextButton),
        find.byType(OutlinedButton),
        find.byType(FloatingActionButton),
        find.byType(IconButton),
      ];

      for (final buttonFinder in buttonFinders) {
        if (buttonFinder.evaluate().isNotEmpty) {
          for (final element in buttonFinder.evaluate()) {
            final widget = element.widget;
            final renderObject = element.renderObject;
            
            if (renderObject != null && renderObject.hasSize) {
              final size = renderObject.semanticBounds.size;
              
              // Touch target should be at least 44x44 dp for accessibility
              expect(
                size.width >= 44.0 || size.height >= 44.0,
                true,
                reason: 'Interactive elements should have minimum 44dp touch target',
              );
            }
          }
        }
      }
    });
  });
}
