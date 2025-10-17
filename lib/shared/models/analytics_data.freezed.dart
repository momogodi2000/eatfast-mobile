// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnalyticsCard _$AnalyticsCardFromJson(Map<String, dynamic> json) {
  return _AnalyticsCard.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsCard {
  String get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  double? get trend => throw _privateConstructorUsedError;
  TrendDirection? get trendDirection => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  IconData? get icon => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get color => throw _privateConstructorUsedError;
  CardType? get cardType => throw _privateConstructorUsedError;

  /// Serializes this AnalyticsCard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsCardCopyWith<AnalyticsCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsCardCopyWith<$Res> {
  factory $AnalyticsCardCopyWith(
          AnalyticsCard value, $Res Function(AnalyticsCard) then) =
      _$AnalyticsCardCopyWithImpl<$Res, AnalyticsCard>;
  @useResult
  $Res call(
      {String title,
      String? subtitle,
      String value,
      double? trend,
      TrendDirection? trendDirection,
      @JsonKey(includeFromJson: false, includeToJson: false) IconData? icon,
      @JsonKey(includeFromJson: false, includeToJson: false) Color? color,
      CardType? cardType});
}

/// @nodoc
class _$AnalyticsCardCopyWithImpl<$Res, $Val extends AnalyticsCard>
    implements $AnalyticsCardCopyWith<$Res> {
  _$AnalyticsCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = freezed,
    Object? value = null,
    Object? trend = freezed,
    Object? trendDirection = freezed,
    Object? icon = freezed,
    Object? color = freezed,
    Object? cardType = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      trend: freezed == trend
          ? _value.trend
          : trend // ignore: cast_nullable_to_non_nullable
              as double?,
      trendDirection: freezed == trendDirection
          ? _value.trendDirection
          : trendDirection // ignore: cast_nullable_to_non_nullable
              as TrendDirection?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      cardType: freezed == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as CardType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsCardImplCopyWith<$Res>
    implements $AnalyticsCardCopyWith<$Res> {
  factory _$$AnalyticsCardImplCopyWith(
          _$AnalyticsCardImpl value, $Res Function(_$AnalyticsCardImpl) then) =
      __$$AnalyticsCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String? subtitle,
      String value,
      double? trend,
      TrendDirection? trendDirection,
      @JsonKey(includeFromJson: false, includeToJson: false) IconData? icon,
      @JsonKey(includeFromJson: false, includeToJson: false) Color? color,
      CardType? cardType});
}

/// @nodoc
class __$$AnalyticsCardImplCopyWithImpl<$Res>
    extends _$AnalyticsCardCopyWithImpl<$Res, _$AnalyticsCardImpl>
    implements _$$AnalyticsCardImplCopyWith<$Res> {
  __$$AnalyticsCardImplCopyWithImpl(
      _$AnalyticsCardImpl _value, $Res Function(_$AnalyticsCardImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = freezed,
    Object? value = null,
    Object? trend = freezed,
    Object? trendDirection = freezed,
    Object? icon = freezed,
    Object? color = freezed,
    Object? cardType = freezed,
  }) {
    return _then(_$AnalyticsCardImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      trend: freezed == trend
          ? _value.trend
          : trend // ignore: cast_nullable_to_non_nullable
              as double?,
      trendDirection: freezed == trendDirection
          ? _value.trendDirection
          : trendDirection // ignore: cast_nullable_to_non_nullable
              as TrendDirection?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      cardType: freezed == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as CardType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsCardImpl implements _AnalyticsCard {
  const _$AnalyticsCardImpl(
      {required this.title,
      this.subtitle,
      required this.value,
      this.trend,
      this.trendDirection,
      @JsonKey(includeFromJson: false, includeToJson: false) this.icon,
      @JsonKey(includeFromJson: false, includeToJson: false) this.color,
      this.cardType});

  factory _$AnalyticsCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsCardImplFromJson(json);

  @override
  final String title;
  @override
  final String? subtitle;
  @override
  final String value;
  @override
  final double? trend;
  @override
  final TrendDirection? trendDirection;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final IconData? icon;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Color? color;
  @override
  final CardType? cardType;

  @override
  String toString() {
    return 'AnalyticsCard(title: $title, subtitle: $subtitle, value: $value, trend: $trend, trendDirection: $trendDirection, icon: $icon, color: $color, cardType: $cardType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsCardImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.trend, trend) || other.trend == trend) &&
            (identical(other.trendDirection, trendDirection) ||
                other.trendDirection == trendDirection) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.cardType, cardType) ||
                other.cardType == cardType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle, value, trend,
      trendDirection, icon, color, cardType);

  /// Create a copy of AnalyticsCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsCardImplCopyWith<_$AnalyticsCardImpl> get copyWith =>
      __$$AnalyticsCardImplCopyWithImpl<_$AnalyticsCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsCardImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsCard implements AnalyticsCard {
  const factory _AnalyticsCard(
      {required final String title,
      final String? subtitle,
      required final String value,
      final double? trend,
      final TrendDirection? trendDirection,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final IconData? icon,
      @JsonKey(includeFromJson: false, includeToJson: false) final Color? color,
      final CardType? cardType}) = _$AnalyticsCardImpl;

  factory _AnalyticsCard.fromJson(Map<String, dynamic> json) =
      _$AnalyticsCardImpl.fromJson;

  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String get value;
  @override
  double? get trend;
  @override
  TrendDirection? get trendDirection;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  IconData? get icon;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get color;
  @override
  CardType? get cardType;

  /// Create a copy of AnalyticsCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsCardImplCopyWith<_$AnalyticsCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataPoint _$DataPointFromJson(Map<String, dynamic> json) {
  return _DataPoint.fromJson(json);
}

/// @nodoc
mixin _$DataPoint {
  DateTime get date => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  /// Serializes this DataPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataPointCopyWith<DataPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataPointCopyWith<$Res> {
  factory $DataPointCopyWith(DataPoint value, $Res Function(DataPoint) then) =
      _$DataPointCopyWithImpl<$Res, DataPoint>;
  @useResult
  $Res call({DateTime date, double value});
}

/// @nodoc
class _$DataPointCopyWithImpl<$Res, $Val extends DataPoint>
    implements $DataPointCopyWith<$Res> {
  _$DataPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataPointImplCopyWith<$Res>
    implements $DataPointCopyWith<$Res> {
  factory _$$DataPointImplCopyWith(
          _$DataPointImpl value, $Res Function(_$DataPointImpl) then) =
      __$$DataPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double value});
}

/// @nodoc
class __$$DataPointImplCopyWithImpl<$Res>
    extends _$DataPointCopyWithImpl<$Res, _$DataPointImpl>
    implements _$$DataPointImplCopyWith<$Res> {
  __$$DataPointImplCopyWithImpl(
      _$DataPointImpl _value, $Res Function(_$DataPointImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? value = null,
  }) {
    return _then(_$DataPointImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataPointImpl implements _DataPoint {
  const _$DataPointImpl({required this.date, required this.value});

  factory _$DataPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataPointImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double value;

  @override
  String toString() {
    return 'DataPoint(date: $date, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataPointImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, value);

  /// Create a copy of DataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataPointImplCopyWith<_$DataPointImpl> get copyWith =>
      __$$DataPointImplCopyWithImpl<_$DataPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataPointImplToJson(
      this,
    );
  }
}

abstract class _DataPoint implements DataPoint {
  const factory _DataPoint(
      {required final DateTime date,
      required final double value}) = _$DataPointImpl;

  factory _DataPoint.fromJson(Map<String, dynamic> json) =
      _$DataPointImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get value;

  /// Create a copy of DataPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataPointImplCopyWith<_$DataPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerInsights _$CustomerInsightsFromJson(Map<String, dynamic> json) {
  return _CustomerInsights.fromJson(json);
}

/// @nodoc
mixin _$CustomerInsights {
  List<CustomerSegment> get segments => throw _privateConstructorUsedError;
  Map<String, double> get demographics => throw _privateConstructorUsedError;
  List<String> get topPreferences => throw _privateConstructorUsedError;

  /// Serializes this CustomerInsights to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerInsights
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerInsightsCopyWith<CustomerInsights> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerInsightsCopyWith<$Res> {
  factory $CustomerInsightsCopyWith(
          CustomerInsights value, $Res Function(CustomerInsights) then) =
      _$CustomerInsightsCopyWithImpl<$Res, CustomerInsights>;
  @useResult
  $Res call(
      {List<CustomerSegment> segments,
      Map<String, double> demographics,
      List<String> topPreferences});
}

/// @nodoc
class _$CustomerInsightsCopyWithImpl<$Res, $Val extends CustomerInsights>
    implements $CustomerInsightsCopyWith<$Res> {
  _$CustomerInsightsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerInsights
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? segments = null,
    Object? demographics = null,
    Object? topPreferences = null,
  }) {
    return _then(_value.copyWith(
      segments: null == segments
          ? _value.segments
          : segments // ignore: cast_nullable_to_non_nullable
              as List<CustomerSegment>,
      demographics: null == demographics
          ? _value.demographics
          : demographics // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      topPreferences: null == topPreferences
          ? _value.topPreferences
          : topPreferences // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerInsightsImplCopyWith<$Res>
    implements $CustomerInsightsCopyWith<$Res> {
  factory _$$CustomerInsightsImplCopyWith(_$CustomerInsightsImpl value,
          $Res Function(_$CustomerInsightsImpl) then) =
      __$$CustomerInsightsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CustomerSegment> segments,
      Map<String, double> demographics,
      List<String> topPreferences});
}

/// @nodoc
class __$$CustomerInsightsImplCopyWithImpl<$Res>
    extends _$CustomerInsightsCopyWithImpl<$Res, _$CustomerInsightsImpl>
    implements _$$CustomerInsightsImplCopyWith<$Res> {
  __$$CustomerInsightsImplCopyWithImpl(_$CustomerInsightsImpl _value,
      $Res Function(_$CustomerInsightsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerInsights
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? segments = null,
    Object? demographics = null,
    Object? topPreferences = null,
  }) {
    return _then(_$CustomerInsightsImpl(
      segments: null == segments
          ? _value._segments
          : segments // ignore: cast_nullable_to_non_nullable
              as List<CustomerSegment>,
      demographics: null == demographics
          ? _value._demographics
          : demographics // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      topPreferences: null == topPreferences
          ? _value._topPreferences
          : topPreferences // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerInsightsImpl implements _CustomerInsights {
  const _$CustomerInsightsImpl(
      {required final List<CustomerSegment> segments,
      required final Map<String, double> demographics,
      required final List<String> topPreferences})
      : _segments = segments,
        _demographics = demographics,
        _topPreferences = topPreferences;

  factory _$CustomerInsightsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerInsightsImplFromJson(json);

  final List<CustomerSegment> _segments;
  @override
  List<CustomerSegment> get segments {
    if (_segments is EqualUnmodifiableListView) return _segments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_segments);
  }

  final Map<String, double> _demographics;
  @override
  Map<String, double> get demographics {
    if (_demographics is EqualUnmodifiableMapView) return _demographics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_demographics);
  }

  final List<String> _topPreferences;
  @override
  List<String> get topPreferences {
    if (_topPreferences is EqualUnmodifiableListView) return _topPreferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topPreferences);
  }

  @override
  String toString() {
    return 'CustomerInsights(segments: $segments, demographics: $demographics, topPreferences: $topPreferences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerInsightsImpl &&
            const DeepCollectionEquality().equals(other._segments, _segments) &&
            const DeepCollectionEquality()
                .equals(other._demographics, _demographics) &&
            const DeepCollectionEquality()
                .equals(other._topPreferences, _topPreferences));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_segments),
      const DeepCollectionEquality().hash(_demographics),
      const DeepCollectionEquality().hash(_topPreferences));

  /// Create a copy of CustomerInsights
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerInsightsImplCopyWith<_$CustomerInsightsImpl> get copyWith =>
      __$$CustomerInsightsImplCopyWithImpl<_$CustomerInsightsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerInsightsImplToJson(
      this,
    );
  }
}

abstract class _CustomerInsights implements CustomerInsights {
  const factory _CustomerInsights(
      {required final List<CustomerSegment> segments,
      required final Map<String, double> demographics,
      required final List<String> topPreferences}) = _$CustomerInsightsImpl;

  factory _CustomerInsights.fromJson(Map<String, dynamic> json) =
      _$CustomerInsightsImpl.fromJson;

  @override
  List<CustomerSegment> get segments;
  @override
  Map<String, double> get demographics;
  @override
  List<String> get topPreferences;

  /// Create a copy of CustomerInsights
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerInsightsImplCopyWith<_$CustomerInsightsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerSegment _$CustomerSegmentFromJson(Map<String, dynamic> json) {
  return _CustomerSegment.fromJson(json);
}

/// @nodoc
mixin _$CustomerSegment {
  String get name => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;
  double get avgOrderValue => throw _privateConstructorUsedError;

  /// Serializes this CustomerSegment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerSegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerSegmentCopyWith<CustomerSegment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerSegmentCopyWith<$Res> {
  factory $CustomerSegmentCopyWith(
          CustomerSegment value, $Res Function(CustomerSegment) then) =
      _$CustomerSegmentCopyWithImpl<$Res, CustomerSegment>;
  @useResult
  $Res call({String name, int count, double percentage, double avgOrderValue});
}

/// @nodoc
class _$CustomerSegmentCopyWithImpl<$Res, $Val extends CustomerSegment>
    implements $CustomerSegmentCopyWith<$Res> {
  _$CustomerSegmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerSegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? count = null,
    Object? percentage = null,
    Object? avgOrderValue = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      avgOrderValue: null == avgOrderValue
          ? _value.avgOrderValue
          : avgOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerSegmentImplCopyWith<$Res>
    implements $CustomerSegmentCopyWith<$Res> {
  factory _$$CustomerSegmentImplCopyWith(_$CustomerSegmentImpl value,
          $Res Function(_$CustomerSegmentImpl) then) =
      __$$CustomerSegmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int count, double percentage, double avgOrderValue});
}

/// @nodoc
class __$$CustomerSegmentImplCopyWithImpl<$Res>
    extends _$CustomerSegmentCopyWithImpl<$Res, _$CustomerSegmentImpl>
    implements _$$CustomerSegmentImplCopyWith<$Res> {
  __$$CustomerSegmentImplCopyWithImpl(
      _$CustomerSegmentImpl _value, $Res Function(_$CustomerSegmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerSegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? count = null,
    Object? percentage = null,
    Object? avgOrderValue = null,
  }) {
    return _then(_$CustomerSegmentImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      avgOrderValue: null == avgOrderValue
          ? _value.avgOrderValue
          : avgOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerSegmentImpl implements _CustomerSegment {
  const _$CustomerSegmentImpl(
      {required this.name,
      required this.count,
      required this.percentage,
      required this.avgOrderValue});

  factory _$CustomerSegmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerSegmentImplFromJson(json);

  @override
  final String name;
  @override
  final int count;
  @override
  final double percentage;
  @override
  final double avgOrderValue;

  @override
  String toString() {
    return 'CustomerSegment(name: $name, count: $count, percentage: $percentage, avgOrderValue: $avgOrderValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerSegmentImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.avgOrderValue, avgOrderValue) ||
                other.avgOrderValue == avgOrderValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, count, percentage, avgOrderValue);

  /// Create a copy of CustomerSegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerSegmentImplCopyWith<_$CustomerSegmentImpl> get copyWith =>
      __$$CustomerSegmentImplCopyWithImpl<_$CustomerSegmentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerSegmentImplToJson(
      this,
    );
  }
}

abstract class _CustomerSegment implements CustomerSegment {
  const factory _CustomerSegment(
      {required final String name,
      required final int count,
      required final double percentage,
      required final double avgOrderValue}) = _$CustomerSegmentImpl;

  factory _CustomerSegment.fromJson(Map<String, dynamic> json) =
      _$CustomerSegmentImpl.fromJson;

  @override
  String get name;
  @override
  int get count;
  @override
  double get percentage;
  @override
  double get avgOrderValue;

  /// Create a copy of CustomerSegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerSegmentImplCopyWith<_$CustomerSegmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderTrendPoint _$OrderTrendPointFromJson(Map<String, dynamic> json) {
  return _OrderTrendPoint.fromJson(json);
}

/// @nodoc
mixin _$OrderTrendPoint {
  DateTime get date => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get growthRate => throw _privateConstructorUsedError;

  /// Serializes this OrderTrendPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderTrendPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderTrendPointCopyWith<OrderTrendPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTrendPointCopyWith<$Res> {
  factory $OrderTrendPointCopyWith(
          OrderTrendPoint value, $Res Function(OrderTrendPoint) then) =
      _$OrderTrendPointCopyWithImpl<$Res, OrderTrendPoint>;
  @useResult
  $Res call({DateTime date, int count, double growthRate});
}

/// @nodoc
class _$OrderTrendPointCopyWithImpl<$Res, $Val extends OrderTrendPoint>
    implements $OrderTrendPointCopyWith<$Res> {
  _$OrderTrendPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderTrendPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? count = null,
    Object? growthRate = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      growthRate: null == growthRate
          ? _value.growthRate
          : growthRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderTrendPointImplCopyWith<$Res>
    implements $OrderTrendPointCopyWith<$Res> {
  factory _$$OrderTrendPointImplCopyWith(_$OrderTrendPointImpl value,
          $Res Function(_$OrderTrendPointImpl) then) =
      __$$OrderTrendPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, int count, double growthRate});
}

/// @nodoc
class __$$OrderTrendPointImplCopyWithImpl<$Res>
    extends _$OrderTrendPointCopyWithImpl<$Res, _$OrderTrendPointImpl>
    implements _$$OrderTrendPointImplCopyWith<$Res> {
  __$$OrderTrendPointImplCopyWithImpl(
      _$OrderTrendPointImpl _value, $Res Function(_$OrderTrendPointImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderTrendPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? count = null,
    Object? growthRate = null,
  }) {
    return _then(_$OrderTrendPointImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      growthRate: null == growthRate
          ? _value.growthRate
          : growthRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderTrendPointImpl implements _OrderTrendPoint {
  const _$OrderTrendPointImpl(
      {required this.date, required this.count, required this.growthRate});

  factory _$OrderTrendPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderTrendPointImplFromJson(json);

  @override
  final DateTime date;
  @override
  final int count;
  @override
  final double growthRate;

  @override
  String toString() {
    return 'OrderTrendPoint(date: $date, count: $count, growthRate: $growthRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderTrendPointImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.growthRate, growthRate) ||
                other.growthRate == growthRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, count, growthRate);

  /// Create a copy of OrderTrendPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderTrendPointImplCopyWith<_$OrderTrendPointImpl> get copyWith =>
      __$$OrderTrendPointImplCopyWithImpl<_$OrderTrendPointImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderTrendPointImplToJson(
      this,
    );
  }
}

abstract class _OrderTrendPoint implements OrderTrendPoint {
  const factory _OrderTrendPoint(
      {required final DateTime date,
      required final int count,
      required final double growthRate}) = _$OrderTrendPointImpl;

  factory _OrderTrendPoint.fromJson(Map<String, dynamic> json) =
      _$OrderTrendPointImpl.fromJson;

  @override
  DateTime get date;
  @override
  int get count;
  @override
  double get growthRate;

  /// Create a copy of OrderTrendPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderTrendPointImplCopyWith<_$OrderTrendPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PerformanceMetrics _$PerformanceMetricsFromJson(Map<String, dynamic> json) {
  return _PerformanceMetrics.fromJson(json);
}

/// @nodoc
mixin _$PerformanceMetrics {
  double get deliveryTime => throw _privateConstructorUsedError;
  double get customerSatisfaction => throw _privateConstructorUsedError;
  double get orderAccuracy => throw _privateConstructorUsedError;
  PerformanceStatus get status => throw _privateConstructorUsedError;

  /// Serializes this PerformanceMetrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PerformanceMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerformanceMetricsCopyWith<PerformanceMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceMetricsCopyWith<$Res> {
  factory $PerformanceMetricsCopyWith(
          PerformanceMetrics value, $Res Function(PerformanceMetrics) then) =
      _$PerformanceMetricsCopyWithImpl<$Res, PerformanceMetrics>;
  @useResult
  $Res call(
      {double deliveryTime,
      double customerSatisfaction,
      double orderAccuracy,
      PerformanceStatus status});
}

/// @nodoc
class _$PerformanceMetricsCopyWithImpl<$Res, $Val extends PerformanceMetrics>
    implements $PerformanceMetricsCopyWith<$Res> {
  _$PerformanceMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerformanceMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryTime = null,
    Object? customerSatisfaction = null,
    Object? orderAccuracy = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      deliveryTime: null == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as double,
      customerSatisfaction: null == customerSatisfaction
          ? _value.customerSatisfaction
          : customerSatisfaction // ignore: cast_nullable_to_non_nullable
              as double,
      orderAccuracy: null == orderAccuracy
          ? _value.orderAccuracy
          : orderAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PerformanceStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerformanceMetricsImplCopyWith<$Res>
    implements $PerformanceMetricsCopyWith<$Res> {
  factory _$$PerformanceMetricsImplCopyWith(_$PerformanceMetricsImpl value,
          $Res Function(_$PerformanceMetricsImpl) then) =
      __$$PerformanceMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double deliveryTime,
      double customerSatisfaction,
      double orderAccuracy,
      PerformanceStatus status});
}

/// @nodoc
class __$$PerformanceMetricsImplCopyWithImpl<$Res>
    extends _$PerformanceMetricsCopyWithImpl<$Res, _$PerformanceMetricsImpl>
    implements _$$PerformanceMetricsImplCopyWith<$Res> {
  __$$PerformanceMetricsImplCopyWithImpl(_$PerformanceMetricsImpl _value,
      $Res Function(_$PerformanceMetricsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PerformanceMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryTime = null,
    Object? customerSatisfaction = null,
    Object? orderAccuracy = null,
    Object? status = null,
  }) {
    return _then(_$PerformanceMetricsImpl(
      deliveryTime: null == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as double,
      customerSatisfaction: null == customerSatisfaction
          ? _value.customerSatisfaction
          : customerSatisfaction // ignore: cast_nullable_to_non_nullable
              as double,
      orderAccuracy: null == orderAccuracy
          ? _value.orderAccuracy
          : orderAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PerformanceStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformanceMetricsImpl implements _PerformanceMetrics {
  const _$PerformanceMetricsImpl(
      {required this.deliveryTime,
      required this.customerSatisfaction,
      required this.orderAccuracy,
      required this.status});

  factory _$PerformanceMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceMetricsImplFromJson(json);

  @override
  final double deliveryTime;
  @override
  final double customerSatisfaction;
  @override
  final double orderAccuracy;
  @override
  final PerformanceStatus status;

  @override
  String toString() {
    return 'PerformanceMetrics(deliveryTime: $deliveryTime, customerSatisfaction: $customerSatisfaction, orderAccuracy: $orderAccuracy, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceMetricsImpl &&
            (identical(other.deliveryTime, deliveryTime) ||
                other.deliveryTime == deliveryTime) &&
            (identical(other.customerSatisfaction, customerSatisfaction) ||
                other.customerSatisfaction == customerSatisfaction) &&
            (identical(other.orderAccuracy, orderAccuracy) ||
                other.orderAccuracy == orderAccuracy) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, deliveryTime, customerSatisfaction, orderAccuracy, status);

  /// Create a copy of PerformanceMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceMetricsImplCopyWith<_$PerformanceMetricsImpl> get copyWith =>
      __$$PerformanceMetricsImplCopyWithImpl<_$PerformanceMetricsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformanceMetricsImplToJson(
      this,
    );
  }
}

abstract class _PerformanceMetrics implements PerformanceMetrics {
  const factory _PerformanceMetrics(
      {required final double deliveryTime,
      required final double customerSatisfaction,
      required final double orderAccuracy,
      required final PerformanceStatus status}) = _$PerformanceMetricsImpl;

  factory _PerformanceMetrics.fromJson(Map<String, dynamic> json) =
      _$PerformanceMetricsImpl.fromJson;

  @override
  double get deliveryTime;
  @override
  double get customerSatisfaction;
  @override
  double get orderAccuracy;
  @override
  PerformanceStatus get status;

  /// Create a copy of PerformanceMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerformanceMetricsImplCopyWith<_$PerformanceMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RevenuePoint _$RevenuePointFromJson(Map<String, dynamic> json) {
  return _RevenuePoint.fromJson(json);
}

/// @nodoc
mixin _$RevenuePoint {
  DateTime get date => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get growthRate => throw _privateConstructorUsedError;

  /// Serializes this RevenuePoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RevenuePoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RevenuePointCopyWith<RevenuePoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RevenuePointCopyWith<$Res> {
  factory $RevenuePointCopyWith(
          RevenuePoint value, $Res Function(RevenuePoint) then) =
      _$RevenuePointCopyWithImpl<$Res, RevenuePoint>;
  @useResult
  $Res call({DateTime date, double amount, double growthRate});
}

/// @nodoc
class _$RevenuePointCopyWithImpl<$Res, $Val extends RevenuePoint>
    implements $RevenuePointCopyWith<$Res> {
  _$RevenuePointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RevenuePoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? amount = null,
    Object? growthRate = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      growthRate: null == growthRate
          ? _value.growthRate
          : growthRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RevenuePointImplCopyWith<$Res>
    implements $RevenuePointCopyWith<$Res> {
  factory _$$RevenuePointImplCopyWith(
          _$RevenuePointImpl value, $Res Function(_$RevenuePointImpl) then) =
      __$$RevenuePointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double amount, double growthRate});
}

/// @nodoc
class __$$RevenuePointImplCopyWithImpl<$Res>
    extends _$RevenuePointCopyWithImpl<$Res, _$RevenuePointImpl>
    implements _$$RevenuePointImplCopyWith<$Res> {
  __$$RevenuePointImplCopyWithImpl(
      _$RevenuePointImpl _value, $Res Function(_$RevenuePointImpl) _then)
      : super(_value, _then);

  /// Create a copy of RevenuePoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? amount = null,
    Object? growthRate = null,
  }) {
    return _then(_$RevenuePointImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      growthRate: null == growthRate
          ? _value.growthRate
          : growthRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RevenuePointImpl implements _RevenuePoint {
  const _$RevenuePointImpl(
      {required this.date, required this.amount, required this.growthRate});

  factory _$RevenuePointImpl.fromJson(Map<String, dynamic> json) =>
      _$$RevenuePointImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double amount;
  @override
  final double growthRate;

  @override
  String toString() {
    return 'RevenuePoint(date: $date, amount: $amount, growthRate: $growthRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RevenuePointImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.growthRate, growthRate) ||
                other.growthRate == growthRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, amount, growthRate);

  /// Create a copy of RevenuePoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RevenuePointImplCopyWith<_$RevenuePointImpl> get copyWith =>
      __$$RevenuePointImplCopyWithImpl<_$RevenuePointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RevenuePointImplToJson(
      this,
    );
  }
}

abstract class _RevenuePoint implements RevenuePoint {
  const factory _RevenuePoint(
      {required final DateTime date,
      required final double amount,
      required final double growthRate}) = _$RevenuePointImpl;

  factory _RevenuePoint.fromJson(Map<String, dynamic> json) =
      _$RevenuePointImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get amount;
  @override
  double get growthRate;

  /// Create a copy of RevenuePoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RevenuePointImplCopyWith<_$RevenuePointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
