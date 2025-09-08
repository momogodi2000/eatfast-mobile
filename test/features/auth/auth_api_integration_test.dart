import 'package:flutter_test/flutter_test.dart';
import 'package:eatfast_mobile/features/auth/domain/auth_user.dart';

void main() {
  group('Auth API Models Tests', () {
    test('AuthUser model should create correctly', () {
      // Arrange & Act
      final user = AuthUser(
        id: '1',
        email: 'test@example.com',
        firstName: 'John',
        lastName: 'Doe',
        phone: '+237123456789',
        profileImage: 'https://example.com/avatar.jpg',
        isEmailVerified: true,
        isPhoneVerified: false,
        role: 'client',
        loyaltyPoints: 250,
        loyaltyLevel: 'Silver',
        createdAt: DateTime(2024, 1, 1),
        updatedAt: DateTime(2024, 1, 2),
      );

      // Assert
      expect(user.id, '1');
      expect(user.email, 'test@example.com');
      expect(user.firstName, 'John');
      expect(user.lastName, 'Doe');
      expect(user.fullName, 'John Doe');
      expect(user.phone, '+237123456789');
      expect(user.displayName, 'John Doe');
      expect(user.isEmailVerified, true);
      expect(user.isPhoneVerified, false);
      expect(user.role, 'client');
      expect(user.loyaltyPoints, 250);
      expect(user.loyaltyLevel, 'Silver');
    });

    test('LoginRequest model should create correctly', () {
      // Arrange & Act
      const request = LoginRequest(
        email: 'test@example.com',
        password: 'password123',
        rememberMe: true,
        deviceToken: 'device_token_123',
      );

      // Assert
      expect(request.email, 'test@example.com');
      expect(request.password, 'password123');
      expect(request.rememberMe, true);
      expect(request.deviceToken, 'device_token_123');
    });

    test('RegisterRequest model should create correctly', () {
      // Arrange & Act
      const request = RegisterRequest(
        firstName: 'Jane',
        lastName: 'Smith',
        email: 'jane@example.com',
        phone: '+237987654321',
        password: 'securepass',
        confirmPassword: 'securepass',
        acceptTerms: true,
      );

      // Assert
      expect(request.firstName, 'Jane');
      expect(request.lastName, 'Smith');
      expect(request.email, 'jane@example.com');
      expect(request.phone, '+237987654321');
      expect(request.password, 'securepass');
      expect(request.confirmPassword, 'securepass');
      expect(request.acceptTerms, true);
    });

    test('AuthResponse model should create correctly', () {
      // Arrange
      final user = AuthUser(
        id: '1',
        email: 'test@example.com',
        firstName: 'John',
        lastName: 'Doe',
        phone: '+237123456789',
        createdAt: DateTime(2024, 1, 1),
        updatedAt: DateTime(2024, 1, 2),
      );

      // Act
      final response = AuthResponse(
        user: user,
        accessToken: 'access_token_123',
        refreshToken: 'refresh_token_123',
        expiresIn: 3600,
        message: 'Login successful',
      );

      // Assert
      expect(response.user, user);
      expect(response.accessToken, 'access_token_123');
      expect(response.refreshToken, 'refresh_token_123');
      expect(response.expiresIn, 3600);
      expect(response.message, 'Login successful');
    });

    test('AuthApiState should handle different states', () {
      // Test initial state
      const initial = AuthApiState.initial();
      expect(initial, isA<AuthInitial>());

      // Test loading state
      const loading = AuthApiState.loading();
      expect(loading, isA<AuthLoading>());

      // Test error state
      const error = AuthApiState.error('Test error', code: 'AUTH001');
      expect(error, isA<AuthErrorState>());

      // Test authenticated state
      final user = AuthUser(
        id: '1',
        email: 'test@example.com',
        firstName: 'John',
        lastName: 'Doe',
        phone: '+237123456789',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      final authenticated = AuthApiState.authenticated(user);
      expect(authenticated, isA<AuthAuthenticated>());
    });
  });
}
