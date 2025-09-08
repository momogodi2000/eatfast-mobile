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
  String? get description => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String? get coverImage => throw _privateConstructorUsedError;
  String? get imageUrl =>
      throw _privateConstructorUsedError; // Added for backend compatibility
  RestaurantAddress get address => throw _privateConstructorUsedError;
  RestaurantContact get contact => throw _privateConstructorUsedError;
  List<OperatingHours> get operatingHours => throw _privateConstructorUsedError;
  List<String> get cuisineTypes => throw _privateConstructorUsedError;
  List<String>? get specialties =>
      throw _privateConstructorUsedError; // Added for backend
  List<String> get features =>
      throw _privateConstructorUsedError; // ["Delivery", "Takeaway"]
  List<String>? get paymentMethods =>
      throw _privateConstructorUsedError; // Added for backend
  String get priceRange =>
      throw _privateConstructorUsedError; // "$", "$$", "$$$", "$$$$"
  double get rating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // "ACTIVE", "INACTIVE", "PENDING"
  bool get isOpen => throw _privateConstructorUsedError;
  bool get isPromoted =>
      throw _privateConstructorUsedError; // Added for backend
  bool get isVerified =>
      throw _privateConstructorUsedError; // Added for backend
  int get estimatedDeliveryTime => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get minimumOrder =>
      throw _privateConstructorUsedError; // Added for backend
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
      String? description,
      String? logo,
      String? coverImage,
      String? imageUrl,
      RestaurantAddress address,
      RestaurantContact contact,
      List<OperatingHours> operatingHours,
      List<String> cuisineTypes,
      List<String>? specialties,
      List<String> features,
      List<String>? paymentMethods,
      String priceRange,
      double rating,
      int reviewCount,
      String status,
      bool isOpen,
      bool isPromoted,
      bool isVerified,
      int estimatedDeliveryTime,
      double deliveryFee,
      double minimumOrder,
      DateTime? createdAt,
      DateTime? updatedAt});

  $RestaurantAddressCopyWith<$Res> get address;
  $RestaurantContactCopyWith<$Res> get contact;
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
    Object? description = freezed,
    Object? logo = freezed,
    Object? coverImage = freezed,
    Object? imageUrl = freezed,
    Object? address = null,
    Object? contact = null,
    Object? operatingHours = null,
    Object? cuisineTypes = null,
    Object? specialties = freezed,
    Object? features = null,
    Object? paymentMethods = freezed,
    Object? priceRange = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? status = null,
    Object? isOpen = null,
    Object? isPromoted = null,
    Object? isVerified = null,
    Object? estimatedDeliveryTime = null,
    Object? deliveryFee = null,
    Object? minimumOrder = null,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as RestaurantAddress,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as RestaurantContact,
      operatingHours: null == operatingHours
          ? _value.operatingHours
          : operatingHours // ignore: cast_nullable_to_non_nullable
              as List<OperatingHours>,
      cuisineTypes: null == cuisineTypes
          ? _value.cuisineTypes
          : cuisineTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      specialties: freezed == specialties
          ? _value.specialties
          : specialties // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      paymentMethods: freezed == paymentMethods
          ? _value.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      priceRange: null == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isPromoted: null == isPromoted
          ? _value.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      estimatedDeliveryTime: null == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      minimumOrder: null == minimumOrder
          ? _value.minimumOrder
          : minimumOrder // ignore: cast_nullable_to_non_nullable
              as double,
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

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RestaurantContactCopyWith<$Res> get contact {
    return $RestaurantContactCopyWith<$Res>(_value.contact, (value) {
      return _then(_value.copyWith(contact: value) as $Val);
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
      String? description,
      String? logo,
      String? coverImage,
      String? imageUrl,
      RestaurantAddress address,
      RestaurantContact contact,
      List<OperatingHours> operatingHours,
      List<String> cuisineTypes,
      List<String>? specialties,
      List<String> features,
      List<String>? paymentMethods,
      String priceRange,
      double rating,
      int reviewCount,
      String status,
      bool isOpen,
      bool isPromoted,
      bool isVerified,
      int estimatedDeliveryTime,
      double deliveryFee,
      double minimumOrder,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $RestaurantAddressCopyWith<$Res> get address;
  @override
  $RestaurantContactCopyWith<$Res> get contact;
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
    Object? description = freezed,
    Object? logo = freezed,
    Object? coverImage = freezed,
    Object? imageUrl = freezed,
    Object? address = null,
    Object? contact = null,
    Object? operatingHours = null,
    Object? cuisineTypes = null,
    Object? specialties = freezed,
    Object? features = null,
    Object? paymentMethods = freezed,
    Object? priceRange = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? status = null,
    Object? isOpen = null,
    Object? isPromoted = null,
    Object? isVerified = null,
    Object? estimatedDeliveryTime = null,
    Object? deliveryFee = null,
    Object? minimumOrder = null,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as RestaurantAddress,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as RestaurantContact,
      operatingHours: null == operatingHours
          ? _value._operatingHours
          : operatingHours // ignore: cast_nullable_to_non_nullable
              as List<OperatingHours>,
      cuisineTypes: null == cuisineTypes
          ? _value._cuisineTypes
          : cuisineTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      specialties: freezed == specialties
          ? _value._specialties
          : specialties // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      paymentMethods: freezed == paymentMethods
          ? _value._paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      priceRange: null == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isPromoted: null == isPromoted
          ? _value.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      estimatedDeliveryTime: null == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      minimumOrder: null == minimumOrder
          ? _value.minimumOrder
          : minimumOrder // ignore: cast_nullable_to_non_nullable
              as double,
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
      this.description,
      this.logo,
      this.coverImage,
      this.imageUrl,
      required this.address,
      required this.contact,
      required final List<OperatingHours> operatingHours,
      required final List<String> cuisineTypes,
      final List<String>? specialties,
      final List<String> features = const [],
      final List<String>? paymentMethods,
      required this.priceRange,
      this.rating = 0.0,
      this.reviewCount = 0,
      required this.status,
      this.isOpen = true,
      this.isPromoted = false,
      this.isVerified = false,
      this.estimatedDeliveryTime = 30,
      this.deliveryFee = 0.0,
      this.minimumOrder = 2000.0,
      this.createdAt,
      this.updatedAt})
      : _operatingHours = operatingHours,
        _cuisineTypes = cuisineTypes,
        _specialties = specialties,
        _features = features,
        _paymentMethods = paymentMethods;

  factory _$RestaurantImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? logo;
  @override
  final String? coverImage;
  @override
  final String? imageUrl;
// Added for backend compatibility
  @override
  final RestaurantAddress address;
  @override
  final RestaurantContact contact;
  final List<OperatingHours> _operatingHours;
  @override
  List<OperatingHours> get operatingHours {
    if (_operatingHours is EqualUnmodifiableListView) return _operatingHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_operatingHours);
  }

  final List<String> _cuisineTypes;
  @override
  List<String> get cuisineTypes {
    if (_cuisineTypes is EqualUnmodifiableListView) return _cuisineTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cuisineTypes);
  }

  final List<String>? _specialties;
  @override
  List<String>? get specialties {
    final value = _specialties;
    if (value == null) return null;
    if (_specialties is EqualUnmodifiableListView) return _specialties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Added for backend
  final List<String> _features;
// Added for backend
  @override
  @JsonKey()
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

// ["Delivery", "Takeaway"]
  final List<String>? _paymentMethods;
// ["Delivery", "Takeaway"]
  @override
  List<String>? get paymentMethods {
    final value = _paymentMethods;
    if (value == null) return null;
    if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Added for backend
  @override
  final String priceRange;
// "$", "$$", "$$$", "$$$$"
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final int reviewCount;
  @override
  final String status;
// "ACTIVE", "INACTIVE", "PENDING"
  @override
  @JsonKey()
  final bool isOpen;
  @override
  @JsonKey()
  final bool isPromoted;
// Added for backend
  @override
  @JsonKey()
  final bool isVerified;
// Added for backend
  @override
  @JsonKey()
  final int estimatedDeliveryTime;
  @override
  @JsonKey()
  final double deliveryFee;
  @override
  @JsonKey()
  final double minimumOrder;
// Added for backend
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Restaurant(id: $id, name: $name, description: $description, logo: $logo, coverImage: $coverImage, imageUrl: $imageUrl, address: $address, contact: $contact, operatingHours: $operatingHours, cuisineTypes: $cuisineTypes, specialties: $specialties, features: $features, paymentMethods: $paymentMethods, priceRange: $priceRange, rating: $rating, reviewCount: $reviewCount, status: $status, isOpen: $isOpen, isPromoted: $isPromoted, isVerified: $isVerified, estimatedDeliveryTime: $estimatedDeliveryTime, deliveryFee: $deliveryFee, minimumOrder: $minimumOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
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
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            const DeepCollectionEquality()
                .equals(other._operatingHours, _operatingHours) &&
            const DeepCollectionEquality()
                .equals(other._cuisineTypes, _cuisineTypes) &&
            const DeepCollectionEquality()
                .equals(other._specialties, _specialties) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            const DeepCollectionEquality()
                .equals(other._paymentMethods, _paymentMethods) &&
            (identical(other.priceRange, priceRange) ||
                other.priceRange == priceRange) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.isPromoted, isPromoted) ||
                other.isPromoted == isPromoted) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.estimatedDeliveryTime, estimatedDeliveryTime) ||
                other.estimatedDeliveryTime == estimatedDeliveryTime) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.minimumOrder, minimumOrder) ||
                other.minimumOrder == minimumOrder) &&
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
        logo,
        coverImage,
        imageUrl,
        address,
        contact,
        const DeepCollectionEquality().hash(_operatingHours),
        const DeepCollectionEquality().hash(_cuisineTypes),
        const DeepCollectionEquality().hash(_specialties),
        const DeepCollectionEquality().hash(_features),
        const DeepCollectionEquality().hash(_paymentMethods),
        priceRange,
        rating,
        reviewCount,
        status,
        isOpen,
        isPromoted,
        isVerified,
        estimatedDeliveryTime,
        deliveryFee,
        minimumOrder,
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
      final String? description,
      final String? logo,
      final String? coverImage,
      final String? imageUrl,
      required final RestaurantAddress address,
      required final RestaurantContact contact,
      required final List<OperatingHours> operatingHours,
      required final List<String> cuisineTypes,
      final List<String>? specialties,
      final List<String> features,
      final List<String>? paymentMethods,
      required final String priceRange,
      final double rating,
      final int reviewCount,
      required final String status,
      final bool isOpen,
      final bool isPromoted,
      final bool isVerified,
      final int estimatedDeliveryTime,
      final double deliveryFee,
      final double minimumOrder,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$RestaurantImpl;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$RestaurantImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get logo;
  @override
  String? get coverImage;
  @override
  String? get imageUrl; // Added for backend compatibility
  @override
  RestaurantAddress get address;
  @override
  RestaurantContact get contact;
  @override
  List<OperatingHours> get operatingHours;
  @override
  List<String> get cuisineTypes;
  @override
  List<String>? get specialties; // Added for backend
  @override
  List<String> get features; // ["Delivery", "Takeaway"]
  @override
  List<String>? get paymentMethods; // Added for backend
  @override
  String get priceRange; // "$", "$$", "$$$", "$$$$"
  @override
  double get rating;
  @override
  int get reviewCount;
  @override
  String get status; // "ACTIVE", "INACTIVE", "PENDING"
  @override
  bool get isOpen;
  @override
  bool get isPromoted; // Added for backend
  @override
  bool get isVerified; // Added for backend
  @override
  int get estimatedDeliveryTime;
  @override
  double get deliveryFee;
  @override
  double get minimumOrder; // Added for backend
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
  String? get country => throw _privateConstructorUsedError;
  String? get district =>
      throw _privateConstructorUsedError; // Added for backend
  String? get landmark =>
      throw _privateConstructorUsedError; // Added for backend
  RestaurantCoordinates get coordinates => throw _privateConstructorUsedError;

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
      String? country,
      String? district,
      String? landmark,
      RestaurantCoordinates coordinates});

  $RestaurantCoordinatesCopyWith<$Res> get coordinates;
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
    Object? country = freezed,
    Object? district = freezed,
    Object? landmark = freezed,
    Object? coordinates = null,
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
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as RestaurantCoordinates,
    ) as $Val);
  }

  /// Create a copy of RestaurantAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RestaurantCoordinatesCopyWith<$Res> get coordinates {
    return $RestaurantCoordinatesCopyWith<$Res>(_value.coordinates, (value) {
      return _then(_value.copyWith(coordinates: value) as $Val);
    });
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
      String? country,
      String? district,
      String? landmark,
      RestaurantCoordinates coordinates});

  @override
  $RestaurantCoordinatesCopyWith<$Res> get coordinates;
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
    Object? country = freezed,
    Object? district = freezed,
    Object? landmark = freezed,
    Object? coordinates = null,
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
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as RestaurantCoordinates,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantAddressImpl implements _RestaurantAddress {
  const _$RestaurantAddressImpl(
      {required this.street,
      required this.city,
      this.country,
      this.district,
      this.landmark,
      required this.coordinates});

  factory _$RestaurantAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantAddressImplFromJson(json);

  @override
  final String street;
  @override
  final String city;
  @override
  final String? country;
  @override
  final String? district;
// Added for backend
  @override
  final String? landmark;
// Added for backend
  @override
  final RestaurantCoordinates coordinates;

  @override
  String toString() {
    return 'RestaurantAddress(street: $street, city: $city, country: $country, district: $district, landmark: $landmark, coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantAddressImpl &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, street, city, country, district, landmark, coordinates);

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
          final String? country,
          final String? district,
          final String? landmark,
          required final RestaurantCoordinates coordinates}) =
      _$RestaurantAddressImpl;

  factory _RestaurantAddress.fromJson(Map<String, dynamic> json) =
      _$RestaurantAddressImpl.fromJson;

  @override
  String get street;
  @override
  String get city;
  @override
  String? get country;
  @override
  String? get district; // Added for backend
  @override
  String? get landmark; // Added for backend
  @override
  RestaurantCoordinates get coordinates;

  /// Create a copy of RestaurantAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantAddressImplCopyWith<_$RestaurantAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RestaurantCoordinates _$RestaurantCoordinatesFromJson(
    Map<String, dynamic> json) {
  return _RestaurantCoordinates.fromJson(json);
}

/// @nodoc
mixin _$RestaurantCoordinates {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  /// Serializes this RestaurantCoordinates to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantCoordinatesCopyWith<RestaurantCoordinates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantCoordinatesCopyWith<$Res> {
  factory $RestaurantCoordinatesCopyWith(RestaurantCoordinates value,
          $Res Function(RestaurantCoordinates) then) =
      _$RestaurantCoordinatesCopyWithImpl<$Res, RestaurantCoordinates>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$RestaurantCoordinatesCopyWithImpl<$Res,
        $Val extends RestaurantCoordinates>
    implements $RestaurantCoordinatesCopyWith<$Res> {
  _$RestaurantCoordinatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantCoordinatesImplCopyWith<$Res>
    implements $RestaurantCoordinatesCopyWith<$Res> {
  factory _$$RestaurantCoordinatesImplCopyWith(
          _$RestaurantCoordinatesImpl value,
          $Res Function(_$RestaurantCoordinatesImpl) then) =
      __$$RestaurantCoordinatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$RestaurantCoordinatesImplCopyWithImpl<$Res>
    extends _$RestaurantCoordinatesCopyWithImpl<$Res,
        _$RestaurantCoordinatesImpl>
    implements _$$RestaurantCoordinatesImplCopyWith<$Res> {
  __$$RestaurantCoordinatesImplCopyWithImpl(_$RestaurantCoordinatesImpl _value,
      $Res Function(_$RestaurantCoordinatesImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestaurantCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$RestaurantCoordinatesImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantCoordinatesImpl implements _RestaurantCoordinates {
  const _$RestaurantCoordinatesImpl(
      {required this.latitude, required this.longitude});

  factory _$RestaurantCoordinatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantCoordinatesImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'RestaurantCoordinates(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantCoordinatesImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  /// Create a copy of RestaurantCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantCoordinatesImplCopyWith<_$RestaurantCoordinatesImpl>
      get copyWith => __$$RestaurantCoordinatesImplCopyWithImpl<
          _$RestaurantCoordinatesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantCoordinatesImplToJson(
      this,
    );
  }
}

abstract class _RestaurantCoordinates implements RestaurantCoordinates {
  const factory _RestaurantCoordinates(
      {required final double latitude,
      required final double longitude}) = _$RestaurantCoordinatesImpl;

  factory _RestaurantCoordinates.fromJson(Map<String, dynamic> json) =
      _$RestaurantCoordinatesImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;

  /// Create a copy of RestaurantCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantCoordinatesImplCopyWith<_$RestaurantCoordinatesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RestaurantContact _$RestaurantContactFromJson(Map<String, dynamic> json) {
  return _RestaurantContact.fromJson(json);
}

/// @nodoc
mixin _$RestaurantContact {
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;

  /// Serializes this RestaurantContact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantContactCopyWith<RestaurantContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantContactCopyWith<$Res> {
  factory $RestaurantContactCopyWith(
          RestaurantContact value, $Res Function(RestaurantContact) then) =
      _$RestaurantContactCopyWithImpl<$Res, RestaurantContact>;
  @useResult
  $Res call({String? phone, String? email, String? website});
}

/// @nodoc
class _$RestaurantContactCopyWithImpl<$Res, $Val extends RestaurantContact>
    implements $RestaurantContactCopyWith<$Res> {
  _$RestaurantContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = freezed,
    Object? email = freezed,
    Object? website = freezed,
  }) {
    return _then(_value.copyWith(
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantContactImplCopyWith<$Res>
    implements $RestaurantContactCopyWith<$Res> {
  factory _$$RestaurantContactImplCopyWith(_$RestaurantContactImpl value,
          $Res Function(_$RestaurantContactImpl) then) =
      __$$RestaurantContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? phone, String? email, String? website});
}

/// @nodoc
class __$$RestaurantContactImplCopyWithImpl<$Res>
    extends _$RestaurantContactCopyWithImpl<$Res, _$RestaurantContactImpl>
    implements _$$RestaurantContactImplCopyWith<$Res> {
  __$$RestaurantContactImplCopyWithImpl(_$RestaurantContactImpl _value,
      $Res Function(_$RestaurantContactImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestaurantContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = freezed,
    Object? email = freezed,
    Object? website = freezed,
  }) {
    return _then(_$RestaurantContactImpl(
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantContactImpl implements _RestaurantContact {
  const _$RestaurantContactImpl({this.phone, this.email, this.website});

  factory _$RestaurantContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantContactImplFromJson(json);

  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? website;

  @override
  String toString() {
    return 'RestaurantContact(phone: $phone, email: $email, website: $website)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantContactImpl &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.website, website) || other.website == website));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phone, email, website);

  /// Create a copy of RestaurantContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantContactImplCopyWith<_$RestaurantContactImpl> get copyWith =>
      __$$RestaurantContactImplCopyWithImpl<_$RestaurantContactImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantContactImplToJson(
      this,
    );
  }
}

abstract class _RestaurantContact implements RestaurantContact {
  const factory _RestaurantContact(
      {final String? phone,
      final String? email,
      final String? website}) = _$RestaurantContactImpl;

  factory _RestaurantContact.fromJson(Map<String, dynamic> json) =
      _$RestaurantContactImpl.fromJson;

  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get website;

  /// Create a copy of RestaurantContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantContactImplCopyWith<_$RestaurantContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OperatingHours _$OperatingHoursFromJson(Map<String, dynamic> json) {
  return _OperatingHours.fromJson(json);
}

/// @nodoc
mixin _$OperatingHours {
  String get day =>
      throw _privateConstructorUsedError; // "monday", "tuesday", etc.
  String get open => throw _privateConstructorUsedError; // "09:00"
  String get close => throw _privateConstructorUsedError; // "22:00"
  bool get isClosed => throw _privateConstructorUsedError;

  /// Serializes this OperatingHours to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OperatingHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OperatingHoursCopyWith<OperatingHours> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperatingHoursCopyWith<$Res> {
  factory $OperatingHoursCopyWith(
          OperatingHours value, $Res Function(OperatingHours) then) =
      _$OperatingHoursCopyWithImpl<$Res, OperatingHours>;
  @useResult
  $Res call({String day, String open, String close, bool isClosed});
}

/// @nodoc
class _$OperatingHoursCopyWithImpl<$Res, $Val extends OperatingHours>
    implements $OperatingHoursCopyWith<$Res> {
  _$OperatingHoursCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OperatingHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? open = null,
    Object? close = null,
    Object? isClosed = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as String,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as String,
      isClosed: null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OperatingHoursImplCopyWith<$Res>
    implements $OperatingHoursCopyWith<$Res> {
  factory _$$OperatingHoursImplCopyWith(_$OperatingHoursImpl value,
          $Res Function(_$OperatingHoursImpl) then) =
      __$$OperatingHoursImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String day, String open, String close, bool isClosed});
}

/// @nodoc
class __$$OperatingHoursImplCopyWithImpl<$Res>
    extends _$OperatingHoursCopyWithImpl<$Res, _$OperatingHoursImpl>
    implements _$$OperatingHoursImplCopyWith<$Res> {
  __$$OperatingHoursImplCopyWithImpl(
      _$OperatingHoursImpl _value, $Res Function(_$OperatingHoursImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperatingHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? open = null,
    Object? close = null,
    Object? isClosed = null,
  }) {
    return _then(_$OperatingHoursImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as String,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as String,
      isClosed: null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OperatingHoursImpl implements _OperatingHours {
  const _$OperatingHoursImpl(
      {required this.day,
      required this.open,
      required this.close,
      this.isClosed = false});

  factory _$OperatingHoursImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperatingHoursImplFromJson(json);

  @override
  final String day;
// "monday", "tuesday", etc.
  @override
  final String open;
// "09:00"
  @override
  final String close;
// "22:00"
  @override
  @JsonKey()
  final bool isClosed;

  @override
  String toString() {
    return 'OperatingHours(day: $day, open: $open, close: $close, isClosed: $isClosed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperatingHoursImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.open, open) || other.open == open) &&
            (identical(other.close, close) || other.close == close) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, day, open, close, isClosed);

  /// Create a copy of OperatingHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OperatingHoursImplCopyWith<_$OperatingHoursImpl> get copyWith =>
      __$$OperatingHoursImplCopyWithImpl<_$OperatingHoursImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OperatingHoursImplToJson(
      this,
    );
  }
}

abstract class _OperatingHours implements OperatingHours {
  const factory _OperatingHours(
      {required final String day,
      required final String open,
      required final String close,
      final bool isClosed}) = _$OperatingHoursImpl;

  factory _OperatingHours.fromJson(Map<String, dynamic> json) =
      _$OperatingHoursImpl.fromJson;

  @override
  String get day; // "monday", "tuesday", etc.
  @override
  String get open; // "09:00"
  @override
  String get close; // "22:00"
  @override
  bool get isClosed;

  /// Create a copy of OperatingHours
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperatingHoursImplCopyWith<_$OperatingHoursImpl> get copyWith =>
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
  bool? get hasPromotion => throw _privateConstructorUsedError;
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
      bool? hasPromotion,
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
    Object? hasPromotion = freezed,
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
      hasPromotion: freezed == hasPromotion
          ? _value.hasPromotion
          : hasPromotion // ignore: cast_nullable_to_non_nullable
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
      bool? hasPromotion,
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
    Object? hasPromotion = freezed,
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
      hasPromotion: freezed == hasPromotion
          ? _value.hasPromotion
          : hasPromotion // ignore: cast_nullable_to_non_nullable
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
      this.hasPromotion,
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
  final bool? hasPromotion;
  @override
  @JsonKey()
  final RestaurantSortBy sortBy;
  @override
  @JsonKey()
  final SortOrder sortOrder;

  @override
  String toString() {
    return 'RestaurantFilter(searchQuery: $searchQuery, cuisineTypes: $cuisineTypes, minRating: $minRating, maxRating: $maxRating, maxDeliveryTime: $maxDeliveryTime, maxDeliveryFee: $maxDeliveryFee, priceRange: $priceRange, isOpen: $isOpen, hasPromotion: $hasPromotion, sortBy: $sortBy, sortOrder: $sortOrder)';
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
            (identical(other.hasPromotion, hasPromotion) ||
                other.hasPromotion == hasPromotion) &&
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
      hasPromotion,
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
      final bool? hasPromotion,
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
  bool? get hasPromotion;
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
