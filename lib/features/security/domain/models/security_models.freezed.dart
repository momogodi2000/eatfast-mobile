// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'security_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SecuritySettings _$SecuritySettingsFromJson(Map<String, dynamic> json) {
  return _SecuritySettings.fromJson(json);
}

/// @nodoc
mixin _$SecuritySettings {
  String get userId => throw _privateConstructorUsedError;
  bool get biometricEnabled => throw _privateConstructorUsedError;
  bool get pinLockEnabled => throw _privateConstructorUsedError;
  bool get autoLockEnabled => throw _privateConstructorUsedError;
  int get autoLockTimeout => throw _privateConstructorUsedError; // seconds
  bool get locationTrackingEnabled => throw _privateConstructorUsedError;
  bool get dataEncryptionEnabled => throw _privateConstructorUsedError;
  bool get fraudDetectionEnabled => throw _privateConstructorUsedError;
  bool get securityAlertsEnabled => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this SecuritySettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SecuritySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SecuritySettingsCopyWith<SecuritySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecuritySettingsCopyWith<$Res> {
  factory $SecuritySettingsCopyWith(
          SecuritySettings value, $Res Function(SecuritySettings) then) =
      _$SecuritySettingsCopyWithImpl<$Res, SecuritySettings>;
  @useResult
  $Res call(
      {String userId,
      bool biometricEnabled,
      bool pinLockEnabled,
      bool autoLockEnabled,
      int autoLockTimeout,
      bool locationTrackingEnabled,
      bool dataEncryptionEnabled,
      bool fraudDetectionEnabled,
      bool securityAlertsEnabled,
      DateTime lastUpdated});
}

/// @nodoc
class _$SecuritySettingsCopyWithImpl<$Res, $Val extends SecuritySettings>
    implements $SecuritySettingsCopyWith<$Res> {
  _$SecuritySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SecuritySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? biometricEnabled = null,
    Object? pinLockEnabled = null,
    Object? autoLockEnabled = null,
    Object? autoLockTimeout = null,
    Object? locationTrackingEnabled = null,
    Object? dataEncryptionEnabled = null,
    Object? fraudDetectionEnabled = null,
    Object? securityAlertsEnabled = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      biometricEnabled: null == biometricEnabled
          ? _value.biometricEnabled
          : biometricEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      pinLockEnabled: null == pinLockEnabled
          ? _value.pinLockEnabled
          : pinLockEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      autoLockEnabled: null == autoLockEnabled
          ? _value.autoLockEnabled
          : autoLockEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      autoLockTimeout: null == autoLockTimeout
          ? _value.autoLockTimeout
          : autoLockTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      locationTrackingEnabled: null == locationTrackingEnabled
          ? _value.locationTrackingEnabled
          : locationTrackingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      dataEncryptionEnabled: null == dataEncryptionEnabled
          ? _value.dataEncryptionEnabled
          : dataEncryptionEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      fraudDetectionEnabled: null == fraudDetectionEnabled
          ? _value.fraudDetectionEnabled
          : fraudDetectionEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      securityAlertsEnabled: null == securityAlertsEnabled
          ? _value.securityAlertsEnabled
          : securityAlertsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SecuritySettingsImplCopyWith<$Res>
    implements $SecuritySettingsCopyWith<$Res> {
  factory _$$SecuritySettingsImplCopyWith(_$SecuritySettingsImpl value,
          $Res Function(_$SecuritySettingsImpl) then) =
      __$$SecuritySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      bool biometricEnabled,
      bool pinLockEnabled,
      bool autoLockEnabled,
      int autoLockTimeout,
      bool locationTrackingEnabled,
      bool dataEncryptionEnabled,
      bool fraudDetectionEnabled,
      bool securityAlertsEnabled,
      DateTime lastUpdated});
}

/// @nodoc
class __$$SecuritySettingsImplCopyWithImpl<$Res>
    extends _$SecuritySettingsCopyWithImpl<$Res, _$SecuritySettingsImpl>
    implements _$$SecuritySettingsImplCopyWith<$Res> {
  __$$SecuritySettingsImplCopyWithImpl(_$SecuritySettingsImpl _value,
      $Res Function(_$SecuritySettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SecuritySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? biometricEnabled = null,
    Object? pinLockEnabled = null,
    Object? autoLockEnabled = null,
    Object? autoLockTimeout = null,
    Object? locationTrackingEnabled = null,
    Object? dataEncryptionEnabled = null,
    Object? fraudDetectionEnabled = null,
    Object? securityAlertsEnabled = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$SecuritySettingsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      biometricEnabled: null == biometricEnabled
          ? _value.biometricEnabled
          : biometricEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      pinLockEnabled: null == pinLockEnabled
          ? _value.pinLockEnabled
          : pinLockEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      autoLockEnabled: null == autoLockEnabled
          ? _value.autoLockEnabled
          : autoLockEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      autoLockTimeout: null == autoLockTimeout
          ? _value.autoLockTimeout
          : autoLockTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      locationTrackingEnabled: null == locationTrackingEnabled
          ? _value.locationTrackingEnabled
          : locationTrackingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      dataEncryptionEnabled: null == dataEncryptionEnabled
          ? _value.dataEncryptionEnabled
          : dataEncryptionEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      fraudDetectionEnabled: null == fraudDetectionEnabled
          ? _value.fraudDetectionEnabled
          : fraudDetectionEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      securityAlertsEnabled: null == securityAlertsEnabled
          ? _value.securityAlertsEnabled
          : securityAlertsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SecuritySettingsImpl implements _SecuritySettings {
  const _$SecuritySettingsImpl(
      {required this.userId,
      this.biometricEnabled = false,
      this.pinLockEnabled = false,
      this.autoLockEnabled = false,
      this.autoLockTimeout = 300,
      this.locationTrackingEnabled = false,
      this.dataEncryptionEnabled = true,
      this.fraudDetectionEnabled = false,
      this.securityAlertsEnabled = true,
      required this.lastUpdated});

  factory _$SecuritySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SecuritySettingsImplFromJson(json);

  @override
  final String userId;
  @override
  @JsonKey()
  final bool biometricEnabled;
  @override
  @JsonKey()
  final bool pinLockEnabled;
  @override
  @JsonKey()
  final bool autoLockEnabled;
  @override
  @JsonKey()
  final int autoLockTimeout;
// seconds
  @override
  @JsonKey()
  final bool locationTrackingEnabled;
  @override
  @JsonKey()
  final bool dataEncryptionEnabled;
  @override
  @JsonKey()
  final bool fraudDetectionEnabled;
  @override
  @JsonKey()
  final bool securityAlertsEnabled;
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'SecuritySettings(userId: $userId, biometricEnabled: $biometricEnabled, pinLockEnabled: $pinLockEnabled, autoLockEnabled: $autoLockEnabled, autoLockTimeout: $autoLockTimeout, locationTrackingEnabled: $locationTrackingEnabled, dataEncryptionEnabled: $dataEncryptionEnabled, fraudDetectionEnabled: $fraudDetectionEnabled, securityAlertsEnabled: $securityAlertsEnabled, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecuritySettingsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.biometricEnabled, biometricEnabled) ||
                other.biometricEnabled == biometricEnabled) &&
            (identical(other.pinLockEnabled, pinLockEnabled) ||
                other.pinLockEnabled == pinLockEnabled) &&
            (identical(other.autoLockEnabled, autoLockEnabled) ||
                other.autoLockEnabled == autoLockEnabled) &&
            (identical(other.autoLockTimeout, autoLockTimeout) ||
                other.autoLockTimeout == autoLockTimeout) &&
            (identical(
                    other.locationTrackingEnabled, locationTrackingEnabled) ||
                other.locationTrackingEnabled == locationTrackingEnabled) &&
            (identical(other.dataEncryptionEnabled, dataEncryptionEnabled) ||
                other.dataEncryptionEnabled == dataEncryptionEnabled) &&
            (identical(other.fraudDetectionEnabled, fraudDetectionEnabled) ||
                other.fraudDetectionEnabled == fraudDetectionEnabled) &&
            (identical(other.securityAlertsEnabled, securityAlertsEnabled) ||
                other.securityAlertsEnabled == securityAlertsEnabled) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      biometricEnabled,
      pinLockEnabled,
      autoLockEnabled,
      autoLockTimeout,
      locationTrackingEnabled,
      dataEncryptionEnabled,
      fraudDetectionEnabled,
      securityAlertsEnabled,
      lastUpdated);

  /// Create a copy of SecuritySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SecuritySettingsImplCopyWith<_$SecuritySettingsImpl> get copyWith =>
      __$$SecuritySettingsImplCopyWithImpl<_$SecuritySettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SecuritySettingsImplToJson(
      this,
    );
  }
}

abstract class _SecuritySettings implements SecuritySettings {
  const factory _SecuritySettings(
      {required final String userId,
      final bool biometricEnabled,
      final bool pinLockEnabled,
      final bool autoLockEnabled,
      final int autoLockTimeout,
      final bool locationTrackingEnabled,
      final bool dataEncryptionEnabled,
      final bool fraudDetectionEnabled,
      final bool securityAlertsEnabled,
      required final DateTime lastUpdated}) = _$SecuritySettingsImpl;

  factory _SecuritySettings.fromJson(Map<String, dynamic> json) =
      _$SecuritySettingsImpl.fromJson;

  @override
  String get userId;
  @override
  bool get biometricEnabled;
  @override
  bool get pinLockEnabled;
  @override
  bool get autoLockEnabled;
  @override
  int get autoLockTimeout; // seconds
  @override
  bool get locationTrackingEnabled;
  @override
  bool get dataEncryptionEnabled;
  @override
  bool get fraudDetectionEnabled;
  @override
  bool get securityAlertsEnabled;
  @override
  DateTime get lastUpdated;

  /// Create a copy of SecuritySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SecuritySettingsImplCopyWith<_$SecuritySettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SecurityAlert _$SecurityAlertFromJson(Map<String, dynamic> json) {
  return _SecurityAlert.fromJson(json);
}

/// @nodoc
mixin _$SecurityAlert {
  String get id => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  SecurityAlertType get type => throw _privateConstructorUsedError;
  SecurityAlertSeverity get severity => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  bool get isAcknowledged => throw _privateConstructorUsedError;
  bool get isResolved => throw _privateConstructorUsedError;

  /// Serializes this SecurityAlert to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SecurityAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SecurityAlertCopyWith<SecurityAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityAlertCopyWith<$Res> {
  factory $SecurityAlertCopyWith(
          SecurityAlert value, $Res Function(SecurityAlert) then) =
      _$SecurityAlertCopyWithImpl<$Res, SecurityAlert>;
  @useResult
  $Res call(
      {String id,
      DateTime timestamp,
      SecurityAlertType type,
      SecurityAlertSeverity severity,
      String title,
      String description,
      Map<String, dynamic> metadata,
      bool isAcknowledged,
      bool isResolved});
}

/// @nodoc
class _$SecurityAlertCopyWithImpl<$Res, $Val extends SecurityAlert>
    implements $SecurityAlertCopyWith<$Res> {
  _$SecurityAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SecurityAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? type = null,
    Object? severity = null,
    Object? title = null,
    Object? description = null,
    Object? metadata = null,
    Object? isAcknowledged = null,
    Object? isResolved = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SecurityAlertType,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as SecurityAlertSeverity,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isAcknowledged: null == isAcknowledged
          ? _value.isAcknowledged
          : isAcknowledged // ignore: cast_nullable_to_non_nullable
              as bool,
      isResolved: null == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SecurityAlertImplCopyWith<$Res>
    implements $SecurityAlertCopyWith<$Res> {
  factory _$$SecurityAlertImplCopyWith(
          _$SecurityAlertImpl value, $Res Function(_$SecurityAlertImpl) then) =
      __$$SecurityAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime timestamp,
      SecurityAlertType type,
      SecurityAlertSeverity severity,
      String title,
      String description,
      Map<String, dynamic> metadata,
      bool isAcknowledged,
      bool isResolved});
}

/// @nodoc
class __$$SecurityAlertImplCopyWithImpl<$Res>
    extends _$SecurityAlertCopyWithImpl<$Res, _$SecurityAlertImpl>
    implements _$$SecurityAlertImplCopyWith<$Res> {
  __$$SecurityAlertImplCopyWithImpl(
      _$SecurityAlertImpl _value, $Res Function(_$SecurityAlertImpl) _then)
      : super(_value, _then);

  /// Create a copy of SecurityAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? type = null,
    Object? severity = null,
    Object? title = null,
    Object? description = null,
    Object? metadata = null,
    Object? isAcknowledged = null,
    Object? isResolved = null,
  }) {
    return _then(_$SecurityAlertImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SecurityAlertType,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as SecurityAlertSeverity,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isAcknowledged: null == isAcknowledged
          ? _value.isAcknowledged
          : isAcknowledged // ignore: cast_nullable_to_non_nullable
              as bool,
      isResolved: null == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SecurityAlertImpl implements _SecurityAlert {
  const _$SecurityAlertImpl(
      {required this.id,
      required this.timestamp,
      required this.type,
      required this.severity,
      required this.title,
      required this.description,
      required final Map<String, dynamic> metadata,
      this.isAcknowledged = false,
      this.isResolved = false})
      : _metadata = metadata;

  factory _$SecurityAlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$SecurityAlertImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime timestamp;
  @override
  final SecurityAlertType type;
  @override
  final SecurityAlertSeverity severity;
  @override
  final String title;
  @override
  final String description;
  final Map<String, dynamic> _metadata;
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  @JsonKey()
  final bool isAcknowledged;
  @override
  @JsonKey()
  final bool isResolved;

  @override
  String toString() {
    return 'SecurityAlert(id: $id, timestamp: $timestamp, type: $type, severity: $severity, title: $title, description: $description, metadata: $metadata, isAcknowledged: $isAcknowledged, isResolved: $isResolved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecurityAlertImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.isAcknowledged, isAcknowledged) ||
                other.isAcknowledged == isAcknowledged) &&
            (identical(other.isResolved, isResolved) ||
                other.isResolved == isResolved));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      timestamp,
      type,
      severity,
      title,
      description,
      const DeepCollectionEquality().hash(_metadata),
      isAcknowledged,
      isResolved);

  /// Create a copy of SecurityAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SecurityAlertImplCopyWith<_$SecurityAlertImpl> get copyWith =>
      __$$SecurityAlertImplCopyWithImpl<_$SecurityAlertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SecurityAlertImplToJson(
      this,
    );
  }
}

abstract class _SecurityAlert implements SecurityAlert {
  const factory _SecurityAlert(
      {required final String id,
      required final DateTime timestamp,
      required final SecurityAlertType type,
      required final SecurityAlertSeverity severity,
      required final String title,
      required final String description,
      required final Map<String, dynamic> metadata,
      final bool isAcknowledged,
      final bool isResolved}) = _$SecurityAlertImpl;

  factory _SecurityAlert.fromJson(Map<String, dynamic> json) =
      _$SecurityAlertImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get timestamp;
  @override
  SecurityAlertType get type;
  @override
  SecurityAlertSeverity get severity;
  @override
  String get title;
  @override
  String get description;
  @override
  Map<String, dynamic> get metadata;
  @override
  bool get isAcknowledged;
  @override
  bool get isResolved;

  /// Create a copy of SecurityAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SecurityAlertImplCopyWith<_$SecurityAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BiometricSettings _$BiometricSettingsFromJson(Map<String, dynamic> json) {
  return _BiometricSettings.fromJson(json);
}

/// @nodoc
mixin _$BiometricSettings {
  bool get isAvailable => throw _privateConstructorUsedError;
  List<BiometricType> get availableTypes => throw _privateConstructorUsedError;
  BiometricType? get enabledType => throw _privateConstructorUsedError;
  bool get fallbackEnabled => throw _privateConstructorUsedError;
  DateTime? get lastAuthentication => throw _privateConstructorUsedError;

  /// Serializes this BiometricSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BiometricSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BiometricSettingsCopyWith<BiometricSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BiometricSettingsCopyWith<$Res> {
  factory $BiometricSettingsCopyWith(
          BiometricSettings value, $Res Function(BiometricSettings) then) =
      _$BiometricSettingsCopyWithImpl<$Res, BiometricSettings>;
  @useResult
  $Res call(
      {bool isAvailable,
      List<BiometricType> availableTypes,
      BiometricType? enabledType,
      bool fallbackEnabled,
      DateTime? lastAuthentication});
}

/// @nodoc
class _$BiometricSettingsCopyWithImpl<$Res, $Val extends BiometricSettings>
    implements $BiometricSettingsCopyWith<$Res> {
  _$BiometricSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BiometricSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAvailable = null,
    Object? availableTypes = null,
    Object? enabledType = freezed,
    Object? fallbackEnabled = null,
    Object? lastAuthentication = freezed,
  }) {
    return _then(_value.copyWith(
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      availableTypes: null == availableTypes
          ? _value.availableTypes
          : availableTypes // ignore: cast_nullable_to_non_nullable
              as List<BiometricType>,
      enabledType: freezed == enabledType
          ? _value.enabledType
          : enabledType // ignore: cast_nullable_to_non_nullable
              as BiometricType?,
      fallbackEnabled: null == fallbackEnabled
          ? _value.fallbackEnabled
          : fallbackEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      lastAuthentication: freezed == lastAuthentication
          ? _value.lastAuthentication
          : lastAuthentication // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BiometricSettingsImplCopyWith<$Res>
    implements $BiometricSettingsCopyWith<$Res> {
  factory _$$BiometricSettingsImplCopyWith(_$BiometricSettingsImpl value,
          $Res Function(_$BiometricSettingsImpl) then) =
      __$$BiometricSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isAvailable,
      List<BiometricType> availableTypes,
      BiometricType? enabledType,
      bool fallbackEnabled,
      DateTime? lastAuthentication});
}

/// @nodoc
class __$$BiometricSettingsImplCopyWithImpl<$Res>
    extends _$BiometricSettingsCopyWithImpl<$Res, _$BiometricSettingsImpl>
    implements _$$BiometricSettingsImplCopyWith<$Res> {
  __$$BiometricSettingsImplCopyWithImpl(_$BiometricSettingsImpl _value,
      $Res Function(_$BiometricSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of BiometricSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAvailable = null,
    Object? availableTypes = null,
    Object? enabledType = freezed,
    Object? fallbackEnabled = null,
    Object? lastAuthentication = freezed,
  }) {
    return _then(_$BiometricSettingsImpl(
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      availableTypes: null == availableTypes
          ? _value._availableTypes
          : availableTypes // ignore: cast_nullable_to_non_nullable
              as List<BiometricType>,
      enabledType: freezed == enabledType
          ? _value.enabledType
          : enabledType // ignore: cast_nullable_to_non_nullable
              as BiometricType?,
      fallbackEnabled: null == fallbackEnabled
          ? _value.fallbackEnabled
          : fallbackEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      lastAuthentication: freezed == lastAuthentication
          ? _value.lastAuthentication
          : lastAuthentication // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BiometricSettingsImpl implements _BiometricSettings {
  const _$BiometricSettingsImpl(
      {required this.isAvailable,
      required final List<BiometricType> availableTypes,
      required this.enabledType,
      this.fallbackEnabled = false,
      required this.lastAuthentication})
      : _availableTypes = availableTypes;

  factory _$BiometricSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BiometricSettingsImplFromJson(json);

  @override
  final bool isAvailable;
  final List<BiometricType> _availableTypes;
  @override
  List<BiometricType> get availableTypes {
    if (_availableTypes is EqualUnmodifiableListView) return _availableTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableTypes);
  }

  @override
  final BiometricType? enabledType;
  @override
  @JsonKey()
  final bool fallbackEnabled;
  @override
  final DateTime? lastAuthentication;

  @override
  String toString() {
    return 'BiometricSettings(isAvailable: $isAvailable, availableTypes: $availableTypes, enabledType: $enabledType, fallbackEnabled: $fallbackEnabled, lastAuthentication: $lastAuthentication)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricSettingsImpl &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            const DeepCollectionEquality()
                .equals(other._availableTypes, _availableTypes) &&
            (identical(other.enabledType, enabledType) ||
                other.enabledType == enabledType) &&
            (identical(other.fallbackEnabled, fallbackEnabled) ||
                other.fallbackEnabled == fallbackEnabled) &&
            (identical(other.lastAuthentication, lastAuthentication) ||
                other.lastAuthentication == lastAuthentication));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isAvailable,
      const DeepCollectionEquality().hash(_availableTypes),
      enabledType,
      fallbackEnabled,
      lastAuthentication);

  /// Create a copy of BiometricSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BiometricSettingsImplCopyWith<_$BiometricSettingsImpl> get copyWith =>
      __$$BiometricSettingsImplCopyWithImpl<_$BiometricSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BiometricSettingsImplToJson(
      this,
    );
  }
}

abstract class _BiometricSettings implements BiometricSettings {
  const factory _BiometricSettings(
      {required final bool isAvailable,
      required final List<BiometricType> availableTypes,
      required final BiometricType? enabledType,
      final bool fallbackEnabled,
      required final DateTime? lastAuthentication}) = _$BiometricSettingsImpl;

  factory _BiometricSettings.fromJson(Map<String, dynamic> json) =
      _$BiometricSettingsImpl.fromJson;

  @override
  bool get isAvailable;
  @override
  List<BiometricType> get availableTypes;
  @override
  BiometricType? get enabledType;
  @override
  bool get fallbackEnabled;
  @override
  DateTime? get lastAuthentication;

  /// Create a copy of BiometricSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BiometricSettingsImplCopyWith<_$BiometricSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrivacySettings _$PrivacySettingsFromJson(Map<String, dynamic> json) {
  return _PrivacySettings.fromJson(json);
}

/// @nodoc
mixin _$PrivacySettings {
  String get userId => throw _privateConstructorUsedError;
  bool get locationSharingEnabled => throw _privateConstructorUsedError;
  bool get analyticsEnabled => throw _privateConstructorUsedError;
  bool get crashReportingEnabled => throw _privateConstructorUsedError;
  bool get marketingEmailsEnabled => throw _privateConstructorUsedError;
  bool get pushNotificationsEnabled => throw _privateConstructorUsedError;
  bool get dataExportRequested => throw _privateConstructorUsedError;
  bool get accountDeletionRequested => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this PrivacySettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivacySettingsCopyWith<PrivacySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacySettingsCopyWith<$Res> {
  factory $PrivacySettingsCopyWith(
          PrivacySettings value, $Res Function(PrivacySettings) then) =
      _$PrivacySettingsCopyWithImpl<$Res, PrivacySettings>;
  @useResult
  $Res call(
      {String userId,
      bool locationSharingEnabled,
      bool analyticsEnabled,
      bool crashReportingEnabled,
      bool marketingEmailsEnabled,
      bool pushNotificationsEnabled,
      bool dataExportRequested,
      bool accountDeletionRequested,
      DateTime lastUpdated});
}

/// @nodoc
class _$PrivacySettingsCopyWithImpl<$Res, $Val extends PrivacySettings>
    implements $PrivacySettingsCopyWith<$Res> {
  _$PrivacySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? locationSharingEnabled = null,
    Object? analyticsEnabled = null,
    Object? crashReportingEnabled = null,
    Object? marketingEmailsEnabled = null,
    Object? pushNotificationsEnabled = null,
    Object? dataExportRequested = null,
    Object? accountDeletionRequested = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      locationSharingEnabled: null == locationSharingEnabled
          ? _value.locationSharingEnabled
          : locationSharingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      analyticsEnabled: null == analyticsEnabled
          ? _value.analyticsEnabled
          : analyticsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      crashReportingEnabled: null == crashReportingEnabled
          ? _value.crashReportingEnabled
          : crashReportingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      marketingEmailsEnabled: null == marketingEmailsEnabled
          ? _value.marketingEmailsEnabled
          : marketingEmailsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotificationsEnabled: null == pushNotificationsEnabled
          ? _value.pushNotificationsEnabled
          : pushNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      dataExportRequested: null == dataExportRequested
          ? _value.dataExportRequested
          : dataExportRequested // ignore: cast_nullable_to_non_nullable
              as bool,
      accountDeletionRequested: null == accountDeletionRequested
          ? _value.accountDeletionRequested
          : accountDeletionRequested // ignore: cast_nullable_to_non_nullable
              as bool,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrivacySettingsImplCopyWith<$Res>
    implements $PrivacySettingsCopyWith<$Res> {
  factory _$$PrivacySettingsImplCopyWith(_$PrivacySettingsImpl value,
          $Res Function(_$PrivacySettingsImpl) then) =
      __$$PrivacySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      bool locationSharingEnabled,
      bool analyticsEnabled,
      bool crashReportingEnabled,
      bool marketingEmailsEnabled,
      bool pushNotificationsEnabled,
      bool dataExportRequested,
      bool accountDeletionRequested,
      DateTime lastUpdated});
}

/// @nodoc
class __$$PrivacySettingsImplCopyWithImpl<$Res>
    extends _$PrivacySettingsCopyWithImpl<$Res, _$PrivacySettingsImpl>
    implements _$$PrivacySettingsImplCopyWith<$Res> {
  __$$PrivacySettingsImplCopyWithImpl(
      _$PrivacySettingsImpl _value, $Res Function(_$PrivacySettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? locationSharingEnabled = null,
    Object? analyticsEnabled = null,
    Object? crashReportingEnabled = null,
    Object? marketingEmailsEnabled = null,
    Object? pushNotificationsEnabled = null,
    Object? dataExportRequested = null,
    Object? accountDeletionRequested = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$PrivacySettingsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      locationSharingEnabled: null == locationSharingEnabled
          ? _value.locationSharingEnabled
          : locationSharingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      analyticsEnabled: null == analyticsEnabled
          ? _value.analyticsEnabled
          : analyticsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      crashReportingEnabled: null == crashReportingEnabled
          ? _value.crashReportingEnabled
          : crashReportingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      marketingEmailsEnabled: null == marketingEmailsEnabled
          ? _value.marketingEmailsEnabled
          : marketingEmailsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotificationsEnabled: null == pushNotificationsEnabled
          ? _value.pushNotificationsEnabled
          : pushNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      dataExportRequested: null == dataExportRequested
          ? _value.dataExportRequested
          : dataExportRequested // ignore: cast_nullable_to_non_nullable
              as bool,
      accountDeletionRequested: null == accountDeletionRequested
          ? _value.accountDeletionRequested
          : accountDeletionRequested // ignore: cast_nullable_to_non_nullable
              as bool,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivacySettingsImpl implements _PrivacySettings {
  const _$PrivacySettingsImpl(
      {required this.userId,
      this.locationSharingEnabled = true,
      this.analyticsEnabled = false,
      this.crashReportingEnabled = false,
      this.marketingEmailsEnabled = true,
      this.pushNotificationsEnabled = true,
      this.dataExportRequested = false,
      this.accountDeletionRequested = false,
      required this.lastUpdated});

  factory _$PrivacySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacySettingsImplFromJson(json);

  @override
  final String userId;
  @override
  @JsonKey()
  final bool locationSharingEnabled;
  @override
  @JsonKey()
  final bool analyticsEnabled;
  @override
  @JsonKey()
  final bool crashReportingEnabled;
  @override
  @JsonKey()
  final bool marketingEmailsEnabled;
  @override
  @JsonKey()
  final bool pushNotificationsEnabled;
  @override
  @JsonKey()
  final bool dataExportRequested;
  @override
  @JsonKey()
  final bool accountDeletionRequested;
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'PrivacySettings(userId: $userId, locationSharingEnabled: $locationSharingEnabled, analyticsEnabled: $analyticsEnabled, crashReportingEnabled: $crashReportingEnabled, marketingEmailsEnabled: $marketingEmailsEnabled, pushNotificationsEnabled: $pushNotificationsEnabled, dataExportRequested: $dataExportRequested, accountDeletionRequested: $accountDeletionRequested, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacySettingsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.locationSharingEnabled, locationSharingEnabled) ||
                other.locationSharingEnabled == locationSharingEnabled) &&
            (identical(other.analyticsEnabled, analyticsEnabled) ||
                other.analyticsEnabled == analyticsEnabled) &&
            (identical(other.crashReportingEnabled, crashReportingEnabled) ||
                other.crashReportingEnabled == crashReportingEnabled) &&
            (identical(other.marketingEmailsEnabled, marketingEmailsEnabled) ||
                other.marketingEmailsEnabled == marketingEmailsEnabled) &&
            (identical(
                    other.pushNotificationsEnabled, pushNotificationsEnabled) ||
                other.pushNotificationsEnabled == pushNotificationsEnabled) &&
            (identical(other.dataExportRequested, dataExportRequested) ||
                other.dataExportRequested == dataExportRequested) &&
            (identical(
                    other.accountDeletionRequested, accountDeletionRequested) ||
                other.accountDeletionRequested == accountDeletionRequested) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      locationSharingEnabled,
      analyticsEnabled,
      crashReportingEnabled,
      marketingEmailsEnabled,
      pushNotificationsEnabled,
      dataExportRequested,
      accountDeletionRequested,
      lastUpdated);

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacySettingsImplCopyWith<_$PrivacySettingsImpl> get copyWith =>
      __$$PrivacySettingsImplCopyWithImpl<_$PrivacySettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacySettingsImplToJson(
      this,
    );
  }
}

abstract class _PrivacySettings implements PrivacySettings {
  const factory _PrivacySettings(
      {required final String userId,
      final bool locationSharingEnabled,
      final bool analyticsEnabled,
      final bool crashReportingEnabled,
      final bool marketingEmailsEnabled,
      final bool pushNotificationsEnabled,
      final bool dataExportRequested,
      final bool accountDeletionRequested,
      required final DateTime lastUpdated}) = _$PrivacySettingsImpl;

  factory _PrivacySettings.fromJson(Map<String, dynamic> json) =
      _$PrivacySettingsImpl.fromJson;

  @override
  String get userId;
  @override
  bool get locationSharingEnabled;
  @override
  bool get analyticsEnabled;
  @override
  bool get crashReportingEnabled;
  @override
  bool get marketingEmailsEnabled;
  @override
  bool get pushNotificationsEnabled;
  @override
  bool get dataExportRequested;
  @override
  bool get accountDeletionRequested;
  @override
  DateTime get lastUpdated;

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivacySettingsImplCopyWith<_$PrivacySettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataEncryption _$DataEncryptionFromJson(Map<String, dynamic> json) {
  return _DataEncryption.fromJson(json);
}

/// @nodoc
mixin _$DataEncryption {
  bool get isEnabled => throw _privateConstructorUsedError;
  EncryptionMethod get method => throw _privateConstructorUsedError;
  String get keyId => throw _privateConstructorUsedError;
  DateTime get lastRotation => throw _privateConstructorUsedError;
  List<String> get encryptedFields => throw _privateConstructorUsedError;

  /// Serializes this DataEncryption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataEncryption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataEncryptionCopyWith<DataEncryption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataEncryptionCopyWith<$Res> {
  factory $DataEncryptionCopyWith(
          DataEncryption value, $Res Function(DataEncryption) then) =
      _$DataEncryptionCopyWithImpl<$Res, DataEncryption>;
  @useResult
  $Res call(
      {bool isEnabled,
      EncryptionMethod method,
      String keyId,
      DateTime lastRotation,
      List<String> encryptedFields});
}

/// @nodoc
class _$DataEncryptionCopyWithImpl<$Res, $Val extends DataEncryption>
    implements $DataEncryptionCopyWith<$Res> {
  _$DataEncryptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataEncryption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEnabled = null,
    Object? method = null,
    Object? keyId = null,
    Object? lastRotation = null,
    Object? encryptedFields = null,
  }) {
    return _then(_value.copyWith(
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as EncryptionMethod,
      keyId: null == keyId
          ? _value.keyId
          : keyId // ignore: cast_nullable_to_non_nullable
              as String,
      lastRotation: null == lastRotation
          ? _value.lastRotation
          : lastRotation // ignore: cast_nullable_to_non_nullable
              as DateTime,
      encryptedFields: null == encryptedFields
          ? _value.encryptedFields
          : encryptedFields // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataEncryptionImplCopyWith<$Res>
    implements $DataEncryptionCopyWith<$Res> {
  factory _$$DataEncryptionImplCopyWith(_$DataEncryptionImpl value,
          $Res Function(_$DataEncryptionImpl) then) =
      __$$DataEncryptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isEnabled,
      EncryptionMethod method,
      String keyId,
      DateTime lastRotation,
      List<String> encryptedFields});
}

/// @nodoc
class __$$DataEncryptionImplCopyWithImpl<$Res>
    extends _$DataEncryptionCopyWithImpl<$Res, _$DataEncryptionImpl>
    implements _$$DataEncryptionImplCopyWith<$Res> {
  __$$DataEncryptionImplCopyWithImpl(
      _$DataEncryptionImpl _value, $Res Function(_$DataEncryptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataEncryption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEnabled = null,
    Object? method = null,
    Object? keyId = null,
    Object? lastRotation = null,
    Object? encryptedFields = null,
  }) {
    return _then(_$DataEncryptionImpl(
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as EncryptionMethod,
      keyId: null == keyId
          ? _value.keyId
          : keyId // ignore: cast_nullable_to_non_nullable
              as String,
      lastRotation: null == lastRotation
          ? _value.lastRotation
          : lastRotation // ignore: cast_nullable_to_non_nullable
              as DateTime,
      encryptedFields: null == encryptedFields
          ? _value._encryptedFields
          : encryptedFields // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataEncryptionImpl implements _DataEncryption {
  const _$DataEncryptionImpl(
      {required this.isEnabled,
      required this.method,
      required this.keyId,
      required this.lastRotation,
      required final List<String> encryptedFields})
      : _encryptedFields = encryptedFields;

  factory _$DataEncryptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataEncryptionImplFromJson(json);

  @override
  final bool isEnabled;
  @override
  final EncryptionMethod method;
  @override
  final String keyId;
  @override
  final DateTime lastRotation;
  final List<String> _encryptedFields;
  @override
  List<String> get encryptedFields {
    if (_encryptedFields is EqualUnmodifiableListView) return _encryptedFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_encryptedFields);
  }

  @override
  String toString() {
    return 'DataEncryption(isEnabled: $isEnabled, method: $method, keyId: $keyId, lastRotation: $lastRotation, encryptedFields: $encryptedFields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataEncryptionImpl &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.keyId, keyId) || other.keyId == keyId) &&
            (identical(other.lastRotation, lastRotation) ||
                other.lastRotation == lastRotation) &&
            const DeepCollectionEquality()
                .equals(other._encryptedFields, _encryptedFields));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isEnabled, method, keyId,
      lastRotation, const DeepCollectionEquality().hash(_encryptedFields));

  /// Create a copy of DataEncryption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataEncryptionImplCopyWith<_$DataEncryptionImpl> get copyWith =>
      __$$DataEncryptionImplCopyWithImpl<_$DataEncryptionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataEncryptionImplToJson(
      this,
    );
  }
}

abstract class _DataEncryption implements DataEncryption {
  const factory _DataEncryption(
      {required final bool isEnabled,
      required final EncryptionMethod method,
      required final String keyId,
      required final DateTime lastRotation,
      required final List<String> encryptedFields}) = _$DataEncryptionImpl;

  factory _DataEncryption.fromJson(Map<String, dynamic> json) =
      _$DataEncryptionImpl.fromJson;

  @override
  bool get isEnabled;
  @override
  EncryptionMethod get method;
  @override
  String get keyId;
  @override
  DateTime get lastRotation;
  @override
  List<String> get encryptedFields;

  /// Create a copy of DataEncryption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataEncryptionImplCopyWith<_$DataEncryptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
