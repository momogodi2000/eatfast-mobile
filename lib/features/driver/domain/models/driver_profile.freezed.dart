// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DriverProfile _$DriverProfileFromJson(Map<String, dynamic> json) {
  return _DriverProfile.fromJson(json);
}

/// @nodoc
mixin _$DriverProfile {
  String get driverId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get licenseNumber => throw _privateConstructorUsedError;
  String get vehicleType => throw _privateConstructorUsedError;
  String get vehicleModel => throw _privateConstructorUsedError;
  String get vehiclePlateNumber => throw _privateConstructorUsedError;
  DriverStatus get status => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get totalDeliveries => throw _privateConstructorUsedError;
  double get totalEarnings => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String? get currentLocation => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  DateTime? get lastActiveAt => throw _privateConstructorUsedError;
  List<String> get serviceAreas => throw _privateConstructorUsedError;
  List<DeliveryStatistics> get weeklyStats =>
      throw _privateConstructorUsedError;

  /// Serializes this DriverProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriverProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverProfileCopyWith<DriverProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverProfileCopyWith<$Res> {
  factory $DriverProfileCopyWith(
          DriverProfile value, $Res Function(DriverProfile) then) =
      _$DriverProfileCopyWithImpl<$Res, DriverProfile>;
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
      DriverStatus status,
      double rating,
      int totalDeliveries,
      double totalEarnings,
      bool isOnline,
      bool isAvailable,
      String? profileImageUrl,
      String? currentLocation,
      double? latitude,
      double? longitude,
      DateTime? lastActiveAt,
      List<String> serviceAreas,
      List<DeliveryStatistics> weeklyStats});
}

/// @nodoc
class _$DriverProfileCopyWithImpl<$Res, $Val extends DriverProfile>
    implements $DriverProfileCopyWith<$Res> {
  _$DriverProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriverProfile
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
    Object? rating = null,
    Object? totalDeliveries = null,
    Object? totalEarnings = null,
    Object? isOnline = null,
    Object? isAvailable = null,
    Object? profileImageUrl = freezed,
    Object? currentLocation = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? lastActiveAt = freezed,
    Object? serviceAreas = null,
    Object? weeklyStats = null,
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
              as DriverStatus,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      totalDeliveries: null == totalDeliveries
          ? _value.totalDeliveries
          : totalDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      totalEarnings: null == totalEarnings
          ? _value.totalEarnings
          : totalEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
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
      lastActiveAt: freezed == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      serviceAreas: null == serviceAreas
          ? _value.serviceAreas
          : serviceAreas // ignore: cast_nullable_to_non_nullable
              as List<String>,
      weeklyStats: null == weeklyStats
          ? _value.weeklyStats
          : weeklyStats // ignore: cast_nullable_to_non_nullable
              as List<DeliveryStatistics>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriverProfileImplCopyWith<$Res>
    implements $DriverProfileCopyWith<$Res> {
  factory _$$DriverProfileImplCopyWith(
          _$DriverProfileImpl value, $Res Function(_$DriverProfileImpl) then) =
      __$$DriverProfileImplCopyWithImpl<$Res>;
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
      DriverStatus status,
      double rating,
      int totalDeliveries,
      double totalEarnings,
      bool isOnline,
      bool isAvailable,
      String? profileImageUrl,
      String? currentLocation,
      double? latitude,
      double? longitude,
      DateTime? lastActiveAt,
      List<String> serviceAreas,
      List<DeliveryStatistics> weeklyStats});
}

/// @nodoc
class __$$DriverProfileImplCopyWithImpl<$Res>
    extends _$DriverProfileCopyWithImpl<$Res, _$DriverProfileImpl>
    implements _$$DriverProfileImplCopyWith<$Res> {
  __$$DriverProfileImplCopyWithImpl(
      _$DriverProfileImpl _value, $Res Function(_$DriverProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of DriverProfile
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
    Object? rating = null,
    Object? totalDeliveries = null,
    Object? totalEarnings = null,
    Object? isOnline = null,
    Object? isAvailable = null,
    Object? profileImageUrl = freezed,
    Object? currentLocation = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? lastActiveAt = freezed,
    Object? serviceAreas = null,
    Object? weeklyStats = null,
  }) {
    return _then(_$DriverProfileImpl(
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
              as DriverStatus,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      totalDeliveries: null == totalDeliveries
          ? _value.totalDeliveries
          : totalDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      totalEarnings: null == totalEarnings
          ? _value.totalEarnings
          : totalEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
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
      lastActiveAt: freezed == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      serviceAreas: null == serviceAreas
          ? _value._serviceAreas
          : serviceAreas // ignore: cast_nullable_to_non_nullable
              as List<String>,
      weeklyStats: null == weeklyStats
          ? _value._weeklyStats
          : weeklyStats // ignore: cast_nullable_to_non_nullable
              as List<DeliveryStatistics>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverProfileImpl implements _DriverProfile {
  const _$DriverProfileImpl(
      {required this.driverId,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.licenseNumber,
      required this.vehicleType,
      required this.vehicleModel,
      required this.vehiclePlateNumber,
      required this.status,
      required this.rating,
      required this.totalDeliveries,
      required this.totalEarnings,
      required this.isOnline,
      required this.isAvailable,
      this.profileImageUrl,
      this.currentLocation,
      this.latitude,
      this.longitude,
      this.lastActiveAt,
      final List<String> serviceAreas = const [],
      final List<DeliveryStatistics> weeklyStats = const []})
      : _serviceAreas = serviceAreas,
        _weeklyStats = weeklyStats;

  factory _$DriverProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverProfileImplFromJson(json);

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
  final DriverStatus status;
  @override
  final double rating;
  @override
  final int totalDeliveries;
  @override
  final double totalEarnings;
  @override
  final bool isOnline;
  @override
  final bool isAvailable;
  @override
  final String? profileImageUrl;
  @override
  final String? currentLocation;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final DateTime? lastActiveAt;
  final List<String> _serviceAreas;
  @override
  @JsonKey()
  List<String> get serviceAreas {
    if (_serviceAreas is EqualUnmodifiableListView) return _serviceAreas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceAreas);
  }

  final List<DeliveryStatistics> _weeklyStats;
  @override
  @JsonKey()
  List<DeliveryStatistics> get weeklyStats {
    if (_weeklyStats is EqualUnmodifiableListView) return _weeklyStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyStats);
  }

  @override
  String toString() {
    return 'DriverProfile(driverId: $driverId, name: $name, email: $email, phoneNumber: $phoneNumber, licenseNumber: $licenseNumber, vehicleType: $vehicleType, vehicleModel: $vehicleModel, vehiclePlateNumber: $vehiclePlateNumber, status: $status, rating: $rating, totalDeliveries: $totalDeliveries, totalEarnings: $totalEarnings, isOnline: $isOnline, isAvailable: $isAvailable, profileImageUrl: $profileImageUrl, currentLocation: $currentLocation, latitude: $latitude, longitude: $longitude, lastActiveAt: $lastActiveAt, serviceAreas: $serviceAreas, weeklyStats: $weeklyStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverProfileImpl &&
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
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.totalDeliveries, totalDeliveries) ||
                other.totalDeliveries == totalDeliveries) &&
            (identical(other.totalEarnings, totalEarnings) ||
                other.totalEarnings == totalEarnings) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.lastActiveAt, lastActiveAt) ||
                other.lastActiveAt == lastActiveAt) &&
            const DeepCollectionEquality()
                .equals(other._serviceAreas, _serviceAreas) &&
            const DeepCollectionEquality()
                .equals(other._weeklyStats, _weeklyStats));
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
        rating,
        totalDeliveries,
        totalEarnings,
        isOnline,
        isAvailable,
        profileImageUrl,
        currentLocation,
        latitude,
        longitude,
        lastActiveAt,
        const DeepCollectionEquality().hash(_serviceAreas),
        const DeepCollectionEquality().hash(_weeklyStats)
      ]);

  /// Create a copy of DriverProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverProfileImplCopyWith<_$DriverProfileImpl> get copyWith =>
      __$$DriverProfileImplCopyWithImpl<_$DriverProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverProfileImplToJson(
      this,
    );
  }
}

abstract class _DriverProfile implements DriverProfile {
  const factory _DriverProfile(
      {required final String driverId,
      required final String name,
      required final String email,
      required final String phoneNumber,
      required final String licenseNumber,
      required final String vehicleType,
      required final String vehicleModel,
      required final String vehiclePlateNumber,
      required final DriverStatus status,
      required final double rating,
      required final int totalDeliveries,
      required final double totalEarnings,
      required final bool isOnline,
      required final bool isAvailable,
      final String? profileImageUrl,
      final String? currentLocation,
      final double? latitude,
      final double? longitude,
      final DateTime? lastActiveAt,
      final List<String> serviceAreas,
      final List<DeliveryStatistics> weeklyStats}) = _$DriverProfileImpl;

  factory _DriverProfile.fromJson(Map<String, dynamic> json) =
      _$DriverProfileImpl.fromJson;

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
  DriverStatus get status;
  @override
  double get rating;
  @override
  int get totalDeliveries;
  @override
  double get totalEarnings;
  @override
  bool get isOnline;
  @override
  bool get isAvailable;
  @override
  String? get profileImageUrl;
  @override
  String? get currentLocation;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  DateTime? get lastActiveAt;
  @override
  List<String> get serviceAreas;
  @override
  List<DeliveryStatistics> get weeklyStats;

  /// Create a copy of DriverProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverProfileImplCopyWith<_$DriverProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryStatistics _$DeliveryStatisticsFromJson(Map<String, dynamic> json) {
  return _DeliveryStatistics.fromJson(json);
}

/// @nodoc
mixin _$DeliveryStatistics {
  DateTime get date => throw _privateConstructorUsedError;
  int get deliveries => throw _privateConstructorUsedError;
  double get earnings => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get onlineHours => throw _privateConstructorUsedError;

  /// Serializes this DeliveryStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryStatisticsCopyWith<DeliveryStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryStatisticsCopyWith<$Res> {
  factory $DeliveryStatisticsCopyWith(
          DeliveryStatistics value, $Res Function(DeliveryStatistics) then) =
      _$DeliveryStatisticsCopyWithImpl<$Res, DeliveryStatistics>;
  @useResult
  $Res call(
      {DateTime date,
      int deliveries,
      double earnings,
      double rating,
      int onlineHours});
}

/// @nodoc
class _$DeliveryStatisticsCopyWithImpl<$Res, $Val extends DeliveryStatistics>
    implements $DeliveryStatisticsCopyWith<$Res> {
  _$DeliveryStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? deliveries = null,
    Object? earnings = null,
    Object? rating = null,
    Object? onlineHours = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveries: null == deliveries
          ? _value.deliveries
          : deliveries // ignore: cast_nullable_to_non_nullable
              as int,
      earnings: null == earnings
          ? _value.earnings
          : earnings // ignore: cast_nullable_to_non_nullable
              as double,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      onlineHours: null == onlineHours
          ? _value.onlineHours
          : onlineHours // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryStatisticsImplCopyWith<$Res>
    implements $DeliveryStatisticsCopyWith<$Res> {
  factory _$$DeliveryStatisticsImplCopyWith(_$DeliveryStatisticsImpl value,
          $Res Function(_$DeliveryStatisticsImpl) then) =
      __$$DeliveryStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      int deliveries,
      double earnings,
      double rating,
      int onlineHours});
}

/// @nodoc
class __$$DeliveryStatisticsImplCopyWithImpl<$Res>
    extends _$DeliveryStatisticsCopyWithImpl<$Res, _$DeliveryStatisticsImpl>
    implements _$$DeliveryStatisticsImplCopyWith<$Res> {
  __$$DeliveryStatisticsImplCopyWithImpl(_$DeliveryStatisticsImpl _value,
      $Res Function(_$DeliveryStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? deliveries = null,
    Object? earnings = null,
    Object? rating = null,
    Object? onlineHours = null,
  }) {
    return _then(_$DeliveryStatisticsImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveries: null == deliveries
          ? _value.deliveries
          : deliveries // ignore: cast_nullable_to_non_nullable
              as int,
      earnings: null == earnings
          ? _value.earnings
          : earnings // ignore: cast_nullable_to_non_nullable
              as double,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
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
class _$DeliveryStatisticsImpl implements _DeliveryStatistics {
  const _$DeliveryStatisticsImpl(
      {required this.date,
      required this.deliveries,
      required this.earnings,
      required this.rating,
      required this.onlineHours});

  factory _$DeliveryStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryStatisticsImplFromJson(json);

  @override
  final DateTime date;
  @override
  final int deliveries;
  @override
  final double earnings;
  @override
  final double rating;
  @override
  final int onlineHours;

  @override
  String toString() {
    return 'DeliveryStatistics(date: $date, deliveries: $deliveries, earnings: $earnings, rating: $rating, onlineHours: $onlineHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryStatisticsImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.deliveries, deliveries) ||
                other.deliveries == deliveries) &&
            (identical(other.earnings, earnings) ||
                other.earnings == earnings) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.onlineHours, onlineHours) ||
                other.onlineHours == onlineHours));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, deliveries, earnings, rating, onlineHours);

  /// Create a copy of DeliveryStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryStatisticsImplCopyWith<_$DeliveryStatisticsImpl> get copyWith =>
      __$$DeliveryStatisticsImplCopyWithImpl<_$DeliveryStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryStatisticsImplToJson(
      this,
    );
  }
}

abstract class _DeliveryStatistics implements DeliveryStatistics {
  const factory _DeliveryStatistics(
      {required final DateTime date,
      required final int deliveries,
      required final double earnings,
      required final double rating,
      required final int onlineHours}) = _$DeliveryStatisticsImpl;

  factory _DeliveryStatistics.fromJson(Map<String, dynamic> json) =
      _$DeliveryStatisticsImpl.fromJson;

  @override
  DateTime get date;
  @override
  int get deliveries;
  @override
  double get earnings;
  @override
  double get rating;
  @override
  int get onlineHours;

  /// Create a copy of DeliveryStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryStatisticsImplCopyWith<_$DeliveryStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
