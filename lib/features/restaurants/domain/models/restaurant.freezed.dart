// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return _Restaurant.fromJson(json);
}

/// @nodoc
mixin _$Restaurant {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  List<String> get cuisineTypes => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  String get priceRange => throw _privateConstructorUsedError;
  int get estimatedDeliveryTime => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  bool get isOpen => throw _privateConstructorUsedError;
  RestaurantAddress get address => throw _privateConstructorUsedError;
  List<String> get operatingHours => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  List<String> get specialties => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  bool get isPromoted => throw _privateConstructorUsedError;
  List<String> get paymentMethods => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Restaurant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantCopyWith<Restaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantCopyWith<$Res> {
  factory $RestaurantCopyWith(
          Restaurant value, $Res Function(Restaurant) then) =
      _$RestaurantCopyWithImpl<$Res, Restaurant>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String imageUrl,
      List<String> cuisineTypes,
      double rating,
      int reviewCount,
      String priceRange,
      int estimatedDeliveryTime,
      double deliveryFee,
      bool isOpen,
      RestaurantAddress address,
      List<String> operatingHours,
      String phoneNumber,
      List<String> specialties,
      bool isFavorite,
      bool isPromoted,
      List<String> paymentMethods,
      DateTime? createdAt,
      DateTime? updatedAt});

  $RestaurantAddressCopyWith<$Res> get address;
}

/// @nodoc
class _$RestaurantCopyWithImpl<$Res, $Val extends Restaurant>
    implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? cuisineTypes = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? priceRange = null,
    Object? estimatedDeliveryTime = null,
    Object? deliveryFee = null,
    Object? isOpen = null,
    Object? address = null,
    Object? operatingHours = null,
    Object? phoneNumber = null,
    Object? specialties = null,
    Object? isFavorite = null,
    Object? isPromoted = null,
    Object? paymentMethods = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      cuisineTypes: null == cuisineTypes
          ? _value.cuisineTypes
          : cuisineTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      priceRange: null == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedDeliveryTime: null == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as RestaurantAddress,
      operatingHours: null == operatingHours
          ? _value.operatingHours
          : operatingHours // ignore: cast_nullable_to_non_nullable
              as List<String>,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      specialties: null == specialties
          ? _value.specialties
          : specialties // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isPromoted: null == isPromoted
          ? _value.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentMethods: null == paymentMethods
          ? _value.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RestaurantAddressCopyWith<$Res> get address {
    return $RestaurantAddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RestaurantImplCopyWith<$Res>
    implements $RestaurantCopyWith<$Res> {
  factory _$$RestaurantImplCopyWith(
          _$RestaurantImpl value, $Res Function(_$RestaurantImpl) then) =
      __$$RestaurantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String imageUrl,
      List<String> cuisineTypes,
      double rating,
      int reviewCount,
      String priceRange,
      int estimatedDeliveryTime,
      double deliveryFee,
      bool isOpen,
      RestaurantAddress address,
      List<String> operatingHours,
      String phoneNumber,
      List<String> specialties,
      bool isFavorite,
      bool isPromoted,
      List<String> paymentMethods,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $RestaurantAddressCopyWith<$Res> get address;
}

/// @nodoc
class __$$RestaurantImplCopyWithImpl<$Res>
    extends _$RestaurantCopyWithImpl<$Res, _$RestaurantImpl>
    implements _$$RestaurantImplCopyWith<$Res> {
  __$$RestaurantImplCopyWithImpl(
      _$RestaurantImpl _value, $Res Function(_$RestaurantImpl) _then)
      : super(_value, _then);

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? cuisineTypes = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? priceRange = null,
    Object? estimatedDeliveryTime = null,
    Object? deliveryFee = null,
    Object? isOpen = null,
    Object? address = null,
    Object? operatingHours = null,
    Object? phoneNumber = null,
    Object? specialties = null,
    Object? isFavorite = null,
    Object? isPromoted = null,
    Object? paymentMethods = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$RestaurantImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      cuisineTypes: null == cuisineTypes
          ? _value._cuisineTypes
          : cuisineTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      priceRange: null == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedDeliveryTime: null == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as RestaurantAddress,
      operatingHours: null == operatingHours
          ? _value._operatingHours
          : operatingHours // ignore: cast_nullable_to_non_nullable
              as List<String>,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      specialties: null == specialties
          ? _value._specialties
          : specialties // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isPromoted: null == isPromoted
          ? _value.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentMethods: null == paymentMethods
          ? _value._paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantImpl implements _Restaurant {
  const _$RestaurantImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required final List<String> cuisineTypes,
      required this.rating,
      required this.reviewCount,
      required this.priceRange,
      required this.estimatedDeliveryTime,
      required this.deliveryFee,
      required this.isOpen,
      required this.address,
      required final List<String> operatingHours,
      required this.phoneNumber,
      final List<String> specialties = const [],
      this.isFavorite = false,
      this.isPromoted = false,
      final List<String> paymentMethods = const [],
      this.createdAt,
      this.updatedAt})
      : _cuisineTypes = cuisineTypes,
        _operatingHours = operatingHours,
        _specialties = specialties,
        _paymentMethods = paymentMethods;

  factory _$RestaurantImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String imageUrl;
  final List<String> _cuisineTypes;
  @override
  List<String> get cuisineTypes {
    if (_cuisineTypes is EqualUnmodifiableListView) return _cuisineTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cuisineTypes);
  }

  @override
  final double rating;
  @override
  final int reviewCount;
  @override
  final String priceRange;
  @override
  final int estimatedDeliveryTime;
  @override
  final double deliveryFee;
  @override
  final bool isOpen;
  @override
  final RestaurantAddress address;
  final List<String> _operatingHours;
  @override
  List<String> get operatingHours {
    if (_operatingHours is EqualUnmodifiableListView) return _operatingHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_operatingHours);
  }

  @override
  final String phoneNumber;
  final List<String> _specialties;
  @override
  @JsonKey()
  List<String> get specialties {
    if (_specialties is EqualUnmodifiableListView) return _specialties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialties);
  }

  @override
  @JsonKey()
  final bool isFavorite;
  @override
  @JsonKey()
  final bool isPromoted;
  final List<String> _paymentMethods;
  @override
  @JsonKey()
  List<String> get paymentMethods {
    if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentMethods);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Restaurant(id: $id, name: $name, description: $description, imageUrl: $imageUrl, cuisineTypes: $cuisineTypes, rating: $rating, reviewCount: $reviewCount, priceRange: $priceRange, estimatedDeliveryTime: $estimatedDeliveryTime, deliveryFee: $deliveryFee, isOpen: $isOpen, address: $address, operatingHours: $operatingHours, phoneNumber: $phoneNumber, specialties: $specialties, isFavorite: $isFavorite, isPromoted: $isPromoted, paymentMethods: $paymentMethods, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality()
                .equals(other._cuisineTypes, _cuisineTypes) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.priceRange, priceRange) ||
                other.priceRange == priceRange) &&
            (identical(other.estimatedDeliveryTime, estimatedDeliveryTime) ||
                other.estimatedDeliveryTime == estimatedDeliveryTime) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._operatingHours, _operatingHours) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other._specialties, _specialties) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isPromoted, isPromoted) ||
                other.isPromoted == isPromoted) &&
            const DeepCollectionEquality()
                .equals(other._paymentMethods, _paymentMethods) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        description,
        imageUrl,
        const DeepCollectionEquality().hash(_cuisineTypes),
        rating,
        reviewCount,
        priceRange,
        estimatedDeliveryTime,
        deliveryFee,
        isOpen,
        address,
        const DeepCollectionEquality().hash(_operatingHours),
        phoneNumber,
        const DeepCollectionEquality().hash(_specialties),
        isFavorite,
        isPromoted,
        const DeepCollectionEquality().hash(_paymentMethods),
        createdAt,
        updatedAt
      ]);

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      __$$RestaurantImplCopyWithImpl<_$RestaurantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantImplToJson(
      this,
    );
  }
}

abstract class _Restaurant implements Restaurant {
  const factory _Restaurant(
      {required final String id,
      required final String name,
      required final String description,
      required final String imageUrl,
      required final List<String> cuisineTypes,
      required final double rating,
      required final int reviewCount,
      required final String priceRange,
      required final int estimatedDeliveryTime,
      required final double deliveryFee,
      required final bool isOpen,
      required final RestaurantAddress address,
      required final List<String> operatingHours,
      required final String phoneNumber,
      final List<String> specialties,
      final bool isFavorite,
      final bool isPromoted,
      final List<String> paymentMethods,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$RestaurantImpl;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$RestaurantImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get imageUrl;
  @override
  List<String> get cuisineTypes;
  @override
  double get rating;
  @override
  int get reviewCount;
  @override
  String get priceRange;
  @override
  int get estimatedDeliveryTime;
  @override
  double get deliveryFee;
  @override
  bool get isOpen;
  @override
  RestaurantAddress get address;
  @override
  List<String> get operatingHours;
  @override
  String get phoneNumber;
  @override
  List<String> get specialties;
  @override
  bool get isFavorite;
  @override
  bool get isPromoted;
  @override
  List<String> get paymentMethods;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RestaurantAddress _$RestaurantAddressFromJson(Map<String, dynamic> json) {
  return _RestaurantAddress.fromJson(json);
}

/// @nodoc
mixin _$RestaurantAddress {
  String get street => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get district => throw _privateConstructorUsedError;
  String get postalCode => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String? get landmark => throw _privateConstructorUsedError;

  /// Serializes this RestaurantAddress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantAddressCopyWith<RestaurantAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantAddressCopyWith<$Res> {
  factory $RestaurantAddressCopyWith(
          RestaurantAddress value, $Res Function(RestaurantAddress) then) =
      _$RestaurantAddressCopyWithImpl<$Res, RestaurantAddress>;
  @useResult
  $Res call(
      {String street,
      String city,
      String district,
      String postalCode,
      double latitude,
      double longitude,
      String? landmark});
}

/// @nodoc
class _$RestaurantAddressCopyWithImpl<$Res, $Val extends RestaurantAddress>
    implements $RestaurantAddressCopyWith<$Res> {
  _$RestaurantAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = null,
    Object? city = null,
    Object? district = null,
    Object? postalCode = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? landmark = freezed,
  }) {
    return _then(_value.copyWith(
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantAddressImplCopyWith<$Res>
    implements $RestaurantAddressCopyWith<$Res> {
  factory _$$RestaurantAddressImplCopyWith(_$RestaurantAddressImpl value,
          $Res Function(_$RestaurantAddressImpl) then) =
      __$$RestaurantAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String street,
      String city,
      String district,
      String postalCode,
      double latitude,
      double longitude,
      String? landmark});
}

/// @nodoc
class __$$RestaurantAddressImplCopyWithImpl<$Res>
    extends _$RestaurantAddressCopyWithImpl<$Res, _$RestaurantAddressImpl>
    implements _$$RestaurantAddressImplCopyWith<$Res> {
  __$$RestaurantAddressImplCopyWithImpl(_$RestaurantAddressImpl _value,
      $Res Function(_$RestaurantAddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestaurantAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = null,
    Object? city = null,
    Object? district = null,
    Object? postalCode = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? landmark = freezed,
  }) {
    return _then(_$RestaurantAddressImpl(
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantAddressImpl implements _RestaurantAddress {
  const _$RestaurantAddressImpl(
      {required this.street,
      required this.city,
      required this.district,
      required this.postalCode,
      required this.latitude,
      required this.longitude,
      this.landmark});

  factory _$RestaurantAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantAddressImplFromJson(json);

  @override
  final String street;
  @override
  final String city;
  @override
  final String district;
  @override
  final String postalCode;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String? landmark;

  @override
  String toString() {
    return 'RestaurantAddress(street: $street, city: $city, district: $district, postalCode: $postalCode, latitude: $latitude, longitude: $longitude, landmark: $landmark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantAddressImpl &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, street, city, district,
      postalCode, latitude, longitude, landmark);

  /// Create a copy of RestaurantAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantAddressImplCopyWith<_$RestaurantAddressImpl> get copyWith =>
      __$$RestaurantAddressImplCopyWithImpl<_$RestaurantAddressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantAddressImplToJson(
      this,
    );
  }
}

abstract class _RestaurantAddress implements RestaurantAddress {
  const factory _RestaurantAddress(
      {required final String street,
      required final String city,
      required final String district,
      required final String postalCode,
      required final double latitude,
      required final double longitude,
      final String? landmark}) = _$RestaurantAddressImpl;

  factory _RestaurantAddress.fromJson(Map<String, dynamic> json) =
      _$RestaurantAddressImpl.fromJson;

  @override
  String get street;
  @override
  String get city;
  @override
  String get district;
  @override
  String get postalCode;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String? get landmark;

  /// Create a copy of RestaurantAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantAddressImplCopyWith<_$RestaurantAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RestaurantFilter _$RestaurantFilterFromJson(Map<String, dynamic> json) {
  return _RestaurantFilter.fromJson(json);
}

/// @nodoc
mixin _$RestaurantFilter {
  String? get searchQuery => throw _privateConstructorUsedError;
  List<String>? get cuisineTypes => throw _privateConstructorUsedError;
  double? get minRating => throw _privateConstructorUsedError;
  double? get maxRating => throw _privateConstructorUsedError;
  int? get maxDeliveryTime => throw _privateConstructorUsedError;
  double? get maxDeliveryFee => throw _privateConstructorUsedError;
  String? get priceRange => throw _privateConstructorUsedError;
  bool? get isOpen => throw _privateConstructorUsedError;
  RestaurantSortBy get sortBy => throw _privateConstructorUsedError;
  SortOrder get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this RestaurantFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantFilterCopyWith<RestaurantFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantFilterCopyWith<$Res> {
  factory $RestaurantFilterCopyWith(
          RestaurantFilter value, $Res Function(RestaurantFilter) then) =
      _$RestaurantFilterCopyWithImpl<$Res, RestaurantFilter>;
  @useResult
  $Res call(
      {String? searchQuery,
      List<String>? cuisineTypes,
      double? minRating,
      double? maxRating,
      int? maxDeliveryTime,
      double? maxDeliveryFee,
      String? priceRange,
      bool? isOpen,
      RestaurantSortBy sortBy,
      SortOrder sortOrder});
}

/// @nodoc
class _$RestaurantFilterCopyWithImpl<$Res, $Val extends RestaurantFilter>
    implements $RestaurantFilterCopyWith<$Res> {
  _$RestaurantFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = freezed,
    Object? cuisineTypes = freezed,
    Object? minRating = freezed,
    Object? maxRating = freezed,
    Object? maxDeliveryTime = freezed,
    Object? maxDeliveryFee = freezed,
    Object? priceRange = freezed,
    Object? isOpen = freezed,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(_value.copyWith(
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      cuisineTypes: freezed == cuisineTypes
          ? _value.cuisineTypes
          : cuisineTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      minRating: freezed == minRating
          ? _value.minRating
          : minRating // ignore: cast_nullable_to_non_nullable
              as double?,
      maxRating: freezed == maxRating
          ? _value.maxRating
          : maxRating // ignore: cast_nullable_to_non_nullable
              as double?,
      maxDeliveryTime: freezed == maxDeliveryTime
          ? _value.maxDeliveryTime
          : maxDeliveryTime // ignore: cast_nullable_to_non_nullable
              as int?,
      maxDeliveryFee: freezed == maxDeliveryFee
          ? _value.maxDeliveryFee
          : maxDeliveryFee // ignore: cast_nullable_to_non_nullable
              as double?,
      priceRange: freezed == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as String?,
      isOpen: freezed == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as RestaurantSortBy,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SortOrder,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantFilterImplCopyWith<$Res>
    implements $RestaurantFilterCopyWith<$Res> {
  factory _$$RestaurantFilterImplCopyWith(_$RestaurantFilterImpl value,
          $Res Function(_$RestaurantFilterImpl) then) =
      __$$RestaurantFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? searchQuery,
      List<String>? cuisineTypes,
      double? minRating,
      double? maxRating,
      int? maxDeliveryTime,
      double? maxDeliveryFee,
      String? priceRange,
      bool? isOpen,
      RestaurantSortBy sortBy,
      SortOrder sortOrder});
}

/// @nodoc
class __$$RestaurantFilterImplCopyWithImpl<$Res>
    extends _$RestaurantFilterCopyWithImpl<$Res, _$RestaurantFilterImpl>
    implements _$$RestaurantFilterImplCopyWith<$Res> {
  __$$RestaurantFilterImplCopyWithImpl(_$RestaurantFilterImpl _value,
      $Res Function(_$RestaurantFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestaurantFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = freezed,
    Object? cuisineTypes = freezed,
    Object? minRating = freezed,
    Object? maxRating = freezed,
    Object? maxDeliveryTime = freezed,
    Object? maxDeliveryFee = freezed,
    Object? priceRange = freezed,
    Object? isOpen = freezed,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(_$RestaurantFilterImpl(
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      cuisineTypes: freezed == cuisineTypes
          ? _value._cuisineTypes
          : cuisineTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      minRating: freezed == minRating
          ? _value.minRating
          : minRating // ignore: cast_nullable_to_non_nullable
              as double?,
      maxRating: freezed == maxRating
          ? _value.maxRating
          : maxRating // ignore: cast_nullable_to_non_nullable
              as double?,
      maxDeliveryTime: freezed == maxDeliveryTime
          ? _value.maxDeliveryTime
          : maxDeliveryTime // ignore: cast_nullable_to_non_nullable
              as int?,
      maxDeliveryFee: freezed == maxDeliveryFee
          ? _value.maxDeliveryFee
          : maxDeliveryFee // ignore: cast_nullable_to_non_nullable
              as double?,
      priceRange: freezed == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as String?,
      isOpen: freezed == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as RestaurantSortBy,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SortOrder,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantFilterImpl implements _RestaurantFilter {
  const _$RestaurantFilterImpl(
      {this.searchQuery,
      final List<String>? cuisineTypes,
      this.minRating,
      this.maxRating,
      this.maxDeliveryTime,
      this.maxDeliveryFee,
      this.priceRange,
      this.isOpen,
      this.sortBy = RestaurantSortBy.rating,
      this.sortOrder = SortOrder.descending})
      : _cuisineTypes = cuisineTypes;

  factory _$RestaurantFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantFilterImplFromJson(json);

  @override
  final String? searchQuery;
  final List<String>? _cuisineTypes;
  @override
  List<String>? get cuisineTypes {
    final value = _cuisineTypes;
    if (value == null) return null;
    if (_cuisineTypes is EqualUnmodifiableListView) return _cuisineTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? minRating;
  @override
  final double? maxRating;
  @override
  final int? maxDeliveryTime;
  @override
  final double? maxDeliveryFee;
  @override
  final String? priceRange;
  @override
  final bool? isOpen;
  @override
  @JsonKey()
  final RestaurantSortBy sortBy;
  @override
  @JsonKey()
  final SortOrder sortOrder;

  @override
  String toString() {
    return 'RestaurantFilter(searchQuery: $searchQuery, cuisineTypes: $cuisineTypes, minRating: $minRating, maxRating: $maxRating, maxDeliveryTime: $maxDeliveryTime, maxDeliveryFee: $maxDeliveryFee, priceRange: $priceRange, isOpen: $isOpen, sortBy: $sortBy, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantFilterImpl &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            const DeepCollectionEquality()
                .equals(other._cuisineTypes, _cuisineTypes) &&
            (identical(other.minRating, minRating) ||
                other.minRating == minRating) &&
            (identical(other.maxRating, maxRating) ||
                other.maxRating == maxRating) &&
            (identical(other.maxDeliveryTime, maxDeliveryTime) ||
                other.maxDeliveryTime == maxDeliveryTime) &&
            (identical(other.maxDeliveryFee, maxDeliveryFee) ||
                other.maxDeliveryFee == maxDeliveryFee) &&
            (identical(other.priceRange, priceRange) ||
                other.priceRange == priceRange) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      searchQuery,
      const DeepCollectionEquality().hash(_cuisineTypes),
      minRating,
      maxRating,
      maxDeliveryTime,
      maxDeliveryFee,
      priceRange,
      isOpen,
      sortBy,
      sortOrder);

  /// Create a copy of RestaurantFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantFilterImplCopyWith<_$RestaurantFilterImpl> get copyWith =>
      __$$RestaurantFilterImplCopyWithImpl<_$RestaurantFilterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantFilterImplToJson(
      this,
    );
  }
}

abstract class _RestaurantFilter implements RestaurantFilter {
  const factory _RestaurantFilter(
      {final String? searchQuery,
      final List<String>? cuisineTypes,
      final double? minRating,
      final double? maxRating,
      final int? maxDeliveryTime,
      final double? maxDeliveryFee,
      final String? priceRange,
      final bool? isOpen,
      final RestaurantSortBy sortBy,
      final SortOrder sortOrder}) = _$RestaurantFilterImpl;

  factory _RestaurantFilter.fromJson(Map<String, dynamic> json) =
      _$RestaurantFilterImpl.fromJson;

  @override
  String? get searchQuery;
  @override
  List<String>? get cuisineTypes;
  @override
  double? get minRating;
  @override
  double? get maxRating;
  @override
  int? get maxDeliveryTime;
  @override
  double? get maxDeliveryFee;
  @override
  String? get priceRange;
  @override
  bool? get isOpen;
  @override
  RestaurantSortBy get sortBy;
  @override
  SortOrder get sortOrder;

  /// Create a copy of RestaurantFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantFilterImplCopyWith<_$RestaurantFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
