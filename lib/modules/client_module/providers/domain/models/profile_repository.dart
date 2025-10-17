import 'package:eatfast_mobile/shared/services/auth/models/app_user.dart';

abstract class ProfileRepository {
  /// Get user profile by ID
  Future<AppUser?> getProfile(String userId);

  /// Update user profile
  Future<bool> updateProfile(AppUser profile);

  /// Update user avatar
  Future<String?> updateAvatar(String userId, String imagePath);

  /// Get user addresses
  Future<List<Address>> getAddresses(String userId);

  /// Add new address
  Future<bool> addAddress(String userId, Address address);

  /// Update address
  Future<bool> updateAddress(String addressId, Address address);

  /// Delete address
  Future<bool> deleteAddress(String addressId);

  /// Set default address
  Future<bool> setDefaultAddress(String userId, String addressId);

  /// Get payment methods
  Future<List<PaymentMethod>> getPaymentMethods(String userId);

  /// Add payment method
  Future<bool> addPaymentMethod(String userId, PaymentMethod paymentMethod);

  /// Delete payment method
  Future<bool> deletePaymentMethod(String paymentMethodId);

  /// Update notification preferences
  Future<bool> updateNotificationPreferences(
    String userId,
    NotificationPreferences preferences
  );

  /// Change password
  Future<bool> changePassword(
    String userId,
    String currentPassword,
    String newPassword
  );

  /// Delete account
  Future<bool> deleteAccount(String userId);
}

/// Address model
class Address {
  final String? id;
  final String type;
  final String street;
  final String city;
  final String? state;
  final String? postalCode;
  final String country;
  final double? latitude;
  final double? longitude;
  final bool isDefault;
  final String? instructions;

  const Address({
    this.id,
    required this.type,
    required this.street,
    required this.city,
    this.state,
    this.postalCode,
    required this.country,
    this.latitude,
    this.longitude,
    this.isDefault = false,
    this.instructions,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      type: json['type'] ?? 'home',
      street: json['street'] ?? '',
      city: json['city'] ?? '',
      state: json['state'],
      postalCode: json['postalCode'],
      country: json['country'] ?? '',
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      isDefault: json['isDefault'] ?? false,
      instructions: json['instructions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'street': street,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
      'isDefault': isDefault,
      'instructions': instructions,
    };
  }

  Address copyWith({
    String? id,
    String? type,
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    double? latitude,
    double? longitude,
    bool? isDefault,
    String? instructions,
  }) {
    return Address(
      id: id ?? this.id,
      type: type ?? this.type,
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isDefault: isDefault ?? this.isDefault,
      instructions: instructions ?? this.instructions,
    );
  }
}

/// Payment Method model
class PaymentMethod {
  final String? id;
  final String type;
  final String? cardNumber;
  final String? cardHolderName;
  final String? expiryMonth;
  final String? expiryYear;
  final String? cvv;
  final bool isDefault;
  final Map<String, dynamic>? metadata;

  const PaymentMethod({
    this.id,
    required this.type,
    this.cardNumber,
    this.cardHolderName,
    this.expiryMonth,
    this.expiryYear,
    this.cvv,
    this.isDefault = false,
    this.metadata,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'],
      type: json['type'] ?? 'card',
      cardNumber: json['cardNumber'],
      cardHolderName: json['cardHolderName'],
      expiryMonth: json['expiryMonth'],
      expiryYear: json['expiryYear'],
      cvv: json['cvv'],
      isDefault: json['isDefault'] ?? false,
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'cardNumber': cardNumber,
      'cardHolderName': cardHolderName,
      'expiryMonth': expiryMonth,
      'expiryYear': expiryYear,
      'cvv': cvv,
      'isDefault': isDefault,
      'metadata': metadata,
    };
  }
}

/// Notification Preferences model
class NotificationPreferences {
  final bool emailNotifications;
  final bool pushNotifications;
  final bool smsNotifications;
  final bool orderUpdates;
  final bool promotionalOffers;
  final bool weeklyDigest;

  const NotificationPreferences({
    this.emailNotifications = true,
    this.pushNotifications = true,
    this.smsNotifications = false,
    this.orderUpdates = true,
    this.promotionalOffers = true,
    this.weeklyDigest = false,
  });

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) {
    return NotificationPreferences(
      emailNotifications: json['emailNotifications'] ?? true,
      pushNotifications: json['pushNotifications'] ?? true,
      smsNotifications: json['smsNotifications'] ?? false,
      orderUpdates: json['orderUpdates'] ?? true,
      promotionalOffers: json['promotionalOffers'] ?? true,
      weeklyDigest: json['weeklyDigest'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'emailNotifications': emailNotifications,
      'pushNotifications': pushNotifications,
      'smsNotifications': smsNotifications,
      'orderUpdates': orderUpdates,
      'promotionalOffers': promotionalOffers,
      'weeklyDigest': weeklyDigest,
    };
  }
}
