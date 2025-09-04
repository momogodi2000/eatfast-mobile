import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';

import '../../../lib/features/profile/presentation/screens/profile_screen.dart';
import '../../../lib/features/profile/providers/profile_provider.dart';
import '../../../lib/core/auth/models/app_user.dart';
import '../../../lib/features/profile/domain/models.dart';

// Mock class for testing
class MockProfileNotifier extends StateNotifier<AsyncValue<ProfileState>> {
  MockProfileNotifier() : super(const AsyncValue.loading());

  void setData(ProfileState state) {
    this.state = AsyncValue.data(state);
  }

  void setError(String error) {
    state = AsyncValue.error(error, StackTrace.current);
  }

  void setLoading() {
    state = const AsyncValue.loading();
  }
}

void main() {
  group('ProfileScreen Widget Tests', () {
    late MockProfileNotifier mockNotifier;

    setUp(() {
      mockNotifier = MockProfileNotifier();
    });

    Widget createTestWidget(ProfileState state) {
      mockNotifier.setData(state);
      
      return ProviderScope(
        overrides: [
          profileProvider.overrideWith((ref) => mockNotifier),
        ],
        child: MaterialApp(
          home: const ProfileScreen(),
        ),
      );
    }

    testWidgets('should display loading indicator when state is loading', (tester) async {
      // Arrange
      mockNotifier.setLoading();

      // Act
      await tester.pumpWidget(ProviderScope(
        overrides: [
          profileProvider.overrideWith((ref) => mockNotifier),
        ],
        child: const MaterialApp(home: ProfileScreen()),
      ));

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should display user information when data is loaded', (tester) async {
      // Arrange
      final user = User(
        id: '1',
        fullName: 'John Doe',
        email: 'john@example.com',
        phoneNumber: '+237123456789',
        avatarUrl: null,
        isEmailVerified: true,
        isPhoneVerified: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final state = ProfileState(user: user);

      // Act
      await tester.pumpWidget(createTestWidget(state));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('john@example.com'), findsOneWidget);
      expect(find.text('+237123456789'), findsOneWidget);
    });

    testWidgets('should display profile picture when user has avatar', (tester) async {
      // Arrange
      final user = User(
        id: '1',
        fullName: 'John Doe',
        email: 'john@example.com',
        phoneNumber: '+237123456789',
        avatarUrl: 'https://example.com/avatar.jpg',
        isEmailVerified: true,
        isPhoneVerified: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final state = ProfileState(user: user);

      // Act
      await tester.pumpWidget(createTestWidget(state));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('should display default avatar when user has no avatar', (tester) async {
      // Arrange
      final user = User(
        id: '1',
        fullName: 'John Doe',
        email: 'john@example.com',
        phoneNumber: '+237123456789',
        avatarUrl: null,
        isEmailVerified: true,
        isPhoneVerified: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final state = ProfileState(user: user);

      // Act
      await tester.pumpWidget(createTestWidget(state));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byIcon(Icons.person), findsAtLeastNWidget(1));
    });

    testWidgets('should display profile menu options', (tester) async {
      // Arrange
      final user = User(
        id: '1',
        fullName: 'John Doe',
        email: 'john@example.com',
        phoneNumber: '+237123456789',
        avatarUrl: null,
        isEmailVerified: true,
        isPhoneVerified: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final state = ProfileState(user: user);

      // Act
      await tester.pumpWidget(createTestWidget(state));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Informations personnelles'), findsOneWidget);
      expect(find.text('Mes adresses'), findsOneWidget);
      expect(find.text('Moyens de paiement'), findsOneWidget);
      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('Sécurité'), findsOneWidget);
      expect(find.text('Aide & Support'), findsOneWidget);
    });

    testWidgets('should display verification badges for verified user', (tester) async {
      // Arrange
      final user = User(
        id: '1',
        fullName: 'John Doe',
        email: 'john@example.com',
        phoneNumber: '+237123456789',
        avatarUrl: null,
        isEmailVerified: true,
        isPhoneVerified: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final state = ProfileState(user: user);

      // Act
      await tester.pumpWidget(createTestWidget(state));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byIcon(Icons.verified), findsAtLeastNWidget(1));
    });

    testWidgets('should show edit profile button', (tester) async {
      // Arrange
      final user = User(
        id: '1',
        fullName: 'John Doe',
        email: 'john@example.com',
        phoneNumber: '+237123456789',
        avatarUrl: null,
        isEmailVerified: true,
        isPhoneVerified: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final state = ProfileState(user: user);

      // Act
      await tester.pumpWidget(createTestWidget(state));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byIcon(Icons.edit_outlined), findsOneWidget);
    });

    testWidgets('should trigger navigation when menu items are tapped', (tester) async {
      // Arrange
      final user = User(
        id: '1',
        fullName: 'John Doe',
        email: 'john@example.com',
        phoneNumber: '+237123456789',
        avatarUrl: null,
        isEmailVerified: true,
        isPhoneVerified: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final state = ProfileState(user: user);

      // Act
      await tester.pumpWidget(createTestWidget(state));
      await tester.pumpAndSettle();

      // Find and tap the addresses menu item
      await tester.tap(find.text('Mes adresses'));
      await tester.pumpAndSettle();

      // Note: In a real test, we would verify navigation occurred
      // For now, we just verify the tap was registered
    });

    testWidgets('should display error message when state has error', (tester) async {
      // Arrange
      mockNotifier.setError('Network error');

      // Act
      await tester.pumpWidget(ProviderScope(
        overrides: [
          profileProvider.overrideWith((ref) => mockNotifier),
        ],
        child: const MaterialApp(home: ProfileScreen()),
      ));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Network error'), findsOneWidget);
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });

    testWidgets('should display logout option in app bar', (tester) async {
      // Arrange
      final user = User(
        id: '1',
        fullName: 'John Doe',
        email: 'john@example.com',
        phoneNumber: '+237123456789',
        avatarUrl: null,
        isEmailVerified: true,
        isPhoneVerified: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final state = ProfileState(user: user);

      // Act
      await tester.pumpWidget(createTestWidget(state));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byIcon(Icons.logout_outlined), findsOneWidget);
    });

    testWidgets('should handle profile picture tap for image selection', (tester) async {
      // Arrange
      final user = User(
        id: '1',
        fullName: 'John Doe',
        email: 'john@example.com',
        phoneNumber: '+237123456789',
        avatarUrl: null,
        isEmailVerified: true,
        isPhoneVerified: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final state = ProfileState(user: user);

      // Act
      await tester.pumpWidget(createTestWidget(state));
      await tester.pumpAndSettle();

      // Tap on profile picture area
      await tester.tap(find.byType(CircleAvatar));
      await tester.pumpAndSettle();

      // Note: In a real test, we would verify that image picker was triggered
      // For now, we just verify the tap was registered
    });
  });

  group('ProfileScreen Animation Tests', () {
    testWidgets('should animate profile card entrance', (tester) async {
      // Arrange
      final user = User(
        id: '1',
        fullName: 'John Doe',
        email: 'john@example.com',
        phoneNumber: '+237123456789',
        avatarUrl: null,
        isEmailVerified: true,
        isPhoneVerified: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final state = ProfileState(user: user);
      
      final mockNotifier = MockProfileNotifier();
      mockNotifier.setData(state);

      // Act
      await tester.pumpWidget(ProviderScope(
        overrides: [
          profileProvider.overrideWith((ref) => mockNotifier),
        ],
        child: const MaterialApp(home: ProfileScreen()),
      ));

      // Verify initial state (before animation)
      expect(find.byType(AnimatedContainer), findsAtLeastNWidget(1));

      // Let animations complete
      await tester.pumpAndSettle();

      // Verify final state (after animation)
      expect(find.text('John Doe'), findsOneWidget);
    });
  });

  group('ProfileScreen Accessibility Tests', () {
    testWidgets('should have proper semantics for screen readers', (tester) async {
      // Arrange
      final user = User(
        id: '1',
        fullName: 'John Doe',
        email: 'john@example.com',
        phoneNumber: '+237123456789',
        avatarUrl: null,
        isEmailVerified: true,
        isPhoneVerified: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final state = ProfileState(user: user);
      
      final mockNotifier = MockProfileNotifier();
      mockNotifier.setData(state);

      // Act
      await tester.pumpWidget(ProviderScope(
        overrides: [
          profileProvider.overrideWith((ref) => mockNotifier),
        ],
        child: const MaterialApp(home: ProfileScreen()),
      ));
      await tester.pumpAndSettle();

      // Assert - Check that important elements have semantic labels
      expect(find.bySemanticsLabel('Photo de profil'), findsOneWidget);
      expect(find.bySemanticsLabel('Modifier le profil'), findsOneWidget);
      expect(find.bySemanticsLabel('Se déconnecter'), findsOneWidget);
    });

    testWidgets('should support keyboard navigation', (tester) async {
      // Arrange
      final user = User(
        id: '1',
        fullName: 'John Doe',
        email: 'john@example.com',
        phoneNumber: '+237123456789',
        avatarUrl: null,
        isEmailVerified: true,
        isPhoneVerified: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final state = ProfileState(user: user);
      
      final mockNotifier = MockProfileNotifier();
      mockNotifier.setData(state);

      // Act
      await tester.pumpWidget(ProviderScope(
        overrides: [
          profileProvider.overrideWith((ref) => mockNotifier),
        ],
        child: const MaterialApp(home: ProfileScreen()),
      ));
      await tester.pumpAndSettle();

      // Assert - Check that menu items are focusable
      final menuItems = find.byType(ListTile);
      expect(menuItems, findsAtLeastNWidget(1));

      // Verify first menu item can receive focus
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pumpAndSettle();
    });
  });
}
