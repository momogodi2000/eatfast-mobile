/// Profile-related domain models

/// Address model
class Address {
  final String id;
  final String label;
  final String street;
  final String city;
  final String postalCode;
  final String country;
  final double? latitude;
  final double? longitude;
  final bool isDefault;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Address({
    required this.id,
    required this.label,
    required this.street,
    required this.city,
    required this.postalCode,
    required this.country,
    this.latitude,
    this.longitude,
    this.isDefault = false,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] as String,
      label: json['label'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      postalCode: json['postalCode'] as String,
      country: json['country'] as String,
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
      isDefault: json['isDefault'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'street': street,
      'city': city,
      'postalCode': postalCode,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
      'isDefault': isDefault,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  Address copyWith({
    String? id,
    String? label,
    String? street,
    String? city,
    String? postalCode,
    String? country,
    double? latitude,
    double? longitude,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Address(
      id: id ?? this.id,
      label: label ?? this.label,
      street: street ?? this.street,
      city: city ?? this.city,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  String get fullAddress => '$street, $city $postalCode, $country';

  @override
  String toString() {
    return 'Address(id: $id, label: $label, street: $street, city: $city)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Address && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

/// Payment method model
class PaymentMethod {
  final String id;
  final String type; // 'momo_mtn', 'momo_orange', 'eu_mobile', 'cash'
  final String? accountNumber;
  final String? accountName;
  final String displayName;
  final bool isDefault;
  final DateTime createdAt;
  final DateTime updatedAt;

  const PaymentMethod({
    required this.id,
    required this.type,
    this.accountNumber,
    this.accountName,
    required this.displayName,
    this.isDefault = false,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'] as String,
      type: json['type'] as String,
      accountNumber: json['accountNumber'] as String?,
      accountName: json['accountName'] as String?,
      displayName: json['displayName'] as String,
      isDefault: json['isDefault'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'accountNumber': accountNumber,
      'accountName': accountName,
      'displayName': displayName,
      'isDefault': isDefault,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  PaymentMethod copyWith({
    String? id,
    String? type,
    String? accountNumber,
    String? accountName,
    String? displayName,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PaymentMethod(
      id: id ?? this.id,
      type: type ?? this.type,
      accountNumber: accountNumber ?? this.accountNumber,
      accountName: accountName ?? this.accountName,
      displayName: displayName ?? this.displayName,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  String get typeDisplayName {
    switch (type) {
      case 'momo_mtn':
        return 'MTN Mobile Money';
      case 'momo_orange':
        return 'Orange Money';
      case 'eu_mobile':
        return 'EU Mobile';
      case 'cash':
        return 'Espèces à la livraison';
      default:
        return displayName;
    }
  }

  @override
  String toString() {
    return 'PaymentMethod(id: $id, type: $type, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PaymentMethod && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

/// Notification preferences model
class NotificationPreferences {
  final bool pushNotifications;
  final bool emailNotifications;
  final bool smsNotifications;
  final bool whatsappNotifications;
  final bool orderUpdates;
  final bool promotionalOffers;
  final bool newRestaurants;
  final bool recommendations;

  const NotificationPreferences({
    this.pushNotifications = true,
    this.emailNotifications = true,
    this.smsNotifications = false,
    this.whatsappNotifications = true,
    this.orderUpdates = true,
    this.promotionalOffers = true,
    this.newRestaurants = false,
    this.recommendations = true,
  });

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) {
    return NotificationPreferences(
      pushNotifications: json['pushNotifications'] as bool? ?? true,
      emailNotifications: json['emailNotifications'] as bool? ?? true,
      smsNotifications: json['smsNotifications'] as bool? ?? false,
      whatsappNotifications: json['whatsappNotifications'] as bool? ?? true,
      orderUpdates: json['orderUpdates'] as bool? ?? true,
      promotionalOffers: json['promotionalOffers'] as bool? ?? true,
      newRestaurants: json['newRestaurants'] as bool? ?? false,
      recommendations: json['recommendations'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pushNotifications': pushNotifications,
      'emailNotifications': emailNotifications,
      'smsNotifications': smsNotifications,
      'whatsappNotifications': whatsappNotifications,
      'orderUpdates': orderUpdates,
      'promotionalOffers': promotionalOffers,
      'newRestaurants': newRestaurants,
      'recommendations': recommendations,
    };
  }

  NotificationPreferences copyWith({
    bool? pushNotifications,
    bool? emailNotifications,
    bool? smsNotifications,
    bool? whatsappNotifications,
    bool? orderUpdates,
    bool? promotionalOffers,
    bool? newRestaurants,
    bool? recommendations,
  }) {
    return NotificationPreferences(
      pushNotifications: pushNotifications ?? this.pushNotifications,
      emailNotifications: emailNotifications ?? this.emailNotifications,
      smsNotifications: smsNotifications ?? this.smsNotifications,
      whatsappNotifications: whatsappNotifications ?? this.whatsappNotifications,
      orderUpdates: orderUpdates ?? this.orderUpdates,
      promotionalOffers: promotionalOffers ?? this.promotionalOffers,
      newRestaurants: newRestaurants ?? this.newRestaurants,
      recommendations: recommendations ?? this.recommendations,
    );
  }
}
