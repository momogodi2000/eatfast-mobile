// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wearable_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WearableDevice _$WearableDeviceFromJson(Map<String, dynamic> json) {
  return _WearableDevice.fromJson(json);
}

/// @nodoc
mixin _$WearableDevice {
  String get deviceId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  WearableType get type => throw _privateConstructorUsedError;
  WearableBrand get brand => throw _privateConstructorUsedError;
  String get modelName => throw _privateConstructorUsedError;
  ConnectionStatus get connectionStatus => throw _privateConstructorUsedError;
  double get batteryLevel => throw _privateConstructorUsedError;
  DateTime get lastSyncTime => throw _privateConstructorUsedError;
  String? get firmwareVersion => throw _privateConstructorUsedError;
  String? get serialNumber => throw _privateConstructorUsedError;
  List<WearableCapability> get capabilities =>
      throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  Map<String, dynamic>? get settings => throw _privateConstructorUsedError;

  /// Serializes this WearableDevice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WearableDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WearableDeviceCopyWith<WearableDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WearableDeviceCopyWith<$Res> {
  factory $WearableDeviceCopyWith(
          WearableDevice value, $Res Function(WearableDevice) then) =
      _$WearableDeviceCopyWithImpl<$Res, WearableDevice>;
  @useResult
  $Res call(
      {String deviceId,
      String name,
      WearableType type,
      WearableBrand brand,
      String modelName,
      ConnectionStatus connectionStatus,
      double batteryLevel,
      DateTime lastSyncTime,
      String? firmwareVersion,
      String? serialNumber,
      List<WearableCapability> capabilities,
      bool isEnabled,
      Map<String, dynamic>? settings});
}

/// @nodoc
class _$WearableDeviceCopyWithImpl<$Res, $Val extends WearableDevice>
    implements $WearableDeviceCopyWith<$Res> {
  _$WearableDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WearableDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? name = null,
    Object? type = null,
    Object? brand = null,
    Object? modelName = null,
    Object? connectionStatus = null,
    Object? batteryLevel = null,
    Object? lastSyncTime = null,
    Object? firmwareVersion = freezed,
    Object? serialNumber = freezed,
    Object? capabilities = null,
    Object? isEnabled = null,
    Object? settings = freezed,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WearableType,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as WearableBrand,
      modelName: null == modelName
          ? _value.modelName
          : modelName // ignore: cast_nullable_to_non_nullable
              as String,
      connectionStatus: null == connectionStatus
          ? _value.connectionStatus
          : connectionStatus // ignore: cast_nullable_to_non_nullable
              as ConnectionStatus,
      batteryLevel: null == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as double,
      lastSyncTime: null == lastSyncTime
          ? _value.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      firmwareVersion: freezed == firmwareVersion
          ? _value.firmwareVersion
          : firmwareVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      capabilities: null == capabilities
          ? _value.capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as List<WearableCapability>,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WearableDeviceImplCopyWith<$Res>
    implements $WearableDeviceCopyWith<$Res> {
  factory _$$WearableDeviceImplCopyWith(_$WearableDeviceImpl value,
          $Res Function(_$WearableDeviceImpl) then) =
      __$$WearableDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String deviceId,
      String name,
      WearableType type,
      WearableBrand brand,
      String modelName,
      ConnectionStatus connectionStatus,
      double batteryLevel,
      DateTime lastSyncTime,
      String? firmwareVersion,
      String? serialNumber,
      List<WearableCapability> capabilities,
      bool isEnabled,
      Map<String, dynamic>? settings});
}

/// @nodoc
class __$$WearableDeviceImplCopyWithImpl<$Res>
    extends _$WearableDeviceCopyWithImpl<$Res, _$WearableDeviceImpl>
    implements _$$WearableDeviceImplCopyWith<$Res> {
  __$$WearableDeviceImplCopyWithImpl(
      _$WearableDeviceImpl _value, $Res Function(_$WearableDeviceImpl) _then)
      : super(_value, _then);

  /// Create a copy of WearableDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? name = null,
    Object? type = null,
    Object? brand = null,
    Object? modelName = null,
    Object? connectionStatus = null,
    Object? batteryLevel = null,
    Object? lastSyncTime = null,
    Object? firmwareVersion = freezed,
    Object? serialNumber = freezed,
    Object? capabilities = null,
    Object? isEnabled = null,
    Object? settings = freezed,
  }) {
    return _then(_$WearableDeviceImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WearableType,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as WearableBrand,
      modelName: null == modelName
          ? _value.modelName
          : modelName // ignore: cast_nullable_to_non_nullable
              as String,
      connectionStatus: null == connectionStatus
          ? _value.connectionStatus
          : connectionStatus // ignore: cast_nullable_to_non_nullable
              as ConnectionStatus,
      batteryLevel: null == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as double,
      lastSyncTime: null == lastSyncTime
          ? _value.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      firmwareVersion: freezed == firmwareVersion
          ? _value.firmwareVersion
          : firmwareVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      capabilities: null == capabilities
          ? _value._capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as List<WearableCapability>,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      settings: freezed == settings
          ? _value._settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WearableDeviceImpl implements _WearableDevice {
  const _$WearableDeviceImpl(
      {required this.deviceId,
      required this.name,
      required this.type,
      required this.brand,
      required this.modelName,
      required this.connectionStatus,
      required this.batteryLevel,
      required this.lastSyncTime,
      this.firmwareVersion,
      this.serialNumber,
      final List<WearableCapability> capabilities = const [],
      this.isEnabled = true,
      final Map<String, dynamic>? settings})
      : _capabilities = capabilities,
        _settings = settings;

  factory _$WearableDeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$WearableDeviceImplFromJson(json);

  @override
  final String deviceId;
  @override
  final String name;
  @override
  final WearableType type;
  @override
  final WearableBrand brand;
  @override
  final String modelName;
  @override
  final ConnectionStatus connectionStatus;
  @override
  final double batteryLevel;
  @override
  final DateTime lastSyncTime;
  @override
  final String? firmwareVersion;
  @override
  final String? serialNumber;
  final List<WearableCapability> _capabilities;
  @override
  @JsonKey()
  List<WearableCapability> get capabilities {
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capabilities);
  }

  @override
  @JsonKey()
  final bool isEnabled;
  final Map<String, dynamic>? _settings;
  @override
  Map<String, dynamic>? get settings {
    final value = _settings;
    if (value == null) return null;
    if (_settings is EqualUnmodifiableMapView) return _settings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'WearableDevice(deviceId: $deviceId, name: $name, type: $type, brand: $brand, modelName: $modelName, connectionStatus: $connectionStatus, batteryLevel: $batteryLevel, lastSyncTime: $lastSyncTime, firmwareVersion: $firmwareVersion, serialNumber: $serialNumber, capabilities: $capabilities, isEnabled: $isEnabled, settings: $settings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WearableDeviceImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.modelName, modelName) ||
                other.modelName == modelName) &&
            (identical(other.connectionStatus, connectionStatus) ||
                other.connectionStatus == connectionStatus) &&
            (identical(other.batteryLevel, batteryLevel) ||
                other.batteryLevel == batteryLevel) &&
            (identical(other.lastSyncTime, lastSyncTime) ||
                other.lastSyncTime == lastSyncTime) &&
            (identical(other.firmwareVersion, firmwareVersion) ||
                other.firmwareVersion == firmwareVersion) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            const DeepCollectionEquality().equals(other._settings, _settings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deviceId,
      name,
      type,
      brand,
      modelName,
      connectionStatus,
      batteryLevel,
      lastSyncTime,
      firmwareVersion,
      serialNumber,
      const DeepCollectionEquality().hash(_capabilities),
      isEnabled,
      const DeepCollectionEquality().hash(_settings));

  /// Create a copy of WearableDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WearableDeviceImplCopyWith<_$WearableDeviceImpl> get copyWith =>
      __$$WearableDeviceImplCopyWithImpl<_$WearableDeviceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WearableDeviceImplToJson(
      this,
    );
  }
}

abstract class _WearableDevice implements WearableDevice {
  const factory _WearableDevice(
      {required final String deviceId,
      required final String name,
      required final WearableType type,
      required final WearableBrand brand,
      required final String modelName,
      required final ConnectionStatus connectionStatus,
      required final double batteryLevel,
      required final DateTime lastSyncTime,
      final String? firmwareVersion,
      final String? serialNumber,
      final List<WearableCapability> capabilities,
      final bool isEnabled,
      final Map<String, dynamic>? settings}) = _$WearableDeviceImpl;

  factory _WearableDevice.fromJson(Map<String, dynamic> json) =
      _$WearableDeviceImpl.fromJson;

  @override
  String get deviceId;
  @override
  String get name;
  @override
  WearableType get type;
  @override
  WearableBrand get brand;
  @override
  String get modelName;
  @override
  ConnectionStatus get connectionStatus;
  @override
  double get batteryLevel;
  @override
  DateTime get lastSyncTime;
  @override
  String? get firmwareVersion;
  @override
  String? get serialNumber;
  @override
  List<WearableCapability> get capabilities;
  @override
  bool get isEnabled;
  @override
  Map<String, dynamic>? get settings;

  /// Create a copy of WearableDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WearableDeviceImplCopyWith<_$WearableDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HealthData _$HealthDataFromJson(Map<String, dynamic> json) {
  return _HealthData.fromJson(json);
}

/// @nodoc
mixin _$HealthData {
  String get deviceId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  int? get heartRate => throw _privateConstructorUsedError;
  int? get steps => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  int? get calories => throw _privateConstructorUsedError;
  int? get sleepMinutes => throw _privateConstructorUsedError;
  double? get bodyTemperature => throw _privateConstructorUsedError;
  int? get bloodOxygen => throw _privateConstructorUsedError;
  int? get systolicPressure => throw _privateConstructorUsedError;
  int? get diastolicPressure => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  double? get bodyFat => throw _privateConstructorUsedError;
  int? get stressLevel => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalMetrics =>
      throw _privateConstructorUsedError;

  /// Serializes this HealthData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthDataCopyWith<HealthData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthDataCopyWith<$Res> {
  factory $HealthDataCopyWith(
          HealthData value, $Res Function(HealthData) then) =
      _$HealthDataCopyWithImpl<$Res, HealthData>;
  @useResult
  $Res call(
      {String deviceId,
      String userId,
      DateTime timestamp,
      int? heartRate,
      int? steps,
      double? distance,
      int? calories,
      int? sleepMinutes,
      double? bodyTemperature,
      int? bloodOxygen,
      int? systolicPressure,
      int? diastolicPressure,
      double? weight,
      double? bodyFat,
      int? stressLevel,
      Map<String, dynamic>? additionalMetrics});
}

/// @nodoc
class _$HealthDataCopyWithImpl<$Res, $Val extends HealthData>
    implements $HealthDataCopyWith<$Res> {
  _$HealthDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? userId = null,
    Object? timestamp = null,
    Object? heartRate = freezed,
    Object? steps = freezed,
    Object? distance = freezed,
    Object? calories = freezed,
    Object? sleepMinutes = freezed,
    Object? bodyTemperature = freezed,
    Object? bloodOxygen = freezed,
    Object? systolicPressure = freezed,
    Object? diastolicPressure = freezed,
    Object? weight = freezed,
    Object? bodyFat = freezed,
    Object? stressLevel = freezed,
    Object? additionalMetrics = freezed,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      heartRate: freezed == heartRate
          ? _value.heartRate
          : heartRate // ignore: cast_nullable_to_non_nullable
              as int?,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int?,
      sleepMinutes: freezed == sleepMinutes
          ? _value.sleepMinutes
          : sleepMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      bodyTemperature: freezed == bodyTemperature
          ? _value.bodyTemperature
          : bodyTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      bloodOxygen: freezed == bloodOxygen
          ? _value.bloodOxygen
          : bloodOxygen // ignore: cast_nullable_to_non_nullable
              as int?,
      systolicPressure: freezed == systolicPressure
          ? _value.systolicPressure
          : systolicPressure // ignore: cast_nullable_to_non_nullable
              as int?,
      diastolicPressure: freezed == diastolicPressure
          ? _value.diastolicPressure
          : diastolicPressure // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      bodyFat: freezed == bodyFat
          ? _value.bodyFat
          : bodyFat // ignore: cast_nullable_to_non_nullable
              as double?,
      stressLevel: freezed == stressLevel
          ? _value.stressLevel
          : stressLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      additionalMetrics: freezed == additionalMetrics
          ? _value.additionalMetrics
          : additionalMetrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthDataImplCopyWith<$Res>
    implements $HealthDataCopyWith<$Res> {
  factory _$$HealthDataImplCopyWith(
          _$HealthDataImpl value, $Res Function(_$HealthDataImpl) then) =
      __$$HealthDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String deviceId,
      String userId,
      DateTime timestamp,
      int? heartRate,
      int? steps,
      double? distance,
      int? calories,
      int? sleepMinutes,
      double? bodyTemperature,
      int? bloodOxygen,
      int? systolicPressure,
      int? diastolicPressure,
      double? weight,
      double? bodyFat,
      int? stressLevel,
      Map<String, dynamic>? additionalMetrics});
}

/// @nodoc
class __$$HealthDataImplCopyWithImpl<$Res>
    extends _$HealthDataCopyWithImpl<$Res, _$HealthDataImpl>
    implements _$$HealthDataImplCopyWith<$Res> {
  __$$HealthDataImplCopyWithImpl(
      _$HealthDataImpl _value, $Res Function(_$HealthDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HealthData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? userId = null,
    Object? timestamp = null,
    Object? heartRate = freezed,
    Object? steps = freezed,
    Object? distance = freezed,
    Object? calories = freezed,
    Object? sleepMinutes = freezed,
    Object? bodyTemperature = freezed,
    Object? bloodOxygen = freezed,
    Object? systolicPressure = freezed,
    Object? diastolicPressure = freezed,
    Object? weight = freezed,
    Object? bodyFat = freezed,
    Object? stressLevel = freezed,
    Object? additionalMetrics = freezed,
  }) {
    return _then(_$HealthDataImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      heartRate: freezed == heartRate
          ? _value.heartRate
          : heartRate // ignore: cast_nullable_to_non_nullable
              as int?,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int?,
      sleepMinutes: freezed == sleepMinutes
          ? _value.sleepMinutes
          : sleepMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      bodyTemperature: freezed == bodyTemperature
          ? _value.bodyTemperature
          : bodyTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      bloodOxygen: freezed == bloodOxygen
          ? _value.bloodOxygen
          : bloodOxygen // ignore: cast_nullable_to_non_nullable
              as int?,
      systolicPressure: freezed == systolicPressure
          ? _value.systolicPressure
          : systolicPressure // ignore: cast_nullable_to_non_nullable
              as int?,
      diastolicPressure: freezed == diastolicPressure
          ? _value.diastolicPressure
          : diastolicPressure // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      bodyFat: freezed == bodyFat
          ? _value.bodyFat
          : bodyFat // ignore: cast_nullable_to_non_nullable
              as double?,
      stressLevel: freezed == stressLevel
          ? _value.stressLevel
          : stressLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      additionalMetrics: freezed == additionalMetrics
          ? _value._additionalMetrics
          : additionalMetrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthDataImpl implements _HealthData {
  const _$HealthDataImpl(
      {required this.deviceId,
      required this.userId,
      required this.timestamp,
      this.heartRate,
      this.steps,
      this.distance,
      this.calories,
      this.sleepMinutes,
      this.bodyTemperature,
      this.bloodOxygen,
      this.systolicPressure,
      this.diastolicPressure,
      this.weight,
      this.bodyFat,
      this.stressLevel,
      final Map<String, dynamic>? additionalMetrics})
      : _additionalMetrics = additionalMetrics;

  factory _$HealthDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthDataImplFromJson(json);

  @override
  final String deviceId;
  @override
  final String userId;
  @override
  final DateTime timestamp;
  @override
  final int? heartRate;
  @override
  final int? steps;
  @override
  final double? distance;
  @override
  final int? calories;
  @override
  final int? sleepMinutes;
  @override
  final double? bodyTemperature;
  @override
  final int? bloodOxygen;
  @override
  final int? systolicPressure;
  @override
  final int? diastolicPressure;
  @override
  final double? weight;
  @override
  final double? bodyFat;
  @override
  final int? stressLevel;
  final Map<String, dynamic>? _additionalMetrics;
  @override
  Map<String, dynamic>? get additionalMetrics {
    final value = _additionalMetrics;
    if (value == null) return null;
    if (_additionalMetrics is EqualUnmodifiableMapView)
      return _additionalMetrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'HealthData(deviceId: $deviceId, userId: $userId, timestamp: $timestamp, heartRate: $heartRate, steps: $steps, distance: $distance, calories: $calories, sleepMinutes: $sleepMinutes, bodyTemperature: $bodyTemperature, bloodOxygen: $bloodOxygen, systolicPressure: $systolicPressure, diastolicPressure: $diastolicPressure, weight: $weight, bodyFat: $bodyFat, stressLevel: $stressLevel, additionalMetrics: $additionalMetrics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthDataImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.heartRate, heartRate) ||
                other.heartRate == heartRate) &&
            (identical(other.steps, steps) || other.steps == steps) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.sleepMinutes, sleepMinutes) ||
                other.sleepMinutes == sleepMinutes) &&
            (identical(other.bodyTemperature, bodyTemperature) ||
                other.bodyTemperature == bodyTemperature) &&
            (identical(other.bloodOxygen, bloodOxygen) ||
                other.bloodOxygen == bloodOxygen) &&
            (identical(other.systolicPressure, systolicPressure) ||
                other.systolicPressure == systolicPressure) &&
            (identical(other.diastolicPressure, diastolicPressure) ||
                other.diastolicPressure == diastolicPressure) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.bodyFat, bodyFat) || other.bodyFat == bodyFat) &&
            (identical(other.stressLevel, stressLevel) ||
                other.stressLevel == stressLevel) &&
            const DeepCollectionEquality()
                .equals(other._additionalMetrics, _additionalMetrics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deviceId,
      userId,
      timestamp,
      heartRate,
      steps,
      distance,
      calories,
      sleepMinutes,
      bodyTemperature,
      bloodOxygen,
      systolicPressure,
      diastolicPressure,
      weight,
      bodyFat,
      stressLevel,
      const DeepCollectionEquality().hash(_additionalMetrics));

  /// Create a copy of HealthData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthDataImplCopyWith<_$HealthDataImpl> get copyWith =>
      __$$HealthDataImplCopyWithImpl<_$HealthDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthDataImplToJson(
      this,
    );
  }
}

abstract class _HealthData implements HealthData {
  const factory _HealthData(
      {required final String deviceId,
      required final String userId,
      required final DateTime timestamp,
      final int? heartRate,
      final int? steps,
      final double? distance,
      final int? calories,
      final int? sleepMinutes,
      final double? bodyTemperature,
      final int? bloodOxygen,
      final int? systolicPressure,
      final int? diastolicPressure,
      final double? weight,
      final double? bodyFat,
      final int? stressLevel,
      final Map<String, dynamic>? additionalMetrics}) = _$HealthDataImpl;

  factory _HealthData.fromJson(Map<String, dynamic> json) =
      _$HealthDataImpl.fromJson;

  @override
  String get deviceId;
  @override
  String get userId;
  @override
  DateTime get timestamp;
  @override
  int? get heartRate;
  @override
  int? get steps;
  @override
  double? get distance;
  @override
  int? get calories;
  @override
  int? get sleepMinutes;
  @override
  double? get bodyTemperature;
  @override
  int? get bloodOxygen;
  @override
  int? get systolicPressure;
  @override
  int? get diastolicPressure;
  @override
  double? get weight;
  @override
  double? get bodyFat;
  @override
  int? get stressLevel;
  @override
  Map<String, dynamic>? get additionalMetrics;

  /// Create a copy of HealthData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthDataImplCopyWith<_$HealthDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FitnessActivity _$FitnessActivityFromJson(Map<String, dynamic> json) {
  return _FitnessActivity.fromJson(json);
}

/// @nodoc
mixin _$FitnessActivity {
  String get activityId => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  ActivityType get type => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError; // in minutes
  int? get steps => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  int? get calories => throw _privateConstructorUsedError;
  int? get averageHeartRate => throw _privateConstructorUsedError;
  int? get maxHeartRate => throw _privateConstructorUsedError;
  List<HeartRateZone>? get heartRateZones => throw _privateConstructorUsedError;
  String? get route => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalData =>
      throw _privateConstructorUsedError;

  /// Serializes this FitnessActivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FitnessActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FitnessActivityCopyWith<FitnessActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FitnessActivityCopyWith<$Res> {
  factory $FitnessActivityCopyWith(
          FitnessActivity value, $Res Function(FitnessActivity) then) =
      _$FitnessActivityCopyWithImpl<$Res, FitnessActivity>;
  @useResult
  $Res call(
      {String activityId,
      String deviceId,
      ActivityType type,
      DateTime startTime,
      DateTime endTime,
      int duration,
      int? steps,
      double? distance,
      int? calories,
      int? averageHeartRate,
      int? maxHeartRate,
      List<HeartRateZone>? heartRateZones,
      String? route,
      Map<String, dynamic>? additionalData});
}

/// @nodoc
class _$FitnessActivityCopyWithImpl<$Res, $Val extends FitnessActivity>
    implements $FitnessActivityCopyWith<$Res> {
  _$FitnessActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FitnessActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityId = null,
    Object? deviceId = null,
    Object? type = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? duration = null,
    Object? steps = freezed,
    Object? distance = freezed,
    Object? calories = freezed,
    Object? averageHeartRate = freezed,
    Object? maxHeartRate = freezed,
    Object? heartRateZones = freezed,
    Object? route = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(_value.copyWith(
      activityId: null == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActivityType,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int?,
      averageHeartRate: freezed == averageHeartRate
          ? _value.averageHeartRate
          : averageHeartRate // ignore: cast_nullable_to_non_nullable
              as int?,
      maxHeartRate: freezed == maxHeartRate
          ? _value.maxHeartRate
          : maxHeartRate // ignore: cast_nullable_to_non_nullable
              as int?,
      heartRateZones: freezed == heartRateZones
          ? _value.heartRateZones
          : heartRateZones // ignore: cast_nullable_to_non_nullable
              as List<HeartRateZone>?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: freezed == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FitnessActivityImplCopyWith<$Res>
    implements $FitnessActivityCopyWith<$Res> {
  factory _$$FitnessActivityImplCopyWith(_$FitnessActivityImpl value,
          $Res Function(_$FitnessActivityImpl) then) =
      __$$FitnessActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activityId,
      String deviceId,
      ActivityType type,
      DateTime startTime,
      DateTime endTime,
      int duration,
      int? steps,
      double? distance,
      int? calories,
      int? averageHeartRate,
      int? maxHeartRate,
      List<HeartRateZone>? heartRateZones,
      String? route,
      Map<String, dynamic>? additionalData});
}

/// @nodoc
class __$$FitnessActivityImplCopyWithImpl<$Res>
    extends _$FitnessActivityCopyWithImpl<$Res, _$FitnessActivityImpl>
    implements _$$FitnessActivityImplCopyWith<$Res> {
  __$$FitnessActivityImplCopyWithImpl(
      _$FitnessActivityImpl _value, $Res Function(_$FitnessActivityImpl) _then)
      : super(_value, _then);

  /// Create a copy of FitnessActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityId = null,
    Object? deviceId = null,
    Object? type = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? duration = null,
    Object? steps = freezed,
    Object? distance = freezed,
    Object? calories = freezed,
    Object? averageHeartRate = freezed,
    Object? maxHeartRate = freezed,
    Object? heartRateZones = freezed,
    Object? route = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(_$FitnessActivityImpl(
      activityId: null == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActivityType,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int?,
      averageHeartRate: freezed == averageHeartRate
          ? _value.averageHeartRate
          : averageHeartRate // ignore: cast_nullable_to_non_nullable
              as int?,
      maxHeartRate: freezed == maxHeartRate
          ? _value.maxHeartRate
          : maxHeartRate // ignore: cast_nullable_to_non_nullable
              as int?,
      heartRateZones: freezed == heartRateZones
          ? _value._heartRateZones
          : heartRateZones // ignore: cast_nullable_to_non_nullable
              as List<HeartRateZone>?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: freezed == additionalData
          ? _value._additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FitnessActivityImpl implements _FitnessActivity {
  const _$FitnessActivityImpl(
      {required this.activityId,
      required this.deviceId,
      required this.type,
      required this.startTime,
      required this.endTime,
      required this.duration,
      this.steps,
      this.distance,
      this.calories,
      this.averageHeartRate,
      this.maxHeartRate,
      final List<HeartRateZone>? heartRateZones,
      this.route,
      final Map<String, dynamic>? additionalData})
      : _heartRateZones = heartRateZones,
        _additionalData = additionalData;

  factory _$FitnessActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$FitnessActivityImplFromJson(json);

  @override
  final String activityId;
  @override
  final String deviceId;
  @override
  final ActivityType type;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final int duration;
// in minutes
  @override
  final int? steps;
  @override
  final double? distance;
  @override
  final int? calories;
  @override
  final int? averageHeartRate;
  @override
  final int? maxHeartRate;
  final List<HeartRateZone>? _heartRateZones;
  @override
  List<HeartRateZone>? get heartRateZones {
    final value = _heartRateZones;
    if (value == null) return null;
    if (_heartRateZones is EqualUnmodifiableListView) return _heartRateZones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? route;
  final Map<String, dynamic>? _additionalData;
  @override
  Map<String, dynamic>? get additionalData {
    final value = _additionalData;
    if (value == null) return null;
    if (_additionalData is EqualUnmodifiableMapView) return _additionalData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'FitnessActivity(activityId: $activityId, deviceId: $deviceId, type: $type, startTime: $startTime, endTime: $endTime, duration: $duration, steps: $steps, distance: $distance, calories: $calories, averageHeartRate: $averageHeartRate, maxHeartRate: $maxHeartRate, heartRateZones: $heartRateZones, route: $route, additionalData: $additionalData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FitnessActivityImpl &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.steps, steps) || other.steps == steps) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.averageHeartRate, averageHeartRate) ||
                other.averageHeartRate == averageHeartRate) &&
            (identical(other.maxHeartRate, maxHeartRate) ||
                other.maxHeartRate == maxHeartRate) &&
            const DeepCollectionEquality()
                .equals(other._heartRateZones, _heartRateZones) &&
            (identical(other.route, route) || other.route == route) &&
            const DeepCollectionEquality()
                .equals(other._additionalData, _additionalData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activityId,
      deviceId,
      type,
      startTime,
      endTime,
      duration,
      steps,
      distance,
      calories,
      averageHeartRate,
      maxHeartRate,
      const DeepCollectionEquality().hash(_heartRateZones),
      route,
      const DeepCollectionEquality().hash(_additionalData));

  /// Create a copy of FitnessActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FitnessActivityImplCopyWith<_$FitnessActivityImpl> get copyWith =>
      __$$FitnessActivityImplCopyWithImpl<_$FitnessActivityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FitnessActivityImplToJson(
      this,
    );
  }
}

abstract class _FitnessActivity implements FitnessActivity {
  const factory _FitnessActivity(
      {required final String activityId,
      required final String deviceId,
      required final ActivityType type,
      required final DateTime startTime,
      required final DateTime endTime,
      required final int duration,
      final int? steps,
      final double? distance,
      final int? calories,
      final int? averageHeartRate,
      final int? maxHeartRate,
      final List<HeartRateZone>? heartRateZones,
      final String? route,
      final Map<String, dynamic>? additionalData}) = _$FitnessActivityImpl;

  factory _FitnessActivity.fromJson(Map<String, dynamic> json) =
      _$FitnessActivityImpl.fromJson;

  @override
  String get activityId;
  @override
  String get deviceId;
  @override
  ActivityType get type;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  int get duration; // in minutes
  @override
  int? get steps;
  @override
  double? get distance;
  @override
  int? get calories;
  @override
  int? get averageHeartRate;
  @override
  int? get maxHeartRate;
  @override
  List<HeartRateZone>? get heartRateZones;
  @override
  String? get route;
  @override
  Map<String, dynamic>? get additionalData;

  /// Create a copy of FitnessActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FitnessActivityImplCopyWith<_$FitnessActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SmartWatchNotification _$SmartWatchNotificationFromJson(
    Map<String, dynamic> json) {
  return _SmartWatchNotification.fromJson(json);
}

/// @nodoc
mixin _$SmartWatchNotification {
  String get notificationId => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DateTime? get scheduledTime => throw _privateConstructorUsedError;
  bool get isSent => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  String? get actionData => throw _privateConstructorUsedError;
  Map<String, dynamic>? get customData => throw _privateConstructorUsedError;

  /// Serializes this SmartWatchNotification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SmartWatchNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SmartWatchNotificationCopyWith<SmartWatchNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartWatchNotificationCopyWith<$Res> {
  factory $SmartWatchNotificationCopyWith(SmartWatchNotification value,
          $Res Function(SmartWatchNotification) then) =
      _$SmartWatchNotificationCopyWithImpl<$Res, SmartWatchNotification>;
  @useResult
  $Res call(
      {String notificationId,
      String deviceId,
      NotificationType type,
      String title,
      String message,
      DateTime? scheduledTime,
      bool isSent,
      bool isRead,
      String? actionData,
      Map<String, dynamic>? customData});
}

/// @nodoc
class _$SmartWatchNotificationCopyWithImpl<$Res,
        $Val extends SmartWatchNotification>
    implements $SmartWatchNotificationCopyWith<$Res> {
  _$SmartWatchNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SmartWatchNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? deviceId = null,
    Object? type = null,
    Object? title = null,
    Object? message = null,
    Object? scheduledTime = freezed,
    Object? isSent = null,
    Object? isRead = null,
    Object? actionData = freezed,
    Object? customData = freezed,
  }) {
    return _then(_value.copyWith(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledTime: freezed == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSent: null == isSent
          ? _value.isSent
          : isSent // ignore: cast_nullable_to_non_nullable
              as bool,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      actionData: freezed == actionData
          ? _value.actionData
          : actionData // ignore: cast_nullable_to_non_nullable
              as String?,
      customData: freezed == customData
          ? _value.customData
          : customData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmartWatchNotificationImplCopyWith<$Res>
    implements $SmartWatchNotificationCopyWith<$Res> {
  factory _$$SmartWatchNotificationImplCopyWith(
          _$SmartWatchNotificationImpl value,
          $Res Function(_$SmartWatchNotificationImpl) then) =
      __$$SmartWatchNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String notificationId,
      String deviceId,
      NotificationType type,
      String title,
      String message,
      DateTime? scheduledTime,
      bool isSent,
      bool isRead,
      String? actionData,
      Map<String, dynamic>? customData});
}

/// @nodoc
class __$$SmartWatchNotificationImplCopyWithImpl<$Res>
    extends _$SmartWatchNotificationCopyWithImpl<$Res,
        _$SmartWatchNotificationImpl>
    implements _$$SmartWatchNotificationImplCopyWith<$Res> {
  __$$SmartWatchNotificationImplCopyWithImpl(
      _$SmartWatchNotificationImpl _value,
      $Res Function(_$SmartWatchNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmartWatchNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? deviceId = null,
    Object? type = null,
    Object? title = null,
    Object? message = null,
    Object? scheduledTime = freezed,
    Object? isSent = null,
    Object? isRead = null,
    Object? actionData = freezed,
    Object? customData = freezed,
  }) {
    return _then(_$SmartWatchNotificationImpl(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledTime: freezed == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSent: null == isSent
          ? _value.isSent
          : isSent // ignore: cast_nullable_to_non_nullable
              as bool,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      actionData: freezed == actionData
          ? _value.actionData
          : actionData // ignore: cast_nullable_to_non_nullable
              as String?,
      customData: freezed == customData
          ? _value._customData
          : customData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SmartWatchNotificationImpl implements _SmartWatchNotification {
  const _$SmartWatchNotificationImpl(
      {required this.notificationId,
      required this.deviceId,
      required this.type,
      required this.title,
      required this.message,
      this.scheduledTime,
      this.isSent = false,
      this.isRead = false,
      this.actionData,
      final Map<String, dynamic>? customData})
      : _customData = customData;

  factory _$SmartWatchNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmartWatchNotificationImplFromJson(json);

  @override
  final String notificationId;
  @override
  final String deviceId;
  @override
  final NotificationType type;
  @override
  final String title;
  @override
  final String message;
  @override
  final DateTime? scheduledTime;
  @override
  @JsonKey()
  final bool isSent;
  @override
  @JsonKey()
  final bool isRead;
  @override
  final String? actionData;
  final Map<String, dynamic>? _customData;
  @override
  Map<String, dynamic>? get customData {
    final value = _customData;
    if (value == null) return null;
    if (_customData is EqualUnmodifiableMapView) return _customData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SmartWatchNotification(notificationId: $notificationId, deviceId: $deviceId, type: $type, title: $title, message: $message, scheduledTime: $scheduledTime, isSent: $isSent, isRead: $isRead, actionData: $actionData, customData: $customData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmartWatchNotificationImpl &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.isSent, isSent) || other.isSent == isSent) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.actionData, actionData) ||
                other.actionData == actionData) &&
            const DeepCollectionEquality()
                .equals(other._customData, _customData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      notificationId,
      deviceId,
      type,
      title,
      message,
      scheduledTime,
      isSent,
      isRead,
      actionData,
      const DeepCollectionEquality().hash(_customData));

  /// Create a copy of SmartWatchNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SmartWatchNotificationImplCopyWith<_$SmartWatchNotificationImpl>
      get copyWith => __$$SmartWatchNotificationImplCopyWithImpl<
          _$SmartWatchNotificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmartWatchNotificationImplToJson(
      this,
    );
  }
}

abstract class _SmartWatchNotification implements SmartWatchNotification {
  const factory _SmartWatchNotification(
      {required final String notificationId,
      required final String deviceId,
      required final NotificationType type,
      required final String title,
      required final String message,
      final DateTime? scheduledTime,
      final bool isSent,
      final bool isRead,
      final String? actionData,
      final Map<String, dynamic>? customData}) = _$SmartWatchNotificationImpl;

  factory _SmartWatchNotification.fromJson(Map<String, dynamic> json) =
      _$SmartWatchNotificationImpl.fromJson;

  @override
  String get notificationId;
  @override
  String get deviceId;
  @override
  NotificationType get type;
  @override
  String get title;
  @override
  String get message;
  @override
  DateTime? get scheduledTime;
  @override
  bool get isSent;
  @override
  bool get isRead;
  @override
  String? get actionData;
  @override
  Map<String, dynamic>? get customData;

  /// Create a copy of SmartWatchNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SmartWatchNotificationImplCopyWith<_$SmartWatchNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OrderReminder _$OrderReminderFromJson(Map<String, dynamic> json) {
  return _OrderReminder.fromJson(json);
}

/// @nodoc
mixin _$OrderReminder {
  String get orderId => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  String get restaurantName => throw _privateConstructorUsedError;
  DateTime get reminderTime => throw _privateConstructorUsedError;
  ReminderType get type => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool get isSent => throw _privateConstructorUsedError;
  bool get isAcknowledged => throw _privateConstructorUsedError;

  /// Serializes this OrderReminder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderReminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderReminderCopyWith<OrderReminder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderReminderCopyWith<$Res> {
  factory $OrderReminderCopyWith(
          OrderReminder value, $Res Function(OrderReminder) then) =
      _$OrderReminderCopyWithImpl<$Res, OrderReminder>;
  @useResult
  $Res call(
      {String orderId,
      String deviceId,
      String restaurantName,
      DateTime reminderTime,
      ReminderType type,
      String? message,
      bool isSent,
      bool isAcknowledged});
}

/// @nodoc
class _$OrderReminderCopyWithImpl<$Res, $Val extends OrderReminder>
    implements $OrderReminderCopyWith<$Res> {
  _$OrderReminderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderReminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? deviceId = null,
    Object? restaurantName = null,
    Object? reminderTime = null,
    Object? type = null,
    Object? message = freezed,
    Object? isSent = null,
    Object? isAcknowledged = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      reminderTime: null == reminderTime
          ? _value.reminderTime
          : reminderTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReminderType,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      isSent: null == isSent
          ? _value.isSent
          : isSent // ignore: cast_nullable_to_non_nullable
              as bool,
      isAcknowledged: null == isAcknowledged
          ? _value.isAcknowledged
          : isAcknowledged // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderReminderImplCopyWith<$Res>
    implements $OrderReminderCopyWith<$Res> {
  factory _$$OrderReminderImplCopyWith(
          _$OrderReminderImpl value, $Res Function(_$OrderReminderImpl) then) =
      __$$OrderReminderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderId,
      String deviceId,
      String restaurantName,
      DateTime reminderTime,
      ReminderType type,
      String? message,
      bool isSent,
      bool isAcknowledged});
}

/// @nodoc
class __$$OrderReminderImplCopyWithImpl<$Res>
    extends _$OrderReminderCopyWithImpl<$Res, _$OrderReminderImpl>
    implements _$$OrderReminderImplCopyWith<$Res> {
  __$$OrderReminderImplCopyWithImpl(
      _$OrderReminderImpl _value, $Res Function(_$OrderReminderImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderReminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? deviceId = null,
    Object? restaurantName = null,
    Object? reminderTime = null,
    Object? type = null,
    Object? message = freezed,
    Object? isSent = null,
    Object? isAcknowledged = null,
  }) {
    return _then(_$OrderReminderImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      reminderTime: null == reminderTime
          ? _value.reminderTime
          : reminderTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReminderType,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      isSent: null == isSent
          ? _value.isSent
          : isSent // ignore: cast_nullable_to_non_nullable
              as bool,
      isAcknowledged: null == isAcknowledged
          ? _value.isAcknowledged
          : isAcknowledged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderReminderImpl implements _OrderReminder {
  const _$OrderReminderImpl(
      {required this.orderId,
      required this.deviceId,
      required this.restaurantName,
      required this.reminderTime,
      required this.type,
      this.message,
      this.isSent = false,
      this.isAcknowledged = false});

  factory _$OrderReminderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderReminderImplFromJson(json);

  @override
  final String orderId;
  @override
  final String deviceId;
  @override
  final String restaurantName;
  @override
  final DateTime reminderTime;
  @override
  final ReminderType type;
  @override
  final String? message;
  @override
  @JsonKey()
  final bool isSent;
  @override
  @JsonKey()
  final bool isAcknowledged;

  @override
  String toString() {
    return 'OrderReminder(orderId: $orderId, deviceId: $deviceId, restaurantName: $restaurantName, reminderTime: $reminderTime, type: $type, message: $message, isSent: $isSent, isAcknowledged: $isAcknowledged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderReminderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            (identical(other.reminderTime, reminderTime) ||
                other.reminderTime == reminderTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isSent, isSent) || other.isSent == isSent) &&
            (identical(other.isAcknowledged, isAcknowledged) ||
                other.isAcknowledged == isAcknowledged));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, deviceId,
      restaurantName, reminderTime, type, message, isSent, isAcknowledged);

  /// Create a copy of OrderReminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderReminderImplCopyWith<_$OrderReminderImpl> get copyWith =>
      __$$OrderReminderImplCopyWithImpl<_$OrderReminderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderReminderImplToJson(
      this,
    );
  }
}

abstract class _OrderReminder implements OrderReminder {
  const factory _OrderReminder(
      {required final String orderId,
      required final String deviceId,
      required final String restaurantName,
      required final DateTime reminderTime,
      required final ReminderType type,
      final String? message,
      final bool isSent,
      final bool isAcknowledged}) = _$OrderReminderImpl;

  factory _OrderReminder.fromJson(Map<String, dynamic> json) =
      _$OrderReminderImpl.fromJson;

  @override
  String get orderId;
  @override
  String get deviceId;
  @override
  String get restaurantName;
  @override
  DateTime get reminderTime;
  @override
  ReminderType get type;
  @override
  String? get message;
  @override
  bool get isSent;
  @override
  bool get isAcknowledged;

  /// Create a copy of OrderReminder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderReminderImplCopyWith<_$OrderReminderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WearableSettings _$WearableSettingsFromJson(Map<String, dynamic> json) {
  return _WearableSettings.fromJson(json);
}

/// @nodoc
mixin _$WearableSettings {
  String get deviceId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  bool get enableHealthTracking => throw _privateConstructorUsedError;
  bool get enableOrderNotifications => throw _privateConstructorUsedError;
  bool get enableFitnessTracking => throw _privateConstructorUsedError;
  bool get enableQuickOrders => throw _privateConstructorUsedError;
  int get syncIntervalMinutes => throw _privateConstructorUsedError;
  List<String> get enabledNotificationTypes =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> get customSettings => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this WearableSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WearableSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WearableSettingsCopyWith<WearableSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WearableSettingsCopyWith<$Res> {
  factory $WearableSettingsCopyWith(
          WearableSettings value, $Res Function(WearableSettings) then) =
      _$WearableSettingsCopyWithImpl<$Res, WearableSettings>;
  @useResult
  $Res call(
      {String deviceId,
      String userId,
      bool enableHealthTracking,
      bool enableOrderNotifications,
      bool enableFitnessTracking,
      bool enableQuickOrders,
      int syncIntervalMinutes,
      List<String> enabledNotificationTypes,
      Map<String, dynamic> customSettings,
      DateTime? lastUpdated});
}

/// @nodoc
class _$WearableSettingsCopyWithImpl<$Res, $Val extends WearableSettings>
    implements $WearableSettingsCopyWith<$Res> {
  _$WearableSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WearableSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? userId = null,
    Object? enableHealthTracking = null,
    Object? enableOrderNotifications = null,
    Object? enableFitnessTracking = null,
    Object? enableQuickOrders = null,
    Object? syncIntervalMinutes = null,
    Object? enabledNotificationTypes = null,
    Object? customSettings = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      enableHealthTracking: null == enableHealthTracking
          ? _value.enableHealthTracking
          : enableHealthTracking // ignore: cast_nullable_to_non_nullable
              as bool,
      enableOrderNotifications: null == enableOrderNotifications
          ? _value.enableOrderNotifications
          : enableOrderNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      enableFitnessTracking: null == enableFitnessTracking
          ? _value.enableFitnessTracking
          : enableFitnessTracking // ignore: cast_nullable_to_non_nullable
              as bool,
      enableQuickOrders: null == enableQuickOrders
          ? _value.enableQuickOrders
          : enableQuickOrders // ignore: cast_nullable_to_non_nullable
              as bool,
      syncIntervalMinutes: null == syncIntervalMinutes
          ? _value.syncIntervalMinutes
          : syncIntervalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      enabledNotificationTypes: null == enabledNotificationTypes
          ? _value.enabledNotificationTypes
          : enabledNotificationTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customSettings: null == customSettings
          ? _value.customSettings
          : customSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WearableSettingsImplCopyWith<$Res>
    implements $WearableSettingsCopyWith<$Res> {
  factory _$$WearableSettingsImplCopyWith(_$WearableSettingsImpl value,
          $Res Function(_$WearableSettingsImpl) then) =
      __$$WearableSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String deviceId,
      String userId,
      bool enableHealthTracking,
      bool enableOrderNotifications,
      bool enableFitnessTracking,
      bool enableQuickOrders,
      int syncIntervalMinutes,
      List<String> enabledNotificationTypes,
      Map<String, dynamic> customSettings,
      DateTime? lastUpdated});
}

/// @nodoc
class __$$WearableSettingsImplCopyWithImpl<$Res>
    extends _$WearableSettingsCopyWithImpl<$Res, _$WearableSettingsImpl>
    implements _$$WearableSettingsImplCopyWith<$Res> {
  __$$WearableSettingsImplCopyWithImpl(_$WearableSettingsImpl _value,
      $Res Function(_$WearableSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of WearableSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? userId = null,
    Object? enableHealthTracking = null,
    Object? enableOrderNotifications = null,
    Object? enableFitnessTracking = null,
    Object? enableQuickOrders = null,
    Object? syncIntervalMinutes = null,
    Object? enabledNotificationTypes = null,
    Object? customSettings = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$WearableSettingsImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      enableHealthTracking: null == enableHealthTracking
          ? _value.enableHealthTracking
          : enableHealthTracking // ignore: cast_nullable_to_non_nullable
              as bool,
      enableOrderNotifications: null == enableOrderNotifications
          ? _value.enableOrderNotifications
          : enableOrderNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      enableFitnessTracking: null == enableFitnessTracking
          ? _value.enableFitnessTracking
          : enableFitnessTracking // ignore: cast_nullable_to_non_nullable
              as bool,
      enableQuickOrders: null == enableQuickOrders
          ? _value.enableQuickOrders
          : enableQuickOrders // ignore: cast_nullable_to_non_nullable
              as bool,
      syncIntervalMinutes: null == syncIntervalMinutes
          ? _value.syncIntervalMinutes
          : syncIntervalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      enabledNotificationTypes: null == enabledNotificationTypes
          ? _value._enabledNotificationTypes
          : enabledNotificationTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customSettings: null == customSettings
          ? _value._customSettings
          : customSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WearableSettingsImpl implements _WearableSettings {
  const _$WearableSettingsImpl(
      {required this.deviceId,
      required this.userId,
      this.enableHealthTracking = true,
      this.enableOrderNotifications = true,
      this.enableFitnessTracking = true,
      this.enableQuickOrders = true,
      this.syncIntervalMinutes = 30,
      final List<String> enabledNotificationTypes = const [],
      final Map<String, dynamic> customSettings = const {},
      this.lastUpdated})
      : _enabledNotificationTypes = enabledNotificationTypes,
        _customSettings = customSettings;

  factory _$WearableSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WearableSettingsImplFromJson(json);

  @override
  final String deviceId;
  @override
  final String userId;
  @override
  @JsonKey()
  final bool enableHealthTracking;
  @override
  @JsonKey()
  final bool enableOrderNotifications;
  @override
  @JsonKey()
  final bool enableFitnessTracking;
  @override
  @JsonKey()
  final bool enableQuickOrders;
  @override
  @JsonKey()
  final int syncIntervalMinutes;
  final List<String> _enabledNotificationTypes;
  @override
  @JsonKey()
  List<String> get enabledNotificationTypes {
    if (_enabledNotificationTypes is EqualUnmodifiableListView)
      return _enabledNotificationTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_enabledNotificationTypes);
  }

  final Map<String, dynamic> _customSettings;
  @override
  @JsonKey()
  Map<String, dynamic> get customSettings {
    if (_customSettings is EqualUnmodifiableMapView) return _customSettings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_customSettings);
  }

  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'WearableSettings(deviceId: $deviceId, userId: $userId, enableHealthTracking: $enableHealthTracking, enableOrderNotifications: $enableOrderNotifications, enableFitnessTracking: $enableFitnessTracking, enableQuickOrders: $enableQuickOrders, syncIntervalMinutes: $syncIntervalMinutes, enabledNotificationTypes: $enabledNotificationTypes, customSettings: $customSettings, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WearableSettingsImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.enableHealthTracking, enableHealthTracking) ||
                other.enableHealthTracking == enableHealthTracking) &&
            (identical(
                    other.enableOrderNotifications, enableOrderNotifications) ||
                other.enableOrderNotifications == enableOrderNotifications) &&
            (identical(other.enableFitnessTracking, enableFitnessTracking) ||
                other.enableFitnessTracking == enableFitnessTracking) &&
            (identical(other.enableQuickOrders, enableQuickOrders) ||
                other.enableQuickOrders == enableQuickOrders) &&
            (identical(other.syncIntervalMinutes, syncIntervalMinutes) ||
                other.syncIntervalMinutes == syncIntervalMinutes) &&
            const DeepCollectionEquality().equals(
                other._enabledNotificationTypes, _enabledNotificationTypes) &&
            const DeepCollectionEquality()
                .equals(other._customSettings, _customSettings) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deviceId,
      userId,
      enableHealthTracking,
      enableOrderNotifications,
      enableFitnessTracking,
      enableQuickOrders,
      syncIntervalMinutes,
      const DeepCollectionEquality().hash(_enabledNotificationTypes),
      const DeepCollectionEquality().hash(_customSettings),
      lastUpdated);

  /// Create a copy of WearableSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WearableSettingsImplCopyWith<_$WearableSettingsImpl> get copyWith =>
      __$$WearableSettingsImplCopyWithImpl<_$WearableSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WearableSettingsImplToJson(
      this,
    );
  }
}

abstract class _WearableSettings implements WearableSettings {
  const factory _WearableSettings(
      {required final String deviceId,
      required final String userId,
      final bool enableHealthTracking,
      final bool enableOrderNotifications,
      final bool enableFitnessTracking,
      final bool enableQuickOrders,
      final int syncIntervalMinutes,
      final List<String> enabledNotificationTypes,
      final Map<String, dynamic> customSettings,
      final DateTime? lastUpdated}) = _$WearableSettingsImpl;

  factory _WearableSettings.fromJson(Map<String, dynamic> json) =
      _$WearableSettingsImpl.fromJson;

  @override
  String get deviceId;
  @override
  String get userId;
  @override
  bool get enableHealthTracking;
  @override
  bool get enableOrderNotifications;
  @override
  bool get enableFitnessTracking;
  @override
  bool get enableQuickOrders;
  @override
  int get syncIntervalMinutes;
  @override
  List<String> get enabledNotificationTypes;
  @override
  Map<String, dynamic> get customSettings;
  @override
  DateTime? get lastUpdated;

  /// Create a copy of WearableSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WearableSettingsImplCopyWith<_$WearableSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WearableWorkout _$WearableWorkoutFromJson(Map<String, dynamic> json) {
  return _WearableWorkout.fromJson(json);
}

/// @nodoc
mixin _$WearableWorkout {
  String get workoutId => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  WorkoutType get type => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  int? get calories => throw _privateConstructorUsedError;
  int? get averageHeartRate => throw _privateConstructorUsedError;
  int? get maxHeartRate => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  List<WorkoutInterval>? get intervals => throw _privateConstructorUsedError;
  Map<String, dynamic>? get summary => throw _privateConstructorUsedError;

  /// Serializes this WearableWorkout to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WearableWorkout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WearableWorkoutCopyWith<WearableWorkout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WearableWorkoutCopyWith<$Res> {
  factory $WearableWorkoutCopyWith(
          WearableWorkout value, $Res Function(WearableWorkout) then) =
      _$WearableWorkoutCopyWithImpl<$Res, WearableWorkout>;
  @useResult
  $Res call(
      {String workoutId,
      String deviceId,
      WorkoutType type,
      DateTime startTime,
      DateTime endTime,
      int duration,
      int? calories,
      int? averageHeartRate,
      int? maxHeartRate,
      double? distance,
      List<WorkoutInterval>? intervals,
      Map<String, dynamic>? summary});
}

/// @nodoc
class _$WearableWorkoutCopyWithImpl<$Res, $Val extends WearableWorkout>
    implements $WearableWorkoutCopyWith<$Res> {
  _$WearableWorkoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WearableWorkout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workoutId = null,
    Object? deviceId = null,
    Object? type = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? duration = null,
    Object? calories = freezed,
    Object? averageHeartRate = freezed,
    Object? maxHeartRate = freezed,
    Object? distance = freezed,
    Object? intervals = freezed,
    Object? summary = freezed,
  }) {
    return _then(_value.copyWith(
      workoutId: null == workoutId
          ? _value.workoutId
          : workoutId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WorkoutType,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int?,
      averageHeartRate: freezed == averageHeartRate
          ? _value.averageHeartRate
          : averageHeartRate // ignore: cast_nullable_to_non_nullable
              as int?,
      maxHeartRate: freezed == maxHeartRate
          ? _value.maxHeartRate
          : maxHeartRate // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      intervals: freezed == intervals
          ? _value.intervals
          : intervals // ignore: cast_nullable_to_non_nullable
              as List<WorkoutInterval>?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WearableWorkoutImplCopyWith<$Res>
    implements $WearableWorkoutCopyWith<$Res> {
  factory _$$WearableWorkoutImplCopyWith(_$WearableWorkoutImpl value,
          $Res Function(_$WearableWorkoutImpl) then) =
      __$$WearableWorkoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String workoutId,
      String deviceId,
      WorkoutType type,
      DateTime startTime,
      DateTime endTime,
      int duration,
      int? calories,
      int? averageHeartRate,
      int? maxHeartRate,
      double? distance,
      List<WorkoutInterval>? intervals,
      Map<String, dynamic>? summary});
}

/// @nodoc
class __$$WearableWorkoutImplCopyWithImpl<$Res>
    extends _$WearableWorkoutCopyWithImpl<$Res, _$WearableWorkoutImpl>
    implements _$$WearableWorkoutImplCopyWith<$Res> {
  __$$WearableWorkoutImplCopyWithImpl(
      _$WearableWorkoutImpl _value, $Res Function(_$WearableWorkoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of WearableWorkout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workoutId = null,
    Object? deviceId = null,
    Object? type = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? duration = null,
    Object? calories = freezed,
    Object? averageHeartRate = freezed,
    Object? maxHeartRate = freezed,
    Object? distance = freezed,
    Object? intervals = freezed,
    Object? summary = freezed,
  }) {
    return _then(_$WearableWorkoutImpl(
      workoutId: null == workoutId
          ? _value.workoutId
          : workoutId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WorkoutType,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int?,
      averageHeartRate: freezed == averageHeartRate
          ? _value.averageHeartRate
          : averageHeartRate // ignore: cast_nullable_to_non_nullable
              as int?,
      maxHeartRate: freezed == maxHeartRate
          ? _value.maxHeartRate
          : maxHeartRate // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      intervals: freezed == intervals
          ? _value._intervals
          : intervals // ignore: cast_nullable_to_non_nullable
              as List<WorkoutInterval>?,
      summary: freezed == summary
          ? _value._summary
          : summary // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WearableWorkoutImpl implements _WearableWorkout {
  const _$WearableWorkoutImpl(
      {required this.workoutId,
      required this.deviceId,
      required this.type,
      required this.startTime,
      required this.endTime,
      required this.duration,
      this.calories,
      this.averageHeartRate,
      this.maxHeartRate,
      this.distance,
      final List<WorkoutInterval>? intervals,
      final Map<String, dynamic>? summary})
      : _intervals = intervals,
        _summary = summary;

  factory _$WearableWorkoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$WearableWorkoutImplFromJson(json);

  @override
  final String workoutId;
  @override
  final String deviceId;
  @override
  final WorkoutType type;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final int duration;
  @override
  final int? calories;
  @override
  final int? averageHeartRate;
  @override
  final int? maxHeartRate;
  @override
  final double? distance;
  final List<WorkoutInterval>? _intervals;
  @override
  List<WorkoutInterval>? get intervals {
    final value = _intervals;
    if (value == null) return null;
    if (_intervals is EqualUnmodifiableListView) return _intervals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _summary;
  @override
  Map<String, dynamic>? get summary {
    final value = _summary;
    if (value == null) return null;
    if (_summary is EqualUnmodifiableMapView) return _summary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'WearableWorkout(workoutId: $workoutId, deviceId: $deviceId, type: $type, startTime: $startTime, endTime: $endTime, duration: $duration, calories: $calories, averageHeartRate: $averageHeartRate, maxHeartRate: $maxHeartRate, distance: $distance, intervals: $intervals, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WearableWorkoutImpl &&
            (identical(other.workoutId, workoutId) ||
                other.workoutId == workoutId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.averageHeartRate, averageHeartRate) ||
                other.averageHeartRate == averageHeartRate) &&
            (identical(other.maxHeartRate, maxHeartRate) ||
                other.maxHeartRate == maxHeartRate) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            const DeepCollectionEquality()
                .equals(other._intervals, _intervals) &&
            const DeepCollectionEquality().equals(other._summary, _summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      workoutId,
      deviceId,
      type,
      startTime,
      endTime,
      duration,
      calories,
      averageHeartRate,
      maxHeartRate,
      distance,
      const DeepCollectionEquality().hash(_intervals),
      const DeepCollectionEquality().hash(_summary));

  /// Create a copy of WearableWorkout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WearableWorkoutImplCopyWith<_$WearableWorkoutImpl> get copyWith =>
      __$$WearableWorkoutImplCopyWithImpl<_$WearableWorkoutImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WearableWorkoutImplToJson(
      this,
    );
  }
}

abstract class _WearableWorkout implements WearableWorkout {
  const factory _WearableWorkout(
      {required final String workoutId,
      required final String deviceId,
      required final WorkoutType type,
      required final DateTime startTime,
      required final DateTime endTime,
      required final int duration,
      final int? calories,
      final int? averageHeartRate,
      final int? maxHeartRate,
      final double? distance,
      final List<WorkoutInterval>? intervals,
      final Map<String, dynamic>? summary}) = _$WearableWorkoutImpl;

  factory _WearableWorkout.fromJson(Map<String, dynamic> json) =
      _$WearableWorkoutImpl.fromJson;

  @override
  String get workoutId;
  @override
  String get deviceId;
  @override
  WorkoutType get type;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  int get duration;
  @override
  int? get calories;
  @override
  int? get averageHeartRate;
  @override
  int? get maxHeartRate;
  @override
  double? get distance;
  @override
  List<WorkoutInterval>? get intervals;
  @override
  Map<String, dynamic>? get summary;

  /// Create a copy of WearableWorkout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WearableWorkoutImplCopyWith<_$WearableWorkoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkoutInterval _$WorkoutIntervalFromJson(Map<String, dynamic> json) {
  return _WorkoutInterval.fromJson(json);
}

/// @nodoc
mixin _$WorkoutInterval {
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  int? get heartRate => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  int? get calories => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this WorkoutInterval to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutInterval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutIntervalCopyWith<WorkoutInterval> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutIntervalCopyWith<$Res> {
  factory $WorkoutIntervalCopyWith(
          WorkoutInterval value, $Res Function(WorkoutInterval) then) =
      _$WorkoutIntervalCopyWithImpl<$Res, WorkoutInterval>;
  @useResult
  $Res call(
      {DateTime startTime,
      DateTime endTime,
      int duration,
      int? heartRate,
      double? distance,
      int? calories,
      String? notes});
}

/// @nodoc
class _$WorkoutIntervalCopyWithImpl<$Res, $Val extends WorkoutInterval>
    implements $WorkoutIntervalCopyWith<$Res> {
  _$WorkoutIntervalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutInterval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? duration = null,
    Object? heartRate = freezed,
    Object? distance = freezed,
    Object? calories = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      heartRate: freezed == heartRate
          ? _value.heartRate
          : heartRate // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutIntervalImplCopyWith<$Res>
    implements $WorkoutIntervalCopyWith<$Res> {
  factory _$$WorkoutIntervalImplCopyWith(_$WorkoutIntervalImpl value,
          $Res Function(_$WorkoutIntervalImpl) then) =
      __$$WorkoutIntervalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime startTime,
      DateTime endTime,
      int duration,
      int? heartRate,
      double? distance,
      int? calories,
      String? notes});
}

/// @nodoc
class __$$WorkoutIntervalImplCopyWithImpl<$Res>
    extends _$WorkoutIntervalCopyWithImpl<$Res, _$WorkoutIntervalImpl>
    implements _$$WorkoutIntervalImplCopyWith<$Res> {
  __$$WorkoutIntervalImplCopyWithImpl(
      _$WorkoutIntervalImpl _value, $Res Function(_$WorkoutIntervalImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutInterval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? duration = null,
    Object? heartRate = freezed,
    Object? distance = freezed,
    Object? calories = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$WorkoutIntervalImpl(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      heartRate: freezed == heartRate
          ? _value.heartRate
          : heartRate // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutIntervalImpl implements _WorkoutInterval {
  const _$WorkoutIntervalImpl(
      {required this.startTime,
      required this.endTime,
      required this.duration,
      this.heartRate,
      this.distance,
      this.calories,
      this.notes});

  factory _$WorkoutIntervalImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutIntervalImplFromJson(json);

  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final int duration;
  @override
  final int? heartRate;
  @override
  final double? distance;
  @override
  final int? calories;
  @override
  final String? notes;

  @override
  String toString() {
    return 'WorkoutInterval(startTime: $startTime, endTime: $endTime, duration: $duration, heartRate: $heartRate, distance: $distance, calories: $calories, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutIntervalImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.heartRate, heartRate) ||
                other.heartRate == heartRate) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startTime, endTime, duration,
      heartRate, distance, calories, notes);

  /// Create a copy of WorkoutInterval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutIntervalImplCopyWith<_$WorkoutIntervalImpl> get copyWith =>
      __$$WorkoutIntervalImplCopyWithImpl<_$WorkoutIntervalImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutIntervalImplToJson(
      this,
    );
  }
}

abstract class _WorkoutInterval implements WorkoutInterval {
  const factory _WorkoutInterval(
      {required final DateTime startTime,
      required final DateTime endTime,
      required final int duration,
      final int? heartRate,
      final double? distance,
      final int? calories,
      final String? notes}) = _$WorkoutIntervalImpl;

  factory _WorkoutInterval.fromJson(Map<String, dynamic> json) =
      _$WorkoutIntervalImpl.fromJson;

  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  int get duration;
  @override
  int? get heartRate;
  @override
  double? get distance;
  @override
  int? get calories;
  @override
  String? get notes;

  /// Create a copy of WorkoutInterval
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutIntervalImplCopyWith<_$WorkoutIntervalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HeartRateZone _$HeartRateZoneFromJson(Map<String, dynamic> json) {
  return _HeartRateZone.fromJson(json);
}

/// @nodoc
mixin _$HeartRateZone {
  String get zoneName => throw _privateConstructorUsedError;
  int get minHeartRate => throw _privateConstructorUsedError;
  int get maxHeartRate => throw _privateConstructorUsedError;
  int get timeInZone => throw _privateConstructorUsedError; // minutes
  double get percentageOfWorkout => throw _privateConstructorUsedError;

  /// Serializes this HeartRateZone to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HeartRateZone
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HeartRateZoneCopyWith<HeartRateZone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeartRateZoneCopyWith<$Res> {
  factory $HeartRateZoneCopyWith(
          HeartRateZone value, $Res Function(HeartRateZone) then) =
      _$HeartRateZoneCopyWithImpl<$Res, HeartRateZone>;
  @useResult
  $Res call(
      {String zoneName,
      int minHeartRate,
      int maxHeartRate,
      int timeInZone,
      double percentageOfWorkout});
}

/// @nodoc
class _$HeartRateZoneCopyWithImpl<$Res, $Val extends HeartRateZone>
    implements $HeartRateZoneCopyWith<$Res> {
  _$HeartRateZoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HeartRateZone
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zoneName = null,
    Object? minHeartRate = null,
    Object? maxHeartRate = null,
    Object? timeInZone = null,
    Object? percentageOfWorkout = null,
  }) {
    return _then(_value.copyWith(
      zoneName: null == zoneName
          ? _value.zoneName
          : zoneName // ignore: cast_nullable_to_non_nullable
              as String,
      minHeartRate: null == minHeartRate
          ? _value.minHeartRate
          : minHeartRate // ignore: cast_nullable_to_non_nullable
              as int,
      maxHeartRate: null == maxHeartRate
          ? _value.maxHeartRate
          : maxHeartRate // ignore: cast_nullable_to_non_nullable
              as int,
      timeInZone: null == timeInZone
          ? _value.timeInZone
          : timeInZone // ignore: cast_nullable_to_non_nullable
              as int,
      percentageOfWorkout: null == percentageOfWorkout
          ? _value.percentageOfWorkout
          : percentageOfWorkout // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HeartRateZoneImplCopyWith<$Res>
    implements $HeartRateZoneCopyWith<$Res> {
  factory _$$HeartRateZoneImplCopyWith(
          _$HeartRateZoneImpl value, $Res Function(_$HeartRateZoneImpl) then) =
      __$$HeartRateZoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String zoneName,
      int minHeartRate,
      int maxHeartRate,
      int timeInZone,
      double percentageOfWorkout});
}

/// @nodoc
class __$$HeartRateZoneImplCopyWithImpl<$Res>
    extends _$HeartRateZoneCopyWithImpl<$Res, _$HeartRateZoneImpl>
    implements _$$HeartRateZoneImplCopyWith<$Res> {
  __$$HeartRateZoneImplCopyWithImpl(
      _$HeartRateZoneImpl _value, $Res Function(_$HeartRateZoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of HeartRateZone
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zoneName = null,
    Object? minHeartRate = null,
    Object? maxHeartRate = null,
    Object? timeInZone = null,
    Object? percentageOfWorkout = null,
  }) {
    return _then(_$HeartRateZoneImpl(
      zoneName: null == zoneName
          ? _value.zoneName
          : zoneName // ignore: cast_nullable_to_non_nullable
              as String,
      minHeartRate: null == minHeartRate
          ? _value.minHeartRate
          : minHeartRate // ignore: cast_nullable_to_non_nullable
              as int,
      maxHeartRate: null == maxHeartRate
          ? _value.maxHeartRate
          : maxHeartRate // ignore: cast_nullable_to_non_nullable
              as int,
      timeInZone: null == timeInZone
          ? _value.timeInZone
          : timeInZone // ignore: cast_nullable_to_non_nullable
              as int,
      percentageOfWorkout: null == percentageOfWorkout
          ? _value.percentageOfWorkout
          : percentageOfWorkout // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HeartRateZoneImpl implements _HeartRateZone {
  const _$HeartRateZoneImpl(
      {required this.zoneName,
      required this.minHeartRate,
      required this.maxHeartRate,
      required this.timeInZone,
      required this.percentageOfWorkout});

  factory _$HeartRateZoneImpl.fromJson(Map<String, dynamic> json) =>
      _$$HeartRateZoneImplFromJson(json);

  @override
  final String zoneName;
  @override
  final int minHeartRate;
  @override
  final int maxHeartRate;
  @override
  final int timeInZone;
// minutes
  @override
  final double percentageOfWorkout;

  @override
  String toString() {
    return 'HeartRateZone(zoneName: $zoneName, minHeartRate: $minHeartRate, maxHeartRate: $maxHeartRate, timeInZone: $timeInZone, percentageOfWorkout: $percentageOfWorkout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeartRateZoneImpl &&
            (identical(other.zoneName, zoneName) ||
                other.zoneName == zoneName) &&
            (identical(other.minHeartRate, minHeartRate) ||
                other.minHeartRate == minHeartRate) &&
            (identical(other.maxHeartRate, maxHeartRate) ||
                other.maxHeartRate == maxHeartRate) &&
            (identical(other.timeInZone, timeInZone) ||
                other.timeInZone == timeInZone) &&
            (identical(other.percentageOfWorkout, percentageOfWorkout) ||
                other.percentageOfWorkout == percentageOfWorkout));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, zoneName, minHeartRate,
      maxHeartRate, timeInZone, percentageOfWorkout);

  /// Create a copy of HeartRateZone
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeartRateZoneImplCopyWith<_$HeartRateZoneImpl> get copyWith =>
      __$$HeartRateZoneImplCopyWithImpl<_$HeartRateZoneImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HeartRateZoneImplToJson(
      this,
    );
  }
}

abstract class _HeartRateZone implements HeartRateZone {
  const factory _HeartRateZone(
      {required final String zoneName,
      required final int minHeartRate,
      required final int maxHeartRate,
      required final int timeInZone,
      required final double percentageOfWorkout}) = _$HeartRateZoneImpl;

  factory _HeartRateZone.fromJson(Map<String, dynamic> json) =
      _$HeartRateZoneImpl.fromJson;

  @override
  String get zoneName;
  @override
  int get minHeartRate;
  @override
  int get maxHeartRate;
  @override
  int get timeInZone; // minutes
  @override
  double get percentageOfWorkout;

  /// Create a copy of HeartRateZone
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeartRateZoneImplCopyWith<_$HeartRateZoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NutritionGoal _$NutritionGoalFromJson(Map<String, dynamic> json) {
  return _NutritionGoal.fromJson(json);
}

/// @nodoc
mixin _$NutritionGoal {
  String get goalId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  GoalType get type => throw _privateConstructorUsedError;
  int get targetValue => throw _privateConstructorUsedError;
  int get currentValue => throw _privateConstructorUsedError;
  DateTime get goalDate => throw _privateConstructorUsedError;
  bool get isAchieved => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalData =>
      throw _privateConstructorUsedError;

  /// Serializes this NutritionGoal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NutritionGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutritionGoalCopyWith<NutritionGoal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionGoalCopyWith<$Res> {
  factory $NutritionGoalCopyWith(
          NutritionGoal value, $Res Function(NutritionGoal) then) =
      _$NutritionGoalCopyWithImpl<$Res, NutritionGoal>;
  @useResult
  $Res call(
      {String goalId,
      String userId,
      String deviceId,
      GoalType type,
      int targetValue,
      int currentValue,
      DateTime goalDate,
      bool isAchieved,
      String? notes,
      Map<String, dynamic>? additionalData});
}

/// @nodoc
class _$NutritionGoalCopyWithImpl<$Res, $Val extends NutritionGoal>
    implements $NutritionGoalCopyWith<$Res> {
  _$NutritionGoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutritionGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goalId = null,
    Object? userId = null,
    Object? deviceId = null,
    Object? type = null,
    Object? targetValue = null,
    Object? currentValue = null,
    Object? goalDate = null,
    Object? isAchieved = null,
    Object? notes = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(_value.copyWith(
      goalId: null == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GoalType,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as int,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as int,
      goalDate: null == goalDate
          ? _value.goalDate
          : goalDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isAchieved: null == isAchieved
          ? _value.isAchieved
          : isAchieved // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: freezed == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutritionGoalImplCopyWith<$Res>
    implements $NutritionGoalCopyWith<$Res> {
  factory _$$NutritionGoalImplCopyWith(
          _$NutritionGoalImpl value, $Res Function(_$NutritionGoalImpl) then) =
      __$$NutritionGoalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String goalId,
      String userId,
      String deviceId,
      GoalType type,
      int targetValue,
      int currentValue,
      DateTime goalDate,
      bool isAchieved,
      String? notes,
      Map<String, dynamic>? additionalData});
}

/// @nodoc
class __$$NutritionGoalImplCopyWithImpl<$Res>
    extends _$NutritionGoalCopyWithImpl<$Res, _$NutritionGoalImpl>
    implements _$$NutritionGoalImplCopyWith<$Res> {
  __$$NutritionGoalImplCopyWithImpl(
      _$NutritionGoalImpl _value, $Res Function(_$NutritionGoalImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutritionGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goalId = null,
    Object? userId = null,
    Object? deviceId = null,
    Object? type = null,
    Object? targetValue = null,
    Object? currentValue = null,
    Object? goalDate = null,
    Object? isAchieved = null,
    Object? notes = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(_$NutritionGoalImpl(
      goalId: null == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GoalType,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as int,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as int,
      goalDate: null == goalDate
          ? _value.goalDate
          : goalDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isAchieved: null == isAchieved
          ? _value.isAchieved
          : isAchieved // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: freezed == additionalData
          ? _value._additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NutritionGoalImpl implements _NutritionGoal {
  const _$NutritionGoalImpl(
      {required this.goalId,
      required this.userId,
      required this.deviceId,
      required this.type,
      required this.targetValue,
      required this.currentValue,
      required this.goalDate,
      this.isAchieved = false,
      this.notes,
      final Map<String, dynamic>? additionalData})
      : _additionalData = additionalData;

  factory _$NutritionGoalImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutritionGoalImplFromJson(json);

  @override
  final String goalId;
  @override
  final String userId;
  @override
  final String deviceId;
  @override
  final GoalType type;
  @override
  final int targetValue;
  @override
  final int currentValue;
  @override
  final DateTime goalDate;
  @override
  @JsonKey()
  final bool isAchieved;
  @override
  final String? notes;
  final Map<String, dynamic>? _additionalData;
  @override
  Map<String, dynamic>? get additionalData {
    final value = _additionalData;
    if (value == null) return null;
    if (_additionalData is EqualUnmodifiableMapView) return _additionalData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'NutritionGoal(goalId: $goalId, userId: $userId, deviceId: $deviceId, type: $type, targetValue: $targetValue, currentValue: $currentValue, goalDate: $goalDate, isAchieved: $isAchieved, notes: $notes, additionalData: $additionalData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionGoalImpl &&
            (identical(other.goalId, goalId) || other.goalId == goalId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.goalDate, goalDate) ||
                other.goalDate == goalDate) &&
            (identical(other.isAchieved, isAchieved) ||
                other.isAchieved == isAchieved) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality()
                .equals(other._additionalData, _additionalData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      goalId,
      userId,
      deviceId,
      type,
      targetValue,
      currentValue,
      goalDate,
      isAchieved,
      notes,
      const DeepCollectionEquality().hash(_additionalData));

  /// Create a copy of NutritionGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionGoalImplCopyWith<_$NutritionGoalImpl> get copyWith =>
      __$$NutritionGoalImplCopyWithImpl<_$NutritionGoalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutritionGoalImplToJson(
      this,
    );
  }
}

abstract class _NutritionGoal implements NutritionGoal {
  const factory _NutritionGoal(
      {required final String goalId,
      required final String userId,
      required final String deviceId,
      required final GoalType type,
      required final int targetValue,
      required final int currentValue,
      required final DateTime goalDate,
      final bool isAchieved,
      final String? notes,
      final Map<String, dynamic>? additionalData}) = _$NutritionGoalImpl;

  factory _NutritionGoal.fromJson(Map<String, dynamic> json) =
      _$NutritionGoalImpl.fromJson;

  @override
  String get goalId;
  @override
  String get userId;
  @override
  String get deviceId;
  @override
  GoalType get type;
  @override
  int get targetValue;
  @override
  int get currentValue;
  @override
  DateTime get goalDate;
  @override
  bool get isAchieved;
  @override
  String? get notes;
  @override
  Map<String, dynamic>? get additionalData;

  /// Create a copy of NutritionGoal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutritionGoalImplCopyWith<_$NutritionGoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
