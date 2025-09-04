// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_performance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppPerformance _$AppPerformanceFromJson(Map<String, dynamic> json) {
  return _AppPerformance.fromJson(json);
}

/// @nodoc
mixin _$AppPerformance {
  String get id => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get cpuUsage => throw _privateConstructorUsedError;
  double get memoryUsage => throw _privateConstructorUsedError;
  double get batteryUsage => throw _privateConstructorUsedError;
  int get networkRequests => throw _privateConstructorUsedError;
  double get avgResponseTime => throw _privateConstructorUsedError;
  int get errorCount => throw _privateConstructorUsedError;
  double get frameRate => throw _privateConstructorUsedError;
  double get startupTime => throw _privateConstructorUsedError;
  Map<String, dynamic> get customMetrics => throw _privateConstructorUsedError;

  /// Serializes this AppPerformance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppPerformance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppPerformanceCopyWith<AppPerformance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppPerformanceCopyWith<$Res> {
  factory $AppPerformanceCopyWith(
          AppPerformance value, $Res Function(AppPerformance) then) =
      _$AppPerformanceCopyWithImpl<$Res, AppPerformance>;
  @useResult
  $Res call(
      {String id,
      DateTime timestamp,
      double cpuUsage,
      double memoryUsage,
      double batteryUsage,
      int networkRequests,
      double avgResponseTime,
      int errorCount,
      double frameRate,
      double startupTime,
      Map<String, dynamic> customMetrics});
}

/// @nodoc
class _$AppPerformanceCopyWithImpl<$Res, $Val extends AppPerformance>
    implements $AppPerformanceCopyWith<$Res> {
  _$AppPerformanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppPerformance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? cpuUsage = null,
    Object? memoryUsage = null,
    Object? batteryUsage = null,
    Object? networkRequests = null,
    Object? avgResponseTime = null,
    Object? errorCount = null,
    Object? frameRate = null,
    Object? startupTime = null,
    Object? customMetrics = null,
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
      cpuUsage: null == cpuUsage
          ? _value.cpuUsage
          : cpuUsage // ignore: cast_nullable_to_non_nullable
              as double,
      memoryUsage: null == memoryUsage
          ? _value.memoryUsage
          : memoryUsage // ignore: cast_nullable_to_non_nullable
              as double,
      batteryUsage: null == batteryUsage
          ? _value.batteryUsage
          : batteryUsage // ignore: cast_nullable_to_non_nullable
              as double,
      networkRequests: null == networkRequests
          ? _value.networkRequests
          : networkRequests // ignore: cast_nullable_to_non_nullable
              as int,
      avgResponseTime: null == avgResponseTime
          ? _value.avgResponseTime
          : avgResponseTime // ignore: cast_nullable_to_non_nullable
              as double,
      errorCount: null == errorCount
          ? _value.errorCount
          : errorCount // ignore: cast_nullable_to_non_nullable
              as int,
      frameRate: null == frameRate
          ? _value.frameRate
          : frameRate // ignore: cast_nullable_to_non_nullable
              as double,
      startupTime: null == startupTime
          ? _value.startupTime
          : startupTime // ignore: cast_nullable_to_non_nullable
              as double,
      customMetrics: null == customMetrics
          ? _value.customMetrics
          : customMetrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppPerformanceImplCopyWith<$Res>
    implements $AppPerformanceCopyWith<$Res> {
  factory _$$AppPerformanceImplCopyWith(_$AppPerformanceImpl value,
          $Res Function(_$AppPerformanceImpl) then) =
      __$$AppPerformanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime timestamp,
      double cpuUsage,
      double memoryUsage,
      double batteryUsage,
      int networkRequests,
      double avgResponseTime,
      int errorCount,
      double frameRate,
      double startupTime,
      Map<String, dynamic> customMetrics});
}

/// @nodoc
class __$$AppPerformanceImplCopyWithImpl<$Res>
    extends _$AppPerformanceCopyWithImpl<$Res, _$AppPerformanceImpl>
    implements _$$AppPerformanceImplCopyWith<$Res> {
  __$$AppPerformanceImplCopyWithImpl(
      _$AppPerformanceImpl _value, $Res Function(_$AppPerformanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppPerformance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? cpuUsage = null,
    Object? memoryUsage = null,
    Object? batteryUsage = null,
    Object? networkRequests = null,
    Object? avgResponseTime = null,
    Object? errorCount = null,
    Object? frameRate = null,
    Object? startupTime = null,
    Object? customMetrics = null,
  }) {
    return _then(_$AppPerformanceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cpuUsage: null == cpuUsage
          ? _value.cpuUsage
          : cpuUsage // ignore: cast_nullable_to_non_nullable
              as double,
      memoryUsage: null == memoryUsage
          ? _value.memoryUsage
          : memoryUsage // ignore: cast_nullable_to_non_nullable
              as double,
      batteryUsage: null == batteryUsage
          ? _value.batteryUsage
          : batteryUsage // ignore: cast_nullable_to_non_nullable
              as double,
      networkRequests: null == networkRequests
          ? _value.networkRequests
          : networkRequests // ignore: cast_nullable_to_non_nullable
              as int,
      avgResponseTime: null == avgResponseTime
          ? _value.avgResponseTime
          : avgResponseTime // ignore: cast_nullable_to_non_nullable
              as double,
      errorCount: null == errorCount
          ? _value.errorCount
          : errorCount // ignore: cast_nullable_to_non_nullable
              as int,
      frameRate: null == frameRate
          ? _value.frameRate
          : frameRate // ignore: cast_nullable_to_non_nullable
              as double,
      startupTime: null == startupTime
          ? _value.startupTime
          : startupTime // ignore: cast_nullable_to_non_nullable
              as double,
      customMetrics: null == customMetrics
          ? _value._customMetrics
          : customMetrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppPerformanceImpl implements _AppPerformance {
  const _$AppPerformanceImpl(
      {required this.id,
      required this.timestamp,
      required this.cpuUsage,
      required this.memoryUsage,
      required this.batteryUsage,
      required this.networkRequests,
      required this.avgResponseTime,
      required this.errorCount,
      required this.frameRate,
      required this.startupTime,
      required final Map<String, dynamic> customMetrics})
      : _customMetrics = customMetrics;

  factory _$AppPerformanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppPerformanceImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime timestamp;
  @override
  final double cpuUsage;
  @override
  final double memoryUsage;
  @override
  final double batteryUsage;
  @override
  final int networkRequests;
  @override
  final double avgResponseTime;
  @override
  final int errorCount;
  @override
  final double frameRate;
  @override
  final double startupTime;
  final Map<String, dynamic> _customMetrics;
  @override
  Map<String, dynamic> get customMetrics {
    if (_customMetrics is EqualUnmodifiableMapView) return _customMetrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_customMetrics);
  }

  @override
  String toString() {
    return 'AppPerformance(id: $id, timestamp: $timestamp, cpuUsage: $cpuUsage, memoryUsage: $memoryUsage, batteryUsage: $batteryUsage, networkRequests: $networkRequests, avgResponseTime: $avgResponseTime, errorCount: $errorCount, frameRate: $frameRate, startupTime: $startupTime, customMetrics: $customMetrics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppPerformanceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.cpuUsage, cpuUsage) ||
                other.cpuUsage == cpuUsage) &&
            (identical(other.memoryUsage, memoryUsage) ||
                other.memoryUsage == memoryUsage) &&
            (identical(other.batteryUsage, batteryUsage) ||
                other.batteryUsage == batteryUsage) &&
            (identical(other.networkRequests, networkRequests) ||
                other.networkRequests == networkRequests) &&
            (identical(other.avgResponseTime, avgResponseTime) ||
                other.avgResponseTime == avgResponseTime) &&
            (identical(other.errorCount, errorCount) ||
                other.errorCount == errorCount) &&
            (identical(other.frameRate, frameRate) ||
                other.frameRate == frameRate) &&
            (identical(other.startupTime, startupTime) ||
                other.startupTime == startupTime) &&
            const DeepCollectionEquality()
                .equals(other._customMetrics, _customMetrics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      timestamp,
      cpuUsage,
      memoryUsage,
      batteryUsage,
      networkRequests,
      avgResponseTime,
      errorCount,
      frameRate,
      startupTime,
      const DeepCollectionEquality().hash(_customMetrics));

  /// Create a copy of AppPerformance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppPerformanceImplCopyWith<_$AppPerformanceImpl> get copyWith =>
      __$$AppPerformanceImplCopyWithImpl<_$AppPerformanceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppPerformanceImplToJson(
      this,
    );
  }
}

abstract class _AppPerformance implements AppPerformance {
  const factory _AppPerformance(
          {required final String id,
          required final DateTime timestamp,
          required final double cpuUsage,
          required final double memoryUsage,
          required final double batteryUsage,
          required final int networkRequests,
          required final double avgResponseTime,
          required final int errorCount,
          required final double frameRate,
          required final double startupTime,
          required final Map<String, dynamic> customMetrics}) =
      _$AppPerformanceImpl;

  factory _AppPerformance.fromJson(Map<String, dynamic> json) =
      _$AppPerformanceImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get timestamp;
  @override
  double get cpuUsage;
  @override
  double get memoryUsage;
  @override
  double get batteryUsage;
  @override
  int get networkRequests;
  @override
  double get avgResponseTime;
  @override
  int get errorCount;
  @override
  double get frameRate;
  @override
  double get startupTime;
  @override
  Map<String, dynamic> get customMetrics;

  /// Create a copy of AppPerformance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppPerformanceImplCopyWith<_$AppPerformanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PerformanceAlert _$PerformanceAlertFromJson(Map<String, dynamic> json) {
  return _PerformanceAlert.fromJson(json);
}

/// @nodoc
mixin _$PerformanceAlert {
  String get id => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  PerformanceAlertType get type => throw _privateConstructorUsedError;
  PerformanceAlertSeverity get severity => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Map<String, dynamic> get details => throw _privateConstructorUsedError;
  bool get isResolved => throw _privateConstructorUsedError;

  /// Serializes this PerformanceAlert to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PerformanceAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerformanceAlertCopyWith<PerformanceAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceAlertCopyWith<$Res> {
  factory $PerformanceAlertCopyWith(
          PerformanceAlert value, $Res Function(PerformanceAlert) then) =
      _$PerformanceAlertCopyWithImpl<$Res, PerformanceAlert>;
  @useResult
  $Res call(
      {String id,
      DateTime timestamp,
      PerformanceAlertType type,
      PerformanceAlertSeverity severity,
      String message,
      Map<String, dynamic> details,
      bool isResolved});
}

/// @nodoc
class _$PerformanceAlertCopyWithImpl<$Res, $Val extends PerformanceAlert>
    implements $PerformanceAlertCopyWith<$Res> {
  _$PerformanceAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerformanceAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? type = null,
    Object? severity = null,
    Object? message = null,
    Object? details = null,
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
              as PerformanceAlertType,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as PerformanceAlertSeverity,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isResolved: null == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerformanceAlertImplCopyWith<$Res>
    implements $PerformanceAlertCopyWith<$Res> {
  factory _$$PerformanceAlertImplCopyWith(_$PerformanceAlertImpl value,
          $Res Function(_$PerformanceAlertImpl) then) =
      __$$PerformanceAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime timestamp,
      PerformanceAlertType type,
      PerformanceAlertSeverity severity,
      String message,
      Map<String, dynamic> details,
      bool isResolved});
}

/// @nodoc
class __$$PerformanceAlertImplCopyWithImpl<$Res>
    extends _$PerformanceAlertCopyWithImpl<$Res, _$PerformanceAlertImpl>
    implements _$$PerformanceAlertImplCopyWith<$Res> {
  __$$PerformanceAlertImplCopyWithImpl(_$PerformanceAlertImpl _value,
      $Res Function(_$PerformanceAlertImpl) _then)
      : super(_value, _then);

  /// Create a copy of PerformanceAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? type = null,
    Object? severity = null,
    Object? message = null,
    Object? details = null,
    Object? isResolved = null,
  }) {
    return _then(_$PerformanceAlertImpl(
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
              as PerformanceAlertType,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as PerformanceAlertSeverity,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isResolved: null == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformanceAlertImpl implements _PerformanceAlert {
  const _$PerformanceAlertImpl(
      {required this.id,
      required this.timestamp,
      required this.type,
      required this.severity,
      required this.message,
      required final Map<String, dynamic> details,
      this.isResolved = false})
      : _details = details;

  factory _$PerformanceAlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceAlertImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime timestamp;
  @override
  final PerformanceAlertType type;
  @override
  final PerformanceAlertSeverity severity;
  @override
  final String message;
  final Map<String, dynamic> _details;
  @override
  Map<String, dynamic> get details {
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_details);
  }

  @override
  @JsonKey()
  final bool isResolved;

  @override
  String toString() {
    return 'PerformanceAlert(id: $id, timestamp: $timestamp, type: $type, severity: $severity, message: $message, details: $details, isResolved: $isResolved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceAlertImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.isResolved, isResolved) ||
                other.isResolved == isResolved));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, timestamp, type, severity,
      message, const DeepCollectionEquality().hash(_details), isResolved);

  /// Create a copy of PerformanceAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceAlertImplCopyWith<_$PerformanceAlertImpl> get copyWith =>
      __$$PerformanceAlertImplCopyWithImpl<_$PerformanceAlertImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformanceAlertImplToJson(
      this,
    );
  }
}

abstract class _PerformanceAlert implements PerformanceAlert {
  const factory _PerformanceAlert(
      {required final String id,
      required final DateTime timestamp,
      required final PerformanceAlertType type,
      required final PerformanceAlertSeverity severity,
      required final String message,
      required final Map<String, dynamic> details,
      final bool isResolved}) = _$PerformanceAlertImpl;

  factory _PerformanceAlert.fromJson(Map<String, dynamic> json) =
      _$PerformanceAlertImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get timestamp;
  @override
  PerformanceAlertType get type;
  @override
  PerformanceAlertSeverity get severity;
  @override
  String get message;
  @override
  Map<String, dynamic> get details;
  @override
  bool get isResolved;

  /// Create a copy of PerformanceAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerformanceAlertImplCopyWith<_$PerformanceAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PerformanceTrend _$PerformanceTrendFromJson(Map<String, dynamic> json) {
  return _PerformanceTrend.fromJson(json);
}

/// @nodoc
mixin _$PerformanceTrend {
  List<AppPerformance> get dataPoints => throw _privateConstructorUsedError;
  Map<String, double> get averages => throw _privateConstructorUsedError;
  Map<String, TrendDirection> get trends => throw _privateConstructorUsedError;
  DateTime get periodStart => throw _privateConstructorUsedError;
  DateTime get periodEnd => throw _privateConstructorUsedError;

  /// Serializes this PerformanceTrend to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PerformanceTrend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerformanceTrendCopyWith<PerformanceTrend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceTrendCopyWith<$Res> {
  factory $PerformanceTrendCopyWith(
          PerformanceTrend value, $Res Function(PerformanceTrend) then) =
      _$PerformanceTrendCopyWithImpl<$Res, PerformanceTrend>;
  @useResult
  $Res call(
      {List<AppPerformance> dataPoints,
      Map<String, double> averages,
      Map<String, TrendDirection> trends,
      DateTime periodStart,
      DateTime periodEnd});
}

/// @nodoc
class _$PerformanceTrendCopyWithImpl<$Res, $Val extends PerformanceTrend>
    implements $PerformanceTrendCopyWith<$Res> {
  _$PerformanceTrendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerformanceTrend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataPoints = null,
    Object? averages = null,
    Object? trends = null,
    Object? periodStart = null,
    Object? periodEnd = null,
  }) {
    return _then(_value.copyWith(
      dataPoints: null == dataPoints
          ? _value.dataPoints
          : dataPoints // ignore: cast_nullable_to_non_nullable
              as List<AppPerformance>,
      averages: null == averages
          ? _value.averages
          : averages // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      trends: null == trends
          ? _value.trends
          : trends // ignore: cast_nullable_to_non_nullable
              as Map<String, TrendDirection>,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerformanceTrendImplCopyWith<$Res>
    implements $PerformanceTrendCopyWith<$Res> {
  factory _$$PerformanceTrendImplCopyWith(_$PerformanceTrendImpl value,
          $Res Function(_$PerformanceTrendImpl) then) =
      __$$PerformanceTrendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AppPerformance> dataPoints,
      Map<String, double> averages,
      Map<String, TrendDirection> trends,
      DateTime periodStart,
      DateTime periodEnd});
}

/// @nodoc
class __$$PerformanceTrendImplCopyWithImpl<$Res>
    extends _$PerformanceTrendCopyWithImpl<$Res, _$PerformanceTrendImpl>
    implements _$$PerformanceTrendImplCopyWith<$Res> {
  __$$PerformanceTrendImplCopyWithImpl(_$PerformanceTrendImpl _value,
      $Res Function(_$PerformanceTrendImpl) _then)
      : super(_value, _then);

  /// Create a copy of PerformanceTrend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataPoints = null,
    Object? averages = null,
    Object? trends = null,
    Object? periodStart = null,
    Object? periodEnd = null,
  }) {
    return _then(_$PerformanceTrendImpl(
      dataPoints: null == dataPoints
          ? _value._dataPoints
          : dataPoints // ignore: cast_nullable_to_non_nullable
              as List<AppPerformance>,
      averages: null == averages
          ? _value._averages
          : averages // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      trends: null == trends
          ? _value._trends
          : trends // ignore: cast_nullable_to_non_nullable
              as Map<String, TrendDirection>,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformanceTrendImpl implements _PerformanceTrend {
  const _$PerformanceTrendImpl(
      {required final List<AppPerformance> dataPoints,
      required final Map<String, double> averages,
      required final Map<String, TrendDirection> trends,
      required this.periodStart,
      required this.periodEnd})
      : _dataPoints = dataPoints,
        _averages = averages,
        _trends = trends;

  factory _$PerformanceTrendImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceTrendImplFromJson(json);

  final List<AppPerformance> _dataPoints;
  @override
  List<AppPerformance> get dataPoints {
    if (_dataPoints is EqualUnmodifiableListView) return _dataPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataPoints);
  }

  final Map<String, double> _averages;
  @override
  Map<String, double> get averages {
    if (_averages is EqualUnmodifiableMapView) return _averages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_averages);
  }

  final Map<String, TrendDirection> _trends;
  @override
  Map<String, TrendDirection> get trends {
    if (_trends is EqualUnmodifiableMapView) return _trends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_trends);
  }

  @override
  final DateTime periodStart;
  @override
  final DateTime periodEnd;

  @override
  String toString() {
    return 'PerformanceTrend(dataPoints: $dataPoints, averages: $averages, trends: $trends, periodStart: $periodStart, periodEnd: $periodEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceTrendImpl &&
            const DeepCollectionEquality()
                .equals(other._dataPoints, _dataPoints) &&
            const DeepCollectionEquality().equals(other._averages, _averages) &&
            const DeepCollectionEquality().equals(other._trends, _trends) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_dataPoints),
      const DeepCollectionEquality().hash(_averages),
      const DeepCollectionEquality().hash(_trends),
      periodStart,
      periodEnd);

  /// Create a copy of PerformanceTrend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceTrendImplCopyWith<_$PerformanceTrendImpl> get copyWith =>
      __$$PerformanceTrendImplCopyWithImpl<_$PerformanceTrendImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformanceTrendImplToJson(
      this,
    );
  }
}

abstract class _PerformanceTrend implements PerformanceTrend {
  const factory _PerformanceTrend(
      {required final List<AppPerformance> dataPoints,
      required final Map<String, double> averages,
      required final Map<String, TrendDirection> trends,
      required final DateTime periodStart,
      required final DateTime periodEnd}) = _$PerformanceTrendImpl;

  factory _PerformanceTrend.fromJson(Map<String, dynamic> json) =
      _$PerformanceTrendImpl.fromJson;

  @override
  List<AppPerformance> get dataPoints;
  @override
  Map<String, double> get averages;
  @override
  Map<String, TrendDirection> get trends;
  @override
  DateTime get periodStart;
  @override
  DateTime get periodEnd;

  /// Create a copy of PerformanceTrend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerformanceTrendImplCopyWith<_$PerformanceTrendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
