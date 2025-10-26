import 'package:flutter_test/flutter_test.dart';
import 'package:eatfast_mobile/shared/services/auth/models/app_user.dart';

void main() {
  group('User Model Tests', () {
    group('AppUser', () {
      test('should create AppUser with valid data', () {
        // Arrange
        final user = AppUser(
          id: 'user-123',
          email: 'test@example.com',
          firstName: 'John',
          lastName: 'Doe',
          role: UserRole.customer,
          status: UserStatus.active,
          emailVerified: true,
          createdAt: DateTime(2024, 1, 1),
          updatedAt: DateTime(2024, 1, 1),
        );

        // Assert
        expect(user.id, equals('user-123'));
        expect(user.email, equals('test@example.com'));
        expect(user.firstName, equals('John'));
        expect(user.lastName, equals('Doe'));
        expect(user.fullName, equals('John Doe'));
        expect(user.role, equals(UserRole.customer));
        expect(user.status, equals(UserStatus.active));
        expect(user.emailVerified, isTrue);
        expect(user.createdAt, equals(DateTime(2024, 1, 1)));
      });

      test('should serialize to JSON correctly', () {
        // Arrange
        final user = AppUser(
          id: 'user-123',
          email: 'test@example.com',
          firstName: 'John',
          lastName: 'Doe',
          role: UserRole.customer,
          status: UserStatus.active,
          emailVerified: true,
          loyaltyPoints: 100,
          loyaltyTier: 'silver',
          totalOrders: 5,
          totalSpent: 250.50,
          createdAt: DateTime(2024, 1, 1),
          updatedAt: DateTime(2024, 1, 1),
        );

        // Act
        final json = user.toJson();

        // Assert
        expect(json['id'], equals('user-123'));
        expect(json['email'], equals('test@example.com'));
        expect(json['firstName'], equals('John'));
        expect(json['lastName'], equals('Doe'));
        expect(json['role'], equals('customer'));
        expect(json['status'], equals('active'));
        expect(json['emailVerified'], isTrue);
        expect(json['loyaltyPoints'], equals(100));
        expect(json['loyaltyTier'], equals('silver'));
        expect(json['totalOrders'], equals(5));
        expect(json['totalSpent'], equals(250.50));
      });

      test('should deserialize from JSON correctly', () {
        // Arrange
        final json = {
          'id': 'user-123',
          'email': 'test@example.com',
          'firstName': 'John',
          'lastName': 'Doe',
          'role': 'customer',
          'status': 'active',
          'emailVerified': true,
          'loyaltyPoints': 100,
          'loyaltyTier': 'silver',
          'totalOrders': 5,
          'totalSpent': 250.50,
          'createdAt': '2024-01-01T00:00:00.000Z',
          'updatedAt': '2024-01-01T00:00:00.000Z',
        };

        // Act
        final user = AppUser.fromJson(json);

        // Assert
        expect(user.id, equals('user-123'));
        expect(user.email, equals('test@example.com'));
        expect(user.firstName, equals('John'));
        expect(user.lastName, equals('Doe'));
        expect(user.role, equals(UserRole.customer));
        expect(user.status, equals(UserStatus.active));
        expect(user.emailVerified, isTrue);
        expect(user.loyaltyPoints, equals(100));
        expect(user.loyaltyTier, equals('silver'));
        expect(user.totalOrders, equals(5));
        expect(user.totalSpent, equals(250.50));
      });

      test('should handle role permissions correctly', () {
        // Arrange
        final customer = AppUser(
          id: '1',
          email: 'customer@test.com',
          role: UserRole.customer,
          status: UserStatus.active,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final restaurantOwner = AppUser(
          id: '2',
          email: 'owner@test.com',
          role: UserRole.restaurantOwner,
          status: UserStatus.active,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final admin = AppUser(
          id: '3',
          email: 'admin@test.com',
          role: UserRole.admin,
          status: UserStatus.active,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final deliveryAgent = AppUser(
          id: '4',
          email: 'driver@test.com',
          role: UserRole.deliveryAgent,
          status: UserStatus.active,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // Assert
        expect(customer.hasRole(UserRole.customer), isTrue);
        expect(customer.hasRole(UserRole.admin), isFalse);

        expect(restaurantOwner.hasRole(UserRole.restaurantOwner), isTrue);
        expect(restaurantOwner.hasRole(UserRole.customer), isFalse);

        expect(admin.hasRole(UserRole.admin), isTrue);
        expect(admin.hasAnyRole([UserRole.admin, UserRole.customer]), isTrue);

        expect(deliveryAgent.hasRole(UserRole.deliveryAgent), isTrue);
        expect(deliveryAgent.hasRole(UserRole.customer), isFalse);
      });

      test('should create user with default values', () {
        // Act
        final user = AppUser(
          id: 'test-id',
          email: 'test@example.com',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // Assert
        expect(user.role, equals(UserRole.customer));
        expect(user.status, equals(UserStatus.pending));
        expect(user.emailVerified, isFalse);
        expect(user.phoneVerified, isFalse);
        expect(user.language, equals('fr'));
        expect(user.loyaltyPoints, equals(0));
        expect(user.loyaltyTier, equals('bronze'));
        expect(user.totalOrders, equals(0));
        expect(user.totalSpent, equals(0.0));
      });

      test('should handle user verification status', () {
        // Arrange
        final unverifiedUser = AppUser(
          id: 'test-id',
          email: 'test@example.com',
          emailVerified: false,
          phoneVerified: false,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final emailVerifiedUser = AppUser(
          id: 'test-id',
          email: 'test@example.com',
          emailVerified: true,
          phoneVerified: false,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final phoneVerifiedUser = AppUser(
          id: 'test-id',
          email: 'test@example.com',
          emailVerified: false,
          phoneVerified: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // Assert
        expect(unverifiedUser.isVerified, isFalse);
        expect(emailVerifiedUser.isVerified, isTrue);
        expect(phoneVerifiedUser.isVerified, isTrue);
      });

      test('should copy user with new values', () {
        // Arrange
        final originalUser = AppUser(
          id: 'test-id',
          email: 'test@example.com',
          firstName: 'John',
          lastName: 'Doe',
          role: UserRole.customer,
          loyaltyPoints: 100,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // Act
        final updatedUser = originalUser.copyWith(
          firstName: 'Jane',
          loyaltyPoints: 200,
          emailVerified: true,
        );

        // Assert
        expect(updatedUser.firstName, equals('Jane'));
        expect(updatedUser.lastName, equals('Doe')); // Should remain unchanged
        expect(updatedUser.loyaltyPoints, equals(200));
        expect(updatedUser.emailVerified, isTrue);
        expect(updatedUser.email, equals('test@example.com')); // Should remain unchanged
      });

      test('should generate display names correctly', () {
        // Arrange
        final userWithBothNames = AppUser(
          id: '1',
          email: 'test@example.com',
          firstName: 'John',
          lastName: 'Doe',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final userWithFirstNameOnly = AppUser(
          id: '2',
          email: 'test@example.com',
          firstName: 'John',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final userWithLastNameOnly = AppUser(
          id: '3',
          email: 'test@example.com',
          lastName: 'Doe',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final userWithNoNames = AppUser(
          id: '4',
          email: 'test@example.com',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // Assert
        expect(userWithBothNames.fullName, equals('John Doe'));
        expect(userWithBothNames.displayName, equals('John Doe'));
        expect(userWithBothNames.name, equals('John Doe'));

        expect(userWithFirstNameOnly.fullName, equals('John'));
        expect(userWithFirstNameOnly.displayName, equals('John'));

        expect(userWithLastNameOnly.fullName, equals('Doe'));
        expect(userWithLastNameOnly.displayName, equals('Doe'));

        expect(userWithNoNames.fullName, equals(''));
        expect(userWithNoNames.displayName, equals('test@example.com'));
      });
    });

    group('UserRole', () {
      test('should convert from string correctly', () {
        expect(UserRole.fromString('customer'), equals(UserRole.customer));
        expect(UserRole.fromString('restaurant_owner'), equals(UserRole.restaurantOwner));
        expect(UserRole.fromString('delivery_agent'), equals(UserRole.deliveryAgent));
        expect(UserRole.fromString('admin'), equals(UserRole.admin));
        expect(UserRole.fromString('guest'), equals(UserRole.guest));
        expect(UserRole.fromString('invalid'), equals(UserRole.customer)); // Default
      });

      test('should have correct string values', () {
        expect(UserRole.customer.value, equals('customer'));
        expect(UserRole.restaurantOwner.value, equals('restaurant_owner'));
        expect(UserRole.deliveryAgent.value, equals('delivery_agent'));
        expect(UserRole.admin.value, equals('admin'));
        expect(UserRole.guest.value, equals('guest'));
      });
    });

    group('UserStatus', () {
      test('should convert from string correctly', () {
        expect(UserStatus.fromString('active'), equals(UserStatus.active));
        expect(UserStatus.fromString('suspended'), equals(UserStatus.suspended));
        expect(UserStatus.fromString('pending'), equals(UserStatus.pending));
        expect(UserStatus.fromString('inactive'), equals(UserStatus.inactive));
        expect(UserStatus.fromString('invalid'), equals(UserStatus.pending)); // Default
      });

      test('should have correct string values', () {
        expect(UserStatus.active.value, equals('active'));
        expect(UserStatus.suspended.value, equals('suspended'));
        expect(UserStatus.pending.value, equals('pending'));
        expect(UserStatus.inactive.value, equals('inactive'));
      });
    });
  });
}
