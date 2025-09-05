// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnalyticsDashboard _$AnalyticsDashboardFromJson(Map<String, dynamic> json) {
  return _AnalyticsDashboard.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsDashboard {
  String get dashboardId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DashboardType get type => throw _privateConstructorUsedError;
  List<AnalyticsCard> get cards => throw _privateConstructorUsedError;
  List<AnalyticsChart> get charts => throw _privateConstructorUsedError;
  List<KPIMetric> get kpis => throw _privateConstructorUsedError;
  PerformanceInsights get insights => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this AnalyticsDashboard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsDashboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsDashboardCopyWith<AnalyticsDashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsDashboardCopyWith<$Res> {
  factory $AnalyticsDashboardCopyWith(
          AnalyticsDashboard value, $Res Function(AnalyticsDashboard) then) =
      _$AnalyticsDashboardCopyWithImpl<$Res, AnalyticsDashboard>;
  @useResult
  $Res call(
      {String dashboardId,
      String userId,
      DashboardType type,
      List<AnalyticsCard> cards,
      List<AnalyticsChart> charts,
      List<KPIMetric> kpis,
      PerformanceInsights insights,
      DateTime generatedAt,
      DateTime? lastUpdated});

  $PerformanceInsightsCopyWith<$Res> get insights;
}

/// @nodoc
class _$AnalyticsDashboardCopyWithImpl<$Res, $Val extends AnalyticsDashboard>
    implements $AnalyticsDashboardCopyWith<$Res> {
  _$AnalyticsDashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsDashboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dashboardId = null,
    Object? userId = null,
    Object? type = null,
    Object? cards = null,
    Object? charts = null,
    Object? kpis = null,
    Object? insights = null,
    Object? generatedAt = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      dashboardId: null == dashboardId
          ? _value.dashboardId
          : dashboardId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DashboardType,
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<AnalyticsCard>,
      charts: null == charts
          ? _value.charts
          : charts // ignore: cast_nullable_to_non_nullable
              as List<AnalyticsChart>,
      kpis: null == kpis
          ? _value.kpis
          : kpis // ignore: cast_nullable_to_non_nullable
              as List<KPIMetric>,
      insights: null == insights
          ? _value.insights
          : insights // ignore: cast_nullable_to_non_nullable
              as PerformanceInsights,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of AnalyticsDashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PerformanceInsightsCopyWith<$Res> get insights {
    return $PerformanceInsightsCopyWith<$Res>(_value.insights, (value) {
      return _then(_value.copyWith(insights: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalyticsDashboardImplCopyWith<$Res>
    implements $AnalyticsDashboardCopyWith<$Res> {
  factory _$$AnalyticsDashboardImplCopyWith(_$AnalyticsDashboardImpl value,
          $Res Function(_$AnalyticsDashboardImpl) then) =
      __$$AnalyticsDashboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dashboardId,
      String userId,
      DashboardType type,
      List<AnalyticsCard> cards,
      List<AnalyticsChart> charts,
      List<KPIMetric> kpis,
      PerformanceInsights insights,
      DateTime generatedAt,
      DateTime? lastUpdated});

  @override
  $PerformanceInsightsCopyWith<$Res> get insights;
}

/// @nodoc
class __$$AnalyticsDashboardImplCopyWithImpl<$Res>
    extends _$AnalyticsDashboardCopyWithImpl<$Res, _$AnalyticsDashboardImpl>
    implements _$$AnalyticsDashboardImplCopyWith<$Res> {
  __$$AnalyticsDashboardImplCopyWithImpl(_$AnalyticsDashboardImpl _value,
      $Res Function(_$AnalyticsDashboardImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsDashboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dashboardId = null,
    Object? userId = null,
    Object? type = null,
    Object? cards = null,
    Object? charts = null,
    Object? kpis = null,
    Object? insights = null,
    Object? generatedAt = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$AnalyticsDashboardImpl(
      dashboardId: null == dashboardId
          ? _value.dashboardId
          : dashboardId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DashboardType,
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<AnalyticsCard>,
      charts: null == charts
          ? _value._charts
          : charts // ignore: cast_nullable_to_non_nullable
              as List<AnalyticsChart>,
      kpis: null == kpis
          ? _value._kpis
          : kpis // ignore: cast_nullable_to_non_nullable
              as List<KPIMetric>,
      insights: null == insights
          ? _value.insights
          : insights // ignore: cast_nullable_to_non_nullable
              as PerformanceInsights,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsDashboardImpl implements _AnalyticsDashboard {
  const _$AnalyticsDashboardImpl(
      {required this.dashboardId,
      required this.userId,
      required this.type,
      required final List<AnalyticsCard> cards,
      required final List<AnalyticsChart> charts,
      required final List<KPIMetric> kpis,
      required this.insights,
      required this.generatedAt,
      this.lastUpdated})
      : _cards = cards,
        _charts = charts,
        _kpis = kpis;

  factory _$AnalyticsDashboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsDashboardImplFromJson(json);

  @override
  final String dashboardId;
  @override
  final String userId;
  @override
  final DashboardType type;
  final List<AnalyticsCard> _cards;
  @override
  List<AnalyticsCard> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  final List<AnalyticsChart> _charts;
  @override
  List<AnalyticsChart> get charts {
    if (_charts is EqualUnmodifiableListView) return _charts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_charts);
  }

  final List<KPIMetric> _kpis;
  @override
  List<KPIMetric> get kpis {
    if (_kpis is EqualUnmodifiableListView) return _kpis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_kpis);
  }

  @override
  final PerformanceInsights insights;
  @override
  final DateTime generatedAt;
  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'AnalyticsDashboard(dashboardId: $dashboardId, userId: $userId, type: $type, cards: $cards, charts: $charts, kpis: $kpis, insights: $insights, generatedAt: $generatedAt, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsDashboardImpl &&
            (identical(other.dashboardId, dashboardId) ||
                other.dashboardId == dashboardId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            const DeepCollectionEquality().equals(other._charts, _charts) &&
            const DeepCollectionEquality().equals(other._kpis, _kpis) &&
            (identical(other.insights, insights) ||
                other.insights == insights) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dashboardId,
      userId,
      type,
      const DeepCollectionEquality().hash(_cards),
      const DeepCollectionEquality().hash(_charts),
      const DeepCollectionEquality().hash(_kpis),
      insights,
      generatedAt,
      lastUpdated);

  /// Create a copy of AnalyticsDashboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsDashboardImplCopyWith<_$AnalyticsDashboardImpl> get copyWith =>
      __$$AnalyticsDashboardImplCopyWithImpl<_$AnalyticsDashboardImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsDashboardImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsDashboard implements AnalyticsDashboard {
  const factory _AnalyticsDashboard(
      {required final String dashboardId,
      required final String userId,
      required final DashboardType type,
      required final List<AnalyticsCard> cards,
      required final List<AnalyticsChart> charts,
      required final List<KPIMetric> kpis,
      required final PerformanceInsights insights,
      required final DateTime generatedAt,
      final DateTime? lastUpdated}) = _$AnalyticsDashboardImpl;

  factory _AnalyticsDashboard.fromJson(Map<String, dynamic> json) =
      _$AnalyticsDashboardImpl.fromJson;

  @override
  String get dashboardId;
  @override
  String get userId;
  @override
  DashboardType get type;
  @override
  List<AnalyticsCard> get cards;
  @override
  List<AnalyticsChart> get charts;
  @override
  List<KPIMetric> get kpis;
  @override
  PerformanceInsights get insights;
  @override
  DateTime get generatedAt;
  @override
  DateTime? get lastUpdated;

  /// Create a copy of AnalyticsDashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsDashboardImplCopyWith<_$AnalyticsDashboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticsCard _$AnalyticsCardFromJson(Map<String, dynamic> json) {
  return _AnalyticsCard.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsCard {
  String get cardId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  CardType get type => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  double? get changePercent => throw _privateConstructorUsedError;
  TrendDirection? get trend => throw _privateConstructorUsedError;
  String? get period => throw _privateConstructorUsedError;
  List<DataPoint> get historicalData => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

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
      {String cardId,
      String title,
      String value,
      CardType type,
      String? subtitle,
      String? unit,
      double? changePercent,
      TrendDirection? trend,
      String? period,
      List<DataPoint> historicalData,
      Map<String, dynamic>? metadata});
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
    Object? cardId = null,
    Object? title = null,
    Object? value = null,
    Object? type = null,
    Object? subtitle = freezed,
    Object? unit = freezed,
    Object? changePercent = freezed,
    Object? trend = freezed,
    Object? period = freezed,
    Object? historicalData = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CardType,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      changePercent: freezed == changePercent
          ? _value.changePercent
          : changePercent // ignore: cast_nullable_to_non_nullable
              as double?,
      trend: freezed == trend
          ? _value.trend
          : trend // ignore: cast_nullable_to_non_nullable
              as TrendDirection?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String?,
      historicalData: null == historicalData
          ? _value.historicalData
          : historicalData // ignore: cast_nullable_to_non_nullable
              as List<DataPoint>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
      {String cardId,
      String title,
      String value,
      CardType type,
      String? subtitle,
      String? unit,
      double? changePercent,
      TrendDirection? trend,
      String? period,
      List<DataPoint> historicalData,
      Map<String, dynamic>? metadata});
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
    Object? cardId = null,
    Object? title = null,
    Object? value = null,
    Object? type = null,
    Object? subtitle = freezed,
    Object? unit = freezed,
    Object? changePercent = freezed,
    Object? trend = freezed,
    Object? period = freezed,
    Object? historicalData = null,
    Object? metadata = freezed,
  }) {
    return _then(_$AnalyticsCardImpl(
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CardType,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      changePercent: freezed == changePercent
          ? _value.changePercent
          : changePercent // ignore: cast_nullable_to_non_nullable
              as double?,
      trend: freezed == trend
          ? _value.trend
          : trend // ignore: cast_nullable_to_non_nullable
              as TrendDirection?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String?,
      historicalData: null == historicalData
          ? _value._historicalData
          : historicalData // ignore: cast_nullable_to_non_nullable
              as List<DataPoint>,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsCardImpl implements _AnalyticsCard {
  const _$AnalyticsCardImpl(
      {required this.cardId,
      required this.title,
      required this.value,
      required this.type,
      this.subtitle,
      this.unit,
      this.changePercent,
      this.trend,
      this.period,
      final List<DataPoint> historicalData = const [],
      final Map<String, dynamic>? metadata})
      : _historicalData = historicalData,
        _metadata = metadata;

  factory _$AnalyticsCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsCardImplFromJson(json);

  @override
  final String cardId;
  @override
  final String title;
  @override
  final String value;
  @override
  final CardType type;
  @override
  final String? subtitle;
  @override
  final String? unit;
  @override
  final double? changePercent;
  @override
  final TrendDirection? trend;
  @override
  final String? period;
  final List<DataPoint> _historicalData;
  @override
  @JsonKey()
  List<DataPoint> get historicalData {
    if (_historicalData is EqualUnmodifiableListView) return _historicalData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historicalData);
  }

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
    return 'AnalyticsCard(cardId: $cardId, title: $title, value: $value, type: $type, subtitle: $subtitle, unit: $unit, changePercent: $changePercent, trend: $trend, period: $period, historicalData: $historicalData, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsCardImpl &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.changePercent, changePercent) ||
                other.changePercent == changePercent) &&
            (identical(other.trend, trend) || other.trend == trend) &&
            (identical(other.period, period) || other.period == period) &&
            const DeepCollectionEquality()
                .equals(other._historicalData, _historicalData) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      cardId,
      title,
      value,
      type,
      subtitle,
      unit,
      changePercent,
      trend,
      period,
      const DeepCollectionEquality().hash(_historicalData),
      const DeepCollectionEquality().hash(_metadata));

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
      {required final String cardId,
      required final String title,
      required final String value,
      required final CardType type,
      final String? subtitle,
      final String? unit,
      final double? changePercent,
      final TrendDirection? trend,
      final String? period,
      final List<DataPoint> historicalData,
      final Map<String, dynamic>? metadata}) = _$AnalyticsCardImpl;

  factory _AnalyticsCard.fromJson(Map<String, dynamic> json) =
      _$AnalyticsCardImpl.fromJson;

  @override
  String get cardId;
  @override
  String get title;
  @override
  String get value;
  @override
  CardType get type;
  @override
  String? get subtitle;
  @override
  String? get unit;
  @override
  double? get changePercent;
  @override
  TrendDirection? get trend;
  @override
  String? get period;
  @override
  List<DataPoint> get historicalData;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of AnalyticsCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsCardImplCopyWith<_$AnalyticsCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticsChart _$AnalyticsChartFromJson(Map<String, dynamic> json) {
  return _AnalyticsChart.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsChart {
  String get chartId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  ChartType get type => throw _privateConstructorUsedError;
  List<ChartSeries> get series => throw _privateConstructorUsedError;
  ChartConfig get config => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get period => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;

  /// Serializes this AnalyticsChart to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsChart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsChartCopyWith<AnalyticsChart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsChartCopyWith<$Res> {
  factory $AnalyticsChartCopyWith(
          AnalyticsChart value, $Res Function(AnalyticsChart) then) =
      _$AnalyticsChartCopyWithImpl<$Res, AnalyticsChart>;
  @useResult
  $Res call(
      {String chartId,
      String title,
      ChartType type,
      List<ChartSeries> series,
      ChartConfig config,
      String? subtitle,
      String? period,
      DateTime? startDate,
      DateTime? endDate});

  $ChartConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$AnalyticsChartCopyWithImpl<$Res, $Val extends AnalyticsChart>
    implements $AnalyticsChartCopyWith<$Res> {
  _$AnalyticsChartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsChart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chartId = null,
    Object? title = null,
    Object? type = null,
    Object? series = null,
    Object? config = null,
    Object? subtitle = freezed,
    Object? period = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      chartId: null == chartId
          ? _value.chartId
          : chartId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChartType,
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as List<ChartSeries>,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as ChartConfig,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of AnalyticsChart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChartConfigCopyWith<$Res> get config {
    return $ChartConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalyticsChartImplCopyWith<$Res>
    implements $AnalyticsChartCopyWith<$Res> {
  factory _$$AnalyticsChartImplCopyWith(_$AnalyticsChartImpl value,
          $Res Function(_$AnalyticsChartImpl) then) =
      __$$AnalyticsChartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String chartId,
      String title,
      ChartType type,
      List<ChartSeries> series,
      ChartConfig config,
      String? subtitle,
      String? period,
      DateTime? startDate,
      DateTime? endDate});

  @override
  $ChartConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$AnalyticsChartImplCopyWithImpl<$Res>
    extends _$AnalyticsChartCopyWithImpl<$Res, _$AnalyticsChartImpl>
    implements _$$AnalyticsChartImplCopyWith<$Res> {
  __$$AnalyticsChartImplCopyWithImpl(
      _$AnalyticsChartImpl _value, $Res Function(_$AnalyticsChartImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsChart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chartId = null,
    Object? title = null,
    Object? type = null,
    Object? series = null,
    Object? config = null,
    Object? subtitle = freezed,
    Object? period = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$AnalyticsChartImpl(
      chartId: null == chartId
          ? _value.chartId
          : chartId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChartType,
      series: null == series
          ? _value._series
          : series // ignore: cast_nullable_to_non_nullable
              as List<ChartSeries>,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as ChartConfig,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsChartImpl implements _AnalyticsChart {
  const _$AnalyticsChartImpl(
      {required this.chartId,
      required this.title,
      required this.type,
      required final List<ChartSeries> series,
      required this.config,
      this.subtitle,
      this.period,
      this.startDate,
      this.endDate})
      : _series = series;

  factory _$AnalyticsChartImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsChartImplFromJson(json);

  @override
  final String chartId;
  @override
  final String title;
  @override
  final ChartType type;
  final List<ChartSeries> _series;
  @override
  List<ChartSeries> get series {
    if (_series is EqualUnmodifiableListView) return _series;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_series);
  }

  @override
  final ChartConfig config;
  @override
  final String? subtitle;
  @override
  final String? period;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;

  @override
  String toString() {
    return 'AnalyticsChart(chartId: $chartId, title: $title, type: $type, series: $series, config: $config, subtitle: $subtitle, period: $period, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsChartImpl &&
            (identical(other.chartId, chartId) || other.chartId == chartId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._series, _series) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      chartId,
      title,
      type,
      const DeepCollectionEquality().hash(_series),
      config,
      subtitle,
      period,
      startDate,
      endDate);

  /// Create a copy of AnalyticsChart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsChartImplCopyWith<_$AnalyticsChartImpl> get copyWith =>
      __$$AnalyticsChartImplCopyWithImpl<_$AnalyticsChartImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsChartImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsChart implements AnalyticsChart {
  const factory _AnalyticsChart(
      {required final String chartId,
      required final String title,
      required final ChartType type,
      required final List<ChartSeries> series,
      required final ChartConfig config,
      final String? subtitle,
      final String? period,
      final DateTime? startDate,
      final DateTime? endDate}) = _$AnalyticsChartImpl;

  factory _AnalyticsChart.fromJson(Map<String, dynamic> json) =
      _$AnalyticsChartImpl.fromJson;

  @override
  String get chartId;
  @override
  String get title;
  @override
  ChartType get type;
  @override
  List<ChartSeries> get series;
  @override
  ChartConfig get config;
  @override
  String? get subtitle;
  @override
  String? get period;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;

  /// Create a copy of AnalyticsChart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsChartImplCopyWith<_$AnalyticsChartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChartSeries _$ChartSeriesFromJson(Map<String, dynamic> json) {
  return _ChartSeries.fromJson(json);
}

/// @nodoc
mixin _$ChartSeries {
  String get name => throw _privateConstructorUsedError;
  List<DataPoint> get data => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  ChartSeriesType? get type => throw _privateConstructorUsedError;
  Map<String, dynamic>? get config => throw _privateConstructorUsedError;

  /// Serializes this ChartSeries to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChartSeries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChartSeriesCopyWith<ChartSeries> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartSeriesCopyWith<$Res> {
  factory $ChartSeriesCopyWith(
          ChartSeries value, $Res Function(ChartSeries) then) =
      _$ChartSeriesCopyWithImpl<$Res, ChartSeries>;
  @useResult
  $Res call(
      {String name,
      List<DataPoint> data,
      String color,
      ChartSeriesType? type,
      Map<String, dynamic>? config});
}

/// @nodoc
class _$ChartSeriesCopyWithImpl<$Res, $Val extends ChartSeries>
    implements $ChartSeriesCopyWith<$Res> {
  _$ChartSeriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChartSeries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? data = null,
    Object? color = null,
    Object? type = freezed,
    Object? config = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataPoint>,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChartSeriesType?,
      config: freezed == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChartSeriesImplCopyWith<$Res>
    implements $ChartSeriesCopyWith<$Res> {
  factory _$$ChartSeriesImplCopyWith(
          _$ChartSeriesImpl value, $Res Function(_$ChartSeriesImpl) then) =
      __$$ChartSeriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<DataPoint> data,
      String color,
      ChartSeriesType? type,
      Map<String, dynamic>? config});
}

/// @nodoc
class __$$ChartSeriesImplCopyWithImpl<$Res>
    extends _$ChartSeriesCopyWithImpl<$Res, _$ChartSeriesImpl>
    implements _$$ChartSeriesImplCopyWith<$Res> {
  __$$ChartSeriesImplCopyWithImpl(
      _$ChartSeriesImpl _value, $Res Function(_$ChartSeriesImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChartSeries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? data = null,
    Object? color = null,
    Object? type = freezed,
    Object? config = freezed,
  }) {
    return _then(_$ChartSeriesImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataPoint>,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChartSeriesType?,
      config: freezed == config
          ? _value._config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartSeriesImpl implements _ChartSeries {
  const _$ChartSeriesImpl(
      {required this.name,
      required final List<DataPoint> data,
      required this.color,
      this.type,
      final Map<String, dynamic>? config})
      : _data = data,
        _config = config;

  factory _$ChartSeriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartSeriesImplFromJson(json);

  @override
  final String name;
  final List<DataPoint> _data;
  @override
  List<DataPoint> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final String color;
  @override
  final ChartSeriesType? type;
  final Map<String, dynamic>? _config;
  @override
  Map<String, dynamic>? get config {
    final value = _config;
    if (value == null) return null;
    if (_config is EqualUnmodifiableMapView) return _config;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ChartSeries(name: $name, data: $data, color: $color, type: $type, config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartSeriesImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._config, _config));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_data),
      color,
      type,
      const DeepCollectionEquality().hash(_config));

  /// Create a copy of ChartSeries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartSeriesImplCopyWith<_$ChartSeriesImpl> get copyWith =>
      __$$ChartSeriesImplCopyWithImpl<_$ChartSeriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartSeriesImplToJson(
      this,
    );
  }
}

abstract class _ChartSeries implements ChartSeries {
  const factory _ChartSeries(
      {required final String name,
      required final List<DataPoint> data,
      required final String color,
      final ChartSeriesType? type,
      final Map<String, dynamic>? config}) = _$ChartSeriesImpl;

  factory _ChartSeries.fromJson(Map<String, dynamic> json) =
      _$ChartSeriesImpl.fromJson;

  @override
  String get name;
  @override
  List<DataPoint> get data;
  @override
  String get color;
  @override
  ChartSeriesType? get type;
  @override
  Map<String, dynamic>? get config;

  /// Create a copy of ChartSeries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChartSeriesImplCopyWith<_$ChartSeriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataPoint _$DataPointFromJson(Map<String, dynamic> json) {
  return _DataPoint.fromJson(json);
}

/// @nodoc
mixin _$DataPoint {
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

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
  $Res call(
      {DateTime timestamp,
      double value,
      String? label,
      String? category,
      Map<String, dynamic>? metadata});
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
    Object? timestamp = null,
    Object? value = null,
    Object? label = freezed,
    Object? category = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
  $Res call(
      {DateTime timestamp,
      double value,
      String? label,
      String? category,
      Map<String, dynamic>? metadata});
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
    Object? timestamp = null,
    Object? value = null,
    Object? label = freezed,
    Object? category = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$DataPointImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
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
class _$DataPointImpl implements _DataPoint {
  const _$DataPointImpl(
      {required this.timestamp,
      required this.value,
      this.label,
      this.category,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$DataPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataPointImplFromJson(json);

  @override
  final DateTime timestamp;
  @override
  final double value;
  @override
  final String? label;
  @override
  final String? category;
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
    return 'DataPoint(timestamp: $timestamp, value: $value, label: $label, category: $category, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataPointImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, value, label,
      category, const DeepCollectionEquality().hash(_metadata));

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
      {required final DateTime timestamp,
      required final double value,
      final String? label,
      final String? category,
      final Map<String, dynamic>? metadata}) = _$DataPointImpl;

  factory _DataPoint.fromJson(Map<String, dynamic> json) =
      _$DataPointImpl.fromJson;

  @override
  DateTime get timestamp;
  @override
  double get value;
  @override
  String? get label;
  @override
  String? get category;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of DataPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataPointImplCopyWith<_$DataPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChartConfig _$ChartConfigFromJson(Map<String, dynamic> json) {
  return _ChartConfig.fromJson(json);
}

/// @nodoc
mixin _$ChartConfig {
  bool get showGrid => throw _privateConstructorUsedError;
  bool get showLegend => throw _privateConstructorUsedError;
  bool get showTooltip => throw _privateConstructorUsedError;
  bool get isAnimated => throw _privateConstructorUsedError;
  String? get xAxisLabel => throw _privateConstructorUsedError;
  String? get yAxisLabel => throw _privateConstructorUsedError;
  Map<String, dynamic>? get customConfig => throw _privateConstructorUsedError;

  /// Serializes this ChartConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChartConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChartConfigCopyWith<ChartConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartConfigCopyWith<$Res> {
  factory $ChartConfigCopyWith(
          ChartConfig value, $Res Function(ChartConfig) then) =
      _$ChartConfigCopyWithImpl<$Res, ChartConfig>;
  @useResult
  $Res call(
      {bool showGrid,
      bool showLegend,
      bool showTooltip,
      bool isAnimated,
      String? xAxisLabel,
      String? yAxisLabel,
      Map<String, dynamic>? customConfig});
}

/// @nodoc
class _$ChartConfigCopyWithImpl<$Res, $Val extends ChartConfig>
    implements $ChartConfigCopyWith<$Res> {
  _$ChartConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChartConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showGrid = null,
    Object? showLegend = null,
    Object? showTooltip = null,
    Object? isAnimated = null,
    Object? xAxisLabel = freezed,
    Object? yAxisLabel = freezed,
    Object? customConfig = freezed,
  }) {
    return _then(_value.copyWith(
      showGrid: null == showGrid
          ? _value.showGrid
          : showGrid // ignore: cast_nullable_to_non_nullable
              as bool,
      showLegend: null == showLegend
          ? _value.showLegend
          : showLegend // ignore: cast_nullable_to_non_nullable
              as bool,
      showTooltip: null == showTooltip
          ? _value.showTooltip
          : showTooltip // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnimated: null == isAnimated
          ? _value.isAnimated
          : isAnimated // ignore: cast_nullable_to_non_nullable
              as bool,
      xAxisLabel: freezed == xAxisLabel
          ? _value.xAxisLabel
          : xAxisLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      yAxisLabel: freezed == yAxisLabel
          ? _value.yAxisLabel
          : yAxisLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      customConfig: freezed == customConfig
          ? _value.customConfig
          : customConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChartConfigImplCopyWith<$Res>
    implements $ChartConfigCopyWith<$Res> {
  factory _$$ChartConfigImplCopyWith(
          _$ChartConfigImpl value, $Res Function(_$ChartConfigImpl) then) =
      __$$ChartConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool showGrid,
      bool showLegend,
      bool showTooltip,
      bool isAnimated,
      String? xAxisLabel,
      String? yAxisLabel,
      Map<String, dynamic>? customConfig});
}

/// @nodoc
class __$$ChartConfigImplCopyWithImpl<$Res>
    extends _$ChartConfigCopyWithImpl<$Res, _$ChartConfigImpl>
    implements _$$ChartConfigImplCopyWith<$Res> {
  __$$ChartConfigImplCopyWithImpl(
      _$ChartConfigImpl _value, $Res Function(_$ChartConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChartConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showGrid = null,
    Object? showLegend = null,
    Object? showTooltip = null,
    Object? isAnimated = null,
    Object? xAxisLabel = freezed,
    Object? yAxisLabel = freezed,
    Object? customConfig = freezed,
  }) {
    return _then(_$ChartConfigImpl(
      showGrid: null == showGrid
          ? _value.showGrid
          : showGrid // ignore: cast_nullable_to_non_nullable
              as bool,
      showLegend: null == showLegend
          ? _value.showLegend
          : showLegend // ignore: cast_nullable_to_non_nullable
              as bool,
      showTooltip: null == showTooltip
          ? _value.showTooltip
          : showTooltip // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnimated: null == isAnimated
          ? _value.isAnimated
          : isAnimated // ignore: cast_nullable_to_non_nullable
              as bool,
      xAxisLabel: freezed == xAxisLabel
          ? _value.xAxisLabel
          : xAxisLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      yAxisLabel: freezed == yAxisLabel
          ? _value.yAxisLabel
          : yAxisLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      customConfig: freezed == customConfig
          ? _value._customConfig
          : customConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartConfigImpl implements _ChartConfig {
  const _$ChartConfigImpl(
      {this.showGrid = true,
      this.showLegend = true,
      this.showTooltip = true,
      this.isAnimated = false,
      this.xAxisLabel,
      this.yAxisLabel,
      final Map<String, dynamic>? customConfig})
      : _customConfig = customConfig;

  factory _$ChartConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartConfigImplFromJson(json);

  @override
  @JsonKey()
  final bool showGrid;
  @override
  @JsonKey()
  final bool showLegend;
  @override
  @JsonKey()
  final bool showTooltip;
  @override
  @JsonKey()
  final bool isAnimated;
  @override
  final String? xAxisLabel;
  @override
  final String? yAxisLabel;
  final Map<String, dynamic>? _customConfig;
  @override
  Map<String, dynamic>? get customConfig {
    final value = _customConfig;
    if (value == null) return null;
    if (_customConfig is EqualUnmodifiableMapView) return _customConfig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ChartConfig(showGrid: $showGrid, showLegend: $showLegend, showTooltip: $showTooltip, isAnimated: $isAnimated, xAxisLabel: $xAxisLabel, yAxisLabel: $yAxisLabel, customConfig: $customConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartConfigImpl &&
            (identical(other.showGrid, showGrid) ||
                other.showGrid == showGrid) &&
            (identical(other.showLegend, showLegend) ||
                other.showLegend == showLegend) &&
            (identical(other.showTooltip, showTooltip) ||
                other.showTooltip == showTooltip) &&
            (identical(other.isAnimated, isAnimated) ||
                other.isAnimated == isAnimated) &&
            (identical(other.xAxisLabel, xAxisLabel) ||
                other.xAxisLabel == xAxisLabel) &&
            (identical(other.yAxisLabel, yAxisLabel) ||
                other.yAxisLabel == yAxisLabel) &&
            const DeepCollectionEquality()
                .equals(other._customConfig, _customConfig));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      showGrid,
      showLegend,
      showTooltip,
      isAnimated,
      xAxisLabel,
      yAxisLabel,
      const DeepCollectionEquality().hash(_customConfig));

  /// Create a copy of ChartConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartConfigImplCopyWith<_$ChartConfigImpl> get copyWith =>
      __$$ChartConfigImplCopyWithImpl<_$ChartConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartConfigImplToJson(
      this,
    );
  }
}

abstract class _ChartConfig implements ChartConfig {
  const factory _ChartConfig(
      {final bool showGrid,
      final bool showLegend,
      final bool showTooltip,
      final bool isAnimated,
      final String? xAxisLabel,
      final String? yAxisLabel,
      final Map<String, dynamic>? customConfig}) = _$ChartConfigImpl;

  factory _ChartConfig.fromJson(Map<String, dynamic> json) =
      _$ChartConfigImpl.fromJson;

  @override
  bool get showGrid;
  @override
  bool get showLegend;
  @override
  bool get showTooltip;
  @override
  bool get isAnimated;
  @override
  String? get xAxisLabel;
  @override
  String? get yAxisLabel;
  @override
  Map<String, dynamic>? get customConfig;

  /// Create a copy of ChartConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChartConfigImplCopyWith<_$ChartConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KPIMetric _$KPIMetricFromJson(Map<String, dynamic> json) {
  return _KPIMetric.fromJson(json);
}

/// @nodoc
mixin _$KPIMetric {
  String get metricId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get currentValue => throw _privateConstructorUsedError;
  double get targetValue => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  double? get previousValue => throw _privateConstructorUsedError;
  double? get changePercent => throw _privateConstructorUsedError;
  TrendDirection? get trend => throw _privateConstructorUsedError;
  PerformanceStatus? get status => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this KPIMetric to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KPIMetric
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KPIMetricCopyWith<KPIMetric> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KPIMetricCopyWith<$Res> {
  factory $KPIMetricCopyWith(KPIMetric value, $Res Function(KPIMetric) then) =
      _$KPIMetricCopyWithImpl<$Res, KPIMetric>;
  @useResult
  $Res call(
      {String metricId,
      String name,
      double currentValue,
      double targetValue,
      String unit,
      double? previousValue,
      double? changePercent,
      TrendDirection? trend,
      PerformanceStatus? status,
      String? description,
      DateTime? lastUpdated});
}

/// @nodoc
class _$KPIMetricCopyWithImpl<$Res, $Val extends KPIMetric>
    implements $KPIMetricCopyWith<$Res> {
  _$KPIMetricCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KPIMetric
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metricId = null,
    Object? name = null,
    Object? currentValue = null,
    Object? targetValue = null,
    Object? unit = null,
    Object? previousValue = freezed,
    Object? changePercent = freezed,
    Object? trend = freezed,
    Object? status = freezed,
    Object? description = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      metricId: null == metricId
          ? _value.metricId
          : metricId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      previousValue: freezed == previousValue
          ? _value.previousValue
          : previousValue // ignore: cast_nullable_to_non_nullable
              as double?,
      changePercent: freezed == changePercent
          ? _value.changePercent
          : changePercent // ignore: cast_nullable_to_non_nullable
              as double?,
      trend: freezed == trend
          ? _value.trend
          : trend // ignore: cast_nullable_to_non_nullable
              as TrendDirection?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PerformanceStatus?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KPIMetricImplCopyWith<$Res>
    implements $KPIMetricCopyWith<$Res> {
  factory _$$KPIMetricImplCopyWith(
          _$KPIMetricImpl value, $Res Function(_$KPIMetricImpl) then) =
      __$$KPIMetricImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String metricId,
      String name,
      double currentValue,
      double targetValue,
      String unit,
      double? previousValue,
      double? changePercent,
      TrendDirection? trend,
      PerformanceStatus? status,
      String? description,
      DateTime? lastUpdated});
}

/// @nodoc
class __$$KPIMetricImplCopyWithImpl<$Res>
    extends _$KPIMetricCopyWithImpl<$Res, _$KPIMetricImpl>
    implements _$$KPIMetricImplCopyWith<$Res> {
  __$$KPIMetricImplCopyWithImpl(
      _$KPIMetricImpl _value, $Res Function(_$KPIMetricImpl) _then)
      : super(_value, _then);

  /// Create a copy of KPIMetric
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metricId = null,
    Object? name = null,
    Object? currentValue = null,
    Object? targetValue = null,
    Object? unit = null,
    Object? previousValue = freezed,
    Object? changePercent = freezed,
    Object? trend = freezed,
    Object? status = freezed,
    Object? description = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$KPIMetricImpl(
      metricId: null == metricId
          ? _value.metricId
          : metricId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      previousValue: freezed == previousValue
          ? _value.previousValue
          : previousValue // ignore: cast_nullable_to_non_nullable
              as double?,
      changePercent: freezed == changePercent
          ? _value.changePercent
          : changePercent // ignore: cast_nullable_to_non_nullable
              as double?,
      trend: freezed == trend
          ? _value.trend
          : trend // ignore: cast_nullable_to_non_nullable
              as TrendDirection?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PerformanceStatus?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KPIMetricImpl implements _KPIMetric {
  const _$KPIMetricImpl(
      {required this.metricId,
      required this.name,
      required this.currentValue,
      required this.targetValue,
      required this.unit,
      this.previousValue,
      this.changePercent,
      this.trend,
      this.status,
      this.description,
      this.lastUpdated});

  factory _$KPIMetricImpl.fromJson(Map<String, dynamic> json) =>
      _$$KPIMetricImplFromJson(json);

  @override
  final String metricId;
  @override
  final String name;
  @override
  final double currentValue;
  @override
  final double targetValue;
  @override
  final String unit;
  @override
  final double? previousValue;
  @override
  final double? changePercent;
  @override
  final TrendDirection? trend;
  @override
  final PerformanceStatus? status;
  @override
  final String? description;
  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'KPIMetric(metricId: $metricId, name: $name, currentValue: $currentValue, targetValue: $targetValue, unit: $unit, previousValue: $previousValue, changePercent: $changePercent, trend: $trend, status: $status, description: $description, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KPIMetricImpl &&
            (identical(other.metricId, metricId) ||
                other.metricId == metricId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.previousValue, previousValue) ||
                other.previousValue == previousValue) &&
            (identical(other.changePercent, changePercent) ||
                other.changePercent == changePercent) &&
            (identical(other.trend, trend) || other.trend == trend) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      metricId,
      name,
      currentValue,
      targetValue,
      unit,
      previousValue,
      changePercent,
      trend,
      status,
      description,
      lastUpdated);

  /// Create a copy of KPIMetric
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KPIMetricImplCopyWith<_$KPIMetricImpl> get copyWith =>
      __$$KPIMetricImplCopyWithImpl<_$KPIMetricImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KPIMetricImplToJson(
      this,
    );
  }
}

abstract class _KPIMetric implements KPIMetric {
  const factory _KPIMetric(
      {required final String metricId,
      required final String name,
      required final double currentValue,
      required final double targetValue,
      required final String unit,
      final double? previousValue,
      final double? changePercent,
      final TrendDirection? trend,
      final PerformanceStatus? status,
      final String? description,
      final DateTime? lastUpdated}) = _$KPIMetricImpl;

  factory _KPIMetric.fromJson(Map<String, dynamic> json) =
      _$KPIMetricImpl.fromJson;

  @override
  String get metricId;
  @override
  String get name;
  @override
  double get currentValue;
  @override
  double get targetValue;
  @override
  String get unit;
  @override
  double? get previousValue;
  @override
  double? get changePercent;
  @override
  TrendDirection? get trend;
  @override
  PerformanceStatus? get status;
  @override
  String? get description;
  @override
  DateTime? get lastUpdated;

  /// Create a copy of KPIMetric
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KPIMetricImplCopyWith<_$KPIMetricImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PerformanceInsights _$PerformanceInsightsFromJson(Map<String, dynamic> json) {
  return _PerformanceInsights.fromJson(json);
}

/// @nodoc
mixin _$PerformanceInsights {
  List<Insight> get insights => throw _privateConstructorUsedError;
  List<Recommendation> get recommendations =>
      throw _privateConstructorUsedError;
  List<Alert> get alerts => throw _privateConstructorUsedError;
  PerformanceSummary get summary => throw _privateConstructorUsedError;
  DateTime? get generatedAt => throw _privateConstructorUsedError;

  /// Serializes this PerformanceInsights to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PerformanceInsights
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerformanceInsightsCopyWith<PerformanceInsights> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceInsightsCopyWith<$Res> {
  factory $PerformanceInsightsCopyWith(
          PerformanceInsights value, $Res Function(PerformanceInsights) then) =
      _$PerformanceInsightsCopyWithImpl<$Res, PerformanceInsights>;
  @useResult
  $Res call(
      {List<Insight> insights,
      List<Recommendation> recommendations,
      List<Alert> alerts,
      PerformanceSummary summary,
      DateTime? generatedAt});

  $PerformanceSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class _$PerformanceInsightsCopyWithImpl<$Res, $Val extends PerformanceInsights>
    implements $PerformanceInsightsCopyWith<$Res> {
  _$PerformanceInsightsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerformanceInsights
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? insights = null,
    Object? recommendations = null,
    Object? alerts = null,
    Object? summary = null,
    Object? generatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      insights: null == insights
          ? _value.insights
          : insights // ignore: cast_nullable_to_non_nullable
              as List<Insight>,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<Recommendation>,
      alerts: null == alerts
          ? _value.alerts
          : alerts // ignore: cast_nullable_to_non_nullable
              as List<Alert>,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as PerformanceSummary,
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of PerformanceInsights
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PerformanceSummaryCopyWith<$Res> get summary {
    return $PerformanceSummaryCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PerformanceInsightsImplCopyWith<$Res>
    implements $PerformanceInsightsCopyWith<$Res> {
  factory _$$PerformanceInsightsImplCopyWith(_$PerformanceInsightsImpl value,
          $Res Function(_$PerformanceInsightsImpl) then) =
      __$$PerformanceInsightsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Insight> insights,
      List<Recommendation> recommendations,
      List<Alert> alerts,
      PerformanceSummary summary,
      DateTime? generatedAt});

  @override
  $PerformanceSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class __$$PerformanceInsightsImplCopyWithImpl<$Res>
    extends _$PerformanceInsightsCopyWithImpl<$Res, _$PerformanceInsightsImpl>
    implements _$$PerformanceInsightsImplCopyWith<$Res> {
  __$$PerformanceInsightsImplCopyWithImpl(_$PerformanceInsightsImpl _value,
      $Res Function(_$PerformanceInsightsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PerformanceInsights
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? insights = null,
    Object? recommendations = null,
    Object? alerts = null,
    Object? summary = null,
    Object? generatedAt = freezed,
  }) {
    return _then(_$PerformanceInsightsImpl(
      insights: null == insights
          ? _value._insights
          : insights // ignore: cast_nullable_to_non_nullable
              as List<Insight>,
      recommendations: null == recommendations
          ? _value._recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<Recommendation>,
      alerts: null == alerts
          ? _value._alerts
          : alerts // ignore: cast_nullable_to_non_nullable
              as List<Alert>,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as PerformanceSummary,
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformanceInsightsImpl implements _PerformanceInsights {
  const _$PerformanceInsightsImpl(
      {required final List<Insight> insights,
      required final List<Recommendation> recommendations,
      required final List<Alert> alerts,
      required this.summary,
      this.generatedAt})
      : _insights = insights,
        _recommendations = recommendations,
        _alerts = alerts;

  factory _$PerformanceInsightsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceInsightsImplFromJson(json);

  final List<Insight> _insights;
  @override
  List<Insight> get insights {
    if (_insights is EqualUnmodifiableListView) return _insights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_insights);
  }

  final List<Recommendation> _recommendations;
  @override
  List<Recommendation> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  final List<Alert> _alerts;
  @override
  List<Alert> get alerts {
    if (_alerts is EqualUnmodifiableListView) return _alerts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alerts);
  }

  @override
  final PerformanceSummary summary;
  @override
  final DateTime? generatedAt;

  @override
  String toString() {
    return 'PerformanceInsights(insights: $insights, recommendations: $recommendations, alerts: $alerts, summary: $summary, generatedAt: $generatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceInsightsImpl &&
            const DeepCollectionEquality().equals(other._insights, _insights) &&
            const DeepCollectionEquality()
                .equals(other._recommendations, _recommendations) &&
            const DeepCollectionEquality().equals(other._alerts, _alerts) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_insights),
      const DeepCollectionEquality().hash(_recommendations),
      const DeepCollectionEquality().hash(_alerts),
      summary,
      generatedAt);

  /// Create a copy of PerformanceInsights
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceInsightsImplCopyWith<_$PerformanceInsightsImpl> get copyWith =>
      __$$PerformanceInsightsImplCopyWithImpl<_$PerformanceInsightsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformanceInsightsImplToJson(
      this,
    );
  }
}

abstract class _PerformanceInsights implements PerformanceInsights {
  const factory _PerformanceInsights(
      {required final List<Insight> insights,
      required final List<Recommendation> recommendations,
      required final List<Alert> alerts,
      required final PerformanceSummary summary,
      final DateTime? generatedAt}) = _$PerformanceInsightsImpl;

  factory _PerformanceInsights.fromJson(Map<String, dynamic> json) =
      _$PerformanceInsightsImpl.fromJson;

  @override
  List<Insight> get insights;
  @override
  List<Recommendation> get recommendations;
  @override
  List<Alert> get alerts;
  @override
  PerformanceSummary get summary;
  @override
  DateTime? get generatedAt;

  /// Create a copy of PerformanceInsights
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerformanceInsightsImplCopyWith<_$PerformanceInsightsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Insight _$InsightFromJson(Map<String, dynamic> json) {
  return _Insight.fromJson(json);
}

/// @nodoc
mixin _$Insight {
  String get insightId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  InsightType get type => throw _privateConstructorUsedError;
  InsightSeverity get severity => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  List<String> get supportingData => throw _privateConstructorUsedError;
  DateTime? get generatedAt => throw _privateConstructorUsedError;
  bool get isActionable => throw _privateConstructorUsedError;
  String? get recommendedAction => throw _privateConstructorUsedError;

  /// Serializes this Insight to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Insight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InsightCopyWith<Insight> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsightCopyWith<$Res> {
  factory $InsightCopyWith(Insight value, $Res Function(Insight) then) =
      _$InsightCopyWithImpl<$Res, Insight>;
  @useResult
  $Res call(
      {String insightId,
      String title,
      String description,
      InsightType type,
      InsightSeverity severity,
      double confidence,
      List<String> supportingData,
      DateTime? generatedAt,
      bool isActionable,
      String? recommendedAction});
}

/// @nodoc
class _$InsightCopyWithImpl<$Res, $Val extends Insight>
    implements $InsightCopyWith<$Res> {
  _$InsightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Insight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? insightId = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? severity = null,
    Object? confidence = null,
    Object? supportingData = null,
    Object? generatedAt = freezed,
    Object? isActionable = null,
    Object? recommendedAction = freezed,
  }) {
    return _then(_value.copyWith(
      insightId: null == insightId
          ? _value.insightId
          : insightId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InsightType,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as InsightSeverity,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      supportingData: null == supportingData
          ? _value.supportingData
          : supportingData // ignore: cast_nullable_to_non_nullable
              as List<String>,
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActionable: null == isActionable
          ? _value.isActionable
          : isActionable // ignore: cast_nullable_to_non_nullable
              as bool,
      recommendedAction: freezed == recommendedAction
          ? _value.recommendedAction
          : recommendedAction // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InsightImplCopyWith<$Res> implements $InsightCopyWith<$Res> {
  factory _$$InsightImplCopyWith(
          _$InsightImpl value, $Res Function(_$InsightImpl) then) =
      __$$InsightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String insightId,
      String title,
      String description,
      InsightType type,
      InsightSeverity severity,
      double confidence,
      List<String> supportingData,
      DateTime? generatedAt,
      bool isActionable,
      String? recommendedAction});
}

/// @nodoc
class __$$InsightImplCopyWithImpl<$Res>
    extends _$InsightCopyWithImpl<$Res, _$InsightImpl>
    implements _$$InsightImplCopyWith<$Res> {
  __$$InsightImplCopyWithImpl(
      _$InsightImpl _value, $Res Function(_$InsightImpl) _then)
      : super(_value, _then);

  /// Create a copy of Insight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? insightId = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? severity = null,
    Object? confidence = null,
    Object? supportingData = null,
    Object? generatedAt = freezed,
    Object? isActionable = null,
    Object? recommendedAction = freezed,
  }) {
    return _then(_$InsightImpl(
      insightId: null == insightId
          ? _value.insightId
          : insightId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InsightType,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as InsightSeverity,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      supportingData: null == supportingData
          ? _value._supportingData
          : supportingData // ignore: cast_nullable_to_non_nullable
              as List<String>,
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActionable: null == isActionable
          ? _value.isActionable
          : isActionable // ignore: cast_nullable_to_non_nullable
              as bool,
      recommendedAction: freezed == recommendedAction
          ? _value.recommendedAction
          : recommendedAction // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InsightImpl implements _Insight {
  const _$InsightImpl(
      {required this.insightId,
      required this.title,
      required this.description,
      required this.type,
      required this.severity,
      required this.confidence,
      final List<String> supportingData = const [],
      this.generatedAt,
      this.isActionable = false,
      this.recommendedAction})
      : _supportingData = supportingData;

  factory _$InsightImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsightImplFromJson(json);

  @override
  final String insightId;
  @override
  final String title;
  @override
  final String description;
  @override
  final InsightType type;
  @override
  final InsightSeverity severity;
  @override
  final double confidence;
  final List<String> _supportingData;
  @override
  @JsonKey()
  List<String> get supportingData {
    if (_supportingData is EqualUnmodifiableListView) return _supportingData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportingData);
  }

  @override
  final DateTime? generatedAt;
  @override
  @JsonKey()
  final bool isActionable;
  @override
  final String? recommendedAction;

  @override
  String toString() {
    return 'Insight(insightId: $insightId, title: $title, description: $description, type: $type, severity: $severity, confidence: $confidence, supportingData: $supportingData, generatedAt: $generatedAt, isActionable: $isActionable, recommendedAction: $recommendedAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsightImpl &&
            (identical(other.insightId, insightId) ||
                other.insightId == insightId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality()
                .equals(other._supportingData, _supportingData) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.isActionable, isActionable) ||
                other.isActionable == isActionable) &&
            (identical(other.recommendedAction, recommendedAction) ||
                other.recommendedAction == recommendedAction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      insightId,
      title,
      description,
      type,
      severity,
      confidence,
      const DeepCollectionEquality().hash(_supportingData),
      generatedAt,
      isActionable,
      recommendedAction);

  /// Create a copy of Insight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InsightImplCopyWith<_$InsightImpl> get copyWith =>
      __$$InsightImplCopyWithImpl<_$InsightImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsightImplToJson(
      this,
    );
  }
}

abstract class _Insight implements Insight {
  const factory _Insight(
      {required final String insightId,
      required final String title,
      required final String description,
      required final InsightType type,
      required final InsightSeverity severity,
      required final double confidence,
      final List<String> supportingData,
      final DateTime? generatedAt,
      final bool isActionable,
      final String? recommendedAction}) = _$InsightImpl;

  factory _Insight.fromJson(Map<String, dynamic> json) = _$InsightImpl.fromJson;

  @override
  String get insightId;
  @override
  String get title;
  @override
  String get description;
  @override
  InsightType get type;
  @override
  InsightSeverity get severity;
  @override
  double get confidence;
  @override
  List<String> get supportingData;
  @override
  DateTime? get generatedAt;
  @override
  bool get isActionable;
  @override
  String? get recommendedAction;

  /// Create a copy of Insight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InsightImplCopyWith<_$InsightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Recommendation _$RecommendationFromJson(Map<String, dynamic> json) {
  return _Recommendation.fromJson(json);
}

/// @nodoc
mixin _$Recommendation {
  String get recommendationId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  RecommendationType get type => throw _privateConstructorUsedError;
  RecommendationPriority get priority => throw _privateConstructorUsedError;
  double get expectedImpact => throw _privateConstructorUsedError;
  List<String> get actionItems => throw _privateConstructorUsedError;
  DateTime? get implementBy => throw _privateConstructorUsedError;
  Map<String, dynamic>? get parameters => throw _privateConstructorUsedError;

  /// Serializes this Recommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendationCopyWith<Recommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendationCopyWith<$Res> {
  factory $RecommendationCopyWith(
          Recommendation value, $Res Function(Recommendation) then) =
      _$RecommendationCopyWithImpl<$Res, Recommendation>;
  @useResult
  $Res call(
      {String recommendationId,
      String title,
      String description,
      RecommendationType type,
      RecommendationPriority priority,
      double expectedImpact,
      List<String> actionItems,
      DateTime? implementBy,
      Map<String, dynamic>? parameters});
}

/// @nodoc
class _$RecommendationCopyWithImpl<$Res, $Val extends Recommendation>
    implements $RecommendationCopyWith<$Res> {
  _$RecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendationId = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? priority = null,
    Object? expectedImpact = null,
    Object? actionItems = null,
    Object? implementBy = freezed,
    Object? parameters = freezed,
  }) {
    return _then(_value.copyWith(
      recommendationId: null == recommendationId
          ? _value.recommendationId
          : recommendationId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RecommendationType,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as RecommendationPriority,
      expectedImpact: null == expectedImpact
          ? _value.expectedImpact
          : expectedImpact // ignore: cast_nullable_to_non_nullable
              as double,
      actionItems: null == actionItems
          ? _value.actionItems
          : actionItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      implementBy: freezed == implementBy
          ? _value.implementBy
          : implementBy // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      parameters: freezed == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendationImplCopyWith<$Res>
    implements $RecommendationCopyWith<$Res> {
  factory _$$RecommendationImplCopyWith(_$RecommendationImpl value,
          $Res Function(_$RecommendationImpl) then) =
      __$$RecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String recommendationId,
      String title,
      String description,
      RecommendationType type,
      RecommendationPriority priority,
      double expectedImpact,
      List<String> actionItems,
      DateTime? implementBy,
      Map<String, dynamic>? parameters});
}

/// @nodoc
class __$$RecommendationImplCopyWithImpl<$Res>
    extends _$RecommendationCopyWithImpl<$Res, _$RecommendationImpl>
    implements _$$RecommendationImplCopyWith<$Res> {
  __$$RecommendationImplCopyWithImpl(
      _$RecommendationImpl _value, $Res Function(_$RecommendationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendationId = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? priority = null,
    Object? expectedImpact = null,
    Object? actionItems = null,
    Object? implementBy = freezed,
    Object? parameters = freezed,
  }) {
    return _then(_$RecommendationImpl(
      recommendationId: null == recommendationId
          ? _value.recommendationId
          : recommendationId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RecommendationType,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as RecommendationPriority,
      expectedImpact: null == expectedImpact
          ? _value.expectedImpact
          : expectedImpact // ignore: cast_nullable_to_non_nullable
              as double,
      actionItems: null == actionItems
          ? _value._actionItems
          : actionItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      implementBy: freezed == implementBy
          ? _value.implementBy
          : implementBy // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      parameters: freezed == parameters
          ? _value._parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendationImpl implements _Recommendation {
  const _$RecommendationImpl(
      {required this.recommendationId,
      required this.title,
      required this.description,
      required this.type,
      required this.priority,
      required this.expectedImpact,
      final List<String> actionItems = const [],
      this.implementBy,
      final Map<String, dynamic>? parameters})
      : _actionItems = actionItems,
        _parameters = parameters;

  factory _$RecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendationImplFromJson(json);

  @override
  final String recommendationId;
  @override
  final String title;
  @override
  final String description;
  @override
  final RecommendationType type;
  @override
  final RecommendationPriority priority;
  @override
  final double expectedImpact;
  final List<String> _actionItems;
  @override
  @JsonKey()
  List<String> get actionItems {
    if (_actionItems is EqualUnmodifiableListView) return _actionItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actionItems);
  }

  @override
  final DateTime? implementBy;
  final Map<String, dynamic>? _parameters;
  @override
  Map<String, dynamic>? get parameters {
    final value = _parameters;
    if (value == null) return null;
    if (_parameters is EqualUnmodifiableMapView) return _parameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Recommendation(recommendationId: $recommendationId, title: $title, description: $description, type: $type, priority: $priority, expectedImpact: $expectedImpact, actionItems: $actionItems, implementBy: $implementBy, parameters: $parameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendationImpl &&
            (identical(other.recommendationId, recommendationId) ||
                other.recommendationId == recommendationId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.expectedImpact, expectedImpact) ||
                other.expectedImpact == expectedImpact) &&
            const DeepCollectionEquality()
                .equals(other._actionItems, _actionItems) &&
            (identical(other.implementBy, implementBy) ||
                other.implementBy == implementBy) &&
            const DeepCollectionEquality()
                .equals(other._parameters, _parameters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      recommendationId,
      title,
      description,
      type,
      priority,
      expectedImpact,
      const DeepCollectionEquality().hash(_actionItems),
      implementBy,
      const DeepCollectionEquality().hash(_parameters));

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendationImplCopyWith<_$RecommendationImpl> get copyWith =>
      __$$RecommendationImplCopyWithImpl<_$RecommendationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendationImplToJson(
      this,
    );
  }
}

abstract class _Recommendation implements Recommendation {
  const factory _Recommendation(
      {required final String recommendationId,
      required final String title,
      required final String description,
      required final RecommendationType type,
      required final RecommendationPriority priority,
      required final double expectedImpact,
      final List<String> actionItems,
      final DateTime? implementBy,
      final Map<String, dynamic>? parameters}) = _$RecommendationImpl;

  factory _Recommendation.fromJson(Map<String, dynamic> json) =
      _$RecommendationImpl.fromJson;

  @override
  String get recommendationId;
  @override
  String get title;
  @override
  String get description;
  @override
  RecommendationType get type;
  @override
  RecommendationPriority get priority;
  @override
  double get expectedImpact;
  @override
  List<String> get actionItems;
  @override
  DateTime? get implementBy;
  @override
  Map<String, dynamic>? get parameters;

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendationImplCopyWith<_$RecommendationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Alert _$AlertFromJson(Map<String, dynamic> json) {
  return _Alert.fromJson(json);
}

/// @nodoc
mixin _$Alert {
  String get alertId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  AlertType get type => throw _privateConstructorUsedError;
  AlertSeverity get severity => throw _privateConstructorUsedError;
  DateTime get triggeredAt => throw _privateConstructorUsedError;
  String? get metricName => throw _privateConstructorUsedError;
  double? get thresholdValue => throw _privateConstructorUsedError;
  double? get actualValue => throw _privateConstructorUsedError;
  bool get isResolved => throw _privateConstructorUsedError;
  DateTime? get resolvedAt => throw _privateConstructorUsedError;

  /// Serializes this Alert to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlertCopyWith<Alert> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertCopyWith<$Res> {
  factory $AlertCopyWith(Alert value, $Res Function(Alert) then) =
      _$AlertCopyWithImpl<$Res, Alert>;
  @useResult
  $Res call(
      {String alertId,
      String title,
      String message,
      AlertType type,
      AlertSeverity severity,
      DateTime triggeredAt,
      String? metricName,
      double? thresholdValue,
      double? actualValue,
      bool isResolved,
      DateTime? resolvedAt});
}

/// @nodoc
class _$AlertCopyWithImpl<$Res, $Val extends Alert>
    implements $AlertCopyWith<$Res> {
  _$AlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alertId = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? severity = null,
    Object? triggeredAt = null,
    Object? metricName = freezed,
    Object? thresholdValue = freezed,
    Object? actualValue = freezed,
    Object? isResolved = null,
    Object? resolvedAt = freezed,
  }) {
    return _then(_value.copyWith(
      alertId: null == alertId
          ? _value.alertId
          : alertId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as AlertSeverity,
      triggeredAt: null == triggeredAt
          ? _value.triggeredAt
          : triggeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metricName: freezed == metricName
          ? _value.metricName
          : metricName // ignore: cast_nullable_to_non_nullable
              as String?,
      thresholdValue: freezed == thresholdValue
          ? _value.thresholdValue
          : thresholdValue // ignore: cast_nullable_to_non_nullable
              as double?,
      actualValue: freezed == actualValue
          ? _value.actualValue
          : actualValue // ignore: cast_nullable_to_non_nullable
              as double?,
      isResolved: null == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlertImplCopyWith<$Res> implements $AlertCopyWith<$Res> {
  factory _$$AlertImplCopyWith(
          _$AlertImpl value, $Res Function(_$AlertImpl) then) =
      __$$AlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String alertId,
      String title,
      String message,
      AlertType type,
      AlertSeverity severity,
      DateTime triggeredAt,
      String? metricName,
      double? thresholdValue,
      double? actualValue,
      bool isResolved,
      DateTime? resolvedAt});
}

/// @nodoc
class __$$AlertImplCopyWithImpl<$Res>
    extends _$AlertCopyWithImpl<$Res, _$AlertImpl>
    implements _$$AlertImplCopyWith<$Res> {
  __$$AlertImplCopyWithImpl(
      _$AlertImpl _value, $Res Function(_$AlertImpl) _then)
      : super(_value, _then);

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alertId = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? severity = null,
    Object? triggeredAt = null,
    Object? metricName = freezed,
    Object? thresholdValue = freezed,
    Object? actualValue = freezed,
    Object? isResolved = null,
    Object? resolvedAt = freezed,
  }) {
    return _then(_$AlertImpl(
      alertId: null == alertId
          ? _value.alertId
          : alertId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as AlertSeverity,
      triggeredAt: null == triggeredAt
          ? _value.triggeredAt
          : triggeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metricName: freezed == metricName
          ? _value.metricName
          : metricName // ignore: cast_nullable_to_non_nullable
              as String?,
      thresholdValue: freezed == thresholdValue
          ? _value.thresholdValue
          : thresholdValue // ignore: cast_nullable_to_non_nullable
              as double?,
      actualValue: freezed == actualValue
          ? _value.actualValue
          : actualValue // ignore: cast_nullable_to_non_nullable
              as double?,
      isResolved: null == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlertImpl implements _Alert {
  const _$AlertImpl(
      {required this.alertId,
      required this.title,
      required this.message,
      required this.type,
      required this.severity,
      required this.triggeredAt,
      this.metricName,
      this.thresholdValue,
      this.actualValue,
      this.isResolved = false,
      this.resolvedAt});

  factory _$AlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlertImplFromJson(json);

  @override
  final String alertId;
  @override
  final String title;
  @override
  final String message;
  @override
  final AlertType type;
  @override
  final AlertSeverity severity;
  @override
  final DateTime triggeredAt;
  @override
  final String? metricName;
  @override
  final double? thresholdValue;
  @override
  final double? actualValue;
  @override
  @JsonKey()
  final bool isResolved;
  @override
  final DateTime? resolvedAt;

  @override
  String toString() {
    return 'Alert(alertId: $alertId, title: $title, message: $message, type: $type, severity: $severity, triggeredAt: $triggeredAt, metricName: $metricName, thresholdValue: $thresholdValue, actualValue: $actualValue, isResolved: $isResolved, resolvedAt: $resolvedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlertImpl &&
            (identical(other.alertId, alertId) || other.alertId == alertId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.triggeredAt, triggeredAt) ||
                other.triggeredAt == triggeredAt) &&
            (identical(other.metricName, metricName) ||
                other.metricName == metricName) &&
            (identical(other.thresholdValue, thresholdValue) ||
                other.thresholdValue == thresholdValue) &&
            (identical(other.actualValue, actualValue) ||
                other.actualValue == actualValue) &&
            (identical(other.isResolved, isResolved) ||
                other.isResolved == isResolved) &&
            (identical(other.resolvedAt, resolvedAt) ||
                other.resolvedAt == resolvedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      alertId,
      title,
      message,
      type,
      severity,
      triggeredAt,
      metricName,
      thresholdValue,
      actualValue,
      isResolved,
      resolvedAt);

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlertImplCopyWith<_$AlertImpl> get copyWith =>
      __$$AlertImplCopyWithImpl<_$AlertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlertImplToJson(
      this,
    );
  }
}

abstract class _Alert implements Alert {
  const factory _Alert(
      {required final String alertId,
      required final String title,
      required final String message,
      required final AlertType type,
      required final AlertSeverity severity,
      required final DateTime triggeredAt,
      final String? metricName,
      final double? thresholdValue,
      final double? actualValue,
      final bool isResolved,
      final DateTime? resolvedAt}) = _$AlertImpl;

  factory _Alert.fromJson(Map<String, dynamic> json) = _$AlertImpl.fromJson;

  @override
  String get alertId;
  @override
  String get title;
  @override
  String get message;
  @override
  AlertType get type;
  @override
  AlertSeverity get severity;
  @override
  DateTime get triggeredAt;
  @override
  String? get metricName;
  @override
  double? get thresholdValue;
  @override
  double? get actualValue;
  @override
  bool get isResolved;
  @override
  DateTime? get resolvedAt;

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlertImplCopyWith<_$AlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PerformanceSummary _$PerformanceSummaryFromJson(Map<String, dynamic> json) {
  return _PerformanceSummary.fromJson(json);
}

/// @nodoc
mixin _$PerformanceSummary {
  double get overallScore => throw _privateConstructorUsedError;
  Map<String, double> get categoryScores => throw _privateConstructorUsedError;
  List<String> get topPerformingAreas => throw _privateConstructorUsedError;
  List<String> get improvementAreas => throw _privateConstructorUsedError;
  int get totalMetrics => throw _privateConstructorUsedError;
  int get onTrackMetrics => throw _privateConstructorUsedError;
  int get belowTargetMetrics => throw _privateConstructorUsedError;

  /// Serializes this PerformanceSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PerformanceSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerformanceSummaryCopyWith<PerformanceSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceSummaryCopyWith<$Res> {
  factory $PerformanceSummaryCopyWith(
          PerformanceSummary value, $Res Function(PerformanceSummary) then) =
      _$PerformanceSummaryCopyWithImpl<$Res, PerformanceSummary>;
  @useResult
  $Res call(
      {double overallScore,
      Map<String, double> categoryScores,
      List<String> topPerformingAreas,
      List<String> improvementAreas,
      int totalMetrics,
      int onTrackMetrics,
      int belowTargetMetrics});
}

/// @nodoc
class _$PerformanceSummaryCopyWithImpl<$Res, $Val extends PerformanceSummary>
    implements $PerformanceSummaryCopyWith<$Res> {
  _$PerformanceSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerformanceSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overallScore = null,
    Object? categoryScores = null,
    Object? topPerformingAreas = null,
    Object? improvementAreas = null,
    Object? totalMetrics = null,
    Object? onTrackMetrics = null,
    Object? belowTargetMetrics = null,
  }) {
    return _then(_value.copyWith(
      overallScore: null == overallScore
          ? _value.overallScore
          : overallScore // ignore: cast_nullable_to_non_nullable
              as double,
      categoryScores: null == categoryScores
          ? _value.categoryScores
          : categoryScores // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      topPerformingAreas: null == topPerformingAreas
          ? _value.topPerformingAreas
          : topPerformingAreas // ignore: cast_nullable_to_non_nullable
              as List<String>,
      improvementAreas: null == improvementAreas
          ? _value.improvementAreas
          : improvementAreas // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalMetrics: null == totalMetrics
          ? _value.totalMetrics
          : totalMetrics // ignore: cast_nullable_to_non_nullable
              as int,
      onTrackMetrics: null == onTrackMetrics
          ? _value.onTrackMetrics
          : onTrackMetrics // ignore: cast_nullable_to_non_nullable
              as int,
      belowTargetMetrics: null == belowTargetMetrics
          ? _value.belowTargetMetrics
          : belowTargetMetrics // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerformanceSummaryImplCopyWith<$Res>
    implements $PerformanceSummaryCopyWith<$Res> {
  factory _$$PerformanceSummaryImplCopyWith(_$PerformanceSummaryImpl value,
          $Res Function(_$PerformanceSummaryImpl) then) =
      __$$PerformanceSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double overallScore,
      Map<String, double> categoryScores,
      List<String> topPerformingAreas,
      List<String> improvementAreas,
      int totalMetrics,
      int onTrackMetrics,
      int belowTargetMetrics});
}

/// @nodoc
class __$$PerformanceSummaryImplCopyWithImpl<$Res>
    extends _$PerformanceSummaryCopyWithImpl<$Res, _$PerformanceSummaryImpl>
    implements _$$PerformanceSummaryImplCopyWith<$Res> {
  __$$PerformanceSummaryImplCopyWithImpl(_$PerformanceSummaryImpl _value,
      $Res Function(_$PerformanceSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PerformanceSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overallScore = null,
    Object? categoryScores = null,
    Object? topPerformingAreas = null,
    Object? improvementAreas = null,
    Object? totalMetrics = null,
    Object? onTrackMetrics = null,
    Object? belowTargetMetrics = null,
  }) {
    return _then(_$PerformanceSummaryImpl(
      overallScore: null == overallScore
          ? _value.overallScore
          : overallScore // ignore: cast_nullable_to_non_nullable
              as double,
      categoryScores: null == categoryScores
          ? _value._categoryScores
          : categoryScores // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      topPerformingAreas: null == topPerformingAreas
          ? _value._topPerformingAreas
          : topPerformingAreas // ignore: cast_nullable_to_non_nullable
              as List<String>,
      improvementAreas: null == improvementAreas
          ? _value._improvementAreas
          : improvementAreas // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalMetrics: null == totalMetrics
          ? _value.totalMetrics
          : totalMetrics // ignore: cast_nullable_to_non_nullable
              as int,
      onTrackMetrics: null == onTrackMetrics
          ? _value.onTrackMetrics
          : onTrackMetrics // ignore: cast_nullable_to_non_nullable
              as int,
      belowTargetMetrics: null == belowTargetMetrics
          ? _value.belowTargetMetrics
          : belowTargetMetrics // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformanceSummaryImpl implements _PerformanceSummary {
  const _$PerformanceSummaryImpl(
      {required this.overallScore,
      required final Map<String, double> categoryScores,
      required final List<String> topPerformingAreas,
      required final List<String> improvementAreas,
      required this.totalMetrics,
      required this.onTrackMetrics,
      required this.belowTargetMetrics})
      : _categoryScores = categoryScores,
        _topPerformingAreas = topPerformingAreas,
        _improvementAreas = improvementAreas;

  factory _$PerformanceSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceSummaryImplFromJson(json);

  @override
  final double overallScore;
  final Map<String, double> _categoryScores;
  @override
  Map<String, double> get categoryScores {
    if (_categoryScores is EqualUnmodifiableMapView) return _categoryScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryScores);
  }

  final List<String> _topPerformingAreas;
  @override
  List<String> get topPerformingAreas {
    if (_topPerformingAreas is EqualUnmodifiableListView)
      return _topPerformingAreas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topPerformingAreas);
  }

  final List<String> _improvementAreas;
  @override
  List<String> get improvementAreas {
    if (_improvementAreas is EqualUnmodifiableListView)
      return _improvementAreas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_improvementAreas);
  }

  @override
  final int totalMetrics;
  @override
  final int onTrackMetrics;
  @override
  final int belowTargetMetrics;

  @override
  String toString() {
    return 'PerformanceSummary(overallScore: $overallScore, categoryScores: $categoryScores, topPerformingAreas: $topPerformingAreas, improvementAreas: $improvementAreas, totalMetrics: $totalMetrics, onTrackMetrics: $onTrackMetrics, belowTargetMetrics: $belowTargetMetrics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceSummaryImpl &&
            (identical(other.overallScore, overallScore) ||
                other.overallScore == overallScore) &&
            const DeepCollectionEquality()
                .equals(other._categoryScores, _categoryScores) &&
            const DeepCollectionEquality()
                .equals(other._topPerformingAreas, _topPerformingAreas) &&
            const DeepCollectionEquality()
                .equals(other._improvementAreas, _improvementAreas) &&
            (identical(other.totalMetrics, totalMetrics) ||
                other.totalMetrics == totalMetrics) &&
            (identical(other.onTrackMetrics, onTrackMetrics) ||
                other.onTrackMetrics == onTrackMetrics) &&
            (identical(other.belowTargetMetrics, belowTargetMetrics) ||
                other.belowTargetMetrics == belowTargetMetrics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      overallScore,
      const DeepCollectionEquality().hash(_categoryScores),
      const DeepCollectionEquality().hash(_topPerformingAreas),
      const DeepCollectionEquality().hash(_improvementAreas),
      totalMetrics,
      onTrackMetrics,
      belowTargetMetrics);

  /// Create a copy of PerformanceSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceSummaryImplCopyWith<_$PerformanceSummaryImpl> get copyWith =>
      __$$PerformanceSummaryImplCopyWithImpl<_$PerformanceSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformanceSummaryImplToJson(
      this,
    );
  }
}

abstract class _PerformanceSummary implements PerformanceSummary {
  const factory _PerformanceSummary(
      {required final double overallScore,
      required final Map<String, double> categoryScores,
      required final List<String> topPerformingAreas,
      required final List<String> improvementAreas,
      required final int totalMetrics,
      required final int onTrackMetrics,
      required final int belowTargetMetrics}) = _$PerformanceSummaryImpl;

  factory _PerformanceSummary.fromJson(Map<String, dynamic> json) =
      _$PerformanceSummaryImpl.fromJson;

  @override
  double get overallScore;
  @override
  Map<String, double> get categoryScores;
  @override
  List<String> get topPerformingAreas;
  @override
  List<String> get improvementAreas;
  @override
  int get totalMetrics;
  @override
  int get onTrackMetrics;
  @override
  int get belowTargetMetrics;

  /// Create a copy of PerformanceSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerformanceSummaryImplCopyWith<_$PerformanceSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RealtimeMetrics _$RealtimeMetricsFromJson(Map<String, dynamic> json) {
  return _RealtimeMetrics.fromJson(json);
}

/// @nodoc
mixin _$RealtimeMetrics {
  String get userId => throw _privateConstructorUsedError;
  Map<String, dynamic> get currentMetrics => throw _privateConstructorUsedError;
  List<RealtimeAlert> get activeAlerts => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  int get updateIntervalSeconds => throw _privateConstructorUsedError;

  /// Serializes this RealtimeMetrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RealtimeMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RealtimeMetricsCopyWith<RealtimeMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealtimeMetricsCopyWith<$Res> {
  factory $RealtimeMetricsCopyWith(
          RealtimeMetrics value, $Res Function(RealtimeMetrics) then) =
      _$RealtimeMetricsCopyWithImpl<$Res, RealtimeMetrics>;
  @useResult
  $Res call(
      {String userId,
      Map<String, dynamic> currentMetrics,
      List<RealtimeAlert> activeAlerts,
      DateTime lastUpdated,
      int updateIntervalSeconds});
}

/// @nodoc
class _$RealtimeMetricsCopyWithImpl<$Res, $Val extends RealtimeMetrics>
    implements $RealtimeMetricsCopyWith<$Res> {
  _$RealtimeMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RealtimeMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? currentMetrics = null,
    Object? activeAlerts = null,
    Object? lastUpdated = null,
    Object? updateIntervalSeconds = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      currentMetrics: null == currentMetrics
          ? _value.currentMetrics
          : currentMetrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      activeAlerts: null == activeAlerts
          ? _value.activeAlerts
          : activeAlerts // ignore: cast_nullable_to_non_nullable
              as List<RealtimeAlert>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateIntervalSeconds: null == updateIntervalSeconds
          ? _value.updateIntervalSeconds
          : updateIntervalSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RealtimeMetricsImplCopyWith<$Res>
    implements $RealtimeMetricsCopyWith<$Res> {
  factory _$$RealtimeMetricsImplCopyWith(_$RealtimeMetricsImpl value,
          $Res Function(_$RealtimeMetricsImpl) then) =
      __$$RealtimeMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      Map<String, dynamic> currentMetrics,
      List<RealtimeAlert> activeAlerts,
      DateTime lastUpdated,
      int updateIntervalSeconds});
}

/// @nodoc
class __$$RealtimeMetricsImplCopyWithImpl<$Res>
    extends _$RealtimeMetricsCopyWithImpl<$Res, _$RealtimeMetricsImpl>
    implements _$$RealtimeMetricsImplCopyWith<$Res> {
  __$$RealtimeMetricsImplCopyWithImpl(
      _$RealtimeMetricsImpl _value, $Res Function(_$RealtimeMetricsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? currentMetrics = null,
    Object? activeAlerts = null,
    Object? lastUpdated = null,
    Object? updateIntervalSeconds = null,
  }) {
    return _then(_$RealtimeMetricsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      currentMetrics: null == currentMetrics
          ? _value._currentMetrics
          : currentMetrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      activeAlerts: null == activeAlerts
          ? _value._activeAlerts
          : activeAlerts // ignore: cast_nullable_to_non_nullable
              as List<RealtimeAlert>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateIntervalSeconds: null == updateIntervalSeconds
          ? _value.updateIntervalSeconds
          : updateIntervalSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RealtimeMetricsImpl implements _RealtimeMetrics {
  const _$RealtimeMetricsImpl(
      {required this.userId,
      required final Map<String, dynamic> currentMetrics,
      required final List<RealtimeAlert> activeAlerts,
      required this.lastUpdated,
      this.updateIntervalSeconds = 30})
      : _currentMetrics = currentMetrics,
        _activeAlerts = activeAlerts;

  factory _$RealtimeMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RealtimeMetricsImplFromJson(json);

  @override
  final String userId;
  final Map<String, dynamic> _currentMetrics;
  @override
  Map<String, dynamic> get currentMetrics {
    if (_currentMetrics is EqualUnmodifiableMapView) return _currentMetrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_currentMetrics);
  }

  final List<RealtimeAlert> _activeAlerts;
  @override
  List<RealtimeAlert> get activeAlerts {
    if (_activeAlerts is EqualUnmodifiableListView) return _activeAlerts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeAlerts);
  }

  @override
  final DateTime lastUpdated;
  @override
  @JsonKey()
  final int updateIntervalSeconds;

  @override
  String toString() {
    return 'RealtimeMetrics(userId: $userId, currentMetrics: $currentMetrics, activeAlerts: $activeAlerts, lastUpdated: $lastUpdated, updateIntervalSeconds: $updateIntervalSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeMetricsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._currentMetrics, _currentMetrics) &&
            const DeepCollectionEquality()
                .equals(other._activeAlerts, _activeAlerts) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.updateIntervalSeconds, updateIntervalSeconds) ||
                other.updateIntervalSeconds == updateIntervalSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      const DeepCollectionEquality().hash(_currentMetrics),
      const DeepCollectionEquality().hash(_activeAlerts),
      lastUpdated,
      updateIntervalSeconds);

  /// Create a copy of RealtimeMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeMetricsImplCopyWith<_$RealtimeMetricsImpl> get copyWith =>
      __$$RealtimeMetricsImplCopyWithImpl<_$RealtimeMetricsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RealtimeMetricsImplToJson(
      this,
    );
  }
}

abstract class _RealtimeMetrics implements RealtimeMetrics {
  const factory _RealtimeMetrics(
      {required final String userId,
      required final Map<String, dynamic> currentMetrics,
      required final List<RealtimeAlert> activeAlerts,
      required final DateTime lastUpdated,
      final int updateIntervalSeconds}) = _$RealtimeMetricsImpl;

  factory _RealtimeMetrics.fromJson(Map<String, dynamic> json) =
      _$RealtimeMetricsImpl.fromJson;

  @override
  String get userId;
  @override
  Map<String, dynamic> get currentMetrics;
  @override
  List<RealtimeAlert> get activeAlerts;
  @override
  DateTime get lastUpdated;
  @override
  int get updateIntervalSeconds;

  /// Create a copy of RealtimeMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeMetricsImplCopyWith<_$RealtimeMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RealtimeAlert _$RealtimeAlertFromJson(Map<String, dynamic> json) {
  return _RealtimeAlert.fromJson(json);
}

/// @nodoc
mixin _$RealtimeAlert {
  String get alertId => throw _privateConstructorUsedError;
  String get metric => throw _privateConstructorUsedError;
  double get threshold => throw _privateConstructorUsedError;
  double get currentValue => throw _privateConstructorUsedError;
  DateTime get triggeredAt => throw _privateConstructorUsedError;

  /// Serializes this RealtimeAlert to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RealtimeAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RealtimeAlertCopyWith<RealtimeAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealtimeAlertCopyWith<$Res> {
  factory $RealtimeAlertCopyWith(
          RealtimeAlert value, $Res Function(RealtimeAlert) then) =
      _$RealtimeAlertCopyWithImpl<$Res, RealtimeAlert>;
  @useResult
  $Res call(
      {String alertId,
      String metric,
      double threshold,
      double currentValue,
      DateTime triggeredAt});
}

/// @nodoc
class _$RealtimeAlertCopyWithImpl<$Res, $Val extends RealtimeAlert>
    implements $RealtimeAlertCopyWith<$Res> {
  _$RealtimeAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RealtimeAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alertId = null,
    Object? metric = null,
    Object? threshold = null,
    Object? currentValue = null,
    Object? triggeredAt = null,
  }) {
    return _then(_value.copyWith(
      alertId: null == alertId
          ? _value.alertId
          : alertId // ignore: cast_nullable_to_non_nullable
              as String,
      metric: null == metric
          ? _value.metric
          : metric // ignore: cast_nullable_to_non_nullable
              as String,
      threshold: null == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      triggeredAt: null == triggeredAt
          ? _value.triggeredAt
          : triggeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RealtimeAlertImplCopyWith<$Res>
    implements $RealtimeAlertCopyWith<$Res> {
  factory _$$RealtimeAlertImplCopyWith(
          _$RealtimeAlertImpl value, $Res Function(_$RealtimeAlertImpl) then) =
      __$$RealtimeAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String alertId,
      String metric,
      double threshold,
      double currentValue,
      DateTime triggeredAt});
}

/// @nodoc
class __$$RealtimeAlertImplCopyWithImpl<$Res>
    extends _$RealtimeAlertCopyWithImpl<$Res, _$RealtimeAlertImpl>
    implements _$$RealtimeAlertImplCopyWith<$Res> {
  __$$RealtimeAlertImplCopyWithImpl(
      _$RealtimeAlertImpl _value, $Res Function(_$RealtimeAlertImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alertId = null,
    Object? metric = null,
    Object? threshold = null,
    Object? currentValue = null,
    Object? triggeredAt = null,
  }) {
    return _then(_$RealtimeAlertImpl(
      alertId: null == alertId
          ? _value.alertId
          : alertId // ignore: cast_nullable_to_non_nullable
              as String,
      metric: null == metric
          ? _value.metric
          : metric // ignore: cast_nullable_to_non_nullable
              as String,
      threshold: null == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      triggeredAt: null == triggeredAt
          ? _value.triggeredAt
          : triggeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RealtimeAlertImpl implements _RealtimeAlert {
  const _$RealtimeAlertImpl(
      {required this.alertId,
      required this.metric,
      required this.threshold,
      required this.currentValue,
      required this.triggeredAt});

  factory _$RealtimeAlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$RealtimeAlertImplFromJson(json);

  @override
  final String alertId;
  @override
  final String metric;
  @override
  final double threshold;
  @override
  final double currentValue;
  @override
  final DateTime triggeredAt;

  @override
  String toString() {
    return 'RealtimeAlert(alertId: $alertId, metric: $metric, threshold: $threshold, currentValue: $currentValue, triggeredAt: $triggeredAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeAlertImpl &&
            (identical(other.alertId, alertId) || other.alertId == alertId) &&
            (identical(other.metric, metric) || other.metric == metric) &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.triggeredAt, triggeredAt) ||
                other.triggeredAt == triggeredAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, alertId, metric, threshold, currentValue, triggeredAt);

  /// Create a copy of RealtimeAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeAlertImplCopyWith<_$RealtimeAlertImpl> get copyWith =>
      __$$RealtimeAlertImplCopyWithImpl<_$RealtimeAlertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RealtimeAlertImplToJson(
      this,
    );
  }
}

abstract class _RealtimeAlert implements RealtimeAlert {
  const factory _RealtimeAlert(
      {required final String alertId,
      required final String metric,
      required final double threshold,
      required final double currentValue,
      required final DateTime triggeredAt}) = _$RealtimeAlertImpl;

  factory _RealtimeAlert.fromJson(Map<String, dynamic> json) =
      _$RealtimeAlertImpl.fromJson;

  @override
  String get alertId;
  @override
  String get metric;
  @override
  double get threshold;
  @override
  double get currentValue;
  @override
  DateTime get triggeredAt;

  /// Create a copy of RealtimeAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeAlertImplCopyWith<_$RealtimeAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomReport _$CustomReportFromJson(Map<String, dynamic> json) {
  return _CustomReport.fromJson(json);
}

/// @nodoc
mixin _$CustomReport {
  String get reportId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get selectedMetrics => throw _privateConstructorUsedError;
  DateRange get dateRange => throw _privateConstructorUsedError;
  List<ReportFilter> get filters => throw _privateConstructorUsedError;
  ReportFormat get format => throw _privateConstructorUsedError;
  DateTime? get lastGenerated => throw _privateConstructorUsedError;
  bool get isScheduled => throw _privateConstructorUsedError;
  ReportSchedule? get schedule => throw _privateConstructorUsedError;

  /// Serializes this CustomReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomReportCopyWith<CustomReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomReportCopyWith<$Res> {
  factory $CustomReportCopyWith(
          CustomReport value, $Res Function(CustomReport) then) =
      _$CustomReportCopyWithImpl<$Res, CustomReport>;
  @useResult
  $Res call(
      {String reportId,
      String userId,
      String name,
      List<String> selectedMetrics,
      DateRange dateRange,
      List<ReportFilter> filters,
      ReportFormat format,
      DateTime? lastGenerated,
      bool isScheduled,
      ReportSchedule? schedule});

  $DateRangeCopyWith<$Res> get dateRange;
  $ReportScheduleCopyWith<$Res>? get schedule;
}

/// @nodoc
class _$CustomReportCopyWithImpl<$Res, $Val extends CustomReport>
    implements $CustomReportCopyWith<$Res> {
  _$CustomReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportId = null,
    Object? userId = null,
    Object? name = null,
    Object? selectedMetrics = null,
    Object? dateRange = null,
    Object? filters = null,
    Object? format = null,
    Object? lastGenerated = freezed,
    Object? isScheduled = null,
    Object? schedule = freezed,
  }) {
    return _then(_value.copyWith(
      reportId: null == reportId
          ? _value.reportId
          : reportId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      selectedMetrics: null == selectedMetrics
          ? _value.selectedMetrics
          : selectedMetrics // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateRange,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<ReportFilter>,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as ReportFormat,
      lastGenerated: freezed == lastGenerated
          ? _value.lastGenerated
          : lastGenerated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isScheduled: null == isScheduled
          ? _value.isScheduled
          : isScheduled // ignore: cast_nullable_to_non_nullable
              as bool,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as ReportSchedule?,
    ) as $Val);
  }

  /// Create a copy of CustomReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DateRangeCopyWith<$Res> get dateRange {
    return $DateRangeCopyWith<$Res>(_value.dateRange, (value) {
      return _then(_value.copyWith(dateRange: value) as $Val);
    });
  }

  /// Create a copy of CustomReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReportScheduleCopyWith<$Res>? get schedule {
    if (_value.schedule == null) {
      return null;
    }

    return $ReportScheduleCopyWith<$Res>(_value.schedule!, (value) {
      return _then(_value.copyWith(schedule: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomReportImplCopyWith<$Res>
    implements $CustomReportCopyWith<$Res> {
  factory _$$CustomReportImplCopyWith(
          _$CustomReportImpl value, $Res Function(_$CustomReportImpl) then) =
      __$$CustomReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reportId,
      String userId,
      String name,
      List<String> selectedMetrics,
      DateRange dateRange,
      List<ReportFilter> filters,
      ReportFormat format,
      DateTime? lastGenerated,
      bool isScheduled,
      ReportSchedule? schedule});

  @override
  $DateRangeCopyWith<$Res> get dateRange;
  @override
  $ReportScheduleCopyWith<$Res>? get schedule;
}

/// @nodoc
class __$$CustomReportImplCopyWithImpl<$Res>
    extends _$CustomReportCopyWithImpl<$Res, _$CustomReportImpl>
    implements _$$CustomReportImplCopyWith<$Res> {
  __$$CustomReportImplCopyWithImpl(
      _$CustomReportImpl _value, $Res Function(_$CustomReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportId = null,
    Object? userId = null,
    Object? name = null,
    Object? selectedMetrics = null,
    Object? dateRange = null,
    Object? filters = null,
    Object? format = null,
    Object? lastGenerated = freezed,
    Object? isScheduled = null,
    Object? schedule = freezed,
  }) {
    return _then(_$CustomReportImpl(
      reportId: null == reportId
          ? _value.reportId
          : reportId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      selectedMetrics: null == selectedMetrics
          ? _value._selectedMetrics
          : selectedMetrics // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateRange,
      filters: null == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<ReportFilter>,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as ReportFormat,
      lastGenerated: freezed == lastGenerated
          ? _value.lastGenerated
          : lastGenerated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isScheduled: null == isScheduled
          ? _value.isScheduled
          : isScheduled // ignore: cast_nullable_to_non_nullable
              as bool,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as ReportSchedule?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomReportImpl implements _CustomReport {
  const _$CustomReportImpl(
      {required this.reportId,
      required this.userId,
      required this.name,
      required final List<String> selectedMetrics,
      required this.dateRange,
      required final List<ReportFilter> filters,
      required this.format,
      this.lastGenerated,
      this.isScheduled = false,
      this.schedule})
      : _selectedMetrics = selectedMetrics,
        _filters = filters;

  factory _$CustomReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomReportImplFromJson(json);

  @override
  final String reportId;
  @override
  final String userId;
  @override
  final String name;
  final List<String> _selectedMetrics;
  @override
  List<String> get selectedMetrics {
    if (_selectedMetrics is EqualUnmodifiableListView) return _selectedMetrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedMetrics);
  }

  @override
  final DateRange dateRange;
  final List<ReportFilter> _filters;
  @override
  List<ReportFilter> get filters {
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filters);
  }

  @override
  final ReportFormat format;
  @override
  final DateTime? lastGenerated;
  @override
  @JsonKey()
  final bool isScheduled;
  @override
  final ReportSchedule? schedule;

  @override
  String toString() {
    return 'CustomReport(reportId: $reportId, userId: $userId, name: $name, selectedMetrics: $selectedMetrics, dateRange: $dateRange, filters: $filters, format: $format, lastGenerated: $lastGenerated, isScheduled: $isScheduled, schedule: $schedule)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomReportImpl &&
            (identical(other.reportId, reportId) ||
                other.reportId == reportId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._selectedMetrics, _selectedMetrics) &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange) &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.lastGenerated, lastGenerated) ||
                other.lastGenerated == lastGenerated) &&
            (identical(other.isScheduled, isScheduled) ||
                other.isScheduled == isScheduled) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reportId,
      userId,
      name,
      const DeepCollectionEquality().hash(_selectedMetrics),
      dateRange,
      const DeepCollectionEquality().hash(_filters),
      format,
      lastGenerated,
      isScheduled,
      schedule);

  /// Create a copy of CustomReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomReportImplCopyWith<_$CustomReportImpl> get copyWith =>
      __$$CustomReportImplCopyWithImpl<_$CustomReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomReportImplToJson(
      this,
    );
  }
}

abstract class _CustomReport implements CustomReport {
  const factory _CustomReport(
      {required final String reportId,
      required final String userId,
      required final String name,
      required final List<String> selectedMetrics,
      required final DateRange dateRange,
      required final List<ReportFilter> filters,
      required final ReportFormat format,
      final DateTime? lastGenerated,
      final bool isScheduled,
      final ReportSchedule? schedule}) = _$CustomReportImpl;

  factory _CustomReport.fromJson(Map<String, dynamic> json) =
      _$CustomReportImpl.fromJson;

  @override
  String get reportId;
  @override
  String get userId;
  @override
  String get name;
  @override
  List<String> get selectedMetrics;
  @override
  DateRange get dateRange;
  @override
  List<ReportFilter> get filters;
  @override
  ReportFormat get format;
  @override
  DateTime? get lastGenerated;
  @override
  bool get isScheduled;
  @override
  ReportSchedule? get schedule;

  /// Create a copy of CustomReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomReportImplCopyWith<_$CustomReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DateRange _$DateRangeFromJson(Map<String, dynamic> json) {
  return _DateRange.fromJson(json);
}

/// @nodoc
mixin _$DateRange {
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  DateRangeType? get type => throw _privateConstructorUsedError;

  /// Serializes this DateRange to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DateRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DateRangeCopyWith<DateRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateRangeCopyWith<$Res> {
  factory $DateRangeCopyWith(DateRange value, $Res Function(DateRange) then) =
      _$DateRangeCopyWithImpl<$Res, DateRange>;
  @useResult
  $Res call({DateTime startDate, DateTime endDate, DateRangeType? type});
}

/// @nodoc
class _$DateRangeCopyWithImpl<$Res, $Val extends DateRange>
    implements $DateRangeCopyWith<$Res> {
  _$DateRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DateRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DateRangeType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DateRangeImplCopyWith<$Res>
    implements $DateRangeCopyWith<$Res> {
  factory _$$DateRangeImplCopyWith(
          _$DateRangeImpl value, $Res Function(_$DateRangeImpl) then) =
      __$$DateRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime startDate, DateTime endDate, DateRangeType? type});
}

/// @nodoc
class __$$DateRangeImplCopyWithImpl<$Res>
    extends _$DateRangeCopyWithImpl<$Res, _$DateRangeImpl>
    implements _$$DateRangeImplCopyWith<$Res> {
  __$$DateRangeImplCopyWithImpl(
      _$DateRangeImpl _value, $Res Function(_$DateRangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of DateRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? type = freezed,
  }) {
    return _then(_$DateRangeImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DateRangeType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DateRangeImpl implements _DateRange {
  const _$DateRangeImpl(
      {required this.startDate, required this.endDate, this.type});

  factory _$DateRangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DateRangeImplFromJson(json);

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final DateRangeType? type;

  @override
  String toString() {
    return 'DateRange(startDate: $startDate, endDate: $endDate, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateRangeImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate, type);

  /// Create a copy of DateRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DateRangeImplCopyWith<_$DateRangeImpl> get copyWith =>
      __$$DateRangeImplCopyWithImpl<_$DateRangeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DateRangeImplToJson(
      this,
    );
  }
}

abstract class _DateRange implements DateRange {
  const factory _DateRange(
      {required final DateTime startDate,
      required final DateTime endDate,
      final DateRangeType? type}) = _$DateRangeImpl;

  factory _DateRange.fromJson(Map<String, dynamic> json) =
      _$DateRangeImpl.fromJson;

  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  DateRangeType? get type;

  /// Create a copy of DateRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DateRangeImplCopyWith<_$DateRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReportFilter _$ReportFilterFromJson(Map<String, dynamic> json) {
  return _ReportFilter.fromJson(json);
}

/// @nodoc
mixin _$ReportFilter {
  String get field => throw _privateConstructorUsedError;
  FilterOperator get operator => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;

  /// Serializes this ReportFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportFilterCopyWith<ReportFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportFilterCopyWith<$Res> {
  factory $ReportFilterCopyWith(
          ReportFilter value, $Res Function(ReportFilter) then) =
      _$ReportFilterCopyWithImpl<$Res, ReportFilter>;
  @useResult
  $Res call({String field, FilterOperator operator, dynamic value});
}

/// @nodoc
class _$ReportFilterCopyWithImpl<$Res, $Val extends ReportFilter>
    implements $ReportFilterCopyWith<$Res> {
  _$ReportFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? operator = null,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as FilterOperator,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportFilterImplCopyWith<$Res>
    implements $ReportFilterCopyWith<$Res> {
  factory _$$ReportFilterImplCopyWith(
          _$ReportFilterImpl value, $Res Function(_$ReportFilterImpl) then) =
      __$$ReportFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String field, FilterOperator operator, dynamic value});
}

/// @nodoc
class __$$ReportFilterImplCopyWithImpl<$Res>
    extends _$ReportFilterCopyWithImpl<$Res, _$ReportFilterImpl>
    implements _$$ReportFilterImplCopyWith<$Res> {
  __$$ReportFilterImplCopyWithImpl(
      _$ReportFilterImpl _value, $Res Function(_$ReportFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? operator = null,
    Object? value = freezed,
  }) {
    return _then(_$ReportFilterImpl(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as FilterOperator,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportFilterImpl implements _ReportFilter {
  const _$ReportFilterImpl(
      {required this.field, required this.operator, required this.value});

  factory _$ReportFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportFilterImplFromJson(json);

  @override
  final String field;
  @override
  final FilterOperator operator;
  @override
  final dynamic value;

  @override
  String toString() {
    return 'ReportFilter(field: $field, operator: $operator, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportFilterImpl &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.operator, operator) ||
                other.operator == operator) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, field, operator, const DeepCollectionEquality().hash(value));

  /// Create a copy of ReportFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportFilterImplCopyWith<_$ReportFilterImpl> get copyWith =>
      __$$ReportFilterImplCopyWithImpl<_$ReportFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportFilterImplToJson(
      this,
    );
  }
}

abstract class _ReportFilter implements ReportFilter {
  const factory _ReportFilter(
      {required final String field,
      required final FilterOperator operator,
      required final dynamic value}) = _$ReportFilterImpl;

  factory _ReportFilter.fromJson(Map<String, dynamic> json) =
      _$ReportFilterImpl.fromJson;

  @override
  String get field;
  @override
  FilterOperator get operator;
  @override
  dynamic get value;

  /// Create a copy of ReportFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportFilterImplCopyWith<_$ReportFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReportSchedule _$ReportScheduleFromJson(Map<String, dynamic> json) {
  return _ReportSchedule.fromJson(json);
}

/// @nodoc
mixin _$ReportSchedule {
  ScheduleFrequency get frequency => throw _privateConstructorUsedError;
  List<int> get daysOfWeek => throw _privateConstructorUsedError;
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;
  List<String> get recipients => throw _privateConstructorUsedError;

  /// Serializes this ReportSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportScheduleCopyWith<ReportSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportScheduleCopyWith<$Res> {
  factory $ReportScheduleCopyWith(
          ReportSchedule value, $Res Function(ReportSchedule) then) =
      _$ReportScheduleCopyWithImpl<$Res, ReportSchedule>;
  @useResult
  $Res call(
      {ScheduleFrequency frequency,
      List<int> daysOfWeek,
      int hour,
      int minute,
      List<String> recipients});
}

/// @nodoc
class _$ReportScheduleCopyWithImpl<$Res, $Val extends ReportSchedule>
    implements $ReportScheduleCopyWith<$Res> {
  _$ReportScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frequency = null,
    Object? daysOfWeek = null,
    Object? hour = null,
    Object? minute = null,
    Object? recipients = null,
  }) {
    return _then(_value.copyWith(
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as ScheduleFrequency,
      daysOfWeek: null == daysOfWeek
          ? _value.daysOfWeek
          : daysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      recipients: null == recipients
          ? _value.recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportScheduleImplCopyWith<$Res>
    implements $ReportScheduleCopyWith<$Res> {
  factory _$$ReportScheduleImplCopyWith(_$ReportScheduleImpl value,
          $Res Function(_$ReportScheduleImpl) then) =
      __$$ReportScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScheduleFrequency frequency,
      List<int> daysOfWeek,
      int hour,
      int minute,
      List<String> recipients});
}

/// @nodoc
class __$$ReportScheduleImplCopyWithImpl<$Res>
    extends _$ReportScheduleCopyWithImpl<$Res, _$ReportScheduleImpl>
    implements _$$ReportScheduleImplCopyWith<$Res> {
  __$$ReportScheduleImplCopyWithImpl(
      _$ReportScheduleImpl _value, $Res Function(_$ReportScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frequency = null,
    Object? daysOfWeek = null,
    Object? hour = null,
    Object? minute = null,
    Object? recipients = null,
  }) {
    return _then(_$ReportScheduleImpl(
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as ScheduleFrequency,
      daysOfWeek: null == daysOfWeek
          ? _value._daysOfWeek
          : daysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      recipients: null == recipients
          ? _value._recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportScheduleImpl implements _ReportSchedule {
  const _$ReportScheduleImpl(
      {required this.frequency,
      required final List<int> daysOfWeek,
      required this.hour,
      required this.minute,
      required final List<String> recipients})
      : _daysOfWeek = daysOfWeek,
        _recipients = recipients;

  factory _$ReportScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportScheduleImplFromJson(json);

  @override
  final ScheduleFrequency frequency;
  final List<int> _daysOfWeek;
  @override
  List<int> get daysOfWeek {
    if (_daysOfWeek is EqualUnmodifiableListView) return _daysOfWeek;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_daysOfWeek);
  }

  @override
  final int hour;
  @override
  final int minute;
  final List<String> _recipients;
  @override
  List<String> get recipients {
    if (_recipients is EqualUnmodifiableListView) return _recipients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipients);
  }

  @override
  String toString() {
    return 'ReportSchedule(frequency: $frequency, daysOfWeek: $daysOfWeek, hour: $hour, minute: $minute, recipients: $recipients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportScheduleImpl &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            const DeepCollectionEquality()
                .equals(other._daysOfWeek, _daysOfWeek) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute) &&
            const DeepCollectionEquality()
                .equals(other._recipients, _recipients));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      frequency,
      const DeepCollectionEquality().hash(_daysOfWeek),
      hour,
      minute,
      const DeepCollectionEquality().hash(_recipients));

  /// Create a copy of ReportSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportScheduleImplCopyWith<_$ReportScheduleImpl> get copyWith =>
      __$$ReportScheduleImplCopyWithImpl<_$ReportScheduleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportScheduleImplToJson(
      this,
    );
  }
}

abstract class _ReportSchedule implements ReportSchedule {
  const factory _ReportSchedule(
      {required final ScheduleFrequency frequency,
      required final List<int> daysOfWeek,
      required final int hour,
      required final int minute,
      required final List<String> recipients}) = _$ReportScheduleImpl;

  factory _ReportSchedule.fromJson(Map<String, dynamic> json) =
      _$ReportScheduleImpl.fromJson;

  @override
  ScheduleFrequency get frequency;
  @override
  List<int> get daysOfWeek;
  @override
  int get hour;
  @override
  int get minute;
  @override
  List<String> get recipients;

  /// Create a copy of ReportSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportScheduleImplCopyWith<_$ReportScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
