// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enhanced_loyalty_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoyaltyStatus _$LoyaltyStatusFromJson(Map<String, dynamic> json) {
  return _LoyaltyStatus.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyStatus {
  String get userId => throw _privateConstructorUsedError;
  int get totalPoints => throw _privateConstructorUsedError;
  int get availablePoints => throw _privateConstructorUsedError;
  LoyaltyTier get currentTier => throw _privateConstructorUsedError;
  LoyaltyTier? get nextTier => throw _privateConstructorUsedError;
  int get pointsToNextTier => throw _privateConstructorUsedError;
  double get progressToNextTier => throw _privateConstructorUsedError;
  String get referralCode => throw _privateConstructorUsedError;
  DateTime get joinDate => throw _privateConstructorUsedError;
  DateTime get lastActivity => throw _privateConstructorUsedError;
  LoyaltyStats get stats => throw _privateConstructorUsedError;
  List<Achievement> get achievements => throw _privateConstructorUsedError;
  List<ActiveBonus> get activeBonuses => throw _privateConstructorUsedError;
  List<String> get badges => throw _privateConstructorUsedError;

  /// Serializes this LoyaltyStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoyaltyStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoyaltyStatusCopyWith<LoyaltyStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyStatusCopyWith<$Res> {
  factory $LoyaltyStatusCopyWith(
          LoyaltyStatus value, $Res Function(LoyaltyStatus) then) =
      _$LoyaltyStatusCopyWithImpl<$Res, LoyaltyStatus>;
  @useResult
  $Res call(
      {String userId,
      int totalPoints,
      int availablePoints,
      LoyaltyTier currentTier,
      LoyaltyTier? nextTier,
      int pointsToNextTier,
      double progressToNextTier,
      String referralCode,
      DateTime joinDate,
      DateTime lastActivity,
      LoyaltyStats stats,
      List<Achievement> achievements,
      List<ActiveBonus> activeBonuses,
      List<String> badges});

  $LoyaltyTierCopyWith<$Res> get currentTier;
  $LoyaltyTierCopyWith<$Res>? get nextTier;
  $LoyaltyStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$LoyaltyStatusCopyWithImpl<$Res, $Val extends LoyaltyStatus>
    implements $LoyaltyStatusCopyWith<$Res> {
  _$LoyaltyStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoyaltyStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? totalPoints = null,
    Object? availablePoints = null,
    Object? currentTier = null,
    Object? nextTier = freezed,
    Object? pointsToNextTier = null,
    Object? progressToNextTier = null,
    Object? referralCode = null,
    Object? joinDate = null,
    Object? lastActivity = null,
    Object? stats = null,
    Object? achievements = null,
    Object? activeBonuses = null,
    Object? badges = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      availablePoints: null == availablePoints
          ? _value.availablePoints
          : availablePoints // ignore: cast_nullable_to_non_nullable
              as int,
      currentTier: null == currentTier
          ? _value.currentTier
          : currentTier // ignore: cast_nullable_to_non_nullable
              as LoyaltyTier,
      nextTier: freezed == nextTier
          ? _value.nextTier
          : nextTier // ignore: cast_nullable_to_non_nullable
              as LoyaltyTier?,
      pointsToNextTier: null == pointsToNextTier
          ? _value.pointsToNextTier
          : pointsToNextTier // ignore: cast_nullable_to_non_nullable
              as int,
      progressToNextTier: null == progressToNextTier
          ? _value.progressToNextTier
          : progressToNextTier // ignore: cast_nullable_to_non_nullable
              as double,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      joinDate: null == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastActivity: null == lastActivity
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as LoyaltyStats,
      achievements: null == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<Achievement>,
      activeBonuses: null == activeBonuses
          ? _value.activeBonuses
          : activeBonuses // ignore: cast_nullable_to_non_nullable
              as List<ActiveBonus>,
      badges: null == badges
          ? _value.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of LoyaltyStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoyaltyTierCopyWith<$Res> get currentTier {
    return $LoyaltyTierCopyWith<$Res>(_value.currentTier, (value) {
      return _then(_value.copyWith(currentTier: value) as $Val);
    });
  }

  /// Create a copy of LoyaltyStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoyaltyTierCopyWith<$Res>? get nextTier {
    if (_value.nextTier == null) {
      return null;
    }

    return $LoyaltyTierCopyWith<$Res>(_value.nextTier!, (value) {
      return _then(_value.copyWith(nextTier: value) as $Val);
    });
  }

  /// Create a copy of LoyaltyStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoyaltyStatsCopyWith<$Res> get stats {
    return $LoyaltyStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoyaltyStatusImplCopyWith<$Res>
    implements $LoyaltyStatusCopyWith<$Res> {
  factory _$$LoyaltyStatusImplCopyWith(
          _$LoyaltyStatusImpl value, $Res Function(_$LoyaltyStatusImpl) then) =
      __$$LoyaltyStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      int totalPoints,
      int availablePoints,
      LoyaltyTier currentTier,
      LoyaltyTier? nextTier,
      int pointsToNextTier,
      double progressToNextTier,
      String referralCode,
      DateTime joinDate,
      DateTime lastActivity,
      LoyaltyStats stats,
      List<Achievement> achievements,
      List<ActiveBonus> activeBonuses,
      List<String> badges});

  @override
  $LoyaltyTierCopyWith<$Res> get currentTier;
  @override
  $LoyaltyTierCopyWith<$Res>? get nextTier;
  @override
  $LoyaltyStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$LoyaltyStatusImplCopyWithImpl<$Res>
    extends _$LoyaltyStatusCopyWithImpl<$Res, _$LoyaltyStatusImpl>
    implements _$$LoyaltyStatusImplCopyWith<$Res> {
  __$$LoyaltyStatusImplCopyWithImpl(
      _$LoyaltyStatusImpl _value, $Res Function(_$LoyaltyStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? totalPoints = null,
    Object? availablePoints = null,
    Object? currentTier = null,
    Object? nextTier = freezed,
    Object? pointsToNextTier = null,
    Object? progressToNextTier = null,
    Object? referralCode = null,
    Object? joinDate = null,
    Object? lastActivity = null,
    Object? stats = null,
    Object? achievements = null,
    Object? activeBonuses = null,
    Object? badges = null,
  }) {
    return _then(_$LoyaltyStatusImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      availablePoints: null == availablePoints
          ? _value.availablePoints
          : availablePoints // ignore: cast_nullable_to_non_nullable
              as int,
      currentTier: null == currentTier
          ? _value.currentTier
          : currentTier // ignore: cast_nullable_to_non_nullable
              as LoyaltyTier,
      nextTier: freezed == nextTier
          ? _value.nextTier
          : nextTier // ignore: cast_nullable_to_non_nullable
              as LoyaltyTier?,
      pointsToNextTier: null == pointsToNextTier
          ? _value.pointsToNextTier
          : pointsToNextTier // ignore: cast_nullable_to_non_nullable
              as int,
      progressToNextTier: null == progressToNextTier
          ? _value.progressToNextTier
          : progressToNextTier // ignore: cast_nullable_to_non_nullable
              as double,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      joinDate: null == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastActivity: null == lastActivity
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as LoyaltyStats,
      achievements: null == achievements
          ? _value._achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<Achievement>,
      activeBonuses: null == activeBonuses
          ? _value._activeBonuses
          : activeBonuses // ignore: cast_nullable_to_non_nullable
              as List<ActiveBonus>,
      badges: null == badges
          ? _value._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoyaltyStatusImpl implements _LoyaltyStatus {
  const _$LoyaltyStatusImpl(
      {required this.userId,
      required this.totalPoints,
      required this.availablePoints,
      required this.currentTier,
      required this.nextTier,
      required this.pointsToNextTier,
      required this.progressToNextTier,
      required this.referralCode,
      required this.joinDate,
      required this.lastActivity,
      required this.stats,
      required final List<Achievement> achievements,
      final List<ActiveBonus> activeBonuses = const [],
      final List<String> badges = const []})
      : _achievements = achievements,
        _activeBonuses = activeBonuses,
        _badges = badges;

  factory _$LoyaltyStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoyaltyStatusImplFromJson(json);

  @override
  final String userId;
  @override
  final int totalPoints;
  @override
  final int availablePoints;
  @override
  final LoyaltyTier currentTier;
  @override
  final LoyaltyTier? nextTier;
  @override
  final int pointsToNextTier;
  @override
  final double progressToNextTier;
  @override
  final String referralCode;
  @override
  final DateTime joinDate;
  @override
  final DateTime lastActivity;
  @override
  final LoyaltyStats stats;
  final List<Achievement> _achievements;
  @override
  List<Achievement> get achievements {
    if (_achievements is EqualUnmodifiableListView) return _achievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_achievements);
  }

  final List<ActiveBonus> _activeBonuses;
  @override
  @JsonKey()
  List<ActiveBonus> get activeBonuses {
    if (_activeBonuses is EqualUnmodifiableListView) return _activeBonuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeBonuses);
  }

  final List<String> _badges;
  @override
  @JsonKey()
  List<String> get badges {
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_badges);
  }

  @override
  String toString() {
    return 'LoyaltyStatus(userId: $userId, totalPoints: $totalPoints, availablePoints: $availablePoints, currentTier: $currentTier, nextTier: $nextTier, pointsToNextTier: $pointsToNextTier, progressToNextTier: $progressToNextTier, referralCode: $referralCode, joinDate: $joinDate, lastActivity: $lastActivity, stats: $stats, achievements: $achievements, activeBonuses: $activeBonuses, badges: $badges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoyaltyStatusImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.availablePoints, availablePoints) ||
                other.availablePoints == availablePoints) &&
            (identical(other.currentTier, currentTier) ||
                other.currentTier == currentTier) &&
            (identical(other.nextTier, nextTier) ||
                other.nextTier == nextTier) &&
            (identical(other.pointsToNextTier, pointsToNextTier) ||
                other.pointsToNextTier == pointsToNextTier) &&
            (identical(other.progressToNextTier, progressToNextTier) ||
                other.progressToNextTier == progressToNextTier) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate) &&
            (identical(other.lastActivity, lastActivity) ||
                other.lastActivity == lastActivity) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            const DeepCollectionEquality()
                .equals(other._achievements, _achievements) &&
            const DeepCollectionEquality()
                .equals(other._activeBonuses, _activeBonuses) &&
            const DeepCollectionEquality().equals(other._badges, _badges));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      totalPoints,
      availablePoints,
      currentTier,
      nextTier,
      pointsToNextTier,
      progressToNextTier,
      referralCode,
      joinDate,
      lastActivity,
      stats,
      const DeepCollectionEquality().hash(_achievements),
      const DeepCollectionEquality().hash(_activeBonuses),
      const DeepCollectionEquality().hash(_badges));

  /// Create a copy of LoyaltyStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoyaltyStatusImplCopyWith<_$LoyaltyStatusImpl> get copyWith =>
      __$$LoyaltyStatusImplCopyWithImpl<_$LoyaltyStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoyaltyStatusImplToJson(
      this,
    );
  }
}

abstract class _LoyaltyStatus implements LoyaltyStatus {
  const factory _LoyaltyStatus(
      {required final String userId,
      required final int totalPoints,
      required final int availablePoints,
      required final LoyaltyTier currentTier,
      required final LoyaltyTier? nextTier,
      required final int pointsToNextTier,
      required final double progressToNextTier,
      required final String referralCode,
      required final DateTime joinDate,
      required final DateTime lastActivity,
      required final LoyaltyStats stats,
      required final List<Achievement> achievements,
      final List<ActiveBonus> activeBonuses,
      final List<String> badges}) = _$LoyaltyStatusImpl;

  factory _LoyaltyStatus.fromJson(Map<String, dynamic> json) =
      _$LoyaltyStatusImpl.fromJson;

  @override
  String get userId;
  @override
  int get totalPoints;
  @override
  int get availablePoints;
  @override
  LoyaltyTier get currentTier;
  @override
  LoyaltyTier? get nextTier;
  @override
  int get pointsToNextTier;
  @override
  double get progressToNextTier;
  @override
  String get referralCode;
  @override
  DateTime get joinDate;
  @override
  DateTime get lastActivity;
  @override
  LoyaltyStats get stats;
  @override
  List<Achievement> get achievements;
  @override
  List<ActiveBonus> get activeBonuses;
  @override
  List<String> get badges;

  /// Create a copy of LoyaltyStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoyaltyStatusImplCopyWith<_$LoyaltyStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoyaltyTier _$LoyaltyTierFromJson(Map<String, dynamic> json) {
  return _LoyaltyTier.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyTier {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  int get minPoints => throw _privateConstructorUsedError;
  int get maxPoints => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  double get discountPercentage => throw _privateConstructorUsedError;
  List<TierBenefit> get benefits => throw _privateConstructorUsedError;
  Map<String, dynamic> get perks => throw _privateConstructorUsedError;
  double get pointsMultiplier => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this LoyaltyTier to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoyaltyTier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoyaltyTierCopyWith<LoyaltyTier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyTierCopyWith<$Res> {
  factory $LoyaltyTierCopyWith(
          LoyaltyTier value, $Res Function(LoyaltyTier) then) =
      _$LoyaltyTierCopyWithImpl<$Res, LoyaltyTier>;
  @useResult
  $Res call(
      {String id,
      String name,
      String displayName,
      int minPoints,
      int maxPoints,
      String color,
      String icon,
      double discountPercentage,
      List<TierBenefit> benefits,
      Map<String, dynamic> perks,
      double pointsMultiplier,
      String description});
}

/// @nodoc
class _$LoyaltyTierCopyWithImpl<$Res, $Val extends LoyaltyTier>
    implements $LoyaltyTierCopyWith<$Res> {
  _$LoyaltyTierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoyaltyTier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
    Object? minPoints = null,
    Object? maxPoints = null,
    Object? color = null,
    Object? icon = null,
    Object? discountPercentage = null,
    Object? benefits = null,
    Object? perks = null,
    Object? pointsMultiplier = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      minPoints: null == minPoints
          ? _value.minPoints
          : minPoints // ignore: cast_nullable_to_non_nullable
              as int,
      maxPoints: null == maxPoints
          ? _value.maxPoints
          : maxPoints // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      discountPercentage: null == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      benefits: null == benefits
          ? _value.benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<TierBenefit>,
      perks: null == perks
          ? _value.perks
          : perks // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      pointsMultiplier: null == pointsMultiplier
          ? _value.pointsMultiplier
          : pointsMultiplier // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoyaltyTierImplCopyWith<$Res>
    implements $LoyaltyTierCopyWith<$Res> {
  factory _$$LoyaltyTierImplCopyWith(
          _$LoyaltyTierImpl value, $Res Function(_$LoyaltyTierImpl) then) =
      __$$LoyaltyTierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String displayName,
      int minPoints,
      int maxPoints,
      String color,
      String icon,
      double discountPercentage,
      List<TierBenefit> benefits,
      Map<String, dynamic> perks,
      double pointsMultiplier,
      String description});
}

/// @nodoc
class __$$LoyaltyTierImplCopyWithImpl<$Res>
    extends _$LoyaltyTierCopyWithImpl<$Res, _$LoyaltyTierImpl>
    implements _$$LoyaltyTierImplCopyWith<$Res> {
  __$$LoyaltyTierImplCopyWithImpl(
      _$LoyaltyTierImpl _value, $Res Function(_$LoyaltyTierImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyTier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
    Object? minPoints = null,
    Object? maxPoints = null,
    Object? color = null,
    Object? icon = null,
    Object? discountPercentage = null,
    Object? benefits = null,
    Object? perks = null,
    Object? pointsMultiplier = null,
    Object? description = null,
  }) {
    return _then(_$LoyaltyTierImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      minPoints: null == minPoints
          ? _value.minPoints
          : minPoints // ignore: cast_nullable_to_non_nullable
              as int,
      maxPoints: null == maxPoints
          ? _value.maxPoints
          : maxPoints // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      discountPercentage: null == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      benefits: null == benefits
          ? _value._benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<TierBenefit>,
      perks: null == perks
          ? _value._perks
          : perks // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      pointsMultiplier: null == pointsMultiplier
          ? _value.pointsMultiplier
          : pointsMultiplier // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoyaltyTierImpl implements _LoyaltyTier {
  const _$LoyaltyTierImpl(
      {required this.id,
      required this.name,
      required this.displayName,
      required this.minPoints,
      required this.maxPoints,
      required this.color,
      required this.icon,
      required this.discountPercentage,
      required final List<TierBenefit> benefits,
      required final Map<String, dynamic> perks,
      this.pointsMultiplier = 1.0,
      required this.description})
      : _benefits = benefits,
        _perks = perks;

  factory _$LoyaltyTierImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoyaltyTierImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String displayName;
  @override
  final int minPoints;
  @override
  final int maxPoints;
  @override
  final String color;
  @override
  final String icon;
  @override
  final double discountPercentage;
  final List<TierBenefit> _benefits;
  @override
  List<TierBenefit> get benefits {
    if (_benefits is EqualUnmodifiableListView) return _benefits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_benefits);
  }

  final Map<String, dynamic> _perks;
  @override
  Map<String, dynamic> get perks {
    if (_perks is EqualUnmodifiableMapView) return _perks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_perks);
  }

  @override
  @JsonKey()
  final double pointsMultiplier;
  @override
  final String description;

  @override
  String toString() {
    return 'LoyaltyTier(id: $id, name: $name, displayName: $displayName, minPoints: $minPoints, maxPoints: $maxPoints, color: $color, icon: $icon, discountPercentage: $discountPercentage, benefits: $benefits, perks: $perks, pointsMultiplier: $pointsMultiplier, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoyaltyTierImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.minPoints, minPoints) ||
                other.minPoints == minPoints) &&
            (identical(other.maxPoints, maxPoints) ||
                other.maxPoints == maxPoints) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.discountPercentage, discountPercentage) ||
                other.discountPercentage == discountPercentage) &&
            const DeepCollectionEquality().equals(other._benefits, _benefits) &&
            const DeepCollectionEquality().equals(other._perks, _perks) &&
            (identical(other.pointsMultiplier, pointsMultiplier) ||
                other.pointsMultiplier == pointsMultiplier) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      displayName,
      minPoints,
      maxPoints,
      color,
      icon,
      discountPercentage,
      const DeepCollectionEquality().hash(_benefits),
      const DeepCollectionEquality().hash(_perks),
      pointsMultiplier,
      description);

  /// Create a copy of LoyaltyTier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoyaltyTierImplCopyWith<_$LoyaltyTierImpl> get copyWith =>
      __$$LoyaltyTierImplCopyWithImpl<_$LoyaltyTierImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoyaltyTierImplToJson(
      this,
    );
  }
}

abstract class _LoyaltyTier implements LoyaltyTier {
  const factory _LoyaltyTier(
      {required final String id,
      required final String name,
      required final String displayName,
      required final int minPoints,
      required final int maxPoints,
      required final String color,
      required final String icon,
      required final double discountPercentage,
      required final List<TierBenefit> benefits,
      required final Map<String, dynamic> perks,
      final double pointsMultiplier,
      required final String description}) = _$LoyaltyTierImpl;

  factory _LoyaltyTier.fromJson(Map<String, dynamic> json) =
      _$LoyaltyTierImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get displayName;
  @override
  int get minPoints;
  @override
  int get maxPoints;
  @override
  String get color;
  @override
  String get icon;
  @override
  double get discountPercentage;
  @override
  List<TierBenefit> get benefits;
  @override
  Map<String, dynamic> get perks;
  @override
  double get pointsMultiplier;
  @override
  String get description;

  /// Create a copy of LoyaltyTier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoyaltyTierImplCopyWith<_$LoyaltyTierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TierBenefit _$TierBenefitFromJson(Map<String, dynamic> json) {
  return _TierBenefit.fromJson(json);
}

/// @nodoc
mixin _$TierBenefit {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this TierBenefit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TierBenefit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TierBenefitCopyWith<TierBenefit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TierBenefitCopyWith<$Res> {
  factory $TierBenefitCopyWith(
          TierBenefit value, $Res Function(TierBenefit) then) =
      _$TierBenefitCopyWithImpl<$Res, TierBenefit>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String type,
      String icon,
      bool isActive,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$TierBenefitCopyWithImpl<$Res, $Val extends TierBenefit>
    implements $TierBenefitCopyWith<$Res> {
  _$TierBenefitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TierBenefit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? icon = null,
    Object? isActive = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TierBenefitImplCopyWith<$Res>
    implements $TierBenefitCopyWith<$Res> {
  factory _$$TierBenefitImplCopyWith(
          _$TierBenefitImpl value, $Res Function(_$TierBenefitImpl) then) =
      __$$TierBenefitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String type,
      String icon,
      bool isActive,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$TierBenefitImplCopyWithImpl<$Res>
    extends _$TierBenefitCopyWithImpl<$Res, _$TierBenefitImpl>
    implements _$$TierBenefitImplCopyWith<$Res> {
  __$$TierBenefitImplCopyWithImpl(
      _$TierBenefitImpl _value, $Res Function(_$TierBenefitImpl) _then)
      : super(_value, _then);

  /// Create a copy of TierBenefit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? icon = null,
    Object? isActive = null,
    Object? metadata = freezed,
  }) {
    return _then(_$TierBenefitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TierBenefitImpl implements _TierBenefit {
  const _$TierBenefitImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.type,
      required this.icon,
      required this.isActive,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$TierBenefitImpl.fromJson(Map<String, dynamic> json) =>
      _$$TierBenefitImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String type;
  @override
  final String icon;
  @override
  final bool isActive;
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
    return 'TierBenefit(id: $id, title: $title, description: $description, type: $type, icon: $icon, isActive: $isActive, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TierBenefitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, type,
      icon, isActive, const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of TierBenefit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TierBenefitImplCopyWith<_$TierBenefitImpl> get copyWith =>
      __$$TierBenefitImplCopyWithImpl<_$TierBenefitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TierBenefitImplToJson(
      this,
    );
  }
}

abstract class _TierBenefit implements TierBenefit {
  const factory _TierBenefit(
      {required final String id,
      required final String title,
      required final String description,
      required final String type,
      required final String icon,
      required final bool isActive,
      final Map<String, dynamic>? metadata}) = _$TierBenefitImpl;

  factory _TierBenefit.fromJson(Map<String, dynamic> json) =
      _$TierBenefitImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get type;
  @override
  String get icon;
  @override
  bool get isActive;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of TierBenefit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TierBenefitImplCopyWith<_$TierBenefitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoyaltyStats _$LoyaltyStatsFromJson(Map<String, dynamic> json) {
  return _LoyaltyStats.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyStats {
  int get totalPointsEarned => throw _privateConstructorUsedError;
  int get totalPointsRedeemed => throw _privateConstructorUsedError;
  int get totalOrders => throw _privateConstructorUsedError;
  double get totalSpent => throw _privateConstructorUsedError;
  int get referralsCount => throw _privateConstructorUsedError;
  int get achievementsCount => throw _privateConstructorUsedError;
  DateTime get firstOrderDate => throw _privateConstructorUsedError;
  int get streakDays => throw _privateConstructorUsedError;
  int get monthlyOrders => throw _privateConstructorUsedError;
  double get averageOrderValue => throw _privateConstructorUsedError;

  /// Serializes this LoyaltyStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoyaltyStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoyaltyStatsCopyWith<LoyaltyStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyStatsCopyWith<$Res> {
  factory $LoyaltyStatsCopyWith(
          LoyaltyStats value, $Res Function(LoyaltyStats) then) =
      _$LoyaltyStatsCopyWithImpl<$Res, LoyaltyStats>;
  @useResult
  $Res call(
      {int totalPointsEarned,
      int totalPointsRedeemed,
      int totalOrders,
      double totalSpent,
      int referralsCount,
      int achievementsCount,
      DateTime firstOrderDate,
      int streakDays,
      int monthlyOrders,
      double averageOrderValue});
}

/// @nodoc
class _$LoyaltyStatsCopyWithImpl<$Res, $Val extends LoyaltyStats>
    implements $LoyaltyStatsCopyWith<$Res> {
  _$LoyaltyStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoyaltyStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPointsEarned = null,
    Object? totalPointsRedeemed = null,
    Object? totalOrders = null,
    Object? totalSpent = null,
    Object? referralsCount = null,
    Object? achievementsCount = null,
    Object? firstOrderDate = null,
    Object? streakDays = null,
    Object? monthlyOrders = null,
    Object? averageOrderValue = null,
  }) {
    return _then(_value.copyWith(
      totalPointsEarned: null == totalPointsEarned
          ? _value.totalPointsEarned
          : totalPointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
      totalPointsRedeemed: null == totalPointsRedeemed
          ? _value.totalPointsRedeemed
          : totalPointsRedeemed // ignore: cast_nullable_to_non_nullable
              as int,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      referralsCount: null == referralsCount
          ? _value.referralsCount
          : referralsCount // ignore: cast_nullable_to_non_nullable
              as int,
      achievementsCount: null == achievementsCount
          ? _value.achievementsCount
          : achievementsCount // ignore: cast_nullable_to_non_nullable
              as int,
      firstOrderDate: null == firstOrderDate
          ? _value.firstOrderDate
          : firstOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyOrders: null == monthlyOrders
          ? _value.monthlyOrders
          : monthlyOrders // ignore: cast_nullable_to_non_nullable
              as int,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoyaltyStatsImplCopyWith<$Res>
    implements $LoyaltyStatsCopyWith<$Res> {
  factory _$$LoyaltyStatsImplCopyWith(
          _$LoyaltyStatsImpl value, $Res Function(_$LoyaltyStatsImpl) then) =
      __$$LoyaltyStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalPointsEarned,
      int totalPointsRedeemed,
      int totalOrders,
      double totalSpent,
      int referralsCount,
      int achievementsCount,
      DateTime firstOrderDate,
      int streakDays,
      int monthlyOrders,
      double averageOrderValue});
}

/// @nodoc
class __$$LoyaltyStatsImplCopyWithImpl<$Res>
    extends _$LoyaltyStatsCopyWithImpl<$Res, _$LoyaltyStatsImpl>
    implements _$$LoyaltyStatsImplCopyWith<$Res> {
  __$$LoyaltyStatsImplCopyWithImpl(
      _$LoyaltyStatsImpl _value, $Res Function(_$LoyaltyStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPointsEarned = null,
    Object? totalPointsRedeemed = null,
    Object? totalOrders = null,
    Object? totalSpent = null,
    Object? referralsCount = null,
    Object? achievementsCount = null,
    Object? firstOrderDate = null,
    Object? streakDays = null,
    Object? monthlyOrders = null,
    Object? averageOrderValue = null,
  }) {
    return _then(_$LoyaltyStatsImpl(
      totalPointsEarned: null == totalPointsEarned
          ? _value.totalPointsEarned
          : totalPointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
      totalPointsRedeemed: null == totalPointsRedeemed
          ? _value.totalPointsRedeemed
          : totalPointsRedeemed // ignore: cast_nullable_to_non_nullable
              as int,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      referralsCount: null == referralsCount
          ? _value.referralsCount
          : referralsCount // ignore: cast_nullable_to_non_nullable
              as int,
      achievementsCount: null == achievementsCount
          ? _value.achievementsCount
          : achievementsCount // ignore: cast_nullable_to_non_nullable
              as int,
      firstOrderDate: null == firstOrderDate
          ? _value.firstOrderDate
          : firstOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyOrders: null == monthlyOrders
          ? _value.monthlyOrders
          : monthlyOrders // ignore: cast_nullable_to_non_nullable
              as int,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoyaltyStatsImpl implements _LoyaltyStats {
  const _$LoyaltyStatsImpl(
      {required this.totalPointsEarned,
      required this.totalPointsRedeemed,
      required this.totalOrders,
      required this.totalSpent,
      required this.referralsCount,
      required this.achievementsCount,
      required this.firstOrderDate,
      required this.streakDays,
      required this.monthlyOrders,
      required this.averageOrderValue});

  factory _$LoyaltyStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoyaltyStatsImplFromJson(json);

  @override
  final int totalPointsEarned;
  @override
  final int totalPointsRedeemed;
  @override
  final int totalOrders;
  @override
  final double totalSpent;
  @override
  final int referralsCount;
  @override
  final int achievementsCount;
  @override
  final DateTime firstOrderDate;
  @override
  final int streakDays;
  @override
  final int monthlyOrders;
  @override
  final double averageOrderValue;

  @override
  String toString() {
    return 'LoyaltyStats(totalPointsEarned: $totalPointsEarned, totalPointsRedeemed: $totalPointsRedeemed, totalOrders: $totalOrders, totalSpent: $totalSpent, referralsCount: $referralsCount, achievementsCount: $achievementsCount, firstOrderDate: $firstOrderDate, streakDays: $streakDays, monthlyOrders: $monthlyOrders, averageOrderValue: $averageOrderValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoyaltyStatsImpl &&
            (identical(other.totalPointsEarned, totalPointsEarned) ||
                other.totalPointsEarned == totalPointsEarned) &&
            (identical(other.totalPointsRedeemed, totalPointsRedeemed) ||
                other.totalPointsRedeemed == totalPointsRedeemed) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.referralsCount, referralsCount) ||
                other.referralsCount == referralsCount) &&
            (identical(other.achievementsCount, achievementsCount) ||
                other.achievementsCount == achievementsCount) &&
            (identical(other.firstOrderDate, firstOrderDate) ||
                other.firstOrderDate == firstOrderDate) &&
            (identical(other.streakDays, streakDays) ||
                other.streakDays == streakDays) &&
            (identical(other.monthlyOrders, monthlyOrders) ||
                other.monthlyOrders == monthlyOrders) &&
            (identical(other.averageOrderValue, averageOrderValue) ||
                other.averageOrderValue == averageOrderValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalPointsEarned,
      totalPointsRedeemed,
      totalOrders,
      totalSpent,
      referralsCount,
      achievementsCount,
      firstOrderDate,
      streakDays,
      monthlyOrders,
      averageOrderValue);

  /// Create a copy of LoyaltyStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoyaltyStatsImplCopyWith<_$LoyaltyStatsImpl> get copyWith =>
      __$$LoyaltyStatsImplCopyWithImpl<_$LoyaltyStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoyaltyStatsImplToJson(
      this,
    );
  }
}

abstract class _LoyaltyStats implements LoyaltyStats {
  const factory _LoyaltyStats(
      {required final int totalPointsEarned,
      required final int totalPointsRedeemed,
      required final int totalOrders,
      required final double totalSpent,
      required final int referralsCount,
      required final int achievementsCount,
      required final DateTime firstOrderDate,
      required final int streakDays,
      required final int monthlyOrders,
      required final double averageOrderValue}) = _$LoyaltyStatsImpl;

  factory _LoyaltyStats.fromJson(Map<String, dynamic> json) =
      _$LoyaltyStatsImpl.fromJson;

  @override
  int get totalPointsEarned;
  @override
  int get totalPointsRedeemed;
  @override
  int get totalOrders;
  @override
  double get totalSpent;
  @override
  int get referralsCount;
  @override
  int get achievementsCount;
  @override
  DateTime get firstOrderDate;
  @override
  int get streakDays;
  @override
  int get monthlyOrders;
  @override
  double get averageOrderValue;

  /// Create a copy of LoyaltyStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoyaltyStatsImplCopyWith<_$LoyaltyStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Achievement _$AchievementFromJson(Map<String, dynamic> json) {
  return _Achievement.fromJson(json);
}

/// @nodoc
mixin _$Achievement {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  int get pointsReward => throw _privateConstructorUsedError;
  bool get isUnlocked => throw _privateConstructorUsedError;
  DateTime? get unlockedDate => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  int get target => throw _privateConstructorUsedError;
  Map<String, dynamic> get criteria => throw _privateConstructorUsedError;
  bool get isNew => throw _privateConstructorUsedError;

  /// Serializes this Achievement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AchievementCopyWith<Achievement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementCopyWith<$Res> {
  factory $AchievementCopyWith(
          Achievement value, $Res Function(Achievement) then) =
      _$AchievementCopyWithImpl<$Res, Achievement>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String category,
      String icon,
      int pointsReward,
      bool isUnlocked,
      DateTime? unlockedDate,
      double progress,
      int target,
      Map<String, dynamic> criteria,
      bool isNew});
}

/// @nodoc
class _$AchievementCopyWithImpl<$Res, $Val extends Achievement>
    implements $AchievementCopyWith<$Res> {
  _$AchievementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? icon = null,
    Object? pointsReward = null,
    Object? isUnlocked = null,
    Object? unlockedDate = freezed,
    Object? progress = null,
    Object? target = null,
    Object? criteria = null,
    Object? isNew = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      pointsReward: null == pointsReward
          ? _value.pointsReward
          : pointsReward // ignore: cast_nullable_to_non_nullable
              as int,
      isUnlocked: null == isUnlocked
          ? _value.isUnlocked
          : isUnlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockedDate: freezed == unlockedDate
          ? _value.unlockedDate
          : unlockedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as int,
      criteria: null == criteria
          ? _value.criteria
          : criteria // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AchievementImplCopyWith<$Res>
    implements $AchievementCopyWith<$Res> {
  factory _$$AchievementImplCopyWith(
          _$AchievementImpl value, $Res Function(_$AchievementImpl) then) =
      __$$AchievementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String category,
      String icon,
      int pointsReward,
      bool isUnlocked,
      DateTime? unlockedDate,
      double progress,
      int target,
      Map<String, dynamic> criteria,
      bool isNew});
}

/// @nodoc
class __$$AchievementImplCopyWithImpl<$Res>
    extends _$AchievementCopyWithImpl<$Res, _$AchievementImpl>
    implements _$$AchievementImplCopyWith<$Res> {
  __$$AchievementImplCopyWithImpl(
      _$AchievementImpl _value, $Res Function(_$AchievementImpl) _then)
      : super(_value, _then);

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? icon = null,
    Object? pointsReward = null,
    Object? isUnlocked = null,
    Object? unlockedDate = freezed,
    Object? progress = null,
    Object? target = null,
    Object? criteria = null,
    Object? isNew = null,
  }) {
    return _then(_$AchievementImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      pointsReward: null == pointsReward
          ? _value.pointsReward
          : pointsReward // ignore: cast_nullable_to_non_nullable
              as int,
      isUnlocked: null == isUnlocked
          ? _value.isUnlocked
          : isUnlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockedDate: freezed == unlockedDate
          ? _value.unlockedDate
          : unlockedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as int,
      criteria: null == criteria
          ? _value._criteria
          : criteria // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AchievementImpl implements _Achievement {
  const _$AchievementImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.icon,
      required this.pointsReward,
      required this.isUnlocked,
      required this.unlockedDate,
      required this.progress,
      required this.target,
      required final Map<String, dynamic> criteria,
      this.isNew = false})
      : _criteria = criteria;

  factory _$AchievementImpl.fromJson(Map<String, dynamic> json) =>
      _$$AchievementImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String category;
  @override
  final String icon;
  @override
  final int pointsReward;
  @override
  final bool isUnlocked;
  @override
  final DateTime? unlockedDate;
  @override
  final double progress;
  @override
  final int target;
  final Map<String, dynamic> _criteria;
  @override
  Map<String, dynamic> get criteria {
    if (_criteria is EqualUnmodifiableMapView) return _criteria;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_criteria);
  }

  @override
  @JsonKey()
  final bool isNew;

  @override
  String toString() {
    return 'Achievement(id: $id, title: $title, description: $description, category: $category, icon: $icon, pointsReward: $pointsReward, isUnlocked: $isUnlocked, unlockedDate: $unlockedDate, progress: $progress, target: $target, criteria: $criteria, isNew: $isNew)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.pointsReward, pointsReward) ||
                other.pointsReward == pointsReward) &&
            (identical(other.isUnlocked, isUnlocked) ||
                other.isUnlocked == isUnlocked) &&
            (identical(other.unlockedDate, unlockedDate) ||
                other.unlockedDate == unlockedDate) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.target, target) || other.target == target) &&
            const DeepCollectionEquality().equals(other._criteria, _criteria) &&
            (identical(other.isNew, isNew) || other.isNew == isNew));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      category,
      icon,
      pointsReward,
      isUnlocked,
      unlockedDate,
      progress,
      target,
      const DeepCollectionEquality().hash(_criteria),
      isNew);

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementImplCopyWith<_$AchievementImpl> get copyWith =>
      __$$AchievementImplCopyWithImpl<_$AchievementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchievementImplToJson(
      this,
    );
  }
}

abstract class _Achievement implements Achievement {
  const factory _Achievement(
      {required final String id,
      required final String title,
      required final String description,
      required final String category,
      required final String icon,
      required final int pointsReward,
      required final bool isUnlocked,
      required final DateTime? unlockedDate,
      required final double progress,
      required final int target,
      required final Map<String, dynamic> criteria,
      final bool isNew}) = _$AchievementImpl;

  factory _Achievement.fromJson(Map<String, dynamic> json) =
      _$AchievementImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get category;
  @override
  String get icon;
  @override
  int get pointsReward;
  @override
  bool get isUnlocked;
  @override
  DateTime? get unlockedDate;
  @override
  double get progress;
  @override
  int get target;
  @override
  Map<String, dynamic> get criteria;
  @override
  bool get isNew;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementImplCopyWith<_$AchievementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActiveBonus _$ActiveBonusFromJson(Map<String, dynamic> json) {
  return _ActiveBonus.fromJson(json);
}

/// @nodoc
mixin _$ActiveBonus {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double get multiplier => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  Map<String, dynamic> get conditions => throw _privateConstructorUsedError;
  bool get isUsed => throw _privateConstructorUsedError;

  /// Serializes this ActiveBonus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActiveBonus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActiveBonusCopyWith<ActiveBonus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveBonusCopyWith<$Res> {
  factory $ActiveBonusCopyWith(
          ActiveBonus value, $Res Function(ActiveBonus) then) =
      _$ActiveBonusCopyWithImpl<$Res, ActiveBonus>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String type,
      double multiplier,
      DateTime startDate,
      DateTime endDate,
      Map<String, dynamic> conditions,
      bool isUsed});
}

/// @nodoc
class _$ActiveBonusCopyWithImpl<$Res, $Val extends ActiveBonus>
    implements $ActiveBonusCopyWith<$Res> {
  _$ActiveBonusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActiveBonus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? multiplier = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? conditions = null,
    Object? isUsed = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
              as String,
      multiplier: null == multiplier
          ? _value.multiplier
          : multiplier // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isUsed: null == isUsed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActiveBonusImplCopyWith<$Res>
    implements $ActiveBonusCopyWith<$Res> {
  factory _$$ActiveBonusImplCopyWith(
          _$ActiveBonusImpl value, $Res Function(_$ActiveBonusImpl) then) =
      __$$ActiveBonusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String type,
      double multiplier,
      DateTime startDate,
      DateTime endDate,
      Map<String, dynamic> conditions,
      bool isUsed});
}

/// @nodoc
class __$$ActiveBonusImplCopyWithImpl<$Res>
    extends _$ActiveBonusCopyWithImpl<$Res, _$ActiveBonusImpl>
    implements _$$ActiveBonusImplCopyWith<$Res> {
  __$$ActiveBonusImplCopyWithImpl(
      _$ActiveBonusImpl _value, $Res Function(_$ActiveBonusImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActiveBonus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? multiplier = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? conditions = null,
    Object? isUsed = null,
  }) {
    return _then(_$ActiveBonusImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
              as String,
      multiplier: null == multiplier
          ? _value.multiplier
          : multiplier // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      conditions: null == conditions
          ? _value._conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isUsed: null == isUsed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActiveBonusImpl implements _ActiveBonus {
  const _$ActiveBonusImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.type,
      required this.multiplier,
      required this.startDate,
      required this.endDate,
      required final Map<String, dynamic> conditions,
      this.isUsed = false})
      : _conditions = conditions;

  factory _$ActiveBonusImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActiveBonusImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String type;
  @override
  final double multiplier;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  final Map<String, dynamic> _conditions;
  @override
  Map<String, dynamic> get conditions {
    if (_conditions is EqualUnmodifiableMapView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_conditions);
  }

  @override
  @JsonKey()
  final bool isUsed;

  @override
  String toString() {
    return 'ActiveBonus(id: $id, title: $title, description: $description, type: $type, multiplier: $multiplier, startDate: $startDate, endDate: $endDate, conditions: $conditions, isUsed: $isUsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveBonusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.multiplier, multiplier) ||
                other.multiplier == multiplier) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._conditions, _conditions) &&
            (identical(other.isUsed, isUsed) || other.isUsed == isUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      type,
      multiplier,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_conditions),
      isUsed);

  /// Create a copy of ActiveBonus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveBonusImplCopyWith<_$ActiveBonusImpl> get copyWith =>
      __$$ActiveBonusImplCopyWithImpl<_$ActiveBonusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActiveBonusImplToJson(
      this,
    );
  }
}

abstract class _ActiveBonus implements ActiveBonus {
  const factory _ActiveBonus(
      {required final String id,
      required final String title,
      required final String description,
      required final String type,
      required final double multiplier,
      required final DateTime startDate,
      required final DateTime endDate,
      required final Map<String, dynamic> conditions,
      final bool isUsed}) = _$ActiveBonusImpl;

  factory _ActiveBonus.fromJson(Map<String, dynamic> json) =
      _$ActiveBonusImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get type;
  @override
  double get multiplier;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  Map<String, dynamic> get conditions;
  @override
  bool get isUsed;

  /// Create a copy of ActiveBonus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActiveBonusImplCopyWith<_$ActiveBonusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoyaltyTransaction _$LoyaltyTransactionFromJson(Map<String, dynamic> json) {
  return _LoyaltyTransaction.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyTransaction {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  String? get referenceId => throw _privateConstructorUsedError;
  String? get rewardId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this LoyaltyTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoyaltyTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoyaltyTransactionCopyWith<LoyaltyTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyTransactionCopyWith<$Res> {
  factory $LoyaltyTransactionCopyWith(
          LoyaltyTransaction value, $Res Function(LoyaltyTransaction) then) =
      _$LoyaltyTransactionCopyWithImpl<$Res, LoyaltyTransaction>;
  @useResult
  $Res call(
      {String id,
      String type,
      int points,
      String description,
      DateTime timestamp,
      String? orderId,
      String? referenceId,
      String? rewardId,
      Map<String, dynamic>? metadata,
      String status});
}

/// @nodoc
class _$LoyaltyTransactionCopyWithImpl<$Res, $Val extends LoyaltyTransaction>
    implements $LoyaltyTransactionCopyWith<$Res> {
  _$LoyaltyTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoyaltyTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? points = null,
    Object? description = null,
    Object? timestamp = null,
    Object? orderId = freezed,
    Object? referenceId = freezed,
    Object? rewardId = freezed,
    Object? metadata = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceId: freezed == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      rewardId: freezed == rewardId
          ? _value.rewardId
          : rewardId // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoyaltyTransactionImplCopyWith<$Res>
    implements $LoyaltyTransactionCopyWith<$Res> {
  factory _$$LoyaltyTransactionImplCopyWith(_$LoyaltyTransactionImpl value,
          $Res Function(_$LoyaltyTransactionImpl) then) =
      __$$LoyaltyTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      int points,
      String description,
      DateTime timestamp,
      String? orderId,
      String? referenceId,
      String? rewardId,
      Map<String, dynamic>? metadata,
      String status});
}

/// @nodoc
class __$$LoyaltyTransactionImplCopyWithImpl<$Res>
    extends _$LoyaltyTransactionCopyWithImpl<$Res, _$LoyaltyTransactionImpl>
    implements _$$LoyaltyTransactionImplCopyWith<$Res> {
  __$$LoyaltyTransactionImplCopyWithImpl(_$LoyaltyTransactionImpl _value,
      $Res Function(_$LoyaltyTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? points = null,
    Object? description = null,
    Object? timestamp = null,
    Object? orderId = freezed,
    Object? referenceId = freezed,
    Object? rewardId = freezed,
    Object? metadata = freezed,
    Object? status = null,
  }) {
    return _then(_$LoyaltyTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceId: freezed == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      rewardId: freezed == rewardId
          ? _value.rewardId
          : rewardId // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoyaltyTransactionImpl implements _LoyaltyTransaction {
  const _$LoyaltyTransactionImpl(
      {required this.id,
      required this.type,
      required this.points,
      required this.description,
      required this.timestamp,
      this.orderId,
      this.referenceId,
      this.rewardId,
      final Map<String, dynamic>? metadata,
      required this.status})
      : _metadata = metadata;

  factory _$LoyaltyTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoyaltyTransactionImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final int points;
  @override
  final String description;
  @override
  final DateTime timestamp;
  @override
  final String? orderId;
  @override
  final String? referenceId;
  @override
  final String? rewardId;
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
  final String status;

  @override
  String toString() {
    return 'LoyaltyTransaction(id: $id, type: $type, points: $points, description: $description, timestamp: $timestamp, orderId: $orderId, referenceId: $referenceId, rewardId: $rewardId, metadata: $metadata, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoyaltyTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.referenceId, referenceId) ||
                other.referenceId == referenceId) &&
            (identical(other.rewardId, rewardId) ||
                other.rewardId == rewardId) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      points,
      description,
      timestamp,
      orderId,
      referenceId,
      rewardId,
      const DeepCollectionEquality().hash(_metadata),
      status);

  /// Create a copy of LoyaltyTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoyaltyTransactionImplCopyWith<_$LoyaltyTransactionImpl> get copyWith =>
      __$$LoyaltyTransactionImplCopyWithImpl<_$LoyaltyTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoyaltyTransactionImplToJson(
      this,
    );
  }
}

abstract class _LoyaltyTransaction implements LoyaltyTransaction {
  const factory _LoyaltyTransaction(
      {required final String id,
      required final String type,
      required final int points,
      required final String description,
      required final DateTime timestamp,
      final String? orderId,
      final String? referenceId,
      final String? rewardId,
      final Map<String, dynamic>? metadata,
      required final String status}) = _$LoyaltyTransactionImpl;

  factory _LoyaltyTransaction.fromJson(Map<String, dynamic> json) =
      _$LoyaltyTransactionImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  int get points;
  @override
  String get description;
  @override
  DateTime get timestamp;
  @override
  String? get orderId;
  @override
  String? get referenceId;
  @override
  String? get rewardId;
  @override
  Map<String, dynamic>? get metadata;
  @override
  String get status;

  /// Create a copy of LoyaltyTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoyaltyTransactionImplCopyWith<_$LoyaltyTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoyaltyReward _$LoyaltyRewardFromJson(Map<String, dynamic> json) {
  return _LoyaltyReward.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyReward {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get pointsRequired => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  int get stock => throw _privateConstructorUsedError;
  DateTime? get expiryDate => throw _privateConstructorUsedError;
  List<String> get terms => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  bool get isPopular => throw _privateConstructorUsedError;
  bool get isLimitedTime => throw _privateConstructorUsedError;

  /// Serializes this LoyaltyReward to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoyaltyReward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoyaltyRewardCopyWith<LoyaltyReward> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyRewardCopyWith<$Res> {
  factory $LoyaltyRewardCopyWith(
          LoyaltyReward value, $Res Function(LoyaltyReward) then) =
      _$LoyaltyRewardCopyWithImpl<$Res, LoyaltyReward>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String category,
      int pointsRequired,
      String type,
      String value,
      String icon,
      String image,
      bool isAvailable,
      int stock,
      DateTime? expiryDate,
      List<String> terms,
      Map<String, dynamic>? metadata,
      bool isPopular,
      bool isLimitedTime});
}

/// @nodoc
class _$LoyaltyRewardCopyWithImpl<$Res, $Val extends LoyaltyReward>
    implements $LoyaltyRewardCopyWith<$Res> {
  _$LoyaltyRewardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoyaltyReward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? pointsRequired = null,
    Object? type = null,
    Object? value = null,
    Object? icon = null,
    Object? image = null,
    Object? isAvailable = null,
    Object? stock = null,
    Object? expiryDate = freezed,
    Object? terms = null,
    Object? metadata = freezed,
    Object? isPopular = null,
    Object? isLimitedTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      pointsRequired: null == pointsRequired
          ? _value.pointsRequired
          : pointsRequired // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      terms: null == terms
          ? _value.terms
          : terms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isPopular: null == isPopular
          ? _value.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
              as bool,
      isLimitedTime: null == isLimitedTime
          ? _value.isLimitedTime
          : isLimitedTime // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoyaltyRewardImplCopyWith<$Res>
    implements $LoyaltyRewardCopyWith<$Res> {
  factory _$$LoyaltyRewardImplCopyWith(
          _$LoyaltyRewardImpl value, $Res Function(_$LoyaltyRewardImpl) then) =
      __$$LoyaltyRewardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String category,
      int pointsRequired,
      String type,
      String value,
      String icon,
      String image,
      bool isAvailable,
      int stock,
      DateTime? expiryDate,
      List<String> terms,
      Map<String, dynamic>? metadata,
      bool isPopular,
      bool isLimitedTime});
}

/// @nodoc
class __$$LoyaltyRewardImplCopyWithImpl<$Res>
    extends _$LoyaltyRewardCopyWithImpl<$Res, _$LoyaltyRewardImpl>
    implements _$$LoyaltyRewardImplCopyWith<$Res> {
  __$$LoyaltyRewardImplCopyWithImpl(
      _$LoyaltyRewardImpl _value, $Res Function(_$LoyaltyRewardImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyReward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? pointsRequired = null,
    Object? type = null,
    Object? value = null,
    Object? icon = null,
    Object? image = null,
    Object? isAvailable = null,
    Object? stock = null,
    Object? expiryDate = freezed,
    Object? terms = null,
    Object? metadata = freezed,
    Object? isPopular = null,
    Object? isLimitedTime = null,
  }) {
    return _then(_$LoyaltyRewardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      pointsRequired: null == pointsRequired
          ? _value.pointsRequired
          : pointsRequired // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      terms: null == terms
          ? _value._terms
          : terms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isPopular: null == isPopular
          ? _value.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
              as bool,
      isLimitedTime: null == isLimitedTime
          ? _value.isLimitedTime
          : isLimitedTime // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoyaltyRewardImpl implements _LoyaltyReward {
  const _$LoyaltyRewardImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.pointsRequired,
      required this.type,
      required this.value,
      required this.icon,
      required this.image,
      required this.isAvailable,
      required this.stock,
      required this.expiryDate,
      required final List<String> terms,
      final Map<String, dynamic>? metadata,
      this.isPopular = false,
      this.isLimitedTime = false})
      : _terms = terms,
        _metadata = metadata;

  factory _$LoyaltyRewardImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoyaltyRewardImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String category;
  @override
  final int pointsRequired;
  @override
  final String type;
  @override
  final String value;
  @override
  final String icon;
  @override
  final String image;
  @override
  final bool isAvailable;
  @override
  final int stock;
  @override
  final DateTime? expiryDate;
  final List<String> _terms;
  @override
  List<String> get terms {
    if (_terms is EqualUnmodifiableListView) return _terms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_terms);
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
  @JsonKey()
  final bool isPopular;
  @override
  @JsonKey()
  final bool isLimitedTime;

  @override
  String toString() {
    return 'LoyaltyReward(id: $id, title: $title, description: $description, category: $category, pointsRequired: $pointsRequired, type: $type, value: $value, icon: $icon, image: $image, isAvailable: $isAvailable, stock: $stock, expiryDate: $expiryDate, terms: $terms, metadata: $metadata, isPopular: $isPopular, isLimitedTime: $isLimitedTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoyaltyRewardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.pointsRequired, pointsRequired) ||
                other.pointsRequired == pointsRequired) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            const DeepCollectionEquality().equals(other._terms, _terms) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.isPopular, isPopular) ||
                other.isPopular == isPopular) &&
            (identical(other.isLimitedTime, isLimitedTime) ||
                other.isLimitedTime == isLimitedTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      category,
      pointsRequired,
      type,
      value,
      icon,
      image,
      isAvailable,
      stock,
      expiryDate,
      const DeepCollectionEquality().hash(_terms),
      const DeepCollectionEquality().hash(_metadata),
      isPopular,
      isLimitedTime);

  /// Create a copy of LoyaltyReward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoyaltyRewardImplCopyWith<_$LoyaltyRewardImpl> get copyWith =>
      __$$LoyaltyRewardImplCopyWithImpl<_$LoyaltyRewardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoyaltyRewardImplToJson(
      this,
    );
  }
}

abstract class _LoyaltyReward implements LoyaltyReward {
  const factory _LoyaltyReward(
      {required final String id,
      required final String title,
      required final String description,
      required final String category,
      required final int pointsRequired,
      required final String type,
      required final String value,
      required final String icon,
      required final String image,
      required final bool isAvailable,
      required final int stock,
      required final DateTime? expiryDate,
      required final List<String> terms,
      final Map<String, dynamic>? metadata,
      final bool isPopular,
      final bool isLimitedTime}) = _$LoyaltyRewardImpl;

  factory _LoyaltyReward.fromJson(Map<String, dynamic> json) =
      _$LoyaltyRewardImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get category;
  @override
  int get pointsRequired;
  @override
  String get type;
  @override
  String get value;
  @override
  String get icon;
  @override
  String get image;
  @override
  bool get isAvailable;
  @override
  int get stock;
  @override
  DateTime? get expiryDate;
  @override
  List<String> get terms;
  @override
  Map<String, dynamic>? get metadata;
  @override
  bool get isPopular;
  @override
  bool get isLimitedTime;

  /// Create a copy of LoyaltyReward
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoyaltyRewardImplCopyWith<_$LoyaltyRewardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RedemptionResult _$RedemptionResultFromJson(Map<String, dynamic> json) {
  return _RedemptionResult.fromJson(json);
}

/// @nodoc
mixin _$RedemptionResult {
  String get redemptionId => throw _privateConstructorUsedError;
  String get rewardId => throw _privateConstructorUsedError;
  String get rewardTitle => throw _privateConstructorUsedError;
  int get pointsUsed => throw _privateConstructorUsedError;
  int get remainingPoints => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get redeemedAt => throw _privateConstructorUsedError;
  String? get promoCode => throw _privateConstructorUsedError;
  String? get voucherCode => throw _privateConstructorUsedError;
  DateTime? get validUntil => throw _privateConstructorUsedError;
  Map<String, dynamic>? get rewardData => throw _privateConstructorUsedError;

  /// Serializes this RedemptionResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RedemptionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RedemptionResultCopyWith<RedemptionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RedemptionResultCopyWith<$Res> {
  factory $RedemptionResultCopyWith(
          RedemptionResult value, $Res Function(RedemptionResult) then) =
      _$RedemptionResultCopyWithImpl<$Res, RedemptionResult>;
  @useResult
  $Res call(
      {String redemptionId,
      String rewardId,
      String rewardTitle,
      int pointsUsed,
      int remainingPoints,
      String status,
      DateTime redeemedAt,
      String? promoCode,
      String? voucherCode,
      DateTime? validUntil,
      Map<String, dynamic>? rewardData});
}

/// @nodoc
class _$RedemptionResultCopyWithImpl<$Res, $Val extends RedemptionResult>
    implements $RedemptionResultCopyWith<$Res> {
  _$RedemptionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RedemptionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? redemptionId = null,
    Object? rewardId = null,
    Object? rewardTitle = null,
    Object? pointsUsed = null,
    Object? remainingPoints = null,
    Object? status = null,
    Object? redeemedAt = null,
    Object? promoCode = freezed,
    Object? voucherCode = freezed,
    Object? validUntil = freezed,
    Object? rewardData = freezed,
  }) {
    return _then(_value.copyWith(
      redemptionId: null == redemptionId
          ? _value.redemptionId
          : redemptionId // ignore: cast_nullable_to_non_nullable
              as String,
      rewardId: null == rewardId
          ? _value.rewardId
          : rewardId // ignore: cast_nullable_to_non_nullable
              as String,
      rewardTitle: null == rewardTitle
          ? _value.rewardTitle
          : rewardTitle // ignore: cast_nullable_to_non_nullable
              as String,
      pointsUsed: null == pointsUsed
          ? _value.pointsUsed
          : pointsUsed // ignore: cast_nullable_to_non_nullable
              as int,
      remainingPoints: null == remainingPoints
          ? _value.remainingPoints
          : remainingPoints // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      redeemedAt: null == redeemedAt
          ? _value.redeemedAt
          : redeemedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      voucherCode: freezed == voucherCode
          ? _value.voucherCode
          : voucherCode // ignore: cast_nullable_to_non_nullable
              as String?,
      validUntil: freezed == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rewardData: freezed == rewardData
          ? _value.rewardData
          : rewardData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RedemptionResultImplCopyWith<$Res>
    implements $RedemptionResultCopyWith<$Res> {
  factory _$$RedemptionResultImplCopyWith(_$RedemptionResultImpl value,
          $Res Function(_$RedemptionResultImpl) then) =
      __$$RedemptionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String redemptionId,
      String rewardId,
      String rewardTitle,
      int pointsUsed,
      int remainingPoints,
      String status,
      DateTime redeemedAt,
      String? promoCode,
      String? voucherCode,
      DateTime? validUntil,
      Map<String, dynamic>? rewardData});
}

/// @nodoc
class __$$RedemptionResultImplCopyWithImpl<$Res>
    extends _$RedemptionResultCopyWithImpl<$Res, _$RedemptionResultImpl>
    implements _$$RedemptionResultImplCopyWith<$Res> {
  __$$RedemptionResultImplCopyWithImpl(_$RedemptionResultImpl _value,
      $Res Function(_$RedemptionResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of RedemptionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? redemptionId = null,
    Object? rewardId = null,
    Object? rewardTitle = null,
    Object? pointsUsed = null,
    Object? remainingPoints = null,
    Object? status = null,
    Object? redeemedAt = null,
    Object? promoCode = freezed,
    Object? voucherCode = freezed,
    Object? validUntil = freezed,
    Object? rewardData = freezed,
  }) {
    return _then(_$RedemptionResultImpl(
      redemptionId: null == redemptionId
          ? _value.redemptionId
          : redemptionId // ignore: cast_nullable_to_non_nullable
              as String,
      rewardId: null == rewardId
          ? _value.rewardId
          : rewardId // ignore: cast_nullable_to_non_nullable
              as String,
      rewardTitle: null == rewardTitle
          ? _value.rewardTitle
          : rewardTitle // ignore: cast_nullable_to_non_nullable
              as String,
      pointsUsed: null == pointsUsed
          ? _value.pointsUsed
          : pointsUsed // ignore: cast_nullable_to_non_nullable
              as int,
      remainingPoints: null == remainingPoints
          ? _value.remainingPoints
          : remainingPoints // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      redeemedAt: null == redeemedAt
          ? _value.redeemedAt
          : redeemedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      voucherCode: freezed == voucherCode
          ? _value.voucherCode
          : voucherCode // ignore: cast_nullable_to_non_nullable
              as String?,
      validUntil: freezed == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rewardData: freezed == rewardData
          ? _value._rewardData
          : rewardData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RedemptionResultImpl implements _RedemptionResult {
  const _$RedemptionResultImpl(
      {required this.redemptionId,
      required this.rewardId,
      required this.rewardTitle,
      required this.pointsUsed,
      required this.remainingPoints,
      required this.status,
      required this.redeemedAt,
      this.promoCode,
      this.voucherCode,
      this.validUntil,
      final Map<String, dynamic>? rewardData})
      : _rewardData = rewardData;

  factory _$RedemptionResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$RedemptionResultImplFromJson(json);

  @override
  final String redemptionId;
  @override
  final String rewardId;
  @override
  final String rewardTitle;
  @override
  final int pointsUsed;
  @override
  final int remainingPoints;
  @override
  final String status;
  @override
  final DateTime redeemedAt;
  @override
  final String? promoCode;
  @override
  final String? voucherCode;
  @override
  final DateTime? validUntil;
  final Map<String, dynamic>? _rewardData;
  @override
  Map<String, dynamic>? get rewardData {
    final value = _rewardData;
    if (value == null) return null;
    if (_rewardData is EqualUnmodifiableMapView) return _rewardData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'RedemptionResult(redemptionId: $redemptionId, rewardId: $rewardId, rewardTitle: $rewardTitle, pointsUsed: $pointsUsed, remainingPoints: $remainingPoints, status: $status, redeemedAt: $redeemedAt, promoCode: $promoCode, voucherCode: $voucherCode, validUntil: $validUntil, rewardData: $rewardData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedemptionResultImpl &&
            (identical(other.redemptionId, redemptionId) ||
                other.redemptionId == redemptionId) &&
            (identical(other.rewardId, rewardId) ||
                other.rewardId == rewardId) &&
            (identical(other.rewardTitle, rewardTitle) ||
                other.rewardTitle == rewardTitle) &&
            (identical(other.pointsUsed, pointsUsed) ||
                other.pointsUsed == pointsUsed) &&
            (identical(other.remainingPoints, remainingPoints) ||
                other.remainingPoints == remainingPoints) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.redeemedAt, redeemedAt) ||
                other.redeemedAt == redeemedAt) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(other.voucherCode, voucherCode) ||
                other.voucherCode == voucherCode) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            const DeepCollectionEquality()
                .equals(other._rewardData, _rewardData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      redemptionId,
      rewardId,
      rewardTitle,
      pointsUsed,
      remainingPoints,
      status,
      redeemedAt,
      promoCode,
      voucherCode,
      validUntil,
      const DeepCollectionEquality().hash(_rewardData));

  /// Create a copy of RedemptionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RedemptionResultImplCopyWith<_$RedemptionResultImpl> get copyWith =>
      __$$RedemptionResultImplCopyWithImpl<_$RedemptionResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RedemptionResultImplToJson(
      this,
    );
  }
}

abstract class _RedemptionResult implements RedemptionResult {
  const factory _RedemptionResult(
      {required final String redemptionId,
      required final String rewardId,
      required final String rewardTitle,
      required final int pointsUsed,
      required final int remainingPoints,
      required final String status,
      required final DateTime redeemedAt,
      final String? promoCode,
      final String? voucherCode,
      final DateTime? validUntil,
      final Map<String, dynamic>? rewardData}) = _$RedemptionResultImpl;

  factory _RedemptionResult.fromJson(Map<String, dynamic> json) =
      _$RedemptionResultImpl.fromJson;

  @override
  String get redemptionId;
  @override
  String get rewardId;
  @override
  String get rewardTitle;
  @override
  int get pointsUsed;
  @override
  int get remainingPoints;
  @override
  String get status;
  @override
  DateTime get redeemedAt;
  @override
  String? get promoCode;
  @override
  String? get voucherCode;
  @override
  DateTime? get validUntil;
  @override
  Map<String, dynamic>? get rewardData;

  /// Create a copy of RedemptionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RedemptionResultImplCopyWith<_$RedemptionResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoyaltyConfig _$LoyaltyConfigFromJson(Map<String, dynamic> json) {
  return _LoyaltyConfig.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyConfig {
  List<LoyaltyTier> get tiers => throw _privateConstructorUsedError;
  Map<String, int> get pointsRules => throw _privateConstructorUsedError;
  Map<String, double> get bonusMultipliers =>
      throw _privateConstructorUsedError;
  int get referralPointsReward => throw _privateConstructorUsedError;
  int get signupPointsReward => throw _privateConstructorUsedError;
  int get reviewPointsReward => throw _privateConstructorUsedError;
  int get dailyCheckInPoints => throw _privateConstructorUsedError;
  Map<String, dynamic> get specialOffers => throw _privateConstructorUsedError;
  DateTime get configVersion => throw _privateConstructorUsedError;

  /// Serializes this LoyaltyConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoyaltyConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoyaltyConfigCopyWith<LoyaltyConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyConfigCopyWith<$Res> {
  factory $LoyaltyConfigCopyWith(
          LoyaltyConfig value, $Res Function(LoyaltyConfig) then) =
      _$LoyaltyConfigCopyWithImpl<$Res, LoyaltyConfig>;
  @useResult
  $Res call(
      {List<LoyaltyTier> tiers,
      Map<String, int> pointsRules,
      Map<String, double> bonusMultipliers,
      int referralPointsReward,
      int signupPointsReward,
      int reviewPointsReward,
      int dailyCheckInPoints,
      Map<String, dynamic> specialOffers,
      DateTime configVersion});
}

/// @nodoc
class _$LoyaltyConfigCopyWithImpl<$Res, $Val extends LoyaltyConfig>
    implements $LoyaltyConfigCopyWith<$Res> {
  _$LoyaltyConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoyaltyConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tiers = null,
    Object? pointsRules = null,
    Object? bonusMultipliers = null,
    Object? referralPointsReward = null,
    Object? signupPointsReward = null,
    Object? reviewPointsReward = null,
    Object? dailyCheckInPoints = null,
    Object? specialOffers = null,
    Object? configVersion = null,
  }) {
    return _then(_value.copyWith(
      tiers: null == tiers
          ? _value.tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyTier>,
      pointsRules: null == pointsRules
          ? _value.pointsRules
          : pointsRules // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      bonusMultipliers: null == bonusMultipliers
          ? _value.bonusMultipliers
          : bonusMultipliers // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      referralPointsReward: null == referralPointsReward
          ? _value.referralPointsReward
          : referralPointsReward // ignore: cast_nullable_to_non_nullable
              as int,
      signupPointsReward: null == signupPointsReward
          ? _value.signupPointsReward
          : signupPointsReward // ignore: cast_nullable_to_non_nullable
              as int,
      reviewPointsReward: null == reviewPointsReward
          ? _value.reviewPointsReward
          : reviewPointsReward // ignore: cast_nullable_to_non_nullable
              as int,
      dailyCheckInPoints: null == dailyCheckInPoints
          ? _value.dailyCheckInPoints
          : dailyCheckInPoints // ignore: cast_nullable_to_non_nullable
              as int,
      specialOffers: null == specialOffers
          ? _value.specialOffers
          : specialOffers // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      configVersion: null == configVersion
          ? _value.configVersion
          : configVersion // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoyaltyConfigImplCopyWith<$Res>
    implements $LoyaltyConfigCopyWith<$Res> {
  factory _$$LoyaltyConfigImplCopyWith(
          _$LoyaltyConfigImpl value, $Res Function(_$LoyaltyConfigImpl) then) =
      __$$LoyaltyConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<LoyaltyTier> tiers,
      Map<String, int> pointsRules,
      Map<String, double> bonusMultipliers,
      int referralPointsReward,
      int signupPointsReward,
      int reviewPointsReward,
      int dailyCheckInPoints,
      Map<String, dynamic> specialOffers,
      DateTime configVersion});
}

/// @nodoc
class __$$LoyaltyConfigImplCopyWithImpl<$Res>
    extends _$LoyaltyConfigCopyWithImpl<$Res, _$LoyaltyConfigImpl>
    implements _$$LoyaltyConfigImplCopyWith<$Res> {
  __$$LoyaltyConfigImplCopyWithImpl(
      _$LoyaltyConfigImpl _value, $Res Function(_$LoyaltyConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tiers = null,
    Object? pointsRules = null,
    Object? bonusMultipliers = null,
    Object? referralPointsReward = null,
    Object? signupPointsReward = null,
    Object? reviewPointsReward = null,
    Object? dailyCheckInPoints = null,
    Object? specialOffers = null,
    Object? configVersion = null,
  }) {
    return _then(_$LoyaltyConfigImpl(
      tiers: null == tiers
          ? _value._tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyTier>,
      pointsRules: null == pointsRules
          ? _value._pointsRules
          : pointsRules // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      bonusMultipliers: null == bonusMultipliers
          ? _value._bonusMultipliers
          : bonusMultipliers // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      referralPointsReward: null == referralPointsReward
          ? _value.referralPointsReward
          : referralPointsReward // ignore: cast_nullable_to_non_nullable
              as int,
      signupPointsReward: null == signupPointsReward
          ? _value.signupPointsReward
          : signupPointsReward // ignore: cast_nullable_to_non_nullable
              as int,
      reviewPointsReward: null == reviewPointsReward
          ? _value.reviewPointsReward
          : reviewPointsReward // ignore: cast_nullable_to_non_nullable
              as int,
      dailyCheckInPoints: null == dailyCheckInPoints
          ? _value.dailyCheckInPoints
          : dailyCheckInPoints // ignore: cast_nullable_to_non_nullable
              as int,
      specialOffers: null == specialOffers
          ? _value._specialOffers
          : specialOffers // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      configVersion: null == configVersion
          ? _value.configVersion
          : configVersion // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoyaltyConfigImpl implements _LoyaltyConfig {
  const _$LoyaltyConfigImpl(
      {required final List<LoyaltyTier> tiers,
      required final Map<String, int> pointsRules,
      required final Map<String, double> bonusMultipliers,
      required this.referralPointsReward,
      required this.signupPointsReward,
      required this.reviewPointsReward,
      required this.dailyCheckInPoints,
      required final Map<String, dynamic> specialOffers,
      required this.configVersion})
      : _tiers = tiers,
        _pointsRules = pointsRules,
        _bonusMultipliers = bonusMultipliers,
        _specialOffers = specialOffers;

  factory _$LoyaltyConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoyaltyConfigImplFromJson(json);

  final List<LoyaltyTier> _tiers;
  @override
  List<LoyaltyTier> get tiers {
    if (_tiers is EqualUnmodifiableListView) return _tiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tiers);
  }

  final Map<String, int> _pointsRules;
  @override
  Map<String, int> get pointsRules {
    if (_pointsRules is EqualUnmodifiableMapView) return _pointsRules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_pointsRules);
  }

  final Map<String, double> _bonusMultipliers;
  @override
  Map<String, double> get bonusMultipliers {
    if (_bonusMultipliers is EqualUnmodifiableMapView) return _bonusMultipliers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_bonusMultipliers);
  }

  @override
  final int referralPointsReward;
  @override
  final int signupPointsReward;
  @override
  final int reviewPointsReward;
  @override
  final int dailyCheckInPoints;
  final Map<String, dynamic> _specialOffers;
  @override
  Map<String, dynamic> get specialOffers {
    if (_specialOffers is EqualUnmodifiableMapView) return _specialOffers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_specialOffers);
  }

  @override
  final DateTime configVersion;

  @override
  String toString() {
    return 'LoyaltyConfig(tiers: $tiers, pointsRules: $pointsRules, bonusMultipliers: $bonusMultipliers, referralPointsReward: $referralPointsReward, signupPointsReward: $signupPointsReward, reviewPointsReward: $reviewPointsReward, dailyCheckInPoints: $dailyCheckInPoints, specialOffers: $specialOffers, configVersion: $configVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoyaltyConfigImpl &&
            const DeepCollectionEquality().equals(other._tiers, _tiers) &&
            const DeepCollectionEquality()
                .equals(other._pointsRules, _pointsRules) &&
            const DeepCollectionEquality()
                .equals(other._bonusMultipliers, _bonusMultipliers) &&
            (identical(other.referralPointsReward, referralPointsReward) ||
                other.referralPointsReward == referralPointsReward) &&
            (identical(other.signupPointsReward, signupPointsReward) ||
                other.signupPointsReward == signupPointsReward) &&
            (identical(other.reviewPointsReward, reviewPointsReward) ||
                other.reviewPointsReward == reviewPointsReward) &&
            (identical(other.dailyCheckInPoints, dailyCheckInPoints) ||
                other.dailyCheckInPoints == dailyCheckInPoints) &&
            const DeepCollectionEquality()
                .equals(other._specialOffers, _specialOffers) &&
            (identical(other.configVersion, configVersion) ||
                other.configVersion == configVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tiers),
      const DeepCollectionEquality().hash(_pointsRules),
      const DeepCollectionEquality().hash(_bonusMultipliers),
      referralPointsReward,
      signupPointsReward,
      reviewPointsReward,
      dailyCheckInPoints,
      const DeepCollectionEquality().hash(_specialOffers),
      configVersion);

  /// Create a copy of LoyaltyConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoyaltyConfigImplCopyWith<_$LoyaltyConfigImpl> get copyWith =>
      __$$LoyaltyConfigImplCopyWithImpl<_$LoyaltyConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoyaltyConfigImplToJson(
      this,
    );
  }
}

abstract class _LoyaltyConfig implements LoyaltyConfig {
  const factory _LoyaltyConfig(
      {required final List<LoyaltyTier> tiers,
      required final Map<String, int> pointsRules,
      required final Map<String, double> bonusMultipliers,
      required final int referralPointsReward,
      required final int signupPointsReward,
      required final int reviewPointsReward,
      required final int dailyCheckInPoints,
      required final Map<String, dynamic> specialOffers,
      required final DateTime configVersion}) = _$LoyaltyConfigImpl;

  factory _LoyaltyConfig.fromJson(Map<String, dynamic> json) =
      _$LoyaltyConfigImpl.fromJson;

  @override
  List<LoyaltyTier> get tiers;
  @override
  Map<String, int> get pointsRules;
  @override
  Map<String, double> get bonusMultipliers;
  @override
  int get referralPointsReward;
  @override
  int get signupPointsReward;
  @override
  int get reviewPointsReward;
  @override
  int get dailyCheckInPoints;
  @override
  Map<String, dynamic> get specialOffers;
  @override
  DateTime get configVersion;

  /// Create a copy of LoyaltyConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoyaltyConfigImplCopyWith<_$LoyaltyConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoyaltyDashboard _$LoyaltyDashboardFromJson(Map<String, dynamic> json) {
  return _LoyaltyDashboard.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyDashboard {
  LoyaltyStatus get status => throw _privateConstructorUsedError;
  List<LoyaltyReward> get featuredRewards => throw _privateConstructorUsedError;
  List<Achievement> get nearbyAchievements =>
      throw _privateConstructorUsedError;
  List<EarningOpportunity> get earningOpportunities =>
      throw _privateConstructorUsedError;
  List<SpecialEvent> get activeEvents => throw _privateConstructorUsedError;
  List<LoyaltyRecommendation> get recommendations =>
      throw _privateConstructorUsedError;
  LoyaltyInsights get insights => throw _privateConstructorUsedError;

  /// Serializes this LoyaltyDashboard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoyaltyDashboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoyaltyDashboardCopyWith<LoyaltyDashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyDashboardCopyWith<$Res> {
  factory $LoyaltyDashboardCopyWith(
          LoyaltyDashboard value, $Res Function(LoyaltyDashboard) then) =
      _$LoyaltyDashboardCopyWithImpl<$Res, LoyaltyDashboard>;
  @useResult
  $Res call(
      {LoyaltyStatus status,
      List<LoyaltyReward> featuredRewards,
      List<Achievement> nearbyAchievements,
      List<EarningOpportunity> earningOpportunities,
      List<SpecialEvent> activeEvents,
      List<LoyaltyRecommendation> recommendations,
      LoyaltyInsights insights});

  $LoyaltyStatusCopyWith<$Res> get status;
  $LoyaltyInsightsCopyWith<$Res> get insights;
}

/// @nodoc
class _$LoyaltyDashboardCopyWithImpl<$Res, $Val extends LoyaltyDashboard>
    implements $LoyaltyDashboardCopyWith<$Res> {
  _$LoyaltyDashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoyaltyDashboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? featuredRewards = null,
    Object? nearbyAchievements = null,
    Object? earningOpportunities = null,
    Object? activeEvents = null,
    Object? recommendations = null,
    Object? insights = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoyaltyStatus,
      featuredRewards: null == featuredRewards
          ? _value.featuredRewards
          : featuredRewards // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyReward>,
      nearbyAchievements: null == nearbyAchievements
          ? _value.nearbyAchievements
          : nearbyAchievements // ignore: cast_nullable_to_non_nullable
              as List<Achievement>,
      earningOpportunities: null == earningOpportunities
          ? _value.earningOpportunities
          : earningOpportunities // ignore: cast_nullable_to_non_nullable
              as List<EarningOpportunity>,
      activeEvents: null == activeEvents
          ? _value.activeEvents
          : activeEvents // ignore: cast_nullable_to_non_nullable
              as List<SpecialEvent>,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyRecommendation>,
      insights: null == insights
          ? _value.insights
          : insights // ignore: cast_nullable_to_non_nullable
              as LoyaltyInsights,
    ) as $Val);
  }

  /// Create a copy of LoyaltyDashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoyaltyStatusCopyWith<$Res> get status {
    return $LoyaltyStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  /// Create a copy of LoyaltyDashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoyaltyInsightsCopyWith<$Res> get insights {
    return $LoyaltyInsightsCopyWith<$Res>(_value.insights, (value) {
      return _then(_value.copyWith(insights: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoyaltyDashboardImplCopyWith<$Res>
    implements $LoyaltyDashboardCopyWith<$Res> {
  factory _$$LoyaltyDashboardImplCopyWith(_$LoyaltyDashboardImpl value,
          $Res Function(_$LoyaltyDashboardImpl) then) =
      __$$LoyaltyDashboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoyaltyStatus status,
      List<LoyaltyReward> featuredRewards,
      List<Achievement> nearbyAchievements,
      List<EarningOpportunity> earningOpportunities,
      List<SpecialEvent> activeEvents,
      List<LoyaltyRecommendation> recommendations,
      LoyaltyInsights insights});

  @override
  $LoyaltyStatusCopyWith<$Res> get status;
  @override
  $LoyaltyInsightsCopyWith<$Res> get insights;
}

/// @nodoc
class __$$LoyaltyDashboardImplCopyWithImpl<$Res>
    extends _$LoyaltyDashboardCopyWithImpl<$Res, _$LoyaltyDashboardImpl>
    implements _$$LoyaltyDashboardImplCopyWith<$Res> {
  __$$LoyaltyDashboardImplCopyWithImpl(_$LoyaltyDashboardImpl _value,
      $Res Function(_$LoyaltyDashboardImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyDashboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? featuredRewards = null,
    Object? nearbyAchievements = null,
    Object? earningOpportunities = null,
    Object? activeEvents = null,
    Object? recommendations = null,
    Object? insights = null,
  }) {
    return _then(_$LoyaltyDashboardImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoyaltyStatus,
      featuredRewards: null == featuredRewards
          ? _value._featuredRewards
          : featuredRewards // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyReward>,
      nearbyAchievements: null == nearbyAchievements
          ? _value._nearbyAchievements
          : nearbyAchievements // ignore: cast_nullable_to_non_nullable
              as List<Achievement>,
      earningOpportunities: null == earningOpportunities
          ? _value._earningOpportunities
          : earningOpportunities // ignore: cast_nullable_to_non_nullable
              as List<EarningOpportunity>,
      activeEvents: null == activeEvents
          ? _value._activeEvents
          : activeEvents // ignore: cast_nullable_to_non_nullable
              as List<SpecialEvent>,
      recommendations: null == recommendations
          ? _value._recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyRecommendation>,
      insights: null == insights
          ? _value.insights
          : insights // ignore: cast_nullable_to_non_nullable
              as LoyaltyInsights,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoyaltyDashboardImpl implements _LoyaltyDashboard {
  const _$LoyaltyDashboardImpl(
      {required this.status,
      required final List<LoyaltyReward> featuredRewards,
      required final List<Achievement> nearbyAchievements,
      required final List<EarningOpportunity> earningOpportunities,
      required final List<SpecialEvent> activeEvents,
      required final List<LoyaltyRecommendation> recommendations,
      required this.insights})
      : _featuredRewards = featuredRewards,
        _nearbyAchievements = nearbyAchievements,
        _earningOpportunities = earningOpportunities,
        _activeEvents = activeEvents,
        _recommendations = recommendations;

  factory _$LoyaltyDashboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoyaltyDashboardImplFromJson(json);

  @override
  final LoyaltyStatus status;
  final List<LoyaltyReward> _featuredRewards;
  @override
  List<LoyaltyReward> get featuredRewards {
    if (_featuredRewards is EqualUnmodifiableListView) return _featuredRewards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_featuredRewards);
  }

  final List<Achievement> _nearbyAchievements;
  @override
  List<Achievement> get nearbyAchievements {
    if (_nearbyAchievements is EqualUnmodifiableListView)
      return _nearbyAchievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nearbyAchievements);
  }

  final List<EarningOpportunity> _earningOpportunities;
  @override
  List<EarningOpportunity> get earningOpportunities {
    if (_earningOpportunities is EqualUnmodifiableListView)
      return _earningOpportunities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_earningOpportunities);
  }

  final List<SpecialEvent> _activeEvents;
  @override
  List<SpecialEvent> get activeEvents {
    if (_activeEvents is EqualUnmodifiableListView) return _activeEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeEvents);
  }

  final List<LoyaltyRecommendation> _recommendations;
  @override
  List<LoyaltyRecommendation> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  final LoyaltyInsights insights;

  @override
  String toString() {
    return 'LoyaltyDashboard(status: $status, featuredRewards: $featuredRewards, nearbyAchievements: $nearbyAchievements, earningOpportunities: $earningOpportunities, activeEvents: $activeEvents, recommendations: $recommendations, insights: $insights)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoyaltyDashboardImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._featuredRewards, _featuredRewards) &&
            const DeepCollectionEquality()
                .equals(other._nearbyAchievements, _nearbyAchievements) &&
            const DeepCollectionEquality()
                .equals(other._earningOpportunities, _earningOpportunities) &&
            const DeepCollectionEquality()
                .equals(other._activeEvents, _activeEvents) &&
            const DeepCollectionEquality()
                .equals(other._recommendations, _recommendations) &&
            (identical(other.insights, insights) ||
                other.insights == insights));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_featuredRewards),
      const DeepCollectionEquality().hash(_nearbyAchievements),
      const DeepCollectionEquality().hash(_earningOpportunities),
      const DeepCollectionEquality().hash(_activeEvents),
      const DeepCollectionEquality().hash(_recommendations),
      insights);

  /// Create a copy of LoyaltyDashboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoyaltyDashboardImplCopyWith<_$LoyaltyDashboardImpl> get copyWith =>
      __$$LoyaltyDashboardImplCopyWithImpl<_$LoyaltyDashboardImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoyaltyDashboardImplToJson(
      this,
    );
  }
}

abstract class _LoyaltyDashboard implements LoyaltyDashboard {
  const factory _LoyaltyDashboard(
      {required final LoyaltyStatus status,
      required final List<LoyaltyReward> featuredRewards,
      required final List<Achievement> nearbyAchievements,
      required final List<EarningOpportunity> earningOpportunities,
      required final List<SpecialEvent> activeEvents,
      required final List<LoyaltyRecommendation> recommendations,
      required final LoyaltyInsights insights}) = _$LoyaltyDashboardImpl;

  factory _LoyaltyDashboard.fromJson(Map<String, dynamic> json) =
      _$LoyaltyDashboardImpl.fromJson;

  @override
  LoyaltyStatus get status;
  @override
  List<LoyaltyReward> get featuredRewards;
  @override
  List<Achievement> get nearbyAchievements;
  @override
  List<EarningOpportunity> get earningOpportunities;
  @override
  List<SpecialEvent> get activeEvents;
  @override
  List<LoyaltyRecommendation> get recommendations;
  @override
  LoyaltyInsights get insights;

  /// Create a copy of LoyaltyDashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoyaltyDashboardImplCopyWith<_$LoyaltyDashboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PointsEarnResult _$PointsEarnResultFromJson(Map<String, dynamic> json) {
  return _PointsEarnResult.fromJson(json);
}

/// @nodoc
mixin _$PointsEarnResult {
  String get transactionId => throw _privateConstructorUsedError;
  int get pointsEarned => throw _privateConstructorUsedError;
  int get totalPoints => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get bonusDescription => throw _privateConstructorUsedError;
  int? get bonusPoints => throw _privateConstructorUsedError;
  bool? get tierUpgraded => throw _privateConstructorUsedError;
  LoyaltyTier? get newTier => throw _privateConstructorUsedError;

  /// Serializes this PointsEarnResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PointsEarnResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointsEarnResultCopyWith<PointsEarnResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointsEarnResultCopyWith<$Res> {
  factory $PointsEarnResultCopyWith(
          PointsEarnResult value, $Res Function(PointsEarnResult) then) =
      _$PointsEarnResultCopyWithImpl<$Res, PointsEarnResult>;
  @useResult
  $Res call(
      {String transactionId,
      int pointsEarned,
      int totalPoints,
      String action,
      DateTime timestamp,
      String? bonusDescription,
      int? bonusPoints,
      bool? tierUpgraded,
      LoyaltyTier? newTier});

  $LoyaltyTierCopyWith<$Res>? get newTier;
}

/// @nodoc
class _$PointsEarnResultCopyWithImpl<$Res, $Val extends PointsEarnResult>
    implements $PointsEarnResultCopyWith<$Res> {
  _$PointsEarnResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointsEarnResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? pointsEarned = null,
    Object? totalPoints = null,
    Object? action = null,
    Object? timestamp = null,
    Object? bonusDescription = freezed,
    Object? bonusPoints = freezed,
    Object? tierUpgraded = freezed,
    Object? newTier = freezed,
  }) {
    return _then(_value.copyWith(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bonusDescription: freezed == bonusDescription
          ? _value.bonusDescription
          : bonusDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      bonusPoints: freezed == bonusPoints
          ? _value.bonusPoints
          : bonusPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      tierUpgraded: freezed == tierUpgraded
          ? _value.tierUpgraded
          : tierUpgraded // ignore: cast_nullable_to_non_nullable
              as bool?,
      newTier: freezed == newTier
          ? _value.newTier
          : newTier // ignore: cast_nullable_to_non_nullable
              as LoyaltyTier?,
    ) as $Val);
  }

  /// Create a copy of PointsEarnResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoyaltyTierCopyWith<$Res>? get newTier {
    if (_value.newTier == null) {
      return null;
    }

    return $LoyaltyTierCopyWith<$Res>(_value.newTier!, (value) {
      return _then(_value.copyWith(newTier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PointsEarnResultImplCopyWith<$Res>
    implements $PointsEarnResultCopyWith<$Res> {
  factory _$$PointsEarnResultImplCopyWith(_$PointsEarnResultImpl value,
          $Res Function(_$PointsEarnResultImpl) then) =
      __$$PointsEarnResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String transactionId,
      int pointsEarned,
      int totalPoints,
      String action,
      DateTime timestamp,
      String? bonusDescription,
      int? bonusPoints,
      bool? tierUpgraded,
      LoyaltyTier? newTier});

  @override
  $LoyaltyTierCopyWith<$Res>? get newTier;
}

/// @nodoc
class __$$PointsEarnResultImplCopyWithImpl<$Res>
    extends _$PointsEarnResultCopyWithImpl<$Res, _$PointsEarnResultImpl>
    implements _$$PointsEarnResultImplCopyWith<$Res> {
  __$$PointsEarnResultImplCopyWithImpl(_$PointsEarnResultImpl _value,
      $Res Function(_$PointsEarnResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointsEarnResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? pointsEarned = null,
    Object? totalPoints = null,
    Object? action = null,
    Object? timestamp = null,
    Object? bonusDescription = freezed,
    Object? bonusPoints = freezed,
    Object? tierUpgraded = freezed,
    Object? newTier = freezed,
  }) {
    return _then(_$PointsEarnResultImpl(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bonusDescription: freezed == bonusDescription
          ? _value.bonusDescription
          : bonusDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      bonusPoints: freezed == bonusPoints
          ? _value.bonusPoints
          : bonusPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      tierUpgraded: freezed == tierUpgraded
          ? _value.tierUpgraded
          : tierUpgraded // ignore: cast_nullable_to_non_nullable
              as bool?,
      newTier: freezed == newTier
          ? _value.newTier
          : newTier // ignore: cast_nullable_to_non_nullable
              as LoyaltyTier?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointsEarnResultImpl implements _PointsEarnResult {
  const _$PointsEarnResultImpl(
      {required this.transactionId,
      required this.pointsEarned,
      required this.totalPoints,
      required this.action,
      required this.timestamp,
      this.bonusDescription,
      this.bonusPoints,
      this.tierUpgraded,
      this.newTier});

  factory _$PointsEarnResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointsEarnResultImplFromJson(json);

  @override
  final String transactionId;
  @override
  final int pointsEarned;
  @override
  final int totalPoints;
  @override
  final String action;
  @override
  final DateTime timestamp;
  @override
  final String? bonusDescription;
  @override
  final int? bonusPoints;
  @override
  final bool? tierUpgraded;
  @override
  final LoyaltyTier? newTier;

  @override
  String toString() {
    return 'PointsEarnResult(transactionId: $transactionId, pointsEarned: $pointsEarned, totalPoints: $totalPoints, action: $action, timestamp: $timestamp, bonusDescription: $bonusDescription, bonusPoints: $bonusPoints, tierUpgraded: $tierUpgraded, newTier: $newTier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointsEarnResultImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.pointsEarned, pointsEarned) ||
                other.pointsEarned == pointsEarned) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.bonusDescription, bonusDescription) ||
                other.bonusDescription == bonusDescription) &&
            (identical(other.bonusPoints, bonusPoints) ||
                other.bonusPoints == bonusPoints) &&
            (identical(other.tierUpgraded, tierUpgraded) ||
                other.tierUpgraded == tierUpgraded) &&
            (identical(other.newTier, newTier) || other.newTier == newTier));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionId,
      pointsEarned,
      totalPoints,
      action,
      timestamp,
      bonusDescription,
      bonusPoints,
      tierUpgraded,
      newTier);

  /// Create a copy of PointsEarnResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointsEarnResultImplCopyWith<_$PointsEarnResultImpl> get copyWith =>
      __$$PointsEarnResultImplCopyWithImpl<_$PointsEarnResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointsEarnResultImplToJson(
      this,
    );
  }
}

abstract class _PointsEarnResult implements PointsEarnResult {
  const factory _PointsEarnResult(
      {required final String transactionId,
      required final int pointsEarned,
      required final int totalPoints,
      required final String action,
      required final DateTime timestamp,
      final String? bonusDescription,
      final int? bonusPoints,
      final bool? tierUpgraded,
      final LoyaltyTier? newTier}) = _$PointsEarnResultImpl;

  factory _PointsEarnResult.fromJson(Map<String, dynamic> json) =
      _$PointsEarnResultImpl.fromJson;

  @override
  String get transactionId;
  @override
  int get pointsEarned;
  @override
  int get totalPoints;
  @override
  String get action;
  @override
  DateTime get timestamp;
  @override
  String? get bonusDescription;
  @override
  int? get bonusPoints;
  @override
  bool? get tierUpgraded;
  @override
  LoyaltyTier? get newTier;

  /// Create a copy of PointsEarnResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointsEarnResultImplCopyWith<_$PointsEarnResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RewardEligibility _$RewardEligibilityFromJson(Map<String, dynamic> json) {
  return _RewardEligibility.fromJson(json);
}

/// @nodoc
mixin _$RewardEligibility {
  bool get isEligible => throw _privateConstructorUsedError;
  String get rewardId => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  int? get pointsNeeded => throw _privateConstructorUsedError;
  List<String>? get missingRequirements => throw _privateConstructorUsedError;
  DateTime? get availableFrom => throw _privateConstructorUsedError;

  /// Serializes this RewardEligibility to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RewardEligibility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RewardEligibilityCopyWith<RewardEligibility> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardEligibilityCopyWith<$Res> {
  factory $RewardEligibilityCopyWith(
          RewardEligibility value, $Res Function(RewardEligibility) then) =
      _$RewardEligibilityCopyWithImpl<$Res, RewardEligibility>;
  @useResult
  $Res call(
      {bool isEligible,
      String rewardId,
      String? reason,
      int? pointsNeeded,
      List<String>? missingRequirements,
      DateTime? availableFrom});
}

/// @nodoc
class _$RewardEligibilityCopyWithImpl<$Res, $Val extends RewardEligibility>
    implements $RewardEligibilityCopyWith<$Res> {
  _$RewardEligibilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RewardEligibility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEligible = null,
    Object? rewardId = null,
    Object? reason = freezed,
    Object? pointsNeeded = freezed,
    Object? missingRequirements = freezed,
    Object? availableFrom = freezed,
  }) {
    return _then(_value.copyWith(
      isEligible: null == isEligible
          ? _value.isEligible
          : isEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      rewardId: null == rewardId
          ? _value.rewardId
          : rewardId // ignore: cast_nullable_to_non_nullable
              as String,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      pointsNeeded: freezed == pointsNeeded
          ? _value.pointsNeeded
          : pointsNeeded // ignore: cast_nullable_to_non_nullable
              as int?,
      missingRequirements: freezed == missingRequirements
          ? _value.missingRequirements
          : missingRequirements // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      availableFrom: freezed == availableFrom
          ? _value.availableFrom
          : availableFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RewardEligibilityImplCopyWith<$Res>
    implements $RewardEligibilityCopyWith<$Res> {
  factory _$$RewardEligibilityImplCopyWith(_$RewardEligibilityImpl value,
          $Res Function(_$RewardEligibilityImpl) then) =
      __$$RewardEligibilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isEligible,
      String rewardId,
      String? reason,
      int? pointsNeeded,
      List<String>? missingRequirements,
      DateTime? availableFrom});
}

/// @nodoc
class __$$RewardEligibilityImplCopyWithImpl<$Res>
    extends _$RewardEligibilityCopyWithImpl<$Res, _$RewardEligibilityImpl>
    implements _$$RewardEligibilityImplCopyWith<$Res> {
  __$$RewardEligibilityImplCopyWithImpl(_$RewardEligibilityImpl _value,
      $Res Function(_$RewardEligibilityImpl) _then)
      : super(_value, _then);

  /// Create a copy of RewardEligibility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEligible = null,
    Object? rewardId = null,
    Object? reason = freezed,
    Object? pointsNeeded = freezed,
    Object? missingRequirements = freezed,
    Object? availableFrom = freezed,
  }) {
    return _then(_$RewardEligibilityImpl(
      isEligible: null == isEligible
          ? _value.isEligible
          : isEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      rewardId: null == rewardId
          ? _value.rewardId
          : rewardId // ignore: cast_nullable_to_non_nullable
              as String,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      pointsNeeded: freezed == pointsNeeded
          ? _value.pointsNeeded
          : pointsNeeded // ignore: cast_nullable_to_non_nullable
              as int?,
      missingRequirements: freezed == missingRequirements
          ? _value._missingRequirements
          : missingRequirements // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      availableFrom: freezed == availableFrom
          ? _value.availableFrom
          : availableFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RewardEligibilityImpl implements _RewardEligibility {
  const _$RewardEligibilityImpl(
      {required this.isEligible,
      required this.rewardId,
      this.reason,
      this.pointsNeeded,
      final List<String>? missingRequirements,
      this.availableFrom})
      : _missingRequirements = missingRequirements;

  factory _$RewardEligibilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RewardEligibilityImplFromJson(json);

  @override
  final bool isEligible;
  @override
  final String rewardId;
  @override
  final String? reason;
  @override
  final int? pointsNeeded;
  final List<String>? _missingRequirements;
  @override
  List<String>? get missingRequirements {
    final value = _missingRequirements;
    if (value == null) return null;
    if (_missingRequirements is EqualUnmodifiableListView)
      return _missingRequirements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? availableFrom;

  @override
  String toString() {
    return 'RewardEligibility(isEligible: $isEligible, rewardId: $rewardId, reason: $reason, pointsNeeded: $pointsNeeded, missingRequirements: $missingRequirements, availableFrom: $availableFrom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardEligibilityImpl &&
            (identical(other.isEligible, isEligible) ||
                other.isEligible == isEligible) &&
            (identical(other.rewardId, rewardId) ||
                other.rewardId == rewardId) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.pointsNeeded, pointsNeeded) ||
                other.pointsNeeded == pointsNeeded) &&
            const DeepCollectionEquality()
                .equals(other._missingRequirements, _missingRequirements) &&
            (identical(other.availableFrom, availableFrom) ||
                other.availableFrom == availableFrom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isEligible,
      rewardId,
      reason,
      pointsNeeded,
      const DeepCollectionEquality().hash(_missingRequirements),
      availableFrom);

  /// Create a copy of RewardEligibility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardEligibilityImplCopyWith<_$RewardEligibilityImpl> get copyWith =>
      __$$RewardEligibilityImplCopyWithImpl<_$RewardEligibilityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RewardEligibilityImplToJson(
      this,
    );
  }
}

abstract class _RewardEligibility implements RewardEligibility {
  const factory _RewardEligibility(
      {required final bool isEligible,
      required final String rewardId,
      final String? reason,
      final int? pointsNeeded,
      final List<String>? missingRequirements,
      final DateTime? availableFrom}) = _$RewardEligibilityImpl;

  factory _RewardEligibility.fromJson(Map<String, dynamic> json) =
      _$RewardEligibilityImpl.fromJson;

  @override
  bool get isEligible;
  @override
  String get rewardId;
  @override
  String? get reason;
  @override
  int? get pointsNeeded;
  @override
  List<String>? get missingRequirements;
  @override
  DateTime? get availableFrom;

  /// Create a copy of RewardEligibility
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RewardEligibilityImplCopyWith<_$RewardEligibilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EarningOpportunity _$EarningOpportunityFromJson(Map<String, dynamic> json) {
  return _EarningOpportunity.fromJson(json);
}

/// @nodoc
mixin _$EarningOpportunity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  int get pointsReward => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  int get maxCompletions => throw _privateConstructorUsedError;
  int get currentCompletions => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this EarningOpportunity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EarningOpportunity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EarningOpportunityCopyWith<EarningOpportunity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EarningOpportunityCopyWith<$Res> {
  factory $EarningOpportunityCopyWith(
          EarningOpportunity value, $Res Function(EarningOpportunity) then) =
      _$EarningOpportunityCopyWithImpl<$Res, EarningOpportunity>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String action,
      int pointsReward,
      String category,
      String icon,
      bool isCompleted,
      DateTime? completedAt,
      DateTime? expiresAt,
      int maxCompletions,
      int currentCompletions,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$EarningOpportunityCopyWithImpl<$Res, $Val extends EarningOpportunity>
    implements $EarningOpportunityCopyWith<$Res> {
  _$EarningOpportunityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EarningOpportunity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? action = null,
    Object? pointsReward = null,
    Object? category = null,
    Object? icon = null,
    Object? isCompleted = null,
    Object? completedAt = freezed,
    Object? expiresAt = freezed,
    Object? maxCompletions = null,
    Object? currentCompletions = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      pointsReward: null == pointsReward
          ? _value.pointsReward
          : pointsReward // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      maxCompletions: null == maxCompletions
          ? _value.maxCompletions
          : maxCompletions // ignore: cast_nullable_to_non_nullable
              as int,
      currentCompletions: null == currentCompletions
          ? _value.currentCompletions
          : currentCompletions // ignore: cast_nullable_to_non_nullable
              as int,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EarningOpportunityImplCopyWith<$Res>
    implements $EarningOpportunityCopyWith<$Res> {
  factory _$$EarningOpportunityImplCopyWith(_$EarningOpportunityImpl value,
          $Res Function(_$EarningOpportunityImpl) then) =
      __$$EarningOpportunityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String action,
      int pointsReward,
      String category,
      String icon,
      bool isCompleted,
      DateTime? completedAt,
      DateTime? expiresAt,
      int maxCompletions,
      int currentCompletions,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$EarningOpportunityImplCopyWithImpl<$Res>
    extends _$EarningOpportunityCopyWithImpl<$Res, _$EarningOpportunityImpl>
    implements _$$EarningOpportunityImplCopyWith<$Res> {
  __$$EarningOpportunityImplCopyWithImpl(_$EarningOpportunityImpl _value,
      $Res Function(_$EarningOpportunityImpl) _then)
      : super(_value, _then);

  /// Create a copy of EarningOpportunity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? action = null,
    Object? pointsReward = null,
    Object? category = null,
    Object? icon = null,
    Object? isCompleted = null,
    Object? completedAt = freezed,
    Object? expiresAt = freezed,
    Object? maxCompletions = null,
    Object? currentCompletions = null,
    Object? metadata = freezed,
  }) {
    return _then(_$EarningOpportunityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      pointsReward: null == pointsReward
          ? _value.pointsReward
          : pointsReward // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      maxCompletions: null == maxCompletions
          ? _value.maxCompletions
          : maxCompletions // ignore: cast_nullable_to_non_nullable
              as int,
      currentCompletions: null == currentCompletions
          ? _value.currentCompletions
          : currentCompletions // ignore: cast_nullable_to_non_nullable
              as int,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EarningOpportunityImpl implements _EarningOpportunity {
  const _$EarningOpportunityImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.action,
      required this.pointsReward,
      required this.category,
      required this.icon,
      required this.isCompleted,
      required this.completedAt,
      required this.expiresAt,
      this.maxCompletions = 1,
      this.currentCompletions = 0,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$EarningOpportunityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EarningOpportunityImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String action;
  @override
  final int pointsReward;
  @override
  final String category;
  @override
  final String icon;
  @override
  final bool isCompleted;
  @override
  final DateTime? completedAt;
  @override
  final DateTime? expiresAt;
  @override
  @JsonKey()
  final int maxCompletions;
  @override
  @JsonKey()
  final int currentCompletions;
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
    return 'EarningOpportunity(id: $id, title: $title, description: $description, action: $action, pointsReward: $pointsReward, category: $category, icon: $icon, isCompleted: $isCompleted, completedAt: $completedAt, expiresAt: $expiresAt, maxCompletions: $maxCompletions, currentCompletions: $currentCompletions, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EarningOpportunityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.pointsReward, pointsReward) ||
                other.pointsReward == pointsReward) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.maxCompletions, maxCompletions) ||
                other.maxCompletions == maxCompletions) &&
            (identical(other.currentCompletions, currentCompletions) ||
                other.currentCompletions == currentCompletions) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      action,
      pointsReward,
      category,
      icon,
      isCompleted,
      completedAt,
      expiresAt,
      maxCompletions,
      currentCompletions,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of EarningOpportunity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EarningOpportunityImplCopyWith<_$EarningOpportunityImpl> get copyWith =>
      __$$EarningOpportunityImplCopyWithImpl<_$EarningOpportunityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EarningOpportunityImplToJson(
      this,
    );
  }
}

abstract class _EarningOpportunity implements EarningOpportunity {
  const factory _EarningOpportunity(
      {required final String id,
      required final String title,
      required final String description,
      required final String action,
      required final int pointsReward,
      required final String category,
      required final String icon,
      required final bool isCompleted,
      required final DateTime? completedAt,
      required final DateTime? expiresAt,
      final int maxCompletions,
      final int currentCompletions,
      final Map<String, dynamic>? metadata}) = _$EarningOpportunityImpl;

  factory _EarningOpportunity.fromJson(Map<String, dynamic> json) =
      _$EarningOpportunityImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get action;
  @override
  int get pointsReward;
  @override
  String get category;
  @override
  String get icon;
  @override
  bool get isCompleted;
  @override
  DateTime? get completedAt;
  @override
  DateTime? get expiresAt;
  @override
  int get maxCompletions;
  @override
  int get currentCompletions;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of EarningOpportunity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EarningOpportunityImplCopyWith<_$EarningOpportunityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShareResult _$ShareResultFromJson(Map<String, dynamic> json) {
  return _ShareResult.fromJson(json);
}

/// @nodoc
mixin _$ShareResult {
  String get shareId => throw _privateConstructorUsedError;
  String get shareUrl => throw _privateConstructorUsedError;
  String get referralCode => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;
  DateTime get sharedAt => throw _privateConstructorUsedError;
  int? get bonusPoints => throw _privateConstructorUsedError;

  /// Serializes this ShareResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShareResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShareResultCopyWith<ShareResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareResultCopyWith<$Res> {
  factory $ShareResultCopyWith(
          ShareResult value, $Res Function(ShareResult) then) =
      _$ShareResultCopyWithImpl<$Res, ShareResult>;
  @useResult
  $Res call(
      {String shareId,
      String shareUrl,
      String referralCode,
      String platform,
      DateTime sharedAt,
      int? bonusPoints});
}

/// @nodoc
class _$ShareResultCopyWithImpl<$Res, $Val extends ShareResult>
    implements $ShareResultCopyWith<$Res> {
  _$ShareResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShareResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shareId = null,
    Object? shareUrl = null,
    Object? referralCode = null,
    Object? platform = null,
    Object? sharedAt = null,
    Object? bonusPoints = freezed,
  }) {
    return _then(_value.copyWith(
      shareId: null == shareId
          ? _value.shareId
          : shareId // ignore: cast_nullable_to_non_nullable
              as String,
      shareUrl: null == shareUrl
          ? _value.shareUrl
          : shareUrl // ignore: cast_nullable_to_non_nullable
              as String,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      sharedAt: null == sharedAt
          ? _value.sharedAt
          : sharedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bonusPoints: freezed == bonusPoints
          ? _value.bonusPoints
          : bonusPoints // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShareResultImplCopyWith<$Res>
    implements $ShareResultCopyWith<$Res> {
  factory _$$ShareResultImplCopyWith(
          _$ShareResultImpl value, $Res Function(_$ShareResultImpl) then) =
      __$$ShareResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String shareId,
      String shareUrl,
      String referralCode,
      String platform,
      DateTime sharedAt,
      int? bonusPoints});
}

/// @nodoc
class __$$ShareResultImplCopyWithImpl<$Res>
    extends _$ShareResultCopyWithImpl<$Res, _$ShareResultImpl>
    implements _$$ShareResultImplCopyWith<$Res> {
  __$$ShareResultImplCopyWithImpl(
      _$ShareResultImpl _value, $Res Function(_$ShareResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShareResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shareId = null,
    Object? shareUrl = null,
    Object? referralCode = null,
    Object? platform = null,
    Object? sharedAt = null,
    Object? bonusPoints = freezed,
  }) {
    return _then(_$ShareResultImpl(
      shareId: null == shareId
          ? _value.shareId
          : shareId // ignore: cast_nullable_to_non_nullable
              as String,
      shareUrl: null == shareUrl
          ? _value.shareUrl
          : shareUrl // ignore: cast_nullable_to_non_nullable
              as String,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      sharedAt: null == sharedAt
          ? _value.sharedAt
          : sharedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bonusPoints: freezed == bonusPoints
          ? _value.bonusPoints
          : bonusPoints // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShareResultImpl implements _ShareResult {
  const _$ShareResultImpl(
      {required this.shareId,
      required this.shareUrl,
      required this.referralCode,
      required this.platform,
      required this.sharedAt,
      this.bonusPoints});

  factory _$ShareResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShareResultImplFromJson(json);

  @override
  final String shareId;
  @override
  final String shareUrl;
  @override
  final String referralCode;
  @override
  final String platform;
  @override
  final DateTime sharedAt;
  @override
  final int? bonusPoints;

  @override
  String toString() {
    return 'ShareResult(shareId: $shareId, shareUrl: $shareUrl, referralCode: $referralCode, platform: $platform, sharedAt: $sharedAt, bonusPoints: $bonusPoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShareResultImpl &&
            (identical(other.shareId, shareId) || other.shareId == shareId) &&
            (identical(other.shareUrl, shareUrl) ||
                other.shareUrl == shareUrl) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.sharedAt, sharedAt) ||
                other.sharedAt == sharedAt) &&
            (identical(other.bonusPoints, bonusPoints) ||
                other.bonusPoints == bonusPoints));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, shareId, shareUrl, referralCode,
      platform, sharedAt, bonusPoints);

  /// Create a copy of ShareResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShareResultImplCopyWith<_$ShareResultImpl> get copyWith =>
      __$$ShareResultImplCopyWithImpl<_$ShareResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShareResultImplToJson(
      this,
    );
  }
}

abstract class _ShareResult implements ShareResult {
  const factory _ShareResult(
      {required final String shareId,
      required final String shareUrl,
      required final String referralCode,
      required final String platform,
      required final DateTime sharedAt,
      final int? bonusPoints}) = _$ShareResultImpl;

  factory _ShareResult.fromJson(Map<String, dynamic> json) =
      _$ShareResultImpl.fromJson;

  @override
  String get shareId;
  @override
  String get shareUrl;
  @override
  String get referralCode;
  @override
  String get platform;
  @override
  DateTime get sharedAt;
  @override
  int? get bonusPoints;

  /// Create a copy of ShareResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShareResultImplCopyWith<_$ShareResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoyaltyRecommendation _$LoyaltyRecommendationFromJson(
    Map<String, dynamic> json) {
  return _LoyaltyRecommendation.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyRecommendation {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;

  /// Serializes this LoyaltyRecommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoyaltyRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoyaltyRecommendationCopyWith<LoyaltyRecommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyRecommendationCopyWith<$Res> {
  factory $LoyaltyRecommendationCopyWith(LoyaltyRecommendation value,
          $Res Function(LoyaltyRecommendation) then) =
      _$LoyaltyRecommendationCopyWithImpl<$Res, LoyaltyRecommendation>;
  @useResult
  $Res call(
      {String id,
      String type,
      String title,
      String description,
      String action,
      int priority,
      String icon,
      Map<String, dynamic>? data,
      DateTime? expiresAt});
}

/// @nodoc
class _$LoyaltyRecommendationCopyWithImpl<$Res,
        $Val extends LoyaltyRecommendation>
    implements $LoyaltyRecommendationCopyWith<$Res> {
  _$LoyaltyRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoyaltyRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? action = null,
    Object? priority = null,
    Object? icon = null,
    Object? data = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoyaltyRecommendationImplCopyWith<$Res>
    implements $LoyaltyRecommendationCopyWith<$Res> {
  factory _$$LoyaltyRecommendationImplCopyWith(
          _$LoyaltyRecommendationImpl value,
          $Res Function(_$LoyaltyRecommendationImpl) then) =
      __$$LoyaltyRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String title,
      String description,
      String action,
      int priority,
      String icon,
      Map<String, dynamic>? data,
      DateTime? expiresAt});
}

/// @nodoc
class __$$LoyaltyRecommendationImplCopyWithImpl<$Res>
    extends _$LoyaltyRecommendationCopyWithImpl<$Res,
        _$LoyaltyRecommendationImpl>
    implements _$$LoyaltyRecommendationImplCopyWith<$Res> {
  __$$LoyaltyRecommendationImplCopyWithImpl(_$LoyaltyRecommendationImpl _value,
      $Res Function(_$LoyaltyRecommendationImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? action = null,
    Object? priority = null,
    Object? icon = null,
    Object? data = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(_$LoyaltyRecommendationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoyaltyRecommendationImpl implements _LoyaltyRecommendation {
  const _$LoyaltyRecommendationImpl(
      {required this.id,
      required this.type,
      required this.title,
      required this.description,
      required this.action,
      required this.priority,
      required this.icon,
      final Map<String, dynamic>? data,
      this.expiresAt})
      : _data = data;

  factory _$LoyaltyRecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoyaltyRecommendationImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String title;
  @override
  final String description;
  @override
  final String action;
  @override
  final int priority;
  @override
  final String icon;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime? expiresAt;

  @override
  String toString() {
    return 'LoyaltyRecommendation(id: $id, type: $type, title: $title, description: $description, action: $action, priority: $priority, icon: $icon, data: $data, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoyaltyRecommendationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      title,
      description,
      action,
      priority,
      icon,
      const DeepCollectionEquality().hash(_data),
      expiresAt);

  /// Create a copy of LoyaltyRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoyaltyRecommendationImplCopyWith<_$LoyaltyRecommendationImpl>
      get copyWith => __$$LoyaltyRecommendationImplCopyWithImpl<
          _$LoyaltyRecommendationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoyaltyRecommendationImplToJson(
      this,
    );
  }
}

abstract class _LoyaltyRecommendation implements LoyaltyRecommendation {
  const factory _LoyaltyRecommendation(
      {required final String id,
      required final String type,
      required final String title,
      required final String description,
      required final String action,
      required final int priority,
      required final String icon,
      final Map<String, dynamic>? data,
      final DateTime? expiresAt}) = _$LoyaltyRecommendationImpl;

  factory _LoyaltyRecommendation.fromJson(Map<String, dynamic> json) =
      _$LoyaltyRecommendationImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get title;
  @override
  String get description;
  @override
  String get action;
  @override
  int get priority;
  @override
  String get icon;
  @override
  Map<String, dynamic>? get data;
  @override
  DateTime? get expiresAt;

  /// Create a copy of LoyaltyRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoyaltyRecommendationImplCopyWith<_$LoyaltyRecommendationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SpecialEvent _$SpecialEventFromJson(Map<String, dynamic> json) {
  return _SpecialEvent.fromJson(json);
}

/// @nodoc
mixin _$SpecialEvent {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  Map<String, dynamic> get rules => throw _privateConstructorUsedError;
  List<EventReward> get rewards => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String get bannerImage => throw _privateConstructorUsedError;
  double get pointsMultiplier => throw _privateConstructorUsedError;

  /// Serializes this SpecialEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpecialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecialEventCopyWith<SpecialEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialEventCopyWith<$Res> {
  factory $SpecialEventCopyWith(
          SpecialEvent value, $Res Function(SpecialEvent) then) =
      _$SpecialEventCopyWithImpl<$Res, SpecialEvent>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String type,
      DateTime startDate,
      DateTime endDate,
      Map<String, dynamic> rules,
      List<EventReward> rewards,
      bool isActive,
      String bannerImage,
      double pointsMultiplier});
}

/// @nodoc
class _$SpecialEventCopyWithImpl<$Res, $Val extends SpecialEvent>
    implements $SpecialEventCopyWith<$Res> {
  _$SpecialEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpecialEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? rules = null,
    Object? rewards = null,
    Object? isActive = null,
    Object? bannerImage = null,
    Object? pointsMultiplier = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rules: null == rules
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      rewards: null == rewards
          ? _value.rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as List<EventReward>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      bannerImage: null == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String,
      pointsMultiplier: null == pointsMultiplier
          ? _value.pointsMultiplier
          : pointsMultiplier // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpecialEventImplCopyWith<$Res>
    implements $SpecialEventCopyWith<$Res> {
  factory _$$SpecialEventImplCopyWith(
          _$SpecialEventImpl value, $Res Function(_$SpecialEventImpl) then) =
      __$$SpecialEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String type,
      DateTime startDate,
      DateTime endDate,
      Map<String, dynamic> rules,
      List<EventReward> rewards,
      bool isActive,
      String bannerImage,
      double pointsMultiplier});
}

/// @nodoc
class __$$SpecialEventImplCopyWithImpl<$Res>
    extends _$SpecialEventCopyWithImpl<$Res, _$SpecialEventImpl>
    implements _$$SpecialEventImplCopyWith<$Res> {
  __$$SpecialEventImplCopyWithImpl(
      _$SpecialEventImpl _value, $Res Function(_$SpecialEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpecialEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? rules = null,
    Object? rewards = null,
    Object? isActive = null,
    Object? bannerImage = null,
    Object? pointsMultiplier = null,
  }) {
    return _then(_$SpecialEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rules: null == rules
          ? _value._rules
          : rules // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      rewards: null == rewards
          ? _value._rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as List<EventReward>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      bannerImage: null == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String,
      pointsMultiplier: null == pointsMultiplier
          ? _value.pointsMultiplier
          : pointsMultiplier // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecialEventImpl implements _SpecialEvent {
  const _$SpecialEventImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.type,
      required this.startDate,
      required this.endDate,
      required final Map<String, dynamic> rules,
      required final List<EventReward> rewards,
      required this.isActive,
      required this.bannerImage,
      this.pointsMultiplier = 1.0})
      : _rules = rules,
        _rewards = rewards;

  factory _$SpecialEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecialEventImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String type;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  final Map<String, dynamic> _rules;
  @override
  Map<String, dynamic> get rules {
    if (_rules is EqualUnmodifiableMapView) return _rules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rules);
  }

  final List<EventReward> _rewards;
  @override
  List<EventReward> get rewards {
    if (_rewards is EqualUnmodifiableListView) return _rewards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rewards);
  }

  @override
  final bool isActive;
  @override
  final String bannerImage;
  @override
  @JsonKey()
  final double pointsMultiplier;

  @override
  String toString() {
    return 'SpecialEvent(id: $id, title: $title, description: $description, type: $type, startDate: $startDate, endDate: $endDate, rules: $rules, rewards: $rewards, isActive: $isActive, bannerImage: $bannerImage, pointsMultiplier: $pointsMultiplier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecialEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other._rules, _rules) &&
            const DeepCollectionEquality().equals(other._rewards, _rewards) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.bannerImage, bannerImage) ||
                other.bannerImage == bannerImage) &&
            (identical(other.pointsMultiplier, pointsMultiplier) ||
                other.pointsMultiplier == pointsMultiplier));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      type,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_rules),
      const DeepCollectionEquality().hash(_rewards),
      isActive,
      bannerImage,
      pointsMultiplier);

  /// Create a copy of SpecialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecialEventImplCopyWith<_$SpecialEventImpl> get copyWith =>
      __$$SpecialEventImplCopyWithImpl<_$SpecialEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecialEventImplToJson(
      this,
    );
  }
}

abstract class _SpecialEvent implements SpecialEvent {
  const factory _SpecialEvent(
      {required final String id,
      required final String title,
      required final String description,
      required final String type,
      required final DateTime startDate,
      required final DateTime endDate,
      required final Map<String, dynamic> rules,
      required final List<EventReward> rewards,
      required final bool isActive,
      required final String bannerImage,
      final double pointsMultiplier}) = _$SpecialEventImpl;

  factory _SpecialEvent.fromJson(Map<String, dynamic> json) =
      _$SpecialEventImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get type;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  Map<String, dynamic> get rules;
  @override
  List<EventReward> get rewards;
  @override
  bool get isActive;
  @override
  String get bannerImage;
  @override
  double get pointsMultiplier;

  /// Create a copy of SpecialEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecialEventImplCopyWith<_$SpecialEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EventReward _$EventRewardFromJson(Map<String, dynamic> json) {
  return _EventReward.fromJson(json);
}

/// @nodoc
mixin _$EventReward {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get pointsRequired => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get isUnlocked => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this EventReward to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventReward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventRewardCopyWith<EventReward> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventRewardCopyWith<$Res> {
  factory $EventRewardCopyWith(
          EventReward value, $Res Function(EventReward) then) =
      _$EventRewardCopyWithImpl<$Res, EventReward>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      int pointsRequired,
      String type,
      bool isUnlocked,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$EventRewardCopyWithImpl<$Res, $Val extends EventReward>
    implements $EventRewardCopyWith<$Res> {
  _$EventRewardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventReward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? pointsRequired = null,
    Object? type = null,
    Object? isUnlocked = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      pointsRequired: null == pointsRequired
          ? _value.pointsRequired
          : pointsRequired // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isUnlocked: null == isUnlocked
          ? _value.isUnlocked
          : isUnlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventRewardImplCopyWith<$Res>
    implements $EventRewardCopyWith<$Res> {
  factory _$$EventRewardImplCopyWith(
          _$EventRewardImpl value, $Res Function(_$EventRewardImpl) then) =
      __$$EventRewardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      int pointsRequired,
      String type,
      bool isUnlocked,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$EventRewardImplCopyWithImpl<$Res>
    extends _$EventRewardCopyWithImpl<$Res, _$EventRewardImpl>
    implements _$$EventRewardImplCopyWith<$Res> {
  __$$EventRewardImplCopyWithImpl(
      _$EventRewardImpl _value, $Res Function(_$EventRewardImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventReward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? pointsRequired = null,
    Object? type = null,
    Object? isUnlocked = null,
    Object? metadata = freezed,
  }) {
    return _then(_$EventRewardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      pointsRequired: null == pointsRequired
          ? _value.pointsRequired
          : pointsRequired // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isUnlocked: null == isUnlocked
          ? _value.isUnlocked
          : isUnlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventRewardImpl implements _EventReward {
  const _$EventRewardImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.pointsRequired,
      required this.type,
      required this.isUnlocked,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$EventRewardImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventRewardImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final int pointsRequired;
  @override
  final String type;
  @override
  final bool isUnlocked;
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
    return 'EventReward(id: $id, title: $title, description: $description, pointsRequired: $pointsRequired, type: $type, isUnlocked: $isUnlocked, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventRewardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.pointsRequired, pointsRequired) ||
                other.pointsRequired == pointsRequired) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isUnlocked, isUnlocked) ||
                other.isUnlocked == isUnlocked) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      pointsRequired,
      type,
      isUnlocked,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of EventReward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventRewardImplCopyWith<_$EventRewardImpl> get copyWith =>
      __$$EventRewardImplCopyWithImpl<_$EventRewardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventRewardImplToJson(
      this,
    );
  }
}

abstract class _EventReward implements EventReward {
  const factory _EventReward(
      {required final String id,
      required final String title,
      required final String description,
      required final int pointsRequired,
      required final String type,
      required final bool isUnlocked,
      final Map<String, dynamic>? metadata}) = _$EventRewardImpl;

  factory _EventReward.fromJson(Map<String, dynamic> json) =
      _$EventRewardImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  int get pointsRequired;
  @override
  String get type;
  @override
  bool get isUnlocked;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of EventReward
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventRewardImplCopyWith<_$EventRewardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoyaltyInsights _$LoyaltyInsightsFromJson(Map<String, dynamic> json) {
  return _LoyaltyInsights.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyInsights {
  String get mostActiveDay => throw _privateConstructorUsedError;
  String get favoriteCategory => throw _privateConstructorUsedError;
  double get averagePointsPerOrder => throw _privateConstructorUsedError;
  int get daysUntilTierExpiry => throw _privateConstructorUsedError;
  List<String> get recommendedActions => throw _privateConstructorUsedError;
  Map<String, dynamic> get spendingPattern =>
      throw _privateConstructorUsedError;
  double get savingsFromLoyalty => throw _privateConstructorUsedError;

  /// Serializes this LoyaltyInsights to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoyaltyInsights
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoyaltyInsightsCopyWith<LoyaltyInsights> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyInsightsCopyWith<$Res> {
  factory $LoyaltyInsightsCopyWith(
          LoyaltyInsights value, $Res Function(LoyaltyInsights) then) =
      _$LoyaltyInsightsCopyWithImpl<$Res, LoyaltyInsights>;
  @useResult
  $Res call(
      {String mostActiveDay,
      String favoriteCategory,
      double averagePointsPerOrder,
      int daysUntilTierExpiry,
      List<String> recommendedActions,
      Map<String, dynamic> spendingPattern,
      double savingsFromLoyalty});
}

/// @nodoc
class _$LoyaltyInsightsCopyWithImpl<$Res, $Val extends LoyaltyInsights>
    implements $LoyaltyInsightsCopyWith<$Res> {
  _$LoyaltyInsightsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoyaltyInsights
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mostActiveDay = null,
    Object? favoriteCategory = null,
    Object? averagePointsPerOrder = null,
    Object? daysUntilTierExpiry = null,
    Object? recommendedActions = null,
    Object? spendingPattern = null,
    Object? savingsFromLoyalty = null,
  }) {
    return _then(_value.copyWith(
      mostActiveDay: null == mostActiveDay
          ? _value.mostActiveDay
          : mostActiveDay // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteCategory: null == favoriteCategory
          ? _value.favoriteCategory
          : favoriteCategory // ignore: cast_nullable_to_non_nullable
              as String,
      averagePointsPerOrder: null == averagePointsPerOrder
          ? _value.averagePointsPerOrder
          : averagePointsPerOrder // ignore: cast_nullable_to_non_nullable
              as double,
      daysUntilTierExpiry: null == daysUntilTierExpiry
          ? _value.daysUntilTierExpiry
          : daysUntilTierExpiry // ignore: cast_nullable_to_non_nullable
              as int,
      recommendedActions: null == recommendedActions
          ? _value.recommendedActions
          : recommendedActions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      spendingPattern: null == spendingPattern
          ? _value.spendingPattern
          : spendingPattern // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      savingsFromLoyalty: null == savingsFromLoyalty
          ? _value.savingsFromLoyalty
          : savingsFromLoyalty // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoyaltyInsightsImplCopyWith<$Res>
    implements $LoyaltyInsightsCopyWith<$Res> {
  factory _$$LoyaltyInsightsImplCopyWith(_$LoyaltyInsightsImpl value,
          $Res Function(_$LoyaltyInsightsImpl) then) =
      __$$LoyaltyInsightsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mostActiveDay,
      String favoriteCategory,
      double averagePointsPerOrder,
      int daysUntilTierExpiry,
      List<String> recommendedActions,
      Map<String, dynamic> spendingPattern,
      double savingsFromLoyalty});
}

/// @nodoc
class __$$LoyaltyInsightsImplCopyWithImpl<$Res>
    extends _$LoyaltyInsightsCopyWithImpl<$Res, _$LoyaltyInsightsImpl>
    implements _$$LoyaltyInsightsImplCopyWith<$Res> {
  __$$LoyaltyInsightsImplCopyWithImpl(
      _$LoyaltyInsightsImpl _value, $Res Function(_$LoyaltyInsightsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyInsights
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mostActiveDay = null,
    Object? favoriteCategory = null,
    Object? averagePointsPerOrder = null,
    Object? daysUntilTierExpiry = null,
    Object? recommendedActions = null,
    Object? spendingPattern = null,
    Object? savingsFromLoyalty = null,
  }) {
    return _then(_$LoyaltyInsightsImpl(
      mostActiveDay: null == mostActiveDay
          ? _value.mostActiveDay
          : mostActiveDay // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteCategory: null == favoriteCategory
          ? _value.favoriteCategory
          : favoriteCategory // ignore: cast_nullable_to_non_nullable
              as String,
      averagePointsPerOrder: null == averagePointsPerOrder
          ? _value.averagePointsPerOrder
          : averagePointsPerOrder // ignore: cast_nullable_to_non_nullable
              as double,
      daysUntilTierExpiry: null == daysUntilTierExpiry
          ? _value.daysUntilTierExpiry
          : daysUntilTierExpiry // ignore: cast_nullable_to_non_nullable
              as int,
      recommendedActions: null == recommendedActions
          ? _value._recommendedActions
          : recommendedActions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      spendingPattern: null == spendingPattern
          ? _value._spendingPattern
          : spendingPattern // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      savingsFromLoyalty: null == savingsFromLoyalty
          ? _value.savingsFromLoyalty
          : savingsFromLoyalty // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoyaltyInsightsImpl implements _LoyaltyInsights {
  const _$LoyaltyInsightsImpl(
      {required this.mostActiveDay,
      required this.favoriteCategory,
      required this.averagePointsPerOrder,
      required this.daysUntilTierExpiry,
      required final List<String> recommendedActions,
      required final Map<String, dynamic> spendingPattern,
      required this.savingsFromLoyalty})
      : _recommendedActions = recommendedActions,
        _spendingPattern = spendingPattern;

  factory _$LoyaltyInsightsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoyaltyInsightsImplFromJson(json);

  @override
  final String mostActiveDay;
  @override
  final String favoriteCategory;
  @override
  final double averagePointsPerOrder;
  @override
  final int daysUntilTierExpiry;
  final List<String> _recommendedActions;
  @override
  List<String> get recommendedActions {
    if (_recommendedActions is EqualUnmodifiableListView)
      return _recommendedActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendedActions);
  }

  final Map<String, dynamic> _spendingPattern;
  @override
  Map<String, dynamic> get spendingPattern {
    if (_spendingPattern is EqualUnmodifiableMapView) return _spendingPattern;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_spendingPattern);
  }

  @override
  final double savingsFromLoyalty;

  @override
  String toString() {
    return 'LoyaltyInsights(mostActiveDay: $mostActiveDay, favoriteCategory: $favoriteCategory, averagePointsPerOrder: $averagePointsPerOrder, daysUntilTierExpiry: $daysUntilTierExpiry, recommendedActions: $recommendedActions, spendingPattern: $spendingPattern, savingsFromLoyalty: $savingsFromLoyalty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoyaltyInsightsImpl &&
            (identical(other.mostActiveDay, mostActiveDay) ||
                other.mostActiveDay == mostActiveDay) &&
            (identical(other.favoriteCategory, favoriteCategory) ||
                other.favoriteCategory == favoriteCategory) &&
            (identical(other.averagePointsPerOrder, averagePointsPerOrder) ||
                other.averagePointsPerOrder == averagePointsPerOrder) &&
            (identical(other.daysUntilTierExpiry, daysUntilTierExpiry) ||
                other.daysUntilTierExpiry == daysUntilTierExpiry) &&
            const DeepCollectionEquality()
                .equals(other._recommendedActions, _recommendedActions) &&
            const DeepCollectionEquality()
                .equals(other._spendingPattern, _spendingPattern) &&
            (identical(other.savingsFromLoyalty, savingsFromLoyalty) ||
                other.savingsFromLoyalty == savingsFromLoyalty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      mostActiveDay,
      favoriteCategory,
      averagePointsPerOrder,
      daysUntilTierExpiry,
      const DeepCollectionEquality().hash(_recommendedActions),
      const DeepCollectionEquality().hash(_spendingPattern),
      savingsFromLoyalty);

  /// Create a copy of LoyaltyInsights
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoyaltyInsightsImplCopyWith<_$LoyaltyInsightsImpl> get copyWith =>
      __$$LoyaltyInsightsImplCopyWithImpl<_$LoyaltyInsightsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoyaltyInsightsImplToJson(
      this,
    );
  }
}

abstract class _LoyaltyInsights implements LoyaltyInsights {
  const factory _LoyaltyInsights(
      {required final String mostActiveDay,
      required final String favoriteCategory,
      required final double averagePointsPerOrder,
      required final int daysUntilTierExpiry,
      required final List<String> recommendedActions,
      required final Map<String, dynamic> spendingPattern,
      required final double savingsFromLoyalty}) = _$LoyaltyInsightsImpl;

  factory _LoyaltyInsights.fromJson(Map<String, dynamic> json) =
      _$LoyaltyInsightsImpl.fromJson;

  @override
  String get mostActiveDay;
  @override
  String get favoriteCategory;
  @override
  double get averagePointsPerOrder;
  @override
  int get daysUntilTierExpiry;
  @override
  List<String> get recommendedActions;
  @override
  Map<String, dynamic> get spendingPattern;
  @override
  double get savingsFromLoyalty;

  /// Create a copy of LoyaltyInsights
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoyaltyInsightsImplCopyWith<_$LoyaltyInsightsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
