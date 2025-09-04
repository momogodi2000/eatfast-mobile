import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:eatfast_mobile/main.dart';

void main() {
  group('App Initialization Tests', () {
    testWidgets('EatFast app initializes correctly', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      // Verify that the app builds without crashing
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('App has correct title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      // Get the MaterialApp widget
      final MaterialApp app = tester.widget(find.byType(MaterialApp));
      
      // Verify app title (corrected expectation)
      expect(app.title, equals('EatFast'));
    });

    testWidgets('App shows initial screen', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      // Wait for initial frame but don't wait for animations
      await tester.pump();

      // The app should show some content (either splash or main screen)
      expect(find.byType(Scaffold), findsAtLeastNWidgets(1));
    });
  });

  group('Theme and Localization Tests', () {
    testWidgets('App uses design token colors', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pump();

      final MaterialApp app = tester.widget(find.byType(MaterialApp));
      expect(app.theme, isNotNull);
      expect(app.theme?.colorScheme, isNotNull);
    });

    testWidgets('App supports localization', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: EatFastApp(),
        ),
      );

      await tester.pump();

      final MaterialApp app = tester.widget(find.byType(MaterialApp));
      expect(app.supportedLocales.length, greaterThanOrEqualTo(2)); // French and English
    });
  });
}
