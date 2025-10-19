// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestaurantStats _$RestaurantStatsFromJson(Map<String, dynamic> json) {
  return _RestaurantStats.fromJson(json);
}

/// @nodoc
mixin _$RestaurantStats {
  int get totalOrders => throw _privateConstructorUsedError;
  double get totalRevenue => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;
  int get activeOrders => throw _privateConstructorUsedError;
  int get completedToday => throw _privateConstructorUsedError;
  double get todayRevenue => throw _privateConstructorUsedError;
  int get totalCustomers => throw _privateConstructorUsedError;
  double get averageOrderValue => throw _privateConstructorUsedError;
  int get pendingOrders => throw _privateConstructorUsedError;
  int get rejectedOrders => throw _privateConstructorUsedError;
  List<HourlyStats> get hourlyStats => throw _privateConstructorUsedError;
  List<DailyStats> get weeklyStats => throw _privateConstructorUsedError;
  List<PopularItem> get popularItems => throw _privateConstructorUsedError;

  /// Serializes this RestaurantStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantStatsCopyWith<RestaurantStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantStatsCopyWith<$Res> {
  factory $RestaurantStatsCopyWith(
          RestaurantStats value, $Res Function(RestaurantStats) then) =
      _$RestaurantStatsCopyWithImpl<$Res, RestaurantStats>;
  @useResult
  $Res call(
      {int totalOrders,
      double totalRevenue,
      double averageRating,
      int activeOrders,
      int completedToday,
      double todayRevenue,
      int totalCustomers,
      double averageOrderValue,
      int pendingOrders,
      int rejectedOrders,
      List<HourlyStats> hourlyStats,
      List<DailyStats> weeklyStats,
      List<PopularItem> popularItems});
}

/// @nodoc
class _$RestaurantStatsCopyWithImpl<$Res, $Val extends RestaurantStats>
    implements $RestaurantStatsCopyWith<$Res> {
  _$RestaurantStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalOrders = null,
    Object? totalRevenue = null,
    Object? averageRating = null,
    Object? activeOrders = null,
    Object? completedToday = null,
    Object? todayRevenue = null,
    Object? totalCustomers = null,
    Object? averageOrderValue = null,
    Object? pendingOrders = null,
    Object? rejectedOrders = null,
    Object? hourlyStats = null,
    Object? weeklyStats = null,
    Object? popularItems = null,
  }) {
    return _then(_value.copyWith(
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      activeOrders: null == activeOrders
          ? _value.activeOrders
          : activeOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completedToday: null == completedToday
          ? _value.completedToday
          : completedToday // ignore: cast_nullable_to_non_nullable
              as int,
      todayRevenue: null == todayRevenue
          ? _value.todayRevenue
          : todayRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      totalCustomers: null == totalCustomers
          ? _value.totalCustomers
          : totalCustomers // ignore: cast_nullable_to_non_nullable
              as int,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      pendingOrders: null == pendingOrders
          ? _value.pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as int,
      rejectedOrders: null == rejectedOrders
          ? _value.rejectedOrders
          : rejectedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      hourlyStats: null == hourlyStats
          ? _value.hourlyStats
          : hourlyStats // ignore: cast_nullable_to_non_nullable
              as List<HourlyStats>,
      weeklyStats: null == weeklyStats
          ? _value.weeklyStats
          : weeklyStats // ignore: cast_nullable_to_non_nullable
              as List<DailyStats>,
      popularItems: null == popularItems
          ? _value.popularItems
          : popularItems // ignore: cast_nullable_to_non_nullable
              as List<PopularItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantStatsImplCopyWith<$Res>
    implements $RestaurantStatsCopyWith<$Res> {
  factory _$$RestaurantStatsImplCopyWith(_$RestaurantStatsImpl value,
          $Res Function(_$RestaurantStatsImpl) then) =
      __$$RestaurantStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalOrders,
      double totalRevenue,
      double averageRating,
      int activeOrders,
      int completedToday,
      double todayRevenue,
      int totalCustomers,
      double averageOrderValue,
      int pendingOrders,
      int rejectedOrders,
      List<HourlyStats> hourlyStats,
      List<DailyStats> weeklyStats,
      List<PopularItem> popularItems});
}

/// @nodoc
class __$$RestaurantStatsImplCopyWithImpl<$Res>
    extends _$RestaurantStatsCopyWithImpl<$Res, _$RestaurantStatsImpl>
    implements _$$RestaurantStatsImplCopyWith<$Res> {
  __$$RestaurantStatsImplCopyWithImpl(
      _$RestaurantStatsImpl _value, $Res Function(_$RestaurantStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestaurantStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalOrders = null,
    Object? totalRevenue = null,
    Object? averageRating = null,
    Object? activeOrders = null,
    Object? completedToday = null,
    Object? todayRevenue = null,
    Object? totalCustomers = null,
    Object? averageOrderValue = null,
    Object? pendingOrders = null,
    Object? rejectedOrders = null,
    Object? hourlyStats = null,
    Object? weeklyStats = null,
    Object? popularItems = null,
  }) {
    return _then(_$RestaurantStatsImpl(
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      activeOrders: null == activeOrders
          ? _value.activeOrders
          : activeOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completedToday: null == completedToday
          ? _value.completedToday
          : completedToday // ignore: cast_nullable_to_non_nullable
              as int,
      todayRevenue: null == todayRevenue
          ? _value.todayRevenue
          : todayRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      totalCustomers: null == totalCustomers
          ? _value.totalCustomers
          : totalCustomers // ignore: cast_nullable_to_non_nullable
              as int,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      pendingOrders: null == pendingOrders
          ? _value.pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as int,
      rejectedOrders: null == rejectedOrders
          ? _value.rejectedOrders
          : rejectedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      hourlyStats: null == hourlyStats
          ? _value._hourlyStats
          : hourlyStats // ignore: cast_nullable_to_non_nullable
              as List<HourlyStats>,
      weeklyStats: null == weeklyStats
          ? _value._weeklyStats
          : weeklyStats // ignore: cast_nullable_to_non_nullable
              as List<DailyStats>,
      popularItems: null == popularItems
          ? _value._popularItems
          : popularItems // ignore: cast_nullable_to_non_nullable
              as List<PopularItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantStatsImpl implements _RestaurantStats {
  const _$RestaurantStatsImpl(
      {required this.totalOrders,
      required this.totalRevenue,
      required this.averageRating,
      required this.activeOrders,
      required this.completedToday,
      required this.todayRevenue,
      required this.totalCustomers,
      required this.averageOrderValue,
      required this.pendingOrders,
      required this.rejectedOrders,
      final List<HourlyStats> hourlyStats = const [],
      final List<DailyStats> weeklyStats = const [],
      final List<PopularItem> popularItems = const []})
      : _hourlyStats = hourlyStats,
        _weeklyStats = weeklyStats,
        _popularItems = popularItems;

  factory _$RestaurantStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantStatsImplFromJson(json);

  @override
  final int totalOrders;
  @override
  final double totalRevenue;
  @override
  final double averageRating;
  @override
  final int activeOrders;
  @override
  final int completedToday;
  @override
  final double todayRevenue;
  @override
  final int totalCustomers;
  @override
  final double averageOrderValue;
  @override
  final int pendingOrders;
  @override
  final int rejectedOrders;
  final List<HourlyStats> _hourlyStats;
  @override
  @JsonKey()
  List<HourlyStats> get hourlyStats {
    if (_hourlyStats is EqualUnmodifiableListView) return _hourlyStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyStats);
  }

  final List<DailyStats> _weeklyStats;
  @override
  @JsonKey()
  List<DailyStats> get weeklyStats {
    if (_weeklyStats is EqualUnmodifiableListView) return _weeklyStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyStats);
  }

  final List<PopularItem> _popularItems;
  @override
  @JsonKey()
  List<PopularItem> get popularItems {
    if (_popularItems is EqualUnmodifiableListView) return _popularItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popularItems);
  }

  @override
  String toString() {
    return 'RestaurantStats(totalOrders: $totalOrders, totalRevenue: $totalRevenue, averageRating: $averageRating, activeOrders: $activeOrders, completedToday: $completedToday, todayRevenue: $todayRevenue, totalCustomers: $totalCustomers, averageOrderValue: $averageOrderValue, pendingOrders: $pendingOrders, rejectedOrders: $rejectedOrders, hourlyStats: $hourlyStats, weeklyStats: $weeklyStats, popularItems: $popularItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantStatsImpl &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.activeOrders, activeOrders) ||
                other.activeOrders == activeOrders) &&
            (identical(other.completedToday, completedToday) ||
                other.completedToday == completedToday) &&
            (identical(other.todayRevenue, todayRevenue) ||
                other.todayRevenue == todayRevenue) &&
            (identical(other.totalCustomers, totalCustomers) ||
                other.totalCustomers == totalCustomers) &&
            (identical(other.averageOrderValue, averageOrderValue) ||
                other.averageOrderValue == averageOrderValue) &&
            (identical(other.pendingOrders, pendingOrders) ||
                other.pendingOrders == pendingOrders) &&
            (identical(other.rejectedOrders, rejectedOrders) ||
                other.rejectedOrders == rejectedOrders) &&
            const DeepCollectionEquality()
                .equals(other._hourlyStats, _hourlyStats) &&
            const DeepCollectionEquality()
                .equals(other._weeklyStats, _weeklyStats) &&
            const DeepCollectionEquality()
                .equals(other._popularItems, _popularItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalOrders,
      totalRevenue,
      averageRating,
      activeOrders,
      completedToday,
      todayRevenue,
      totalCustomers,
      averageOrderValue,
      pendingOrders,
      rejectedOrders,
      const DeepCollectionEquality().hash(_hourlyStats),
      const DeepCollectionEquality().hash(_weeklyStats),
      const DeepCollectionEquality().hash(_popularItems));

  /// Create a copy of RestaurantStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantStatsImplCopyWith<_$RestaurantStatsImpl> get copyWith =>
      __$$RestaurantStatsImplCopyWithImpl<_$RestaurantStatsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantStatsImplToJson(
      this,
    );
  }
}

abstract class _RestaurantStats implements RestaurantStats {
  const factory _RestaurantStats(
      {required final int totalOrders,
      required final double totalRevenue,
      required final double averageRating,
      required final int activeOrders,
      required final int completedToday,
      required final double todayRevenue,
      required final int totalCustomers,
      required final double averageOrderValue,
      required final int pendingOrders,
      required final int rejectedOrders,
      final List<HourlyStats> hourlyStats,
      final List<DailyStats> weeklyStats,
      final List<PopularItem> popularItems}) = _$RestaurantStatsImpl;

  factory _RestaurantStats.fromJson(Map<String, dynamic> json) =
      _$RestaurantStatsImpl.fromJson;

  @override
  int get totalOrders;
  @override
  double get totalRevenue;
  @override
  double get averageRating;
  @override
  int get activeOrders;
  @override
  int get completedToday;
  @override
  double get todayRevenue;
  @override
  int get totalCustomers;
  @override
  double get averageOrderValue;
  @override
  int get pendingOrders;
  @override
  int get rejectedOrders;
  @override
  List<HourlyStats> get hourlyStats;
  @override
  List<DailyStats> get weeklyStats;
  @override
  List<PopularItem> get popularItems;

  /// Create a copy of RestaurantStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantStatsImplCopyWith<_$RestaurantStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HourlyStats _$HourlyStatsFromJson(Map<String, dynamic> json) {
  return _HourlyStats.fromJson(json);
}

/// @nodoc
mixin _$HourlyStats {
  int get hour => throw _privateConstructorUsedError;
  int get orders => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;

  /// Serializes this HourlyStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HourlyStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HourlyStatsCopyWith<HourlyStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyStatsCopyWith<$Res> {
  factory $HourlyStatsCopyWith(
          HourlyStats value, $Res Function(HourlyStats) then) =
      _$HourlyStatsCopyWithImpl<$Res, HourlyStats>;
  @useResult
  $Res call({int hour, int orders, double revenue});
}

/// @nodoc
class _$HourlyStatsCopyWithImpl<$Res, $Val extends HourlyStats>
    implements $HourlyStatsCopyWith<$Res> {
  _$HourlyStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HourlyStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? orders = null,
    Object? revenue = null,
  }) {
    return _then(_value.copyWith(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HourlyStatsImplCopyWith<$Res>
    implements $HourlyStatsCopyWith<$Res> {
  factory _$$HourlyStatsImplCopyWith(
          _$HourlyStatsImpl value, $Res Function(_$HourlyStatsImpl) then) =
      __$$HourlyStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hour, int orders, double revenue});
}

/// @nodoc
class __$$HourlyStatsImplCopyWithImpl<$Res>
    extends _$HourlyStatsCopyWithImpl<$Res, _$HourlyStatsImpl>
    implements _$$HourlyStatsImplCopyWith<$Res> {
  __$$HourlyStatsImplCopyWithImpl(
      _$HourlyStatsImpl _value, $Res Function(_$HourlyStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of HourlyStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? orders = null,
    Object? revenue = null,
  }) {
    return _then(_$HourlyStatsImpl(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HourlyStatsImpl implements _HourlyStats {
  const _$HourlyStatsImpl(
      {required this.hour, required this.orders, required this.revenue});

  factory _$HourlyStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$HourlyStatsImplFromJson(json);

  @override
  final int hour;
  @override
  final int orders;
  @override
  final double revenue;

  @override
  String toString() {
    return 'HourlyStats(hour: $hour, orders: $orders, revenue: $revenue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyStatsImpl &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.orders, orders) || other.orders == orders) &&
            (identical(other.revenue, revenue) || other.revenue == revenue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hour, orders, revenue);

  /// Create a copy of HourlyStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlyStatsImplCopyWith<_$HourlyStatsImpl> get copyWith =>
      __$$HourlyStatsImplCopyWithImpl<_$HourlyStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HourlyStatsImplToJson(
      this,
    );
  }
}

abstract class _HourlyStats implements HourlyStats {
  const factory _HourlyStats(
      {required final int hour,
      required final int orders,
      required final double revenue}) = _$HourlyStatsImpl;

  factory _HourlyStats.fromJson(Map<String, dynamic> json) =
      _$HourlyStatsImpl.fromJson;

  @override
  int get hour;
  @override
  int get orders;
  @override
  double get revenue;

  /// Create a copy of HourlyStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HourlyStatsImplCopyWith<_$HourlyStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyStats _$DailyStatsFromJson(Map<String, dynamic> json) {
  return _DailyStats.fromJson(json);
}

/// @nodoc
mixin _$DailyStats {
  DateTime get date => throw _privateConstructorUsedError;
  int get orders => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;

  /// Serializes this DailyStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyStatsCopyWith<DailyStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyStatsCopyWith<$Res> {
  factory $DailyStatsCopyWith(
          DailyStats value, $Res Function(DailyStats) then) =
      _$DailyStatsCopyWithImpl<$Res, DailyStats>;
  @useResult
  $Res call({DateTime date, int orders, double revenue});
}

/// @nodoc
class _$DailyStatsCopyWithImpl<$Res, $Val extends DailyStats>
    implements $DailyStatsCopyWith<$Res> {
  _$DailyStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? orders = null,
    Object? revenue = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyStatsImplCopyWith<$Res>
    implements $DailyStatsCopyWith<$Res> {
  factory _$$DailyStatsImplCopyWith(
          _$DailyStatsImpl value, $Res Function(_$DailyStatsImpl) then) =
      __$$DailyStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, int orders, double revenue});
}

/// @nodoc
class __$$DailyStatsImplCopyWithImpl<$Res>
    extends _$DailyStatsCopyWithImpl<$Res, _$DailyStatsImpl>
    implements _$$DailyStatsImplCopyWith<$Res> {
  __$$DailyStatsImplCopyWithImpl(
      _$DailyStatsImpl _value, $Res Function(_$DailyStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? orders = null,
    Object? revenue = null,
  }) {
    return _then(_$DailyStatsImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyStatsImpl implements _DailyStats {
  const _$DailyStatsImpl(
      {required this.date, required this.orders, required this.revenue});

  factory _$DailyStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyStatsImplFromJson(json);

  @override
  final DateTime date;
  @override
  final int orders;
  @override
  final double revenue;

  @override
  String toString() {
    return 'DailyStats(date: $date, orders: $orders, revenue: $revenue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyStatsImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.orders, orders) || other.orders == orders) &&
            (identical(other.revenue, revenue) || other.revenue == revenue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, orders, revenue);

  /// Create a copy of DailyStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyStatsImplCopyWith<_$DailyStatsImpl> get copyWith =>
      __$$DailyStatsImplCopyWithImpl<_$DailyStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyStatsImplToJson(
      this,
    );
  }
}

abstract class _DailyStats implements DailyStats {
  const factory _DailyStats(
      {required final DateTime date,
      required final int orders,
      required final double revenue}) = _$DailyStatsImpl;

  factory _DailyStats.fromJson(Map<String, dynamic> json) =
      _$DailyStatsImpl.fromJson;

  @override
  DateTime get date;
  @override
  int get orders;
  @override
  double get revenue;

  /// Create a copy of DailyStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyStatsImplCopyWith<_$DailyStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PopularItem _$PopularItemFromJson(Map<String, dynamic> json) {
  return _PopularItem.fromJson(json);
}

/// @nodoc
mixin _$PopularItem {
  String get itemId => throw _privateConstructorUsedError;
  String get itemName => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get orderCount => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;

  /// Serializes this PopularItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PopularItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PopularItemCopyWith<PopularItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularItemCopyWith<$Res> {
  factory $PopularItemCopyWith(
          PopularItem value, $Res Function(PopularItem) then) =
      _$PopularItemCopyWithImpl<$Res, PopularItem>;
  @useResult
  $Res call(
      {String itemId,
      String itemName,
      String imageUrl,
      int orderCount,
      double revenue,
      double rating});
}

/// @nodoc
class _$PopularItemCopyWithImpl<$Res, $Val extends PopularItem>
    implements $PopularItemCopyWith<$Res> {
  _$PopularItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PopularItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? itemName = null,
    Object? imageUrl = null,
    Object? orderCount = null,
    Object? revenue = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PopularItemImplCopyWith<$Res>
    implements $PopularItemCopyWith<$Res> {
  factory _$$PopularItemImplCopyWith(
          _$PopularItemImpl value, $Res Function(_$PopularItemImpl) then) =
      __$$PopularItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String itemId,
      String itemName,
      String imageUrl,
      int orderCount,
      double revenue,
      double rating});
}

/// @nodoc
class __$$PopularItemImplCopyWithImpl<$Res>
    extends _$PopularItemCopyWithImpl<$Res, _$PopularItemImpl>
    implements _$$PopularItemImplCopyWith<$Res> {
  __$$PopularItemImplCopyWithImpl(
      _$PopularItemImpl _value, $Res Function(_$PopularItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of PopularItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? itemName = null,
    Object? imageUrl = null,
    Object? orderCount = null,
    Object? revenue = null,
    Object? rating = null,
  }) {
    return _then(_$PopularItemImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PopularItemImpl implements _PopularItem {
  const _$PopularItemImpl(
      {required this.itemId,
      required this.itemName,
      required this.imageUrl,
      required this.orderCount,
      required this.revenue,
      required this.rating});

  factory _$PopularItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PopularItemImplFromJson(json);

  @override
  final String itemId;
  @override
  final String itemName;
  @override
  final String imageUrl;
  @override
  final int orderCount;
  @override
  final double revenue;
  @override
  final double rating;

  @override
  String toString() {
    return 'PopularItem(itemId: $itemId, itemName: $itemName, imageUrl: $imageUrl, orderCount: $orderCount, revenue: $revenue, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopularItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, itemId, itemName, imageUrl, orderCount, revenue, rating);

  /// Create a copy of PopularItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PopularItemImplCopyWith<_$PopularItemImpl> get copyWith =>
      __$$PopularItemImplCopyWithImpl<_$PopularItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PopularItemImplToJson(
      this,
    );
  }
}

abstract class _PopularItem implements PopularItem {
  const factory _PopularItem(
      {required final String itemId,
      required final String itemName,
      required final String imageUrl,
      required final int orderCount,
      required final double revenue,
      required final double rating}) = _$PopularItemImpl;

  factory _PopularItem.fromJson(Map<String, dynamic> json) =
      _$PopularItemImpl.fromJson;

  @override
  String get itemId;
  @override
  String get itemName;
  @override
  String get imageUrl;
  @override
  int get orderCount;
  @override
  double get revenue;
  @override
  double get rating;

  /// Create a copy of PopularItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PopularItemImplCopyWith<_$PopularItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
