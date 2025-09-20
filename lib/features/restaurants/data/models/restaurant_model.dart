/// Restaurant model for the application
class Restaurant {
  final String id;
  final String name;
  final String description;
  final String cuisineType;
  final String address;
  final double? latitude;
  final double? longitude;
  final String phone;
  final String email;
  final List<String> images;
  final double rating;
  final int reviewCount;
  final bool isOpen;
  final String deliveryTime;
  final double deliveryFee;
  final double minimumOrder;
  final Map<String, dynamic> openingHours;
  final List<String> tags;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Restaurant({
    required this.id,
    required this.name,
    this.description = '',
    this.cuisineType = '',
    this.address = '',
    this.latitude,
    this.longitude,
    this.phone = '',
    this.email = '',
    this.images = const [],
    this.rating = 0.0,
    this.reviewCount = 0,
    this.isOpen = false,
    this.deliveryTime = '',
    this.deliveryFee = 0.0,
    this.minimumOrder = 0.0,
    this.openingHours = const {},
    this.tags = const [],
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      cuisineType: json['cuisineType'] as String? ?? json['cuisine_type'] as String? ?? '',
      address: json['address'] as String? ?? '',
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)?.cast<String>() ?? [],
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['reviewCount'] as int? ?? json['review_count'] as int? ?? 0,
      isOpen: json['isOpen'] as bool? ?? json['is_open'] as bool? ?? false,
      deliveryTime: json['deliveryTime'] as String? ?? json['delivery_time'] as String? ?? '',
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? (json['delivery_fee'] as num?)?.toDouble() ?? 0.0,
      minimumOrder: (json['minimumOrder'] as num?)?.toDouble() ?? (json['minimum_order'] as num?)?.toDouble() ?? 0.0,
      openingHours: json['openingHours'] as Map<String, dynamic>? ?? json['opening_hours'] as Map<String, dynamic>? ?? {},
      tags: (json['tags'] as List<dynamic>?)?.cast<String>() ?? [],
      isActive: json['isActive'] as bool? ?? json['is_active'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String? ?? json['created_at'] as String? ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] as String? ?? json['updated_at'] as String? ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'cuisineType': cuisineType,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'phone': phone,
      'email': email,
      'images': images,
      'rating': rating,
      'reviewCount': reviewCount,
      'isOpen': isOpen,
      'deliveryTime': deliveryTime,
      'deliveryFee': deliveryFee,
      'minimumOrder': minimumOrder,
      'openingHours': openingHours,
      'tags': tags,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  Restaurant copyWith({
    String? id,
    String? name,
    String? description,
    String? cuisineType,
    String? address,
    double? latitude,
    double? longitude,
    String? phone,
    String? email,
    List<String>? images,
    double? rating,
    int? reviewCount,
    bool? isOpen,
    String? deliveryTime,
    double? deliveryFee,
    double? minimumOrder,
    Map<String, dynamic>? openingHours,
    List<String>? tags,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Restaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      cuisineType: cuisineType ?? this.cuisineType,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      images: images ?? this.images,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isOpen: isOpen ?? this.isOpen,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      minimumOrder: minimumOrder ?? this.minimumOrder,
      openingHours: openingHours ?? this.openingHours,
      tags: tags ?? this.tags,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Restaurant && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Restaurant(id: $id, name: $name)';
}

/// Restaurant filter for searching and filtering
class RestaurantFilter {
  final String? query;
  final String? cuisineType;
  final double? maxDeliveryFee;
  final double? minRating;
  final bool? isOpen;
  final double? latitude;
  final double? longitude;
  final double? radiusKm;

  const RestaurantFilter({
    this.query,
    this.cuisineType,
    this.maxDeliveryFee,
    this.minRating,
    this.isOpen,
    this.latitude,
    this.longitude,
    this.radiusKm,
  });

  Map<String, dynamic> toQueryParameters() {
    final params = <String, dynamic>{};

    if (query != null && query!.isNotEmpty) params['q'] = query;
    if (cuisineType != null) params['cuisine'] = cuisineType;
    if (maxDeliveryFee != null) params['maxDeliveryFee'] = maxDeliveryFee;
    if (minRating != null) params['minRating'] = minRating;
    if (isOpen != null) params['isOpen'] = isOpen;
    if (latitude != null) params['lat'] = latitude;
    if (longitude != null) params['lng'] = longitude;
    if (radiusKm != null) params['radius'] = radiusKm;

    return params;
  }

  RestaurantFilter copyWith({
    String? query,
    String? cuisineType,
    double? maxDeliveryFee,
    double? minRating,
    bool? isOpen,
    double? latitude,
    double? longitude,
    double? radiusKm,
  }) {
    return RestaurantFilter(
      query: query ?? this.query,
      cuisineType: cuisineType ?? this.cuisineType,
      maxDeliveryFee: maxDeliveryFee ?? this.maxDeliveryFee,
      minRating: minRating ?? this.minRating,
      isOpen: isOpen ?? this.isOpen,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      radiusKm: radiusKm ?? this.radiusKm,
    );
  }
}