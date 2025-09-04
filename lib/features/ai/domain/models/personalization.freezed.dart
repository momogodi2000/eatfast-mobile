// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personalization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) {
  return _UserPreferences.fromJson(json);
}

/// @nodoc
mixin _$UserPreferences {
  String get userId => throw _privateConstructorUsedError;
  List<String> get favoriteRestaurants => throw _privateConstructorUsedError;
  List<String> get favoriteCuisines => throw _privateConstructorUsedError;
  List<String> get dietaryRestrictions => throw _privateConstructorUsedError;
  List<String> get allergens => throw _privateConstructorUsedError;
  PreferredDeliveryTime get preferredDeliveryTime =>
      throw _privateConstructorUsedError;
  BudgetRange get budgetRange => throw _privateConstructorUsedError;
  double get maxDeliveryDistance => throw _privateConstructorUsedError;
  SpiceLevel get spiceLevel => throw _privateConstructorUsedError;
  PortionSize get portionSize => throw _privateConstructorUsedError;
  bool get enableRecommendations => throw _privateConstructorUsedError;
  bool get enableSmartOrdering => throw _privateConstructorUsedError;
  bool get enableLocationBasedSuggestions => throw _privateConstructorUsedError;
  bool get enableWeatherBasedSuggestions => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this UserPreferences to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPreferencesCopyWith<UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesCopyWith<$Res> {
  factory $UserPreferencesCopyWith(
          UserPreferences value, $Res Function(UserPreferences) then) =
      _$UserPreferencesCopyWithImpl<$Res, UserPreferences>;
  @useResult
  $Res call(
      {String userId,
      List<String> favoriteRestaurants,
      List<String> favoriteCuisines,
      List<String> dietaryRestrictions,
      List<String> allergens,
      PreferredDeliveryTime preferredDeliveryTime,
      BudgetRange budgetRange,
      double maxDeliveryDistance,
      SpiceLevel spiceLevel,
      PortionSize portionSize,
      bool enableRecommendations,
      bool enableSmartOrdering,
      bool enableLocationBasedSuggestions,
      bool enableWeatherBasedSuggestions,
      DateTime? lastUpdated});
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res, $Val extends UserPreferences>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? favoriteRestaurants = null,
    Object? favoriteCuisines = null,
    Object? dietaryRestrictions = null,
    Object? allergens = null,
    Object? preferredDeliveryTime = null,
    Object? budgetRange = null,
    Object? maxDeliveryDistance = null,
    Object? spiceLevel = null,
    Object? portionSize = null,
    Object? enableRecommendations = null,
    Object? enableSmartOrdering = null,
    Object? enableLocationBasedSuggestions = null,
    Object? enableWeatherBasedSuggestions = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteRestaurants: null == favoriteRestaurants
          ? _value.favoriteRestaurants
          : favoriteRestaurants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteCuisines: null == favoriteCuisines
          ? _value.favoriteCuisines
          : favoriteCuisines // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dietaryRestrictions: null == dietaryRestrictions
          ? _value.dietaryRestrictions
          : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allergens: null == allergens
          ? _value.allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preferredDeliveryTime: null == preferredDeliveryTime
          ? _value.preferredDeliveryTime
          : preferredDeliveryTime // ignore: cast_nullable_to_non_nullable
              as PreferredDeliveryTime,
      budgetRange: null == budgetRange
          ? _value.budgetRange
          : budgetRange // ignore: cast_nullable_to_non_nullable
              as BudgetRange,
      maxDeliveryDistance: null == maxDeliveryDistance
          ? _value.maxDeliveryDistance
          : maxDeliveryDistance // ignore: cast_nullable_to_non_nullable
              as double,
      spiceLevel: null == spiceLevel
          ? _value.spiceLevel
          : spiceLevel // ignore: cast_nullable_to_non_nullable
              as SpiceLevel,
      portionSize: null == portionSize
          ? _value.portionSize
          : portionSize // ignore: cast_nullable_to_non_nullable
              as PortionSize,
      enableRecommendations: null == enableRecommendations
          ? _value.enableRecommendations
          : enableRecommendations // ignore: cast_nullable_to_non_nullable
              as bool,
      enableSmartOrdering: null == enableSmartOrdering
          ? _value.enableSmartOrdering
          : enableSmartOrdering // ignore: cast_nullable_to_non_nullable
              as bool,
      enableLocationBasedSuggestions: null == enableLocationBasedSuggestions
          ? _value.enableLocationBasedSuggestions
          : enableLocationBasedSuggestions // ignore: cast_nullable_to_non_nullable
              as bool,
      enableWeatherBasedSuggestions: null == enableWeatherBasedSuggestions
          ? _value.enableWeatherBasedSuggestions
          : enableWeatherBasedSuggestions // ignore: cast_nullable_to_non_nullable
              as bool,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPreferencesImplCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$$UserPreferencesImplCopyWith(_$UserPreferencesImpl value,
          $Res Function(_$UserPreferencesImpl) then) =
      __$$UserPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      List<String> favoriteRestaurants,
      List<String> favoriteCuisines,
      List<String> dietaryRestrictions,
      List<String> allergens,
      PreferredDeliveryTime preferredDeliveryTime,
      BudgetRange budgetRange,
      double maxDeliveryDistance,
      SpiceLevel spiceLevel,
      PortionSize portionSize,
      bool enableRecommendations,
      bool enableSmartOrdering,
      bool enableLocationBasedSuggestions,
      bool enableWeatherBasedSuggestions,
      DateTime? lastUpdated});
}

/// @nodoc
class __$$UserPreferencesImplCopyWithImpl<$Res>
    extends _$UserPreferencesCopyWithImpl<$Res, _$UserPreferencesImpl>
    implements _$$UserPreferencesImplCopyWith<$Res> {
  __$$UserPreferencesImplCopyWithImpl(
      _$UserPreferencesImpl _value, $Res Function(_$UserPreferencesImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? favoriteRestaurants = null,
    Object? favoriteCuisines = null,
    Object? dietaryRestrictions = null,
    Object? allergens = null,
    Object? preferredDeliveryTime = null,
    Object? budgetRange = null,
    Object? maxDeliveryDistance = null,
    Object? spiceLevel = null,
    Object? portionSize = null,
    Object? enableRecommendations = null,
    Object? enableSmartOrdering = null,
    Object? enableLocationBasedSuggestions = null,
    Object? enableWeatherBasedSuggestions = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$UserPreferencesImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteRestaurants: null == favoriteRestaurants
          ? _value._favoriteRestaurants
          : favoriteRestaurants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteCuisines: null == favoriteCuisines
          ? _value._favoriteCuisines
          : favoriteCuisines // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dietaryRestrictions: null == dietaryRestrictions
          ? _value._dietaryRestrictions
          : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allergens: null == allergens
          ? _value._allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preferredDeliveryTime: null == preferredDeliveryTime
          ? _value.preferredDeliveryTime
          : preferredDeliveryTime // ignore: cast_nullable_to_non_nullable
              as PreferredDeliveryTime,
      budgetRange: null == budgetRange
          ? _value.budgetRange
          : budgetRange // ignore: cast_nullable_to_non_nullable
              as BudgetRange,
      maxDeliveryDistance: null == maxDeliveryDistance
          ? _value.maxDeliveryDistance
          : maxDeliveryDistance // ignore: cast_nullable_to_non_nullable
              as double,
      spiceLevel: null == spiceLevel
          ? _value.spiceLevel
          : spiceLevel // ignore: cast_nullable_to_non_nullable
              as SpiceLevel,
      portionSize: null == portionSize
          ? _value.portionSize
          : portionSize // ignore: cast_nullable_to_non_nullable
              as PortionSize,
      enableRecommendations: null == enableRecommendations
          ? _value.enableRecommendations
          : enableRecommendations // ignore: cast_nullable_to_non_nullable
              as bool,
      enableSmartOrdering: null == enableSmartOrdering
          ? _value.enableSmartOrdering
          : enableSmartOrdering // ignore: cast_nullable_to_non_nullable
              as bool,
      enableLocationBasedSuggestions: null == enableLocationBasedSuggestions
          ? _value.enableLocationBasedSuggestions
          : enableLocationBasedSuggestions // ignore: cast_nullable_to_non_nullable
              as bool,
      enableWeatherBasedSuggestions: null == enableWeatherBasedSuggestions
          ? _value.enableWeatherBasedSuggestions
          : enableWeatherBasedSuggestions // ignore: cast_nullable_to_non_nullable
              as bool,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPreferencesImpl implements _UserPreferences {
  const _$UserPreferencesImpl(
      {required this.userId,
      final List<String> favoriteRestaurants = const [],
      final List<String> favoriteCuisines = const [],
      final List<String> dietaryRestrictions = const [],
      final List<String> allergens = const [],
      this.preferredDeliveryTime = PreferredDeliveryTime.anytime,
      this.budgetRange = BudgetRange.medium,
      this.maxDeliveryDistance = 5.0,
      this.spiceLevel = SpiceLevel.medium,
      this.portionSize = PortionSize.regular,
      this.enableRecommendations = true,
      this.enableSmartOrdering = true,
      this.enableLocationBasedSuggestions = true,
      this.enableWeatherBasedSuggestions = true,
      this.lastUpdated})
      : _favoriteRestaurants = favoriteRestaurants,
        _favoriteCuisines = favoriteCuisines,
        _dietaryRestrictions = dietaryRestrictions,
        _allergens = allergens;

  factory _$UserPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPreferencesImplFromJson(json);

  @override
  final String userId;
  final List<String> _favoriteRestaurants;
  @override
  @JsonKey()
  List<String> get favoriteRestaurants {
    if (_favoriteRestaurants is EqualUnmodifiableListView)
      return _favoriteRestaurants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteRestaurants);
  }

  final List<String> _favoriteCuisines;
  @override
  @JsonKey()
  List<String> get favoriteCuisines {
    if (_favoriteCuisines is EqualUnmodifiableListView)
      return _favoriteCuisines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteCuisines);
  }

  final List<String> _dietaryRestrictions;
  @override
  @JsonKey()
  List<String> get dietaryRestrictions {
    if (_dietaryRestrictions is EqualUnmodifiableListView)
      return _dietaryRestrictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dietaryRestrictions);
  }

  final List<String> _allergens;
  @override
  @JsonKey()
  List<String> get allergens {
    if (_allergens is EqualUnmodifiableListView) return _allergens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allergens);
  }

  @override
  @JsonKey()
  final PreferredDeliveryTime preferredDeliveryTime;
  @override
  @JsonKey()
  final BudgetRange budgetRange;
  @override
  @JsonKey()
  final double maxDeliveryDistance;
  @override
  @JsonKey()
  final SpiceLevel spiceLevel;
  @override
  @JsonKey()
  final PortionSize portionSize;
  @override
  @JsonKey()
  final bool enableRecommendations;
  @override
  @JsonKey()
  final bool enableSmartOrdering;
  @override
  @JsonKey()
  final bool enableLocationBasedSuggestions;
  @override
  @JsonKey()
  final bool enableWeatherBasedSuggestions;
  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'UserPreferences(userId: $userId, favoriteRestaurants: $favoriteRestaurants, favoriteCuisines: $favoriteCuisines, dietaryRestrictions: $dietaryRestrictions, allergens: $allergens, preferredDeliveryTime: $preferredDeliveryTime, budgetRange: $budgetRange, maxDeliveryDistance: $maxDeliveryDistance, spiceLevel: $spiceLevel, portionSize: $portionSize, enableRecommendations: $enableRecommendations, enableSmartOrdering: $enableSmartOrdering, enableLocationBasedSuggestions: $enableLocationBasedSuggestions, enableWeatherBasedSuggestions: $enableWeatherBasedSuggestions, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._favoriteRestaurants, _favoriteRestaurants) &&
            const DeepCollectionEquality()
                .equals(other._favoriteCuisines, _favoriteCuisines) &&
            const DeepCollectionEquality()
                .equals(other._dietaryRestrictions, _dietaryRestrictions) &&
            const DeepCollectionEquality()
                .equals(other._allergens, _allergens) &&
            (identical(other.preferredDeliveryTime, preferredDeliveryTime) ||
                other.preferredDeliveryTime == preferredDeliveryTime) &&
            (identical(other.budgetRange, budgetRange) ||
                other.budgetRange == budgetRange) &&
            (identical(other.maxDeliveryDistance, maxDeliveryDistance) ||
                other.maxDeliveryDistance == maxDeliveryDistance) &&
            (identical(other.spiceLevel, spiceLevel) ||
                other.spiceLevel == spiceLevel) &&
            (identical(other.portionSize, portionSize) ||
                other.portionSize == portionSize) &&
            (identical(other.enableRecommendations, enableRecommendations) ||
                other.enableRecommendations == enableRecommendations) &&
            (identical(other.enableSmartOrdering, enableSmartOrdering) ||
                other.enableSmartOrdering == enableSmartOrdering) &&
            (identical(other.enableLocationBasedSuggestions,
                    enableLocationBasedSuggestions) ||
                other.enableLocationBasedSuggestions ==
                    enableLocationBasedSuggestions) &&
            (identical(other.enableWeatherBasedSuggestions,
                    enableWeatherBasedSuggestions) ||
                other.enableWeatherBasedSuggestions ==
                    enableWeatherBasedSuggestions) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      const DeepCollectionEquality().hash(_favoriteRestaurants),
      const DeepCollectionEquality().hash(_favoriteCuisines),
      const DeepCollectionEquality().hash(_dietaryRestrictions),
      const DeepCollectionEquality().hash(_allergens),
      preferredDeliveryTime,
      budgetRange,
      maxDeliveryDistance,
      spiceLevel,
      portionSize,
      enableRecommendations,
      enableSmartOrdering,
      enableLocationBasedSuggestions,
      enableWeatherBasedSuggestions,
      lastUpdated);

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      __$$UserPreferencesImplCopyWithImpl<_$UserPreferencesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPreferencesImplToJson(
      this,
    );
  }
}

abstract class _UserPreferences implements UserPreferences {
  const factory _UserPreferences(
      {required final String userId,
      final List<String> favoriteRestaurants,
      final List<String> favoriteCuisines,
      final List<String> dietaryRestrictions,
      final List<String> allergens,
      final PreferredDeliveryTime preferredDeliveryTime,
      final BudgetRange budgetRange,
      final double maxDeliveryDistance,
      final SpiceLevel spiceLevel,
      final PortionSize portionSize,
      final bool enableRecommendations,
      final bool enableSmartOrdering,
      final bool enableLocationBasedSuggestions,
      final bool enableWeatherBasedSuggestions,
      final DateTime? lastUpdated}) = _$UserPreferencesImpl;

  factory _UserPreferences.fromJson(Map<String, dynamic> json) =
      _$UserPreferencesImpl.fromJson;

  @override
  String get userId;
  @override
  List<String> get favoriteRestaurants;
  @override
  List<String> get favoriteCuisines;
  @override
  List<String> get dietaryRestrictions;
  @override
  List<String> get allergens;
  @override
  PreferredDeliveryTime get preferredDeliveryTime;
  @override
  BudgetRange get budgetRange;
  @override
  double get maxDeliveryDistance;
  @override
  SpiceLevel get spiceLevel;
  @override
  PortionSize get portionSize;
  @override
  bool get enableRecommendations;
  @override
  bool get enableSmartOrdering;
  @override
  bool get enableLocationBasedSuggestions;
  @override
  bool get enableWeatherBasedSuggestions;
  @override
  DateTime? get lastUpdated;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SmartRecommendation _$SmartRecommendationFromJson(Map<String, dynamic> json) {
  return _SmartRecommendation.fromJson(json);
}

/// @nodoc
mixin _$SmartRecommendation {
  String get recommendationId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  RecommendationType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  List<RecommendedItem> get items => throw _privateConstructorUsedError;
  List<String> get reasons => throw _privateConstructorUsedError;
  DateTime? get validUntil => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this SmartRecommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SmartRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SmartRecommendationCopyWith<SmartRecommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartRecommendationCopyWith<$Res> {
  factory $SmartRecommendationCopyWith(
          SmartRecommendation value, $Res Function(SmartRecommendation) then) =
      _$SmartRecommendationCopyWithImpl<$Res, SmartRecommendation>;
  @useResult
  $Res call(
      {String recommendationId,
      String userId,
      RecommendationType type,
      String title,
      String description,
      double confidence,
      List<RecommendedItem> items,
      List<String> reasons,
      DateTime? validUntil,
      List<String> tags,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$SmartRecommendationCopyWithImpl<$Res, $Val extends SmartRecommendation>
    implements $SmartRecommendationCopyWith<$Res> {
  _$SmartRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SmartRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendationId = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? confidence = null,
    Object? items = null,
    Object? reasons = null,
    Object? validUntil = freezed,
    Object? tags = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      recommendationId: null == recommendationId
          ? _value.recommendationId
          : recommendationId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RecommendationType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RecommendedItem>,
      reasons: null == reasons
          ? _value.reasons
          : reasons // ignore: cast_nullable_to_non_nullable
              as List<String>,
      validUntil: freezed == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmartRecommendationImplCopyWith<$Res>
    implements $SmartRecommendationCopyWith<$Res> {
  factory _$$SmartRecommendationImplCopyWith(_$SmartRecommendationImpl value,
          $Res Function(_$SmartRecommendationImpl) then) =
      __$$SmartRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String recommendationId,
      String userId,
      RecommendationType type,
      String title,
      String description,
      double confidence,
      List<RecommendedItem> items,
      List<String> reasons,
      DateTime? validUntil,
      List<String> tags,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$SmartRecommendationImplCopyWithImpl<$Res>
    extends _$SmartRecommendationCopyWithImpl<$Res, _$SmartRecommendationImpl>
    implements _$$SmartRecommendationImplCopyWith<$Res> {
  __$$SmartRecommendationImplCopyWithImpl(_$SmartRecommendationImpl _value,
      $Res Function(_$SmartRecommendationImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmartRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendationId = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? confidence = null,
    Object? items = null,
    Object? reasons = null,
    Object? validUntil = freezed,
    Object? tags = null,
    Object? metadata = freezed,
  }) {
    return _then(_$SmartRecommendationImpl(
      recommendationId: null == recommendationId
          ? _value.recommendationId
          : recommendationId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RecommendationType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RecommendedItem>,
      reasons: null == reasons
          ? _value._reasons
          : reasons // ignore: cast_nullable_to_non_nullable
              as List<String>,
      validUntil: freezed == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SmartRecommendationImpl implements _SmartRecommendation {
  const _$SmartRecommendationImpl(
      {required this.recommendationId,
      required this.userId,
      required this.type,
      required this.title,
      required this.description,
      required this.confidence,
      required final List<RecommendedItem> items,
      required final List<String> reasons,
      this.validUntil,
      final List<String> tags = const [],
      final Map<String, dynamic>? metadata})
      : _items = items,
        _reasons = reasons,
        _tags = tags,
        _metadata = metadata;

  factory _$SmartRecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmartRecommendationImplFromJson(json);

  @override
  final String recommendationId;
  @override
  final String userId;
  @override
  final RecommendationType type;
  @override
  final String title;
  @override
  final String description;
  @override
  final double confidence;
  final List<RecommendedItem> _items;
  @override
  List<RecommendedItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<String> _reasons;
  @override
  List<String> get reasons {
    if (_reasons is EqualUnmodifiableListView) return _reasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reasons);
  }

  @override
  final DateTime? validUntil;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
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
    return 'SmartRecommendation(recommendationId: $recommendationId, userId: $userId, type: $type, title: $title, description: $description, confidence: $confidence, items: $items, reasons: $reasons, validUntil: $validUntil, tags: $tags, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmartRecommendationImpl &&
            (identical(other.recommendationId, recommendationId) ||
                other.recommendationId == recommendationId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other._reasons, _reasons) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      recommendationId,
      userId,
      type,
      title,
      description,
      confidence,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_reasons),
      validUntil,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of SmartRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SmartRecommendationImplCopyWith<_$SmartRecommendationImpl> get copyWith =>
      __$$SmartRecommendationImplCopyWithImpl<_$SmartRecommendationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmartRecommendationImplToJson(
      this,
    );
  }
}

abstract class _SmartRecommendation implements SmartRecommendation {
  const factory _SmartRecommendation(
      {required final String recommendationId,
      required final String userId,
      required final RecommendationType type,
      required final String title,
      required final String description,
      required final double confidence,
      required final List<RecommendedItem> items,
      required final List<String> reasons,
      final DateTime? validUntil,
      final List<String> tags,
      final Map<String, dynamic>? metadata}) = _$SmartRecommendationImpl;

  factory _SmartRecommendation.fromJson(Map<String, dynamic> json) =
      _$SmartRecommendationImpl.fromJson;

  @override
  String get recommendationId;
  @override
  String get userId;
  @override
  RecommendationType get type;
  @override
  String get title;
  @override
  String get description;
  @override
  double get confidence;
  @override
  List<RecommendedItem> get items;
  @override
  List<String> get reasons;
  @override
  DateTime? get validUntil;
  @override
  List<String> get tags;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of SmartRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SmartRecommendationImplCopyWith<_$SmartRecommendationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecommendedItem _$RecommendedItemFromJson(Map<String, dynamic> json) {
  return _RecommendedItem.fromJson(json);
}

/// @nodoc
mixin _$RecommendedItem {
  String get itemId => throw _privateConstructorUsedError;
  String get itemName => throw _privateConstructorUsedError;
  String get restaurantId => throw _privateConstructorUsedError;
  String get restaurantName => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get estimatedDeliveryTime => throw _privateConstructorUsedError;
  double get relevanceScore => throw _privateConstructorUsedError;

  /// Serializes this RecommendedItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecommendedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendedItemCopyWith<RecommendedItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendedItemCopyWith<$Res> {
  factory $RecommendedItemCopyWith(
          RecommendedItem value, $Res Function(RecommendedItem) then) =
      _$RecommendedItemCopyWithImpl<$Res, RecommendedItem>;
  @useResult
  $Res call(
      {String itemId,
      String itemName,
      String restaurantId,
      String restaurantName,
      double price,
      double rating,
      int reviewCount,
      String? imageUrl,
      String? description,
      int estimatedDeliveryTime,
      double relevanceScore});
}

/// @nodoc
class _$RecommendedItemCopyWithImpl<$Res, $Val extends RecommendedItem>
    implements $RecommendedItemCopyWith<$Res> {
  _$RecommendedItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecommendedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? itemName = null,
    Object? restaurantId = null,
    Object? restaurantName = null,
    Object? price = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? imageUrl = freezed,
    Object? description = freezed,
    Object? estimatedDeliveryTime = null,
    Object? relevanceScore = null,
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
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedDeliveryTime: null == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as int,
      relevanceScore: null == relevanceScore
          ? _value.relevanceScore
          : relevanceScore // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendedItemImplCopyWith<$Res>
    implements $RecommendedItemCopyWith<$Res> {
  factory _$$RecommendedItemImplCopyWith(_$RecommendedItemImpl value,
          $Res Function(_$RecommendedItemImpl) then) =
      __$$RecommendedItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String itemId,
      String itemName,
      String restaurantId,
      String restaurantName,
      double price,
      double rating,
      int reviewCount,
      String? imageUrl,
      String? description,
      int estimatedDeliveryTime,
      double relevanceScore});
}

/// @nodoc
class __$$RecommendedItemImplCopyWithImpl<$Res>
    extends _$RecommendedItemCopyWithImpl<$Res, _$RecommendedItemImpl>
    implements _$$RecommendedItemImplCopyWith<$Res> {
  __$$RecommendedItemImplCopyWithImpl(
      _$RecommendedItemImpl _value, $Res Function(_$RecommendedItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecommendedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? itemName = null,
    Object? restaurantId = null,
    Object? restaurantName = null,
    Object? price = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? imageUrl = freezed,
    Object? description = freezed,
    Object? estimatedDeliveryTime = null,
    Object? relevanceScore = null,
  }) {
    return _then(_$RecommendedItemImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedDeliveryTime: null == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as int,
      relevanceScore: null == relevanceScore
          ? _value.relevanceScore
          : relevanceScore // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendedItemImpl implements _RecommendedItem {
  const _$RecommendedItemImpl(
      {required this.itemId,
      required this.itemName,
      required this.restaurantId,
      required this.restaurantName,
      required this.price,
      required this.rating,
      required this.reviewCount,
      this.imageUrl,
      this.description,
      this.estimatedDeliveryTime = 0,
      this.relevanceScore = 0.0});

  factory _$RecommendedItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendedItemImplFromJson(json);

  @override
  final String itemId;
  @override
  final String itemName;
  @override
  final String restaurantId;
  @override
  final String restaurantName;
  @override
  final double price;
  @override
  final double rating;
  @override
  final int reviewCount;
  @override
  final String? imageUrl;
  @override
  final String? description;
  @override
  @JsonKey()
  final int estimatedDeliveryTime;
  @override
  @JsonKey()
  final double relevanceScore;

  @override
  String toString() {
    return 'RecommendedItem(itemId: $itemId, itemName: $itemName, restaurantId: $restaurantId, restaurantName: $restaurantName, price: $price, rating: $rating, reviewCount: $reviewCount, imageUrl: $imageUrl, description: $description, estimatedDeliveryTime: $estimatedDeliveryTime, relevanceScore: $relevanceScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendedItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.estimatedDeliveryTime, estimatedDeliveryTime) ||
                other.estimatedDeliveryTime == estimatedDeliveryTime) &&
            (identical(other.relevanceScore, relevanceScore) ||
                other.relevanceScore == relevanceScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      itemId,
      itemName,
      restaurantId,
      restaurantName,
      price,
      rating,
      reviewCount,
      imageUrl,
      description,
      estimatedDeliveryTime,
      relevanceScore);

  /// Create a copy of RecommendedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendedItemImplCopyWith<_$RecommendedItemImpl> get copyWith =>
      __$$RecommendedItemImplCopyWithImpl<_$RecommendedItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendedItemImplToJson(
      this,
    );
  }
}

abstract class _RecommendedItem implements RecommendedItem {
  const factory _RecommendedItem(
      {required final String itemId,
      required final String itemName,
      required final String restaurantId,
      required final String restaurantName,
      required final double price,
      required final double rating,
      required final int reviewCount,
      final String? imageUrl,
      final String? description,
      final int estimatedDeliveryTime,
      final double relevanceScore}) = _$RecommendedItemImpl;

  factory _RecommendedItem.fromJson(Map<String, dynamic> json) =
      _$RecommendedItemImpl.fromJson;

  @override
  String get itemId;
  @override
  String get itemName;
  @override
  String get restaurantId;
  @override
  String get restaurantName;
  @override
  double get price;
  @override
  double get rating;
  @override
  int get reviewCount;
  @override
  String? get imageUrl;
  @override
  String? get description;
  @override
  int get estimatedDeliveryTime;
  @override
  double get relevanceScore;

  /// Create a copy of RecommendedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendedItemImplCopyWith<_$RecommendedItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PersonalizedFeed _$PersonalizedFeedFromJson(Map<String, dynamic> json) {
  return _PersonalizedFeed.fromJson(json);
}

/// @nodoc
mixin _$PersonalizedFeed {
  String get userId => throw _privateConstructorUsedError;
  List<FeedSection> get sections => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;

  /// Serializes this PersonalizedFeed to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonalizedFeed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonalizedFeedCopyWith<PersonalizedFeed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalizedFeedCopyWith<$Res> {
  factory $PersonalizedFeedCopyWith(
          PersonalizedFeed value, $Res Function(PersonalizedFeed) then) =
      _$PersonalizedFeedCopyWithImpl<$Res, PersonalizedFeed>;
  @useResult
  $Res call(
      {String userId,
      List<FeedSection> sections,
      DateTime generatedAt,
      DateTime? expiresAt});
}

/// @nodoc
class _$PersonalizedFeedCopyWithImpl<$Res, $Val extends PersonalizedFeed>
    implements $PersonalizedFeedCopyWith<$Res> {
  _$PersonalizedFeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonalizedFeed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? sections = null,
    Object? generatedAt = null,
    Object? expiresAt = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      sections: null == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<FeedSection>,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalizedFeedImplCopyWith<$Res>
    implements $PersonalizedFeedCopyWith<$Res> {
  factory _$$PersonalizedFeedImplCopyWith(_$PersonalizedFeedImpl value,
          $Res Function(_$PersonalizedFeedImpl) then) =
      __$$PersonalizedFeedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      List<FeedSection> sections,
      DateTime generatedAt,
      DateTime? expiresAt});
}

/// @nodoc
class __$$PersonalizedFeedImplCopyWithImpl<$Res>
    extends _$PersonalizedFeedCopyWithImpl<$Res, _$PersonalizedFeedImpl>
    implements _$$PersonalizedFeedImplCopyWith<$Res> {
  __$$PersonalizedFeedImplCopyWithImpl(_$PersonalizedFeedImpl _value,
      $Res Function(_$PersonalizedFeedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonalizedFeed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? sections = null,
    Object? generatedAt = null,
    Object? expiresAt = freezed,
  }) {
    return _then(_$PersonalizedFeedImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      sections: null == sections
          ? _value._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<FeedSection>,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalizedFeedImpl implements _PersonalizedFeed {
  const _$PersonalizedFeedImpl(
      {required this.userId,
      required final List<FeedSection> sections,
      required this.generatedAt,
      this.expiresAt})
      : _sections = sections;

  factory _$PersonalizedFeedImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalizedFeedImplFromJson(json);

  @override
  final String userId;
  final List<FeedSection> _sections;
  @override
  List<FeedSection> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  final DateTime generatedAt;
  @override
  final DateTime? expiresAt;

  @override
  String toString() {
    return 'PersonalizedFeed(userId: $userId, sections: $sections, generatedAt: $generatedAt, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalizedFeedImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._sections, _sections) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId,
      const DeepCollectionEquality().hash(_sections), generatedAt, expiresAt);

  /// Create a copy of PersonalizedFeed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalizedFeedImplCopyWith<_$PersonalizedFeedImpl> get copyWith =>
      __$$PersonalizedFeedImplCopyWithImpl<_$PersonalizedFeedImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalizedFeedImplToJson(
      this,
    );
  }
}

abstract class _PersonalizedFeed implements PersonalizedFeed {
  const factory _PersonalizedFeed(
      {required final String userId,
      required final List<FeedSection> sections,
      required final DateTime generatedAt,
      final DateTime? expiresAt}) = _$PersonalizedFeedImpl;

  factory _PersonalizedFeed.fromJson(Map<String, dynamic> json) =
      _$PersonalizedFeedImpl.fromJson;

  @override
  String get userId;
  @override
  List<FeedSection> get sections;
  @override
  DateTime get generatedAt;
  @override
  DateTime? get expiresAt;

  /// Create a copy of PersonalizedFeed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonalizedFeedImplCopyWith<_$PersonalizedFeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedSection _$FeedSectionFromJson(Map<String, dynamic> json) {
  return _FeedSection.fromJson(json);
}

/// @nodoc
mixin _$FeedSection {
  String get sectionId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  FeedSectionType get type => throw _privateConstructorUsedError;
  List<FeedItem> get items => throw _privateConstructorUsedError;
  String? get actionText => throw _privateConstructorUsedError;
  String? get actionRoute => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;

  /// Serializes this FeedSection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedSectionCopyWith<FeedSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedSectionCopyWith<$Res> {
  factory $FeedSectionCopyWith(
          FeedSection value, $Res Function(FeedSection) then) =
      _$FeedSectionCopyWithImpl<$Res, FeedSection>;
  @useResult
  $Res call(
      {String sectionId,
      String title,
      String subtitle,
      FeedSectionType type,
      List<FeedItem> items,
      String? actionText,
      String? actionRoute,
      int priority});
}

/// @nodoc
class _$FeedSectionCopyWithImpl<$Res, $Val extends FeedSection>
    implements $FeedSectionCopyWith<$Res> {
  _$FeedSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionId = null,
    Object? title = null,
    Object? subtitle = null,
    Object? type = null,
    Object? items = null,
    Object? actionText = freezed,
    Object? actionRoute = freezed,
    Object? priority = null,
  }) {
    return _then(_value.copyWith(
      sectionId: null == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedSectionType,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FeedItem>,
      actionText: freezed == actionText
          ? _value.actionText
          : actionText // ignore: cast_nullable_to_non_nullable
              as String?,
      actionRoute: freezed == actionRoute
          ? _value.actionRoute
          : actionRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedSectionImplCopyWith<$Res>
    implements $FeedSectionCopyWith<$Res> {
  factory _$$FeedSectionImplCopyWith(
          _$FeedSectionImpl value, $Res Function(_$FeedSectionImpl) then) =
      __$$FeedSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sectionId,
      String title,
      String subtitle,
      FeedSectionType type,
      List<FeedItem> items,
      String? actionText,
      String? actionRoute,
      int priority});
}

/// @nodoc
class __$$FeedSectionImplCopyWithImpl<$Res>
    extends _$FeedSectionCopyWithImpl<$Res, _$FeedSectionImpl>
    implements _$$FeedSectionImplCopyWith<$Res> {
  __$$FeedSectionImplCopyWithImpl(
      _$FeedSectionImpl _value, $Res Function(_$FeedSectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionId = null,
    Object? title = null,
    Object? subtitle = null,
    Object? type = null,
    Object? items = null,
    Object? actionText = freezed,
    Object? actionRoute = freezed,
    Object? priority = null,
  }) {
    return _then(_$FeedSectionImpl(
      sectionId: null == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedSectionType,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FeedItem>,
      actionText: freezed == actionText
          ? _value.actionText
          : actionText // ignore: cast_nullable_to_non_nullable
              as String?,
      actionRoute: freezed == actionRoute
          ? _value.actionRoute
          : actionRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedSectionImpl implements _FeedSection {
  const _$FeedSectionImpl(
      {required this.sectionId,
      required this.title,
      required this.subtitle,
      required this.type,
      required final List<FeedItem> items,
      this.actionText,
      this.actionRoute,
      this.priority = 0})
      : _items = items;

  factory _$FeedSectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedSectionImplFromJson(json);

  @override
  final String sectionId;
  @override
  final String title;
  @override
  final String subtitle;
  @override
  final FeedSectionType type;
  final List<FeedItem> _items;
  @override
  List<FeedItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? actionText;
  @override
  final String? actionRoute;
  @override
  @JsonKey()
  final int priority;

  @override
  String toString() {
    return 'FeedSection(sectionId: $sectionId, title: $title, subtitle: $subtitle, type: $type, items: $items, actionText: $actionText, actionRoute: $actionRoute, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedSectionImpl &&
            (identical(other.sectionId, sectionId) ||
                other.sectionId == sectionId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            (identical(other.actionRoute, actionRoute) ||
                other.actionRoute == actionRoute) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sectionId,
      title,
      subtitle,
      type,
      const DeepCollectionEquality().hash(_items),
      actionText,
      actionRoute,
      priority);

  /// Create a copy of FeedSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedSectionImplCopyWith<_$FeedSectionImpl> get copyWith =>
      __$$FeedSectionImplCopyWithImpl<_$FeedSectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedSectionImplToJson(
      this,
    );
  }
}

abstract class _FeedSection implements FeedSection {
  const factory _FeedSection(
      {required final String sectionId,
      required final String title,
      required final String subtitle,
      required final FeedSectionType type,
      required final List<FeedItem> items,
      final String? actionText,
      final String? actionRoute,
      final int priority}) = _$FeedSectionImpl;

  factory _FeedSection.fromJson(Map<String, dynamic> json) =
      _$FeedSectionImpl.fromJson;

  @override
  String get sectionId;
  @override
  String get title;
  @override
  String get subtitle;
  @override
  FeedSectionType get type;
  @override
  List<FeedItem> get items;
  @override
  String? get actionText;
  @override
  String? get actionRoute;
  @override
  int get priority;

  /// Create a copy of FeedSection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedSectionImplCopyWith<_$FeedSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedItem _$FeedItemFromJson(Map<String, dynamic> json) {
  return _FeedItem.fromJson(json);
}

/// @nodoc
mixin _$FeedItem {
  String get itemId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  FeedItemType get type => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get route => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  double get relevanceScore => throw _privateConstructorUsedError;

  /// Serializes this FeedItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedItemCopyWith<FeedItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedItemCopyWith<$Res> {
  factory $FeedItemCopyWith(FeedItem value, $Res Function(FeedItem) then) =
      _$FeedItemCopyWithImpl<$Res, FeedItem>;
  @useResult
  $Res call(
      {String itemId,
      String title,
      String subtitle,
      FeedItemType type,
      String? imageUrl,
      String? route,
      Map<String, dynamic>? data,
      double relevanceScore});
}

/// @nodoc
class _$FeedItemCopyWithImpl<$Res, $Val extends FeedItem>
    implements $FeedItemCopyWith<$Res> {
  _$FeedItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? title = null,
    Object? subtitle = null,
    Object? type = null,
    Object? imageUrl = freezed,
    Object? route = freezed,
    Object? data = freezed,
    Object? relevanceScore = null,
  }) {
    return _then(_value.copyWith(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedItemType,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      relevanceScore: null == relevanceScore
          ? _value.relevanceScore
          : relevanceScore // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedItemImplCopyWith<$Res>
    implements $FeedItemCopyWith<$Res> {
  factory _$$FeedItemImplCopyWith(
          _$FeedItemImpl value, $Res Function(_$FeedItemImpl) then) =
      __$$FeedItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String itemId,
      String title,
      String subtitle,
      FeedItemType type,
      String? imageUrl,
      String? route,
      Map<String, dynamic>? data,
      double relevanceScore});
}

/// @nodoc
class __$$FeedItemImplCopyWithImpl<$Res>
    extends _$FeedItemCopyWithImpl<$Res, _$FeedItemImpl>
    implements _$$FeedItemImplCopyWith<$Res> {
  __$$FeedItemImplCopyWithImpl(
      _$FeedItemImpl _value, $Res Function(_$FeedItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? title = null,
    Object? subtitle = null,
    Object? type = null,
    Object? imageUrl = freezed,
    Object? route = freezed,
    Object? data = freezed,
    Object? relevanceScore = null,
  }) {
    return _then(_$FeedItemImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedItemType,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      relevanceScore: null == relevanceScore
          ? _value.relevanceScore
          : relevanceScore // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedItemImpl implements _FeedItem {
  const _$FeedItemImpl(
      {required this.itemId,
      required this.title,
      required this.subtitle,
      required this.type,
      this.imageUrl,
      this.route,
      final Map<String, dynamic>? data,
      this.relevanceScore = 0.0})
      : _data = data;

  factory _$FeedItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedItemImplFromJson(json);

  @override
  final String itemId;
  @override
  final String title;
  @override
  final String subtitle;
  @override
  final FeedItemType type;
  @override
  final String? imageUrl;
  @override
  final String? route;
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
  @JsonKey()
  final double relevanceScore;

  @override
  String toString() {
    return 'FeedItem(itemId: $itemId, title: $title, subtitle: $subtitle, type: $type, imageUrl: $imageUrl, route: $route, data: $data, relevanceScore: $relevanceScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.route, route) || other.route == route) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.relevanceScore, relevanceScore) ||
                other.relevanceScore == relevanceScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      itemId,
      title,
      subtitle,
      type,
      imageUrl,
      route,
      const DeepCollectionEquality().hash(_data),
      relevanceScore);

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedItemImplCopyWith<_$FeedItemImpl> get copyWith =>
      __$$FeedItemImplCopyWithImpl<_$FeedItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedItemImplToJson(
      this,
    );
  }
}

abstract class _FeedItem implements FeedItem {
  const factory _FeedItem(
      {required final String itemId,
      required final String title,
      required final String subtitle,
      required final FeedItemType type,
      final String? imageUrl,
      final String? route,
      final Map<String, dynamic>? data,
      final double relevanceScore}) = _$FeedItemImpl;

  factory _FeedItem.fromJson(Map<String, dynamic> json) =
      _$FeedItemImpl.fromJson;

  @override
  String get itemId;
  @override
  String get title;
  @override
  String get subtitle;
  @override
  FeedItemType get type;
  @override
  String? get imageUrl;
  @override
  String? get route;
  @override
  Map<String, dynamic>? get data;
  @override
  double get relevanceScore;

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedItemImplCopyWith<_$FeedItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserBehavior _$UserBehaviorFromJson(Map<String, dynamic> json) {
  return _UserBehavior.fromJson(json);
}

/// @nodoc
mixin _$UserBehavior {
  String get userId => throw _privateConstructorUsedError;
  List<OrderPattern> get orderPatterns => throw _privateConstructorUsedError;
  List<SearchPattern> get searchPatterns => throw _privateConstructorUsedError;
  List<BrowsingPattern> get browsingPatterns =>
      throw _privateConstructorUsedError;
  Map<String, int> get cuisinePreferences => throw _privateConstructorUsedError;
  Map<String, int> get restaurantPreferences =>
      throw _privateConstructorUsedError;
  Map<String, double> get averageOrderValues =>
      throw _privateConstructorUsedError;
  List<TimeSlot> get preferredOrderTimes => throw _privateConstructorUsedError;
  int get totalOrders => throw _privateConstructorUsedError;
  double get averageOrderValue => throw _privateConstructorUsedError;
  double get customerLifetimeValue => throw _privateConstructorUsedError;
  DateTime? get lastAnalyzed => throw _privateConstructorUsedError;

  /// Serializes this UserBehavior to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBehaviorCopyWith<UserBehavior> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBehaviorCopyWith<$Res> {
  factory $UserBehaviorCopyWith(
          UserBehavior value, $Res Function(UserBehavior) then) =
      _$UserBehaviorCopyWithImpl<$Res, UserBehavior>;
  @useResult
  $Res call(
      {String userId,
      List<OrderPattern> orderPatterns,
      List<SearchPattern> searchPatterns,
      List<BrowsingPattern> browsingPatterns,
      Map<String, int> cuisinePreferences,
      Map<String, int> restaurantPreferences,
      Map<String, double> averageOrderValues,
      List<TimeSlot> preferredOrderTimes,
      int totalOrders,
      double averageOrderValue,
      double customerLifetimeValue,
      DateTime? lastAnalyzed});
}

/// @nodoc
class _$UserBehaviorCopyWithImpl<$Res, $Val extends UserBehavior>
    implements $UserBehaviorCopyWith<$Res> {
  _$UserBehaviorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? orderPatterns = null,
    Object? searchPatterns = null,
    Object? browsingPatterns = null,
    Object? cuisinePreferences = null,
    Object? restaurantPreferences = null,
    Object? averageOrderValues = null,
    Object? preferredOrderTimes = null,
    Object? totalOrders = null,
    Object? averageOrderValue = null,
    Object? customerLifetimeValue = null,
    Object? lastAnalyzed = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      orderPatterns: null == orderPatterns
          ? _value.orderPatterns
          : orderPatterns // ignore: cast_nullable_to_non_nullable
              as List<OrderPattern>,
      searchPatterns: null == searchPatterns
          ? _value.searchPatterns
          : searchPatterns // ignore: cast_nullable_to_non_nullable
              as List<SearchPattern>,
      browsingPatterns: null == browsingPatterns
          ? _value.browsingPatterns
          : browsingPatterns // ignore: cast_nullable_to_non_nullable
              as List<BrowsingPattern>,
      cuisinePreferences: null == cuisinePreferences
          ? _value.cuisinePreferences
          : cuisinePreferences // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      restaurantPreferences: null == restaurantPreferences
          ? _value.restaurantPreferences
          : restaurantPreferences // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      averageOrderValues: null == averageOrderValues
          ? _value.averageOrderValues
          : averageOrderValues // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      preferredOrderTimes: null == preferredOrderTimes
          ? _value.preferredOrderTimes
          : preferredOrderTimes // ignore: cast_nullable_to_non_nullable
              as List<TimeSlot>,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      customerLifetimeValue: null == customerLifetimeValue
          ? _value.customerLifetimeValue
          : customerLifetimeValue // ignore: cast_nullable_to_non_nullable
              as double,
      lastAnalyzed: freezed == lastAnalyzed
          ? _value.lastAnalyzed
          : lastAnalyzed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserBehaviorImplCopyWith<$Res>
    implements $UserBehaviorCopyWith<$Res> {
  factory _$$UserBehaviorImplCopyWith(
          _$UserBehaviorImpl value, $Res Function(_$UserBehaviorImpl) then) =
      __$$UserBehaviorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      List<OrderPattern> orderPatterns,
      List<SearchPattern> searchPatterns,
      List<BrowsingPattern> browsingPatterns,
      Map<String, int> cuisinePreferences,
      Map<String, int> restaurantPreferences,
      Map<String, double> averageOrderValues,
      List<TimeSlot> preferredOrderTimes,
      int totalOrders,
      double averageOrderValue,
      double customerLifetimeValue,
      DateTime? lastAnalyzed});
}

/// @nodoc
class __$$UserBehaviorImplCopyWithImpl<$Res>
    extends _$UserBehaviorCopyWithImpl<$Res, _$UserBehaviorImpl>
    implements _$$UserBehaviorImplCopyWith<$Res> {
  __$$UserBehaviorImplCopyWithImpl(
      _$UserBehaviorImpl _value, $Res Function(_$UserBehaviorImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? orderPatterns = null,
    Object? searchPatterns = null,
    Object? browsingPatterns = null,
    Object? cuisinePreferences = null,
    Object? restaurantPreferences = null,
    Object? averageOrderValues = null,
    Object? preferredOrderTimes = null,
    Object? totalOrders = null,
    Object? averageOrderValue = null,
    Object? customerLifetimeValue = null,
    Object? lastAnalyzed = freezed,
  }) {
    return _then(_$UserBehaviorImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      orderPatterns: null == orderPatterns
          ? _value._orderPatterns
          : orderPatterns // ignore: cast_nullable_to_non_nullable
              as List<OrderPattern>,
      searchPatterns: null == searchPatterns
          ? _value._searchPatterns
          : searchPatterns // ignore: cast_nullable_to_non_nullable
              as List<SearchPattern>,
      browsingPatterns: null == browsingPatterns
          ? _value._browsingPatterns
          : browsingPatterns // ignore: cast_nullable_to_non_nullable
              as List<BrowsingPattern>,
      cuisinePreferences: null == cuisinePreferences
          ? _value._cuisinePreferences
          : cuisinePreferences // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      restaurantPreferences: null == restaurantPreferences
          ? _value._restaurantPreferences
          : restaurantPreferences // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      averageOrderValues: null == averageOrderValues
          ? _value._averageOrderValues
          : averageOrderValues // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      preferredOrderTimes: null == preferredOrderTimes
          ? _value._preferredOrderTimes
          : preferredOrderTimes // ignore: cast_nullable_to_non_nullable
              as List<TimeSlot>,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      customerLifetimeValue: null == customerLifetimeValue
          ? _value.customerLifetimeValue
          : customerLifetimeValue // ignore: cast_nullable_to_non_nullable
              as double,
      lastAnalyzed: freezed == lastAnalyzed
          ? _value.lastAnalyzed
          : lastAnalyzed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserBehaviorImpl implements _UserBehavior {
  const _$UserBehaviorImpl(
      {required this.userId,
      required final List<OrderPattern> orderPatterns,
      required final List<SearchPattern> searchPatterns,
      required final List<BrowsingPattern> browsingPatterns,
      required final Map<String, int> cuisinePreferences,
      required final Map<String, int> restaurantPreferences,
      required final Map<String, double> averageOrderValues,
      required final List<TimeSlot> preferredOrderTimes,
      this.totalOrders = 0,
      this.averageOrderValue = 0.0,
      this.customerLifetimeValue = 0.0,
      this.lastAnalyzed})
      : _orderPatterns = orderPatterns,
        _searchPatterns = searchPatterns,
        _browsingPatterns = browsingPatterns,
        _cuisinePreferences = cuisinePreferences,
        _restaurantPreferences = restaurantPreferences,
        _averageOrderValues = averageOrderValues,
        _preferredOrderTimes = preferredOrderTimes;

  factory _$UserBehaviorImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBehaviorImplFromJson(json);

  @override
  final String userId;
  final List<OrderPattern> _orderPatterns;
  @override
  List<OrderPattern> get orderPatterns {
    if (_orderPatterns is EqualUnmodifiableListView) return _orderPatterns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderPatterns);
  }

  final List<SearchPattern> _searchPatterns;
  @override
  List<SearchPattern> get searchPatterns {
    if (_searchPatterns is EqualUnmodifiableListView) return _searchPatterns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchPatterns);
  }

  final List<BrowsingPattern> _browsingPatterns;
  @override
  List<BrowsingPattern> get browsingPatterns {
    if (_browsingPatterns is EqualUnmodifiableListView)
      return _browsingPatterns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_browsingPatterns);
  }

  final Map<String, int> _cuisinePreferences;
  @override
  Map<String, int> get cuisinePreferences {
    if (_cuisinePreferences is EqualUnmodifiableMapView)
      return _cuisinePreferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cuisinePreferences);
  }

  final Map<String, int> _restaurantPreferences;
  @override
  Map<String, int> get restaurantPreferences {
    if (_restaurantPreferences is EqualUnmodifiableMapView)
      return _restaurantPreferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_restaurantPreferences);
  }

  final Map<String, double> _averageOrderValues;
  @override
  Map<String, double> get averageOrderValues {
    if (_averageOrderValues is EqualUnmodifiableMapView)
      return _averageOrderValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_averageOrderValues);
  }

  final List<TimeSlot> _preferredOrderTimes;
  @override
  List<TimeSlot> get preferredOrderTimes {
    if (_preferredOrderTimes is EqualUnmodifiableListView)
      return _preferredOrderTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredOrderTimes);
  }

  @override
  @JsonKey()
  final int totalOrders;
  @override
  @JsonKey()
  final double averageOrderValue;
  @override
  @JsonKey()
  final double customerLifetimeValue;
  @override
  final DateTime? lastAnalyzed;

  @override
  String toString() {
    return 'UserBehavior(userId: $userId, orderPatterns: $orderPatterns, searchPatterns: $searchPatterns, browsingPatterns: $browsingPatterns, cuisinePreferences: $cuisinePreferences, restaurantPreferences: $restaurantPreferences, averageOrderValues: $averageOrderValues, preferredOrderTimes: $preferredOrderTimes, totalOrders: $totalOrders, averageOrderValue: $averageOrderValue, customerLifetimeValue: $customerLifetimeValue, lastAnalyzed: $lastAnalyzed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBehaviorImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._orderPatterns, _orderPatterns) &&
            const DeepCollectionEquality()
                .equals(other._searchPatterns, _searchPatterns) &&
            const DeepCollectionEquality()
                .equals(other._browsingPatterns, _browsingPatterns) &&
            const DeepCollectionEquality()
                .equals(other._cuisinePreferences, _cuisinePreferences) &&
            const DeepCollectionEquality()
                .equals(other._restaurantPreferences, _restaurantPreferences) &&
            const DeepCollectionEquality()
                .equals(other._averageOrderValues, _averageOrderValues) &&
            const DeepCollectionEquality()
                .equals(other._preferredOrderTimes, _preferredOrderTimes) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.averageOrderValue, averageOrderValue) ||
                other.averageOrderValue == averageOrderValue) &&
            (identical(other.customerLifetimeValue, customerLifetimeValue) ||
                other.customerLifetimeValue == customerLifetimeValue) &&
            (identical(other.lastAnalyzed, lastAnalyzed) ||
                other.lastAnalyzed == lastAnalyzed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      const DeepCollectionEquality().hash(_orderPatterns),
      const DeepCollectionEquality().hash(_searchPatterns),
      const DeepCollectionEquality().hash(_browsingPatterns),
      const DeepCollectionEquality().hash(_cuisinePreferences),
      const DeepCollectionEquality().hash(_restaurantPreferences),
      const DeepCollectionEquality().hash(_averageOrderValues),
      const DeepCollectionEquality().hash(_preferredOrderTimes),
      totalOrders,
      averageOrderValue,
      customerLifetimeValue,
      lastAnalyzed);

  /// Create a copy of UserBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBehaviorImplCopyWith<_$UserBehaviorImpl> get copyWith =>
      __$$UserBehaviorImplCopyWithImpl<_$UserBehaviorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBehaviorImplToJson(
      this,
    );
  }
}

abstract class _UserBehavior implements UserBehavior {
  const factory _UserBehavior(
      {required final String userId,
      required final List<OrderPattern> orderPatterns,
      required final List<SearchPattern> searchPatterns,
      required final List<BrowsingPattern> browsingPatterns,
      required final Map<String, int> cuisinePreferences,
      required final Map<String, int> restaurantPreferences,
      required final Map<String, double> averageOrderValues,
      required final List<TimeSlot> preferredOrderTimes,
      final int totalOrders,
      final double averageOrderValue,
      final double customerLifetimeValue,
      final DateTime? lastAnalyzed}) = _$UserBehaviorImpl;

  factory _UserBehavior.fromJson(Map<String, dynamic> json) =
      _$UserBehaviorImpl.fromJson;

  @override
  String get userId;
  @override
  List<OrderPattern> get orderPatterns;
  @override
  List<SearchPattern> get searchPatterns;
  @override
  List<BrowsingPattern> get browsingPatterns;
  @override
  Map<String, int> get cuisinePreferences;
  @override
  Map<String, int> get restaurantPreferences;
  @override
  Map<String, double> get averageOrderValues;
  @override
  List<TimeSlot> get preferredOrderTimes;
  @override
  int get totalOrders;
  @override
  double get averageOrderValue;
  @override
  double get customerLifetimeValue;
  @override
  DateTime? get lastAnalyzed;

  /// Create a copy of UserBehavior
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBehaviorImplCopyWith<_$UserBehaviorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderPattern _$OrderPatternFromJson(Map<String, dynamic> json) {
  return _OrderPattern.fromJson(json);
}

/// @nodoc
mixin _$OrderPattern {
  String get pattern => throw _privateConstructorUsedError;
  int get frequency => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  List<String> get associatedItems => throw _privateConstructorUsedError;
  DateTime? get lastOccurrence => throw _privateConstructorUsedError;

  /// Serializes this OrderPattern to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderPattern
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderPatternCopyWith<OrderPattern> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPatternCopyWith<$Res> {
  factory $OrderPatternCopyWith(
          OrderPattern value, $Res Function(OrderPattern) then) =
      _$OrderPatternCopyWithImpl<$Res, OrderPattern>;
  @useResult
  $Res call(
      {String pattern,
      int frequency,
      double confidence,
      List<String> associatedItems,
      DateTime? lastOccurrence});
}

/// @nodoc
class _$OrderPatternCopyWithImpl<$Res, $Val extends OrderPattern>
    implements $OrderPatternCopyWith<$Res> {
  _$OrderPatternCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderPattern
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pattern = null,
    Object? frequency = null,
    Object? confidence = null,
    Object? associatedItems = null,
    Object? lastOccurrence = freezed,
  }) {
    return _then(_value.copyWith(
      pattern: null == pattern
          ? _value.pattern
          : pattern // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      associatedItems: null == associatedItems
          ? _value.associatedItems
          : associatedItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastOccurrence: freezed == lastOccurrence
          ? _value.lastOccurrence
          : lastOccurrence // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderPatternImplCopyWith<$Res>
    implements $OrderPatternCopyWith<$Res> {
  factory _$$OrderPatternImplCopyWith(
          _$OrderPatternImpl value, $Res Function(_$OrderPatternImpl) then) =
      __$$OrderPatternImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String pattern,
      int frequency,
      double confidence,
      List<String> associatedItems,
      DateTime? lastOccurrence});
}

/// @nodoc
class __$$OrderPatternImplCopyWithImpl<$Res>
    extends _$OrderPatternCopyWithImpl<$Res, _$OrderPatternImpl>
    implements _$$OrderPatternImplCopyWith<$Res> {
  __$$OrderPatternImplCopyWithImpl(
      _$OrderPatternImpl _value, $Res Function(_$OrderPatternImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderPattern
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pattern = null,
    Object? frequency = null,
    Object? confidence = null,
    Object? associatedItems = null,
    Object? lastOccurrence = freezed,
  }) {
    return _then(_$OrderPatternImpl(
      pattern: null == pattern
          ? _value.pattern
          : pattern // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      associatedItems: null == associatedItems
          ? _value._associatedItems
          : associatedItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastOccurrence: freezed == lastOccurrence
          ? _value.lastOccurrence
          : lastOccurrence // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderPatternImpl implements _OrderPattern {
  const _$OrderPatternImpl(
      {required this.pattern,
      required this.frequency,
      required this.confidence,
      required final List<String> associatedItems,
      this.lastOccurrence})
      : _associatedItems = associatedItems;

  factory _$OrderPatternImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderPatternImplFromJson(json);

  @override
  final String pattern;
  @override
  final int frequency;
  @override
  final double confidence;
  final List<String> _associatedItems;
  @override
  List<String> get associatedItems {
    if (_associatedItems is EqualUnmodifiableListView) return _associatedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_associatedItems);
  }

  @override
  final DateTime? lastOccurrence;

  @override
  String toString() {
    return 'OrderPattern(pattern: $pattern, frequency: $frequency, confidence: $confidence, associatedItems: $associatedItems, lastOccurrence: $lastOccurrence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderPatternImpl &&
            (identical(other.pattern, pattern) || other.pattern == pattern) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality()
                .equals(other._associatedItems, _associatedItems) &&
            (identical(other.lastOccurrence, lastOccurrence) ||
                other.lastOccurrence == lastOccurrence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pattern, frequency, confidence,
      const DeepCollectionEquality().hash(_associatedItems), lastOccurrence);

  /// Create a copy of OrderPattern
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderPatternImplCopyWith<_$OrderPatternImpl> get copyWith =>
      __$$OrderPatternImplCopyWithImpl<_$OrderPatternImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderPatternImplToJson(
      this,
    );
  }
}

abstract class _OrderPattern implements OrderPattern {
  const factory _OrderPattern(
      {required final String pattern,
      required final int frequency,
      required final double confidence,
      required final List<String> associatedItems,
      final DateTime? lastOccurrence}) = _$OrderPatternImpl;

  factory _OrderPattern.fromJson(Map<String, dynamic> json) =
      _$OrderPatternImpl.fromJson;

  @override
  String get pattern;
  @override
  int get frequency;
  @override
  double get confidence;
  @override
  List<String> get associatedItems;
  @override
  DateTime? get lastOccurrence;

  /// Create a copy of OrderPattern
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderPatternImplCopyWith<_$OrderPatternImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchPattern _$SearchPatternFromJson(Map<String, dynamic> json) {
  return _SearchPattern.fromJson(json);
}

/// @nodoc
mixin _$SearchPattern {
  String get query => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  List<String> get resultClicks => throw _privateConstructorUsedError;
  DateTime? get lastSearched => throw _privateConstructorUsedError;

  /// Serializes this SearchPattern to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchPattern
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchPatternCopyWith<SearchPattern> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPatternCopyWith<$Res> {
  factory $SearchPatternCopyWith(
          SearchPattern value, $Res Function(SearchPattern) then) =
      _$SearchPatternCopyWithImpl<$Res, SearchPattern>;
  @useResult
  $Res call(
      {String query,
      int count,
      List<String> resultClicks,
      DateTime? lastSearched});
}

/// @nodoc
class _$SearchPatternCopyWithImpl<$Res, $Val extends SearchPattern>
    implements $SearchPatternCopyWith<$Res> {
  _$SearchPatternCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchPattern
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? count = null,
    Object? resultClicks = null,
    Object? lastSearched = freezed,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      resultClicks: null == resultClicks
          ? _value.resultClicks
          : resultClicks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastSearched: freezed == lastSearched
          ? _value.lastSearched
          : lastSearched // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchPatternImplCopyWith<$Res>
    implements $SearchPatternCopyWith<$Res> {
  factory _$$SearchPatternImplCopyWith(
          _$SearchPatternImpl value, $Res Function(_$SearchPatternImpl) then) =
      __$$SearchPatternImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String query,
      int count,
      List<String> resultClicks,
      DateTime? lastSearched});
}

/// @nodoc
class __$$SearchPatternImplCopyWithImpl<$Res>
    extends _$SearchPatternCopyWithImpl<$Res, _$SearchPatternImpl>
    implements _$$SearchPatternImplCopyWith<$Res> {
  __$$SearchPatternImplCopyWithImpl(
      _$SearchPatternImpl _value, $Res Function(_$SearchPatternImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchPattern
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? count = null,
    Object? resultClicks = null,
    Object? lastSearched = freezed,
  }) {
    return _then(_$SearchPatternImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      resultClicks: null == resultClicks
          ? _value._resultClicks
          : resultClicks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastSearched: freezed == lastSearched
          ? _value.lastSearched
          : lastSearched // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchPatternImpl implements _SearchPattern {
  const _$SearchPatternImpl(
      {required this.query,
      required this.count,
      required final List<String> resultClicks,
      this.lastSearched})
      : _resultClicks = resultClicks;

  factory _$SearchPatternImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchPatternImplFromJson(json);

  @override
  final String query;
  @override
  final int count;
  final List<String> _resultClicks;
  @override
  List<String> get resultClicks {
    if (_resultClicks is EqualUnmodifiableListView) return _resultClicks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resultClicks);
  }

  @override
  final DateTime? lastSearched;

  @override
  String toString() {
    return 'SearchPattern(query: $query, count: $count, resultClicks: $resultClicks, lastSearched: $lastSearched)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchPatternImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality()
                .equals(other._resultClicks, _resultClicks) &&
            (identical(other.lastSearched, lastSearched) ||
                other.lastSearched == lastSearched));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, query, count,
      const DeepCollectionEquality().hash(_resultClicks), lastSearched);

  /// Create a copy of SearchPattern
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchPatternImplCopyWith<_$SearchPatternImpl> get copyWith =>
      __$$SearchPatternImplCopyWithImpl<_$SearchPatternImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchPatternImplToJson(
      this,
    );
  }
}

abstract class _SearchPattern implements SearchPattern {
  const factory _SearchPattern(
      {required final String query,
      required final int count,
      required final List<String> resultClicks,
      final DateTime? lastSearched}) = _$SearchPatternImpl;

  factory _SearchPattern.fromJson(Map<String, dynamic> json) =
      _$SearchPatternImpl.fromJson;

  @override
  String get query;
  @override
  int get count;
  @override
  List<String> get resultClicks;
  @override
  DateTime? get lastSearched;

  /// Create a copy of SearchPattern
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchPatternImplCopyWith<_$SearchPatternImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BrowsingPattern _$BrowsingPatternFromJson(Map<String, dynamic> json) {
  return _BrowsingPattern.fromJson(json);
}

/// @nodoc
mixin _$BrowsingPattern {
  String get restaurantId => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;
  Duration get averageViewTime => throw _privateConstructorUsedError;
  List<String> get viewedItems => throw _privateConstructorUsedError;
  DateTime? get lastVisited => throw _privateConstructorUsedError;

  /// Serializes this BrowsingPattern to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrowsingPattern
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrowsingPatternCopyWith<BrowsingPattern> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrowsingPatternCopyWith<$Res> {
  factory $BrowsingPatternCopyWith(
          BrowsingPattern value, $Res Function(BrowsingPattern) then) =
      _$BrowsingPatternCopyWithImpl<$Res, BrowsingPattern>;
  @useResult
  $Res call(
      {String restaurantId,
      int viewCount,
      Duration averageViewTime,
      List<String> viewedItems,
      DateTime? lastVisited});
}

/// @nodoc
class _$BrowsingPatternCopyWithImpl<$Res, $Val extends BrowsingPattern>
    implements $BrowsingPatternCopyWith<$Res> {
  _$BrowsingPatternCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrowsingPattern
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantId = null,
    Object? viewCount = null,
    Object? averageViewTime = null,
    Object? viewedItems = null,
    Object? lastVisited = freezed,
  }) {
    return _then(_value.copyWith(
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageViewTime: null == averageViewTime
          ? _value.averageViewTime
          : averageViewTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      viewedItems: null == viewedItems
          ? _value.viewedItems
          : viewedItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastVisited: freezed == lastVisited
          ? _value.lastVisited
          : lastVisited // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrowsingPatternImplCopyWith<$Res>
    implements $BrowsingPatternCopyWith<$Res> {
  factory _$$BrowsingPatternImplCopyWith(_$BrowsingPatternImpl value,
          $Res Function(_$BrowsingPatternImpl) then) =
      __$$BrowsingPatternImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String restaurantId,
      int viewCount,
      Duration averageViewTime,
      List<String> viewedItems,
      DateTime? lastVisited});
}

/// @nodoc
class __$$BrowsingPatternImplCopyWithImpl<$Res>
    extends _$BrowsingPatternCopyWithImpl<$Res, _$BrowsingPatternImpl>
    implements _$$BrowsingPatternImplCopyWith<$Res> {
  __$$BrowsingPatternImplCopyWithImpl(
      _$BrowsingPatternImpl _value, $Res Function(_$BrowsingPatternImpl) _then)
      : super(_value, _then);

  /// Create a copy of BrowsingPattern
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantId = null,
    Object? viewCount = null,
    Object? averageViewTime = null,
    Object? viewedItems = null,
    Object? lastVisited = freezed,
  }) {
    return _then(_$BrowsingPatternImpl(
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageViewTime: null == averageViewTime
          ? _value.averageViewTime
          : averageViewTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      viewedItems: null == viewedItems
          ? _value._viewedItems
          : viewedItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastVisited: freezed == lastVisited
          ? _value.lastVisited
          : lastVisited // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrowsingPatternImpl implements _BrowsingPattern {
  const _$BrowsingPatternImpl(
      {required this.restaurantId,
      required this.viewCount,
      required this.averageViewTime,
      required final List<String> viewedItems,
      this.lastVisited})
      : _viewedItems = viewedItems;

  factory _$BrowsingPatternImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrowsingPatternImplFromJson(json);

  @override
  final String restaurantId;
  @override
  final int viewCount;
  @override
  final Duration averageViewTime;
  final List<String> _viewedItems;
  @override
  List<String> get viewedItems {
    if (_viewedItems is EqualUnmodifiableListView) return _viewedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_viewedItems);
  }

  @override
  final DateTime? lastVisited;

  @override
  String toString() {
    return 'BrowsingPattern(restaurantId: $restaurantId, viewCount: $viewCount, averageViewTime: $averageViewTime, viewedItems: $viewedItems, lastVisited: $lastVisited)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrowsingPatternImpl &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.averageViewTime, averageViewTime) ||
                other.averageViewTime == averageViewTime) &&
            const DeepCollectionEquality()
                .equals(other._viewedItems, _viewedItems) &&
            (identical(other.lastVisited, lastVisited) ||
                other.lastVisited == lastVisited));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      restaurantId,
      viewCount,
      averageViewTime,
      const DeepCollectionEquality().hash(_viewedItems),
      lastVisited);

  /// Create a copy of BrowsingPattern
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrowsingPatternImplCopyWith<_$BrowsingPatternImpl> get copyWith =>
      __$$BrowsingPatternImplCopyWithImpl<_$BrowsingPatternImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrowsingPatternImplToJson(
      this,
    );
  }
}

abstract class _BrowsingPattern implements BrowsingPattern {
  const factory _BrowsingPattern(
      {required final String restaurantId,
      required final int viewCount,
      required final Duration averageViewTime,
      required final List<String> viewedItems,
      final DateTime? lastVisited}) = _$BrowsingPatternImpl;

  factory _BrowsingPattern.fromJson(Map<String, dynamic> json) =
      _$BrowsingPatternImpl.fromJson;

  @override
  String get restaurantId;
  @override
  int get viewCount;
  @override
  Duration get averageViewTime;
  @override
  List<String> get viewedItems;
  @override
  DateTime? get lastVisited;

  /// Create a copy of BrowsingPattern
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrowsingPatternImplCopyWith<_$BrowsingPatternImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeSlot _$TimeSlotFromJson(Map<String, dynamic> json) {
  return _TimeSlot.fromJson(json);
}

/// @nodoc
mixin _$TimeSlot {
  int get hourStart => throw _privateConstructorUsedError;
  int get hourEnd => throw _privateConstructorUsedError;
  int get frequency => throw _privateConstructorUsedError;
  List<int> get daysOfWeek => throw _privateConstructorUsedError;

  /// Serializes this TimeSlot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeSlotCopyWith<TimeSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSlotCopyWith<$Res> {
  factory $TimeSlotCopyWith(TimeSlot value, $Res Function(TimeSlot) then) =
      _$TimeSlotCopyWithImpl<$Res, TimeSlot>;
  @useResult
  $Res call({int hourStart, int hourEnd, int frequency, List<int> daysOfWeek});
}

/// @nodoc
class _$TimeSlotCopyWithImpl<$Res, $Val extends TimeSlot>
    implements $TimeSlotCopyWith<$Res> {
  _$TimeSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hourStart = null,
    Object? hourEnd = null,
    Object? frequency = null,
    Object? daysOfWeek = null,
  }) {
    return _then(_value.copyWith(
      hourStart: null == hourStart
          ? _value.hourStart
          : hourStart // ignore: cast_nullable_to_non_nullable
              as int,
      hourEnd: null == hourEnd
          ? _value.hourEnd
          : hourEnd // ignore: cast_nullable_to_non_nullable
              as int,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int,
      daysOfWeek: null == daysOfWeek
          ? _value.daysOfWeek
          : daysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeSlotImplCopyWith<$Res>
    implements $TimeSlotCopyWith<$Res> {
  factory _$$TimeSlotImplCopyWith(
          _$TimeSlotImpl value, $Res Function(_$TimeSlotImpl) then) =
      __$$TimeSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hourStart, int hourEnd, int frequency, List<int> daysOfWeek});
}

/// @nodoc
class __$$TimeSlotImplCopyWithImpl<$Res>
    extends _$TimeSlotCopyWithImpl<$Res, _$TimeSlotImpl>
    implements _$$TimeSlotImplCopyWith<$Res> {
  __$$TimeSlotImplCopyWithImpl(
      _$TimeSlotImpl _value, $Res Function(_$TimeSlotImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hourStart = null,
    Object? hourEnd = null,
    Object? frequency = null,
    Object? daysOfWeek = null,
  }) {
    return _then(_$TimeSlotImpl(
      hourStart: null == hourStart
          ? _value.hourStart
          : hourStart // ignore: cast_nullable_to_non_nullable
              as int,
      hourEnd: null == hourEnd
          ? _value.hourEnd
          : hourEnd // ignore: cast_nullable_to_non_nullable
              as int,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int,
      daysOfWeek: null == daysOfWeek
          ? _value._daysOfWeek
          : daysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeSlotImpl implements _TimeSlot {
  const _$TimeSlotImpl(
      {required this.hourStart,
      required this.hourEnd,
      required this.frequency,
      required final List<int> daysOfWeek})
      : _daysOfWeek = daysOfWeek;

  factory _$TimeSlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeSlotImplFromJson(json);

  @override
  final int hourStart;
  @override
  final int hourEnd;
  @override
  final int frequency;
  final List<int> _daysOfWeek;
  @override
  List<int> get daysOfWeek {
    if (_daysOfWeek is EqualUnmodifiableListView) return _daysOfWeek;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_daysOfWeek);
  }

  @override
  String toString() {
    return 'TimeSlot(hourStart: $hourStart, hourEnd: $hourEnd, frequency: $frequency, daysOfWeek: $daysOfWeek)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeSlotImpl &&
            (identical(other.hourStart, hourStart) ||
                other.hourStart == hourStart) &&
            (identical(other.hourEnd, hourEnd) || other.hourEnd == hourEnd) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            const DeepCollectionEquality()
                .equals(other._daysOfWeek, _daysOfWeek));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hourStart, hourEnd, frequency,
      const DeepCollectionEquality().hash(_daysOfWeek));

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeSlotImplCopyWith<_$TimeSlotImpl> get copyWith =>
      __$$TimeSlotImplCopyWithImpl<_$TimeSlotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeSlotImplToJson(
      this,
    );
  }
}

abstract class _TimeSlot implements TimeSlot {
  const factory _TimeSlot(
      {required final int hourStart,
      required final int hourEnd,
      required final int frequency,
      required final List<int> daysOfWeek}) = _$TimeSlotImpl;

  factory _TimeSlot.fromJson(Map<String, dynamic> json) =
      _$TimeSlotImpl.fromJson;

  @override
  int get hourStart;
  @override
  int get hourEnd;
  @override
  int get frequency;
  @override
  List<int> get daysOfWeek;

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeSlotImplCopyWith<_$TimeSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
