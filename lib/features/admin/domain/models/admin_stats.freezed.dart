// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdminStats _$AdminStatsFromJson(Map<String, dynamic> json) {
  return _AdminStats.fromJson(json);
}

/// @nodoc
mixin _$AdminStats {
  int get totalUsers => throw _privateConstructorUsedError;
  int get activeUsers => throw _privateConstructorUsedError;
  int get totalRestaurants => throw _privateConstructorUsedError;
  int get activeRestaurants => throw _privateConstructorUsedError;
  int get totalDrivers => throw _privateConstructorUsedError;
  int get activeDrivers => throw _privateConstructorUsedError;
  int get onlineDrivers => throw _privateConstructorUsedError;
  double get totalRevenue => throw _privateConstructorUsedError;
  double get todayRevenue => throw _privateConstructorUsedError;
  double get weekRevenue => throw _privateConstructorUsedError;
  double get monthRevenue => throw _privateConstructorUsedError;
  int get totalOrders => throw _privateConstructorUsedError;
  int get todayOrders => throw _privateConstructorUsedError;
  int get weekOrders => throw _privateConstructorUsedError;
  int get monthOrders => throw _privateConstructorUsedError;
  int get pendingOrders => throw _privateConstructorUsedError;
  int get completedOrders => throw _privateConstructorUsedError;
  int get cancelledOrders => throw _privateConstructorUsedError;
  double get averageOrderValue => throw _privateConstructorUsedError;
  double get averageDeliveryTime => throw _privateConstructorUsedError;
  double get customerSatisfaction => throw _privateConstructorUsedError;
  double get platformCommission => throw _privateConstructorUsedError;
  List<HourlyStats> get hourlyStats => throw _privateConstructorUsedError;
  List<DailyStats> get dailyStats => throw _privateConstructorUsedError;
  List<WeeklyStats> get weeklyStats => throw _privateConstructorUsedError;
  List<MonthlyStats> get monthlyStats => throw _privateConstructorUsedError;
  List<TopRestaurant> get topRestaurants => throw _privateConstructorUsedError;
  List<TopDriver> get topDrivers => throw _privateConstructorUsedError;

  /// Serializes this AdminStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdminStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminStatsCopyWith<AdminStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminStatsCopyWith<$Res> {
  factory $AdminStatsCopyWith(
          AdminStats value, $Res Function(AdminStats) then) =
      _$AdminStatsCopyWithImpl<$Res, AdminStats>;
  @useResult
  $Res call(
      {int totalUsers,
      int activeUsers,
      int totalRestaurants,
      int activeRestaurants,
      int totalDrivers,
      int activeDrivers,
      int onlineDrivers,
      double totalRevenue,
      double todayRevenue,
      double weekRevenue,
      double monthRevenue,
      int totalOrders,
      int todayOrders,
      int weekOrders,
      int monthOrders,
      int pendingOrders,
      int completedOrders,
      int cancelledOrders,
      double averageOrderValue,
      double averageDeliveryTime,
      double customerSatisfaction,
      double platformCommission,
      List<HourlyStats> hourlyStats,
      List<DailyStats> dailyStats,
      List<WeeklyStats> weeklyStats,
      List<MonthlyStats> monthlyStats,
      List<TopRestaurant> topRestaurants,
      List<TopDriver> topDrivers});
}

/// @nodoc
class _$AdminStatsCopyWithImpl<$Res, $Val extends AdminStats>
    implements $AdminStatsCopyWith<$Res> {
  _$AdminStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalUsers = null,
    Object? activeUsers = null,
    Object? totalRestaurants = null,
    Object? activeRestaurants = null,
    Object? totalDrivers = null,
    Object? activeDrivers = null,
    Object? onlineDrivers = null,
    Object? totalRevenue = null,
    Object? todayRevenue = null,
    Object? weekRevenue = null,
    Object? monthRevenue = null,
    Object? totalOrders = null,
    Object? todayOrders = null,
    Object? weekOrders = null,
    Object? monthOrders = null,
    Object? pendingOrders = null,
    Object? completedOrders = null,
    Object? cancelledOrders = null,
    Object? averageOrderValue = null,
    Object? averageDeliveryTime = null,
    Object? customerSatisfaction = null,
    Object? platformCommission = null,
    Object? hourlyStats = null,
    Object? dailyStats = null,
    Object? weeklyStats = null,
    Object? monthlyStats = null,
    Object? topRestaurants = null,
    Object? topDrivers = null,
  }) {
    return _then(_value.copyWith(
      totalUsers: null == totalUsers
          ? _value.totalUsers
          : totalUsers // ignore: cast_nullable_to_non_nullable
              as int,
      activeUsers: null == activeUsers
          ? _value.activeUsers
          : activeUsers // ignore: cast_nullable_to_non_nullable
              as int,
      totalRestaurants: null == totalRestaurants
          ? _value.totalRestaurants
          : totalRestaurants // ignore: cast_nullable_to_non_nullable
              as int,
      activeRestaurants: null == activeRestaurants
          ? _value.activeRestaurants
          : activeRestaurants // ignore: cast_nullable_to_non_nullable
              as int,
      totalDrivers: null == totalDrivers
          ? _value.totalDrivers
          : totalDrivers // ignore: cast_nullable_to_non_nullable
              as int,
      activeDrivers: null == activeDrivers
          ? _value.activeDrivers
          : activeDrivers // ignore: cast_nullable_to_non_nullable
              as int,
      onlineDrivers: null == onlineDrivers
          ? _value.onlineDrivers
          : onlineDrivers // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      todayRevenue: null == todayRevenue
          ? _value.todayRevenue
          : todayRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      weekRevenue: null == weekRevenue
          ? _value.weekRevenue
          : weekRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      monthRevenue: null == monthRevenue
          ? _value.monthRevenue
          : monthRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      todayOrders: null == todayOrders
          ? _value.todayOrders
          : todayOrders // ignore: cast_nullable_to_non_nullable
              as int,
      weekOrders: null == weekOrders
          ? _value.weekOrders
          : weekOrders // ignore: cast_nullable_to_non_nullable
              as int,
      monthOrders: null == monthOrders
          ? _value.monthOrders
          : monthOrders // ignore: cast_nullable_to_non_nullable
              as int,
      pendingOrders: null == pendingOrders
          ? _value.pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completedOrders: null == completedOrders
          ? _value.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledOrders: null == cancelledOrders
          ? _value.cancelledOrders
          : cancelledOrders // ignore: cast_nullable_to_non_nullable
              as int,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      averageDeliveryTime: null == averageDeliveryTime
          ? _value.averageDeliveryTime
          : averageDeliveryTime // ignore: cast_nullable_to_non_nullable
              as double,
      customerSatisfaction: null == customerSatisfaction
          ? _value.customerSatisfaction
          : customerSatisfaction // ignore: cast_nullable_to_non_nullable
              as double,
      platformCommission: null == platformCommission
          ? _value.platformCommission
          : platformCommission // ignore: cast_nullable_to_non_nullable
              as double,
      hourlyStats: null == hourlyStats
          ? _value.hourlyStats
          : hourlyStats // ignore: cast_nullable_to_non_nullable
              as List<HourlyStats>,
      dailyStats: null == dailyStats
          ? _value.dailyStats
          : dailyStats // ignore: cast_nullable_to_non_nullable
              as List<DailyStats>,
      weeklyStats: null == weeklyStats
          ? _value.weeklyStats
          : weeklyStats // ignore: cast_nullable_to_non_nullable
              as List<WeeklyStats>,
      monthlyStats: null == monthlyStats
          ? _value.monthlyStats
          : monthlyStats // ignore: cast_nullable_to_non_nullable
              as List<MonthlyStats>,
      topRestaurants: null == topRestaurants
          ? _value.topRestaurants
          : topRestaurants // ignore: cast_nullable_to_non_nullable
              as List<TopRestaurant>,
      topDrivers: null == topDrivers
          ? _value.topDrivers
          : topDrivers // ignore: cast_nullable_to_non_nullable
              as List<TopDriver>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminStatsImplCopyWith<$Res>
    implements $AdminStatsCopyWith<$Res> {
  factory _$$AdminStatsImplCopyWith(
          _$AdminStatsImpl value, $Res Function(_$AdminStatsImpl) then) =
      __$$AdminStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalUsers,
      int activeUsers,
      int totalRestaurants,
      int activeRestaurants,
      int totalDrivers,
      int activeDrivers,
      int onlineDrivers,
      double totalRevenue,
      double todayRevenue,
      double weekRevenue,
      double monthRevenue,
      int totalOrders,
      int todayOrders,
      int weekOrders,
      int monthOrders,
      int pendingOrders,
      int completedOrders,
      int cancelledOrders,
      double averageOrderValue,
      double averageDeliveryTime,
      double customerSatisfaction,
      double platformCommission,
      List<HourlyStats> hourlyStats,
      List<DailyStats> dailyStats,
      List<WeeklyStats> weeklyStats,
      List<MonthlyStats> monthlyStats,
      List<TopRestaurant> topRestaurants,
      List<TopDriver> topDrivers});
}

/// @nodoc
class __$$AdminStatsImplCopyWithImpl<$Res>
    extends _$AdminStatsCopyWithImpl<$Res, _$AdminStatsImpl>
    implements _$$AdminStatsImplCopyWith<$Res> {
  __$$AdminStatsImplCopyWithImpl(
      _$AdminStatsImpl _value, $Res Function(_$AdminStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalUsers = null,
    Object? activeUsers = null,
    Object? totalRestaurants = null,
    Object? activeRestaurants = null,
    Object? totalDrivers = null,
    Object? activeDrivers = null,
    Object? onlineDrivers = null,
    Object? totalRevenue = null,
    Object? todayRevenue = null,
    Object? weekRevenue = null,
    Object? monthRevenue = null,
    Object? totalOrders = null,
    Object? todayOrders = null,
    Object? weekOrders = null,
    Object? monthOrders = null,
    Object? pendingOrders = null,
    Object? completedOrders = null,
    Object? cancelledOrders = null,
    Object? averageOrderValue = null,
    Object? averageDeliveryTime = null,
    Object? customerSatisfaction = null,
    Object? platformCommission = null,
    Object? hourlyStats = null,
    Object? dailyStats = null,
    Object? weeklyStats = null,
    Object? monthlyStats = null,
    Object? topRestaurants = null,
    Object? topDrivers = null,
  }) {
    return _then(_$AdminStatsImpl(
      totalUsers: null == totalUsers
          ? _value.totalUsers
          : totalUsers // ignore: cast_nullable_to_non_nullable
              as int,
      activeUsers: null == activeUsers
          ? _value.activeUsers
          : activeUsers // ignore: cast_nullable_to_non_nullable
              as int,
      totalRestaurants: null == totalRestaurants
          ? _value.totalRestaurants
          : totalRestaurants // ignore: cast_nullable_to_non_nullable
              as int,
      activeRestaurants: null == activeRestaurants
          ? _value.activeRestaurants
          : activeRestaurants // ignore: cast_nullable_to_non_nullable
              as int,
      totalDrivers: null == totalDrivers
          ? _value.totalDrivers
          : totalDrivers // ignore: cast_nullable_to_non_nullable
              as int,
      activeDrivers: null == activeDrivers
          ? _value.activeDrivers
          : activeDrivers // ignore: cast_nullable_to_non_nullable
              as int,
      onlineDrivers: null == onlineDrivers
          ? _value.onlineDrivers
          : onlineDrivers // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      todayRevenue: null == todayRevenue
          ? _value.todayRevenue
          : todayRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      weekRevenue: null == weekRevenue
          ? _value.weekRevenue
          : weekRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      monthRevenue: null == monthRevenue
          ? _value.monthRevenue
          : monthRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      todayOrders: null == todayOrders
          ? _value.todayOrders
          : todayOrders // ignore: cast_nullable_to_non_nullable
              as int,
      weekOrders: null == weekOrders
          ? _value.weekOrders
          : weekOrders // ignore: cast_nullable_to_non_nullable
              as int,
      monthOrders: null == monthOrders
          ? _value.monthOrders
          : monthOrders // ignore: cast_nullable_to_non_nullable
              as int,
      pendingOrders: null == pendingOrders
          ? _value.pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completedOrders: null == completedOrders
          ? _value.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledOrders: null == cancelledOrders
          ? _value.cancelledOrders
          : cancelledOrders // ignore: cast_nullable_to_non_nullable
              as int,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      averageDeliveryTime: null == averageDeliveryTime
          ? _value.averageDeliveryTime
          : averageDeliveryTime // ignore: cast_nullable_to_non_nullable
              as double,
      customerSatisfaction: null == customerSatisfaction
          ? _value.customerSatisfaction
          : customerSatisfaction // ignore: cast_nullable_to_non_nullable
              as double,
      platformCommission: null == platformCommission
          ? _value.platformCommission
          : platformCommission // ignore: cast_nullable_to_non_nullable
              as double,
      hourlyStats: null == hourlyStats
          ? _value._hourlyStats
          : hourlyStats // ignore: cast_nullable_to_non_nullable
              as List<HourlyStats>,
      dailyStats: null == dailyStats
          ? _value._dailyStats
          : dailyStats // ignore: cast_nullable_to_non_nullable
              as List<DailyStats>,
      weeklyStats: null == weeklyStats
          ? _value._weeklyStats
          : weeklyStats // ignore: cast_nullable_to_non_nullable
              as List<WeeklyStats>,
      monthlyStats: null == monthlyStats
          ? _value._monthlyStats
          : monthlyStats // ignore: cast_nullable_to_non_nullable
              as List<MonthlyStats>,
      topRestaurants: null == topRestaurants
          ? _value._topRestaurants
          : topRestaurants // ignore: cast_nullable_to_non_nullable
              as List<TopRestaurant>,
      topDrivers: null == topDrivers
          ? _value._topDrivers
          : topDrivers // ignore: cast_nullable_to_non_nullable
              as List<TopDriver>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminStatsImpl implements _AdminStats {
  const _$AdminStatsImpl(
      {required this.totalUsers,
      required this.activeUsers,
      required this.totalRestaurants,
      required this.activeRestaurants,
      required this.totalDrivers,
      required this.activeDrivers,
      required this.onlineDrivers,
      required this.totalRevenue,
      required this.todayRevenue,
      required this.weekRevenue,
      required this.monthRevenue,
      required this.totalOrders,
      required this.todayOrders,
      required this.weekOrders,
      required this.monthOrders,
      required this.pendingOrders,
      required this.completedOrders,
      required this.cancelledOrders,
      required this.averageOrderValue,
      required this.averageDeliveryTime,
      required this.customerSatisfaction,
      required this.platformCommission,
      final List<HourlyStats> hourlyStats = const [],
      final List<DailyStats> dailyStats = const [],
      final List<WeeklyStats> weeklyStats = const [],
      final List<MonthlyStats> monthlyStats = const [],
      final List<TopRestaurant> topRestaurants = const [],
      final List<TopDriver> topDrivers = const []})
      : _hourlyStats = hourlyStats,
        _dailyStats = dailyStats,
        _weeklyStats = weeklyStats,
        _monthlyStats = monthlyStats,
        _topRestaurants = topRestaurants,
        _topDrivers = topDrivers;

  factory _$AdminStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminStatsImplFromJson(json);

  @override
  final int totalUsers;
  @override
  final int activeUsers;
  @override
  final int totalRestaurants;
  @override
  final int activeRestaurants;
  @override
  final int totalDrivers;
  @override
  final int activeDrivers;
  @override
  final int onlineDrivers;
  @override
  final double totalRevenue;
  @override
  final double todayRevenue;
  @override
  final double weekRevenue;
  @override
  final double monthRevenue;
  @override
  final int totalOrders;
  @override
  final int todayOrders;
  @override
  final int weekOrders;
  @override
  final int monthOrders;
  @override
  final int pendingOrders;
  @override
  final int completedOrders;
  @override
  final int cancelledOrders;
  @override
  final double averageOrderValue;
  @override
  final double averageDeliveryTime;
  @override
  final double customerSatisfaction;
  @override
  final double platformCommission;
  final List<HourlyStats> _hourlyStats;
  @override
  @JsonKey()
  List<HourlyStats> get hourlyStats {
    if (_hourlyStats is EqualUnmodifiableListView) return _hourlyStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyStats);
  }

  final List<DailyStats> _dailyStats;
  @override
  @JsonKey()
  List<DailyStats> get dailyStats {
    if (_dailyStats is EqualUnmodifiableListView) return _dailyStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyStats);
  }

  final List<WeeklyStats> _weeklyStats;
  @override
  @JsonKey()
  List<WeeklyStats> get weeklyStats {
    if (_weeklyStats is EqualUnmodifiableListView) return _weeklyStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyStats);
  }

  final List<MonthlyStats> _monthlyStats;
  @override
  @JsonKey()
  List<MonthlyStats> get monthlyStats {
    if (_monthlyStats is EqualUnmodifiableListView) return _monthlyStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthlyStats);
  }

  final List<TopRestaurant> _topRestaurants;
  @override
  @JsonKey()
  List<TopRestaurant> get topRestaurants {
    if (_topRestaurants is EqualUnmodifiableListView) return _topRestaurants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topRestaurants);
  }

  final List<TopDriver> _topDrivers;
  @override
  @JsonKey()
  List<TopDriver> get topDrivers {
    if (_topDrivers is EqualUnmodifiableListView) return _topDrivers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topDrivers);
  }

  @override
  String toString() {
    return 'AdminStats(totalUsers: $totalUsers, activeUsers: $activeUsers, totalRestaurants: $totalRestaurants, activeRestaurants: $activeRestaurants, totalDrivers: $totalDrivers, activeDrivers: $activeDrivers, onlineDrivers: $onlineDrivers, totalRevenue: $totalRevenue, todayRevenue: $todayRevenue, weekRevenue: $weekRevenue, monthRevenue: $monthRevenue, totalOrders: $totalOrders, todayOrders: $todayOrders, weekOrders: $weekOrders, monthOrders: $monthOrders, pendingOrders: $pendingOrders, completedOrders: $completedOrders, cancelledOrders: $cancelledOrders, averageOrderValue: $averageOrderValue, averageDeliveryTime: $averageDeliveryTime, customerSatisfaction: $customerSatisfaction, platformCommission: $platformCommission, hourlyStats: $hourlyStats, dailyStats: $dailyStats, weeklyStats: $weeklyStats, monthlyStats: $monthlyStats, topRestaurants: $topRestaurants, topDrivers: $topDrivers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminStatsImpl &&
            (identical(other.totalUsers, totalUsers) ||
                other.totalUsers == totalUsers) &&
            (identical(other.activeUsers, activeUsers) ||
                other.activeUsers == activeUsers) &&
            (identical(other.totalRestaurants, totalRestaurants) ||
                other.totalRestaurants == totalRestaurants) &&
            (identical(other.activeRestaurants, activeRestaurants) ||
                other.activeRestaurants == activeRestaurants) &&
            (identical(other.totalDrivers, totalDrivers) ||
                other.totalDrivers == totalDrivers) &&
            (identical(other.activeDrivers, activeDrivers) ||
                other.activeDrivers == activeDrivers) &&
            (identical(other.onlineDrivers, onlineDrivers) ||
                other.onlineDrivers == onlineDrivers) &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.todayRevenue, todayRevenue) ||
                other.todayRevenue == todayRevenue) &&
            (identical(other.weekRevenue, weekRevenue) ||
                other.weekRevenue == weekRevenue) &&
            (identical(other.monthRevenue, monthRevenue) ||
                other.monthRevenue == monthRevenue) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.todayOrders, todayOrders) ||
                other.todayOrders == todayOrders) &&
            (identical(other.weekOrders, weekOrders) ||
                other.weekOrders == weekOrders) &&
            (identical(other.monthOrders, monthOrders) ||
                other.monthOrders == monthOrders) &&
            (identical(other.pendingOrders, pendingOrders) ||
                other.pendingOrders == pendingOrders) &&
            (identical(other.completedOrders, completedOrders) ||
                other.completedOrders == completedOrders) &&
            (identical(other.cancelledOrders, cancelledOrders) ||
                other.cancelledOrders == cancelledOrders) &&
            (identical(other.averageOrderValue, averageOrderValue) ||
                other.averageOrderValue == averageOrderValue) &&
            (identical(other.averageDeliveryTime, averageDeliveryTime) ||
                other.averageDeliveryTime == averageDeliveryTime) &&
            (identical(other.customerSatisfaction, customerSatisfaction) ||
                other.customerSatisfaction == customerSatisfaction) &&
            (identical(other.platformCommission, platformCommission) ||
                other.platformCommission == platformCommission) &&
            const DeepCollectionEquality()
                .equals(other._hourlyStats, _hourlyStats) &&
            const DeepCollectionEquality()
                .equals(other._dailyStats, _dailyStats) &&
            const DeepCollectionEquality()
                .equals(other._weeklyStats, _weeklyStats) &&
            const DeepCollectionEquality()
                .equals(other._monthlyStats, _monthlyStats) &&
            const DeepCollectionEquality()
                .equals(other._topRestaurants, _topRestaurants) &&
            const DeepCollectionEquality()
                .equals(other._topDrivers, _topDrivers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        totalUsers,
        activeUsers,
        totalRestaurants,
        activeRestaurants,
        totalDrivers,
        activeDrivers,
        onlineDrivers,
        totalRevenue,
        todayRevenue,
        weekRevenue,
        monthRevenue,
        totalOrders,
        todayOrders,
        weekOrders,
        monthOrders,
        pendingOrders,
        completedOrders,
        cancelledOrders,
        averageOrderValue,
        averageDeliveryTime,
        customerSatisfaction,
        platformCommission,
        const DeepCollectionEquality().hash(_hourlyStats),
        const DeepCollectionEquality().hash(_dailyStats),
        const DeepCollectionEquality().hash(_weeklyStats),
        const DeepCollectionEquality().hash(_monthlyStats),
        const DeepCollectionEquality().hash(_topRestaurants),
        const DeepCollectionEquality().hash(_topDrivers)
      ]);

  /// Create a copy of AdminStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminStatsImplCopyWith<_$AdminStatsImpl> get copyWith =>
      __$$AdminStatsImplCopyWithImpl<_$AdminStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminStatsImplToJson(
      this,
    );
  }
}

abstract class _AdminStats implements AdminStats {
  const factory _AdminStats(
      {required final int totalUsers,
      required final int activeUsers,
      required final int totalRestaurants,
      required final int activeRestaurants,
      required final int totalDrivers,
      required final int activeDrivers,
      required final int onlineDrivers,
      required final double totalRevenue,
      required final double todayRevenue,
      required final double weekRevenue,
      required final double monthRevenue,
      required final int totalOrders,
      required final int todayOrders,
      required final int weekOrders,
      required final int monthOrders,
      required final int pendingOrders,
      required final int completedOrders,
      required final int cancelledOrders,
      required final double averageOrderValue,
      required final double averageDeliveryTime,
      required final double customerSatisfaction,
      required final double platformCommission,
      final List<HourlyStats> hourlyStats,
      final List<DailyStats> dailyStats,
      final List<WeeklyStats> weeklyStats,
      final List<MonthlyStats> monthlyStats,
      final List<TopRestaurant> topRestaurants,
      final List<TopDriver> topDrivers}) = _$AdminStatsImpl;

  factory _AdminStats.fromJson(Map<String, dynamic> json) =
      _$AdminStatsImpl.fromJson;

  @override
  int get totalUsers;
  @override
  int get activeUsers;
  @override
  int get totalRestaurants;
  @override
  int get activeRestaurants;
  @override
  int get totalDrivers;
  @override
  int get activeDrivers;
  @override
  int get onlineDrivers;
  @override
  double get totalRevenue;
  @override
  double get todayRevenue;
  @override
  double get weekRevenue;
  @override
  double get monthRevenue;
  @override
  int get totalOrders;
  @override
  int get todayOrders;
  @override
  int get weekOrders;
  @override
  int get monthOrders;
  @override
  int get pendingOrders;
  @override
  int get completedOrders;
  @override
  int get cancelledOrders;
  @override
  double get averageOrderValue;
  @override
  double get averageDeliveryTime;
  @override
  double get customerSatisfaction;
  @override
  double get platformCommission;
  @override
  List<HourlyStats> get hourlyStats;
  @override
  List<DailyStats> get dailyStats;
  @override
  List<WeeklyStats> get weeklyStats;
  @override
  List<MonthlyStats> get monthlyStats;
  @override
  List<TopRestaurant> get topRestaurants;
  @override
  List<TopDriver> get topDrivers;

  /// Create a copy of AdminStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminStatsImplCopyWith<_$AdminStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HourlyStats _$HourlyStatsFromJson(Map<String, dynamic> json) {
  return _HourlyStats.fromJson(json);
}

/// @nodoc
mixin _$HourlyStats {
  DateTime get hour => throw _privateConstructorUsedError;
  int get orders => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;
  int get activeDrivers => throw _privateConstructorUsedError;
  int get activeRestaurants => throw _privateConstructorUsedError;

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
  $Res call(
      {DateTime hour,
      int orders,
      double revenue,
      int activeDrivers,
      int activeRestaurants});
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
    Object? activeDrivers = null,
    Object? activeRestaurants = null,
  }) {
    return _then(_value.copyWith(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      activeDrivers: null == activeDrivers
          ? _value.activeDrivers
          : activeDrivers // ignore: cast_nullable_to_non_nullable
              as int,
      activeRestaurants: null == activeRestaurants
          ? _value.activeRestaurants
          : activeRestaurants // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call(
      {DateTime hour,
      int orders,
      double revenue,
      int activeDrivers,
      int activeRestaurants});
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
    Object? activeDrivers = null,
    Object? activeRestaurants = null,
  }) {
    return _then(_$HourlyStatsImpl(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      activeDrivers: null == activeDrivers
          ? _value.activeDrivers
          : activeDrivers // ignore: cast_nullable_to_non_nullable
              as int,
      activeRestaurants: null == activeRestaurants
          ? _value.activeRestaurants
          : activeRestaurants // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HourlyStatsImpl implements _HourlyStats {
  const _$HourlyStatsImpl(
      {required this.hour,
      required this.orders,
      required this.revenue,
      required this.activeDrivers,
      required this.activeRestaurants});

  factory _$HourlyStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$HourlyStatsImplFromJson(json);

  @override
  final DateTime hour;
  @override
  final int orders;
  @override
  final double revenue;
  @override
  final int activeDrivers;
  @override
  final int activeRestaurants;

  @override
  String toString() {
    return 'HourlyStats(hour: $hour, orders: $orders, revenue: $revenue, activeDrivers: $activeDrivers, activeRestaurants: $activeRestaurants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyStatsImpl &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.orders, orders) || other.orders == orders) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.activeDrivers, activeDrivers) ||
                other.activeDrivers == activeDrivers) &&
            (identical(other.activeRestaurants, activeRestaurants) ||
                other.activeRestaurants == activeRestaurants));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, hour, orders, revenue, activeDrivers, activeRestaurants);

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
      {required final DateTime hour,
      required final int orders,
      required final double revenue,
      required final int activeDrivers,
      required final int activeRestaurants}) = _$HourlyStatsImpl;

  factory _HourlyStats.fromJson(Map<String, dynamic> json) =
      _$HourlyStatsImpl.fromJson;

  @override
  DateTime get hour;
  @override
  int get orders;
  @override
  double get revenue;
  @override
  int get activeDrivers;
  @override
  int get activeRestaurants;

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
  int get newUsers => throw _privateConstructorUsedError;
  int get newRestaurants => throw _privateConstructorUsedError;
  int get newDrivers => throw _privateConstructorUsedError;
  double get averageOrderValue => throw _privateConstructorUsedError;
  double get customerSatisfaction => throw _privateConstructorUsedError;

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
  $Res call(
      {DateTime date,
      int orders,
      double revenue,
      int newUsers,
      int newRestaurants,
      int newDrivers,
      double averageOrderValue,
      double customerSatisfaction});
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
    Object? newUsers = null,
    Object? newRestaurants = null,
    Object? newDrivers = null,
    Object? averageOrderValue = null,
    Object? customerSatisfaction = null,
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
      newUsers: null == newUsers
          ? _value.newUsers
          : newUsers // ignore: cast_nullable_to_non_nullable
              as int,
      newRestaurants: null == newRestaurants
          ? _value.newRestaurants
          : newRestaurants // ignore: cast_nullable_to_non_nullable
              as int,
      newDrivers: null == newDrivers
          ? _value.newDrivers
          : newDrivers // ignore: cast_nullable_to_non_nullable
              as int,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      customerSatisfaction: null == customerSatisfaction
          ? _value.customerSatisfaction
          : customerSatisfaction // ignore: cast_nullable_to_non_nullable
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
  $Res call(
      {DateTime date,
      int orders,
      double revenue,
      int newUsers,
      int newRestaurants,
      int newDrivers,
      double averageOrderValue,
      double customerSatisfaction});
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
    Object? newUsers = null,
    Object? newRestaurants = null,
    Object? newDrivers = null,
    Object? averageOrderValue = null,
    Object? customerSatisfaction = null,
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
      newUsers: null == newUsers
          ? _value.newUsers
          : newUsers // ignore: cast_nullable_to_non_nullable
              as int,
      newRestaurants: null == newRestaurants
          ? _value.newRestaurants
          : newRestaurants // ignore: cast_nullable_to_non_nullable
              as int,
      newDrivers: null == newDrivers
          ? _value.newDrivers
          : newDrivers // ignore: cast_nullable_to_non_nullable
              as int,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      customerSatisfaction: null == customerSatisfaction
          ? _value.customerSatisfaction
          : customerSatisfaction // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyStatsImpl implements _DailyStats {
  const _$DailyStatsImpl(
      {required this.date,
      required this.orders,
      required this.revenue,
      required this.newUsers,
      required this.newRestaurants,
      required this.newDrivers,
      required this.averageOrderValue,
      required this.customerSatisfaction});

  factory _$DailyStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyStatsImplFromJson(json);

  @override
  final DateTime date;
  @override
  final int orders;
  @override
  final double revenue;
  @override
  final int newUsers;
  @override
  final int newRestaurants;
  @override
  final int newDrivers;
  @override
  final double averageOrderValue;
  @override
  final double customerSatisfaction;

  @override
  String toString() {
    return 'DailyStats(date: $date, orders: $orders, revenue: $revenue, newUsers: $newUsers, newRestaurants: $newRestaurants, newDrivers: $newDrivers, averageOrderValue: $averageOrderValue, customerSatisfaction: $customerSatisfaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyStatsImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.orders, orders) || other.orders == orders) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.newUsers, newUsers) ||
                other.newUsers == newUsers) &&
            (identical(other.newRestaurants, newRestaurants) ||
                other.newRestaurants == newRestaurants) &&
            (identical(other.newDrivers, newDrivers) ||
                other.newDrivers == newDrivers) &&
            (identical(other.averageOrderValue, averageOrderValue) ||
                other.averageOrderValue == averageOrderValue) &&
            (identical(other.customerSatisfaction, customerSatisfaction) ||
                other.customerSatisfaction == customerSatisfaction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, orders, revenue, newUsers,
      newRestaurants, newDrivers, averageOrderValue, customerSatisfaction);

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
      required final double revenue,
      required final int newUsers,
      required final int newRestaurants,
      required final int newDrivers,
      required final double averageOrderValue,
      required final double customerSatisfaction}) = _$DailyStatsImpl;

  factory _DailyStats.fromJson(Map<String, dynamic> json) =
      _$DailyStatsImpl.fromJson;

  @override
  DateTime get date;
  @override
  int get orders;
  @override
  double get revenue;
  @override
  int get newUsers;
  @override
  int get newRestaurants;
  @override
  int get newDrivers;
  @override
  double get averageOrderValue;
  @override
  double get customerSatisfaction;

  /// Create a copy of DailyStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyStatsImplCopyWith<_$DailyStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklyStats _$WeeklyStatsFromJson(Map<String, dynamic> json) {
  return _WeeklyStats.fromJson(json);
}

/// @nodoc
mixin _$WeeklyStats {
  DateTime get weekStartDate => throw _privateConstructorUsedError;
  int get orders => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;
  int get newUsers => throw _privateConstructorUsedError;
  int get activeUsers => throw _privateConstructorUsedError;
  double get customerRetention => throw _privateConstructorUsedError;
  double get platformGrowth => throw _privateConstructorUsedError;

  /// Serializes this WeeklyStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyStatsCopyWith<WeeklyStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyStatsCopyWith<$Res> {
  factory $WeeklyStatsCopyWith(
          WeeklyStats value, $Res Function(WeeklyStats) then) =
      _$WeeklyStatsCopyWithImpl<$Res, WeeklyStats>;
  @useResult
  $Res call(
      {DateTime weekStartDate,
      int orders,
      double revenue,
      int newUsers,
      int activeUsers,
      double customerRetention,
      double platformGrowth});
}

/// @nodoc
class _$WeeklyStatsCopyWithImpl<$Res, $Val extends WeeklyStats>
    implements $WeeklyStatsCopyWith<$Res> {
  _$WeeklyStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekStartDate = null,
    Object? orders = null,
    Object? revenue = null,
    Object? newUsers = null,
    Object? activeUsers = null,
    Object? customerRetention = null,
    Object? platformGrowth = null,
  }) {
    return _then(_value.copyWith(
      weekStartDate: null == weekStartDate
          ? _value.weekStartDate
          : weekStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      newUsers: null == newUsers
          ? _value.newUsers
          : newUsers // ignore: cast_nullable_to_non_nullable
              as int,
      activeUsers: null == activeUsers
          ? _value.activeUsers
          : activeUsers // ignore: cast_nullable_to_non_nullable
              as int,
      customerRetention: null == customerRetention
          ? _value.customerRetention
          : customerRetention // ignore: cast_nullable_to_non_nullable
              as double,
      platformGrowth: null == platformGrowth
          ? _value.platformGrowth
          : platformGrowth // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyStatsImplCopyWith<$Res>
    implements $WeeklyStatsCopyWith<$Res> {
  factory _$$WeeklyStatsImplCopyWith(
          _$WeeklyStatsImpl value, $Res Function(_$WeeklyStatsImpl) then) =
      __$$WeeklyStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime weekStartDate,
      int orders,
      double revenue,
      int newUsers,
      int activeUsers,
      double customerRetention,
      double platformGrowth});
}

/// @nodoc
class __$$WeeklyStatsImplCopyWithImpl<$Res>
    extends _$WeeklyStatsCopyWithImpl<$Res, _$WeeklyStatsImpl>
    implements _$$WeeklyStatsImplCopyWith<$Res> {
  __$$WeeklyStatsImplCopyWithImpl(
      _$WeeklyStatsImpl _value, $Res Function(_$WeeklyStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeklyStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekStartDate = null,
    Object? orders = null,
    Object? revenue = null,
    Object? newUsers = null,
    Object? activeUsers = null,
    Object? customerRetention = null,
    Object? platformGrowth = null,
  }) {
    return _then(_$WeeklyStatsImpl(
      weekStartDate: null == weekStartDate
          ? _value.weekStartDate
          : weekStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      newUsers: null == newUsers
          ? _value.newUsers
          : newUsers // ignore: cast_nullable_to_non_nullable
              as int,
      activeUsers: null == activeUsers
          ? _value.activeUsers
          : activeUsers // ignore: cast_nullable_to_non_nullable
              as int,
      customerRetention: null == customerRetention
          ? _value.customerRetention
          : customerRetention // ignore: cast_nullable_to_non_nullable
              as double,
      platformGrowth: null == platformGrowth
          ? _value.platformGrowth
          : platformGrowth // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyStatsImpl implements _WeeklyStats {
  const _$WeeklyStatsImpl(
      {required this.weekStartDate,
      required this.orders,
      required this.revenue,
      required this.newUsers,
      required this.activeUsers,
      required this.customerRetention,
      required this.platformGrowth});

  factory _$WeeklyStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyStatsImplFromJson(json);

  @override
  final DateTime weekStartDate;
  @override
  final int orders;
  @override
  final double revenue;
  @override
  final int newUsers;
  @override
  final int activeUsers;
  @override
  final double customerRetention;
  @override
  final double platformGrowth;

  @override
  String toString() {
    return 'WeeklyStats(weekStartDate: $weekStartDate, orders: $orders, revenue: $revenue, newUsers: $newUsers, activeUsers: $activeUsers, customerRetention: $customerRetention, platformGrowth: $platformGrowth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyStatsImpl &&
            (identical(other.weekStartDate, weekStartDate) ||
                other.weekStartDate == weekStartDate) &&
            (identical(other.orders, orders) || other.orders == orders) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.newUsers, newUsers) ||
                other.newUsers == newUsers) &&
            (identical(other.activeUsers, activeUsers) ||
                other.activeUsers == activeUsers) &&
            (identical(other.customerRetention, customerRetention) ||
                other.customerRetention == customerRetention) &&
            (identical(other.platformGrowth, platformGrowth) ||
                other.platformGrowth == platformGrowth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, weekStartDate, orders, revenue,
      newUsers, activeUsers, customerRetention, platformGrowth);

  /// Create a copy of WeeklyStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyStatsImplCopyWith<_$WeeklyStatsImpl> get copyWith =>
      __$$WeeklyStatsImplCopyWithImpl<_$WeeklyStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyStatsImplToJson(
      this,
    );
  }
}

abstract class _WeeklyStats implements WeeklyStats {
  const factory _WeeklyStats(
      {required final DateTime weekStartDate,
      required final int orders,
      required final double revenue,
      required final int newUsers,
      required final int activeUsers,
      required final double customerRetention,
      required final double platformGrowth}) = _$WeeklyStatsImpl;

  factory _WeeklyStats.fromJson(Map<String, dynamic> json) =
      _$WeeklyStatsImpl.fromJson;

  @override
  DateTime get weekStartDate;
  @override
  int get orders;
  @override
  double get revenue;
  @override
  int get newUsers;
  @override
  int get activeUsers;
  @override
  double get customerRetention;
  @override
  double get platformGrowth;

  /// Create a copy of WeeklyStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyStatsImplCopyWith<_$WeeklyStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlyStats _$MonthlyStatsFromJson(Map<String, dynamic> json) {
  return _MonthlyStats.fromJson(json);
}

/// @nodoc
mixin _$MonthlyStats {
  DateTime get month => throw _privateConstructorUsedError;
  int get orders => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;
  int get newUsers => throw _privateConstructorUsedError;
  int get churnedUsers => throw _privateConstructorUsedError;
  double get monthlyRecurringRevenue => throw _privateConstructorUsedError;
  double get customerLifetimeValue => throw _privateConstructorUsedError;

  /// Serializes this MonthlyStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyStatsCopyWith<MonthlyStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyStatsCopyWith<$Res> {
  factory $MonthlyStatsCopyWith(
          MonthlyStats value, $Res Function(MonthlyStats) then) =
      _$MonthlyStatsCopyWithImpl<$Res, MonthlyStats>;
  @useResult
  $Res call(
      {DateTime month,
      int orders,
      double revenue,
      int newUsers,
      int churnedUsers,
      double monthlyRecurringRevenue,
      double customerLifetimeValue});
}

/// @nodoc
class _$MonthlyStatsCopyWithImpl<$Res, $Val extends MonthlyStats>
    implements $MonthlyStatsCopyWith<$Res> {
  _$MonthlyStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? orders = null,
    Object? revenue = null,
    Object? newUsers = null,
    Object? churnedUsers = null,
    Object? monthlyRecurringRevenue = null,
    Object? customerLifetimeValue = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      newUsers: null == newUsers
          ? _value.newUsers
          : newUsers // ignore: cast_nullable_to_non_nullable
              as int,
      churnedUsers: null == churnedUsers
          ? _value.churnedUsers
          : churnedUsers // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyRecurringRevenue: null == monthlyRecurringRevenue
          ? _value.monthlyRecurringRevenue
          : monthlyRecurringRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      customerLifetimeValue: null == customerLifetimeValue
          ? _value.customerLifetimeValue
          : customerLifetimeValue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlyStatsImplCopyWith<$Res>
    implements $MonthlyStatsCopyWith<$Res> {
  factory _$$MonthlyStatsImplCopyWith(
          _$MonthlyStatsImpl value, $Res Function(_$MonthlyStatsImpl) then) =
      __$$MonthlyStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime month,
      int orders,
      double revenue,
      int newUsers,
      int churnedUsers,
      double monthlyRecurringRevenue,
      double customerLifetimeValue});
}

/// @nodoc
class __$$MonthlyStatsImplCopyWithImpl<$Res>
    extends _$MonthlyStatsCopyWithImpl<$Res, _$MonthlyStatsImpl>
    implements _$$MonthlyStatsImplCopyWith<$Res> {
  __$$MonthlyStatsImplCopyWithImpl(
      _$MonthlyStatsImpl _value, $Res Function(_$MonthlyStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlyStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? orders = null,
    Object? revenue = null,
    Object? newUsers = null,
    Object? churnedUsers = null,
    Object? monthlyRecurringRevenue = null,
    Object? customerLifetimeValue = null,
  }) {
    return _then(_$MonthlyStatsImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      newUsers: null == newUsers
          ? _value.newUsers
          : newUsers // ignore: cast_nullable_to_non_nullable
              as int,
      churnedUsers: null == churnedUsers
          ? _value.churnedUsers
          : churnedUsers // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyRecurringRevenue: null == monthlyRecurringRevenue
          ? _value.monthlyRecurringRevenue
          : monthlyRecurringRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      customerLifetimeValue: null == customerLifetimeValue
          ? _value.customerLifetimeValue
          : customerLifetimeValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyStatsImpl implements _MonthlyStats {
  const _$MonthlyStatsImpl(
      {required this.month,
      required this.orders,
      required this.revenue,
      required this.newUsers,
      required this.churnedUsers,
      required this.monthlyRecurringRevenue,
      required this.customerLifetimeValue});

  factory _$MonthlyStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyStatsImplFromJson(json);

  @override
  final DateTime month;
  @override
  final int orders;
  @override
  final double revenue;
  @override
  final int newUsers;
  @override
  final int churnedUsers;
  @override
  final double monthlyRecurringRevenue;
  @override
  final double customerLifetimeValue;

  @override
  String toString() {
    return 'MonthlyStats(month: $month, orders: $orders, revenue: $revenue, newUsers: $newUsers, churnedUsers: $churnedUsers, monthlyRecurringRevenue: $monthlyRecurringRevenue, customerLifetimeValue: $customerLifetimeValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyStatsImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.orders, orders) || other.orders == orders) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.newUsers, newUsers) ||
                other.newUsers == newUsers) &&
            (identical(other.churnedUsers, churnedUsers) ||
                other.churnedUsers == churnedUsers) &&
            (identical(
                    other.monthlyRecurringRevenue, monthlyRecurringRevenue) ||
                other.monthlyRecurringRevenue == monthlyRecurringRevenue) &&
            (identical(other.customerLifetimeValue, customerLifetimeValue) ||
                other.customerLifetimeValue == customerLifetimeValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, month, orders, revenue, newUsers,
      churnedUsers, monthlyRecurringRevenue, customerLifetimeValue);

  /// Create a copy of MonthlyStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyStatsImplCopyWith<_$MonthlyStatsImpl> get copyWith =>
      __$$MonthlyStatsImplCopyWithImpl<_$MonthlyStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyStatsImplToJson(
      this,
    );
  }
}

abstract class _MonthlyStats implements MonthlyStats {
  const factory _MonthlyStats(
      {required final DateTime month,
      required final int orders,
      required final double revenue,
      required final int newUsers,
      required final int churnedUsers,
      required final double monthlyRecurringRevenue,
      required final double customerLifetimeValue}) = _$MonthlyStatsImpl;

  factory _MonthlyStats.fromJson(Map<String, dynamic> json) =
      _$MonthlyStatsImpl.fromJson;

  @override
  DateTime get month;
  @override
  int get orders;
  @override
  double get revenue;
  @override
  int get newUsers;
  @override
  int get churnedUsers;
  @override
  double get monthlyRecurringRevenue;
  @override
  double get customerLifetimeValue;

  /// Create a copy of MonthlyStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyStatsImplCopyWith<_$MonthlyStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TopRestaurant _$TopRestaurantFromJson(Map<String, dynamic> json) {
  return _TopRestaurant.fromJson(json);
}

/// @nodoc
mixin _$TopRestaurant {
  String get restaurantId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get totalOrders => throw _privateConstructorUsedError;
  double get totalRevenue => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;
  double get averageOrderValue => throw _privateConstructorUsedError;
  int get completedOrders => throw _privateConstructorUsedError;
  double get completionRate => throw _privateConstructorUsedError;

  /// Serializes this TopRestaurant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopRestaurantCopyWith<TopRestaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopRestaurantCopyWith<$Res> {
  factory $TopRestaurantCopyWith(
          TopRestaurant value, $Res Function(TopRestaurant) then) =
      _$TopRestaurantCopyWithImpl<$Res, TopRestaurant>;
  @useResult
  $Res call(
      {String restaurantId,
      String name,
      String imageUrl,
      int totalOrders,
      double totalRevenue,
      double averageRating,
      double averageOrderValue,
      int completedOrders,
      double completionRate});
}

/// @nodoc
class _$TopRestaurantCopyWithImpl<$Res, $Val extends TopRestaurant>
    implements $TopRestaurantCopyWith<$Res> {
  _$TopRestaurantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantId = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? totalOrders = null,
    Object? totalRevenue = null,
    Object? averageRating = null,
    Object? averageOrderValue = null,
    Object? completedOrders = null,
    Object? completionRate = null,
  }) {
    return _then(_value.copyWith(
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
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
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      completedOrders: null == completedOrders
          ? _value.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopRestaurantImplCopyWith<$Res>
    implements $TopRestaurantCopyWith<$Res> {
  factory _$$TopRestaurantImplCopyWith(
          _$TopRestaurantImpl value, $Res Function(_$TopRestaurantImpl) then) =
      __$$TopRestaurantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String restaurantId,
      String name,
      String imageUrl,
      int totalOrders,
      double totalRevenue,
      double averageRating,
      double averageOrderValue,
      int completedOrders,
      double completionRate});
}

/// @nodoc
class __$$TopRestaurantImplCopyWithImpl<$Res>
    extends _$TopRestaurantCopyWithImpl<$Res, _$TopRestaurantImpl>
    implements _$$TopRestaurantImplCopyWith<$Res> {
  __$$TopRestaurantImplCopyWithImpl(
      _$TopRestaurantImpl _value, $Res Function(_$TopRestaurantImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantId = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? totalOrders = null,
    Object? totalRevenue = null,
    Object? averageRating = null,
    Object? averageOrderValue = null,
    Object? completedOrders = null,
    Object? completionRate = null,
  }) {
    return _then(_$TopRestaurantImpl(
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
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
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      completedOrders: null == completedOrders
          ? _value.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopRestaurantImpl implements _TopRestaurant {
  const _$TopRestaurantImpl(
      {required this.restaurantId,
      required this.name,
      required this.imageUrl,
      required this.totalOrders,
      required this.totalRevenue,
      required this.averageRating,
      required this.averageOrderValue,
      required this.completedOrders,
      required this.completionRate});

  factory _$TopRestaurantImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopRestaurantImplFromJson(json);

  @override
  final String restaurantId;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final int totalOrders;
  @override
  final double totalRevenue;
  @override
  final double averageRating;
  @override
  final double averageOrderValue;
  @override
  final int completedOrders;
  @override
  final double completionRate;

  @override
  String toString() {
    return 'TopRestaurant(restaurantId: $restaurantId, name: $name, imageUrl: $imageUrl, totalOrders: $totalOrders, totalRevenue: $totalRevenue, averageRating: $averageRating, averageOrderValue: $averageOrderValue, completedOrders: $completedOrders, completionRate: $completionRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopRestaurantImpl &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.averageOrderValue, averageOrderValue) ||
                other.averageOrderValue == averageOrderValue) &&
            (identical(other.completedOrders, completedOrders) ||
                other.completedOrders == completedOrders) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      restaurantId,
      name,
      imageUrl,
      totalOrders,
      totalRevenue,
      averageRating,
      averageOrderValue,
      completedOrders,
      completionRate);

  /// Create a copy of TopRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopRestaurantImplCopyWith<_$TopRestaurantImpl> get copyWith =>
      __$$TopRestaurantImplCopyWithImpl<_$TopRestaurantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopRestaurantImplToJson(
      this,
    );
  }
}

abstract class _TopRestaurant implements TopRestaurant {
  const factory _TopRestaurant(
      {required final String restaurantId,
      required final String name,
      required final String imageUrl,
      required final int totalOrders,
      required final double totalRevenue,
      required final double averageRating,
      required final double averageOrderValue,
      required final int completedOrders,
      required final double completionRate}) = _$TopRestaurantImpl;

  factory _TopRestaurant.fromJson(Map<String, dynamic> json) =
      _$TopRestaurantImpl.fromJson;

  @override
  String get restaurantId;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  int get totalOrders;
  @override
  double get totalRevenue;
  @override
  double get averageRating;
  @override
  double get averageOrderValue;
  @override
  int get completedOrders;
  @override
  double get completionRate;

  /// Create a copy of TopRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopRestaurantImplCopyWith<_$TopRestaurantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TopDriver _$TopDriverFromJson(Map<String, dynamic> json) {
  return _TopDriver.fromJson(json);
}

/// @nodoc
mixin _$TopDriver {
  String get driverId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get profileImageUrl => throw _privateConstructorUsedError;
  int get totalDeliveries => throw _privateConstructorUsedError;
  double get totalEarnings => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;
  double get completionRate => throw _privateConstructorUsedError;
  int get onlineHours => throw _privateConstructorUsedError;
  double get averageDeliveryTime => throw _privateConstructorUsedError;

  /// Serializes this TopDriver to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopDriver
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopDriverCopyWith<TopDriver> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopDriverCopyWith<$Res> {
  factory $TopDriverCopyWith(TopDriver value, $Res Function(TopDriver) then) =
      _$TopDriverCopyWithImpl<$Res, TopDriver>;
  @useResult
  $Res call(
      {String driverId,
      String name,
      String profileImageUrl,
      int totalDeliveries,
      double totalEarnings,
      double averageRating,
      double completionRate,
      int onlineHours,
      double averageDeliveryTime});
}

/// @nodoc
class _$TopDriverCopyWithImpl<$Res, $Val extends TopDriver>
    implements $TopDriverCopyWith<$Res> {
  _$TopDriverCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopDriver
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverId = null,
    Object? name = null,
    Object? profileImageUrl = null,
    Object? totalDeliveries = null,
    Object? totalEarnings = null,
    Object? averageRating = null,
    Object? completionRate = null,
    Object? onlineHours = null,
    Object? averageDeliveryTime = null,
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
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
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
      averageDeliveryTime: null == averageDeliveryTime
          ? _value.averageDeliveryTime
          : averageDeliveryTime // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopDriverImplCopyWith<$Res>
    implements $TopDriverCopyWith<$Res> {
  factory _$$TopDriverImplCopyWith(
          _$TopDriverImpl value, $Res Function(_$TopDriverImpl) then) =
      __$$TopDriverImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String driverId,
      String name,
      String profileImageUrl,
      int totalDeliveries,
      double totalEarnings,
      double averageRating,
      double completionRate,
      int onlineHours,
      double averageDeliveryTime});
}

/// @nodoc
class __$$TopDriverImplCopyWithImpl<$Res>
    extends _$TopDriverCopyWithImpl<$Res, _$TopDriverImpl>
    implements _$$TopDriverImplCopyWith<$Res> {
  __$$TopDriverImplCopyWithImpl(
      _$TopDriverImpl _value, $Res Function(_$TopDriverImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopDriver
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverId = null,
    Object? name = null,
    Object? profileImageUrl = null,
    Object? totalDeliveries = null,
    Object? totalEarnings = null,
    Object? averageRating = null,
    Object? completionRate = null,
    Object? onlineHours = null,
    Object? averageDeliveryTime = null,
  }) {
    return _then(_$TopDriverImpl(
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
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
      averageDeliveryTime: null == averageDeliveryTime
          ? _value.averageDeliveryTime
          : averageDeliveryTime // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopDriverImpl implements _TopDriver {
  const _$TopDriverImpl(
      {required this.driverId,
      required this.name,
      required this.profileImageUrl,
      required this.totalDeliveries,
      required this.totalEarnings,
      required this.averageRating,
      required this.completionRate,
      required this.onlineHours,
      required this.averageDeliveryTime});

  factory _$TopDriverImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopDriverImplFromJson(json);

  @override
  final String driverId;
  @override
  final String name;
  @override
  final String profileImageUrl;
  @override
  final int totalDeliveries;
  @override
  final double totalEarnings;
  @override
  final double averageRating;
  @override
  final double completionRate;
  @override
  final int onlineHours;
  @override
  final double averageDeliveryTime;

  @override
  String toString() {
    return 'TopDriver(driverId: $driverId, name: $name, profileImageUrl: $profileImageUrl, totalDeliveries: $totalDeliveries, totalEarnings: $totalEarnings, averageRating: $averageRating, completionRate: $completionRate, onlineHours: $onlineHours, averageDeliveryTime: $averageDeliveryTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopDriverImpl &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.totalDeliveries, totalDeliveries) ||
                other.totalDeliveries == totalDeliveries) &&
            (identical(other.totalEarnings, totalEarnings) ||
                other.totalEarnings == totalEarnings) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            (identical(other.onlineHours, onlineHours) ||
                other.onlineHours == onlineHours) &&
            (identical(other.averageDeliveryTime, averageDeliveryTime) ||
                other.averageDeliveryTime == averageDeliveryTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      driverId,
      name,
      profileImageUrl,
      totalDeliveries,
      totalEarnings,
      averageRating,
      completionRate,
      onlineHours,
      averageDeliveryTime);

  /// Create a copy of TopDriver
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopDriverImplCopyWith<_$TopDriverImpl> get copyWith =>
      __$$TopDriverImplCopyWithImpl<_$TopDriverImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopDriverImplToJson(
      this,
    );
  }
}

abstract class _TopDriver implements TopDriver {
  const factory _TopDriver(
      {required final String driverId,
      required final String name,
      required final String profileImageUrl,
      required final int totalDeliveries,
      required final double totalEarnings,
      required final double averageRating,
      required final double completionRate,
      required final int onlineHours,
      required final double averageDeliveryTime}) = _$TopDriverImpl;

  factory _TopDriver.fromJson(Map<String, dynamic> json) =
      _$TopDriverImpl.fromJson;

  @override
  String get driverId;
  @override
  String get name;
  @override
  String get profileImageUrl;
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
  @override
  double get averageDeliveryTime;

  /// Create a copy of TopDriver
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopDriverImplCopyWith<_$TopDriverImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlatformMetrics _$PlatformMetricsFromJson(Map<String, dynamic> json) {
  return _PlatformMetrics.fromJson(json);
}

/// @nodoc
mixin _$PlatformMetrics {
  double get orderFulfillmentRate => throw _privateConstructorUsedError;
  double get averageDeliveryTime => throw _privateConstructorUsedError;
  double get customerSatisfactionScore => throw _privateConstructorUsedError;
  double get driverUtilizationRate => throw _privateConstructorUsedError;
  double get restaurantActiveRate => throw _privateConstructorUsedError;
  double get peakHourEfficiency => throw _privateConstructorUsedError;
  int get supportTicketsOpen => throw _privateConstructorUsedError;
  int get supportTicketsResolved => throw _privateConstructorUsedError;
  double get systemUptime => throw _privateConstructorUsedError;
  double get apiResponseTime => throw _privateConstructorUsedError;

  /// Serializes this PlatformMetrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlatformMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlatformMetricsCopyWith<PlatformMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformMetricsCopyWith<$Res> {
  factory $PlatformMetricsCopyWith(
          PlatformMetrics value, $Res Function(PlatformMetrics) then) =
      _$PlatformMetricsCopyWithImpl<$Res, PlatformMetrics>;
  @useResult
  $Res call(
      {double orderFulfillmentRate,
      double averageDeliveryTime,
      double customerSatisfactionScore,
      double driverUtilizationRate,
      double restaurantActiveRate,
      double peakHourEfficiency,
      int supportTicketsOpen,
      int supportTicketsResolved,
      double systemUptime,
      double apiResponseTime});
}

/// @nodoc
class _$PlatformMetricsCopyWithImpl<$Res, $Val extends PlatformMetrics>
    implements $PlatformMetricsCopyWith<$Res> {
  _$PlatformMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlatformMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderFulfillmentRate = null,
    Object? averageDeliveryTime = null,
    Object? customerSatisfactionScore = null,
    Object? driverUtilizationRate = null,
    Object? restaurantActiveRate = null,
    Object? peakHourEfficiency = null,
    Object? supportTicketsOpen = null,
    Object? supportTicketsResolved = null,
    Object? systemUptime = null,
    Object? apiResponseTime = null,
  }) {
    return _then(_value.copyWith(
      orderFulfillmentRate: null == orderFulfillmentRate
          ? _value.orderFulfillmentRate
          : orderFulfillmentRate // ignore: cast_nullable_to_non_nullable
              as double,
      averageDeliveryTime: null == averageDeliveryTime
          ? _value.averageDeliveryTime
          : averageDeliveryTime // ignore: cast_nullable_to_non_nullable
              as double,
      customerSatisfactionScore: null == customerSatisfactionScore
          ? _value.customerSatisfactionScore
          : customerSatisfactionScore // ignore: cast_nullable_to_non_nullable
              as double,
      driverUtilizationRate: null == driverUtilizationRate
          ? _value.driverUtilizationRate
          : driverUtilizationRate // ignore: cast_nullable_to_non_nullable
              as double,
      restaurantActiveRate: null == restaurantActiveRate
          ? _value.restaurantActiveRate
          : restaurantActiveRate // ignore: cast_nullable_to_non_nullable
              as double,
      peakHourEfficiency: null == peakHourEfficiency
          ? _value.peakHourEfficiency
          : peakHourEfficiency // ignore: cast_nullable_to_non_nullable
              as double,
      supportTicketsOpen: null == supportTicketsOpen
          ? _value.supportTicketsOpen
          : supportTicketsOpen // ignore: cast_nullable_to_non_nullable
              as int,
      supportTicketsResolved: null == supportTicketsResolved
          ? _value.supportTicketsResolved
          : supportTicketsResolved // ignore: cast_nullable_to_non_nullable
              as int,
      systemUptime: null == systemUptime
          ? _value.systemUptime
          : systemUptime // ignore: cast_nullable_to_non_nullable
              as double,
      apiResponseTime: null == apiResponseTime
          ? _value.apiResponseTime
          : apiResponseTime // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlatformMetricsImplCopyWith<$Res>
    implements $PlatformMetricsCopyWith<$Res> {
  factory _$$PlatformMetricsImplCopyWith(_$PlatformMetricsImpl value,
          $Res Function(_$PlatformMetricsImpl) then) =
      __$$PlatformMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double orderFulfillmentRate,
      double averageDeliveryTime,
      double customerSatisfactionScore,
      double driverUtilizationRate,
      double restaurantActiveRate,
      double peakHourEfficiency,
      int supportTicketsOpen,
      int supportTicketsResolved,
      double systemUptime,
      double apiResponseTime});
}

/// @nodoc
class __$$PlatformMetricsImplCopyWithImpl<$Res>
    extends _$PlatformMetricsCopyWithImpl<$Res, _$PlatformMetricsImpl>
    implements _$$PlatformMetricsImplCopyWith<$Res> {
  __$$PlatformMetricsImplCopyWithImpl(
      _$PlatformMetricsImpl _value, $Res Function(_$PlatformMetricsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlatformMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderFulfillmentRate = null,
    Object? averageDeliveryTime = null,
    Object? customerSatisfactionScore = null,
    Object? driverUtilizationRate = null,
    Object? restaurantActiveRate = null,
    Object? peakHourEfficiency = null,
    Object? supportTicketsOpen = null,
    Object? supportTicketsResolved = null,
    Object? systemUptime = null,
    Object? apiResponseTime = null,
  }) {
    return _then(_$PlatformMetricsImpl(
      orderFulfillmentRate: null == orderFulfillmentRate
          ? _value.orderFulfillmentRate
          : orderFulfillmentRate // ignore: cast_nullable_to_non_nullable
              as double,
      averageDeliveryTime: null == averageDeliveryTime
          ? _value.averageDeliveryTime
          : averageDeliveryTime // ignore: cast_nullable_to_non_nullable
              as double,
      customerSatisfactionScore: null == customerSatisfactionScore
          ? _value.customerSatisfactionScore
          : customerSatisfactionScore // ignore: cast_nullable_to_non_nullable
              as double,
      driverUtilizationRate: null == driverUtilizationRate
          ? _value.driverUtilizationRate
          : driverUtilizationRate // ignore: cast_nullable_to_non_nullable
              as double,
      restaurantActiveRate: null == restaurantActiveRate
          ? _value.restaurantActiveRate
          : restaurantActiveRate // ignore: cast_nullable_to_non_nullable
              as double,
      peakHourEfficiency: null == peakHourEfficiency
          ? _value.peakHourEfficiency
          : peakHourEfficiency // ignore: cast_nullable_to_non_nullable
              as double,
      supportTicketsOpen: null == supportTicketsOpen
          ? _value.supportTicketsOpen
          : supportTicketsOpen // ignore: cast_nullable_to_non_nullable
              as int,
      supportTicketsResolved: null == supportTicketsResolved
          ? _value.supportTicketsResolved
          : supportTicketsResolved // ignore: cast_nullable_to_non_nullable
              as int,
      systemUptime: null == systemUptime
          ? _value.systemUptime
          : systemUptime // ignore: cast_nullable_to_non_nullable
              as double,
      apiResponseTime: null == apiResponseTime
          ? _value.apiResponseTime
          : apiResponseTime // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlatformMetricsImpl implements _PlatformMetrics {
  const _$PlatformMetricsImpl(
      {required this.orderFulfillmentRate,
      required this.averageDeliveryTime,
      required this.customerSatisfactionScore,
      required this.driverUtilizationRate,
      required this.restaurantActiveRate,
      required this.peakHourEfficiency,
      required this.supportTicketsOpen,
      required this.supportTicketsResolved,
      required this.systemUptime,
      required this.apiResponseTime});

  factory _$PlatformMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlatformMetricsImplFromJson(json);

  @override
  final double orderFulfillmentRate;
  @override
  final double averageDeliveryTime;
  @override
  final double customerSatisfactionScore;
  @override
  final double driverUtilizationRate;
  @override
  final double restaurantActiveRate;
  @override
  final double peakHourEfficiency;
  @override
  final int supportTicketsOpen;
  @override
  final int supportTicketsResolved;
  @override
  final double systemUptime;
  @override
  final double apiResponseTime;

  @override
  String toString() {
    return 'PlatformMetrics(orderFulfillmentRate: $orderFulfillmentRate, averageDeliveryTime: $averageDeliveryTime, customerSatisfactionScore: $customerSatisfactionScore, driverUtilizationRate: $driverUtilizationRate, restaurantActiveRate: $restaurantActiveRate, peakHourEfficiency: $peakHourEfficiency, supportTicketsOpen: $supportTicketsOpen, supportTicketsResolved: $supportTicketsResolved, systemUptime: $systemUptime, apiResponseTime: $apiResponseTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlatformMetricsImpl &&
            (identical(other.orderFulfillmentRate, orderFulfillmentRate) ||
                other.orderFulfillmentRate == orderFulfillmentRate) &&
            (identical(other.averageDeliveryTime, averageDeliveryTime) ||
                other.averageDeliveryTime == averageDeliveryTime) &&
            (identical(other.customerSatisfactionScore,
                    customerSatisfactionScore) ||
                other.customerSatisfactionScore == customerSatisfactionScore) &&
            (identical(other.driverUtilizationRate, driverUtilizationRate) ||
                other.driverUtilizationRate == driverUtilizationRate) &&
            (identical(other.restaurantActiveRate, restaurantActiveRate) ||
                other.restaurantActiveRate == restaurantActiveRate) &&
            (identical(other.peakHourEfficiency, peakHourEfficiency) ||
                other.peakHourEfficiency == peakHourEfficiency) &&
            (identical(other.supportTicketsOpen, supportTicketsOpen) ||
                other.supportTicketsOpen == supportTicketsOpen) &&
            (identical(other.supportTicketsResolved, supportTicketsResolved) ||
                other.supportTicketsResolved == supportTicketsResolved) &&
            (identical(other.systemUptime, systemUptime) ||
                other.systemUptime == systemUptime) &&
            (identical(other.apiResponseTime, apiResponseTime) ||
                other.apiResponseTime == apiResponseTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderFulfillmentRate,
      averageDeliveryTime,
      customerSatisfactionScore,
      driverUtilizationRate,
      restaurantActiveRate,
      peakHourEfficiency,
      supportTicketsOpen,
      supportTicketsResolved,
      systemUptime,
      apiResponseTime);

  /// Create a copy of PlatformMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlatformMetricsImplCopyWith<_$PlatformMetricsImpl> get copyWith =>
      __$$PlatformMetricsImplCopyWithImpl<_$PlatformMetricsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlatformMetricsImplToJson(
      this,
    );
  }
}

abstract class _PlatformMetrics implements PlatformMetrics {
  const factory _PlatformMetrics(
      {required final double orderFulfillmentRate,
      required final double averageDeliveryTime,
      required final double customerSatisfactionScore,
      required final double driverUtilizationRate,
      required final double restaurantActiveRate,
      required final double peakHourEfficiency,
      required final int supportTicketsOpen,
      required final int supportTicketsResolved,
      required final double systemUptime,
      required final double apiResponseTime}) = _$PlatformMetricsImpl;

  factory _PlatformMetrics.fromJson(Map<String, dynamic> json) =
      _$PlatformMetricsImpl.fromJson;

  @override
  double get orderFulfillmentRate;
  @override
  double get averageDeliveryTime;
  @override
  double get customerSatisfactionScore;
  @override
  double get driverUtilizationRate;
  @override
  double get restaurantActiveRate;
  @override
  double get peakHourEfficiency;
  @override
  int get supportTicketsOpen;
  @override
  int get supportTicketsResolved;
  @override
  double get systemUptime;
  @override
  double get apiResponseTime;

  /// Create a copy of PlatformMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlatformMetricsImplCopyWith<_$PlatformMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
