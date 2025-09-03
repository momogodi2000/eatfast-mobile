// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantImpl _$$RestaurantImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      cuisineTypes: (json['cuisineTypes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      rating: (json['rating'] as num).toDouble(),
      reviewCount: (json['reviewCount'] as num).toInt(),
      priceRange: json['priceRange'] as String,
      estimatedDeliveryTime: (json['estimatedDeliveryTime'] as num).toInt(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      isOpen: json['isOpen'] as bool,
      address:
          RestaurantAddress.fromJson(json['address'] as Map<String, dynamic>),
      operatingHours: (json['operatingHours'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      phoneNumber: json['phoneNumber'] as String,
      specialties: (json['specialties'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isFavorite: json['isFavorite'] as bool? ?? false,
      isPromoted: json['isPromoted'] as bool? ?? false,
      paymentMethods: (json['paymentMethods'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$RestaurantImplToJson(_$RestaurantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'cuisineTypes': instance.cuisineTypes,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'priceRange': instance.priceRange,
      'estimatedDeliveryTime': instance.estimatedDeliveryTime,
      'deliveryFee': instance.deliveryFee,
      'isOpen': instance.isOpen,
      'address': instance.address,
      'operatingHours': instance.operatingHours,
      'phoneNumber': instance.phoneNumber,
      'specialties': instance.specialties,
      'isFavorite': instance.isFavorite,
      'isPromoted': instance.isPromoted,
      'paymentMethods': instance.paymentMethods,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$RestaurantAddressImpl _$$RestaurantAddressImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantAddressImpl(
      street: json['street'] as String,
      city: json['city'] as String,
      district: json['district'] as String,
      postalCode: json['postalCode'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      landmark: json['landmark'] as String?,
    );

Map<String, dynamic> _$$RestaurantAddressImplToJson(
        _$RestaurantAddressImpl instance) =>
    <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'district': instance.district,
      'postalCode': instance.postalCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'landmark': instance.landmark,
    };

_$RestaurantFilterImpl _$$RestaurantFilterImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantFilterImpl(
      searchQuery: json['searchQuery'] as String?,
      cuisineTypes: (json['cuisineTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      minRating: (json['minRating'] as num?)?.toDouble(),
      maxRating: (json['maxRating'] as num?)?.toDouble(),
      maxDeliveryTime: (json['maxDeliveryTime'] as num?)?.toInt(),
      maxDeliveryFee: (json['maxDeliveryFee'] as num?)?.toDouble(),
      priceRange: json['priceRange'] as String?,
      isOpen: json['isOpen'] as bool?,
      sortBy: $enumDecodeNullable(_$RestaurantSortByEnumMap, json['sortBy']) ??
          RestaurantSortBy.rating,
      sortOrder: $enumDecodeNullable(_$SortOrderEnumMap, json['sortOrder']) ??
          SortOrder.descending,
    );

Map<String, dynamic> _$$RestaurantFilterImplToJson(
        _$RestaurantFilterImpl instance) =>
    <String, dynamic>{
      'searchQuery': instance.searchQuery,
      'cuisineTypes': instance.cuisineTypes,
      'minRating': instance.minRating,
      'maxRating': instance.maxRating,
      'maxDeliveryTime': instance.maxDeliveryTime,
      'maxDeliveryFee': instance.maxDeliveryFee,
      'priceRange': instance.priceRange,
      'isOpen': instance.isOpen,
      'sortBy': _$RestaurantSortByEnumMap[instance.sortBy]!,
      'sortOrder': _$SortOrderEnumMap[instance.sortOrder]!,
    };

const _$RestaurantSortByEnumMap = {
  RestaurantSortBy.name: 'name',
  RestaurantSortBy.rating: 'rating',
  RestaurantSortBy.deliveryTime: 'deliveryTime',
  RestaurantSortBy.deliveryFee: 'deliveryFee',
  RestaurantSortBy.distance: 'distance',
};

const _$SortOrderEnumMap = {
  SortOrder.ascending: 'asc',
  SortOrder.descending: 'desc',
};
