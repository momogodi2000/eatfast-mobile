import 'package:flutter_test/flutter_test.dart';

import 'package:eatfast_mobile/features/profile/domain/models.dart';

void main() {
  group('Address', () {
    test('should create Address from valid JSON', () {
      // Arrange
      final json = {
        'id': '1',
        'label': 'Home',
        'street': '123 Main St',
        'city': 'Yaoundé',
        'postalCode': '00237',
        'country': 'Cameroun',
        'latitude': 3.848,
        'longitude': 11.502,
        'isDefault': true,
        'createdAt': '2024-01-15T10:30:00.000Z',
        'updatedAt': '2024-01-15T10:30:00.000Z',
      };

      // Act
      final address = Address.fromJson(json);

      // Assert
      expect(address.id, equals('1'));
      expect(address.label, equals('Home'));
      expect(address.street, equals('123 Main St'));
      expect(address.city, equals('Yaoundé'));
      expect(address.postalCode, equals('00237'));
      expect(address.country, equals('Cameroun'));
      expect(address.latitude, equals(3.848));
      expect(address.longitude, equals(11.502));
      expect(address.isDefault, isTrue);
    });

    test('should convert Address to JSON', () {
      // Arrange
      final now = DateTime.parse('2024-01-15T10:30:00.000Z');
      final address = Address(
        id: '1',
        label: 'Home',
        street: '123 Main St',
        city: 'Yaoundé',
        postalCode: '00237',
        country: 'Cameroun',
        latitude: 3.848,
        longitude: 11.502,
        isDefault: true,
        createdAt: now,
        updatedAt: now,
      );

      // Act
      final json = address.toJson();

      // Assert
      expect(json['id'], equals('1'));
      expect(json['label'], equals('Home'));
      expect(json['street'], equals('123 Main St'));
      expect(json['city'], equals('Yaoundé'));
      expect(json['postalCode'], equals('00237'));
      expect(json['country'], equals('Cameroun'));
      expect(json['latitude'], equals(3.848));
      expect(json['longitude'], equals(11.502));
      expect(json['isDefault'], isTrue);
      expect(json['createdAt'], equals('2024-01-15T10:30:00.000Z'));
      expect(json['updatedAt'], equals('2024-01-15T10:30:00.000Z'));
    });

    test('should create copy with updated values', () {
      // Arrange
      final now = DateTime.now();
      final address = Address(
        id: '1',
        label: 'Home',
        street: '123 Main St',
        city: 'Yaoundé',
        postalCode: '00237',
        country: 'Cameroun',
        isDefault: false,
        createdAt: now,
        updatedAt: now,
      );

      // Act
      final updatedAddress = address.copyWith(
        label: 'Work',
        isDefault: true,
      );

      // Assert
      expect(updatedAddress.id, equals(address.id));
      expect(updatedAddress.label, equals('Work'));
      expect(updatedAddress.street, equals(address.street));
      expect(updatedAddress.isDefault, isTrue);
    });

    test('should format full address correctly', () {
      // Arrange
      final address = Address(
        id: '1',
        label: 'Home',
        street: '123 Main St',
        city: 'Yaoundé',
        postalCode: '00237',
        country: 'Cameroun',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Act
      final fullAddress = address.fullAddress;

      // Assert
      expect(fullAddress, equals('123 Main St, Yaoundé 00237, Cameroun'));
    });

    test('should have correct equality and hashCode', () {
      // Arrange
      final now = DateTime.now();
      final address1 = Address(
        id: '1',
        label: 'Home',
        street: '123 Main St',
        city: 'Yaoundé',
        postalCode: '00237',
        country: 'Cameroun',
        createdAt: now,
        updatedAt: now,
      );
      
      final address2 = Address(
        id: '1',
        label: 'Work', // Different label but same ID
        street: '456 Work St',
        city: 'Douala',
        postalCode: '00237',
        country: 'Cameroun',
        createdAt: now,
        updatedAt: now,
      );

      final address3 = Address(
        id: '2', // Different ID
        label: 'Home',
        street: '123 Main St',
        city: 'Yaoundé',
        postalCode: '00237',
        country: 'Cameroun',
        createdAt: now,
        updatedAt: now,
      );

      // Assert
      expect(address1, equals(address2)); // Same ID
      expect(address1.hashCode, equals(address2.hashCode)); // Same ID
      expect(address1, isNot(equals(address3))); // Different ID
    });
  });

  group('PaymentMethod', () {
    test('should create PaymentMethod from valid JSON', () {
      // Arrange
      final json = {
        'id': '1',
        'type': 'momo_mtn',
        'accountNumber': '123456789',
        'accountName': 'John Doe',
        'displayName': 'My MTN Money',
        'isDefault': true,
        'createdAt': '2024-01-15T10:30:00.000Z',
        'updatedAt': '2024-01-15T10:30:00.000Z',
      };

      // Act
      final method = PaymentMethod.fromJson(json);

      // Assert
      expect(method.id, equals('1'));
      expect(method.type, equals('momo_mtn'));
      expect(method.accountNumber, equals('123456789'));
      expect(method.accountName, equals('John Doe'));
      expect(method.displayName, equals('My MTN Money'));
      expect(method.isDefault, isTrue);
    });

    test('should convert PaymentMethod to JSON', () {
      // Arrange
      final now = DateTime.parse('2024-01-15T10:30:00.000Z');
      final method = PaymentMethod(
        id: '1',
        type: 'momo_mtn',
        accountNumber: '123456789',
        accountName: 'John Doe',
        displayName: 'My MTN Money',
        isDefault: true,
        createdAt: now,
        updatedAt: now,
      );

      // Act
      final json = method.toJson();

      // Assert
      expect(json['id'], equals('1'));
      expect(json['type'], equals('momo_mtn'));
      expect(json['accountNumber'], equals('123456789'));
      expect(json['accountName'], equals('John Doe'));
      expect(json['displayName'], equals('My MTN Money'));
      expect(json['isDefault'], isTrue);
    });

    test('should return correct type display names', () {
      // Arrange & Act & Assert
      expect(
        PaymentMethod(
          id: '1',
          type: 'momo_mtn',
          displayName: 'Test',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ).typeDisplayName,
        equals('MTN Mobile Money'),
      );

      expect(
        PaymentMethod(
          id: '2',
          type: 'momo_orange',
          displayName: 'Test',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ).typeDisplayName,
        equals('Orange Money'),
      );

      expect(
        PaymentMethod(
          id: '3',
          type: 'eu_mobile',
          displayName: 'Test',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ).typeDisplayName,
        equals('EU Mobile'),
      );

      expect(
        PaymentMethod(
          id: '4',
          type: 'cash',
          displayName: 'Test',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ).typeDisplayName,
        equals('Espèces à la livraison'),
      );

      expect(
        PaymentMethod(
          id: '5',
          type: 'unknown',
          displayName: 'Custom Payment',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ).typeDisplayName,
        equals('Custom Payment'),
      );
    });

    test('should create copy with updated values', () {
      // Arrange
      final now = DateTime.now();
      final method = PaymentMethod(
        id: '1',
        type: 'momo_mtn',
        accountNumber: '123456789',
        displayName: 'Old Name',
        isDefault: false,
        createdAt: now,
        updatedAt: now,
      );

      // Act
      final updatedMethod = method.copyWith(
        displayName: 'New Name',
        isDefault: true,
      );

      // Assert
      expect(updatedMethod.id, equals(method.id));
      expect(updatedMethod.displayName, equals('New Name'));
      expect(updatedMethod.accountNumber, equals(method.accountNumber));
      expect(updatedMethod.isDefault, isTrue);
    });

    test('should have correct equality and hashCode', () {
      // Arrange
      final now = DateTime.now();
      final method1 = PaymentMethod(
        id: '1',
        type: 'momo_mtn',
        displayName: 'Method 1',
        createdAt: now,
        updatedAt: now,
      );
      
      final method2 = PaymentMethod(
        id: '1',
        type: 'momo_orange', // Different type but same ID
        displayName: 'Method 2',
        createdAt: now,
        updatedAt: now,
      );

      final method3 = PaymentMethod(
        id: '2', // Different ID
        type: 'momo_mtn',
        displayName: 'Method 1',
        createdAt: now,
        updatedAt: now,
      );

      // Assert
      expect(method1, equals(method2)); // Same ID
      expect(method1.hashCode, equals(method2.hashCode)); // Same ID
      expect(method1, isNot(equals(method3))); // Different ID
    });
  });

  group('NotificationPreferences', () {
    test('should create NotificationPreferences with default values', () {
      // Act
      const preferences = NotificationPreferences();

      // Assert
      expect(preferences.pushNotifications, isTrue);
      expect(preferences.emailNotifications, isTrue);
      expect(preferences.smsNotifications, isFalse);
      expect(preferences.whatsappNotifications, isTrue);
      expect(preferences.orderUpdates, isTrue);
      expect(preferences.promotionalOffers, isTrue);
      expect(preferences.newRestaurants, isFalse);
      expect(preferences.recommendations, isTrue);
    });

    test('should create NotificationPreferences from JSON', () {
      // Arrange
      final json = {
        'pushNotifications': false,
        'emailNotifications': false,
        'smsNotifications': true,
        'whatsappNotifications': false,
        'orderUpdates': true,
        'promotionalOffers': false,
        'newRestaurants': true,
        'recommendations': false,
      };

      // Act
      final preferences = NotificationPreferences.fromJson(json);

      // Assert
      expect(preferences.pushNotifications, isFalse);
      expect(preferences.emailNotifications, isFalse);
      expect(preferences.smsNotifications, isTrue);
      expect(preferences.whatsappNotifications, isFalse);
      expect(preferences.orderUpdates, isTrue);
      expect(preferences.promotionalOffers, isFalse);
      expect(preferences.newRestaurants, isTrue);
      expect(preferences.recommendations, isFalse);
    });

    test('should convert NotificationPreferences to JSON', () {
      // Arrange
      const preferences = NotificationPreferences(
        pushNotifications: false,
        emailNotifications: true,
        smsNotifications: true,
        whatsappNotifications: false,
        orderUpdates: true,
        promotionalOffers: false,
        newRestaurants: true,
        recommendations: false,
      );

      // Act
      final json = preferences.toJson();

      // Assert
      expect(json['pushNotifications'], isFalse);
      expect(json['emailNotifications'], isTrue);
      expect(json['smsNotifications'], isTrue);
      expect(json['whatsappNotifications'], isFalse);
      expect(json['orderUpdates'], isTrue);
      expect(json['promotionalOffers'], isFalse);
      expect(json['newRestaurants'], isTrue);
      expect(json['recommendations'], isFalse);
    });

    test('should create copy with updated values', () {
      // Arrange
      const preferences = NotificationPreferences();

      // Act
      final updatedPreferences = preferences.copyWith(
        pushNotifications: false,
        smsNotifications: true,
        promotionalOffers: false,
      );

      // Assert
      expect(updatedPreferences.pushNotifications, isFalse);
      expect(updatedPreferences.smsNotifications, isTrue);
      expect(updatedPreferences.promotionalOffers, isFalse);
      // Unchanged values should remain the same
      expect(updatedPreferences.emailNotifications, isTrue);
      expect(updatedPreferences.whatsappNotifications, isTrue);
      expect(updatedPreferences.orderUpdates, isTrue);
      expect(updatedPreferences.newRestaurants, isFalse);
      expect(updatedPreferences.recommendations, isTrue);
    });
  });
}
