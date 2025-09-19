import 'package:flutter_test/flutter_test.dart';
import 'package:eatfast_mobile/core/auth/models/app_user.dart';

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
          isEmailVerified: true,
          createdAt: DateTime(2024, 1, 1),
        );

        // Assert
        expect(user.id, equals('user-123'));
        expect(user.email, equals('test@example.com'));
        expect(user.firstName, equals('John'));
        expect(user.lastName, equals('Doe'));
        expect(user.fullName, equals('John Doe'));
        expect(user.role, equals(UserRole.customer));
        expect(user.status, equals(UserStatus.active));
        expect(user.isEmailVerified, isTrue);
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
          isEmailVerified: true,
          createdAt: DateTime(2024, 1, 1),
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
        expect(json['isEmailVerified'], isTrue);
        expect(json['createdAt'], equals('2024-01-01T00:00:00.000'));
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
          'isEmailVerified': true,
          'createdAt': '2024-01-01T00:00:00.000Z',
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
        expect(user.isEmailVerified, isTrue);
      });

      test('should handle optional fields correctly', () {
        // Arrange
        final user = AppUser(
          id: 'user-123',
          email: 'test@example.com',
          firstName: 'John',
          lastName: 'Doe',
          role: UserRole.customer,
          status: UserStatus.active,
          isEmailVerified: false,
          createdAt: DateTime(2024, 1, 1),
          phone: '+1234567890',
          profileImageUrl: 'https://example.com/profile.jpg',
        );

        // Assert
        expect(user.phone, equals('+1234567890'));
        expect(user.profileImageUrl, equals('https://example.com/profile.jpg'));
      });

      test('should compare users correctly', () {
        // Arrange
        final user1 = AppUser(
          id: 'user-123',
          email: 'test@example.com',
          firstName: 'John',
          lastName: 'Doe',
          role: UserRole.customer,
          status: UserStatus.active,
          isEmailVerified: true,
          createdAt: DateTime(2024, 1, 1),
        );

        final user2 = AppUser(
          id: 'user-123',
          email: 'test@example.com',
          firstName: 'John',
          lastName: 'Doe',
          role: UserRole.customer,
          status: UserStatus.active,
          isEmailVerified: true,
          createdAt: DateTime(2024, 1, 1),
        );

        final user3 = AppUser(
          id: 'user-456',
          email: 'different@example.com',
          firstName: 'Jane',
          lastName: 'Smith',
          role: UserRole.customer,
          status: UserStatus.active,
          isEmailVerified: true,
          createdAt: DateTime(2024, 1, 1),
        );

        // Assert
        expect(user1, equals(user2));
        expect(user1, isNot(equals(user3)));
        expect(user1.hashCode, equals(user2.hashCode));
        expect(user1.hashCode, isNot(equals(user3.hashCode)));
      });
    });

    group('UserRole', () {
      test('should handle all user roles', () {
        // Assert
        expect(UserRole.customer.value, equals('customer'));
        expect(UserRole.restaurantOwner.value, equals('restaurant_owner'));
        expect(UserRole.deliveryAgent.value, equals('delivery_agent'));
        expect(UserRole.admin.value, equals('admin'));
        expect(UserRole.guest.value, equals('guest'));
      });

      test('should create from string value', () {
        // Assert
        expect(UserRole.fromString('customer'), equals(UserRole.customer));
        expect(UserRole.fromString('restaurant_owner'), equals(UserRole.restaurantOwner));
        expect(UserRole.fromString('delivery_agent'), equals(UserRole.deliveryAgent));
        expect(UserRole.fromString('admin'), equals(UserRole.admin));
        expect(UserRole.fromString('guest'), equals(UserRole.guest));
      });

      test('should handle invalid role string', () {
        // Assert
        expect(() => UserRole.fromString('invalid'), throwsArgumentError);
      });
    });

    group('UserStatus', () {
      test('should handle all user statuses', () {
        // Assert
        expect(UserStatus.active.value, equals('active'));
        expect(UserStatus.inactive.value, equals('inactive'));
        expect(UserStatus.suspended.value, equals('suspended'));
        expect(UserStatus.pending.value, equals('pending'));
      });

      test('should create from string value', () {
        // Assert
        expect(UserStatus.fromString('active'), equals(UserStatus.active));
        expect(UserStatus.fromString('inactive'), equals(UserStatus.inactive));
        expect(UserStatus.fromString('suspended'), equals(UserStatus.suspended));
        expect(UserStatus.fromString('pending'), equals(UserStatus.pending));
      });

      test('should handle invalid status string', () {
        // Assert
        expect(() => UserStatus.fromString('invalid'), throwsArgumentError);
      });
    });

    group('User Permissions', () {
      test('should check customer permissions', () {
        // Arrange
        final customer = AppUser(
          id: 'user-123',
          email: 'test@example.com',
          firstName: 'John',
          lastName: 'Doe',
          role: UserRole.customer,
          status: UserStatus.active,
          isEmailVerified: true,
          createdAt: DateTime.now(),
        );

        // Assert
        expect(customer.canPlaceOrders, isTrue);
        expect(customer.canManageRestaurant, isFalse);
        expect(customer.canDeliverOrders, isFalse);
        expect(customer.canAccessAdmin, isFalse);
      });

      test('should check restaurant owner permissions', () {
        // Arrange
        final owner = AppUser(
          id: 'user-123',
          email: 'owner@example.com',
          firstName: 'Restaurant',
          lastName: 'Owner',
          role: UserRole.restaurantOwner,
          status: UserStatus.active,
          isEmailVerified: true,
          createdAt: DateTime.now(),
        );

        // Assert
        expect(owner.canPlaceOrders, isTrue);
        expect(owner.canManageRestaurant, isTrue);
        expect(owner.canDeliverOrders, isFalse);
        expect(owner.canAccessAdmin, isFalse);
      });

      test('should check delivery agent permissions', () {
        // Arrange
        final driver = AppUser(
          id: 'user-123',
          email: 'driver@example.com',
          firstName: 'Delivery',
          lastName: 'Driver',
          role: UserRole.deliveryAgent,
          status: UserStatus.active,
          isEmailVerified: true,
          createdAt: DateTime.now(),
        );

        // Assert
        expect(driver.canPlaceOrders, isTrue);
        expect(driver.canManageRestaurant, isFalse);
        expect(driver.canDeliverOrders, isTrue);
        expect(driver.canAccessAdmin, isFalse);
      });

      test('should check admin permissions', () {
        // Arrange
        final admin = AppUser(
          id: 'user-123',
          email: 'admin@example.com',
          firstName: 'System',
          lastName: 'Admin',
          role: UserRole.admin,
          status: UserStatus.active,
          isEmailVerified: true,
          createdAt: DateTime.now(),
        );

        // Assert
        expect(admin.canPlaceOrders, isTrue);
        expect(admin.canManageRestaurant, isTrue);
        expect(admin.canDeliverOrders, isTrue);
        expect(admin.canAccessAdmin, isTrue);
      });

      test('should check guest permissions', () {
        // Arrange
        final guest = AppUser(
          id: 'guest-123',
          email: 'guest@example.com',
          firstName: 'Guest',
          lastName: 'User',
          role: UserRole.guest,
          status: UserStatus.active,
          isEmailVerified: false,
          createdAt: DateTime.now(),
        );

        // Assert
        expect(guest.canPlaceOrders, isFalse);
        expect(guest.canManageRestaurant, isFalse);
        expect(guest.canDeliverOrders, isFalse);
        expect(guest.canAccessAdmin, isFalse);
      });
    });

    group('User Validation', () {
      test('should validate active user', () {
        // Arrange
        final user = AppUser(
          id: 'user-123',
          email: 'test@example.com',
          firstName: 'John',
          lastName: 'Doe',
          role: UserRole.customer,
          status: UserStatus.active,
          isEmailVerified: true,
          createdAt: DateTime.now(),
        );

        // Assert
        expect(user.isActive, isTrue);
        expect(user.canLogin, isTrue);
      });

      test('should validate inactive user', () {
        // Arrange
        final user = AppUser(
          id: 'user-123',
          email: 'test@example.com',
          firstName: 'John',
          lastName: 'Doe',
          role: UserRole.customer,
          status: UserStatus.inactive,
          isEmailVerified: true,
          createdAt: DateTime.now(),
        );

        // Assert
        expect(user.isActive, isFalse);
        expect(user.canLogin, isFalse);
      });

      test('should validate suspended user', () {
        // Arrange
        final user = AppUser(
          id: 'user-123',
          email: 'test@example.com',
          firstName: 'John',
          lastName: 'Doe',
          role: UserRole.customer,
          status: UserStatus.suspended,
          isEmailVerified: true,
          createdAt: DateTime.now(),
        );

        // Assert
        expect(user.isActive, isFalse);
        expect(user.canLogin, isFalse);
        expect(user.isSuspended, isTrue);
      });

      test('should validate pending user', () {
        // Arrange
        final user = AppUser(
          id: 'user-123',
          email: 'test@example.com',
          firstName: 'John',
          lastName: 'Doe',
          role: UserRole.customer,
          status: UserStatus.pending,
          isEmailVerified: false,
          createdAt: DateTime.now(),
        );

        // Assert
        expect(user.isActive, isFalse);
        expect(user.canLogin, isFalse);
        expect(user.isPending, isTrue);
        expect(user.needsEmailVerification, isTrue);
      });
    });

    group('User Profile', () {
      test('should get display name', () {
        // Arrange
        final user = AppUser(
          id: 'user-123',
          email: 'test@example.com',
          firstName: 'John',
          lastName: 'Doe',
          role: UserRole.customer,
          status: UserStatus.active,
          isEmailVerified: true,
          createdAt: DateTime.now(),
        );

        // Assert
        expect(user.displayName, equals('John Doe'));
        expect(user.initials, equals('JD'));
      });

      test('should handle single name', () {
        // Arrange
        final user = AppUser(
          id: 'user-123',
          email: 'test@example.com',
          firstName: 'John',
          lastName: '',
          role: UserRole.customer,
          status: UserStatus.active,
          isEmailVerified: true,
          createdAt: DateTime.now(),
        );

        // Assert
        expect(user.displayName, equals('John'));
        expect(user.initials, equals('J'));
      });

      test('should handle empty names', () {
        // Arrange
        final user = AppUser(
          id: 'user-123',
          email: 'test@example.com',
          firstName: '',
          lastName: '',
          role: UserRole.customer,
          status: UserStatus.active,
          isEmailVerified: true,
          createdAt: DateTime.now(),
        );

        // Assert
        expect(user.displayName, equals('test@example.com'));
        expect(user.initials, equals('T'));
      });
    });
  });
}