/// User address model for delivery addresses
class UserAddress {
  final String id;
  final String userId;
  final String label; // e.g., 'Home', 'Work', 'Other'
  final String streetAddress;
  final String? apartment;
  final String city;
  final String? state;
  final String? postalCode;
  final String country;
  final double? latitude;
  final double? longitude;
  final String? deliveryInstructions;
  final bool isDefault;
  final DateTime createdAt;
  final DateTime updatedAt;
  
  // Additional properties
  final String? street;
  final String? buildingInfo;
  final Map<String, dynamic>? metadata;

  const UserAddress({
    required this.id,
    required this.userId,
    required this.label,
    required this.streetAddress,
    this.apartment,
    required this.city,
    this.state,
    this.postalCode,
    required this.country,
    this.latitude,
    this.longitude,
    this.deliveryInstructions,
    this.isDefault = false,
    required this.createdAt,
    required this.updatedAt,
    this.street,
    this.buildingInfo,
    this.metadata,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) {
    return UserAddress(
      id: json['id'] ?? json['_id'] ?? '',
      userId: json['userId'] ?? '',
      label: json['label'] ?? 'Home',
      streetAddress: json['streetAddress'] ?? json['street'] ?? '',
      apartment: json['apartment'],
      city: json['city'] ?? '',
      state: json['state'],
      postalCode: json['postalCode'],
      country: json['country'] ?? 'Cameroon',
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      deliveryInstructions: json['deliveryInstructions'],
      isDefault: json['isDefault'] ?? false,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
      street: json['street'],
      buildingInfo: json['buildingInfo'],
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'label': label,
      'streetAddress': streetAddress,
      if (street != null) 'street': street,
      if (apartment != null) 'apartment': apartment,
      if (buildingInfo != null) 'buildingInfo': buildingInfo,
      'city': city,
      if (state != null) 'state': state,
      if (postalCode != null) 'postalCode': postalCode,
      'country': country,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (deliveryInstructions != null)
        'deliveryInstructions': deliveryInstructions,
      'isDefault': isDefault,
      if (metadata != null) 'metadata': metadata,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  UserAddress copyWith({
    String? id,
    String? userId,
    String? label,
    String? streetAddress,
    String? apartment,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    double? latitude,
    double? longitude,
    String? deliveryInstructions,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? street,
    String? buildingInfo,
    Map<String, dynamic>? metadata,
  }) {
    return UserAddress(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      label: label ?? this.label,
      streetAddress: streetAddress ?? this.streetAddress,
      apartment: apartment ?? this.apartment,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      deliveryInstructions: deliveryInstructions ?? this.deliveryInstructions,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      street: street ?? this.street,
      buildingInfo: buildingInfo ?? this.buildingInfo,
      metadata: metadata ?? this.metadata,
    );
  }

  String get fullAddress {
    final parts = <String>[
      streetAddress,
      if (apartment != null && apartment!.isNotEmpty) apartment!,
      city,
      if (state != null && state!.isNotEmpty) state!,
      if (postalCode != null && postalCode!.isNotEmpty) postalCode!,
      country,
    ];
    return parts.join(', ');
  }

  bool get hasCoordinates => latitude != null && longitude != null;

  @override
  String toString() => fullAddress;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserAddress && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
