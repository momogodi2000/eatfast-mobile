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

AnalyticsData _$AnalyticsDataFromJson(Map<String, dynamic> json) {
  return _AnalyticsData.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsData {
  List<AnalyticsCard> get cards => throw _privateConstructorUsedError;
  List<RevenuePoint> get revenueData => throw _privateConstructorUsedError;
  List<OrderTrendPoint> get orderTrendData =>
      throw _privateConstructorUsedError;
  base.PerformanceMetrics get performanceMetrics =>
      throw _privateConstructorUsedError;
  base.CustomerInsights get customerInsights =>
      throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this AnalyticsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsDataCopyWith<AnalyticsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsDataCopyWith<$Res> {
  factory $AnalyticsDataCopyWith(
          AnalyticsData value, $Res Function(AnalyticsData) then) =
      _$AnalyticsDataCopyWithImpl<$Res, AnalyticsData>;
  @useResult
  $Res call(
      {List<AnalyticsCard> cards,
      List<RevenuePoint> revenueData,
      List<OrderTrendPoint> orderTrendData,
      base.PerformanceMetrics performanceMetrics,
      base.CustomerInsights customerInsights,
      DateTime generatedAt,
      String? error});

  $PerformanceMetricsCopyWith<$Res> get performanceMetrics;
  $CustomerInsightsCopyWith<$Res> get customerInsights;
}

/// @nodoc
class _$AnalyticsDataCopyWithImpl<$Res, $Val extends AnalyticsData>
    implements $AnalyticsDataCopyWith<$Res> {
  _$AnalyticsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
    Object? revenueData = null,
    Object? orderTrendData = null,
    Object? performanceMetrics = null,
    Object? customerInsights = null,
    Object? generatedAt = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<AnalyticsCard>,
      revenueData: null == revenueData
          ? _value.revenueData
          : revenueData // ignore: cast_nullable_to_non_nullable
              as List<RevenuePoint>,
      orderTrendData: null == orderTrendData
          ? _value.orderTrendData
          : orderTrendData // ignore: cast_nullable_to_non_nullable
              as List<OrderTrendPoint>,
      performanceMetrics: null == performanceMetrics
          ? _value.performanceMetrics
          : performanceMetrics // ignore: cast_nullable_to_non_nullable
              as base.PerformanceMetrics,
      customerInsights: null == customerInsights
          ? _value.customerInsights
          : customerInsights // ignore: cast_nullable_to_non_nullable
              as base.CustomerInsights,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of AnalyticsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PerformanceMetricsCopyWith<$Res> get performanceMetrics {
    return $PerformanceMetricsCopyWith<$Res>(_value.performanceMetrics,
        (value) {
      return _then(_value.copyWith(performanceMetrics: value) as $Val);
    });
  }

  /// Create a copy of AnalyticsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerInsightsCopyWith<$Res> get customerInsights {
    return $CustomerInsightsCopyWith<$Res>(_value.customerInsights, (value) {
      return _then(_value.copyWith(customerInsights: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalyticsDataImplCopyWith<$Res>
    implements $AnalyticsDataCopyWith<$Res> {
  factory _$$AnalyticsDataImplCopyWith(
          _$AnalyticsDataImpl value, $Res Function(_$AnalyticsDataImpl) then) =
      __$$AnalyticsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AnalyticsCard> cards,
      List<RevenuePoint> revenueData,
      List<OrderTrendPoint> orderTrendData,
      base.PerformanceMetrics performanceMetrics,
      base.CustomerInsights customerInsights,
      DateTime generatedAt,
      String? error});

  @override
  $PerformanceMetricsCopyWith<$Res> get performanceMetrics;
  @override
  $CustomerInsightsCopyWith<$Res> get customerInsights;
}

/// @nodoc
class __$$AnalyticsDataImplCopyWithImpl<$Res>
    extends _$AnalyticsDataCopyWithImpl<$Res, _$AnalyticsDataImpl>
    implements _$$AnalyticsDataImplCopyWith<$Res> {
  __$$AnalyticsDataImplCopyWithImpl(
      _$AnalyticsDataImpl _value, $Res Function(_$AnalyticsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
    Object? revenueData = null,
    Object? orderTrendData = null,
    Object? performanceMetrics = null,
    Object? customerInsights = null,
    Object? generatedAt = null,
    Object? error = freezed,
  }) {
    return _then(_$AnalyticsDataImpl(
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<AnalyticsCard>,
      revenueData: null == revenueData
          ? _value._revenueData
          : revenueData // ignore: cast_nullable_to_non_nullable
              as List<RevenuePoint>,
      orderTrendData: null == orderTrendData
          ? _value._orderTrendData
          : orderTrendData // ignore: cast_nullable_to_non_nullable
              as List<OrderTrendPoint>,
      performanceMetrics: null == performanceMetrics
          ? _value.performanceMetrics
          : performanceMetrics // ignore: cast_nullable_to_non_nullable
              as base.PerformanceMetrics,
      customerInsights: null == customerInsights
          ? _value.customerInsights
          : customerInsights // ignore: cast_nullable_to_non_nullable
              as base.CustomerInsights,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsDataImpl implements _AnalyticsData {
  const _$AnalyticsDataImpl(
      {required final List<AnalyticsCard> cards,
      required final List<RevenuePoint> revenueData,
      required final List<OrderTrendPoint> orderTrendData,
      required this.performanceMetrics,
      required this.customerInsights,
      required this.generatedAt,
      this.error})
      : _cards = cards,
        _revenueData = revenueData,
        _orderTrendData = orderTrendData;

  factory _$AnalyticsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsDataImplFromJson(json);

  final List<AnalyticsCard> _cards;
  @override
  List<AnalyticsCard> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  final List<RevenuePoint> _revenueData;
  @override
  List<RevenuePoint> get revenueData {
    if (_revenueData is EqualUnmodifiableListView) return _revenueData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_revenueData);
  }

  final List<OrderTrendPoint> _orderTrendData;
  @override
  List<OrderTrendPoint> get orderTrendData {
    if (_orderTrendData is EqualUnmodifiableListView) return _orderTrendData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderTrendData);
  }

  @override
  final base.PerformanceMetrics performanceMetrics;
  @override
  final base.CustomerInsights customerInsights;
  @override
  final DateTime generatedAt;
  @override
  final String? error;

  @override
  String toString() {
    return 'AnalyticsData(cards: $cards, revenueData: $revenueData, orderTrendData: $orderTrendData, performanceMetrics: $performanceMetrics, customerInsights: $customerInsights, generatedAt: $generatedAt, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsDataImpl &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            const DeepCollectionEquality()
                .equals(other._revenueData, _revenueData) &&
            const DeepCollectionEquality()
                .equals(other._orderTrendData, _orderTrendData) &&
            (identical(other.performanceMetrics, performanceMetrics) ||
                other.performanceMetrics == performanceMetrics) &&
            (identical(other.customerInsights, customerInsights) ||
                other.customerInsights == customerInsights) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cards),
      const DeepCollectionEquality().hash(_revenueData),
      const DeepCollectionEquality().hash(_orderTrendData),
      performanceMetrics,
      customerInsights,
      generatedAt,
      error);

  /// Create a copy of AnalyticsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsDataImplCopyWith<_$AnalyticsDataImpl> get copyWith =>
      __$$AnalyticsDataImplCopyWithImpl<_$AnalyticsDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsDataImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsData implements AnalyticsData {
  const factory _AnalyticsData(
      {required final List<AnalyticsCard> cards,
      required final List<RevenuePoint> revenueData,
      required final List<OrderTrendPoint> orderTrendData,
      required final base.PerformanceMetrics performanceMetrics,
      required final base.CustomerInsights customerInsights,
      required final DateTime generatedAt,
      final String? error}) = _$AnalyticsDataImpl;

  factory _AnalyticsData.fromJson(Map<String, dynamic> json) =
      _$AnalyticsDataImpl.fromJson;

  @override
  List<AnalyticsCard> get cards;
  @override
  List<RevenuePoint> get revenueData;
  @override
  List<OrderTrendPoint> get orderTrendData;
  @override
  base.PerformanceMetrics get performanceMetrics;
  @override
  base.CustomerInsights get customerInsights;
  @override
  DateTime get generatedAt;
  @override
  String? get error;

  /// Create a copy of AnalyticsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsDataImplCopyWith<_$AnalyticsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticsRequest _$AnalyticsRequestFromJson(Map<String, dynamic> json) {
  return _AnalyticsRequest.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsRequest {
  AnalyticsTimeRange get timeRange => throw _privateConstructorUsedError;
  AnalyticsUserType get userType => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  List<String>? get metrics => throw _privateConstructorUsedError;
  Map<String, dynamic>? get filters => throw _privateConstructorUsedError;

  /// Serializes this AnalyticsRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsRequestCopyWith<AnalyticsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsRequestCopyWith<$Res> {
  factory $AnalyticsRequestCopyWith(
          AnalyticsRequest value, $Res Function(AnalyticsRequest) then) =
      _$AnalyticsRequestCopyWithImpl<$Res, AnalyticsRequest>;
  @useResult
  $Res call(
      {AnalyticsTimeRange timeRange,
      AnalyticsUserType userType,
      DateTime? startDate,
      DateTime? endDate,
      List<String>? metrics,
      Map<String, dynamic>? filters});
}

/// @nodoc
class _$AnalyticsRequestCopyWithImpl<$Res, $Val extends AnalyticsRequest>
    implements $AnalyticsRequestCopyWith<$Res> {
  _$AnalyticsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeRange = null,
    Object? userType = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? metrics = freezed,
    Object? filters = freezed,
  }) {
    return _then(_value.copyWith(
      timeRange: null == timeRange
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as AnalyticsTimeRange,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as AnalyticsUserType,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metrics: freezed == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      filters: freezed == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsRequestImplCopyWith<$Res>
    implements $AnalyticsRequestCopyWith<$Res> {
  factory _$$AnalyticsRequestImplCopyWith(_$AnalyticsRequestImpl value,
          $Res Function(_$AnalyticsRequestImpl) then) =
      __$$AnalyticsRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AnalyticsTimeRange timeRange,
      AnalyticsUserType userType,
      DateTime? startDate,
      DateTime? endDate,
      List<String>? metrics,
      Map<String, dynamic>? filters});
}

/// @nodoc
class __$$AnalyticsRequestImplCopyWithImpl<$Res>
    extends _$AnalyticsRequestCopyWithImpl<$Res, _$AnalyticsRequestImpl>
    implements _$$AnalyticsRequestImplCopyWith<$Res> {
  __$$AnalyticsRequestImplCopyWithImpl(_$AnalyticsRequestImpl _value,
      $Res Function(_$AnalyticsRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeRange = null,
    Object? userType = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? metrics = freezed,
    Object? filters = freezed,
  }) {
    return _then(_$AnalyticsRequestImpl(
      timeRange: null == timeRange
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as AnalyticsTimeRange,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as AnalyticsUserType,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metrics: freezed == metrics
          ? _value._metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      filters: freezed == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsRequestImpl implements _AnalyticsRequest {
  const _$AnalyticsRequestImpl(
      {required this.timeRange,
      required this.userType,
      this.startDate,
      this.endDate,
      final List<String>? metrics,
      final Map<String, dynamic>? filters})
      : _metrics = metrics,
        _filters = filters;

  factory _$AnalyticsRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsRequestImplFromJson(json);

  @override
  final AnalyticsTimeRange timeRange;
  @override
  final AnalyticsUserType userType;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  final List<String>? _metrics;
  @override
  List<String>? get metrics {
    final value = _metrics;
    if (value == null) return null;
    if (_metrics is EqualUnmodifiableListView) return _metrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _filters;
  @override
  Map<String, dynamic>? get filters {
    final value = _filters;
    if (value == null) return null;
    if (_filters is EqualUnmodifiableMapView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AnalyticsRequest(timeRange: $timeRange, userType: $userType, startDate: $startDate, endDate: $endDate, metrics: $metrics, filters: $filters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsRequestImpl &&
            (identical(other.timeRange, timeRange) ||
                other.timeRange == timeRange) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other._metrics, _metrics) &&
            const DeepCollectionEquality().equals(other._filters, _filters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      timeRange,
      userType,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_metrics),
      const DeepCollectionEquality().hash(_filters));

  /// Create a copy of AnalyticsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsRequestImplCopyWith<_$AnalyticsRequestImpl> get copyWith =>
      __$$AnalyticsRequestImplCopyWithImpl<_$AnalyticsRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsRequestImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsRequest implements AnalyticsRequest {
  const factory _AnalyticsRequest(
      {required final AnalyticsTimeRange timeRange,
      required final AnalyticsUserType userType,
      final DateTime? startDate,
      final DateTime? endDate,
      final List<String>? metrics,
      final Map<String, dynamic>? filters}) = _$AnalyticsRequestImpl;

  factory _AnalyticsRequest.fromJson(Map<String, dynamic> json) =
      _$AnalyticsRequestImpl.fromJson;

  @override
  AnalyticsTimeRange get timeRange;
  @override
  AnalyticsUserType get userType;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  List<String>? get metrics;
  @override
  Map<String, dynamic>? get filters;

  /// Create a copy of AnalyticsRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsRequestImplCopyWith<_$AnalyticsRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
