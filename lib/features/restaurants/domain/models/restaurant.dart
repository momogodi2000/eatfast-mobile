import 'package:freezed_annotation/freezed_annotation.dart';

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
    String? imageUrl, // Added for backend compatibility
    required RestaurantAddress address,
    required RestaurantContact contact,
    required List<OperatingHours> operatingHours,
    required List<String> cuisineTypes,
    List<String>? specialties, // Added for backend
    @Default([]) List<String> features, // ["Delivery", "Takeaway"]
    List<String>? paymentMethods, // Added for backend
    required String priceRange, // "$", "$$", "$$$", "$$$$"
    @Default(0.0) double rating,
    @Default(0) int reviewCount,
    required String status, // "ACTIVE", "INACTIVE", "PENDING"
    @Default(true) bool isOpen,
    @Default(false) bool isPromoted, // Added for backend
    @Default(false) bool isVerified, // Added for backend
    @Default(30) int estimatedDeliveryTime,
    @Default(0.0) double deliveryFee,
    @Default(2000.0) double minimumOrder, // Added for backend
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
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
