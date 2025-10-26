// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_management.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserAccount _$UserAccountFromJson(Map<String, dynamic> json) {
  return _UserAccount.fromJson(json);
}

/// @nodoc
mixin _$UserAccount {
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  UserStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get lastLoginAt => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  DateTime? get suspendedAt => throw _privateConstructorUsedError;
  String? get suspensionReason => throw _privateConstructorUsedError;
  List<UserActivity> get recentActivity => throw _privateConstructorUsedError;
  int get totalOrders => throw _privateConstructorUsedError;
  double get totalSpent => throw _privateConstructorUsedError;
  double get averageOrderValue => throw _privateConstructorUsedError;
  double get customerRating => throw _privateConstructorUsedError;

  /// Serializes this UserAccount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAccountCopyWith<UserAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountCopyWith<$Res> {
  factory $UserAccountCopyWith(
          UserAccount value, $Res Function(UserAccount) then) =
      _$UserAccountCopyWithImpl<$Res, UserAccount>;
  @useResult
  $Res call(
      {String userId,
      String name,
      String email,
      String phoneNumber,
      UserRole role,
      UserStatus status,
      DateTime createdAt,
      DateTime lastLoginAt,
      String? profileImageUrl,
      String? address,
      DateTime? suspendedAt,
      String? suspensionReason,
      List<UserActivity> recentActivity,
      int totalOrders,
      double totalSpent,
      double averageOrderValue,
      double customerRating});
}

/// @nodoc
class _$UserAccountCopyWithImpl<$Res, $Val extends UserAccount>
    implements $UserAccountCopyWith<$Res> {
  _$UserAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? role = null,
    Object? status = null,
    Object? createdAt = null,
    Object? lastLoginAt = null,
    Object? profileImageUrl = freezed,
    Object? address = freezed,
    Object? suspendedAt = freezed,
    Object? suspensionReason = freezed,
    Object? recentActivity = null,
    Object? totalOrders = null,
    Object? totalSpent = null,
    Object? averageOrderValue = null,
    Object? customerRating = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastLoginAt: null == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      suspendedAt: freezed == suspendedAt
          ? _value.suspendedAt
          : suspendedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      suspensionReason: freezed == suspensionReason
          ? _value.suspensionReason
          : suspensionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      recentActivity: null == recentActivity
          ? _value.recentActivity
          : recentActivity // ignore: cast_nullable_to_non_nullable
              as List<UserActivity>,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      customerRating: null == customerRating
          ? _value.customerRating
          : customerRating // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAccountImplCopyWith<$Res>
    implements $UserAccountCopyWith<$Res> {
  factory _$$UserAccountImplCopyWith(
          _$UserAccountImpl value, $Res Function(_$UserAccountImpl) then) =
      __$$UserAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String name,
      String email,
      String phoneNumber,
      UserRole role,
      UserStatus status,
      DateTime createdAt,
      DateTime lastLoginAt,
      String? profileImageUrl,
      String? address,
      DateTime? suspendedAt,
      String? suspensionReason,
      List<UserActivity> recentActivity,
      int totalOrders,
      double totalSpent,
      double averageOrderValue,
      double customerRating});
}

/// @nodoc
class __$$UserAccountImplCopyWithImpl<$Res>
    extends _$UserAccountCopyWithImpl<$Res, _$UserAccountImpl>
    implements _$$UserAccountImplCopyWith<$Res> {
  __$$UserAccountImplCopyWithImpl(
      _$UserAccountImpl _value, $Res Function(_$UserAccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? role = null,
    Object? status = null,
    Object? createdAt = null,
    Object? lastLoginAt = null,
    Object? profileImageUrl = freezed,
    Object? address = freezed,
    Object? suspendedAt = freezed,
    Object? suspensionReason = freezed,
    Object? recentActivity = null,
    Object? totalOrders = null,
    Object? totalSpent = null,
    Object? averageOrderValue = null,
    Object? customerRating = null,
  }) {
    return _then(_$UserAccountImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastLoginAt: null == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      suspendedAt: freezed == suspendedAt
          ? _value.suspendedAt
          : suspendedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      suspensionReason: freezed == suspensionReason
          ? _value.suspensionReason
          : suspensionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      recentActivity: null == recentActivity
          ? _value._recentActivity
          : recentActivity // ignore: cast_nullable_to_non_nullable
              as List<UserActivity>,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      customerRating: null == customerRating
          ? _value.customerRating
          : customerRating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAccountImpl implements _UserAccount {
  const _$UserAccountImpl(
      {required this.userId,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.role,
      required this.status,
      required this.createdAt,
      required this.lastLoginAt,
      this.profileImageUrl,
      this.address,
      this.suspendedAt,
      this.suspensionReason,
      final List<UserActivity> recentActivity = const [],
      this.totalOrders = 0,
      this.totalSpent = 0.0,
      this.averageOrderValue = 0.0,
      this.customerRating = 5.0})
      : _recentActivity = recentActivity;

  factory _$UserAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAccountImplFromJson(json);

  @override
  final String userId;
  @override
  final String name;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final UserRole role;
  @override
  final UserStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime lastLoginAt;
  @override
  final String? profileImageUrl;
  @override
  final String? address;
  @override
  final DateTime? suspendedAt;
  @override
  final String? suspensionReason;
  final List<UserActivity> _recentActivity;
  @override
  @JsonKey()
  List<UserActivity> get recentActivity {
    if (_recentActivity is EqualUnmodifiableListView) return _recentActivity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentActivity);
  }

  @override
  @JsonKey()
  final int totalOrders;
  @override
  @JsonKey()
  final double totalSpent;
  @override
  @JsonKey()
  final double averageOrderValue;
  @override
  @JsonKey()
  final double customerRating;

  @override
  String toString() {
    return 'UserAccount(userId: $userId, name: $name, email: $email, phoneNumber: $phoneNumber, role: $role, status: $status, createdAt: $createdAt, lastLoginAt: $lastLoginAt, profileImageUrl: $profileImageUrl, address: $address, suspendedAt: $suspendedAt, suspensionReason: $suspensionReason, recentActivity: $recentActivity, totalOrders: $totalOrders, totalSpent: $totalSpent, averageOrderValue: $averageOrderValue, customerRating: $customerRating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAccountImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.suspendedAt, suspendedAt) ||
                other.suspendedAt == suspendedAt) &&
            (identical(other.suspensionReason, suspensionReason) ||
                other.suspensionReason == suspensionReason) &&
            const DeepCollectionEquality()
                .equals(other._recentActivity, _recentActivity) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.averageOrderValue, averageOrderValue) ||
                other.averageOrderValue == averageOrderValue) &&
            (identical(other.customerRating, customerRating) ||
                other.customerRating == customerRating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      name,
      email,
      phoneNumber,
      role,
      status,
      createdAt,
      lastLoginAt,
      profileImageUrl,
      address,
      suspendedAt,
      suspensionReason,
      const DeepCollectionEquality().hash(_recentActivity),
      totalOrders,
      totalSpent,
      averageOrderValue,
      customerRating);

  /// Create a copy of UserAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAccountImplCopyWith<_$UserAccountImpl> get copyWith =>
      __$$UserAccountImplCopyWithImpl<_$UserAccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAccountImplToJson(
      this,
    );
  }
}

abstract class _UserAccount implements UserAccount {
  const factory _UserAccount(
      {required final String userId,
      required final String name,
      required final String email,
      required final String phoneNumber,
      required final UserRole role,
      required final UserStatus status,
      required final DateTime createdAt,
      required final DateTime lastLoginAt,
      final String? profileImageUrl,
      final String? address,
      final DateTime? suspendedAt,
      final String? suspensionReason,
      final List<UserActivity> recentActivity,
      final int totalOrders,
      final double totalSpent,
      final double averageOrderValue,
      final double customerRating}) = _$UserAccountImpl;

  factory _UserAccount.fromJson(Map<String, dynamic> json) =
      _$UserAccountImpl.fromJson;

  @override
  String get userId;
  @override
  String get name;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  UserRole get role;
  @override
  UserStatus get status;
  @override
  DateTime get createdAt;
  @override
  DateTime get lastLoginAt;
  @override
  String? get profileImageUrl;
  @override
  String? get address;
  @override
  DateTime? get suspendedAt;
  @override
  String? get suspensionReason;
  @override
  List<UserActivity> get recentActivity;
  @override
  int get totalOrders;
  @override
  double get totalSpent;
  @override
  double get averageOrderValue;
  @override
  double get customerRating;

  /// Create a copy of UserAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAccountImplCopyWith<_$UserAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RestaurantAccount _$RestaurantAccountFromJson(Map<String, dynamic> json) {
  return _RestaurantAccount.fromJson(json);
}

/// @nodoc
mixin _$RestaurantAccount {
  String get restaurantId => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  RestaurantStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get lastActiveAt => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get cuisineType => throw _privateConstructorUsedError;
  DateTime? get verifiedAt => throw _privateConstructorUsedError;
  DateTime? get suspendedAt => throw _privateConstructorUsedError;
  String? get suspensionReason => throw _privateConstructorUsedError;
  List<String> get serviceAreas => throw _privateConstructorUsedError;
  List<RestaurantDocument> get documents => throw _privateConstructorUsedError;
  int get totalOrders => throw _privateConstructorUsedError;
  double get totalRevenue => throw _privateConstructorUsedError;
  double get averageOrderValue => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;
  double get commissionRate => throw _privateConstructorUsedError;

  /// Serializes this RestaurantAccount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantAccountCopyWith<RestaurantAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantAccountCopyWith<$Res> {
  factory $RestaurantAccountCopyWith(
          RestaurantAccount value, $Res Function(RestaurantAccount) then) =
      _$RestaurantAccountCopyWithImpl<$Res, RestaurantAccount>;
  @useResult
  $Res call(
      {String restaurantId,
      String ownerId,
      String name,
      String email,
      String phoneNumber,
      String address,
      double latitude,
      double longitude,
      RestaurantStatus status,
      DateTime createdAt,
      DateTime lastActiveAt,
      String? logoUrl,
      String? description,
      String? cuisineType,
      DateTime? verifiedAt,
      DateTime? suspendedAt,
      String? suspensionReason,
      List<String> serviceAreas,
      List<RestaurantDocument> documents,
      int totalOrders,
      double totalRevenue,
      double averageOrderValue,
      double averageRating,
      double commissionRate});
}

/// @nodoc
class _$RestaurantAccountCopyWithImpl<$Res, $Val extends RestaurantAccount>
    implements $RestaurantAccountCopyWith<$Res> {
  _$RestaurantAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantId = null,
    Object? ownerId = null,
    Object? name = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? status = null,
    Object? createdAt = null,
    Object? lastActiveAt = null,
    Object? logoUrl = freezed,
    Object? description = freezed,
    Object? cuisineType = freezed,
    Object? verifiedAt = freezed,
    Object? suspendedAt = freezed,
    Object? suspensionReason = freezed,
    Object? serviceAreas = null,
    Object? documents = null,
    Object? totalOrders = null,
    Object? totalRevenue = null,
    Object? averageOrderValue = null,
    Object? averageRating = null,
    Object? commissionRate = null,
  }) {
    return _then(_value.copyWith(
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RestaurantStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastActiveAt: null == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      cuisineType: freezed == cuisineType
          ? _value.cuisineType
          : cuisineType // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedAt: freezed == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      suspendedAt: freezed == suspendedAt
          ? _value.suspendedAt
          : suspendedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      suspensionReason: freezed == suspensionReason
          ? _value.suspensionReason
          : suspensionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceAreas: null == serviceAreas
          ? _value.serviceAreas
          : serviceAreas // ignore: cast_nullable_to_non_nullable
              as List<String>,
      documents: null == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<RestaurantDocument>,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      commissionRate: null == commissionRate
          ? _value.commissionRate
          : commissionRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantAccountImplCopyWith<$Res>
    implements $RestaurantAccountCopyWith<$Res> {
  factory _$$RestaurantAccountImplCopyWith(_$RestaurantAccountImpl value,
          $Res Function(_$RestaurantAccountImpl) then) =
      __$$RestaurantAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String restaurantId,
      String ownerId,
      String name,
      String email,
      String phoneNumber,
      String address,
      double latitude,
      double longitude,
      RestaurantStatus status,
      DateTime createdAt,
      DateTime lastActiveAt,
      String? logoUrl,
      String? description,
      String? cuisineType,
      DateTime? verifiedAt,
      DateTime? suspendedAt,
      String? suspensionReason,
      List<String> serviceAreas,
      List<RestaurantDocument> documents,
      int totalOrders,
      double totalRevenue,
      double averageOrderValue,
      double averageRating,
      double commissionRate});
}

/// @nodoc
class __$$RestaurantAccountImplCopyWithImpl<$Res>
    extends _$RestaurantAccountCopyWithImpl<$Res, _$RestaurantAccountImpl>
    implements _$$RestaurantAccountImplCopyWith<$Res> {
  __$$RestaurantAccountImplCopyWithImpl(_$RestaurantAccountImpl _value,
      $Res Function(_$RestaurantAccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestaurantAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantId = null,
    Object? ownerId = null,
    Object? name = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? status = null,
    Object? createdAt = null,
    Object? lastActiveAt = null,
    Object? logoUrl = freezed,
    Object? description = freezed,
    Object? cuisineType = freezed,
    Object? verifiedAt = freezed,
    Object? suspendedAt = freezed,
    Object? suspensionReason = freezed,
    Object? serviceAreas = null,
    Object? documents = null,
    Object? totalOrders = null,
    Object? totalRevenue = null,
    Object? averageOrderValue = null,
    Object? averageRating = null,
    Object? commissionRate = null,
  }) {
    return _then(_$RestaurantAccountImpl(
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RestaurantStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastActiveAt: null == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      cuisineType: freezed == cuisineType
          ? _value.cuisineType
          : cuisineType // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedAt: freezed == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      suspendedAt: freezed == suspendedAt
          ? _value.suspendedAt
          : suspendedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      suspensionReason: freezed == suspensionReason
          ? _value.suspensionReason
          : suspensionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceAreas: null == serviceAreas
          ? _value._serviceAreas
          : serviceAreas // ignore: cast_nullable_to_non_nullable
              as List<String>,
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<RestaurantDocument>,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      commissionRate: null == commissionRate
          ? _value.commissionRate
          : commissionRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantAccountImpl implements _RestaurantAccount {
  const _$RestaurantAccountImpl(
      {required this.restaurantId,
      required this.ownerId,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.address,
      required this.latitude,
      required this.longitude,
      required this.status,
      required this.createdAt,
      required this.lastActiveAt,
      this.logoUrl,
      this.description,
      this.cuisineType,
      this.verifiedAt,
      this.suspendedAt,
      this.suspensionReason,
      final List<String> serviceAreas = const [],
      final List<RestaurantDocument> documents = const [],
      this.totalOrders = 0,
      this.totalRevenue = 0.0,
      this.averageOrderValue = 0.0,
      this.averageRating = 5.0,
      this.commissionRate = 0.0})
      : _serviceAreas = serviceAreas,
        _documents = documents;

  factory _$RestaurantAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantAccountImplFromJson(json);

  @override
  final String restaurantId;
  @override
  final String ownerId;
  @override
  final String name;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final String address;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final RestaurantStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime lastActiveAt;
  @override
  final String? logoUrl;
  @override
  final String? description;
  @override
  final String? cuisineType;
  @override
  final DateTime? verifiedAt;
  @override
  final DateTime? suspendedAt;
  @override
  final String? suspensionReason;
  final List<String> _serviceAreas;
  @override
  @JsonKey()
  List<String> get serviceAreas {
    if (_serviceAreas is EqualUnmodifiableListView) return _serviceAreas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceAreas);
  }

  final List<RestaurantDocument> _documents;
  @override
  @JsonKey()
  List<RestaurantDocument> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  @JsonKey()
  final int totalOrders;
  @override
  @JsonKey()
  final double totalRevenue;
  @override
  @JsonKey()
  final double averageOrderValue;
  @override
  @JsonKey()
  final double averageRating;
  @override
  @JsonKey()
  final double commissionRate;

  @override
  String toString() {
    return 'RestaurantAccount(restaurantId: $restaurantId, ownerId: $ownerId, name: $name, email: $email, phoneNumber: $phoneNumber, address: $address, latitude: $latitude, longitude: $longitude, status: $status, createdAt: $createdAt, lastActiveAt: $lastActiveAt, logoUrl: $logoUrl, description: $description, cuisineType: $cuisineType, verifiedAt: $verifiedAt, suspendedAt: $suspendedAt, suspensionReason: $suspensionReason, serviceAreas: $serviceAreas, documents: $documents, totalOrders: $totalOrders, totalRevenue: $totalRevenue, averageOrderValue: $averageOrderValue, averageRating: $averageRating, commissionRate: $commissionRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantAccountImpl &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastActiveAt, lastActiveAt) ||
                other.lastActiveAt == lastActiveAt) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.cuisineType, cuisineType) ||
                other.cuisineType == cuisineType) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.suspendedAt, suspendedAt) ||
                other.suspendedAt == suspendedAt) &&
            (identical(other.suspensionReason, suspensionReason) ||
                other.suspensionReason == suspensionReason) &&
            const DeepCollectionEquality()
                .equals(other._serviceAreas, _serviceAreas) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.averageOrderValue, averageOrderValue) ||
                other.averageOrderValue == averageOrderValue) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.commissionRate, commissionRate) ||
                other.commissionRate == commissionRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        restaurantId,
        ownerId,
        name,
        email,
        phoneNumber,
        address,
        latitude,
        longitude,
        status,
        createdAt,
        lastActiveAt,
        logoUrl,
        description,
        cuisineType,
        verifiedAt,
        suspendedAt,
        suspensionReason,
        const DeepCollectionEquality().hash(_serviceAreas),
        const DeepCollectionEquality().hash(_documents),
        totalOrders,
        totalRevenue,
        averageOrderValue,
        averageRating,
        commissionRate
      ]);

  /// Create a copy of RestaurantAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantAccountImplCopyWith<_$RestaurantAccountImpl> get copyWith =>
      __$$RestaurantAccountImplCopyWithImpl<_$RestaurantAccountImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantAccountImplToJson(
      this,
    );
  }
}

abstract class _RestaurantAccount implements RestaurantAccount {
  const factory _RestaurantAccount(
      {required final String restaurantId,
      required final String ownerId,
      required final String name,
      required final String email,
      required final String phoneNumber,
      required final String address,
      required final double latitude,
      required final double longitude,
      required final RestaurantStatus status,
      required final DateTime createdAt,
      required final DateTime lastActiveAt,
      final String? logoUrl,
      final String? description,
      final String? cuisineType,
      final DateTime? verifiedAt,
      final DateTime? suspendedAt,
      final String? suspensionReason,
      final List<String> serviceAreas,
      final List<RestaurantDocument> documents,
      final int totalOrders,
      final double totalRevenue,
      final double averageOrderValue,
      final double averageRating,
      final double commissionRate}) = _$RestaurantAccountImpl;

  factory _RestaurantAccount.fromJson(Map<String, dynamic> json) =
      _$RestaurantAccountImpl.fromJson;

  @override
  String get restaurantId;
  @override
  String get ownerId;
  @override
  String get name;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  String get address;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  RestaurantStatus get status;
  @override
  DateTime get createdAt;
  @override
  DateTime get lastActiveAt;
  @override
  String? get logoUrl;
  @override
  String? get description;
  @override
  String? get cuisineType;
  @override
  DateTime? get verifiedAt;
  @override
  DateTime? get suspendedAt;
  @override
  String? get suspensionReason;
  @override
  List<String> get serviceAreas;
  @override
  List<RestaurantDocument> get documents;
  @override
  int get totalOrders;
  @override
  double get totalRevenue;
  @override
  double get averageOrderValue;
  @override
  double get averageRating;
  @override
  double get commissionRate;

  /// Create a copy of RestaurantAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantAccountImplCopyWith<_$RestaurantAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DriverAccount _$DriverAccountFromJson(Map<String, dynamic> json) {
  return _DriverAccount.fromJson(json);
}

/// @nodoc
mixin _$DriverAccount {
  String get driverId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get licenseNumber => throw _privateConstructorUsedError;
  String get vehicleType => throw _privateConstructorUsedError;
  String get vehicleModel => throw _privateConstructorUsedError;
  String get vehiclePlateNumber => throw _privateConstructorUsedError;
  DriverAccountStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get lastActiveAt => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String? get currentLocation => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  DateTime? get verifiedAt => throw _privateConstructorUsedError;
  DateTime? get suspendedAt => throw _privateConstructorUsedError;
  String? get suspensionReason => throw _privateConstructorUsedError;
  List<DriverDocument> get documents => throw _privateConstructorUsedError;
  List<String> get serviceAreas => throw _privateConstructorUsedError;
  int get totalDeliveries => throw _privateConstructorUsedError;
  double get totalEarnings => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;
  double get completionRate => throw _privateConstructorUsedError;
  int get onlineHours => throw _privateConstructorUsedError;

  /// Serializes this DriverAccount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriverAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverAccountCopyWith<DriverAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverAccountCopyWith<$Res> {
  factory $DriverAccountCopyWith(
          DriverAccount value, $Res Function(DriverAccount) then) =
      _$DriverAccountCopyWithImpl<$Res, DriverAccount>;
  @useResult
  $Res call(
      {String driverId,
      String name,
      String email,
      String phoneNumber,
      String licenseNumber,
      String vehicleType,
      String vehicleModel,
      String vehiclePlateNumber,
      DriverAccountStatus status,
      DateTime createdAt,
      DateTime lastActiveAt,
      String? profileImageUrl,
      String? currentLocation,
      double? latitude,
      double? longitude,
      DateTime? verifiedAt,
      DateTime? suspendedAt,
      String? suspensionReason,
      List<DriverDocument> documents,
      List<String> serviceAreas,
      int totalDeliveries,
      double totalEarnings,
      double averageRating,
      double completionRate,
      int onlineHours});
}

/// @nodoc
class _$DriverAccountCopyWithImpl<$Res, $Val extends DriverAccount>
    implements $DriverAccountCopyWith<$Res> {
  _$DriverAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriverAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverId = null,
    Object? name = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? licenseNumber = null,
    Object? vehicleType = null,
    Object? vehicleModel = null,
    Object? vehiclePlateNumber = null,
    Object? status = null,
    Object? createdAt = null,
    Object? lastActiveAt = null,
    Object? profileImageUrl = freezed,
    Object? currentLocation = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? verifiedAt = freezed,
    Object? suspendedAt = freezed,
    Object? suspensionReason = freezed,
    Object? documents = null,
    Object? serviceAreas = null,
    Object? totalDeliveries = null,
    Object? totalEarnings = null,
    Object? averageRating = null,
    Object? completionRate = null,
    Object? onlineHours = null,
  }) {
    return _then(_value.copyWith(
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleModel: null == vehicleModel
          ? _value.vehicleModel
          : vehicleModel // ignore: cast_nullable_to_non_nullable
              as String,
      vehiclePlateNumber: null == vehiclePlateNumber
          ? _value.vehiclePlateNumber
          : vehiclePlateNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DriverAccountStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastActiveAt: null == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      verifiedAt: freezed == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      suspendedAt: freezed == suspendedAt
          ? _value.suspendedAt
          : suspendedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      suspensionReason: freezed == suspensionReason
          ? _value.suspensionReason
          : suspensionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      documents: null == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<DriverDocument>,
      serviceAreas: null == serviceAreas
          ? _value.serviceAreas
          : serviceAreas // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalDeliveries: null == totalDeliveries
          ? _value.totalDeliveries
          : totalDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      totalEarnings: null == totalEarnings
          ? _value.totalEarnings
          : totalEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
      onlineHours: null == onlineHours
          ? _value.onlineHours
          : onlineHours // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriverAccountImplCopyWith<$Res>
    implements $DriverAccountCopyWith<$Res> {
  factory _$$DriverAccountImplCopyWith(
          _$DriverAccountImpl value, $Res Function(_$DriverAccountImpl) then) =
      __$$DriverAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String driverId,
      String name,
      String email,
      String phoneNumber,
      String licenseNumber,
      String vehicleType,
      String vehicleModel,
      String vehiclePlateNumber,
      DriverAccountStatus status,
      DateTime createdAt,
      DateTime lastActiveAt,
      String? profileImageUrl,
      String? currentLocation,
      double? latitude,
      double? longitude,
      DateTime? verifiedAt,
      DateTime? suspendedAt,
      String? suspensionReason,
      List<DriverDocument> documents,
      List<String> serviceAreas,
      int totalDeliveries,
      double totalEarnings,
      double averageRating,
      double completionRate,
      int onlineHours});
}

/// @nodoc
class __$$DriverAccountImplCopyWithImpl<$Res>
    extends _$DriverAccountCopyWithImpl<$Res, _$DriverAccountImpl>
    implements _$$DriverAccountImplCopyWith<$Res> {
  __$$DriverAccountImplCopyWithImpl(
      _$DriverAccountImpl _value, $Res Function(_$DriverAccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of DriverAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverId = null,
    Object? name = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? licenseNumber = null,
    Object? vehicleType = null,
    Object? vehicleModel = null,
    Object? vehiclePlateNumber = null,
    Object? status = null,
    Object? createdAt = null,
    Object? lastActiveAt = null,
    Object? profileImageUrl = freezed,
    Object? currentLocation = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? verifiedAt = freezed,
    Object? suspendedAt = freezed,
    Object? suspensionReason = freezed,
    Object? documents = null,
    Object? serviceAreas = null,
    Object? totalDeliveries = null,
    Object? totalEarnings = null,
    Object? averageRating = null,
    Object? completionRate = null,
    Object? onlineHours = null,
  }) {
    return _then(_$DriverAccountImpl(
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleModel: null == vehicleModel
          ? _value.vehicleModel
          : vehicleModel // ignore: cast_nullable_to_non_nullable
              as String,
      vehiclePlateNumber: null == vehiclePlateNumber
          ? _value.vehiclePlateNumber
          : vehiclePlateNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DriverAccountStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastActiveAt: null == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      verifiedAt: freezed == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      suspendedAt: freezed == suspendedAt
          ? _value.suspendedAt
          : suspendedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      suspensionReason: freezed == suspensionReason
          ? _value.suspensionReason
          : suspensionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<DriverDocument>,
      serviceAreas: null == serviceAreas
          ? _value._serviceAreas
          : serviceAreas // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalDeliveries: null == totalDeliveries
          ? _value.totalDeliveries
          : totalDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      totalEarnings: null == totalEarnings
          ? _value.totalEarnings
          : totalEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
      onlineHours: null == onlineHours
          ? _value.onlineHours
          : onlineHours // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverAccountImpl implements _DriverAccount {
  const _$DriverAccountImpl(
      {required this.driverId,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.licenseNumber,
      required this.vehicleType,
      required this.vehicleModel,
      required this.vehiclePlateNumber,
      required this.status,
      required this.createdAt,
      required this.lastActiveAt,
      this.profileImageUrl,
      this.currentLocation,
      this.latitude,
      this.longitude,
      this.verifiedAt,
      this.suspendedAt,
      this.suspensionReason,
      final List<DriverDocument> documents = const [],
      final List<String> serviceAreas = const [],
      this.totalDeliveries = 0,
      this.totalEarnings = 0.0,
      this.averageRating = 5.0,
      this.completionRate = 0.0,
      this.onlineHours = 0})
      : _documents = documents,
        _serviceAreas = serviceAreas;

  factory _$DriverAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverAccountImplFromJson(json);

  @override
  final String driverId;
  @override
  final String name;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final String licenseNumber;
  @override
  final String vehicleType;
  @override
  final String vehicleModel;
  @override
  final String vehiclePlateNumber;
  @override
  final DriverAccountStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime lastActiveAt;
  @override
  final String? profileImageUrl;
  @override
  final String? currentLocation;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final DateTime? verifiedAt;
  @override
  final DateTime? suspendedAt;
  @override
  final String? suspensionReason;
  final List<DriverDocument> _documents;
  @override
  @JsonKey()
  List<DriverDocument> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  final List<String> _serviceAreas;
  @override
  @JsonKey()
  List<String> get serviceAreas {
    if (_serviceAreas is EqualUnmodifiableListView) return _serviceAreas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceAreas);
  }

  @override
  @JsonKey()
  final int totalDeliveries;
  @override
  @JsonKey()
  final double totalEarnings;
  @override
  @JsonKey()
  final double averageRating;
  @override
  @JsonKey()
  final double completionRate;
  @override
  @JsonKey()
  final int onlineHours;

  @override
  String toString() {
    return 'DriverAccount(driverId: $driverId, name: $name, email: $email, phoneNumber: $phoneNumber, licenseNumber: $licenseNumber, vehicleType: $vehicleType, vehicleModel: $vehicleModel, vehiclePlateNumber: $vehiclePlateNumber, status: $status, createdAt: $createdAt, lastActiveAt: $lastActiveAt, profileImageUrl: $profileImageUrl, currentLocation: $currentLocation, latitude: $latitude, longitude: $longitude, verifiedAt: $verifiedAt, suspendedAt: $suspendedAt, suspensionReason: $suspensionReason, documents: $documents, serviceAreas: $serviceAreas, totalDeliveries: $totalDeliveries, totalEarnings: $totalEarnings, averageRating: $averageRating, completionRate: $completionRate, onlineHours: $onlineHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverAccountImpl &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.vehicleModel, vehicleModel) ||
                other.vehicleModel == vehicleModel) &&
            (identical(other.vehiclePlateNumber, vehiclePlateNumber) ||
                other.vehiclePlateNumber == vehiclePlateNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastActiveAt, lastActiveAt) ||
                other.lastActiveAt == lastActiveAt) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.suspendedAt, suspendedAt) ||
                other.suspendedAt == suspendedAt) &&
            (identical(other.suspensionReason, suspensionReason) ||
                other.suspensionReason == suspensionReason) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            const DeepCollectionEquality()
                .equals(other._serviceAreas, _serviceAreas) &&
            (identical(other.totalDeliveries, totalDeliveries) ||
                other.totalDeliveries == totalDeliveries) &&
            (identical(other.totalEarnings, totalEarnings) ||
                other.totalEarnings == totalEarnings) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            (identical(other.onlineHours, onlineHours) ||
                other.onlineHours == onlineHours));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        driverId,
        name,
        email,
        phoneNumber,
        licenseNumber,
        vehicleType,
        vehicleModel,
        vehiclePlateNumber,
        status,
        createdAt,
        lastActiveAt,
        profileImageUrl,
        currentLocation,
        latitude,
        longitude,
        verifiedAt,
        suspendedAt,
        suspensionReason,
        const DeepCollectionEquality().hash(_documents),
        const DeepCollectionEquality().hash(_serviceAreas),
        totalDeliveries,
        totalEarnings,
        averageRating,
        completionRate,
        onlineHours
      ]);

  /// Create a copy of DriverAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverAccountImplCopyWith<_$DriverAccountImpl> get copyWith =>
      __$$DriverAccountImplCopyWithImpl<_$DriverAccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverAccountImplToJson(
      this,
    );
  }
}

abstract class _DriverAccount implements DriverAccount {
  const factory _DriverAccount(
      {required final String driverId,
      required final String name,
      required final String email,
      required final String phoneNumber,
      required final String licenseNumber,
      required final String vehicleType,
      required final String vehicleModel,
      required final String vehiclePlateNumber,
      required final DriverAccountStatus status,
      required final DateTime createdAt,
      required final DateTime lastActiveAt,
      final String? profileImageUrl,
      final String? currentLocation,
      final double? latitude,
      final double? longitude,
      final DateTime? verifiedAt,
      final DateTime? suspendedAt,
      final String? suspensionReason,
      final List<DriverDocument> documents,
      final List<String> serviceAreas,
      final int totalDeliveries,
      final double totalEarnings,
      final double averageRating,
      final double completionRate,
      final int onlineHours}) = _$DriverAccountImpl;

  factory _DriverAccount.fromJson(Map<String, dynamic> json) =
      _$DriverAccountImpl.fromJson;

  @override
  String get driverId;
  @override
  String get name;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  String get licenseNumber;
  @override
  String get vehicleType;
  @override
  String get vehicleModel;
  @override
  String get vehiclePlateNumber;
  @override
  DriverAccountStatus get status;
  @override
  DateTime get createdAt;
  @override
  DateTime get lastActiveAt;
  @override
  String? get profileImageUrl;
  @override
  String? get currentLocation;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  DateTime? get verifiedAt;
  @override
  DateTime? get suspendedAt;
  @override
  String? get suspensionReason;
  @override
  List<DriverDocument> get documents;
  @override
  List<String> get serviceAreas;
  @override
  int get totalDeliveries;
  @override
  double get totalEarnings;
  @override
  double get averageRating;
  @override
  double get completionRate;
  @override
  int get onlineHours;

  /// Create a copy of DriverAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverAccountImplCopyWith<_$DriverAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserActivity _$UserActivityFromJson(Map<String, dynamic> json) {
  return _UserActivity.fromJson(json);
}

/// @nodoc
mixin _$UserActivity {
  String get activityId => throw _privateConstructorUsedError;
  UserActivityType get type => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get relatedOrderId => throw _privateConstructorUsedError;
  String? get relatedRestaurantId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this UserActivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserActivityCopyWith<UserActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserActivityCopyWith<$Res> {
  factory $UserActivityCopyWith(
          UserActivity value, $Res Function(UserActivity) then) =
      _$UserActivityCopyWithImpl<$Res, UserActivity>;
  @useResult
  $Res call(
      {String activityId,
      UserActivityType type,
      DateTime timestamp,
      String description,
      String? relatedOrderId,
      String? relatedRestaurantId,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$UserActivityCopyWithImpl<$Res, $Val extends UserActivity>
    implements $UserActivityCopyWith<$Res> {
  _$UserActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityId = null,
    Object? type = null,
    Object? timestamp = null,
    Object? description = null,
    Object? relatedOrderId = freezed,
    Object? relatedRestaurantId = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      activityId: null == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UserActivityType,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      relatedOrderId: freezed == relatedOrderId
          ? _value.relatedOrderId
          : relatedOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedRestaurantId: freezed == relatedRestaurantId
          ? _value.relatedRestaurantId
          : relatedRestaurantId // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserActivityImplCopyWith<$Res>
    implements $UserActivityCopyWith<$Res> {
  factory _$$UserActivityImplCopyWith(
          _$UserActivityImpl value, $Res Function(_$UserActivityImpl) then) =
      __$$UserActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activityId,
      UserActivityType type,
      DateTime timestamp,
      String description,
      String? relatedOrderId,
      String? relatedRestaurantId,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$UserActivityImplCopyWithImpl<$Res>
    extends _$UserActivityCopyWithImpl<$Res, _$UserActivityImpl>
    implements _$$UserActivityImplCopyWith<$Res> {
  __$$UserActivityImplCopyWithImpl(
      _$UserActivityImpl _value, $Res Function(_$UserActivityImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityId = null,
    Object? type = null,
    Object? timestamp = null,
    Object? description = null,
    Object? relatedOrderId = freezed,
    Object? relatedRestaurantId = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$UserActivityImpl(
      activityId: null == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UserActivityType,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      relatedOrderId: freezed == relatedOrderId
          ? _value.relatedOrderId
          : relatedOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedRestaurantId: freezed == relatedRestaurantId
          ? _value.relatedRestaurantId
          : relatedRestaurantId // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserActivityImpl implements _UserActivity {
  const _$UserActivityImpl(
      {required this.activityId,
      required this.type,
      required this.timestamp,
      required this.description,
      this.relatedOrderId,
      this.relatedRestaurantId,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$UserActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserActivityImplFromJson(json);

  @override
  final String activityId;
  @override
  final UserActivityType type;
  @override
  final DateTime timestamp;
  @override
  final String description;
  @override
  final String? relatedOrderId;
  @override
  final String? relatedRestaurantId;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'UserActivity(activityId: $activityId, type: $type, timestamp: $timestamp, description: $description, relatedOrderId: $relatedOrderId, relatedRestaurantId: $relatedRestaurantId, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserActivityImpl &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.relatedOrderId, relatedOrderId) ||
                other.relatedOrderId == relatedOrderId) &&
            (identical(other.relatedRestaurantId, relatedRestaurantId) ||
                other.relatedRestaurantId == relatedRestaurantId) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activityId,
      type,
      timestamp,
      description,
      relatedOrderId,
      relatedRestaurantId,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of UserActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserActivityImplCopyWith<_$UserActivityImpl> get copyWith =>
      __$$UserActivityImplCopyWithImpl<_$UserActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserActivityImplToJson(
      this,
    );
  }
}

abstract class _UserActivity implements UserActivity {
  const factory _UserActivity(
      {required final String activityId,
      required final UserActivityType type,
      required final DateTime timestamp,
      required final String description,
      final String? relatedOrderId,
      final String? relatedRestaurantId,
      final Map<String, dynamic>? metadata}) = _$UserActivityImpl;

  factory _UserActivity.fromJson(Map<String, dynamic> json) =
      _$UserActivityImpl.fromJson;

  @override
  String get activityId;
  @override
  UserActivityType get type;
  @override
  DateTime get timestamp;
  @override
  String get description;
  @override
  String? get relatedOrderId;
  @override
  String? get relatedRestaurantId;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of UserActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserActivityImplCopyWith<_$UserActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RestaurantDocument _$RestaurantDocumentFromJson(Map<String, dynamic> json) {
  return _RestaurantDocument.fromJson(json);
}

/// @nodoc
mixin _$RestaurantDocument {
  String get documentId => throw _privateConstructorUsedError;
  DocumentType get type => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  String get fileUrl => throw _privateConstructorUsedError;
  DocumentStatus get status => throw _privateConstructorUsedError;
  DateTime get uploadedAt => throw _privateConstructorUsedError;
  DateTime? get verifiedAt => throw _privateConstructorUsedError;
  String? get rejectionReason => throw _privateConstructorUsedError;

  /// Serializes this RestaurantDocument to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantDocumentCopyWith<RestaurantDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantDocumentCopyWith<$Res> {
  factory $RestaurantDocumentCopyWith(
          RestaurantDocument value, $Res Function(RestaurantDocument) then) =
      _$RestaurantDocumentCopyWithImpl<$Res, RestaurantDocument>;
  @useResult
  $Res call(
      {String documentId,
      DocumentType type,
      String fileName,
      String fileUrl,
      DocumentStatus status,
      DateTime uploadedAt,
      DateTime? verifiedAt,
      String? rejectionReason});
}

/// @nodoc
class _$RestaurantDocumentCopyWithImpl<$Res, $Val extends RestaurantDocument>
    implements $RestaurantDocumentCopyWith<$Res> {
  _$RestaurantDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentId = null,
    Object? type = null,
    Object? fileName = null,
    Object? fileUrl = null,
    Object? status = null,
    Object? uploadedAt = null,
    Object? verifiedAt = freezed,
    Object? rejectionReason = freezed,
  }) {
    return _then(_value.copyWith(
      documentId: null == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DocumentStatus,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      verifiedAt: freezed == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantDocumentImplCopyWith<$Res>
    implements $RestaurantDocumentCopyWith<$Res> {
  factory _$$RestaurantDocumentImplCopyWith(_$RestaurantDocumentImpl value,
          $Res Function(_$RestaurantDocumentImpl) then) =
      __$$RestaurantDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String documentId,
      DocumentType type,
      String fileName,
      String fileUrl,
      DocumentStatus status,
      DateTime uploadedAt,
      DateTime? verifiedAt,
      String? rejectionReason});
}

/// @nodoc
class __$$RestaurantDocumentImplCopyWithImpl<$Res>
    extends _$RestaurantDocumentCopyWithImpl<$Res, _$RestaurantDocumentImpl>
    implements _$$RestaurantDocumentImplCopyWith<$Res> {
  __$$RestaurantDocumentImplCopyWithImpl(_$RestaurantDocumentImpl _value,
      $Res Function(_$RestaurantDocumentImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestaurantDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentId = null,
    Object? type = null,
    Object? fileName = null,
    Object? fileUrl = null,
    Object? status = null,
    Object? uploadedAt = null,
    Object? verifiedAt = freezed,
    Object? rejectionReason = freezed,
  }) {
    return _then(_$RestaurantDocumentImpl(
      documentId: null == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DocumentStatus,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      verifiedAt: freezed == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantDocumentImpl implements _RestaurantDocument {
  const _$RestaurantDocumentImpl(
      {required this.documentId,
      required this.type,
      required this.fileName,
      required this.fileUrl,
      required this.status,
      required this.uploadedAt,
      this.verifiedAt,
      this.rejectionReason});

  factory _$RestaurantDocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantDocumentImplFromJson(json);

  @override
  final String documentId;
  @override
  final DocumentType type;
  @override
  final String fileName;
  @override
  final String fileUrl;
  @override
  final DocumentStatus status;
  @override
  final DateTime uploadedAt;
  @override
  final DateTime? verifiedAt;
  @override
  final String? rejectionReason;

  @override
  String toString() {
    return 'RestaurantDocument(documentId: $documentId, type: $type, fileName: $fileName, fileUrl: $fileUrl, status: $status, uploadedAt: $uploadedAt, verifiedAt: $verifiedAt, rejectionReason: $rejectionReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantDocumentImpl &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.rejectionReason, rejectionReason) ||
                other.rejectionReason == rejectionReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, documentId, type, fileName,
      fileUrl, status, uploadedAt, verifiedAt, rejectionReason);

  /// Create a copy of RestaurantDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantDocumentImplCopyWith<_$RestaurantDocumentImpl> get copyWith =>
      __$$RestaurantDocumentImplCopyWithImpl<_$RestaurantDocumentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantDocumentImplToJson(
      this,
    );
  }
}

abstract class _RestaurantDocument implements RestaurantDocument {
  const factory _RestaurantDocument(
      {required final String documentId,
      required final DocumentType type,
      required final String fileName,
      required final String fileUrl,
      required final DocumentStatus status,
      required final DateTime uploadedAt,
      final DateTime? verifiedAt,
      final String? rejectionReason}) = _$RestaurantDocumentImpl;

  factory _RestaurantDocument.fromJson(Map<String, dynamic> json) =
      _$RestaurantDocumentImpl.fromJson;

  @override
  String get documentId;
  @override
  DocumentType get type;
  @override
  String get fileName;
  @override
  String get fileUrl;
  @override
  DocumentStatus get status;
  @override
  DateTime get uploadedAt;
  @override
  DateTime? get verifiedAt;
  @override
  String? get rejectionReason;

  /// Create a copy of RestaurantDocument
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantDocumentImplCopyWith<_$RestaurantDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DriverDocument _$DriverDocumentFromJson(Map<String, dynamic> json) {
  return _DriverDocument.fromJson(json);
}

/// @nodoc
mixin _$DriverDocument {
  String get documentId => throw _privateConstructorUsedError;
  DocumentType get type => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  String get fileUrl => throw _privateConstructorUsedError;
  DocumentStatus get status => throw _privateConstructorUsedError;
  DateTime get uploadedAt => throw _privateConstructorUsedError;
  DateTime? get verifiedAt => throw _privateConstructorUsedError;
  String? get rejectionReason => throw _privateConstructorUsedError;

  /// Serializes this DriverDocument to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriverDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverDocumentCopyWith<DriverDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverDocumentCopyWith<$Res> {
  factory $DriverDocumentCopyWith(
          DriverDocument value, $Res Function(DriverDocument) then) =
      _$DriverDocumentCopyWithImpl<$Res, DriverDocument>;
  @useResult
  $Res call(
      {String documentId,
      DocumentType type,
      String fileName,
      String fileUrl,
      DocumentStatus status,
      DateTime uploadedAt,
      DateTime? verifiedAt,
      String? rejectionReason});
}

/// @nodoc
class _$DriverDocumentCopyWithImpl<$Res, $Val extends DriverDocument>
    implements $DriverDocumentCopyWith<$Res> {
  _$DriverDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriverDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentId = null,
    Object? type = null,
    Object? fileName = null,
    Object? fileUrl = null,
    Object? status = null,
    Object? uploadedAt = null,
    Object? verifiedAt = freezed,
    Object? rejectionReason = freezed,
  }) {
    return _then(_value.copyWith(
      documentId: null == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DocumentStatus,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      verifiedAt: freezed == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriverDocumentImplCopyWith<$Res>
    implements $DriverDocumentCopyWith<$Res> {
  factory _$$DriverDocumentImplCopyWith(_$DriverDocumentImpl value,
          $Res Function(_$DriverDocumentImpl) then) =
      __$$DriverDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String documentId,
      DocumentType type,
      String fileName,
      String fileUrl,
      DocumentStatus status,
      DateTime uploadedAt,
      DateTime? verifiedAt,
      String? rejectionReason});
}

/// @nodoc
class __$$DriverDocumentImplCopyWithImpl<$Res>
    extends _$DriverDocumentCopyWithImpl<$Res, _$DriverDocumentImpl>
    implements _$$DriverDocumentImplCopyWith<$Res> {
  __$$DriverDocumentImplCopyWithImpl(
      _$DriverDocumentImpl _value, $Res Function(_$DriverDocumentImpl) _then)
      : super(_value, _then);

  /// Create a copy of DriverDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentId = null,
    Object? type = null,
    Object? fileName = null,
    Object? fileUrl = null,
    Object? status = null,
    Object? uploadedAt = null,
    Object? verifiedAt = freezed,
    Object? rejectionReason = freezed,
  }) {
    return _then(_$DriverDocumentImpl(
      documentId: null == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DocumentStatus,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      verifiedAt: freezed == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverDocumentImpl implements _DriverDocument {
  const _$DriverDocumentImpl(
      {required this.documentId,
      required this.type,
      required this.fileName,
      required this.fileUrl,
      required this.status,
      required this.uploadedAt,
      this.verifiedAt,
      this.rejectionReason});

  factory _$DriverDocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverDocumentImplFromJson(json);

  @override
  final String documentId;
  @override
  final DocumentType type;
  @override
  final String fileName;
  @override
  final String fileUrl;
  @override
  final DocumentStatus status;
  @override
  final DateTime uploadedAt;
  @override
  final DateTime? verifiedAt;
  @override
  final String? rejectionReason;

  @override
  String toString() {
    return 'DriverDocument(documentId: $documentId, type: $type, fileName: $fileName, fileUrl: $fileUrl, status: $status, uploadedAt: $uploadedAt, verifiedAt: $verifiedAt, rejectionReason: $rejectionReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverDocumentImpl &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.rejectionReason, rejectionReason) ||
                other.rejectionReason == rejectionReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, documentId, type, fileName,
      fileUrl, status, uploadedAt, verifiedAt, rejectionReason);

  /// Create a copy of DriverDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverDocumentImplCopyWith<_$DriverDocumentImpl> get copyWith =>
      __$$DriverDocumentImplCopyWithImpl<_$DriverDocumentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverDocumentImplToJson(
      this,
    );
  }
}

abstract class _DriverDocument implements DriverDocument {
  const factory _DriverDocument(
      {required final String documentId,
      required final DocumentType type,
      required final String fileName,
      required final String fileUrl,
      required final DocumentStatus status,
      required final DateTime uploadedAt,
      final DateTime? verifiedAt,
      final String? rejectionReason}) = _$DriverDocumentImpl;

  factory _DriverDocument.fromJson(Map<String, dynamic> json) =
      _$DriverDocumentImpl.fromJson;

  @override
  String get documentId;
  @override
  DocumentType get type;
  @override
  String get fileName;
  @override
  String get fileUrl;
  @override
  DocumentStatus get status;
  @override
  DateTime get uploadedAt;
  @override
  DateTime? get verifiedAt;
  @override
  String? get rejectionReason;

  /// Create a copy of DriverDocument
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverDocumentImplCopyWith<_$DriverDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
