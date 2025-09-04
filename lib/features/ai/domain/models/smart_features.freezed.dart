// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'smart_features.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SmartOrder _$SmartOrderFromJson(Map<String, dynamic> json) {
  return _SmartOrder.fromJson(json);
}

/// @nodoc
mixin _$SmartOrder {
  String get userId => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;
  List<SmartOrderItem> get predictedItems => throw _privateConstructorUsedError;
  Map<String, dynamic> get orderContext => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;
  String? get restaurantId => throw _privateConstructorUsedError;
  double? get estimatedTotal => throw _privateConstructorUsedError;
  int? get estimatedDeliveryTime => throw _privateConstructorUsedError;

  /// Serializes this SmartOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SmartOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SmartOrderCopyWith<SmartOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartOrderCopyWith<$Res> {
  factory $SmartOrderCopyWith(
          SmartOrder value, $Res Function(SmartOrder) then) =
      _$SmartOrderCopyWithImpl<$Res, SmartOrder>;
  @useResult
  $Res call(
      {String userId,
      String sessionId,
      List<SmartOrderItem> predictedItems,
      Map<String, dynamic> orderContext,
      double confidence,
      DateTime generatedAt,
      String? restaurantId,
      double? estimatedTotal,
      int? estimatedDeliveryTime});
}

/// @nodoc
class _$SmartOrderCopyWithImpl<$Res, $Val extends SmartOrder>
    implements $SmartOrderCopyWith<$Res> {
  _$SmartOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SmartOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? sessionId = null,
    Object? predictedItems = null,
    Object? orderContext = null,
    Object? confidence = null,
    Object? generatedAt = null,
    Object? restaurantId = freezed,
    Object? estimatedTotal = freezed,
    Object? estimatedDeliveryTime = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      predictedItems: null == predictedItems
          ? _value.predictedItems
          : predictedItems // ignore: cast_nullable_to_non_nullable
              as List<SmartOrderItem>,
      orderContext: null == orderContext
          ? _value.orderContext
          : orderContext // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      restaurantId: freezed == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedTotal: freezed == estimatedTotal
          ? _value.estimatedTotal
          : estimatedTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedDeliveryTime: freezed == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmartOrderImplCopyWith<$Res>
    implements $SmartOrderCopyWith<$Res> {
  factory _$$SmartOrderImplCopyWith(
          _$SmartOrderImpl value, $Res Function(_$SmartOrderImpl) then) =
      __$$SmartOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String sessionId,
      List<SmartOrderItem> predictedItems,
      Map<String, dynamic> orderContext,
      double confidence,
      DateTime generatedAt,
      String? restaurantId,
      double? estimatedTotal,
      int? estimatedDeliveryTime});
}

/// @nodoc
class __$$SmartOrderImplCopyWithImpl<$Res>
    extends _$SmartOrderCopyWithImpl<$Res, _$SmartOrderImpl>
    implements _$$SmartOrderImplCopyWith<$Res> {
  __$$SmartOrderImplCopyWithImpl(
      _$SmartOrderImpl _value, $Res Function(_$SmartOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmartOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? sessionId = null,
    Object? predictedItems = null,
    Object? orderContext = null,
    Object? confidence = null,
    Object? generatedAt = null,
    Object? restaurantId = freezed,
    Object? estimatedTotal = freezed,
    Object? estimatedDeliveryTime = freezed,
  }) {
    return _then(_$SmartOrderImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      predictedItems: null == predictedItems
          ? _value._predictedItems
          : predictedItems // ignore: cast_nullable_to_non_nullable
              as List<SmartOrderItem>,
      orderContext: null == orderContext
          ? _value._orderContext
          : orderContext // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      restaurantId: freezed == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedTotal: freezed == estimatedTotal
          ? _value.estimatedTotal
          : estimatedTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedDeliveryTime: freezed == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SmartOrderImpl implements _SmartOrder {
  const _$SmartOrderImpl(
      {required this.userId,
      required this.sessionId,
      required final List<SmartOrderItem> predictedItems,
      required final Map<String, dynamic> orderContext,
      required this.confidence,
      required this.generatedAt,
      this.restaurantId,
      this.estimatedTotal,
      this.estimatedDeliveryTime})
      : _predictedItems = predictedItems,
        _orderContext = orderContext;

  factory _$SmartOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmartOrderImplFromJson(json);

  @override
  final String userId;
  @override
  final String sessionId;
  final List<SmartOrderItem> _predictedItems;
  @override
  List<SmartOrderItem> get predictedItems {
    if (_predictedItems is EqualUnmodifiableListView) return _predictedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_predictedItems);
  }

  final Map<String, dynamic> _orderContext;
  @override
  Map<String, dynamic> get orderContext {
    if (_orderContext is EqualUnmodifiableMapView) return _orderContext;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_orderContext);
  }

  @override
  final double confidence;
  @override
  final DateTime generatedAt;
  @override
  final String? restaurantId;
  @override
  final double? estimatedTotal;
  @override
  final int? estimatedDeliveryTime;

  @override
  String toString() {
    return 'SmartOrder(userId: $userId, sessionId: $sessionId, predictedItems: $predictedItems, orderContext: $orderContext, confidence: $confidence, generatedAt: $generatedAt, restaurantId: $restaurantId, estimatedTotal: $estimatedTotal, estimatedDeliveryTime: $estimatedDeliveryTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmartOrderImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            const DeepCollectionEquality()
                .equals(other._predictedItems, _predictedItems) &&
            const DeepCollectionEquality()
                .equals(other._orderContext, _orderContext) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.estimatedTotal, estimatedTotal) ||
                other.estimatedTotal == estimatedTotal) &&
            (identical(other.estimatedDeliveryTime, estimatedDeliveryTime) ||
                other.estimatedDeliveryTime == estimatedDeliveryTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      sessionId,
      const DeepCollectionEquality().hash(_predictedItems),
      const DeepCollectionEquality().hash(_orderContext),
      confidence,
      generatedAt,
      restaurantId,
      estimatedTotal,
      estimatedDeliveryTime);

  /// Create a copy of SmartOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SmartOrderImplCopyWith<_$SmartOrderImpl> get copyWith =>
      __$$SmartOrderImplCopyWithImpl<_$SmartOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmartOrderImplToJson(
      this,
    );
  }
}

abstract class _SmartOrder implements SmartOrder {
  const factory _SmartOrder(
      {required final String userId,
      required final String sessionId,
      required final List<SmartOrderItem> predictedItems,
      required final Map<String, dynamic> orderContext,
      required final double confidence,
      required final DateTime generatedAt,
      final String? restaurantId,
      final double? estimatedTotal,
      final int? estimatedDeliveryTime}) = _$SmartOrderImpl;

  factory _SmartOrder.fromJson(Map<String, dynamic> json) =
      _$SmartOrderImpl.fromJson;

  @override
  String get userId;
  @override
  String get sessionId;
  @override
  List<SmartOrderItem> get predictedItems;
  @override
  Map<String, dynamic> get orderContext;
  @override
  double get confidence;
  @override
  DateTime get generatedAt;
  @override
  String? get restaurantId;
  @override
  double? get estimatedTotal;
  @override
  int? get estimatedDeliveryTime;

  /// Create a copy of SmartOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SmartOrderImplCopyWith<_$SmartOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SmartOrderItem _$SmartOrderItemFromJson(Map<String, dynamic> json) {
  return _SmartOrderItem.fromJson(json);
}

/// @nodoc
mixin _$SmartOrderItem {
  String get itemId => throw _privateConstructorUsedError;
  String get itemName => throw _privateConstructorUsedError;
  String get restaurantId => throw _privateConstructorUsedError;
  int get predictedQuantity => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  List<String> get reasons => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  List<String> get suggestedCustomizations =>
      throw _privateConstructorUsedError;

  /// Serializes this SmartOrderItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SmartOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SmartOrderItemCopyWith<SmartOrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartOrderItemCopyWith<$Res> {
  factory $SmartOrderItemCopyWith(
          SmartOrderItem value, $Res Function(SmartOrderItem) then) =
      _$SmartOrderItemCopyWithImpl<$Res, SmartOrderItem>;
  @useResult
  $Res call(
      {String itemId,
      String itemName,
      String restaurantId,
      int predictedQuantity,
      double confidence,
      List<String> reasons,
      double? price,
      String? imageUrl,
      List<String> suggestedCustomizations});
}

/// @nodoc
class _$SmartOrderItemCopyWithImpl<$Res, $Val extends SmartOrderItem>
    implements $SmartOrderItemCopyWith<$Res> {
  _$SmartOrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SmartOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? itemName = null,
    Object? restaurantId = null,
    Object? predictedQuantity = null,
    Object? confidence = null,
    Object? reasons = null,
    Object? price = freezed,
    Object? imageUrl = freezed,
    Object? suggestedCustomizations = null,
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
      predictedQuantity: null == predictedQuantity
          ? _value.predictedQuantity
          : predictedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      reasons: null == reasons
          ? _value.reasons
          : reasons // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      suggestedCustomizations: null == suggestedCustomizations
          ? _value.suggestedCustomizations
          : suggestedCustomizations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmartOrderItemImplCopyWith<$Res>
    implements $SmartOrderItemCopyWith<$Res> {
  factory _$$SmartOrderItemImplCopyWith(_$SmartOrderItemImpl value,
          $Res Function(_$SmartOrderItemImpl) then) =
      __$$SmartOrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String itemId,
      String itemName,
      String restaurantId,
      int predictedQuantity,
      double confidence,
      List<String> reasons,
      double? price,
      String? imageUrl,
      List<String> suggestedCustomizations});
}

/// @nodoc
class __$$SmartOrderItemImplCopyWithImpl<$Res>
    extends _$SmartOrderItemCopyWithImpl<$Res, _$SmartOrderItemImpl>
    implements _$$SmartOrderItemImplCopyWith<$Res> {
  __$$SmartOrderItemImplCopyWithImpl(
      _$SmartOrderItemImpl _value, $Res Function(_$SmartOrderItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmartOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? itemName = null,
    Object? restaurantId = null,
    Object? predictedQuantity = null,
    Object? confidence = null,
    Object? reasons = null,
    Object? price = freezed,
    Object? imageUrl = freezed,
    Object? suggestedCustomizations = null,
  }) {
    return _then(_$SmartOrderItemImpl(
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
      predictedQuantity: null == predictedQuantity
          ? _value.predictedQuantity
          : predictedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      reasons: null == reasons
          ? _value._reasons
          : reasons // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      suggestedCustomizations: null == suggestedCustomizations
          ? _value._suggestedCustomizations
          : suggestedCustomizations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SmartOrderItemImpl implements _SmartOrderItem {
  const _$SmartOrderItemImpl(
      {required this.itemId,
      required this.itemName,
      required this.restaurantId,
      required this.predictedQuantity,
      required this.confidence,
      required final List<String> reasons,
      this.price,
      this.imageUrl,
      final List<String> suggestedCustomizations = const []})
      : _reasons = reasons,
        _suggestedCustomizations = suggestedCustomizations;

  factory _$SmartOrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmartOrderItemImplFromJson(json);

  @override
  final String itemId;
  @override
  final String itemName;
  @override
  final String restaurantId;
  @override
  final int predictedQuantity;
  @override
  final double confidence;
  final List<String> _reasons;
  @override
  List<String> get reasons {
    if (_reasons is EqualUnmodifiableListView) return _reasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reasons);
  }

  @override
  final double? price;
  @override
  final String? imageUrl;
  final List<String> _suggestedCustomizations;
  @override
  @JsonKey()
  List<String> get suggestedCustomizations {
    if (_suggestedCustomizations is EqualUnmodifiableListView)
      return _suggestedCustomizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedCustomizations);
  }

  @override
  String toString() {
    return 'SmartOrderItem(itemId: $itemId, itemName: $itemName, restaurantId: $restaurantId, predictedQuantity: $predictedQuantity, confidence: $confidence, reasons: $reasons, price: $price, imageUrl: $imageUrl, suggestedCustomizations: $suggestedCustomizations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmartOrderItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.predictedQuantity, predictedQuantity) ||
                other.predictedQuantity == predictedQuantity) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality().equals(other._reasons, _reasons) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(
                other._suggestedCustomizations, _suggestedCustomizations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      itemId,
      itemName,
      restaurantId,
      predictedQuantity,
      confidence,
      const DeepCollectionEquality().hash(_reasons),
      price,
      imageUrl,
      const DeepCollectionEquality().hash(_suggestedCustomizations));

  /// Create a copy of SmartOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SmartOrderItemImplCopyWith<_$SmartOrderItemImpl> get copyWith =>
      __$$SmartOrderItemImplCopyWithImpl<_$SmartOrderItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmartOrderItemImplToJson(
      this,
    );
  }
}

abstract class _SmartOrderItem implements SmartOrderItem {
  const factory _SmartOrderItem(
      {required final String itemId,
      required final String itemName,
      required final String restaurantId,
      required final int predictedQuantity,
      required final double confidence,
      required final List<String> reasons,
      final double? price,
      final String? imageUrl,
      final List<String> suggestedCustomizations}) = _$SmartOrderItemImpl;

  factory _SmartOrderItem.fromJson(Map<String, dynamic> json) =
      _$SmartOrderItemImpl.fromJson;

  @override
  String get itemId;
  @override
  String get itemName;
  @override
  String get restaurantId;
  @override
  int get predictedQuantity;
  @override
  double get confidence;
  @override
  List<String> get reasons;
  @override
  double? get price;
  @override
  String? get imageUrl;
  @override
  List<String> get suggestedCustomizations;

  /// Create a copy of SmartOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SmartOrderItemImplCopyWith<_$SmartOrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherBasedSuggestion _$WeatherBasedSuggestionFromJson(
    Map<String, dynamic> json) {
  return _WeatherBasedSuggestion.fromJson(json);
}

/// @nodoc
mixin _$WeatherBasedSuggestion {
  WeatherCondition get weatherCondition => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  String get temperatureUnit => throw _privateConstructorUsedError;
  List<SuggestedDish> get suggestedDishes => throw _privateConstructorUsedError;
  String get reasoning => throw _privateConstructorUsedError;
  DateTime? get validUntil => throw _privateConstructorUsedError;

  /// Serializes this WeatherBasedSuggestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherBasedSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherBasedSuggestionCopyWith<WeatherBasedSuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherBasedSuggestionCopyWith<$Res> {
  factory $WeatherBasedSuggestionCopyWith(WeatherBasedSuggestion value,
          $Res Function(WeatherBasedSuggestion) then) =
      _$WeatherBasedSuggestionCopyWithImpl<$Res, WeatherBasedSuggestion>;
  @useResult
  $Res call(
      {WeatherCondition weatherCondition,
      double temperature,
      String temperatureUnit,
      List<SuggestedDish> suggestedDishes,
      String reasoning,
      DateTime? validUntil});
}

/// @nodoc
class _$WeatherBasedSuggestionCopyWithImpl<$Res,
        $Val extends WeatherBasedSuggestion>
    implements $WeatherBasedSuggestionCopyWith<$Res> {
  _$WeatherBasedSuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherBasedSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherCondition = null,
    Object? temperature = null,
    Object? temperatureUnit = null,
    Object? suggestedDishes = null,
    Object? reasoning = null,
    Object? validUntil = freezed,
  }) {
    return _then(_value.copyWith(
      weatherCondition: null == weatherCondition
          ? _value.weatherCondition
          : weatherCondition // ignore: cast_nullable_to_non_nullable
              as WeatherCondition,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      temperatureUnit: null == temperatureUnit
          ? _value.temperatureUnit
          : temperatureUnit // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedDishes: null == suggestedDishes
          ? _value.suggestedDishes
          : suggestedDishes // ignore: cast_nullable_to_non_nullable
              as List<SuggestedDish>,
      reasoning: null == reasoning
          ? _value.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as String,
      validUntil: freezed == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherBasedSuggestionImplCopyWith<$Res>
    implements $WeatherBasedSuggestionCopyWith<$Res> {
  factory _$$WeatherBasedSuggestionImplCopyWith(
          _$WeatherBasedSuggestionImpl value,
          $Res Function(_$WeatherBasedSuggestionImpl) then) =
      __$$WeatherBasedSuggestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WeatherCondition weatherCondition,
      double temperature,
      String temperatureUnit,
      List<SuggestedDish> suggestedDishes,
      String reasoning,
      DateTime? validUntil});
}

/// @nodoc
class __$$WeatherBasedSuggestionImplCopyWithImpl<$Res>
    extends _$WeatherBasedSuggestionCopyWithImpl<$Res,
        _$WeatherBasedSuggestionImpl>
    implements _$$WeatherBasedSuggestionImplCopyWith<$Res> {
  __$$WeatherBasedSuggestionImplCopyWithImpl(
      _$WeatherBasedSuggestionImpl _value,
      $Res Function(_$WeatherBasedSuggestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherBasedSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherCondition = null,
    Object? temperature = null,
    Object? temperatureUnit = null,
    Object? suggestedDishes = null,
    Object? reasoning = null,
    Object? validUntil = freezed,
  }) {
    return _then(_$WeatherBasedSuggestionImpl(
      weatherCondition: null == weatherCondition
          ? _value.weatherCondition
          : weatherCondition // ignore: cast_nullable_to_non_nullable
              as WeatherCondition,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      temperatureUnit: null == temperatureUnit
          ? _value.temperatureUnit
          : temperatureUnit // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedDishes: null == suggestedDishes
          ? _value._suggestedDishes
          : suggestedDishes // ignore: cast_nullable_to_non_nullable
              as List<SuggestedDish>,
      reasoning: null == reasoning
          ? _value.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as String,
      validUntil: freezed == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherBasedSuggestionImpl implements _WeatherBasedSuggestion {
  const _$WeatherBasedSuggestionImpl(
      {required this.weatherCondition,
      required this.temperature,
      required this.temperatureUnit,
      required final List<SuggestedDish> suggestedDishes,
      required this.reasoning,
      this.validUntil})
      : _suggestedDishes = suggestedDishes;

  factory _$WeatherBasedSuggestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherBasedSuggestionImplFromJson(json);

  @override
  final WeatherCondition weatherCondition;
  @override
  final double temperature;
  @override
  final String temperatureUnit;
  final List<SuggestedDish> _suggestedDishes;
  @override
  List<SuggestedDish> get suggestedDishes {
    if (_suggestedDishes is EqualUnmodifiableListView) return _suggestedDishes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedDishes);
  }

  @override
  final String reasoning;
  @override
  final DateTime? validUntil;

  @override
  String toString() {
    return 'WeatherBasedSuggestion(weatherCondition: $weatherCondition, temperature: $temperature, temperatureUnit: $temperatureUnit, suggestedDishes: $suggestedDishes, reasoning: $reasoning, validUntil: $validUntil)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherBasedSuggestionImpl &&
            (identical(other.weatherCondition, weatherCondition) ||
                other.weatherCondition == weatherCondition) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.temperatureUnit, temperatureUnit) ||
                other.temperatureUnit == temperatureUnit) &&
            const DeepCollectionEquality()
                .equals(other._suggestedDishes, _suggestedDishes) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      weatherCondition,
      temperature,
      temperatureUnit,
      const DeepCollectionEquality().hash(_suggestedDishes),
      reasoning,
      validUntil);

  /// Create a copy of WeatherBasedSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherBasedSuggestionImplCopyWith<_$WeatherBasedSuggestionImpl>
      get copyWith => __$$WeatherBasedSuggestionImplCopyWithImpl<
          _$WeatherBasedSuggestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherBasedSuggestionImplToJson(
      this,
    );
  }
}

abstract class _WeatherBasedSuggestion implements WeatherBasedSuggestion {
  const factory _WeatherBasedSuggestion(
      {required final WeatherCondition weatherCondition,
      required final double temperature,
      required final String temperatureUnit,
      required final List<SuggestedDish> suggestedDishes,
      required final String reasoning,
      final DateTime? validUntil}) = _$WeatherBasedSuggestionImpl;

  factory _WeatherBasedSuggestion.fromJson(Map<String, dynamic> json) =
      _$WeatherBasedSuggestionImpl.fromJson;

  @override
  WeatherCondition get weatherCondition;
  @override
  double get temperature;
  @override
  String get temperatureUnit;
  @override
  List<SuggestedDish> get suggestedDishes;
  @override
  String get reasoning;
  @override
  DateTime? get validUntil;

  /// Create a copy of WeatherBasedSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherBasedSuggestionImplCopyWith<_$WeatherBasedSuggestionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SuggestedDish _$SuggestedDishFromJson(Map<String, dynamic> json) {
  return _SuggestedDish.fromJson(json);
}

/// @nodoc
mixin _$SuggestedDish {
  String get dishId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get restaurantName => throw _privateConstructorUsedError;
  double get relevanceScore => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get estimatedDeliveryTime => throw _privateConstructorUsedError;

  /// Serializes this SuggestedDish to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SuggestedDish
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuggestedDishCopyWith<SuggestedDish> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestedDishCopyWith<$Res> {
  factory $SuggestedDishCopyWith(
          SuggestedDish value, $Res Function(SuggestedDish) then) =
      _$SuggestedDishCopyWithImpl<$Res, SuggestedDish>;
  @useResult
  $Res call(
      {String dishId,
      String name,
      String restaurantName,
      double relevanceScore,
      String reason,
      String? imageUrl,
      double? price,
      int? estimatedDeliveryTime});
}

/// @nodoc
class _$SuggestedDishCopyWithImpl<$Res, $Val extends SuggestedDish>
    implements $SuggestedDishCopyWith<$Res> {
  _$SuggestedDishCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SuggestedDish
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dishId = null,
    Object? name = null,
    Object? restaurantName = null,
    Object? relevanceScore = null,
    Object? reason = null,
    Object? imageUrl = freezed,
    Object? price = freezed,
    Object? estimatedDeliveryTime = freezed,
  }) {
    return _then(_value.copyWith(
      dishId: null == dishId
          ? _value.dishId
          : dishId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      relevanceScore: null == relevanceScore
          ? _value.relevanceScore
          : relevanceScore // ignore: cast_nullable_to_non_nullable
              as double,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedDeliveryTime: freezed == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuggestedDishImplCopyWith<$Res>
    implements $SuggestedDishCopyWith<$Res> {
  factory _$$SuggestedDishImplCopyWith(
          _$SuggestedDishImpl value, $Res Function(_$SuggestedDishImpl) then) =
      __$$SuggestedDishImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dishId,
      String name,
      String restaurantName,
      double relevanceScore,
      String reason,
      String? imageUrl,
      double? price,
      int? estimatedDeliveryTime});
}

/// @nodoc
class __$$SuggestedDishImplCopyWithImpl<$Res>
    extends _$SuggestedDishCopyWithImpl<$Res, _$SuggestedDishImpl>
    implements _$$SuggestedDishImplCopyWith<$Res> {
  __$$SuggestedDishImplCopyWithImpl(
      _$SuggestedDishImpl _value, $Res Function(_$SuggestedDishImpl) _then)
      : super(_value, _then);

  /// Create a copy of SuggestedDish
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dishId = null,
    Object? name = null,
    Object? restaurantName = null,
    Object? relevanceScore = null,
    Object? reason = null,
    Object? imageUrl = freezed,
    Object? price = freezed,
    Object? estimatedDeliveryTime = freezed,
  }) {
    return _then(_$SuggestedDishImpl(
      dishId: null == dishId
          ? _value.dishId
          : dishId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      relevanceScore: null == relevanceScore
          ? _value.relevanceScore
          : relevanceScore // ignore: cast_nullable_to_non_nullable
              as double,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedDeliveryTime: freezed == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestedDishImpl implements _SuggestedDish {
  const _$SuggestedDishImpl(
      {required this.dishId,
      required this.name,
      required this.restaurantName,
      required this.relevanceScore,
      required this.reason,
      this.imageUrl,
      this.price,
      this.estimatedDeliveryTime});

  factory _$SuggestedDishImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestedDishImplFromJson(json);

  @override
  final String dishId;
  @override
  final String name;
  @override
  final String restaurantName;
  @override
  final double relevanceScore;
  @override
  final String reason;
  @override
  final String? imageUrl;
  @override
  final double? price;
  @override
  final int? estimatedDeliveryTime;

  @override
  String toString() {
    return 'SuggestedDish(dishId: $dishId, name: $name, restaurantName: $restaurantName, relevanceScore: $relevanceScore, reason: $reason, imageUrl: $imageUrl, price: $price, estimatedDeliveryTime: $estimatedDeliveryTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestedDishImpl &&
            (identical(other.dishId, dishId) || other.dishId == dishId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            (identical(other.relevanceScore, relevanceScore) ||
                other.relevanceScore == relevanceScore) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.estimatedDeliveryTime, estimatedDeliveryTime) ||
                other.estimatedDeliveryTime == estimatedDeliveryTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dishId, name, restaurantName,
      relevanceScore, reason, imageUrl, price, estimatedDeliveryTime);

  /// Create a copy of SuggestedDish
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestedDishImplCopyWith<_$SuggestedDishImpl> get copyWith =>
      __$$SuggestedDishImplCopyWithImpl<_$SuggestedDishImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestedDishImplToJson(
      this,
    );
  }
}

abstract class _SuggestedDish implements SuggestedDish {
  const factory _SuggestedDish(
      {required final String dishId,
      required final String name,
      required final String restaurantName,
      required final double relevanceScore,
      required final String reason,
      final String? imageUrl,
      final double? price,
      final int? estimatedDeliveryTime}) = _$SuggestedDishImpl;

  factory _SuggestedDish.fromJson(Map<String, dynamic> json) =
      _$SuggestedDishImpl.fromJson;

  @override
  String get dishId;
  @override
  String get name;
  @override
  String get restaurantName;
  @override
  double get relevanceScore;
  @override
  String get reason;
  @override
  String? get imageUrl;
  @override
  double? get price;
  @override
  int? get estimatedDeliveryTime;

  /// Create a copy of SuggestedDish
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuggestedDishImplCopyWith<_$SuggestedDishImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SmartNotification _$SmartNotificationFromJson(Map<String, dynamic> json) {
  return _SmartNotification.fromJson(json);
}

/// @nodoc
mixin _$SmartNotification {
  String get notificationId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  NotificationTrigger get trigger => throw _privateConstructorUsedError;
  DateTime get scheduledFor => throw _privateConstructorUsedError;
  String? get actionText => throw _privateConstructorUsedError;
  String? get actionRoute => throw _privateConstructorUsedError;
  Map<String, dynamic>? get actionData => throw _privateConstructorUsedError;
  NotificationStatus get status => throw _privateConstructorUsedError;
  DateTime? get sentAt => throw _privateConstructorUsedError;
  DateTime? get readAt => throw _privateConstructorUsedError;

  /// Serializes this SmartNotification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SmartNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SmartNotificationCopyWith<SmartNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartNotificationCopyWith<$Res> {
  factory $SmartNotificationCopyWith(
          SmartNotification value, $Res Function(SmartNotification) then) =
      _$SmartNotificationCopyWithImpl<$Res, SmartNotification>;
  @useResult
  $Res call(
      {String notificationId,
      String userId,
      NotificationType type,
      String title,
      String message,
      NotificationTrigger trigger,
      DateTime scheduledFor,
      String? actionText,
      String? actionRoute,
      Map<String, dynamic>? actionData,
      NotificationStatus status,
      DateTime? sentAt,
      DateTime? readAt});
}

/// @nodoc
class _$SmartNotificationCopyWithImpl<$Res, $Val extends SmartNotification>
    implements $SmartNotificationCopyWith<$Res> {
  _$SmartNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SmartNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? message = null,
    Object? trigger = null,
    Object? scheduledFor = null,
    Object? actionText = freezed,
    Object? actionRoute = freezed,
    Object? actionData = freezed,
    Object? status = null,
    Object? sentAt = freezed,
    Object? readAt = freezed,
  }) {
    return _then(_value.copyWith(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      trigger: null == trigger
          ? _value.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as NotificationTrigger,
      scheduledFor: null == scheduledFor
          ? _value.scheduledFor
          : scheduledFor // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actionText: freezed == actionText
          ? _value.actionText
          : actionText // ignore: cast_nullable_to_non_nullable
              as String?,
      actionRoute: freezed == actionRoute
          ? _value.actionRoute
          : actionRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      actionData: freezed == actionData
          ? _value.actionData
          : actionData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NotificationStatus,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmartNotificationImplCopyWith<$Res>
    implements $SmartNotificationCopyWith<$Res> {
  factory _$$SmartNotificationImplCopyWith(_$SmartNotificationImpl value,
          $Res Function(_$SmartNotificationImpl) then) =
      __$$SmartNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String notificationId,
      String userId,
      NotificationType type,
      String title,
      String message,
      NotificationTrigger trigger,
      DateTime scheduledFor,
      String? actionText,
      String? actionRoute,
      Map<String, dynamic>? actionData,
      NotificationStatus status,
      DateTime? sentAt,
      DateTime? readAt});
}

/// @nodoc
class __$$SmartNotificationImplCopyWithImpl<$Res>
    extends _$SmartNotificationCopyWithImpl<$Res, _$SmartNotificationImpl>
    implements _$$SmartNotificationImplCopyWith<$Res> {
  __$$SmartNotificationImplCopyWithImpl(_$SmartNotificationImpl _value,
      $Res Function(_$SmartNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmartNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? message = null,
    Object? trigger = null,
    Object? scheduledFor = null,
    Object? actionText = freezed,
    Object? actionRoute = freezed,
    Object? actionData = freezed,
    Object? status = null,
    Object? sentAt = freezed,
    Object? readAt = freezed,
  }) {
    return _then(_$SmartNotificationImpl(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      trigger: null == trigger
          ? _value.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as NotificationTrigger,
      scheduledFor: null == scheduledFor
          ? _value.scheduledFor
          : scheduledFor // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actionText: freezed == actionText
          ? _value.actionText
          : actionText // ignore: cast_nullable_to_non_nullable
              as String?,
      actionRoute: freezed == actionRoute
          ? _value.actionRoute
          : actionRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      actionData: freezed == actionData
          ? _value._actionData
          : actionData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NotificationStatus,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SmartNotificationImpl implements _SmartNotification {
  const _$SmartNotificationImpl(
      {required this.notificationId,
      required this.userId,
      required this.type,
      required this.title,
      required this.message,
      required this.trigger,
      required this.scheduledFor,
      this.actionText,
      this.actionRoute,
      final Map<String, dynamic>? actionData,
      this.status = NotificationStatus.pending,
      this.sentAt,
      this.readAt})
      : _actionData = actionData;

  factory _$SmartNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmartNotificationImplFromJson(json);

  @override
  final String notificationId;
  @override
  final String userId;
  @override
  final NotificationType type;
  @override
  final String title;
  @override
  final String message;
  @override
  final NotificationTrigger trigger;
  @override
  final DateTime scheduledFor;
  @override
  final String? actionText;
  @override
  final String? actionRoute;
  final Map<String, dynamic>? _actionData;
  @override
  Map<String, dynamic>? get actionData {
    final value = _actionData;
    if (value == null) return null;
    if (_actionData is EqualUnmodifiableMapView) return _actionData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final NotificationStatus status;
  @override
  final DateTime? sentAt;
  @override
  final DateTime? readAt;

  @override
  String toString() {
    return 'SmartNotification(notificationId: $notificationId, userId: $userId, type: $type, title: $title, message: $message, trigger: $trigger, scheduledFor: $scheduledFor, actionText: $actionText, actionRoute: $actionRoute, actionData: $actionData, status: $status, sentAt: $sentAt, readAt: $readAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmartNotificationImpl &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.trigger, trigger) || other.trigger == trigger) &&
            (identical(other.scheduledFor, scheduledFor) ||
                other.scheduledFor == scheduledFor) &&
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            (identical(other.actionRoute, actionRoute) ||
                other.actionRoute == actionRoute) &&
            const DeepCollectionEquality()
                .equals(other._actionData, _actionData) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.readAt, readAt) || other.readAt == readAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      notificationId,
      userId,
      type,
      title,
      message,
      trigger,
      scheduledFor,
      actionText,
      actionRoute,
      const DeepCollectionEquality().hash(_actionData),
      status,
      sentAt,
      readAt);

  /// Create a copy of SmartNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SmartNotificationImplCopyWith<_$SmartNotificationImpl> get copyWith =>
      __$$SmartNotificationImplCopyWithImpl<_$SmartNotificationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmartNotificationImplToJson(
      this,
    );
  }
}

abstract class _SmartNotification implements SmartNotification {
  const factory _SmartNotification(
      {required final String notificationId,
      required final String userId,
      required final NotificationType type,
      required final String title,
      required final String message,
      required final NotificationTrigger trigger,
      required final DateTime scheduledFor,
      final String? actionText,
      final String? actionRoute,
      final Map<String, dynamic>? actionData,
      final NotificationStatus status,
      final DateTime? sentAt,
      final DateTime? readAt}) = _$SmartNotificationImpl;

  factory _SmartNotification.fromJson(Map<String, dynamic> json) =
      _$SmartNotificationImpl.fromJson;

  @override
  String get notificationId;
  @override
  String get userId;
  @override
  NotificationType get type;
  @override
  String get title;
  @override
  String get message;
  @override
  NotificationTrigger get trigger;
  @override
  DateTime get scheduledFor;
  @override
  String? get actionText;
  @override
  String? get actionRoute;
  @override
  Map<String, dynamic>? get actionData;
  @override
  NotificationStatus get status;
  @override
  DateTime? get sentAt;
  @override
  DateTime? get readAt;

  /// Create a copy of SmartNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SmartNotificationImplCopyWith<_$SmartNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PredictiveAnalytics _$PredictiveAnalyticsFromJson(Map<String, dynamic> json) {
  return _PredictiveAnalytics.fromJson(json);
}

/// @nodoc
mixin _$PredictiveAnalytics {
  String get userId => throw _privateConstructorUsedError;
  PredictiveInsights get insights => throw _privateConstructorUsedError;
  List<ChurnPrediction> get churnPredictions =>
      throw _privateConstructorUsedError;
  List<OrderPrediction> get nextOrderPredictions =>
      throw _privateConstructorUsedError;
  LifetimeValuePrediction get lifetimeValue =>
      throw _privateConstructorUsedError;
  DateTime? get lastAnalyzed => throw _privateConstructorUsedError;

  /// Serializes this PredictiveAnalytics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PredictiveAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PredictiveAnalyticsCopyWith<PredictiveAnalytics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictiveAnalyticsCopyWith<$Res> {
  factory $PredictiveAnalyticsCopyWith(
          PredictiveAnalytics value, $Res Function(PredictiveAnalytics) then) =
      _$PredictiveAnalyticsCopyWithImpl<$Res, PredictiveAnalytics>;
  @useResult
  $Res call(
      {String userId,
      PredictiveInsights insights,
      List<ChurnPrediction> churnPredictions,
      List<OrderPrediction> nextOrderPredictions,
      LifetimeValuePrediction lifetimeValue,
      DateTime? lastAnalyzed});

  $PredictiveInsightsCopyWith<$Res> get insights;
  $LifetimeValuePredictionCopyWith<$Res> get lifetimeValue;
}

/// @nodoc
class _$PredictiveAnalyticsCopyWithImpl<$Res, $Val extends PredictiveAnalytics>
    implements $PredictiveAnalyticsCopyWith<$Res> {
  _$PredictiveAnalyticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PredictiveAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? insights = null,
    Object? churnPredictions = null,
    Object? nextOrderPredictions = null,
    Object? lifetimeValue = null,
    Object? lastAnalyzed = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      insights: null == insights
          ? _value.insights
          : insights // ignore: cast_nullable_to_non_nullable
              as PredictiveInsights,
      churnPredictions: null == churnPredictions
          ? _value.churnPredictions
          : churnPredictions // ignore: cast_nullable_to_non_nullable
              as List<ChurnPrediction>,
      nextOrderPredictions: null == nextOrderPredictions
          ? _value.nextOrderPredictions
          : nextOrderPredictions // ignore: cast_nullable_to_non_nullable
              as List<OrderPrediction>,
      lifetimeValue: null == lifetimeValue
          ? _value.lifetimeValue
          : lifetimeValue // ignore: cast_nullable_to_non_nullable
              as LifetimeValuePrediction,
      lastAnalyzed: freezed == lastAnalyzed
          ? _value.lastAnalyzed
          : lastAnalyzed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of PredictiveAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictiveInsightsCopyWith<$Res> get insights {
    return $PredictiveInsightsCopyWith<$Res>(_value.insights, (value) {
      return _then(_value.copyWith(insights: value) as $Val);
    });
  }

  /// Create a copy of PredictiveAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LifetimeValuePredictionCopyWith<$Res> get lifetimeValue {
    return $LifetimeValuePredictionCopyWith<$Res>(_value.lifetimeValue,
        (value) {
      return _then(_value.copyWith(lifetimeValue: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PredictiveAnalyticsImplCopyWith<$Res>
    implements $PredictiveAnalyticsCopyWith<$Res> {
  factory _$$PredictiveAnalyticsImplCopyWith(_$PredictiveAnalyticsImpl value,
          $Res Function(_$PredictiveAnalyticsImpl) then) =
      __$$PredictiveAnalyticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      PredictiveInsights insights,
      List<ChurnPrediction> churnPredictions,
      List<OrderPrediction> nextOrderPredictions,
      LifetimeValuePrediction lifetimeValue,
      DateTime? lastAnalyzed});

  @override
  $PredictiveInsightsCopyWith<$Res> get insights;
  @override
  $LifetimeValuePredictionCopyWith<$Res> get lifetimeValue;
}

/// @nodoc
class __$$PredictiveAnalyticsImplCopyWithImpl<$Res>
    extends _$PredictiveAnalyticsCopyWithImpl<$Res, _$PredictiveAnalyticsImpl>
    implements _$$PredictiveAnalyticsImplCopyWith<$Res> {
  __$$PredictiveAnalyticsImplCopyWithImpl(_$PredictiveAnalyticsImpl _value,
      $Res Function(_$PredictiveAnalyticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PredictiveAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? insights = null,
    Object? churnPredictions = null,
    Object? nextOrderPredictions = null,
    Object? lifetimeValue = null,
    Object? lastAnalyzed = freezed,
  }) {
    return _then(_$PredictiveAnalyticsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      insights: null == insights
          ? _value.insights
          : insights // ignore: cast_nullable_to_non_nullable
              as PredictiveInsights,
      churnPredictions: null == churnPredictions
          ? _value._churnPredictions
          : churnPredictions // ignore: cast_nullable_to_non_nullable
              as List<ChurnPrediction>,
      nextOrderPredictions: null == nextOrderPredictions
          ? _value._nextOrderPredictions
          : nextOrderPredictions // ignore: cast_nullable_to_non_nullable
              as List<OrderPrediction>,
      lifetimeValue: null == lifetimeValue
          ? _value.lifetimeValue
          : lifetimeValue // ignore: cast_nullable_to_non_nullable
              as LifetimeValuePrediction,
      lastAnalyzed: freezed == lastAnalyzed
          ? _value.lastAnalyzed
          : lastAnalyzed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PredictiveAnalyticsImpl implements _PredictiveAnalytics {
  const _$PredictiveAnalyticsImpl(
      {required this.userId,
      required this.insights,
      required final List<ChurnPrediction> churnPredictions,
      required final List<OrderPrediction> nextOrderPredictions,
      required this.lifetimeValue,
      this.lastAnalyzed})
      : _churnPredictions = churnPredictions,
        _nextOrderPredictions = nextOrderPredictions;

  factory _$PredictiveAnalyticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredictiveAnalyticsImplFromJson(json);

  @override
  final String userId;
  @override
  final PredictiveInsights insights;
  final List<ChurnPrediction> _churnPredictions;
  @override
  List<ChurnPrediction> get churnPredictions {
    if (_churnPredictions is EqualUnmodifiableListView)
      return _churnPredictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_churnPredictions);
  }

  final List<OrderPrediction> _nextOrderPredictions;
  @override
  List<OrderPrediction> get nextOrderPredictions {
    if (_nextOrderPredictions is EqualUnmodifiableListView)
      return _nextOrderPredictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nextOrderPredictions);
  }

  @override
  final LifetimeValuePrediction lifetimeValue;
  @override
  final DateTime? lastAnalyzed;

  @override
  String toString() {
    return 'PredictiveAnalytics(userId: $userId, insights: $insights, churnPredictions: $churnPredictions, nextOrderPredictions: $nextOrderPredictions, lifetimeValue: $lifetimeValue, lastAnalyzed: $lastAnalyzed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictiveAnalyticsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.insights, insights) ||
                other.insights == insights) &&
            const DeepCollectionEquality()
                .equals(other._churnPredictions, _churnPredictions) &&
            const DeepCollectionEquality()
                .equals(other._nextOrderPredictions, _nextOrderPredictions) &&
            (identical(other.lifetimeValue, lifetimeValue) ||
                other.lifetimeValue == lifetimeValue) &&
            (identical(other.lastAnalyzed, lastAnalyzed) ||
                other.lastAnalyzed == lastAnalyzed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      insights,
      const DeepCollectionEquality().hash(_churnPredictions),
      const DeepCollectionEquality().hash(_nextOrderPredictions),
      lifetimeValue,
      lastAnalyzed);

  /// Create a copy of PredictiveAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PredictiveAnalyticsImplCopyWith<_$PredictiveAnalyticsImpl> get copyWith =>
      __$$PredictiveAnalyticsImplCopyWithImpl<_$PredictiveAnalyticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PredictiveAnalyticsImplToJson(
      this,
    );
  }
}

abstract class _PredictiveAnalytics implements PredictiveAnalytics {
  const factory _PredictiveAnalytics(
      {required final String userId,
      required final PredictiveInsights insights,
      required final List<ChurnPrediction> churnPredictions,
      required final List<OrderPrediction> nextOrderPredictions,
      required final LifetimeValuePrediction lifetimeValue,
      final DateTime? lastAnalyzed}) = _$PredictiveAnalyticsImpl;

  factory _PredictiveAnalytics.fromJson(Map<String, dynamic> json) =
      _$PredictiveAnalyticsImpl.fromJson;

  @override
  String get userId;
  @override
  PredictiveInsights get insights;
  @override
  List<ChurnPrediction> get churnPredictions;
  @override
  List<OrderPrediction> get nextOrderPredictions;
  @override
  LifetimeValuePrediction get lifetimeValue;
  @override
  DateTime? get lastAnalyzed;

  /// Create a copy of PredictiveAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PredictiveAnalyticsImplCopyWith<_$PredictiveAnalyticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PredictiveInsights _$PredictiveInsightsFromJson(Map<String, dynamic> json) {
  return _PredictiveInsights.fromJson(json);
}

/// @nodoc
mixin _$PredictiveInsights {
  double get nextOrderProbability => throw _privateConstructorUsedError;
  int get daysUntilNextOrder => throw _privateConstructorUsedError;
  double get churnRisk => throw _privateConstructorUsedError;
  List<String> get preferredRestaurants => throw _privateConstructorUsedError;
  Map<String, double> get cuisineAffinities =>
      throw _privateConstructorUsedError;
  OptimalOrderTime get optimalOrderTime => throw _privateConstructorUsedError;

  /// Serializes this PredictiveInsights to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PredictiveInsights
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PredictiveInsightsCopyWith<PredictiveInsights> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictiveInsightsCopyWith<$Res> {
  factory $PredictiveInsightsCopyWith(
          PredictiveInsights value, $Res Function(PredictiveInsights) then) =
      _$PredictiveInsightsCopyWithImpl<$Res, PredictiveInsights>;
  @useResult
  $Res call(
      {double nextOrderProbability,
      int daysUntilNextOrder,
      double churnRisk,
      List<String> preferredRestaurants,
      Map<String, double> cuisineAffinities,
      OptimalOrderTime optimalOrderTime});

  $OptimalOrderTimeCopyWith<$Res> get optimalOrderTime;
}

/// @nodoc
class _$PredictiveInsightsCopyWithImpl<$Res, $Val extends PredictiveInsights>
    implements $PredictiveInsightsCopyWith<$Res> {
  _$PredictiveInsightsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PredictiveInsights
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextOrderProbability = null,
    Object? daysUntilNextOrder = null,
    Object? churnRisk = null,
    Object? preferredRestaurants = null,
    Object? cuisineAffinities = null,
    Object? optimalOrderTime = null,
  }) {
    return _then(_value.copyWith(
      nextOrderProbability: null == nextOrderProbability
          ? _value.nextOrderProbability
          : nextOrderProbability // ignore: cast_nullable_to_non_nullable
              as double,
      daysUntilNextOrder: null == daysUntilNextOrder
          ? _value.daysUntilNextOrder
          : daysUntilNextOrder // ignore: cast_nullable_to_non_nullable
              as int,
      churnRisk: null == churnRisk
          ? _value.churnRisk
          : churnRisk // ignore: cast_nullable_to_non_nullable
              as double,
      preferredRestaurants: null == preferredRestaurants
          ? _value.preferredRestaurants
          : preferredRestaurants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cuisineAffinities: null == cuisineAffinities
          ? _value.cuisineAffinities
          : cuisineAffinities // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      optimalOrderTime: null == optimalOrderTime
          ? _value.optimalOrderTime
          : optimalOrderTime // ignore: cast_nullable_to_non_nullable
              as OptimalOrderTime,
    ) as $Val);
  }

  /// Create a copy of PredictiveInsights
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OptimalOrderTimeCopyWith<$Res> get optimalOrderTime {
    return $OptimalOrderTimeCopyWith<$Res>(_value.optimalOrderTime, (value) {
      return _then(_value.copyWith(optimalOrderTime: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PredictiveInsightsImplCopyWith<$Res>
    implements $PredictiveInsightsCopyWith<$Res> {
  factory _$$PredictiveInsightsImplCopyWith(_$PredictiveInsightsImpl value,
          $Res Function(_$PredictiveInsightsImpl) then) =
      __$$PredictiveInsightsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double nextOrderProbability,
      int daysUntilNextOrder,
      double churnRisk,
      List<String> preferredRestaurants,
      Map<String, double> cuisineAffinities,
      OptimalOrderTime optimalOrderTime});

  @override
  $OptimalOrderTimeCopyWith<$Res> get optimalOrderTime;
}

/// @nodoc
class __$$PredictiveInsightsImplCopyWithImpl<$Res>
    extends _$PredictiveInsightsCopyWithImpl<$Res, _$PredictiveInsightsImpl>
    implements _$$PredictiveInsightsImplCopyWith<$Res> {
  __$$PredictiveInsightsImplCopyWithImpl(_$PredictiveInsightsImpl _value,
      $Res Function(_$PredictiveInsightsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PredictiveInsights
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextOrderProbability = null,
    Object? daysUntilNextOrder = null,
    Object? churnRisk = null,
    Object? preferredRestaurants = null,
    Object? cuisineAffinities = null,
    Object? optimalOrderTime = null,
  }) {
    return _then(_$PredictiveInsightsImpl(
      nextOrderProbability: null == nextOrderProbability
          ? _value.nextOrderProbability
          : nextOrderProbability // ignore: cast_nullable_to_non_nullable
              as double,
      daysUntilNextOrder: null == daysUntilNextOrder
          ? _value.daysUntilNextOrder
          : daysUntilNextOrder // ignore: cast_nullable_to_non_nullable
              as int,
      churnRisk: null == churnRisk
          ? _value.churnRisk
          : churnRisk // ignore: cast_nullable_to_non_nullable
              as double,
      preferredRestaurants: null == preferredRestaurants
          ? _value._preferredRestaurants
          : preferredRestaurants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cuisineAffinities: null == cuisineAffinities
          ? _value._cuisineAffinities
          : cuisineAffinities // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      optimalOrderTime: null == optimalOrderTime
          ? _value.optimalOrderTime
          : optimalOrderTime // ignore: cast_nullable_to_non_nullable
              as OptimalOrderTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PredictiveInsightsImpl implements _PredictiveInsights {
  const _$PredictiveInsightsImpl(
      {required this.nextOrderProbability,
      required this.daysUntilNextOrder,
      required this.churnRisk,
      required final List<String> preferredRestaurants,
      required final Map<String, double> cuisineAffinities,
      required this.optimalOrderTime})
      : _preferredRestaurants = preferredRestaurants,
        _cuisineAffinities = cuisineAffinities;

  factory _$PredictiveInsightsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredictiveInsightsImplFromJson(json);

  @override
  final double nextOrderProbability;
  @override
  final int daysUntilNextOrder;
  @override
  final double churnRisk;
  final List<String> _preferredRestaurants;
  @override
  List<String> get preferredRestaurants {
    if (_preferredRestaurants is EqualUnmodifiableListView)
      return _preferredRestaurants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredRestaurants);
  }

  final Map<String, double> _cuisineAffinities;
  @override
  Map<String, double> get cuisineAffinities {
    if (_cuisineAffinities is EqualUnmodifiableMapView)
      return _cuisineAffinities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cuisineAffinities);
  }

  @override
  final OptimalOrderTime optimalOrderTime;

  @override
  String toString() {
    return 'PredictiveInsights(nextOrderProbability: $nextOrderProbability, daysUntilNextOrder: $daysUntilNextOrder, churnRisk: $churnRisk, preferredRestaurants: $preferredRestaurants, cuisineAffinities: $cuisineAffinities, optimalOrderTime: $optimalOrderTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictiveInsightsImpl &&
            (identical(other.nextOrderProbability, nextOrderProbability) ||
                other.nextOrderProbability == nextOrderProbability) &&
            (identical(other.daysUntilNextOrder, daysUntilNextOrder) ||
                other.daysUntilNextOrder == daysUntilNextOrder) &&
            (identical(other.churnRisk, churnRisk) ||
                other.churnRisk == churnRisk) &&
            const DeepCollectionEquality()
                .equals(other._preferredRestaurants, _preferredRestaurants) &&
            const DeepCollectionEquality()
                .equals(other._cuisineAffinities, _cuisineAffinities) &&
            (identical(other.optimalOrderTime, optimalOrderTime) ||
                other.optimalOrderTime == optimalOrderTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nextOrderProbability,
      daysUntilNextOrder,
      churnRisk,
      const DeepCollectionEquality().hash(_preferredRestaurants),
      const DeepCollectionEquality().hash(_cuisineAffinities),
      optimalOrderTime);

  /// Create a copy of PredictiveInsights
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PredictiveInsightsImplCopyWith<_$PredictiveInsightsImpl> get copyWith =>
      __$$PredictiveInsightsImplCopyWithImpl<_$PredictiveInsightsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PredictiveInsightsImplToJson(
      this,
    );
  }
}

abstract class _PredictiveInsights implements PredictiveInsights {
  const factory _PredictiveInsights(
          {required final double nextOrderProbability,
          required final int daysUntilNextOrder,
          required final double churnRisk,
          required final List<String> preferredRestaurants,
          required final Map<String, double> cuisineAffinities,
          required final OptimalOrderTime optimalOrderTime}) =
      _$PredictiveInsightsImpl;

  factory _PredictiveInsights.fromJson(Map<String, dynamic> json) =
      _$PredictiveInsightsImpl.fromJson;

  @override
  double get nextOrderProbability;
  @override
  int get daysUntilNextOrder;
  @override
  double get churnRisk;
  @override
  List<String> get preferredRestaurants;
  @override
  Map<String, double> get cuisineAffinities;
  @override
  OptimalOrderTime get optimalOrderTime;

  /// Create a copy of PredictiveInsights
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PredictiveInsightsImplCopyWith<_$PredictiveInsightsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChurnPrediction _$ChurnPredictionFromJson(Map<String, dynamic> json) {
  return _ChurnPrediction.fromJson(json);
}

/// @nodoc
mixin _$ChurnPrediction {
  double get churnProbability => throw _privateConstructorUsedError;
  List<String> get riskFactors => throw _privateConstructorUsedError;
  List<RetentionAction> get suggestedActions =>
      throw _privateConstructorUsedError;
  int get daysToChurn => throw _privateConstructorUsedError;
  DateTime? get predictedChurnDate => throw _privateConstructorUsedError;

  /// Serializes this ChurnPrediction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChurnPrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChurnPredictionCopyWith<ChurnPrediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChurnPredictionCopyWith<$Res> {
  factory $ChurnPredictionCopyWith(
          ChurnPrediction value, $Res Function(ChurnPrediction) then) =
      _$ChurnPredictionCopyWithImpl<$Res, ChurnPrediction>;
  @useResult
  $Res call(
      {double churnProbability,
      List<String> riskFactors,
      List<RetentionAction> suggestedActions,
      int daysToChurn,
      DateTime? predictedChurnDate});
}

/// @nodoc
class _$ChurnPredictionCopyWithImpl<$Res, $Val extends ChurnPrediction>
    implements $ChurnPredictionCopyWith<$Res> {
  _$ChurnPredictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChurnPrediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? churnProbability = null,
    Object? riskFactors = null,
    Object? suggestedActions = null,
    Object? daysToChurn = null,
    Object? predictedChurnDate = freezed,
  }) {
    return _then(_value.copyWith(
      churnProbability: null == churnProbability
          ? _value.churnProbability
          : churnProbability // ignore: cast_nullable_to_non_nullable
              as double,
      riskFactors: null == riskFactors
          ? _value.riskFactors
          : riskFactors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      suggestedActions: null == suggestedActions
          ? _value.suggestedActions
          : suggestedActions // ignore: cast_nullable_to_non_nullable
              as List<RetentionAction>,
      daysToChurn: null == daysToChurn
          ? _value.daysToChurn
          : daysToChurn // ignore: cast_nullable_to_non_nullable
              as int,
      predictedChurnDate: freezed == predictedChurnDate
          ? _value.predictedChurnDate
          : predictedChurnDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChurnPredictionImplCopyWith<$Res>
    implements $ChurnPredictionCopyWith<$Res> {
  factory _$$ChurnPredictionImplCopyWith(_$ChurnPredictionImpl value,
          $Res Function(_$ChurnPredictionImpl) then) =
      __$$ChurnPredictionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double churnProbability,
      List<String> riskFactors,
      List<RetentionAction> suggestedActions,
      int daysToChurn,
      DateTime? predictedChurnDate});
}

/// @nodoc
class __$$ChurnPredictionImplCopyWithImpl<$Res>
    extends _$ChurnPredictionCopyWithImpl<$Res, _$ChurnPredictionImpl>
    implements _$$ChurnPredictionImplCopyWith<$Res> {
  __$$ChurnPredictionImplCopyWithImpl(
      _$ChurnPredictionImpl _value, $Res Function(_$ChurnPredictionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChurnPrediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? churnProbability = null,
    Object? riskFactors = null,
    Object? suggestedActions = null,
    Object? daysToChurn = null,
    Object? predictedChurnDate = freezed,
  }) {
    return _then(_$ChurnPredictionImpl(
      churnProbability: null == churnProbability
          ? _value.churnProbability
          : churnProbability // ignore: cast_nullable_to_non_nullable
              as double,
      riskFactors: null == riskFactors
          ? _value._riskFactors
          : riskFactors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      suggestedActions: null == suggestedActions
          ? _value._suggestedActions
          : suggestedActions // ignore: cast_nullable_to_non_nullable
              as List<RetentionAction>,
      daysToChurn: null == daysToChurn
          ? _value.daysToChurn
          : daysToChurn // ignore: cast_nullable_to_non_nullable
              as int,
      predictedChurnDate: freezed == predictedChurnDate
          ? _value.predictedChurnDate
          : predictedChurnDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChurnPredictionImpl implements _ChurnPrediction {
  const _$ChurnPredictionImpl(
      {required this.churnProbability,
      required final List<String> riskFactors,
      required final List<RetentionAction> suggestedActions,
      required this.daysToChurn,
      this.predictedChurnDate})
      : _riskFactors = riskFactors,
        _suggestedActions = suggestedActions;

  factory _$ChurnPredictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChurnPredictionImplFromJson(json);

  @override
  final double churnProbability;
  final List<String> _riskFactors;
  @override
  List<String> get riskFactors {
    if (_riskFactors is EqualUnmodifiableListView) return _riskFactors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_riskFactors);
  }

  final List<RetentionAction> _suggestedActions;
  @override
  List<RetentionAction> get suggestedActions {
    if (_suggestedActions is EqualUnmodifiableListView)
      return _suggestedActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedActions);
  }

  @override
  final int daysToChurn;
  @override
  final DateTime? predictedChurnDate;

  @override
  String toString() {
    return 'ChurnPrediction(churnProbability: $churnProbability, riskFactors: $riskFactors, suggestedActions: $suggestedActions, daysToChurn: $daysToChurn, predictedChurnDate: $predictedChurnDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChurnPredictionImpl &&
            (identical(other.churnProbability, churnProbability) ||
                other.churnProbability == churnProbability) &&
            const DeepCollectionEquality()
                .equals(other._riskFactors, _riskFactors) &&
            const DeepCollectionEquality()
                .equals(other._suggestedActions, _suggestedActions) &&
            (identical(other.daysToChurn, daysToChurn) ||
                other.daysToChurn == daysToChurn) &&
            (identical(other.predictedChurnDate, predictedChurnDate) ||
                other.predictedChurnDate == predictedChurnDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      churnProbability,
      const DeepCollectionEquality().hash(_riskFactors),
      const DeepCollectionEquality().hash(_suggestedActions),
      daysToChurn,
      predictedChurnDate);

  /// Create a copy of ChurnPrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChurnPredictionImplCopyWith<_$ChurnPredictionImpl> get copyWith =>
      __$$ChurnPredictionImplCopyWithImpl<_$ChurnPredictionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChurnPredictionImplToJson(
      this,
    );
  }
}

abstract class _ChurnPrediction implements ChurnPrediction {
  const factory _ChurnPrediction(
      {required final double churnProbability,
      required final List<String> riskFactors,
      required final List<RetentionAction> suggestedActions,
      required final int daysToChurn,
      final DateTime? predictedChurnDate}) = _$ChurnPredictionImpl;

  factory _ChurnPrediction.fromJson(Map<String, dynamic> json) =
      _$ChurnPredictionImpl.fromJson;

  @override
  double get churnProbability;
  @override
  List<String> get riskFactors;
  @override
  List<RetentionAction> get suggestedActions;
  @override
  int get daysToChurn;
  @override
  DateTime? get predictedChurnDate;

  /// Create a copy of ChurnPrediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChurnPredictionImplCopyWith<_$ChurnPredictionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderPrediction _$OrderPredictionFromJson(Map<String, dynamic> json) {
  return _OrderPrediction.fromJson(json);
}

/// @nodoc
mixin _$OrderPrediction {
  DateTime get predictedOrderTime => throw _privateConstructorUsedError;
  double get probability => throw _privateConstructorUsedError;
  List<String> get likelyItems => throw _privateConstructorUsedError;
  String get likelyRestaurant => throw _privateConstructorUsedError;
  double get estimatedOrderValue => throw _privateConstructorUsedError;

  /// Serializes this OrderPrediction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderPrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderPredictionCopyWith<OrderPrediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPredictionCopyWith<$Res> {
  factory $OrderPredictionCopyWith(
          OrderPrediction value, $Res Function(OrderPrediction) then) =
      _$OrderPredictionCopyWithImpl<$Res, OrderPrediction>;
  @useResult
  $Res call(
      {DateTime predictedOrderTime,
      double probability,
      List<String> likelyItems,
      String likelyRestaurant,
      double estimatedOrderValue});
}

/// @nodoc
class _$OrderPredictionCopyWithImpl<$Res, $Val extends OrderPrediction>
    implements $OrderPredictionCopyWith<$Res> {
  _$OrderPredictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderPrediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? predictedOrderTime = null,
    Object? probability = null,
    Object? likelyItems = null,
    Object? likelyRestaurant = null,
    Object? estimatedOrderValue = null,
  }) {
    return _then(_value.copyWith(
      predictedOrderTime: null == predictedOrderTime
          ? _value.predictedOrderTime
          : predictedOrderTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      probability: null == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as double,
      likelyItems: null == likelyItems
          ? _value.likelyItems
          : likelyItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likelyRestaurant: null == likelyRestaurant
          ? _value.likelyRestaurant
          : likelyRestaurant // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedOrderValue: null == estimatedOrderValue
          ? _value.estimatedOrderValue
          : estimatedOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderPredictionImplCopyWith<$Res>
    implements $OrderPredictionCopyWith<$Res> {
  factory _$$OrderPredictionImplCopyWith(_$OrderPredictionImpl value,
          $Res Function(_$OrderPredictionImpl) then) =
      __$$OrderPredictionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime predictedOrderTime,
      double probability,
      List<String> likelyItems,
      String likelyRestaurant,
      double estimatedOrderValue});
}

/// @nodoc
class __$$OrderPredictionImplCopyWithImpl<$Res>
    extends _$OrderPredictionCopyWithImpl<$Res, _$OrderPredictionImpl>
    implements _$$OrderPredictionImplCopyWith<$Res> {
  __$$OrderPredictionImplCopyWithImpl(
      _$OrderPredictionImpl _value, $Res Function(_$OrderPredictionImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderPrediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? predictedOrderTime = null,
    Object? probability = null,
    Object? likelyItems = null,
    Object? likelyRestaurant = null,
    Object? estimatedOrderValue = null,
  }) {
    return _then(_$OrderPredictionImpl(
      predictedOrderTime: null == predictedOrderTime
          ? _value.predictedOrderTime
          : predictedOrderTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      probability: null == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as double,
      likelyItems: null == likelyItems
          ? _value._likelyItems
          : likelyItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likelyRestaurant: null == likelyRestaurant
          ? _value.likelyRestaurant
          : likelyRestaurant // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedOrderValue: null == estimatedOrderValue
          ? _value.estimatedOrderValue
          : estimatedOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderPredictionImpl implements _OrderPrediction {
  const _$OrderPredictionImpl(
      {required this.predictedOrderTime,
      required this.probability,
      required final List<String> likelyItems,
      required this.likelyRestaurant,
      required this.estimatedOrderValue})
      : _likelyItems = likelyItems;

  factory _$OrderPredictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderPredictionImplFromJson(json);

  @override
  final DateTime predictedOrderTime;
  @override
  final double probability;
  final List<String> _likelyItems;
  @override
  List<String> get likelyItems {
    if (_likelyItems is EqualUnmodifiableListView) return _likelyItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likelyItems);
  }

  @override
  final String likelyRestaurant;
  @override
  final double estimatedOrderValue;

  @override
  String toString() {
    return 'OrderPrediction(predictedOrderTime: $predictedOrderTime, probability: $probability, likelyItems: $likelyItems, likelyRestaurant: $likelyRestaurant, estimatedOrderValue: $estimatedOrderValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderPredictionImpl &&
            (identical(other.predictedOrderTime, predictedOrderTime) ||
                other.predictedOrderTime == predictedOrderTime) &&
            (identical(other.probability, probability) ||
                other.probability == probability) &&
            const DeepCollectionEquality()
                .equals(other._likelyItems, _likelyItems) &&
            (identical(other.likelyRestaurant, likelyRestaurant) ||
                other.likelyRestaurant == likelyRestaurant) &&
            (identical(other.estimatedOrderValue, estimatedOrderValue) ||
                other.estimatedOrderValue == estimatedOrderValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      predictedOrderTime,
      probability,
      const DeepCollectionEquality().hash(_likelyItems),
      likelyRestaurant,
      estimatedOrderValue);

  /// Create a copy of OrderPrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderPredictionImplCopyWith<_$OrderPredictionImpl> get copyWith =>
      __$$OrderPredictionImplCopyWithImpl<_$OrderPredictionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderPredictionImplToJson(
      this,
    );
  }
}

abstract class _OrderPrediction implements OrderPrediction {
  const factory _OrderPrediction(
      {required final DateTime predictedOrderTime,
      required final double probability,
      required final List<String> likelyItems,
      required final String likelyRestaurant,
      required final double estimatedOrderValue}) = _$OrderPredictionImpl;

  factory _OrderPrediction.fromJson(Map<String, dynamic> json) =
      _$OrderPredictionImpl.fromJson;

  @override
  DateTime get predictedOrderTime;
  @override
  double get probability;
  @override
  List<String> get likelyItems;
  @override
  String get likelyRestaurant;
  @override
  double get estimatedOrderValue;

  /// Create a copy of OrderPrediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderPredictionImplCopyWith<_$OrderPredictionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LifetimeValuePrediction _$LifetimeValuePredictionFromJson(
    Map<String, dynamic> json) {
  return _LifetimeValuePrediction.fromJson(json);
}

/// @nodoc
mixin _$LifetimeValuePrediction {
  double get predictedLifetimeValue => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  int get predictedOrderCount => throw _privateConstructorUsedError;
  double get averagePredictedOrderValue => throw _privateConstructorUsedError;
  int get timeHorizonMonths => throw _privateConstructorUsedError;

  /// Serializes this LifetimeValuePrediction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LifetimeValuePrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LifetimeValuePredictionCopyWith<LifetimeValuePrediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LifetimeValuePredictionCopyWith<$Res> {
  factory $LifetimeValuePredictionCopyWith(LifetimeValuePrediction value,
          $Res Function(LifetimeValuePrediction) then) =
      _$LifetimeValuePredictionCopyWithImpl<$Res, LifetimeValuePrediction>;
  @useResult
  $Res call(
      {double predictedLifetimeValue,
      double confidence,
      int predictedOrderCount,
      double averagePredictedOrderValue,
      int timeHorizonMonths});
}

/// @nodoc
class _$LifetimeValuePredictionCopyWithImpl<$Res,
        $Val extends LifetimeValuePrediction>
    implements $LifetimeValuePredictionCopyWith<$Res> {
  _$LifetimeValuePredictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LifetimeValuePrediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? predictedLifetimeValue = null,
    Object? confidence = null,
    Object? predictedOrderCount = null,
    Object? averagePredictedOrderValue = null,
    Object? timeHorizonMonths = null,
  }) {
    return _then(_value.copyWith(
      predictedLifetimeValue: null == predictedLifetimeValue
          ? _value.predictedLifetimeValue
          : predictedLifetimeValue // ignore: cast_nullable_to_non_nullable
              as double,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      predictedOrderCount: null == predictedOrderCount
          ? _value.predictedOrderCount
          : predictedOrderCount // ignore: cast_nullable_to_non_nullable
              as int,
      averagePredictedOrderValue: null == averagePredictedOrderValue
          ? _value.averagePredictedOrderValue
          : averagePredictedOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      timeHorizonMonths: null == timeHorizonMonths
          ? _value.timeHorizonMonths
          : timeHorizonMonths // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LifetimeValuePredictionImplCopyWith<$Res>
    implements $LifetimeValuePredictionCopyWith<$Res> {
  factory _$$LifetimeValuePredictionImplCopyWith(
          _$LifetimeValuePredictionImpl value,
          $Res Function(_$LifetimeValuePredictionImpl) then) =
      __$$LifetimeValuePredictionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double predictedLifetimeValue,
      double confidence,
      int predictedOrderCount,
      double averagePredictedOrderValue,
      int timeHorizonMonths});
}

/// @nodoc
class __$$LifetimeValuePredictionImplCopyWithImpl<$Res>
    extends _$LifetimeValuePredictionCopyWithImpl<$Res,
        _$LifetimeValuePredictionImpl>
    implements _$$LifetimeValuePredictionImplCopyWith<$Res> {
  __$$LifetimeValuePredictionImplCopyWithImpl(
      _$LifetimeValuePredictionImpl _value,
      $Res Function(_$LifetimeValuePredictionImpl) _then)
      : super(_value, _then);

  /// Create a copy of LifetimeValuePrediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? predictedLifetimeValue = null,
    Object? confidence = null,
    Object? predictedOrderCount = null,
    Object? averagePredictedOrderValue = null,
    Object? timeHorizonMonths = null,
  }) {
    return _then(_$LifetimeValuePredictionImpl(
      predictedLifetimeValue: null == predictedLifetimeValue
          ? _value.predictedLifetimeValue
          : predictedLifetimeValue // ignore: cast_nullable_to_non_nullable
              as double,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      predictedOrderCount: null == predictedOrderCount
          ? _value.predictedOrderCount
          : predictedOrderCount // ignore: cast_nullable_to_non_nullable
              as int,
      averagePredictedOrderValue: null == averagePredictedOrderValue
          ? _value.averagePredictedOrderValue
          : averagePredictedOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      timeHorizonMonths: null == timeHorizonMonths
          ? _value.timeHorizonMonths
          : timeHorizonMonths // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LifetimeValuePredictionImpl implements _LifetimeValuePrediction {
  const _$LifetimeValuePredictionImpl(
      {required this.predictedLifetimeValue,
      required this.confidence,
      required this.predictedOrderCount,
      required this.averagePredictedOrderValue,
      required this.timeHorizonMonths});

  factory _$LifetimeValuePredictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$LifetimeValuePredictionImplFromJson(json);

  @override
  final double predictedLifetimeValue;
  @override
  final double confidence;
  @override
  final int predictedOrderCount;
  @override
  final double averagePredictedOrderValue;
  @override
  final int timeHorizonMonths;

  @override
  String toString() {
    return 'LifetimeValuePrediction(predictedLifetimeValue: $predictedLifetimeValue, confidence: $confidence, predictedOrderCount: $predictedOrderCount, averagePredictedOrderValue: $averagePredictedOrderValue, timeHorizonMonths: $timeHorizonMonths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LifetimeValuePredictionImpl &&
            (identical(other.predictedLifetimeValue, predictedLifetimeValue) ||
                other.predictedLifetimeValue == predictedLifetimeValue) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.predictedOrderCount, predictedOrderCount) ||
                other.predictedOrderCount == predictedOrderCount) &&
            (identical(other.averagePredictedOrderValue,
                    averagePredictedOrderValue) ||
                other.averagePredictedOrderValue ==
                    averagePredictedOrderValue) &&
            (identical(other.timeHorizonMonths, timeHorizonMonths) ||
                other.timeHorizonMonths == timeHorizonMonths));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      predictedLifetimeValue,
      confidence,
      predictedOrderCount,
      averagePredictedOrderValue,
      timeHorizonMonths);

  /// Create a copy of LifetimeValuePrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LifetimeValuePredictionImplCopyWith<_$LifetimeValuePredictionImpl>
      get copyWith => __$$LifetimeValuePredictionImplCopyWithImpl<
          _$LifetimeValuePredictionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LifetimeValuePredictionImplToJson(
      this,
    );
  }
}

abstract class _LifetimeValuePrediction implements LifetimeValuePrediction {
  const factory _LifetimeValuePrediction(
      {required final double predictedLifetimeValue,
      required final double confidence,
      required final int predictedOrderCount,
      required final double averagePredictedOrderValue,
      required final int timeHorizonMonths}) = _$LifetimeValuePredictionImpl;

  factory _LifetimeValuePrediction.fromJson(Map<String, dynamic> json) =
      _$LifetimeValuePredictionImpl.fromJson;

  @override
  double get predictedLifetimeValue;
  @override
  double get confidence;
  @override
  int get predictedOrderCount;
  @override
  double get averagePredictedOrderValue;
  @override
  int get timeHorizonMonths;

  /// Create a copy of LifetimeValuePrediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LifetimeValuePredictionImplCopyWith<_$LifetimeValuePredictionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RetentionAction _$RetentionActionFromJson(Map<String, dynamic> json) {
  return _RetentionAction.fromJson(json);
}

/// @nodoc
mixin _$RetentionAction {
  RetentionActionType get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get expectedImpact => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;
  Map<String, dynamic>? get parameters => throw _privateConstructorUsedError;

  /// Serializes this RetentionAction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RetentionAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RetentionActionCopyWith<RetentionAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RetentionActionCopyWith<$Res> {
  factory $RetentionActionCopyWith(
          RetentionAction value, $Res Function(RetentionAction) then) =
      _$RetentionActionCopyWithImpl<$Res, RetentionAction>;
  @useResult
  $Res call(
      {RetentionActionType type,
      String description,
      double expectedImpact,
      int priority,
      Map<String, dynamic>? parameters});
}

/// @nodoc
class _$RetentionActionCopyWithImpl<$Res, $Val extends RetentionAction>
    implements $RetentionActionCopyWith<$Res> {
  _$RetentionActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RetentionAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? description = null,
    Object? expectedImpact = null,
    Object? priority = null,
    Object? parameters = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RetentionActionType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      expectedImpact: null == expectedImpact
          ? _value.expectedImpact
          : expectedImpact // ignore: cast_nullable_to_non_nullable
              as double,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      parameters: freezed == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RetentionActionImplCopyWith<$Res>
    implements $RetentionActionCopyWith<$Res> {
  factory _$$RetentionActionImplCopyWith(_$RetentionActionImpl value,
          $Res Function(_$RetentionActionImpl) then) =
      __$$RetentionActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RetentionActionType type,
      String description,
      double expectedImpact,
      int priority,
      Map<String, dynamic>? parameters});
}

/// @nodoc
class __$$RetentionActionImplCopyWithImpl<$Res>
    extends _$RetentionActionCopyWithImpl<$Res, _$RetentionActionImpl>
    implements _$$RetentionActionImplCopyWith<$Res> {
  __$$RetentionActionImplCopyWithImpl(
      _$RetentionActionImpl _value, $Res Function(_$RetentionActionImpl) _then)
      : super(_value, _then);

  /// Create a copy of RetentionAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? description = null,
    Object? expectedImpact = null,
    Object? priority = null,
    Object? parameters = freezed,
  }) {
    return _then(_$RetentionActionImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RetentionActionType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      expectedImpact: null == expectedImpact
          ? _value.expectedImpact
          : expectedImpact // ignore: cast_nullable_to_non_nullable
              as double,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      parameters: freezed == parameters
          ? _value._parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RetentionActionImpl implements _RetentionAction {
  const _$RetentionActionImpl(
      {required this.type,
      required this.description,
      required this.expectedImpact,
      required this.priority,
      final Map<String, dynamic>? parameters})
      : _parameters = parameters;

  factory _$RetentionActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RetentionActionImplFromJson(json);

  @override
  final RetentionActionType type;
  @override
  final String description;
  @override
  final double expectedImpact;
  @override
  final int priority;
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
    return 'RetentionAction(type: $type, description: $description, expectedImpact: $expectedImpact, priority: $priority, parameters: $parameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RetentionActionImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.expectedImpact, expectedImpact) ||
                other.expectedImpact == expectedImpact) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            const DeepCollectionEquality()
                .equals(other._parameters, _parameters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      description,
      expectedImpact,
      priority,
      const DeepCollectionEquality().hash(_parameters));

  /// Create a copy of RetentionAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RetentionActionImplCopyWith<_$RetentionActionImpl> get copyWith =>
      __$$RetentionActionImplCopyWithImpl<_$RetentionActionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RetentionActionImplToJson(
      this,
    );
  }
}

abstract class _RetentionAction implements RetentionAction {
  const factory _RetentionAction(
      {required final RetentionActionType type,
      required final String description,
      required final double expectedImpact,
      required final int priority,
      final Map<String, dynamic>? parameters}) = _$RetentionActionImpl;

  factory _RetentionAction.fromJson(Map<String, dynamic> json) =
      _$RetentionActionImpl.fromJson;

  @override
  RetentionActionType get type;
  @override
  String get description;
  @override
  double get expectedImpact;
  @override
  int get priority;
  @override
  Map<String, dynamic>? get parameters;

  /// Create a copy of RetentionAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RetentionActionImplCopyWith<_$RetentionActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OptimalOrderTime _$OptimalOrderTimeFromJson(Map<String, dynamic> json) {
  return _OptimalOrderTime.fromJson(json);
}

/// @nodoc
mixin _$OptimalOrderTime {
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;
  List<int> get daysOfWeek => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;

  /// Serializes this OptimalOrderTime to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OptimalOrderTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OptimalOrderTimeCopyWith<OptimalOrderTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptimalOrderTimeCopyWith<$Res> {
  factory $OptimalOrderTimeCopyWith(
          OptimalOrderTime value, $Res Function(OptimalOrderTime) then) =
      _$OptimalOrderTimeCopyWithImpl<$Res, OptimalOrderTime>;
  @useResult
  $Res call({int hour, int minute, List<int> daysOfWeek, double confidence});
}

/// @nodoc
class _$OptimalOrderTimeCopyWithImpl<$Res, $Val extends OptimalOrderTime>
    implements $OptimalOrderTimeCopyWith<$Res> {
  _$OptimalOrderTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OptimalOrderTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? minute = null,
    Object? daysOfWeek = null,
    Object? confidence = null,
  }) {
    return _then(_value.copyWith(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      daysOfWeek: null == daysOfWeek
          ? _value.daysOfWeek
          : daysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptimalOrderTimeImplCopyWith<$Res>
    implements $OptimalOrderTimeCopyWith<$Res> {
  factory _$$OptimalOrderTimeImplCopyWith(_$OptimalOrderTimeImpl value,
          $Res Function(_$OptimalOrderTimeImpl) then) =
      __$$OptimalOrderTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hour, int minute, List<int> daysOfWeek, double confidence});
}

/// @nodoc
class __$$OptimalOrderTimeImplCopyWithImpl<$Res>
    extends _$OptimalOrderTimeCopyWithImpl<$Res, _$OptimalOrderTimeImpl>
    implements _$$OptimalOrderTimeImplCopyWith<$Res> {
  __$$OptimalOrderTimeImplCopyWithImpl(_$OptimalOrderTimeImpl _value,
      $Res Function(_$OptimalOrderTimeImpl) _then)
      : super(_value, _then);

  /// Create a copy of OptimalOrderTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? minute = null,
    Object? daysOfWeek = null,
    Object? confidence = null,
  }) {
    return _then(_$OptimalOrderTimeImpl(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      daysOfWeek: null == daysOfWeek
          ? _value._daysOfWeek
          : daysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptimalOrderTimeImpl implements _OptimalOrderTime {
  const _$OptimalOrderTimeImpl(
      {required this.hour,
      required this.minute,
      required final List<int> daysOfWeek,
      required this.confidence})
      : _daysOfWeek = daysOfWeek;

  factory _$OptimalOrderTimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptimalOrderTimeImplFromJson(json);

  @override
  final int hour;
  @override
  final int minute;
  final List<int> _daysOfWeek;
  @override
  List<int> get daysOfWeek {
    if (_daysOfWeek is EqualUnmodifiableListView) return _daysOfWeek;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_daysOfWeek);
  }

  @override
  final double confidence;

  @override
  String toString() {
    return 'OptimalOrderTime(hour: $hour, minute: $minute, daysOfWeek: $daysOfWeek, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptimalOrderTimeImpl &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute) &&
            const DeepCollectionEquality()
                .equals(other._daysOfWeek, _daysOfWeek) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hour, minute,
      const DeepCollectionEquality().hash(_daysOfWeek), confidence);

  /// Create a copy of OptimalOrderTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OptimalOrderTimeImplCopyWith<_$OptimalOrderTimeImpl> get copyWith =>
      __$$OptimalOrderTimeImplCopyWithImpl<_$OptimalOrderTimeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptimalOrderTimeImplToJson(
      this,
    );
  }
}

abstract class _OptimalOrderTime implements OptimalOrderTime {
  const factory _OptimalOrderTime(
      {required final int hour,
      required final int minute,
      required final List<int> daysOfWeek,
      required final double confidence}) = _$OptimalOrderTimeImpl;

  factory _OptimalOrderTime.fromJson(Map<String, dynamic> json) =
      _$OptimalOrderTimeImpl.fromJson;

  @override
  int get hour;
  @override
  int get minute;
  @override
  List<int> get daysOfWeek;
  @override
  double get confidence;

  /// Create a copy of OptimalOrderTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OptimalOrderTimeImplCopyWith<_$OptimalOrderTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AIInsight _$AIInsightFromJson(Map<String, dynamic> json) {
  return _AIInsight.fromJson(json);
}

/// @nodoc
mixin _$AIInsight {
  String get insightId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  InsightType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  List<String> get supportingData => throw _privateConstructorUsedError;
  DateTime? get generatedAt => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  bool get isActionable => throw _privateConstructorUsedError;
  String? get recommendedAction => throw _privateConstructorUsedError;

  /// Serializes this AIInsight to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AIInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AIInsightCopyWith<AIInsight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AIInsightCopyWith<$Res> {
  factory $AIInsightCopyWith(AIInsight value, $Res Function(AIInsight) then) =
      _$AIInsightCopyWithImpl<$Res, AIInsight>;
  @useResult
  $Res call(
      {String insightId,
      String userId,
      InsightType type,
      String title,
      String description,
      double confidence,
      List<String> supportingData,
      DateTime? generatedAt,
      DateTime? expiresAt,
      bool isActionable,
      String? recommendedAction});
}

/// @nodoc
class _$AIInsightCopyWithImpl<$Res, $Val extends AIInsight>
    implements $AIInsightCopyWith<$Res> {
  _$AIInsightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AIInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? insightId = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? confidence = null,
    Object? supportingData = null,
    Object? generatedAt = freezed,
    Object? expiresAt = freezed,
    Object? isActionable = null,
    Object? recommendedAction = freezed,
  }) {
    return _then(_value.copyWith(
      insightId: null == insightId
          ? _value.insightId
          : insightId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InsightType,
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
      supportingData: null == supportingData
          ? _value.supportingData
          : supportingData // ignore: cast_nullable_to_non_nullable
              as List<String>,
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
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
abstract class _$$AIInsightImplCopyWith<$Res>
    implements $AIInsightCopyWith<$Res> {
  factory _$$AIInsightImplCopyWith(
          _$AIInsightImpl value, $Res Function(_$AIInsightImpl) then) =
      __$$AIInsightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String insightId,
      String userId,
      InsightType type,
      String title,
      String description,
      double confidence,
      List<String> supportingData,
      DateTime? generatedAt,
      DateTime? expiresAt,
      bool isActionable,
      String? recommendedAction});
}

/// @nodoc
class __$$AIInsightImplCopyWithImpl<$Res>
    extends _$AIInsightCopyWithImpl<$Res, _$AIInsightImpl>
    implements _$$AIInsightImplCopyWith<$Res> {
  __$$AIInsightImplCopyWithImpl(
      _$AIInsightImpl _value, $Res Function(_$AIInsightImpl) _then)
      : super(_value, _then);

  /// Create a copy of AIInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? insightId = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? confidence = null,
    Object? supportingData = null,
    Object? generatedAt = freezed,
    Object? expiresAt = freezed,
    Object? isActionable = null,
    Object? recommendedAction = freezed,
  }) {
    return _then(_$AIInsightImpl(
      insightId: null == insightId
          ? _value.insightId
          : insightId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InsightType,
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
      supportingData: null == supportingData
          ? _value._supportingData
          : supportingData // ignore: cast_nullable_to_non_nullable
              as List<String>,
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
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
class _$AIInsightImpl implements _AIInsight {
  const _$AIInsightImpl(
      {required this.insightId,
      required this.userId,
      required this.type,
      required this.title,
      required this.description,
      required this.confidence,
      required final List<String> supportingData,
      this.generatedAt,
      this.expiresAt,
      this.isActionable = false,
      this.recommendedAction})
      : _supportingData = supportingData;

  factory _$AIInsightImpl.fromJson(Map<String, dynamic> json) =>
      _$$AIInsightImplFromJson(json);

  @override
  final String insightId;
  @override
  final String userId;
  @override
  final InsightType type;
  @override
  final String title;
  @override
  final String description;
  @override
  final double confidence;
  final List<String> _supportingData;
  @override
  List<String> get supportingData {
    if (_supportingData is EqualUnmodifiableListView) return _supportingData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportingData);
  }

  @override
  final DateTime? generatedAt;
  @override
  final DateTime? expiresAt;
  @override
  @JsonKey()
  final bool isActionable;
  @override
  final String? recommendedAction;

  @override
  String toString() {
    return 'AIInsight(insightId: $insightId, userId: $userId, type: $type, title: $title, description: $description, confidence: $confidence, supportingData: $supportingData, generatedAt: $generatedAt, expiresAt: $expiresAt, isActionable: $isActionable, recommendedAction: $recommendedAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AIInsightImpl &&
            (identical(other.insightId, insightId) ||
                other.insightId == insightId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality()
                .equals(other._supportingData, _supportingData) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
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
      userId,
      type,
      title,
      description,
      confidence,
      const DeepCollectionEquality().hash(_supportingData),
      generatedAt,
      expiresAt,
      isActionable,
      recommendedAction);

  /// Create a copy of AIInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AIInsightImplCopyWith<_$AIInsightImpl> get copyWith =>
      __$$AIInsightImplCopyWithImpl<_$AIInsightImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AIInsightImplToJson(
      this,
    );
  }
}

abstract class _AIInsight implements AIInsight {
  const factory _AIInsight(
      {required final String insightId,
      required final String userId,
      required final InsightType type,
      required final String title,
      required final String description,
      required final double confidence,
      required final List<String> supportingData,
      final DateTime? generatedAt,
      final DateTime? expiresAt,
      final bool isActionable,
      final String? recommendedAction}) = _$AIInsightImpl;

  factory _AIInsight.fromJson(Map<String, dynamic> json) =
      _$AIInsightImpl.fromJson;

  @override
  String get insightId;
  @override
  String get userId;
  @override
  InsightType get type;
  @override
  String get title;
  @override
  String get description;
  @override
  double get confidence;
  @override
  List<String> get supportingData;
  @override
  DateTime? get generatedAt;
  @override
  DateTime? get expiresAt;
  @override
  bool get isActionable;
  @override
  String? get recommendedAction;

  /// Create a copy of AIInsight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AIInsightImplCopyWith<_$AIInsightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
