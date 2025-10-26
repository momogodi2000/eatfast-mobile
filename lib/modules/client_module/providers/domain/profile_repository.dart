import 'package:eatfast_mobile/shared/services/auth/models/app_user.dart';

/// Address model
class Address {
  final String? id;
  final String label;
  final String type; // "home", "work", "other"
  final String street;
  final String city;
  final String? state;
  final String? postalCode;
  final String? country;
  final double? latitude;
  final double? longitude;
  final String? instructions; // Delivery instructions
  final Map<String, dynamic>? coordinates;
  final bool isDefault;

  const Address({
    this.id,
    required this.label,
    required this.type,
    required this.street,
    required this.city,
    this.state,
    this.postalCode,
    this.country,
    this.latitude,
    this.longitude,
    this.instructions,
    this.coordinates,
    this.isDefault = false,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] as String?,
      label: json['label'] as String? ?? '',
      type: json['type'] as String? ?? 'other',
      street: json['street'] as String? ?? '',
      city: json['city'] as String? ?? '',
      state: json['state'] as String?,
      postalCode: json['postalCode'] as String?,
      country: json['country'] as String?,
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
      instructions: json['instructions'] as String?,
      coordinates: json['coordinates'] as Map<String, dynamic>?,
      isDefault: json['isDefault'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'label': label,
      'type': type,
      'street': street,
      'city': city,
      if (state != null) 'state': state,
      if (postalCode != null) 'postalCode': postalCode,
      if (country != null) 'country': country,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (instructions != null) 'instructions': instructions,
      if (coordinates != null) 'coordinates': coordinates,
      'isDefault': isDefault,
    };
  }
}

/// Payment method model
class PaymentMethod {
  final String? id;
  final String type;
  final String label;
  final Map<String, dynamic> details;
  final bool isDefault;
  final String? cardNumber; // For backward compatibility
  final String? cardHolderName; // For backward compatibility
  final String? accountNumber; // Account number for the payment method
  final String? accountName; // Account name
  final String displayName; // Display name for UI
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const PaymentMethod({
    this.id,
    required this.type,
    required this.label,
    this.details = const {},
    this.isDefault = false,
    this.cardNumber,
    this.cardHolderName,
    this.accountNumber,
    this.accountName,
    String? displayName,
    this.createdAt,
    this.updatedAt,
  }) : displayName = displayName ?? label;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'] as String?,
      type: json['type'] as String? ?? 'card',
      label: json['label'] as String? ?? '',
      details: Map<String, dynamic>.from(json['details'] ?? {}),
      isDefault: json['isDefault'] as bool? ?? false,
      cardNumber: json['cardNumber'] as String?,
      cardHolderName: json['cardHolderName'] as String?,
      accountNumber: json['accountNumber'] as String?,
      accountName: json['accountName'] as String?,
      displayName: json['displayName'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'type': type,
      'label': label,
      'details': details,
      'isDefault': isDefault,
      if (cardNumber != null) 'cardNumber': cardNumber,
      if (cardHolderName != null) 'cardHolderName': cardHolderName,
      if (accountNumber != null) 'accountNumber': accountNumber,
      if (accountName != null) 'accountName': accountName,
      'displayName': displayName,
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt!.toIso8601String(),
    };
  }

  PaymentMethod copyWith({
    String? id,
    String? type,
    String? label,
    Map<String, dynamic>? details,
    bool? isDefault,
    String? cardNumber,
    String? cardHolderName,
    String? accountNumber,
    String? accountName,
    String? displayName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PaymentMethod(
      id: id ?? this.id,
      type: type ?? this.type,
      label: label ?? this.label,
      details: details ?? this.details,
      isDefault: isDefault ?? this.isDefault,
      cardNumber: cardNumber ?? this.cardNumber,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      accountNumber: accountNumber ?? this.accountNumber,
      accountName: accountName ?? this.accountName,
      displayName: displayName ?? this.displayName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

/// Notification preferences model
class NotificationPreferences {
  final bool orderUpdates;
  final bool promotions;
  final bool promotionalOffers; // Alias for promotions
  final bool newsletter;
  final bool pushNotifications;
  final bool emailNotifications;
  final bool smsNotifications;

  const NotificationPreferences({
    this.orderUpdates = true,
    bool? promotions,
    bool? promotionalOffers,
    this.newsletter = false,
    this.pushNotifications = true,
    this.emailNotifications = true,
    this.smsNotifications = false,
  }) : promotions = promotions ?? promotionalOffers ?? true,
       promotionalOffers = promotionalOffers ?? promotions ?? true;

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) {
    return NotificationPreferences(
      orderUpdates: json['orderUpdates'] as bool? ?? true,
      promotions: json['promotions'] as bool? ?? json['promotionalOffers'] as bool?,
      promotionalOffers: json['promotionalOffers'] as bool? ?? json['promotions'] as bool?,
      newsletter: json['newsletter'] as bool? ?? false,
      pushNotifications: json['pushNotifications'] as bool? ?? true,
      emailNotifications: json['emailNotifications'] as bool? ?? true,
      smsNotifications: json['smsNotifications'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderUpdates': orderUpdates,
      'promotions': promotions,
      'promotionalOffers': promotionalOffers,
      'newsletter': newsletter,
      'pushNotifications': pushNotifications,
      'emailNotifications': emailNotifications,
      'smsNotifications': smsNotifications,
    };
  }

  NotificationPreferences copyWith({
    bool? orderUpdates,
    bool? promotions,
    bool? promotionalOffers,
    bool? newsletter,
    bool? pushNotifications,
    bool? emailNotifications,
    bool? smsNotifications,
  }) {
    return NotificationPreferences(
      orderUpdates: orderUpdates ?? this.orderUpdates,
      promotions: promotions ?? this.promotions,
      promotionalOffers: promotionalOffers ?? this.promotionalOffers,
      newsletter: newsletter ?? this.newsletter,
      pushNotifications: pushNotifications ?? this.pushNotifications,
      emailNotifications: emailNotifications ?? this.emailNotifications,
      smsNotifications: smsNotifications ?? this.smsNotifications,
    );
  }
}

/// Profile repository interface
abstract class ProfileRepository {
  /// Get user profile
  Future<AppUser?> getProfile(String userId);

  /// Update user profile
  Future<bool> updateProfile(AppUser profile);

  /// Update user avatar
  Future<String?> updateAvatar(String userId, String imagePath);

  /// Delete avatar
  Future<bool> deleteAvatar(String userId);

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

  /// Set default payment method
  Future<bool> setDefaultPaymentMethod(String userId, String paymentMethodId);

  /// Get notification preferences
  Future<NotificationPreferences> getNotificationPreferences(String userId);

  /// Update notification preferences
  Future<bool> updateNotificationPreferences(
    String userId,
    NotificationPreferences preferences,
  );

  /// Change password
  Future<bool> changePassword(String userId, String currentPassword, String newPassword);

  /// Delete account
  Future<bool> deleteAccount(String userId);
}
