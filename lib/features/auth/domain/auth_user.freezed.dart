// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthUser _$AuthUserFromJson(Map<String, dynamic> json) {
  return _AuthUser.fromJson(json);
}

/// @nodoc
mixin _$AuthUser {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;
  bool get isEmailVerified => throw _privateConstructorUsedError;
  bool get isPhoneVerified => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  int get loyaltyPoints => throw _privateConstructorUsedError;
  String get loyaltyLevel => throw _privateConstructorUsedError;
  DateTime? get lastLoginAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this AuthUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthUserCopyWith<AuthUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthUserCopyWith<$Res> {
  factory $AuthUserCopyWith(AuthUser value, $Res Function(AuthUser) then) =
      _$AuthUserCopyWithImpl<$Res, AuthUser>;
  @useResult
  $Res call(
      {String id,
      String email,
      String firstName,
      String lastName,
      String phone,
      String? profileImage,
      bool isEmailVerified,
      bool isPhoneVerified,
      String role,
      int loyaltyPoints,
      String loyaltyLevel,
      DateTime? lastLoginAt,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$AuthUserCopyWithImpl<$Res, $Val extends AuthUser>
    implements $AuthUserCopyWith<$Res> {
  _$AuthUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? profileImage = freezed,
    Object? isEmailVerified = null,
    Object? isPhoneVerified = null,
    Object? role = null,
    Object? loyaltyPoints = null,
    Object? loyaltyLevel = null,
    Object? lastLoginAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhoneVerified: null == isPhoneVerified
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      loyaltyPoints: null == loyaltyPoints
          ? _value.loyaltyPoints
          : loyaltyPoints // ignore: cast_nullable_to_non_nullable
              as int,
      loyaltyLevel: null == loyaltyLevel
          ? _value.loyaltyLevel
          : loyaltyLevel // ignore: cast_nullable_to_non_nullable
              as String,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthUserImplCopyWith<$Res>
    implements $AuthUserCopyWith<$Res> {
  factory _$$AuthUserImplCopyWith(
          _$AuthUserImpl value, $Res Function(_$AuthUserImpl) then) =
      __$$AuthUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String firstName,
      String lastName,
      String phone,
      String? profileImage,
      bool isEmailVerified,
      bool isPhoneVerified,
      String role,
      int loyaltyPoints,
      String loyaltyLevel,
      DateTime? lastLoginAt,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$AuthUserImplCopyWithImpl<$Res>
    extends _$AuthUserCopyWithImpl<$Res, _$AuthUserImpl>
    implements _$$AuthUserImplCopyWith<$Res> {
  __$$AuthUserImplCopyWithImpl(
      _$AuthUserImpl _value, $Res Function(_$AuthUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? profileImage = freezed,
    Object? isEmailVerified = null,
    Object? isPhoneVerified = null,
    Object? role = null,
    Object? loyaltyPoints = null,
    Object? loyaltyLevel = null,
    Object? lastLoginAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$AuthUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhoneVerified: null == isPhoneVerified
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      loyaltyPoints: null == loyaltyPoints
          ? _value.loyaltyPoints
          : loyaltyPoints // ignore: cast_nullable_to_non_nullable
              as int,
      loyaltyLevel: null == loyaltyLevel
          ? _value.loyaltyLevel
          : loyaltyLevel // ignore: cast_nullable_to_non_nullable
              as String,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthUserImpl extends _AuthUser {
  const _$AuthUserImpl(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.phone,
      this.profileImage,
      this.isEmailVerified = false,
      this.isPhoneVerified = false,
      this.role = 'client',
      this.loyaltyPoints = 0,
      this.loyaltyLevel = 'Bronze',
      this.lastLoginAt,
      required this.createdAt,
      required this.updatedAt})
      : super._();

  factory _$AuthUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthUserImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String phone;
  @override
  final String? profileImage;
  @override
  @JsonKey()
  final bool isEmailVerified;
  @override
  @JsonKey()
  final bool isPhoneVerified;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey()
  final int loyaltyPoints;
  @override
  @JsonKey()
  final String loyaltyLevel;
  @override
  final DateTime? lastLoginAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'AuthUser(id: $id, email: $email, firstName: $firstName, lastName: $lastName, phone: $phone, profileImage: $profileImage, isEmailVerified: $isEmailVerified, isPhoneVerified: $isPhoneVerified, role: $role, loyaltyPoints: $loyaltyPoints, loyaltyLevel: $loyaltyLevel, lastLoginAt: $lastLoginAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(other.isPhoneVerified, isPhoneVerified) ||
                other.isPhoneVerified == isPhoneVerified) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.loyaltyPoints, loyaltyPoints) ||
                other.loyaltyPoints == loyaltyPoints) &&
            (identical(other.loyaltyLevel, loyaltyLevel) ||
                other.loyaltyLevel == loyaltyLevel) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      firstName,
      lastName,
      phone,
      profileImage,
      isEmailVerified,
      isPhoneVerified,
      role,
      loyaltyPoints,
      loyaltyLevel,
      lastLoginAt,
      createdAt,
      updatedAt);

  /// Create a copy of AuthUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthUserImplCopyWith<_$AuthUserImpl> get copyWith =>
      __$$AuthUserImplCopyWithImpl<_$AuthUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthUserImplToJson(
      this,
    );
  }
}

abstract class _AuthUser extends AuthUser {
  const factory _AuthUser(
      {required final String id,
      required final String email,
      required final String firstName,
      required final String lastName,
      required final String phone,
      final String? profileImage,
      final bool isEmailVerified,
      final bool isPhoneVerified,
      final String role,
      final int loyaltyPoints,
      final String loyaltyLevel,
      final DateTime? lastLoginAt,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$AuthUserImpl;
  const _AuthUser._() : super._();

  factory _AuthUser.fromJson(Map<String, dynamic> json) =
      _$AuthUserImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get phone;
  @override
  String? get profileImage;
  @override
  bool get isEmailVerified;
  @override
  bool get isPhoneVerified;
  @override
  String get role;
  @override
  int get loyaltyPoints;
  @override
  String get loyaltyLevel;
  @override
  DateTime? get lastLoginAt;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of AuthUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthUserImplCopyWith<_$AuthUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return _LoginRequest.fromJson(json);
}

/// @nodoc
mixin _$LoginRequest {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get rememberMe => throw _privateConstructorUsedError;
  String? get deviceToken => throw _privateConstructorUsedError;

  /// Serializes this LoginRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginRequestCopyWith<LoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestCopyWith<$Res> {
  factory $LoginRequestCopyWith(
          LoginRequest value, $Res Function(LoginRequest) then) =
      _$LoginRequestCopyWithImpl<$Res, LoginRequest>;
  @useResult
  $Res call(
      {String email, String password, bool rememberMe, String? deviceToken});
}

/// @nodoc
class _$LoginRequestCopyWithImpl<$Res, $Val extends LoginRequest>
    implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? rememberMe = null,
    Object? deviceToken = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      rememberMe: null == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceToken: freezed == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginRequestImplCopyWith<$Res>
    implements $LoginRequestCopyWith<$Res> {
  factory _$$LoginRequestImplCopyWith(
          _$LoginRequestImpl value, $Res Function(_$LoginRequestImpl) then) =
      __$$LoginRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email, String password, bool rememberMe, String? deviceToken});
}

/// @nodoc
class __$$LoginRequestImplCopyWithImpl<$Res>
    extends _$LoginRequestCopyWithImpl<$Res, _$LoginRequestImpl>
    implements _$$LoginRequestImplCopyWith<$Res> {
  __$$LoginRequestImplCopyWithImpl(
      _$LoginRequestImpl _value, $Res Function(_$LoginRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? rememberMe = null,
    Object? deviceToken = freezed,
  }) {
    return _then(_$LoginRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      rememberMe: null == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceToken: freezed == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginRequestImpl implements _LoginRequest {
  const _$LoginRequestImpl(
      {required this.email,
      required this.password,
      this.rememberMe = false,
      this.deviceToken});

  factory _$LoginRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  @JsonKey()
  final bool rememberMe;
  @override
  final String? deviceToken;

  @override
  String toString() {
    return 'LoginRequest(email: $email, password: $password, rememberMe: $rememberMe, deviceToken: $deviceToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.rememberMe, rememberMe) ||
                other.rememberMe == rememberMe) &&
            (identical(other.deviceToken, deviceToken) ||
                other.deviceToken == deviceToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, rememberMe, deviceToken);

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      __$$LoginRequestImplCopyWithImpl<_$LoginRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginRequestImplToJson(
      this,
    );
  }
}

abstract class _LoginRequest implements LoginRequest {
  const factory _LoginRequest(
      {required final String email,
      required final String password,
      final bool rememberMe,
      final String? deviceToken}) = _$LoginRequestImpl;

  factory _LoginRequest.fromJson(Map<String, dynamic> json) =
      _$LoginRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  bool get rememberMe;
  @override
  String? get deviceToken;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) {
  return _RegisterRequest.fromJson(json);
}

/// @nodoc
mixin _$RegisterRequest {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  bool get acceptTerms => throw _privateConstructorUsedError;
  String? get deviceToken => throw _privateConstructorUsedError;

  /// Serializes this RegisterRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterRequestCopyWith<RegisterRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterRequestCopyWith<$Res> {
  factory $RegisterRequestCopyWith(
          RegisterRequest value, $Res Function(RegisterRequest) then) =
      _$RegisterRequestCopyWithImpl<$Res, RegisterRequest>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String phone,
      String password,
      String confirmPassword,
      bool acceptTerms,
      String? deviceToken});
}

/// @nodoc
class _$RegisterRequestCopyWithImpl<$Res, $Val extends RegisterRequest>
    implements $RegisterRequestCopyWith<$Res> {
  _$RegisterRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phone = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? acceptTerms = null,
    Object? deviceToken = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      acceptTerms: null == acceptTerms
          ? _value.acceptTerms
          : acceptTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceToken: freezed == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterRequestImplCopyWith<$Res>
    implements $RegisterRequestCopyWith<$Res> {
  factory _$$RegisterRequestImplCopyWith(_$RegisterRequestImpl value,
          $Res Function(_$RegisterRequestImpl) then) =
      __$$RegisterRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String phone,
      String password,
      String confirmPassword,
      bool acceptTerms,
      String? deviceToken});
}

/// @nodoc
class __$$RegisterRequestImplCopyWithImpl<$Res>
    extends _$RegisterRequestCopyWithImpl<$Res, _$RegisterRequestImpl>
    implements _$$RegisterRequestImplCopyWith<$Res> {
  __$$RegisterRequestImplCopyWithImpl(
      _$RegisterRequestImpl _value, $Res Function(_$RegisterRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phone = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? acceptTerms = null,
    Object? deviceToken = freezed,
  }) {
    return _then(_$RegisterRequestImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      acceptTerms: null == acceptTerms
          ? _value.acceptTerms
          : acceptTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceToken: freezed == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterRequestImpl implements _RegisterRequest {
  const _$RegisterRequestImpl(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.password,
      required this.confirmPassword,
      this.acceptTerms = true,
      this.deviceToken});

  factory _$RegisterRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterRequestImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String password;
  @override
  final String confirmPassword;
  @override
  @JsonKey()
  final bool acceptTerms;
  @override
  final String? deviceToken;

  @override
  String toString() {
    return 'RegisterRequest(firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, password: $password, confirmPassword: $confirmPassword, acceptTerms: $acceptTerms, deviceToken: $deviceToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterRequestImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.acceptTerms, acceptTerms) ||
                other.acceptTerms == acceptTerms) &&
            (identical(other.deviceToken, deviceToken) ||
                other.deviceToken == deviceToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, email,
      phone, password, confirmPassword, acceptTerms, deviceToken);

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterRequestImplCopyWith<_$RegisterRequestImpl> get copyWith =>
      __$$RegisterRequestImplCopyWithImpl<_$RegisterRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterRequestImplToJson(
      this,
    );
  }
}

abstract class _RegisterRequest implements RegisterRequest {
  const factory _RegisterRequest(
      {required final String firstName,
      required final String lastName,
      required final String email,
      required final String phone,
      required final String password,
      required final String confirmPassword,
      final bool acceptTerms,
      final String? deviceToken}) = _$RegisterRequestImpl;

  factory _RegisterRequest.fromJson(Map<String, dynamic> json) =
      _$RegisterRequestImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  bool get acceptTerms;
  @override
  String? get deviceToken;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterRequestImplCopyWith<_$RegisterRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PasswordResetRequest _$PasswordResetRequestFromJson(Map<String, dynamic> json) {
  return _PasswordResetRequest.fromJson(json);
}

/// @nodoc
mixin _$PasswordResetRequest {
  String get email => throw _privateConstructorUsedError;

  /// Serializes this PasswordResetRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PasswordResetRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasswordResetRequestCopyWith<PasswordResetRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordResetRequestCopyWith<$Res> {
  factory $PasswordResetRequestCopyWith(PasswordResetRequest value,
          $Res Function(PasswordResetRequest) then) =
      _$PasswordResetRequestCopyWithImpl<$Res, PasswordResetRequest>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$PasswordResetRequestCopyWithImpl<$Res,
        $Val extends PasswordResetRequest>
    implements $PasswordResetRequestCopyWith<$Res> {
  _$PasswordResetRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasswordResetRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PasswordResetRequestImplCopyWith<$Res>
    implements $PasswordResetRequestCopyWith<$Res> {
  factory _$$PasswordResetRequestImplCopyWith(_$PasswordResetRequestImpl value,
          $Res Function(_$PasswordResetRequestImpl) then) =
      __$$PasswordResetRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$PasswordResetRequestImplCopyWithImpl<$Res>
    extends _$PasswordResetRequestCopyWithImpl<$Res, _$PasswordResetRequestImpl>
    implements _$$PasswordResetRequestImplCopyWith<$Res> {
  __$$PasswordResetRequestImplCopyWithImpl(_$PasswordResetRequestImpl _value,
      $Res Function(_$PasswordResetRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PasswordResetRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$PasswordResetRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PasswordResetRequestImpl implements _PasswordResetRequest {
  const _$PasswordResetRequestImpl({required this.email});

  factory _$PasswordResetRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasswordResetRequestImplFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'PasswordResetRequest(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordResetRequestImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of PasswordResetRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordResetRequestImplCopyWith<_$PasswordResetRequestImpl>
      get copyWith =>
          __$$PasswordResetRequestImplCopyWithImpl<_$PasswordResetRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PasswordResetRequestImplToJson(
      this,
    );
  }
}

abstract class _PasswordResetRequest implements PasswordResetRequest {
  const factory _PasswordResetRequest({required final String email}) =
      _$PasswordResetRequestImpl;

  factory _PasswordResetRequest.fromJson(Map<String, dynamic> json) =
      _$PasswordResetRequestImpl.fromJson;

  @override
  String get email;

  /// Create a copy of PasswordResetRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordResetRequestImplCopyWith<_$PasswordResetRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OtpVerificationRequest _$OtpVerificationRequestFromJson(
    Map<String, dynamic> json) {
  return _OtpVerificationRequest.fromJson(json);
}

/// @nodoc
mixin _$OtpVerificationRequest {
  String get phone => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Serializes this OtpVerificationRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OtpVerificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtpVerificationRequestCopyWith<OtpVerificationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpVerificationRequestCopyWith<$Res> {
  factory $OtpVerificationRequestCopyWith(OtpVerificationRequest value,
          $Res Function(OtpVerificationRequest) then) =
      _$OtpVerificationRequestCopyWithImpl<$Res, OtpVerificationRequest>;
  @useResult
  $Res call({String phone, String otp, String type});
}

/// @nodoc
class _$OtpVerificationRequestCopyWithImpl<$Res,
        $Val extends OtpVerificationRequest>
    implements $OtpVerificationRequestCopyWith<$Res> {
  _$OtpVerificationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpVerificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? otp = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtpVerificationRequestImplCopyWith<$Res>
    implements $OtpVerificationRequestCopyWith<$Res> {
  factory _$$OtpVerificationRequestImplCopyWith(
          _$OtpVerificationRequestImpl value,
          $Res Function(_$OtpVerificationRequestImpl) then) =
      __$$OtpVerificationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phone, String otp, String type});
}

/// @nodoc
class __$$OtpVerificationRequestImplCopyWithImpl<$Res>
    extends _$OtpVerificationRequestCopyWithImpl<$Res,
        _$OtpVerificationRequestImpl>
    implements _$$OtpVerificationRequestImplCopyWith<$Res> {
  __$$OtpVerificationRequestImplCopyWithImpl(
      _$OtpVerificationRequestImpl _value,
      $Res Function(_$OtpVerificationRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpVerificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? otp = null,
    Object? type = null,
  }) {
    return _then(_$OtpVerificationRequestImpl(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OtpVerificationRequestImpl implements _OtpVerificationRequest {
  const _$OtpVerificationRequestImpl(
      {required this.phone, required this.otp, required this.type});

  factory _$OtpVerificationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtpVerificationRequestImplFromJson(json);

  @override
  final String phone;
  @override
  final String otp;
  @override
  final String type;

  @override
  String toString() {
    return 'OtpVerificationRequest(phone: $phone, otp: $otp, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpVerificationRequestImpl &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phone, otp, type);

  /// Create a copy of OtpVerificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpVerificationRequestImplCopyWith<_$OtpVerificationRequestImpl>
      get copyWith => __$$OtpVerificationRequestImplCopyWithImpl<
          _$OtpVerificationRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtpVerificationRequestImplToJson(
      this,
    );
  }
}

abstract class _OtpVerificationRequest implements OtpVerificationRequest {
  const factory _OtpVerificationRequest(
      {required final String phone,
      required final String otp,
      required final String type}) = _$OtpVerificationRequestImpl;

  factory _OtpVerificationRequest.fromJson(Map<String, dynamic> json) =
      _$OtpVerificationRequestImpl.fromJson;

  @override
  String get phone;
  @override
  String get otp;
  @override
  String get type;

  /// Create a copy of OtpVerificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpVerificationRequestImplCopyWith<_$OtpVerificationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChangePasswordRequest _$ChangePasswordRequestFromJson(
    Map<String, dynamic> json) {
  return _ChangePasswordRequest.fromJson(json);
}

/// @nodoc
mixin _$ChangePasswordRequest {
  String get currentPassword => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;

  /// Serializes this ChangePasswordRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChangePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChangePasswordRequestCopyWith<ChangePasswordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordRequestCopyWith<$Res> {
  factory $ChangePasswordRequestCopyWith(ChangePasswordRequest value,
          $Res Function(ChangePasswordRequest) then) =
      _$ChangePasswordRequestCopyWithImpl<$Res, ChangePasswordRequest>;
  @useResult
  $Res call(
      {String currentPassword, String newPassword, String confirmPassword});
}

/// @nodoc
class _$ChangePasswordRequestCopyWithImpl<$Res,
        $Val extends ChangePasswordRequest>
    implements $ChangePasswordRequestCopyWith<$Res> {
  _$ChangePasswordRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = null,
    Object? newPassword = null,
    Object? confirmPassword = null,
  }) {
    return _then(_value.copyWith(
      currentPassword: null == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePasswordRequestImplCopyWith<$Res>
    implements $ChangePasswordRequestCopyWith<$Res> {
  factory _$$ChangePasswordRequestImplCopyWith(
          _$ChangePasswordRequestImpl value,
          $Res Function(_$ChangePasswordRequestImpl) then) =
      __$$ChangePasswordRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String currentPassword, String newPassword, String confirmPassword});
}

/// @nodoc
class __$$ChangePasswordRequestImplCopyWithImpl<$Res>
    extends _$ChangePasswordRequestCopyWithImpl<$Res,
        _$ChangePasswordRequestImpl>
    implements _$$ChangePasswordRequestImplCopyWith<$Res> {
  __$$ChangePasswordRequestImplCopyWithImpl(_$ChangePasswordRequestImpl _value,
      $Res Function(_$ChangePasswordRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChangePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = null,
    Object? newPassword = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$ChangePasswordRequestImpl(
      currentPassword: null == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangePasswordRequestImpl implements _ChangePasswordRequest {
  const _$ChangePasswordRequestImpl(
      {required this.currentPassword,
      required this.newPassword,
      required this.confirmPassword});

  factory _$ChangePasswordRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangePasswordRequestImplFromJson(json);

  @override
  final String currentPassword;
  @override
  final String newPassword;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'ChangePasswordRequest(currentPassword: $currentPassword, newPassword: $newPassword, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordRequestImpl &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPassword, newPassword, confirmPassword);

  /// Create a copy of ChangePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordRequestImplCopyWith<_$ChangePasswordRequestImpl>
      get copyWith => __$$ChangePasswordRequestImplCopyWithImpl<
          _$ChangePasswordRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangePasswordRequestImplToJson(
      this,
    );
  }
}

abstract class _ChangePasswordRequest implements ChangePasswordRequest {
  const factory _ChangePasswordRequest(
      {required final String currentPassword,
      required final String newPassword,
      required final String confirmPassword}) = _$ChangePasswordRequestImpl;

  factory _ChangePasswordRequest.fromJson(Map<String, dynamic> json) =
      _$ChangePasswordRequestImpl.fromJson;

  @override
  String get currentPassword;
  @override
  String get newPassword;
  @override
  String get confirmPassword;

  /// Create a copy of ChangePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePasswordRequestImplCopyWith<_$ChangePasswordRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) {
  return _AuthResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthResponse {
  AuthUser get user => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  int get expiresIn => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this AuthResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthResponseCopyWith<AuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseCopyWith<$Res> {
  factory $AuthResponseCopyWith(
          AuthResponse value, $Res Function(AuthResponse) then) =
      _$AuthResponseCopyWithImpl<$Res, AuthResponse>;
  @useResult
  $Res call(
      {AuthUser user,
      String accessToken,
      String refreshToken,
      int expiresIn,
      String? message});

  $AuthUserCopyWith<$Res> get user;
}

/// @nodoc
class _$AuthResponseCopyWithImpl<$Res, $Val extends AuthResponse>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthUser,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthUserCopyWith<$Res> get user {
    return $AuthUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthResponseImplCopyWith<$Res>
    implements $AuthResponseCopyWith<$Res> {
  factory _$$AuthResponseImplCopyWith(
          _$AuthResponseImpl value, $Res Function(_$AuthResponseImpl) then) =
      __$$AuthResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthUser user,
      String accessToken,
      String refreshToken,
      int expiresIn,
      String? message});

  @override
  $AuthUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthResponseImplCopyWithImpl<$Res>
    extends _$AuthResponseCopyWithImpl<$Res, _$AuthResponseImpl>
    implements _$$AuthResponseImplCopyWith<$Res> {
  __$$AuthResponseImplCopyWithImpl(
      _$AuthResponseImpl _value, $Res Function(_$AuthResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
    Object? message = freezed,
  }) {
    return _then(_$AuthResponseImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthUser,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthResponseImpl implements _AuthResponse {
  const _$AuthResponseImpl(
      {required this.user,
      required this.accessToken,
      required this.refreshToken,
      required this.expiresIn,
      this.message});

  factory _$AuthResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResponseImplFromJson(json);

  @override
  final AuthUser user;
  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final int expiresIn;
  @override
  final String? message;

  @override
  String toString() {
    return 'AuthResponse(user: $user, accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResponseImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, user, accessToken, refreshToken, expiresIn, message);

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResponseImplCopyWith<_$AuthResponseImpl> get copyWith =>
      __$$AuthResponseImplCopyWithImpl<_$AuthResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResponseImplToJson(
      this,
    );
  }
}

abstract class _AuthResponse implements AuthResponse {
  const factory _AuthResponse(
      {required final AuthUser user,
      required final String accessToken,
      required final String refreshToken,
      required final int expiresIn,
      final String? message}) = _$AuthResponseImpl;

  factory _AuthResponse.fromJson(Map<String, dynamic> json) =
      _$AuthResponseImpl.fromJson;

  @override
  AuthUser get user;
  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  int get expiresIn;
  @override
  String? get message;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthResponseImplCopyWith<_$AuthResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthError _$AuthErrorFromJson(Map<String, dynamic> json) {
  return _AuthError.fromJson(json);
}

/// @nodoc
mixin _$AuthError {
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get field => throw _privateConstructorUsedError;
  Map<String, dynamic>? get details => throw _privateConstructorUsedError;

  /// Serializes this AuthError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthErrorCopyWith<AuthError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthErrorCopyWith<$Res> {
  factory $AuthErrorCopyWith(AuthError value, $Res Function(AuthError) then) =
      _$AuthErrorCopyWithImpl<$Res, AuthError>;
  @useResult
  $Res call(
      {String code,
      String message,
      String? field,
      Map<String, dynamic>? details});
}

/// @nodoc
class _$AuthErrorCopyWithImpl<$Res, $Val extends AuthError>
    implements $AuthErrorCopyWith<$Res> {
  _$AuthErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? field = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      field: freezed == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthErrorImplCopyWith<$Res>
    implements $AuthErrorCopyWith<$Res> {
  factory _$$AuthErrorImplCopyWith(
          _$AuthErrorImpl value, $Res Function(_$AuthErrorImpl) then) =
      __$$AuthErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String message,
      String? field,
      Map<String, dynamic>? details});
}

/// @nodoc
class __$$AuthErrorImplCopyWithImpl<$Res>
    extends _$AuthErrorCopyWithImpl<$Res, _$AuthErrorImpl>
    implements _$$AuthErrorImplCopyWith<$Res> {
  __$$AuthErrorImplCopyWithImpl(
      _$AuthErrorImpl _value, $Res Function(_$AuthErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? field = freezed,
    Object? details = freezed,
  }) {
    return _then(_$AuthErrorImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      field: freezed == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthErrorImpl implements _AuthError {
  const _$AuthErrorImpl(
      {required this.code,
      required this.message,
      this.field,
      final Map<String, dynamic>? details})
      : _details = details;

  factory _$AuthErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthErrorImplFromJson(json);

  @override
  final String code;
  @override
  final String message;
  @override
  final String? field;
  final Map<String, dynamic>? _details;
  @override
  Map<String, dynamic>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AuthError(code: $code, message: $message, field: $field, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.field, field) || other.field == field) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, field,
      const DeepCollectionEquality().hash(_details));

  /// Create a copy of AuthError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      __$$AuthErrorImplCopyWithImpl<_$AuthErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthErrorImplToJson(
      this,
    );
  }
}

abstract class _AuthError implements AuthError {
  const factory _AuthError(
      {required final String code,
      required final String message,
      final String? field,
      final Map<String, dynamic>? details}) = _$AuthErrorImpl;

  factory _AuthError.fromJson(Map<String, dynamic> json) =
      _$AuthErrorImpl.fromJson;

  @override
  String get code;
  @override
  String get message;
  @override
  String? get field;
  @override
  Map<String, dynamic>? get details;

  /// Create a copy of AuthError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthApiState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message, String? code) error,
    required TResult Function() loggingIn,
    required TResult Function() registering,
    required TResult Function() resettingPassword,
    required TResult Function() verifyingOtp,
    required TResult Function() changingPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? loggingIn,
    TResult? Function()? registering,
    TResult? Function()? resettingPassword,
    TResult? Function()? verifyingOtp,
    TResult? Function()? changingPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthUser user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message, String? code)? error,
    TResult Function()? loggingIn,
    TResult Function()? registering,
    TResult Function()? resettingPassword,
    TResult Function()? verifyingOtp,
    TResult Function()? changingPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthLoggingIn value) loggingIn,
    required TResult Function(AuthRegistering value) registering,
    required TResult Function(AuthResettingPassword value) resettingPassword,
    required TResult Function(AuthVerifyingOtp value) verifyingOtp,
    required TResult Function(AuthChangingPassword value) changingPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthErrorState value)? error,
    TResult? Function(AuthLoggingIn value)? loggingIn,
    TResult? Function(AuthRegistering value)? registering,
    TResult? Function(AuthResettingPassword value)? resettingPassword,
    TResult? Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult? Function(AuthChangingPassword value)? changingPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthLoggingIn value)? loggingIn,
    TResult Function(AuthRegistering value)? registering,
    TResult Function(AuthResettingPassword value)? resettingPassword,
    TResult Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult Function(AuthChangingPassword value)? changingPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthApiStateCopyWith<$Res> {
  factory $AuthApiStateCopyWith(
          AuthApiState value, $Res Function(AuthApiState) then) =
      _$AuthApiStateCopyWithImpl<$Res, AuthApiState>;
}

/// @nodoc
class _$AuthApiStateCopyWithImpl<$Res, $Val extends AuthApiState>
    implements $AuthApiStateCopyWith<$Res> {
  _$AuthApiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthApiState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthInitialImplCopyWith<$Res> {
  factory _$$AuthInitialImplCopyWith(
          _$AuthInitialImpl value, $Res Function(_$AuthInitialImpl) then) =
      __$$AuthInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthInitialImplCopyWithImpl<$Res>
    extends _$AuthApiStateCopyWithImpl<$Res, _$AuthInitialImpl>
    implements _$$AuthInitialImplCopyWith<$Res> {
  __$$AuthInitialImplCopyWithImpl(
      _$AuthInitialImpl _value, $Res Function(_$AuthInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthApiState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthInitialImpl implements AuthInitial {
  const _$AuthInitialImpl();

  @override
  String toString() {
    return 'AuthApiState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message, String? code) error,
    required TResult Function() loggingIn,
    required TResult Function() registering,
    required TResult Function() resettingPassword,
    required TResult Function() verifyingOtp,
    required TResult Function() changingPassword,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? loggingIn,
    TResult? Function()? registering,
    TResult? Function()? resettingPassword,
    TResult? Function()? verifyingOtp,
    TResult? Function()? changingPassword,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthUser user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message, String? code)? error,
    TResult Function()? loggingIn,
    TResult Function()? registering,
    TResult Function()? resettingPassword,
    TResult Function()? verifyingOtp,
    TResult Function()? changingPassword,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthLoggingIn value) loggingIn,
    required TResult Function(AuthRegistering value) registering,
    required TResult Function(AuthResettingPassword value) resettingPassword,
    required TResult Function(AuthVerifyingOtp value) verifyingOtp,
    required TResult Function(AuthChangingPassword value) changingPassword,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthErrorState value)? error,
    TResult? Function(AuthLoggingIn value)? loggingIn,
    TResult? Function(AuthRegistering value)? registering,
    TResult? Function(AuthResettingPassword value)? resettingPassword,
    TResult? Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult? Function(AuthChangingPassword value)? changingPassword,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthLoggingIn value)? loggingIn,
    TResult Function(AuthRegistering value)? registering,
    TResult Function(AuthResettingPassword value)? resettingPassword,
    TResult Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult Function(AuthChangingPassword value)? changingPassword,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthInitial implements AuthApiState {
  const factory AuthInitial() = _$AuthInitialImpl;
}

/// @nodoc
abstract class _$$AuthLoadingImplCopyWith<$Res> {
  factory _$$AuthLoadingImplCopyWith(
          _$AuthLoadingImpl value, $Res Function(_$AuthLoadingImpl) then) =
      __$$AuthLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoadingImplCopyWithImpl<$Res>
    extends _$AuthApiStateCopyWithImpl<$Res, _$AuthLoadingImpl>
    implements _$$AuthLoadingImplCopyWith<$Res> {
  __$$AuthLoadingImplCopyWithImpl(
      _$AuthLoadingImpl _value, $Res Function(_$AuthLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthApiState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthLoadingImpl implements AuthLoading {
  const _$AuthLoadingImpl();

  @override
  String toString() {
    return 'AuthApiState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message, String? code) error,
    required TResult Function() loggingIn,
    required TResult Function() registering,
    required TResult Function() resettingPassword,
    required TResult Function() verifyingOtp,
    required TResult Function() changingPassword,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? loggingIn,
    TResult? Function()? registering,
    TResult? Function()? resettingPassword,
    TResult? Function()? verifyingOtp,
    TResult? Function()? changingPassword,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthUser user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message, String? code)? error,
    TResult Function()? loggingIn,
    TResult Function()? registering,
    TResult Function()? resettingPassword,
    TResult Function()? verifyingOtp,
    TResult Function()? changingPassword,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthLoggingIn value) loggingIn,
    required TResult Function(AuthRegistering value) registering,
    required TResult Function(AuthResettingPassword value) resettingPassword,
    required TResult Function(AuthVerifyingOtp value) verifyingOtp,
    required TResult Function(AuthChangingPassword value) changingPassword,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthErrorState value)? error,
    TResult? Function(AuthLoggingIn value)? loggingIn,
    TResult? Function(AuthRegistering value)? registering,
    TResult? Function(AuthResettingPassword value)? resettingPassword,
    TResult? Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult? Function(AuthChangingPassword value)? changingPassword,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthLoggingIn value)? loggingIn,
    TResult Function(AuthRegistering value)? registering,
    TResult Function(AuthResettingPassword value)? resettingPassword,
    TResult Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult Function(AuthChangingPassword value)? changingPassword,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoading implements AuthApiState {
  const factory AuthLoading() = _$AuthLoadingImpl;
}

/// @nodoc
abstract class _$$AuthAuthenticatedImplCopyWith<$Res> {
  factory _$$AuthAuthenticatedImplCopyWith(_$AuthAuthenticatedImpl value,
          $Res Function(_$AuthAuthenticatedImpl) then) =
      __$$AuthAuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthUser user});

  $AuthUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthAuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthApiStateCopyWithImpl<$Res, _$AuthAuthenticatedImpl>
    implements _$$AuthAuthenticatedImplCopyWith<$Res> {
  __$$AuthAuthenticatedImplCopyWithImpl(_$AuthAuthenticatedImpl _value,
      $Res Function(_$AuthAuthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthApiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthAuthenticatedImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthUser,
    ));
  }

  /// Create a copy of AuthApiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthUserCopyWith<$Res> get user {
    return $AuthUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthAuthenticatedImpl implements AuthAuthenticated {
  const _$AuthAuthenticatedImpl(this.user);

  @override
  final AuthUser user;

  @override
  String toString() {
    return 'AuthApiState.authenticated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthAuthenticatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthApiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthAuthenticatedImplCopyWith<_$AuthAuthenticatedImpl> get copyWith =>
      __$$AuthAuthenticatedImplCopyWithImpl<_$AuthAuthenticatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message, String? code) error,
    required TResult Function() loggingIn,
    required TResult Function() registering,
    required TResult Function() resettingPassword,
    required TResult Function() verifyingOtp,
    required TResult Function() changingPassword,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? loggingIn,
    TResult? Function()? registering,
    TResult? Function()? resettingPassword,
    TResult? Function()? verifyingOtp,
    TResult? Function()? changingPassword,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthUser user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message, String? code)? error,
    TResult Function()? loggingIn,
    TResult Function()? registering,
    TResult Function()? resettingPassword,
    TResult Function()? verifyingOtp,
    TResult Function()? changingPassword,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthLoggingIn value) loggingIn,
    required TResult Function(AuthRegistering value) registering,
    required TResult Function(AuthResettingPassword value) resettingPassword,
    required TResult Function(AuthVerifyingOtp value) verifyingOtp,
    required TResult Function(AuthChangingPassword value) changingPassword,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthErrorState value)? error,
    TResult? Function(AuthLoggingIn value)? loggingIn,
    TResult? Function(AuthRegistering value)? registering,
    TResult? Function(AuthResettingPassword value)? resettingPassword,
    TResult? Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult? Function(AuthChangingPassword value)? changingPassword,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthLoggingIn value)? loggingIn,
    TResult Function(AuthRegistering value)? registering,
    TResult Function(AuthResettingPassword value)? resettingPassword,
    TResult Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult Function(AuthChangingPassword value)? changingPassword,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AuthAuthenticated implements AuthApiState {
  const factory AuthAuthenticated(final AuthUser user) =
      _$AuthAuthenticatedImpl;

  AuthUser get user;

  /// Create a copy of AuthApiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthAuthenticatedImplCopyWith<_$AuthAuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthUnauthenticatedImplCopyWith<$Res> {
  factory _$$AuthUnauthenticatedImplCopyWith(_$AuthUnauthenticatedImpl value,
          $Res Function(_$AuthUnauthenticatedImpl) then) =
      __$$AuthUnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthUnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthApiStateCopyWithImpl<$Res, _$AuthUnauthenticatedImpl>
    implements _$$AuthUnauthenticatedImplCopyWith<$Res> {
  __$$AuthUnauthenticatedImplCopyWithImpl(_$AuthUnauthenticatedImpl _value,
      $Res Function(_$AuthUnauthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthApiState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthUnauthenticatedImpl implements AuthUnauthenticated {
  const _$AuthUnauthenticatedImpl();

  @override
  String toString() {
    return 'AuthApiState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message, String? code) error,
    required TResult Function() loggingIn,
    required TResult Function() registering,
    required TResult Function() resettingPassword,
    required TResult Function() verifyingOtp,
    required TResult Function() changingPassword,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? loggingIn,
    TResult? Function()? registering,
    TResult? Function()? resettingPassword,
    TResult? Function()? verifyingOtp,
    TResult? Function()? changingPassword,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthUser user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message, String? code)? error,
    TResult Function()? loggingIn,
    TResult Function()? registering,
    TResult Function()? resettingPassword,
    TResult Function()? verifyingOtp,
    TResult Function()? changingPassword,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthLoggingIn value) loggingIn,
    required TResult Function(AuthRegistering value) registering,
    required TResult Function(AuthResettingPassword value) resettingPassword,
    required TResult Function(AuthVerifyingOtp value) verifyingOtp,
    required TResult Function(AuthChangingPassword value) changingPassword,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthErrorState value)? error,
    TResult? Function(AuthLoggingIn value)? loggingIn,
    TResult? Function(AuthRegistering value)? registering,
    TResult? Function(AuthResettingPassword value)? resettingPassword,
    TResult? Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult? Function(AuthChangingPassword value)? changingPassword,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthLoggingIn value)? loggingIn,
    TResult Function(AuthRegistering value)? registering,
    TResult Function(AuthResettingPassword value)? resettingPassword,
    TResult Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult Function(AuthChangingPassword value)? changingPassword,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthUnauthenticated implements AuthApiState {
  const factory AuthUnauthenticated() = _$AuthUnauthenticatedImpl;
}

/// @nodoc
abstract class _$$AuthErrorStateImplCopyWith<$Res> {
  factory _$$AuthErrorStateImplCopyWith(_$AuthErrorStateImpl value,
          $Res Function(_$AuthErrorStateImpl) then) =
      __$$AuthErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$AuthErrorStateImplCopyWithImpl<$Res>
    extends _$AuthApiStateCopyWithImpl<$Res, _$AuthErrorStateImpl>
    implements _$$AuthErrorStateImplCopyWith<$Res> {
  __$$AuthErrorStateImplCopyWithImpl(
      _$AuthErrorStateImpl _value, $Res Function(_$AuthErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthApiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_$AuthErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthErrorStateImpl implements AuthErrorState {
  const _$AuthErrorStateImpl(this.message, {this.code});

  @override
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'AuthApiState.error(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorStateImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of AuthApiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorStateImplCopyWith<_$AuthErrorStateImpl> get copyWith =>
      __$$AuthErrorStateImplCopyWithImpl<_$AuthErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message, String? code) error,
    required TResult Function() loggingIn,
    required TResult Function() registering,
    required TResult Function() resettingPassword,
    required TResult Function() verifyingOtp,
    required TResult Function() changingPassword,
  }) {
    return error(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? loggingIn,
    TResult? Function()? registering,
    TResult? Function()? resettingPassword,
    TResult? Function()? verifyingOtp,
    TResult? Function()? changingPassword,
  }) {
    return error?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthUser user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message, String? code)? error,
    TResult Function()? loggingIn,
    TResult Function()? registering,
    TResult Function()? resettingPassword,
    TResult Function()? verifyingOtp,
    TResult Function()? changingPassword,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthLoggingIn value) loggingIn,
    required TResult Function(AuthRegistering value) registering,
    required TResult Function(AuthResettingPassword value) resettingPassword,
    required TResult Function(AuthVerifyingOtp value) verifyingOtp,
    required TResult Function(AuthChangingPassword value) changingPassword,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthErrorState value)? error,
    TResult? Function(AuthLoggingIn value)? loggingIn,
    TResult? Function(AuthRegistering value)? registering,
    TResult? Function(AuthResettingPassword value)? resettingPassword,
    TResult? Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult? Function(AuthChangingPassword value)? changingPassword,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthLoggingIn value)? loggingIn,
    TResult Function(AuthRegistering value)? registering,
    TResult Function(AuthResettingPassword value)? resettingPassword,
    TResult Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult Function(AuthChangingPassword value)? changingPassword,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthErrorState implements AuthApiState {
  const factory AuthErrorState(final String message, {final String? code}) =
      _$AuthErrorStateImpl;

  String get message;
  String? get code;

  /// Create a copy of AuthApiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthErrorStateImplCopyWith<_$AuthErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthLoggingInImplCopyWith<$Res> {
  factory _$$AuthLoggingInImplCopyWith(
          _$AuthLoggingInImpl value, $Res Function(_$AuthLoggingInImpl) then) =
      __$$AuthLoggingInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoggingInImplCopyWithImpl<$Res>
    extends _$AuthApiStateCopyWithImpl<$Res, _$AuthLoggingInImpl>
    implements _$$AuthLoggingInImplCopyWith<$Res> {
  __$$AuthLoggingInImplCopyWithImpl(
      _$AuthLoggingInImpl _value, $Res Function(_$AuthLoggingInImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthApiState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthLoggingInImpl implements AuthLoggingIn {
  const _$AuthLoggingInImpl();

  @override
  String toString() {
    return 'AuthApiState.loggingIn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoggingInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message, String? code) error,
    required TResult Function() loggingIn,
    required TResult Function() registering,
    required TResult Function() resettingPassword,
    required TResult Function() verifyingOtp,
    required TResult Function() changingPassword,
  }) {
    return loggingIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? loggingIn,
    TResult? Function()? registering,
    TResult? Function()? resettingPassword,
    TResult? Function()? verifyingOtp,
    TResult? Function()? changingPassword,
  }) {
    return loggingIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthUser user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message, String? code)? error,
    TResult Function()? loggingIn,
    TResult Function()? registering,
    TResult Function()? resettingPassword,
    TResult Function()? verifyingOtp,
    TResult Function()? changingPassword,
    required TResult orElse(),
  }) {
    if (loggingIn != null) {
      return loggingIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthLoggingIn value) loggingIn,
    required TResult Function(AuthRegistering value) registering,
    required TResult Function(AuthResettingPassword value) resettingPassword,
    required TResult Function(AuthVerifyingOtp value) verifyingOtp,
    required TResult Function(AuthChangingPassword value) changingPassword,
  }) {
    return loggingIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthErrorState value)? error,
    TResult? Function(AuthLoggingIn value)? loggingIn,
    TResult? Function(AuthRegistering value)? registering,
    TResult? Function(AuthResettingPassword value)? resettingPassword,
    TResult? Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult? Function(AuthChangingPassword value)? changingPassword,
  }) {
    return loggingIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthLoggingIn value)? loggingIn,
    TResult Function(AuthRegistering value)? registering,
    TResult Function(AuthResettingPassword value)? resettingPassword,
    TResult Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult Function(AuthChangingPassword value)? changingPassword,
    required TResult orElse(),
  }) {
    if (loggingIn != null) {
      return loggingIn(this);
    }
    return orElse();
  }
}

abstract class AuthLoggingIn implements AuthApiState {
  const factory AuthLoggingIn() = _$AuthLoggingInImpl;
}

/// @nodoc
abstract class _$$AuthRegisteringImplCopyWith<$Res> {
  factory _$$AuthRegisteringImplCopyWith(_$AuthRegisteringImpl value,
          $Res Function(_$AuthRegisteringImpl) then) =
      __$$AuthRegisteringImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthRegisteringImplCopyWithImpl<$Res>
    extends _$AuthApiStateCopyWithImpl<$Res, _$AuthRegisteringImpl>
    implements _$$AuthRegisteringImplCopyWith<$Res> {
  __$$AuthRegisteringImplCopyWithImpl(
      _$AuthRegisteringImpl _value, $Res Function(_$AuthRegisteringImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthApiState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthRegisteringImpl implements AuthRegistering {
  const _$AuthRegisteringImpl();

  @override
  String toString() {
    return 'AuthApiState.registering()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthRegisteringImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message, String? code) error,
    required TResult Function() loggingIn,
    required TResult Function() registering,
    required TResult Function() resettingPassword,
    required TResult Function() verifyingOtp,
    required TResult Function() changingPassword,
  }) {
    return registering();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? loggingIn,
    TResult? Function()? registering,
    TResult? Function()? resettingPassword,
    TResult? Function()? verifyingOtp,
    TResult? Function()? changingPassword,
  }) {
    return registering?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthUser user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message, String? code)? error,
    TResult Function()? loggingIn,
    TResult Function()? registering,
    TResult Function()? resettingPassword,
    TResult Function()? verifyingOtp,
    TResult Function()? changingPassword,
    required TResult orElse(),
  }) {
    if (registering != null) {
      return registering();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthLoggingIn value) loggingIn,
    required TResult Function(AuthRegistering value) registering,
    required TResult Function(AuthResettingPassword value) resettingPassword,
    required TResult Function(AuthVerifyingOtp value) verifyingOtp,
    required TResult Function(AuthChangingPassword value) changingPassword,
  }) {
    return registering(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthErrorState value)? error,
    TResult? Function(AuthLoggingIn value)? loggingIn,
    TResult? Function(AuthRegistering value)? registering,
    TResult? Function(AuthResettingPassword value)? resettingPassword,
    TResult? Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult? Function(AuthChangingPassword value)? changingPassword,
  }) {
    return registering?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthLoggingIn value)? loggingIn,
    TResult Function(AuthRegistering value)? registering,
    TResult Function(AuthResettingPassword value)? resettingPassword,
    TResult Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult Function(AuthChangingPassword value)? changingPassword,
    required TResult orElse(),
  }) {
    if (registering != null) {
      return registering(this);
    }
    return orElse();
  }
}

abstract class AuthRegistering implements AuthApiState {
  const factory AuthRegistering() = _$AuthRegisteringImpl;
}

/// @nodoc
abstract class _$$AuthResettingPasswordImplCopyWith<$Res> {
  factory _$$AuthResettingPasswordImplCopyWith(
          _$AuthResettingPasswordImpl value,
          $Res Function(_$AuthResettingPasswordImpl) then) =
      __$$AuthResettingPasswordImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthResettingPasswordImplCopyWithImpl<$Res>
    extends _$AuthApiStateCopyWithImpl<$Res, _$AuthResettingPasswordImpl>
    implements _$$AuthResettingPasswordImplCopyWith<$Res> {
  __$$AuthResettingPasswordImplCopyWithImpl(_$AuthResettingPasswordImpl _value,
      $Res Function(_$AuthResettingPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthApiState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthResettingPasswordImpl implements AuthResettingPassword {
  const _$AuthResettingPasswordImpl();

  @override
  String toString() {
    return 'AuthApiState.resettingPassword()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResettingPasswordImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message, String? code) error,
    required TResult Function() loggingIn,
    required TResult Function() registering,
    required TResult Function() resettingPassword,
    required TResult Function() verifyingOtp,
    required TResult Function() changingPassword,
  }) {
    return resettingPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? loggingIn,
    TResult? Function()? registering,
    TResult? Function()? resettingPassword,
    TResult? Function()? verifyingOtp,
    TResult? Function()? changingPassword,
  }) {
    return resettingPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthUser user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message, String? code)? error,
    TResult Function()? loggingIn,
    TResult Function()? registering,
    TResult Function()? resettingPassword,
    TResult Function()? verifyingOtp,
    TResult Function()? changingPassword,
    required TResult orElse(),
  }) {
    if (resettingPassword != null) {
      return resettingPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthLoggingIn value) loggingIn,
    required TResult Function(AuthRegistering value) registering,
    required TResult Function(AuthResettingPassword value) resettingPassword,
    required TResult Function(AuthVerifyingOtp value) verifyingOtp,
    required TResult Function(AuthChangingPassword value) changingPassword,
  }) {
    return resettingPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthErrorState value)? error,
    TResult? Function(AuthLoggingIn value)? loggingIn,
    TResult? Function(AuthRegistering value)? registering,
    TResult? Function(AuthResettingPassword value)? resettingPassword,
    TResult? Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult? Function(AuthChangingPassword value)? changingPassword,
  }) {
    return resettingPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthLoggingIn value)? loggingIn,
    TResult Function(AuthRegistering value)? registering,
    TResult Function(AuthResettingPassword value)? resettingPassword,
    TResult Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult Function(AuthChangingPassword value)? changingPassword,
    required TResult orElse(),
  }) {
    if (resettingPassword != null) {
      return resettingPassword(this);
    }
    return orElse();
  }
}

abstract class AuthResettingPassword implements AuthApiState {
  const factory AuthResettingPassword() = _$AuthResettingPasswordImpl;
}

/// @nodoc
abstract class _$$AuthVerifyingOtpImplCopyWith<$Res> {
  factory _$$AuthVerifyingOtpImplCopyWith(_$AuthVerifyingOtpImpl value,
          $Res Function(_$AuthVerifyingOtpImpl) then) =
      __$$AuthVerifyingOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthVerifyingOtpImplCopyWithImpl<$Res>
    extends _$AuthApiStateCopyWithImpl<$Res, _$AuthVerifyingOtpImpl>
    implements _$$AuthVerifyingOtpImplCopyWith<$Res> {
  __$$AuthVerifyingOtpImplCopyWithImpl(_$AuthVerifyingOtpImpl _value,
      $Res Function(_$AuthVerifyingOtpImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthApiState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthVerifyingOtpImpl implements AuthVerifyingOtp {
  const _$AuthVerifyingOtpImpl();

  @override
  String toString() {
    return 'AuthApiState.verifyingOtp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthVerifyingOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message, String? code) error,
    required TResult Function() loggingIn,
    required TResult Function() registering,
    required TResult Function() resettingPassword,
    required TResult Function() verifyingOtp,
    required TResult Function() changingPassword,
  }) {
    return verifyingOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? loggingIn,
    TResult? Function()? registering,
    TResult? Function()? resettingPassword,
    TResult? Function()? verifyingOtp,
    TResult? Function()? changingPassword,
  }) {
    return verifyingOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthUser user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message, String? code)? error,
    TResult Function()? loggingIn,
    TResult Function()? registering,
    TResult Function()? resettingPassword,
    TResult Function()? verifyingOtp,
    TResult Function()? changingPassword,
    required TResult orElse(),
  }) {
    if (verifyingOtp != null) {
      return verifyingOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthLoggingIn value) loggingIn,
    required TResult Function(AuthRegistering value) registering,
    required TResult Function(AuthResettingPassword value) resettingPassword,
    required TResult Function(AuthVerifyingOtp value) verifyingOtp,
    required TResult Function(AuthChangingPassword value) changingPassword,
  }) {
    return verifyingOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthErrorState value)? error,
    TResult? Function(AuthLoggingIn value)? loggingIn,
    TResult? Function(AuthRegistering value)? registering,
    TResult? Function(AuthResettingPassword value)? resettingPassword,
    TResult? Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult? Function(AuthChangingPassword value)? changingPassword,
  }) {
    return verifyingOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthLoggingIn value)? loggingIn,
    TResult Function(AuthRegistering value)? registering,
    TResult Function(AuthResettingPassword value)? resettingPassword,
    TResult Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult Function(AuthChangingPassword value)? changingPassword,
    required TResult orElse(),
  }) {
    if (verifyingOtp != null) {
      return verifyingOtp(this);
    }
    return orElse();
  }
}

abstract class AuthVerifyingOtp implements AuthApiState {
  const factory AuthVerifyingOtp() = _$AuthVerifyingOtpImpl;
}

/// @nodoc
abstract class _$$AuthChangingPasswordImplCopyWith<$Res> {
  factory _$$AuthChangingPasswordImplCopyWith(_$AuthChangingPasswordImpl value,
          $Res Function(_$AuthChangingPasswordImpl) then) =
      __$$AuthChangingPasswordImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthChangingPasswordImplCopyWithImpl<$Res>
    extends _$AuthApiStateCopyWithImpl<$Res, _$AuthChangingPasswordImpl>
    implements _$$AuthChangingPasswordImplCopyWith<$Res> {
  __$$AuthChangingPasswordImplCopyWithImpl(_$AuthChangingPasswordImpl _value,
      $Res Function(_$AuthChangingPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthApiState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthChangingPasswordImpl implements AuthChangingPassword {
  const _$AuthChangingPasswordImpl();

  @override
  String toString() {
    return 'AuthApiState.changingPassword()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthChangingPasswordImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message, String? code) error,
    required TResult Function() loggingIn,
    required TResult Function() registering,
    required TResult Function() resettingPassword,
    required TResult Function() verifyingOtp,
    required TResult Function() changingPassword,
  }) {
    return changingPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? loggingIn,
    TResult? Function()? registering,
    TResult? Function()? resettingPassword,
    TResult? Function()? verifyingOtp,
    TResult? Function()? changingPassword,
  }) {
    return changingPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthUser user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message, String? code)? error,
    TResult Function()? loggingIn,
    TResult Function()? registering,
    TResult Function()? resettingPassword,
    TResult Function()? verifyingOtp,
    TResult Function()? changingPassword,
    required TResult orElse(),
  }) {
    if (changingPassword != null) {
      return changingPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthLoggingIn value) loggingIn,
    required TResult Function(AuthRegistering value) registering,
    required TResult Function(AuthResettingPassword value) resettingPassword,
    required TResult Function(AuthVerifyingOtp value) verifyingOtp,
    required TResult Function(AuthChangingPassword value) changingPassword,
  }) {
    return changingPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthErrorState value)? error,
    TResult? Function(AuthLoggingIn value)? loggingIn,
    TResult? Function(AuthRegistering value)? registering,
    TResult? Function(AuthResettingPassword value)? resettingPassword,
    TResult? Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult? Function(AuthChangingPassword value)? changingPassword,
  }) {
    return changingPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthLoggingIn value)? loggingIn,
    TResult Function(AuthRegistering value)? registering,
    TResult Function(AuthResettingPassword value)? resettingPassword,
    TResult Function(AuthVerifyingOtp value)? verifyingOtp,
    TResult Function(AuthChangingPassword value)? changingPassword,
    required TResult orElse(),
  }) {
    if (changingPassword != null) {
      return changingPassword(this);
    }
    return orElse();
  }
}

abstract class AuthChangingPassword implements AuthApiState {
  const factory AuthChangingPassword() = _$AuthChangingPasswordImpl;
}
