import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Represents a user address with geographical information
class UserAddress {
  final String id;
  final String userId;
  final String label;
  final String fullAddress;
  final String? street;
  final String? building;
  final String? apartment;
  final String? city;
  final String? state;
  final String? postalCode;
  final String country;
  final double latitude;
  final double longitude;
  final bool isDefault;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Map<String, dynamic>? metadata;

  const UserAddress({
    required this.id,
    required this.userId,
    required this.label,
    required this.fullAddress,
    this.street,
    this.building,
    this.apartment,
    this.city,
    this.state,
    this.postalCode,
    required this.country,
    required this.latitude,
    required this.longitude,
    this.isDefault = false,
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
    this.metadata,
  });

  /// Create UserAddress from JSON
  factory UserAddress.fromJson(Map<String, dynamic> json) {
    return UserAddress(
      id: json['id'] as String,
      userId: json['userId'] as String? ?? json['user_id'] as String,
      label: json['label'] as String,
      fullAddress: json['fullAddress'] as String? ?? json['full_address'] as String,
      street: json['street'] as String?,
      building: json['building'] as String?,
      apartment: json['apartment'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postalCode'] as String? ?? json['postal_code'] as String?,
      country: json['country'] as String? ?? 'Cameroon',
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      isDefault: json['isDefault'] as bool? ?? json['is_default'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? json['is_active'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String? ?? json['created_at'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String? ?? json['updated_at'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  /// Convert UserAddress to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'label': label,
      'fullAddress': fullAddress,
      'street': street,
      'building': building,
      'apartment': apartment,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
      'isDefault': isDefault,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'metadata': metadata,
    };
  }

  /// Create a copy with updated values
  UserAddress copyWith({
    String? id,
    String? userId,
    String? label,
    String? fullAddress,
    String? street,
    String? building,
    String? apartment,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    double? latitude,
    double? longitude,
    bool? isDefault,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, dynamic>? metadata,
  }) {
    return UserAddress(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      label: label ?? this.label,
      fullAddress: fullAddress ?? this.fullAddress,
      street: street ?? this.street,
      building: building ?? this.building,
      apartment: apartment ?? this.apartment,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isDefault: isDefault ?? this.isDefault,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      metadata: metadata ?? this.metadata,
    );
  }

  /// Get LatLng for Google Maps
  LatLng get latLng => LatLng(latitude, longitude);

  /// Get formatted address without building/apartment details
  String get streetAddress {
    final parts = <String>[];
    if (street != null && street!.isNotEmpty) parts.add(street!);
    if (city != null && city!.isNotEmpty) parts.add(city!);
    if (state != null && state!.isNotEmpty) parts.add(state!);
    return parts.join(', ');
  }

  /// Get building info (building + apartment)
  String? get buildingInfo {
    final parts = <String>[];
    if (building != null && building!.isNotEmpty) parts.add('Building: ${building!}');
    if (apartment != null && apartment!.isNotEmpty) parts.add('Apt: ${apartment!}');
    return parts.isEmpty ? null : parts.join(', ');
  }

  /// Check if address has detailed building information
  bool get hasDetailedInfo {
    return (building != null && building!.isNotEmpty) || 
           (apartment != null && apartment!.isNotEmpty);
  }

  /// Get display text for lists
  String get displayText {
    if (label.isNotEmpty) {
      return '$label - ${streetAddress.isNotEmpty ? streetAddress : fullAddress}';
    }
    return streetAddress.isNotEmpty ? streetAddress : fullAddress;
  }

  /// Check if this address is in Cameroon major cities
  bool get isInMajorCity {
    if (city == null) return false;
    final majorCities = [
      'Douala', 'Yaoundé', 'Yaounde', 'Bamenda', 'Bafoussam', 
      'Garoua', 'Maroua', 'Ngaoundéré', 'Bertoua', 'Kribi',
      'Limbe', 'Buea', 'Kumba', 'Edéa'
    ];
    return majorCities.any((major) => 
      city!.toLowerCase().contains(major.toLowerCase()));
  }

  @override
  String toString() {
    return 'UserAddress(id: $id, label: $label, fullAddress: $fullAddress)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserAddress && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
