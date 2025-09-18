/// Restaurant Model
/// Core model for restaurant data

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String address;
  final String? phone;
  final String? email;
  final double latitude;
  final double longitude;
  final List<String> cuisineTypes;
  final double rating;
  final int reviewCount;
  final String? imageUrl;
  final List<String> gallery;
  final bool isOpen;
  final bool isFeatured;
  final String openingHours;
  final double deliveryFee;
  final int estimatedDeliveryTime;
  final double minimumOrderAmount;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    this.phone,
    this.email,
    required this.latitude,
    required this.longitude,
    this.cuisineTypes = const [],
    this.rating = 0.0,
    this.reviewCount = 0,
    this.imageUrl,
    this.gallery = const [],
    this.isOpen = true,
    this.isFeatured = false,
    this.openingHours = '9:00 AM - 10:00 PM',
    this.deliveryFee = 0.0,
    this.estimatedDeliveryTime = 30,
    this.minimumOrderAmount = 0.0,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      address: json['address'] ?? '',
      phone: json['phone'],
      email: json['email'],
      latitude: (json['latitude'] ?? 0.0).toDouble(),
      longitude: (json['longitude'] ?? 0.0).toDouble(),
      cuisineTypes: List<String>.from(json['cuisineTypes'] ?? []),
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      imageUrl: json['imageUrl'],
      gallery: List<String>.from(json['gallery'] ?? []),
      isOpen: json['isOpen'] ?? true,
      isFeatured: json['isFeatured'] ?? false,
      openingHours: json['openingHours'] ?? '9:00 AM - 10:00 PM',
      deliveryFee: (json['deliveryFee'] ?? 0.0).toDouble(),
      estimatedDeliveryTime: json['estimatedDeliveryTime'] ?? 30,
      minimumOrderAmount: (json['minimumOrderAmount'] ?? 0.0).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'address': address,
      'phone': phone,
      'email': email,
      'latitude': latitude,
      'longitude': longitude,
      'cuisineTypes': cuisineTypes,
      'rating': rating,
      'reviewCount': reviewCount,
      'imageUrl': imageUrl,
      'gallery': gallery,
      'isOpen': isOpen,
      'isFeatured': isFeatured,
      'openingHours': openingHours,
      'deliveryFee': deliveryFee,
      'estimatedDeliveryTime': estimatedDeliveryTime,
      'minimumOrderAmount': minimumOrderAmount,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  Restaurant copyWith({
    String? id,
    String? name,
    String? description,
    String? address,
    String? phone,
    String? email,
    double? latitude,
    double? longitude,
    List<String>? cuisineTypes,
    double? rating,
    int? reviewCount,
    String? imageUrl,
    List<String>? gallery,
    bool? isOpen,
    bool? isFeatured,
    String? openingHours,
    double? deliveryFee,
    int? estimatedDeliveryTime,
    double? minimumOrderAmount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Restaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      cuisineTypes: cuisineTypes ?? this.cuisineTypes,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      imageUrl: imageUrl ?? this.imageUrl,
      gallery: gallery ?? this.gallery,
      isOpen: isOpen ?? this.isOpen,
      isFeatured: isFeatured ?? this.isFeatured,
      openingHours: openingHours ?? this.openingHours,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      estimatedDeliveryTime: estimatedDeliveryTime ?? this.estimatedDeliveryTime,
      minimumOrderAmount: minimumOrderAmount ?? this.minimumOrderAmount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}