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
  double get thisWeekEarnings => throw _privateConstructorUsedError;
  double get thisMonthEarnings => throw _privateConstructorUsedError;
  List<EarningTransaction> get transactions =>
      throw _privateConstructorUsedError; // Additional fields
  int get todayDeliveries => throw _privateConstructorUsedError;
  double get weekEarnings => throw _privateConstructorUsedError;
  int get weekDeliveries => throw _privateConstructorUsedError;
  double get monthEarnings => throw _privateConstructorUsedError;
  int get monthDeliveries => throw _privateConstructorUsedError;
  int get totalDeliveries => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;
  double get completionRate => throw _privateConstructorUsedError;
  double get hourlyRate => throw _privateConstructorUsedError;
  List<EarningTransaction> get recentTransactions =>
      throw _privateConstructorUsedError;

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
      double thisWeekEarnings,
      double thisMonthEarnings,
      List<EarningTransaction> transactions,
      int todayDeliveries,
      double weekEarnings,
      int weekDeliveries,
      double monthEarnings,
      int monthDeliveries,
      int totalDeliveries,
      double averageRating,
      double completionRate,
      double hourlyRate,
      List<EarningTransaction> recentTransactions});
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
    Object? thisWeekEarnings = null,
    Object? thisMonthEarnings = null,
    Object? transactions = null,
    Object? todayDeliveries = null,
    Object? weekEarnings = null,
    Object? weekDeliveries = null,
    Object? monthEarnings = null,
    Object? monthDeliveries = null,
    Object? totalDeliveries = null,
    Object? averageRating = null,
    Object? completionRate = null,
    Object? hourlyRate = null,
    Object? recentTransactions = null,
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
      thisWeekEarnings: null == thisWeekEarnings
          ? _value.thisWeekEarnings
          : thisWeekEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      thisMonthEarnings: null == thisMonthEarnings
          ? _value.thisMonthEarnings
          : thisMonthEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<EarningTransaction>,
      todayDeliveries: null == todayDeliveries
          ? _value.todayDeliveries
          : todayDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      weekEarnings: null == weekEarnings
          ? _value.weekEarnings
          : weekEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      weekDeliveries: null == weekDeliveries
          ? _value.weekDeliveries
          : weekDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      monthEarnings: null == monthEarnings
          ? _value.monthEarnings
          : monthEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      monthDeliveries: null == monthDeliveries
          ? _value.monthDeliveries
          : monthDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      totalDeliveries: null == totalDeliveries
          ? _value.totalDeliveries
          : totalDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
      hourlyRate: null == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as double,
      recentTransactions: null == recentTransactions
          ? _value.recentTransactions
          : recentTransactions // ignore: cast_nullable_to_non_nullable
              as List<EarningTransaction>,
    ) as $Val);
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
      double thisWeekEarnings,
      double thisMonthEarnings,
      List<EarningTransaction> transactions,
      int todayDeliveries,
      double weekEarnings,
      int weekDeliveries,
      double monthEarnings,
      int monthDeliveries,
      int totalDeliveries,
      double averageRating,
      double completionRate,
      double hourlyRate,
      List<EarningTransaction> recentTransactions});
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
    Object? thisWeekEarnings = null,
    Object? thisMonthEarnings = null,
    Object? transactions = null,
    Object? todayDeliveries = null,
    Object? weekEarnings = null,
    Object? weekDeliveries = null,
    Object? monthEarnings = null,
    Object? monthDeliveries = null,
    Object? totalDeliveries = null,
    Object? averageRating = null,
    Object? completionRate = null,
    Object? hourlyRate = null,
    Object? recentTransactions = null,
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
      thisWeekEarnings: null == thisWeekEarnings
          ? _value.thisWeekEarnings
          : thisWeekEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      thisMonthEarnings: null == thisMonthEarnings
          ? _value.thisMonthEarnings
          : thisMonthEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<EarningTransaction>,
      todayDeliveries: null == todayDeliveries
          ? _value.todayDeliveries
          : todayDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      weekEarnings: null == weekEarnings
          ? _value.weekEarnings
          : weekEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      weekDeliveries: null == weekDeliveries
          ? _value.weekDeliveries
          : weekDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      monthEarnings: null == monthEarnings
          ? _value.monthEarnings
          : monthEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      monthDeliveries: null == monthDeliveries
          ? _value.monthDeliveries
          : monthDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      totalDeliveries: null == totalDeliveries
          ? _value.totalDeliveries
          : totalDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
      hourlyRate: null == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as double,
      recentTransactions: null == recentTransactions
          ? _value._recentTransactions
          : recentTransactions // ignore: cast_nullable_to_non_nullable
              as List<EarningTransaction>,
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
      required this.thisWeekEarnings,
      required this.thisMonthEarnings,
      required final List<EarningTransaction> transactions,
      required this.todayDeliveries,
      required this.weekEarnings,
      required this.weekDeliveries,
      required this.monthEarnings,
      required this.monthDeliveries,
      required this.totalDeliveries,
      required this.averageRating,
      required this.completionRate,
      required this.hourlyRate,
      required final List<EarningTransaction> recentTransactions})
      : _transactions = transactions,
        _recentTransactions = recentTransactions;

  factory _$DriverEarningsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverEarningsImplFromJson(json);

  @override
  final String driverId;
  @override
  final double totalEarnings;
  @override
  final double todayEarnings;
  @override
  final double thisWeekEarnings;
  @override
  final double thisMonthEarnings;
  final List<EarningTransaction> _transactions;
  @override
  List<EarningTransaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

// Additional fields
  @override
  final int todayDeliveries;
  @override
  final double weekEarnings;
  @override
  final int weekDeliveries;
  @override
  final double monthEarnings;
  @override
  final int monthDeliveries;
  @override
  final int totalDeliveries;
  @override
  final double averageRating;
  @override
  final double completionRate;
  @override
  final double hourlyRate;
  final List<EarningTransaction> _recentTransactions;
  @override
  List<EarningTransaction> get recentTransactions {
    if (_recentTransactions is EqualUnmodifiableListView)
      return _recentTransactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentTransactions);
  }

  @override
  String toString() {
    return 'DriverEarnings(driverId: $driverId, totalEarnings: $totalEarnings, todayEarnings: $todayEarnings, thisWeekEarnings: $thisWeekEarnings, thisMonthEarnings: $thisMonthEarnings, transactions: $transactions, todayDeliveries: $todayDeliveries, weekEarnings: $weekEarnings, weekDeliveries: $weekDeliveries, monthEarnings: $monthEarnings, monthDeliveries: $monthDeliveries, totalDeliveries: $totalDeliveries, averageRating: $averageRating, completionRate: $completionRate, hourlyRate: $hourlyRate, recentTransactions: $recentTransactions)';
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
            (identical(other.thisWeekEarnings, thisWeekEarnings) ||
                other.thisWeekEarnings == thisWeekEarnings) &&
            (identical(other.thisMonthEarnings, thisMonthEarnings) ||
                other.thisMonthEarnings == thisMonthEarnings) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.todayDeliveries, todayDeliveries) ||
                other.todayDeliveries == todayDeliveries) &&
            (identical(other.weekEarnings, weekEarnings) ||
                other.weekEarnings == weekEarnings) &&
            (identical(other.weekDeliveries, weekDeliveries) ||
                other.weekDeliveries == weekDeliveries) &&
            (identical(other.monthEarnings, monthEarnings) ||
                other.monthEarnings == monthEarnings) &&
            (identical(other.monthDeliveries, monthDeliveries) ||
                other.monthDeliveries == monthDeliveries) &&
            (identical(other.totalDeliveries, totalDeliveries) ||
                other.totalDeliveries == totalDeliveries) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            (identical(other.hourlyRate, hourlyRate) ||
                other.hourlyRate == hourlyRate) &&
            const DeepCollectionEquality()
                .equals(other._recentTransactions, _recentTransactions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      driverId,
      totalEarnings,
      todayEarnings,
      thisWeekEarnings,
      thisMonthEarnings,
      const DeepCollectionEquality().hash(_transactions),
      todayDeliveries,
      weekEarnings,
      weekDeliveries,
      monthEarnings,
      monthDeliveries,
      totalDeliveries,
      averageRating,
      completionRate,
      hourlyRate,
      const DeepCollectionEquality().hash(_recentTransactions));

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
          required final double thisWeekEarnings,
          required final double thisMonthEarnings,
          required final List<EarningTransaction> transactions,
          required final int todayDeliveries,
          required final double weekEarnings,
          required final int weekDeliveries,
          required final double monthEarnings,
          required final int monthDeliveries,
          required final int totalDeliveries,
          required final double averageRating,
          required final double completionRate,
          required final double hourlyRate,
          required final List<EarningTransaction> recentTransactions}) =
      _$DriverEarningsImpl;

  factory _DriverEarnings.fromJson(Map<String, dynamic> json) =
      _$DriverEarningsImpl.fromJson;

  @override
  String get driverId;
  @override
  double get totalEarnings;
  @override
  double get todayEarnings;
  @override
  double get thisWeekEarnings;
  @override
  double get thisMonthEarnings;
  @override
  List<EarningTransaction> get transactions; // Additional fields
  @override
  int get todayDeliveries;
  @override
  double get weekEarnings;
  @override
  int get weekDeliveries;
  @override
  double get monthEarnings;
  @override
  int get monthDeliveries;
  @override
  int get totalDeliveries;
  @override
  double get averageRating;
  @override
  double get completionRate;
  @override
  double get hourlyRate;
  @override
  List<EarningTransaction> get recentTransactions;

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
  String get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  EarningType get type => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  String? get restaurantName => throw _privateConstructorUsedError;

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
      {String id,
      double amount,
      EarningType type,
      DateTime date,
      String description,
      String? orderId,
      String? restaurantName});
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
    Object? id = null,
    Object? amount = null,
    Object? type = null,
    Object? date = null,
    Object? description = null,
    Object? orderId = freezed,
    Object? restaurantName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EarningType,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurantName: freezed == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {String id,
      double amount,
      EarningType type,
      DateTime date,
      String description,
      String? orderId,
      String? restaurantName});
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
    Object? id = null,
    Object? amount = null,
    Object? type = null,
    Object? date = null,
    Object? description = null,
    Object? orderId = freezed,
    Object? restaurantName = freezed,
  }) {
    return _then(_$EarningTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EarningType,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurantName: freezed == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EarningTransactionImpl implements _EarningTransaction {
  const _$EarningTransactionImpl(
      {required this.id,
      required this.amount,
      required this.type,
      required this.date,
      required this.description,
      this.orderId,
      this.restaurantName});

  factory _$EarningTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$EarningTransactionImplFromJson(json);

  @override
  final String id;
  @override
  final double amount;
  @override
  final EarningType type;
  @override
  final DateTime date;
  @override
  final String description;
  @override
  final String? orderId;
  @override
  final String? restaurantName;

  @override
  String toString() {
    return 'EarningTransaction(id: $id, amount: $amount, type: $type, date: $date, description: $description, orderId: $orderId, restaurantName: $restaurantName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EarningTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount, type, date,
      description, orderId, restaurantName);

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
      {required final String id,
      required final double amount,
      required final EarningType type,
      required final DateTime date,
      required final String description,
      final String? orderId,
      final String? restaurantName}) = _$EarningTransactionImpl;

  factory _EarningTransaction.fromJson(Map<String, dynamic> json) =
      _$EarningTransactionImpl.fromJson;

  @override
  String get id;
  @override
  double get amount;
  @override
  EarningType get type;
  @override
  DateTime get date;
  @override
  String get description;
  @override
  String? get orderId;
  @override
  String? get restaurantName;

  /// Create a copy of EarningTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EarningTransactionImplCopyWith<_$EarningTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
