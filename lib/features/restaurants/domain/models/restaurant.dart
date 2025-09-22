import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    required String id,
    required String name,
    String? description,
    String? logo,
    String? coverImage,
    
    // Backend matching fields
    required String cuisineType, // Changed from List<String> cuisineTypes to match backend
    Map<String, dynamic>? openingHours, // Changed from List<OperatingHours> to match backend JSON
    List<String>? images, // Changed from single logo/coverImage to match backend array
    String? city, // Added city field to match backend enum
    @Default(false) bool isVerified, // Verification status
    String? ownerId, // Added owner ID field
    double? commissionRate, // For restaurant owners
    double? totalEarnings, // For restaurant owners
    List<String>? deliveryZones, // Added missing backend field
    
    // Keep existing mobile-specific fields for compatibility
    RestaurantAddress? address, // Made optional since backend uses different structure
    RestaurantContact? contact, // Made optional
    List<String>? specialties,
    @Default([]) List<String> features, // ["Delivery", "Takeaway"]
    List<String>? paymentMethods,
    required String priceRange, // "$", "$$", "$$$", "$$$$"
    @Default(0.0) double rating,
    @Default(0) int reviewCount,
    required RestaurantStatus status, // Changed to enum for better type safety
    @Default(true) bool isOpen,
    @Default(false) bool isPromoted,
    @Default(30) int estimatedDeliveryTime,
    @Default(0.0) double deliveryFee,
    @Default(2000.0) double minimumOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}

// Extension methods for backward compatibility
extension RestaurantCompat on Restaurant {
  /// Backward compatibility: Convert single cuisineType to List for UI
  List<String> get cuisineTypes => [cuisineType];
  
  /// Backward compatibility: Get first image as imageUrl, or use logo/coverImage
  String? get imageUrl {
    if (images != null && images!.isNotEmpty) {
      return images!.first;
    }
    return coverImage ?? logo;
  }
}

// Restaurant status enum matching backend
enum RestaurantStatus {
  @JsonValue('active')
  active,
  @JsonValue('inactive') 
  inactive,
  @JsonValue('pending')
  pending,
  @JsonValue('suspended')
  suspended;

  String get displayName {
    switch (this) {
      case RestaurantStatus.active:
        return 'Actif';
      case RestaurantStatus.inactive:
        return 'Inactif';
      case RestaurantStatus.pending:
        return 'En Attente';
      case RestaurantStatus.suspended:
        return 'Suspendu';
    }
  }
}

@freezed
class RestaurantAddress with _$RestaurantAddress {
  const factory RestaurantAddress({
    required String street,
    required String city,
    String? country,
    String? district, // Added for backend
    String? landmark, // Added for backend
    required RestaurantCoordinates coordinates,
  }) = _RestaurantAddress;

  factory RestaurantAddress.fromJson(Map<String, dynamic> json) =>
      _$RestaurantAddressFromJson(json);
}

@freezed
class RestaurantCoordinates with _$RestaurantCoordinates {
  const factory RestaurantCoordinates({
    required double latitude,
    required double longitude,
  }) = _RestaurantCoordinates;

  factory RestaurantCoordinates.fromJson(Map<String, dynamic> json) =>
      _$RestaurantCoordinatesFromJson(json);
}

@freezed
class RestaurantContact with _$RestaurantContact {
  const factory RestaurantContact({
    String? phone,
    String? email,
    String? website,
  }) = _RestaurantContact;

  factory RestaurantContact.fromJson(Map<String, dynamic> json) =>
      _$RestaurantContactFromJson(json);
}

@freezed
class OperatingHours with _$OperatingHours {
  const factory OperatingHours({
    required String day, // "monday", "tuesday", etc.
    required String open, // "09:00"
    required String close, // "22:00"
    @Default(false) bool isClosed,
  }) = _OperatingHours;

  factory OperatingHours.fromJson(Map<String, dynamic> json) =>
      _$OperatingHoursFromJson(json);
}

@freezed
class RestaurantFilter with _$RestaurantFilter {
  const factory RestaurantFilter({
    String? searchQuery,
    List<String>? cuisineTypes,
    double? minRating,
    double? maxRating,
    int? maxDeliveryTime,
    double? maxDeliveryFee,
    String? priceRange,
    bool? isOpen,
    bool? hasPromotion,
    @Default(RestaurantSortBy.rating) RestaurantSortBy sortBy,
    @Default(SortOrder.descending) SortOrder sortOrder,
  }) = _RestaurantFilter;

  factory RestaurantFilter.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFilterFromJson(json);
}

enum RestaurantSortBy {
  @JsonValue('name')
  name,
  @JsonValue('rating')
  rating,
  @JsonValue('deliveryTime')
  deliveryTime,
  @JsonValue('deliveryFee')
  deliveryFee,
  @JsonValue('distance')
  distance,
}

enum SortOrder {
  @JsonValue('asc')
  ascending,
  @JsonValue('desc')
  descending,
}

enum PriceRange {
  @JsonValue('budget')
  budget,      // €
  @JsonValue('moderate')
  moderate,    // €€
  @JsonValue('expensive')
  expensive,   // €€€
  @JsonValue('luxury')
  luxury,      // €€€€
}
