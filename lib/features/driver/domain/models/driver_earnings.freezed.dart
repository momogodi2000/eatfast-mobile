// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_earnings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DriverEarnings _$DriverEarningsFromJson(Map<String, dynamic> json) {
  return _DriverEarnings.fromJson(json);
}

/// @nodoc
mixin _$DriverEarnings {
  String get driverId => throw _privateConstructorUsedError;
  double get totalEarnings => throw _privateConstructorUsedError;
  double get todayEarnings => throw _privateConstructorUsedError;
  double get weekEarnings => throw _privateConstructorUsedError;
  double get monthEarnings => throw _privateConstructorUsedError;
  int get totalDeliveries => throw _privateConstructorUsedError;
  int get todayDeliveries => throw _privateConstructorUsedError;
  int get weekDeliveries => throw _privateConstructorUsedError;
  int get monthDeliveries => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;
  double get completionRate => throw _privateConstructorUsedError;
  int get onlineHours => throw _privateConstructorUsedError;
  double get hourlyRate => throw _privateConstructorUsedError;
  List<EarningTransaction> get recentTransactions =>
      throw _privateConstructorUsedError;
  List<DailyEarning> get dailyBreakdown => throw _privateConstructorUsedError;
  List<WeeklyEarning> get weeklyBreakdown => throw _privateConstructorUsedError;
  EarningsSummary? get currentWeekSummary => throw _privateConstructorUsedError;

  /// Serializes this DriverEarnings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriverEarnings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverEarningsCopyWith<DriverEarnings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverEarningsCopyWith<$Res> {
  factory $DriverEarningsCopyWith(
          DriverEarnings value, $Res Function(DriverEarnings) then) =
      _$DriverEarningsCopyWithImpl<$Res, DriverEarnings>;
  @useResult
  $Res call(
      {String driverId,
      double totalEarnings,
      double todayEarnings,
      double weekEarnings,
      double monthEarnings,
      int totalDeliveries,
      int todayDeliveries,
      int weekDeliveries,
      int monthDeliveries,
      double averageRating,
      double completionRate,
      int onlineHours,
      double hourlyRate,
      List<EarningTransaction> recentTransactions,
      List<DailyEarning> dailyBreakdown,
      List<WeeklyEarning> weeklyBreakdown,
      EarningsSummary? currentWeekSummary});

  $EarningsSummaryCopyWith<$Res>? get currentWeekSummary;
}

/// @nodoc
class _$DriverEarningsCopyWithImpl<$Res, $Val extends DriverEarnings>
    implements $DriverEarningsCopyWith<$Res> {
  _$DriverEarningsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriverEarnings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverId = null,
    Object? totalEarnings = null,
    Object? todayEarnings = null,
    Object? weekEarnings = null,
    Object? monthEarnings = null,
    Object? totalDeliveries = null,
    Object? todayDeliveries = null,
    Object? weekDeliveries = null,
    Object? monthDeliveries = null,
    Object? averageRating = null,
    Object? completionRate = null,
    Object? onlineHours = null,
    Object? hourlyRate = null,
    Object? recentTransactions = null,
    Object? dailyBreakdown = null,
    Object? weeklyBreakdown = null,
    Object? currentWeekSummary = freezed,
  }) {
    return _then(_value.copyWith(
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      totalEarnings: null == totalEarnings
          ? _value.totalEarnings
          : totalEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      todayEarnings: null == todayEarnings
          ? _value.todayEarnings
          : todayEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      weekEarnings: null == weekEarnings
          ? _value.weekEarnings
          : weekEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      monthEarnings: null == monthEarnings
          ? _value.monthEarnings
          : monthEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      totalDeliveries: null == totalDeliveries
          ? _value.totalDeliveries
          : totalDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      todayDeliveries: null == todayDeliveries
          ? _value.todayDeliveries
          : todayDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      weekDeliveries: null == weekDeliveries
          ? _value.weekDeliveries
          : weekDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      monthDeliveries: null == monthDeliveries
          ? _value.monthDeliveries
          : monthDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
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
      hourlyRate: null == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as double,
      recentTransactions: null == recentTransactions
          ? _value.recentTransactions
          : recentTransactions // ignore: cast_nullable_to_non_nullable
              as List<EarningTransaction>,
      dailyBreakdown: null == dailyBreakdown
          ? _value.dailyBreakdown
          : dailyBreakdown // ignore: cast_nullable_to_non_nullable
              as List<DailyEarning>,
      weeklyBreakdown: null == weeklyBreakdown
          ? _value.weeklyBreakdown
          : weeklyBreakdown // ignore: cast_nullable_to_non_nullable
              as List<WeeklyEarning>,
      currentWeekSummary: freezed == currentWeekSummary
          ? _value.currentWeekSummary
          : currentWeekSummary // ignore: cast_nullable_to_non_nullable
              as EarningsSummary?,
    ) as $Val);
  }

  /// Create a copy of DriverEarnings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EarningsSummaryCopyWith<$Res>? get currentWeekSummary {
    if (_value.currentWeekSummary == null) {
      return null;
    }

    return $EarningsSummaryCopyWith<$Res>(_value.currentWeekSummary!, (value) {
      return _then(_value.copyWith(currentWeekSummary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DriverEarningsImplCopyWith<$Res>
    implements $DriverEarningsCopyWith<$Res> {
  factory _$$DriverEarningsImplCopyWith(_$DriverEarningsImpl value,
          $Res Function(_$DriverEarningsImpl) then) =
      __$$DriverEarningsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String driverId,
      double totalEarnings,
      double todayEarnings,
      double weekEarnings,
      double monthEarnings,
      int totalDeliveries,
      int todayDeliveries,
      int weekDeliveries,
      int monthDeliveries,
      double averageRating,
      double completionRate,
      int onlineHours,
      double hourlyRate,
      List<EarningTransaction> recentTransactions,
      List<DailyEarning> dailyBreakdown,
      List<WeeklyEarning> weeklyBreakdown,
      EarningsSummary? currentWeekSummary});

  @override
  $EarningsSummaryCopyWith<$Res>? get currentWeekSummary;
}

/// @nodoc
class __$$DriverEarningsImplCopyWithImpl<$Res>
    extends _$DriverEarningsCopyWithImpl<$Res, _$DriverEarningsImpl>
    implements _$$DriverEarningsImplCopyWith<$Res> {
  __$$DriverEarningsImplCopyWithImpl(
      _$DriverEarningsImpl _value, $Res Function(_$DriverEarningsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DriverEarnings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverId = null,
    Object? totalEarnings = null,
    Object? todayEarnings = null,
    Object? weekEarnings = null,
    Object? monthEarnings = null,
    Object? totalDeliveries = null,
    Object? todayDeliveries = null,
    Object? weekDeliveries = null,
    Object? monthDeliveries = null,
    Object? averageRating = null,
    Object? completionRate = null,
    Object? onlineHours = null,
    Object? hourlyRate = null,
    Object? recentTransactions = null,
    Object? dailyBreakdown = null,
    Object? weeklyBreakdown = null,
    Object? currentWeekSummary = freezed,
  }) {
    return _then(_$DriverEarningsImpl(
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      totalEarnings: null == totalEarnings
          ? _value.totalEarnings
          : totalEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      todayEarnings: null == todayEarnings
          ? _value.todayEarnings
          : todayEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      weekEarnings: null == weekEarnings
          ? _value.weekEarnings
          : weekEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      monthEarnings: null == monthEarnings
          ? _value.monthEarnings
          : monthEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      totalDeliveries: null == totalDeliveries
          ? _value.totalDeliveries
          : totalDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      todayDeliveries: null == todayDeliveries
          ? _value.todayDeliveries
          : todayDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      weekDeliveries: null == weekDeliveries
          ? _value.weekDeliveries
          : weekDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      monthDeliveries: null == monthDeliveries
          ? _value.monthDeliveries
          : monthDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
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
      hourlyRate: null == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as double,
      recentTransactions: null == recentTransactions
          ? _value._recentTransactions
          : recentTransactions // ignore: cast_nullable_to_non_nullable
              as List<EarningTransaction>,
      dailyBreakdown: null == dailyBreakdown
          ? _value._dailyBreakdown
          : dailyBreakdown // ignore: cast_nullable_to_non_nullable
              as List<DailyEarning>,
      weeklyBreakdown: null == weeklyBreakdown
          ? _value._weeklyBreakdown
          : weeklyBreakdown // ignore: cast_nullable_to_non_nullable
              as List<WeeklyEarning>,
      currentWeekSummary: freezed == currentWeekSummary
          ? _value.currentWeekSummary
          : currentWeekSummary // ignore: cast_nullable_to_non_nullable
              as EarningsSummary?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverEarningsImpl implements _DriverEarnings {
  const _$DriverEarningsImpl(
      {required this.driverId,
      required this.totalEarnings,
      required this.todayEarnings,
      required this.weekEarnings,
      required this.monthEarnings,
      required this.totalDeliveries,
      required this.todayDeliveries,
      required this.weekDeliveries,
      required this.monthDeliveries,
      required this.averageRating,
      required this.completionRate,
      required this.onlineHours,
      required this.hourlyRate,
      final List<EarningTransaction> recentTransactions = const [],
      final List<DailyEarning> dailyBreakdown = const [],
      final List<WeeklyEarning> weeklyBreakdown = const [],
      this.currentWeekSummary})
      : _recentTransactions = recentTransactions,
        _dailyBreakdown = dailyBreakdown,
        _weeklyBreakdown = weeklyBreakdown;

  factory _$DriverEarningsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverEarningsImplFromJson(json);

  @override
  final String driverId;
  @override
  final double totalEarnings;
  @override
  final double todayEarnings;
  @override
  final double weekEarnings;
  @override
  final double monthEarnings;
  @override
  final int totalDeliveries;
  @override
  final int todayDeliveries;
  @override
  final int weekDeliveries;
  @override
  final int monthDeliveries;
  @override
  final double averageRating;
  @override
  final double completionRate;
  @override
  final int onlineHours;
  @override
  final double hourlyRate;
  final List<EarningTransaction> _recentTransactions;
  @override
  @JsonKey()
  List<EarningTransaction> get recentTransactions {
    if (_recentTransactions is EqualUnmodifiableListView)
      return _recentTransactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentTransactions);
  }

  final List<DailyEarning> _dailyBreakdown;
  @override
  @JsonKey()
  List<DailyEarning> get dailyBreakdown {
    if (_dailyBreakdown is EqualUnmodifiableListView) return _dailyBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyBreakdown);
  }

  final List<WeeklyEarning> _weeklyBreakdown;
  @override
  @JsonKey()
  List<WeeklyEarning> get weeklyBreakdown {
    if (_weeklyBreakdown is EqualUnmodifiableListView) return _weeklyBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyBreakdown);
  }

  @override
  final EarningsSummary? currentWeekSummary;

  @override
  String toString() {
    return 'DriverEarnings(driverId: $driverId, totalEarnings: $totalEarnings, todayEarnings: $todayEarnings, weekEarnings: $weekEarnings, monthEarnings: $monthEarnings, totalDeliveries: $totalDeliveries, todayDeliveries: $todayDeliveries, weekDeliveries: $weekDeliveries, monthDeliveries: $monthDeliveries, averageRating: $averageRating, completionRate: $completionRate, onlineHours: $onlineHours, hourlyRate: $hourlyRate, recentTransactions: $recentTransactions, dailyBreakdown: $dailyBreakdown, weeklyBreakdown: $weeklyBreakdown, currentWeekSummary: $currentWeekSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverEarningsImpl &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.totalEarnings, totalEarnings) ||
                other.totalEarnings == totalEarnings) &&
            (identical(other.todayEarnings, todayEarnings) ||
                other.todayEarnings == todayEarnings) &&
            (identical(other.weekEarnings, weekEarnings) ||
                other.weekEarnings == weekEarnings) &&
            (identical(other.monthEarnings, monthEarnings) ||
                other.monthEarnings == monthEarnings) &&
            (identical(other.totalDeliveries, totalDeliveries) ||
                other.totalDeliveries == totalDeliveries) &&
            (identical(other.todayDeliveries, todayDeliveries) ||
                other.todayDeliveries == todayDeliveries) &&
            (identical(other.weekDeliveries, weekDeliveries) ||
                other.weekDeliveries == weekDeliveries) &&
            (identical(other.monthDeliveries, monthDeliveries) ||
                other.monthDeliveries == monthDeliveries) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            (identical(other.onlineHours, onlineHours) ||
                other.onlineHours == onlineHours) &&
            (identical(other.hourlyRate, hourlyRate) ||
                other.hourlyRate == hourlyRate) &&
            const DeepCollectionEquality()
                .equals(other._recentTransactions, _recentTransactions) &&
            const DeepCollectionEquality()
                .equals(other._dailyBreakdown, _dailyBreakdown) &&
            const DeepCollectionEquality()
                .equals(other._weeklyBreakdown, _weeklyBreakdown) &&
            (identical(other.currentWeekSummary, currentWeekSummary) ||
                other.currentWeekSummary == currentWeekSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      driverId,
      totalEarnings,
      todayEarnings,
      weekEarnings,
      monthEarnings,
      totalDeliveries,
      todayDeliveries,
      weekDeliveries,
      monthDeliveries,
      averageRating,
      completionRate,
      onlineHours,
      hourlyRate,
      const DeepCollectionEquality().hash(_recentTransactions),
      const DeepCollectionEquality().hash(_dailyBreakdown),
      const DeepCollectionEquality().hash(_weeklyBreakdown),
      currentWeekSummary);

  /// Create a copy of DriverEarnings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverEarningsImplCopyWith<_$DriverEarningsImpl> get copyWith =>
      __$$DriverEarningsImplCopyWithImpl<_$DriverEarningsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverEarningsImplToJson(
      this,
    );
  }
}

abstract class _DriverEarnings implements DriverEarnings {
  const factory _DriverEarnings(
      {required final String driverId,
      required final double totalEarnings,
      required final double todayEarnings,
      required final double weekEarnings,
      required final double monthEarnings,
      required final int totalDeliveries,
      required final int todayDeliveries,
      required final int weekDeliveries,
      required final int monthDeliveries,
      required final double averageRating,
      required final double completionRate,
      required final int onlineHours,
      required final double hourlyRate,
      final List<EarningTransaction> recentTransactions,
      final List<DailyEarning> dailyBreakdown,
      final List<WeeklyEarning> weeklyBreakdown,
      final EarningsSummary? currentWeekSummary}) = _$DriverEarningsImpl;

  factory _DriverEarnings.fromJson(Map<String, dynamic> json) =
      _$DriverEarningsImpl.fromJson;

  @override
  String get driverId;
  @override
  double get totalEarnings;
  @override
  double get todayEarnings;
  @override
  double get weekEarnings;
  @override
  double get monthEarnings;
  @override
  int get totalDeliveries;
  @override
  int get todayDeliveries;
  @override
  int get weekDeliveries;
  @override
  int get monthDeliveries;
  @override
  double get averageRating;
  @override
  double get completionRate;
  @override
  int get onlineHours;
  @override
  double get hourlyRate;
  @override
  List<EarningTransaction> get recentTransactions;
  @override
  List<DailyEarning> get dailyBreakdown;
  @override
  List<WeeklyEarning> get weeklyBreakdown;
  @override
  EarningsSummary? get currentWeekSummary;

  /// Create a copy of DriverEarnings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverEarningsImplCopyWith<_$DriverEarningsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EarningTransaction _$EarningTransactionFromJson(Map<String, dynamic> json) {
  return _EarningTransaction.fromJson(json);
}

/// @nodoc
mixin _$EarningTransaction {
  String get transactionId => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  EarningType get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get restaurantName => throw _privateConstructorUsedError;
  String? get customerName => throw _privateConstructorUsedError;
  double? get tip => throw _privateConstructorUsedError;
  double? get bonus => throw _privateConstructorUsedError;

  /// Serializes this EarningTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EarningTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EarningTransactionCopyWith<EarningTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EarningTransactionCopyWith<$Res> {
  factory $EarningTransactionCopyWith(
          EarningTransaction value, $Res Function(EarningTransaction) then) =
      _$EarningTransactionCopyWithImpl<$Res, EarningTransaction>;
  @useResult
  $Res call(
      {String transactionId,
      String orderId,
      DateTime date,
      double amount,
      EarningType type,
      String description,
      String? restaurantName,
      String? customerName,
      double? tip,
      double? bonus});
}

/// @nodoc
class _$EarningTransactionCopyWithImpl<$Res, $Val extends EarningTransaction>
    implements $EarningTransactionCopyWith<$Res> {
  _$EarningTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EarningTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? orderId = null,
    Object? date = null,
    Object? amount = null,
    Object? type = null,
    Object? description = null,
    Object? restaurantName = freezed,
    Object? customerName = freezed,
    Object? tip = freezed,
    Object? bonus = freezed,
  }) {
    return _then(_value.copyWith(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EarningType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: freezed == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      tip: freezed == tip
          ? _value.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as double?,
      bonus: freezed == bonus
          ? _value.bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EarningTransactionImplCopyWith<$Res>
    implements $EarningTransactionCopyWith<$Res> {
  factory _$$EarningTransactionImplCopyWith(_$EarningTransactionImpl value,
          $Res Function(_$EarningTransactionImpl) then) =
      __$$EarningTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String transactionId,
      String orderId,
      DateTime date,
      double amount,
      EarningType type,
      String description,
      String? restaurantName,
      String? customerName,
      double? tip,
      double? bonus});
}

/// @nodoc
class __$$EarningTransactionImplCopyWithImpl<$Res>
    extends _$EarningTransactionCopyWithImpl<$Res, _$EarningTransactionImpl>
    implements _$$EarningTransactionImplCopyWith<$Res> {
  __$$EarningTransactionImplCopyWithImpl(_$EarningTransactionImpl _value,
      $Res Function(_$EarningTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of EarningTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? orderId = null,
    Object? date = null,
    Object? amount = null,
    Object? type = null,
    Object? description = null,
    Object? restaurantName = freezed,
    Object? customerName = freezed,
    Object? tip = freezed,
    Object? bonus = freezed,
  }) {
    return _then(_$EarningTransactionImpl(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EarningType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: freezed == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      tip: freezed == tip
          ? _value.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as double?,
      bonus: freezed == bonus
          ? _value.bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EarningTransactionImpl implements _EarningTransaction {
  const _$EarningTransactionImpl(
      {required this.transactionId,
      required this.orderId,
      required this.date,
      required this.amount,
      required this.type,
      required this.description,
      this.restaurantName,
      this.customerName,
      this.tip,
      this.bonus});

  factory _$EarningTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$EarningTransactionImplFromJson(json);

  @override
  final String transactionId;
  @override
  final String orderId;
  @override
  final DateTime date;
  @override
  final double amount;
  @override
  final EarningType type;
  @override
  final String description;
  @override
  final String? restaurantName;
  @override
  final String? customerName;
  @override
  final double? tip;
  @override
  final double? bonus;

  @override
  String toString() {
    return 'EarningTransaction(transactionId: $transactionId, orderId: $orderId, date: $date, amount: $amount, type: $type, description: $description, restaurantName: $restaurantName, customerName: $customerName, tip: $tip, bonus: $bonus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EarningTransactionImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.tip, tip) || other.tip == tip) &&
            (identical(other.bonus, bonus) || other.bonus == bonus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, transactionId, orderId, date,
      amount, type, description, restaurantName, customerName, tip, bonus);

  /// Create a copy of EarningTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EarningTransactionImplCopyWith<_$EarningTransactionImpl> get copyWith =>
      __$$EarningTransactionImplCopyWithImpl<_$EarningTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EarningTransactionImplToJson(
      this,
    );
  }
}

abstract class _EarningTransaction implements EarningTransaction {
  const factory _EarningTransaction(
      {required final String transactionId,
      required final String orderId,
      required final DateTime date,
      required final double amount,
      required final EarningType type,
      required final String description,
      final String? restaurantName,
      final String? customerName,
      final double? tip,
      final double? bonus}) = _$EarningTransactionImpl;

  factory _EarningTransaction.fromJson(Map<String, dynamic> json) =
      _$EarningTransactionImpl.fromJson;

  @override
  String get transactionId;
  @override
  String get orderId;
  @override
  DateTime get date;
  @override
  double get amount;
  @override
  EarningType get type;
  @override
  String get description;
  @override
  String? get restaurantName;
  @override
  String? get customerName;
  @override
  double? get tip;
  @override
  double? get bonus;

  /// Create a copy of EarningTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EarningTransactionImplCopyWith<_$EarningTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyEarning _$DailyEarningFromJson(Map<String, dynamic> json) {
  return _DailyEarning.fromJson(json);
}

/// @nodoc
mixin _$DailyEarning {
  DateTime get date => throw _privateConstructorUsedError;
  double get earnings => throw _privateConstructorUsedError;
  int get deliveries => throw _privateConstructorUsedError;
  int get onlineHours => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;

  /// Serializes this DailyEarning to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyEarning
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyEarningCopyWith<DailyEarning> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyEarningCopyWith<$Res> {
  factory $DailyEarningCopyWith(
          DailyEarning value, $Res Function(DailyEarning) then) =
      _$DailyEarningCopyWithImpl<$Res, DailyEarning>;
  @useResult
  $Res call(
      {DateTime date,
      double earnings,
      int deliveries,
      int onlineHours,
      double rating});
}

/// @nodoc
class _$DailyEarningCopyWithImpl<$Res, $Val extends DailyEarning>
    implements $DailyEarningCopyWith<$Res> {
  _$DailyEarningCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyEarning
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? earnings = null,
    Object? deliveries = null,
    Object? onlineHours = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      earnings: null == earnings
          ? _value.earnings
          : earnings // ignore: cast_nullable_to_non_nullable
              as double,
      deliveries: null == deliveries
          ? _value.deliveries
          : deliveries // ignore: cast_nullable_to_non_nullable
              as int,
      onlineHours: null == onlineHours
          ? _value.onlineHours
          : onlineHours // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyEarningImplCopyWith<$Res>
    implements $DailyEarningCopyWith<$Res> {
  factory _$$DailyEarningImplCopyWith(
          _$DailyEarningImpl value, $Res Function(_$DailyEarningImpl) then) =
      __$$DailyEarningImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      double earnings,
      int deliveries,
      int onlineHours,
      double rating});
}

/// @nodoc
class __$$DailyEarningImplCopyWithImpl<$Res>
    extends _$DailyEarningCopyWithImpl<$Res, _$DailyEarningImpl>
    implements _$$DailyEarningImplCopyWith<$Res> {
  __$$DailyEarningImplCopyWithImpl(
      _$DailyEarningImpl _value, $Res Function(_$DailyEarningImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyEarning
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? earnings = null,
    Object? deliveries = null,
    Object? onlineHours = null,
    Object? rating = null,
  }) {
    return _then(_$DailyEarningImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      earnings: null == earnings
          ? _value.earnings
          : earnings // ignore: cast_nullable_to_non_nullable
              as double,
      deliveries: null == deliveries
          ? _value.deliveries
          : deliveries // ignore: cast_nullable_to_non_nullable
              as int,
      onlineHours: null == onlineHours
          ? _value.onlineHours
          : onlineHours // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyEarningImpl implements _DailyEarning {
  const _$DailyEarningImpl(
      {required this.date,
      required this.earnings,
      required this.deliveries,
      required this.onlineHours,
      required this.rating});

  factory _$DailyEarningImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyEarningImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double earnings;
  @override
  final int deliveries;
  @override
  final int onlineHours;
  @override
  final double rating;

  @override
  String toString() {
    return 'DailyEarning(date: $date, earnings: $earnings, deliveries: $deliveries, onlineHours: $onlineHours, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyEarningImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.earnings, earnings) ||
                other.earnings == earnings) &&
            (identical(other.deliveries, deliveries) ||
                other.deliveries == deliveries) &&
            (identical(other.onlineHours, onlineHours) ||
                other.onlineHours == onlineHours) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, earnings, deliveries, onlineHours, rating);

  /// Create a copy of DailyEarning
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyEarningImplCopyWith<_$DailyEarningImpl> get copyWith =>
      __$$DailyEarningImplCopyWithImpl<_$DailyEarningImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyEarningImplToJson(
      this,
    );
  }
}

abstract class _DailyEarning implements DailyEarning {
  const factory _DailyEarning(
      {required final DateTime date,
      required final double earnings,
      required final int deliveries,
      required final int onlineHours,
      required final double rating}) = _$DailyEarningImpl;

  factory _DailyEarning.fromJson(Map<String, dynamic> json) =
      _$DailyEarningImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get earnings;
  @override
  int get deliveries;
  @override
  int get onlineHours;
  @override
  double get rating;

  /// Create a copy of DailyEarning
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyEarningImplCopyWith<_$DailyEarningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklyEarning _$WeeklyEarningFromJson(Map<String, dynamic> json) {
  return _WeeklyEarning.fromJson(json);
}

/// @nodoc
mixin _$WeeklyEarning {
  DateTime get weekStartDate => throw _privateConstructorUsedError;
  double get earnings => throw _privateConstructorUsedError;
  int get deliveries => throw _privateConstructorUsedError;
  int get onlineHours => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;
  List<DailyEarning> get dailyBreakdown => throw _privateConstructorUsedError;

  /// Serializes this WeeklyEarning to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyEarning
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyEarningCopyWith<WeeklyEarning> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyEarningCopyWith<$Res> {
  factory $WeeklyEarningCopyWith(
          WeeklyEarning value, $Res Function(WeeklyEarning) then) =
      _$WeeklyEarningCopyWithImpl<$Res, WeeklyEarning>;
  @useResult
  $Res call(
      {DateTime weekStartDate,
      double earnings,
      int deliveries,
      int onlineHours,
      double averageRating,
      List<DailyEarning> dailyBreakdown});
}

/// @nodoc
class _$WeeklyEarningCopyWithImpl<$Res, $Val extends WeeklyEarning>
    implements $WeeklyEarningCopyWith<$Res> {
  _$WeeklyEarningCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyEarning
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekStartDate = null,
    Object? earnings = null,
    Object? deliveries = null,
    Object? onlineHours = null,
    Object? averageRating = null,
    Object? dailyBreakdown = null,
  }) {
    return _then(_value.copyWith(
      weekStartDate: null == weekStartDate
          ? _value.weekStartDate
          : weekStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      earnings: null == earnings
          ? _value.earnings
          : earnings // ignore: cast_nullable_to_non_nullable
              as double,
      deliveries: null == deliveries
          ? _value.deliveries
          : deliveries // ignore: cast_nullable_to_non_nullable
              as int,
      onlineHours: null == onlineHours
          ? _value.onlineHours
          : onlineHours // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      dailyBreakdown: null == dailyBreakdown
          ? _value.dailyBreakdown
          : dailyBreakdown // ignore: cast_nullable_to_non_nullable
              as List<DailyEarning>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyEarningImplCopyWith<$Res>
    implements $WeeklyEarningCopyWith<$Res> {
  factory _$$WeeklyEarningImplCopyWith(
          _$WeeklyEarningImpl value, $Res Function(_$WeeklyEarningImpl) then) =
      __$$WeeklyEarningImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime weekStartDate,
      double earnings,
      int deliveries,
      int onlineHours,
      double averageRating,
      List<DailyEarning> dailyBreakdown});
}

/// @nodoc
class __$$WeeklyEarningImplCopyWithImpl<$Res>
    extends _$WeeklyEarningCopyWithImpl<$Res, _$WeeklyEarningImpl>
    implements _$$WeeklyEarningImplCopyWith<$Res> {
  __$$WeeklyEarningImplCopyWithImpl(
      _$WeeklyEarningImpl _value, $Res Function(_$WeeklyEarningImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeklyEarning
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekStartDate = null,
    Object? earnings = null,
    Object? deliveries = null,
    Object? onlineHours = null,
    Object? averageRating = null,
    Object? dailyBreakdown = null,
  }) {
    return _then(_$WeeklyEarningImpl(
      weekStartDate: null == weekStartDate
          ? _value.weekStartDate
          : weekStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      earnings: null == earnings
          ? _value.earnings
          : earnings // ignore: cast_nullable_to_non_nullable
              as double,
      deliveries: null == deliveries
          ? _value.deliveries
          : deliveries // ignore: cast_nullable_to_non_nullable
              as int,
      onlineHours: null == onlineHours
          ? _value.onlineHours
          : onlineHours // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      dailyBreakdown: null == dailyBreakdown
          ? _value._dailyBreakdown
          : dailyBreakdown // ignore: cast_nullable_to_non_nullable
              as List<DailyEarning>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyEarningImpl implements _WeeklyEarning {
  const _$WeeklyEarningImpl(
      {required this.weekStartDate,
      required this.earnings,
      required this.deliveries,
      required this.onlineHours,
      required this.averageRating,
      final List<DailyEarning> dailyBreakdown = const []})
      : _dailyBreakdown = dailyBreakdown;

  factory _$WeeklyEarningImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyEarningImplFromJson(json);

  @override
  final DateTime weekStartDate;
  @override
  final double earnings;
  @override
  final int deliveries;
  @override
  final int onlineHours;
  @override
  final double averageRating;
  final List<DailyEarning> _dailyBreakdown;
  @override
  @JsonKey()
  List<DailyEarning> get dailyBreakdown {
    if (_dailyBreakdown is EqualUnmodifiableListView) return _dailyBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyBreakdown);
  }

  @override
  String toString() {
    return 'WeeklyEarning(weekStartDate: $weekStartDate, earnings: $earnings, deliveries: $deliveries, onlineHours: $onlineHours, averageRating: $averageRating, dailyBreakdown: $dailyBreakdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyEarningImpl &&
            (identical(other.weekStartDate, weekStartDate) ||
                other.weekStartDate == weekStartDate) &&
            (identical(other.earnings, earnings) ||
                other.earnings == earnings) &&
            (identical(other.deliveries, deliveries) ||
                other.deliveries == deliveries) &&
            (identical(other.onlineHours, onlineHours) ||
                other.onlineHours == onlineHours) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            const DeepCollectionEquality()
                .equals(other._dailyBreakdown, _dailyBreakdown));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      weekStartDate,
      earnings,
      deliveries,
      onlineHours,
      averageRating,
      const DeepCollectionEquality().hash(_dailyBreakdown));

  /// Create a copy of WeeklyEarning
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyEarningImplCopyWith<_$WeeklyEarningImpl> get copyWith =>
      __$$WeeklyEarningImplCopyWithImpl<_$WeeklyEarningImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyEarningImplToJson(
      this,
    );
  }
}

abstract class _WeeklyEarning implements WeeklyEarning {
  const factory _WeeklyEarning(
      {required final DateTime weekStartDate,
      required final double earnings,
      required final int deliveries,
      required final int onlineHours,
      required final double averageRating,
      final List<DailyEarning> dailyBreakdown}) = _$WeeklyEarningImpl;

  factory _WeeklyEarning.fromJson(Map<String, dynamic> json) =
      _$WeeklyEarningImpl.fromJson;

  @override
  DateTime get weekStartDate;
  @override
  double get earnings;
  @override
  int get deliveries;
  @override
  int get onlineHours;
  @override
  double get averageRating;
  @override
  List<DailyEarning> get dailyBreakdown;

  /// Create a copy of WeeklyEarning
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyEarningImplCopyWith<_$WeeklyEarningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EarningsSummary _$EarningsSummaryFromJson(Map<String, dynamic> json) {
  return _EarningsSummary.fromJson(json);
}

/// @nodoc
mixin _$EarningsSummary {
  double get baseEarnings => throw _privateConstructorUsedError;
  double get tips => throw _privateConstructorUsedError;
  double get bonuses => throw _privateConstructorUsedError;
  double get incentives => throw _privateConstructorUsedError;
  double get penalties => throw _privateConstructorUsedError;
  double get totalGross => throw _privateConstructorUsedError;
  double get totalNet => throw _privateConstructorUsedError;
  int get totalDeliveries => throw _privateConstructorUsedError;
  double get averagePerDelivery => throw _privateConstructorUsedError;

  /// Serializes this EarningsSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EarningsSummaryCopyWith<EarningsSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EarningsSummaryCopyWith<$Res> {
  factory $EarningsSummaryCopyWith(
          EarningsSummary value, $Res Function(EarningsSummary) then) =
      _$EarningsSummaryCopyWithImpl<$Res, EarningsSummary>;
  @useResult
  $Res call(
      {double baseEarnings,
      double tips,
      double bonuses,
      double incentives,
      double penalties,
      double totalGross,
      double totalNet,
      int totalDeliveries,
      double averagePerDelivery});
}

/// @nodoc
class _$EarningsSummaryCopyWithImpl<$Res, $Val extends EarningsSummary>
    implements $EarningsSummaryCopyWith<$Res> {
  _$EarningsSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseEarnings = null,
    Object? tips = null,
    Object? bonuses = null,
    Object? incentives = null,
    Object? penalties = null,
    Object? totalGross = null,
    Object? totalNet = null,
    Object? totalDeliveries = null,
    Object? averagePerDelivery = null,
  }) {
    return _then(_value.copyWith(
      baseEarnings: null == baseEarnings
          ? _value.baseEarnings
          : baseEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      tips: null == tips
          ? _value.tips
          : tips // ignore: cast_nullable_to_non_nullable
              as double,
      bonuses: null == bonuses
          ? _value.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as double,
      incentives: null == incentives
          ? _value.incentives
          : incentives // ignore: cast_nullable_to_non_nullable
              as double,
      penalties: null == penalties
          ? _value.penalties
          : penalties // ignore: cast_nullable_to_non_nullable
              as double,
      totalGross: null == totalGross
          ? _value.totalGross
          : totalGross // ignore: cast_nullable_to_non_nullable
              as double,
      totalNet: null == totalNet
          ? _value.totalNet
          : totalNet // ignore: cast_nullable_to_non_nullable
              as double,
      totalDeliveries: null == totalDeliveries
          ? _value.totalDeliveries
          : totalDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      averagePerDelivery: null == averagePerDelivery
          ? _value.averagePerDelivery
          : averagePerDelivery // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EarningsSummaryImplCopyWith<$Res>
    implements $EarningsSummaryCopyWith<$Res> {
  factory _$$EarningsSummaryImplCopyWith(_$EarningsSummaryImpl value,
          $Res Function(_$EarningsSummaryImpl) then) =
      __$$EarningsSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double baseEarnings,
      double tips,
      double bonuses,
      double incentives,
      double penalties,
      double totalGross,
      double totalNet,
      int totalDeliveries,
      double averagePerDelivery});
}

/// @nodoc
class __$$EarningsSummaryImplCopyWithImpl<$Res>
    extends _$EarningsSummaryCopyWithImpl<$Res, _$EarningsSummaryImpl>
    implements _$$EarningsSummaryImplCopyWith<$Res> {
  __$$EarningsSummaryImplCopyWithImpl(
      _$EarningsSummaryImpl _value, $Res Function(_$EarningsSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseEarnings = null,
    Object? tips = null,
    Object? bonuses = null,
    Object? incentives = null,
    Object? penalties = null,
    Object? totalGross = null,
    Object? totalNet = null,
    Object? totalDeliveries = null,
    Object? averagePerDelivery = null,
  }) {
    return _then(_$EarningsSummaryImpl(
      baseEarnings: null == baseEarnings
          ? _value.baseEarnings
          : baseEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      tips: null == tips
          ? _value.tips
          : tips // ignore: cast_nullable_to_non_nullable
              as double,
      bonuses: null == bonuses
          ? _value.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as double,
      incentives: null == incentives
          ? _value.incentives
          : incentives // ignore: cast_nullable_to_non_nullable
              as double,
      penalties: null == penalties
          ? _value.penalties
          : penalties // ignore: cast_nullable_to_non_nullable
              as double,
      totalGross: null == totalGross
          ? _value.totalGross
          : totalGross // ignore: cast_nullable_to_non_nullable
              as double,
      totalNet: null == totalNet
          ? _value.totalNet
          : totalNet // ignore: cast_nullable_to_non_nullable
              as double,
      totalDeliveries: null == totalDeliveries
          ? _value.totalDeliveries
          : totalDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      averagePerDelivery: null == averagePerDelivery
          ? _value.averagePerDelivery
          : averagePerDelivery // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EarningsSummaryImpl implements _EarningsSummary {
  const _$EarningsSummaryImpl(
      {required this.baseEarnings,
      required this.tips,
      required this.bonuses,
      required this.incentives,
      required this.penalties,
      required this.totalGross,
      required this.totalNet,
      required this.totalDeliveries,
      required this.averagePerDelivery});

  factory _$EarningsSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$EarningsSummaryImplFromJson(json);

  @override
  final double baseEarnings;
  @override
  final double tips;
  @override
  final double bonuses;
  @override
  final double incentives;
  @override
  final double penalties;
  @override
  final double totalGross;
  @override
  final double totalNet;
  @override
  final int totalDeliveries;
  @override
  final double averagePerDelivery;

  @override
  String toString() {
    return 'EarningsSummary(baseEarnings: $baseEarnings, tips: $tips, bonuses: $bonuses, incentives: $incentives, penalties: $penalties, totalGross: $totalGross, totalNet: $totalNet, totalDeliveries: $totalDeliveries, averagePerDelivery: $averagePerDelivery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EarningsSummaryImpl &&
            (identical(other.baseEarnings, baseEarnings) ||
                other.baseEarnings == baseEarnings) &&
            (identical(other.tips, tips) || other.tips == tips) &&
            (identical(other.bonuses, bonuses) || other.bonuses == bonuses) &&
            (identical(other.incentives, incentives) ||
                other.incentives == incentives) &&
            (identical(other.penalties, penalties) ||
                other.penalties == penalties) &&
            (identical(other.totalGross, totalGross) ||
                other.totalGross == totalGross) &&
            (identical(other.totalNet, totalNet) ||
                other.totalNet == totalNet) &&
            (identical(other.totalDeliveries, totalDeliveries) ||
                other.totalDeliveries == totalDeliveries) &&
            (identical(other.averagePerDelivery, averagePerDelivery) ||
                other.averagePerDelivery == averagePerDelivery));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      baseEarnings,
      tips,
      bonuses,
      incentives,
      penalties,
      totalGross,
      totalNet,
      totalDeliveries,
      averagePerDelivery);

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EarningsSummaryImplCopyWith<_$EarningsSummaryImpl> get copyWith =>
      __$$EarningsSummaryImplCopyWithImpl<_$EarningsSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EarningsSummaryImplToJson(
      this,
    );
  }
}

abstract class _EarningsSummary implements EarningsSummary {
  const factory _EarningsSummary(
      {required final double baseEarnings,
      required final double tips,
      required final double bonuses,
      required final double incentives,
      required final double penalties,
      required final double totalGross,
      required final double totalNet,
      required final int totalDeliveries,
      required final double averagePerDelivery}) = _$EarningsSummaryImpl;

  factory _EarningsSummary.fromJson(Map<String, dynamic> json) =
      _$EarningsSummaryImpl.fromJson;

  @override
  double get baseEarnings;
  @override
  double get tips;
  @override
  double get bonuses;
  @override
  double get incentives;
  @override
  double get penalties;
  @override
  double get totalGross;
  @override
  double get totalNet;
  @override
  int get totalDeliveries;
  @override
  double get averagePerDelivery;

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EarningsSummaryImplCopyWith<_$EarningsSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
