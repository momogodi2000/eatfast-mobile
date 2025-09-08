// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantImpl _$$RestaurantImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      logo: json['logo'] as String?,
      coverImage: json['coverImage'] as String?,
      imageUrl: json['imageUrl'] as String?,
      address:
          RestaurantAddress.fromJson(json['address'] as Map<String, dynamic>),
      contact:
          RestaurantContact.fromJson(json['contact'] as Map<String, dynamic>),
      operatingHours: (json['operatingHours'] as List<dynamic>)
          .map((e) => OperatingHours.fromJson(e as Map<String, dynamic>))
          .toList(),
      cuisineTypes: (json['cuisineTypes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      specialties: (json['specialties'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      paymentMethods: (json['paymentMethods'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      priceRange: json['priceRange'] as String,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
      status: json['status'] as String,
      isOpen: json['isOpen'] as bool? ?? true,
      isPromoted: json['isPromoted'] as bool? ?? false,
      isVerified: json['isVerified'] as bool? ?? false,
      estimatedDeliveryTime:
          (json['estimatedDeliveryTime'] as num?)?.toInt() ?? 30,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0.0,
      minimumOrder: (json['minimumOrder'] as num?)?.toDouble() ?? 2000.0,
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
      'logo': instance.logo,
      'coverImage': instance.coverImage,
      'imageUrl': instance.imageUrl,
      'address': instance.address,
      'contact': instance.contact,
      'operatingHours': instance.operatingHours,
      'cuisineTypes': instance.cuisineTypes,
      'specialties': instance.specialties,
      'features': instance.features,
      'paymentMethods': instance.paymentMethods,
      'priceRange': instance.priceRange,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'status': instance.status,
      'isOpen': instance.isOpen,
      'isPromoted': instance.isPromoted,
      'isVerified': instance.isVerified,
      'estimatedDeliveryTime': instance.estimatedDeliveryTime,
      'deliveryFee': instance.deliveryFee,
      'minimumOrder': instance.minimumOrder,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$RestaurantAddressImpl _$$RestaurantAddressImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantAddressImpl(
      street: json['street'] as String,
      city: json['city'] as String,
      country: json['country'] as String?,
      district: json['district'] as String?,
      landmark: json['landmark'] as String?,
      coordinates: RestaurantCoordinates.fromJson(
          json['coordinates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RestaurantAddressImplToJson(
        _$RestaurantAddressImpl instance) =>
    <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'country': instance.country,
      'district': instance.district,
      'landmark': instance.landmark,
      'coordinates': instance.coordinates,
    };

_$RestaurantCoordinatesImpl _$$RestaurantCoordinatesImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantCoordinatesImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$RestaurantCoordinatesImplToJson(
        _$RestaurantCoordinatesImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$RestaurantContactImpl _$$RestaurantContactImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantContactImpl(
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      website: json['website'] as String?,
    );

Map<String, dynamic> _$$RestaurantContactImplToJson(
        _$RestaurantContactImpl instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'website': instance.website,
    };

_$OperatingHoursImpl _$$OperatingHoursImplFromJson(Map<String, dynamic> json) =>
    _$OperatingHoursImpl(
      day: json['day'] as String,
      open: json['open'] as String,
      close: json['close'] as String,
      isClosed: json['isClosed'] as bool? ?? false,
    );

Map<String, dynamic> _$$OperatingHoursImplToJson(
        _$OperatingHoursImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'open': instance.open,
      'close': instance.close,
      'isClosed': instance.isClosed,
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
      hasPromotion: json['hasPromotion'] as bool?,
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
      'hasPromotion': instance.hasPromotion,
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
