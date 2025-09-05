import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    required String id,
    required String name,
    required String description,
    required String imageUrl,
    required List<String> cuisineTypes,
    required double rating,
    required int reviewCount,
    required String priceRange,
    required int estimatedDeliveryTime,
    required double deliveryFee,
    required bool isOpen,
    required RestaurantAddress address,
    required List<String> operatingHours,
    required String phoneNumber,
    @Default([]) List<String> specialties,
    @Default(false) bool isFavorite,
    @Default(false) bool isPromoted,
    @Default([]) List<String> paymentMethods,
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
    required String district,
    required String postalCode,
    required double latitude,
    required double longitude,
    String? landmark,
  }) = _RestaurantAddress;

  factory RestaurantAddress.fromJson(Map<String, dynamic> json) =>
      _$RestaurantAddressFromJson(json);
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