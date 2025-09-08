// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GuestOrderRequest _$GuestOrderRequestFromJson(Map<String, dynamic> json) {
  return _GuestOrderRequest.fromJson(json);
}

/// @nodoc
mixin _$GuestOrderRequest {
  String get restaurantId => throw _privateConstructorUsedError;
  List<GuestOrderItem> get items => throw _privateConstructorUsedError;
  String get deliveryAddress => throw _privateConstructorUsedError;
  GuestOrderCoordinates get deliveryCoordinates =>
      throw _privateConstructorUsedError;
  String get guestName => throw _privateConstructorUsedError;
  String get guestPhone => throw _privateConstructorUsedError;
  String? get guestEmail => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String? get specialInstructions => throw _privateConstructorUsedError;
  DateTime? get scheduledDeliveryTime => throw _privateConstructorUsedError;

  /// Serializes this GuestOrderRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestOrderRequestCopyWith<GuestOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestOrderRequestCopyWith<$Res> {
  factory $GuestOrderRequestCopyWith(
          GuestOrderRequest value, $Res Function(GuestOrderRequest) then) =
      _$GuestOrderRequestCopyWithImpl<$Res, GuestOrderRequest>;
  @useResult
  $Res call(
      {String restaurantId,
      List<GuestOrderItem> items,
      String deliveryAddress,
      GuestOrderCoordinates deliveryCoordinates,
      String guestName,
      String guestPhone,
      String? guestEmail,
      String paymentMethod,
      String? specialInstructions,
      DateTime? scheduledDeliveryTime});

  $GuestOrderCoordinatesCopyWith<$Res> get deliveryCoordinates;
}

/// @nodoc
class _$GuestOrderRequestCopyWithImpl<$Res, $Val extends GuestOrderRequest>
    implements $GuestOrderRequestCopyWith<$Res> {
  _$GuestOrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantId = null,
    Object? items = null,
    Object? deliveryAddress = null,
    Object? deliveryCoordinates = null,
    Object? guestName = null,
    Object? guestPhone = null,
    Object? guestEmail = freezed,
    Object? paymentMethod = null,
    Object? specialInstructions = freezed,
    Object? scheduledDeliveryTime = freezed,
  }) {
    return _then(_value.copyWith(
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GuestOrderItem>,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryCoordinates: null == deliveryCoordinates
          ? _value.deliveryCoordinates
          : deliveryCoordinates // ignore: cast_nullable_to_non_nullable
              as GuestOrderCoordinates,
      guestName: null == guestName
          ? _value.guestName
          : guestName // ignore: cast_nullable_to_non_nullable
              as String,
      guestPhone: null == guestPhone
          ? _value.guestPhone
          : guestPhone // ignore: cast_nullable_to_non_nullable
              as String,
      guestEmail: freezed == guestEmail
          ? _value.guestEmail
          : guestEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledDeliveryTime: freezed == scheduledDeliveryTime
          ? _value.scheduledDeliveryTime
          : scheduledDeliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of GuestOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GuestOrderCoordinatesCopyWith<$Res> get deliveryCoordinates {
    return $GuestOrderCoordinatesCopyWith<$Res>(_value.deliveryCoordinates,
        (value) {
      return _then(_value.copyWith(deliveryCoordinates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GuestOrderRequestImplCopyWith<$Res>
    implements $GuestOrderRequestCopyWith<$Res> {
  factory _$$GuestOrderRequestImplCopyWith(_$GuestOrderRequestImpl value,
          $Res Function(_$GuestOrderRequestImpl) then) =
      __$$GuestOrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String restaurantId,
      List<GuestOrderItem> items,
      String deliveryAddress,
      GuestOrderCoordinates deliveryCoordinates,
      String guestName,
      String guestPhone,
      String? guestEmail,
      String paymentMethod,
      String? specialInstructions,
      DateTime? scheduledDeliveryTime});

  @override
  $GuestOrderCoordinatesCopyWith<$Res> get deliveryCoordinates;
}

/// @nodoc
class __$$GuestOrderRequestImplCopyWithImpl<$Res>
    extends _$GuestOrderRequestCopyWithImpl<$Res, _$GuestOrderRequestImpl>
    implements _$$GuestOrderRequestImplCopyWith<$Res> {
  __$$GuestOrderRequestImplCopyWithImpl(_$GuestOrderRequestImpl _value,
      $Res Function(_$GuestOrderRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantId = null,
    Object? items = null,
    Object? deliveryAddress = null,
    Object? deliveryCoordinates = null,
    Object? guestName = null,
    Object? guestPhone = null,
    Object? guestEmail = freezed,
    Object? paymentMethod = null,
    Object? specialInstructions = freezed,
    Object? scheduledDeliveryTime = freezed,
  }) {
    return _then(_$GuestOrderRequestImpl(
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GuestOrderItem>,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryCoordinates: null == deliveryCoordinates
          ? _value.deliveryCoordinates
          : deliveryCoordinates // ignore: cast_nullable_to_non_nullable
              as GuestOrderCoordinates,
      guestName: null == guestName
          ? _value.guestName
          : guestName // ignore: cast_nullable_to_non_nullable
              as String,
      guestPhone: null == guestPhone
          ? _value.guestPhone
          : guestPhone // ignore: cast_nullable_to_non_nullable
              as String,
      guestEmail: freezed == guestEmail
          ? _value.guestEmail
          : guestEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledDeliveryTime: freezed == scheduledDeliveryTime
          ? _value.scheduledDeliveryTime
          : scheduledDeliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestOrderRequestImpl implements _GuestOrderRequest {
  const _$GuestOrderRequestImpl(
      {required this.restaurantId,
      required final List<GuestOrderItem> items,
      required this.deliveryAddress,
      required this.deliveryCoordinates,
      required this.guestName,
      required this.guestPhone,
      this.guestEmail,
      this.paymentMethod = 'cash',
      this.specialInstructions,
      this.scheduledDeliveryTime})
      : _items = items;

  factory _$GuestOrderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestOrderRequestImplFromJson(json);

  @override
  final String restaurantId;
  final List<GuestOrderItem> _items;
  @override
  List<GuestOrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String deliveryAddress;
  @override
  final GuestOrderCoordinates deliveryCoordinates;
  @override
  final String guestName;
  @override
  final String guestPhone;
  @override
  final String? guestEmail;
  @override
  @JsonKey()
  final String paymentMethod;
  @override
  final String? specialInstructions;
  @override
  final DateTime? scheduledDeliveryTime;

  @override
  String toString() {
    return 'GuestOrderRequest(restaurantId: $restaurantId, items: $items, deliveryAddress: $deliveryAddress, deliveryCoordinates: $deliveryCoordinates, guestName: $guestName, guestPhone: $guestPhone, guestEmail: $guestEmail, paymentMethod: $paymentMethod, specialInstructions: $specialInstructions, scheduledDeliveryTime: $scheduledDeliveryTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestOrderRequestImpl &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.deliveryCoordinates, deliveryCoordinates) ||
                other.deliveryCoordinates == deliveryCoordinates) &&
            (identical(other.guestName, guestName) ||
                other.guestName == guestName) &&
            (identical(other.guestPhone, guestPhone) ||
                other.guestPhone == guestPhone) &&
            (identical(other.guestEmail, guestEmail) ||
                other.guestEmail == guestEmail) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions) &&
            (identical(other.scheduledDeliveryTime, scheduledDeliveryTime) ||
                other.scheduledDeliveryTime == scheduledDeliveryTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      restaurantId,
      const DeepCollectionEquality().hash(_items),
      deliveryAddress,
      deliveryCoordinates,
      guestName,
      guestPhone,
      guestEmail,
      paymentMethod,
      specialInstructions,
      scheduledDeliveryTime);

  /// Create a copy of GuestOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestOrderRequestImplCopyWith<_$GuestOrderRequestImpl> get copyWith =>
      __$$GuestOrderRequestImplCopyWithImpl<_$GuestOrderRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestOrderRequestImplToJson(
      this,
    );
  }
}

abstract class _GuestOrderRequest implements GuestOrderRequest {
  const factory _GuestOrderRequest(
      {required final String restaurantId,
      required final List<GuestOrderItem> items,
      required final String deliveryAddress,
      required final GuestOrderCoordinates deliveryCoordinates,
      required final String guestName,
      required final String guestPhone,
      final String? guestEmail,
      final String paymentMethod,
      final String? specialInstructions,
      final DateTime? scheduledDeliveryTime}) = _$GuestOrderRequestImpl;

  factory _GuestOrderRequest.fromJson(Map<String, dynamic> json) =
      _$GuestOrderRequestImpl.fromJson;

  @override
  String get restaurantId;
  @override
  List<GuestOrderItem> get items;
  @override
  String get deliveryAddress;
  @override
  GuestOrderCoordinates get deliveryCoordinates;
  @override
  String get guestName;
  @override
  String get guestPhone;
  @override
  String? get guestEmail;
  @override
  String get paymentMethod;
  @override
  String? get specialInstructions;
  @override
  DateTime? get scheduledDeliveryTime;

  /// Create a copy of GuestOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestOrderRequestImplCopyWith<_$GuestOrderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GuestOrderItem _$GuestOrderItemFromJson(Map<String, dynamic> json) {
  return _GuestOrderItem.fromJson(json);
}

/// @nodoc
mixin _$GuestOrderItem {
  String get menuId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String? get customizations => throw _privateConstructorUsedError;

  /// Serializes this GuestOrderItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestOrderItemCopyWith<GuestOrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestOrderItemCopyWith<$Res> {
  factory $GuestOrderItemCopyWith(
          GuestOrderItem value, $Res Function(GuestOrderItem) then) =
      _$GuestOrderItemCopyWithImpl<$Res, GuestOrderItem>;
  @useResult
  $Res call({String menuId, int quantity, String? customizations});
}

/// @nodoc
class _$GuestOrderItemCopyWithImpl<$Res, $Val extends GuestOrderItem>
    implements $GuestOrderItemCopyWith<$Res> {
  _$GuestOrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuId = null,
    Object? quantity = null,
    Object? customizations = freezed,
  }) {
    return _then(_value.copyWith(
      menuId: null == menuId
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      customizations: freezed == customizations
          ? _value.customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuestOrderItemImplCopyWith<$Res>
    implements $GuestOrderItemCopyWith<$Res> {
  factory _$$GuestOrderItemImplCopyWith(_$GuestOrderItemImpl value,
          $Res Function(_$GuestOrderItemImpl) then) =
      __$$GuestOrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String menuId, int quantity, String? customizations});
}

/// @nodoc
class __$$GuestOrderItemImplCopyWithImpl<$Res>
    extends _$GuestOrderItemCopyWithImpl<$Res, _$GuestOrderItemImpl>
    implements _$$GuestOrderItemImplCopyWith<$Res> {
  __$$GuestOrderItemImplCopyWithImpl(
      _$GuestOrderItemImpl _value, $Res Function(_$GuestOrderItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuId = null,
    Object? quantity = null,
    Object? customizations = freezed,
  }) {
    return _then(_$GuestOrderItemImpl(
      menuId: null == menuId
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      customizations: freezed == customizations
          ? _value.customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestOrderItemImpl implements _GuestOrderItem {
  const _$GuestOrderItemImpl(
      {required this.menuId, required this.quantity, this.customizations});

  factory _$GuestOrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestOrderItemImplFromJson(json);

  @override
  final String menuId;
  @override
  final int quantity;
  @override
  final String? customizations;

  @override
  String toString() {
    return 'GuestOrderItem(menuId: $menuId, quantity: $quantity, customizations: $customizations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestOrderItemImpl &&
            (identical(other.menuId, menuId) || other.menuId == menuId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.customizations, customizations) ||
                other.customizations == customizations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, menuId, quantity, customizations);

  /// Create a copy of GuestOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestOrderItemImplCopyWith<_$GuestOrderItemImpl> get copyWith =>
      __$$GuestOrderItemImplCopyWithImpl<_$GuestOrderItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestOrderItemImplToJson(
      this,
    );
  }
}

abstract class _GuestOrderItem implements GuestOrderItem {
  const factory _GuestOrderItem(
      {required final String menuId,
      required final int quantity,
      final String? customizations}) = _$GuestOrderItemImpl;

  factory _GuestOrderItem.fromJson(Map<String, dynamic> json) =
      _$GuestOrderItemImpl.fromJson;

  @override
  String get menuId;
  @override
  int get quantity;
  @override
  String? get customizations;

  /// Create a copy of GuestOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestOrderItemImplCopyWith<_$GuestOrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GuestOrderCoordinates _$GuestOrderCoordinatesFromJson(
    Map<String, dynamic> json) {
  return _GuestOrderCoordinates.fromJson(json);
}

/// @nodoc
mixin _$GuestOrderCoordinates {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  /// Serializes this GuestOrderCoordinates to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestOrderCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestOrderCoordinatesCopyWith<GuestOrderCoordinates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestOrderCoordinatesCopyWith<$Res> {
  factory $GuestOrderCoordinatesCopyWith(GuestOrderCoordinates value,
          $Res Function(GuestOrderCoordinates) then) =
      _$GuestOrderCoordinatesCopyWithImpl<$Res, GuestOrderCoordinates>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$GuestOrderCoordinatesCopyWithImpl<$Res,
        $Val extends GuestOrderCoordinates>
    implements $GuestOrderCoordinatesCopyWith<$Res> {
  _$GuestOrderCoordinatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestOrderCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuestOrderCoordinatesImplCopyWith<$Res>
    implements $GuestOrderCoordinatesCopyWith<$Res> {
  factory _$$GuestOrderCoordinatesImplCopyWith(
          _$GuestOrderCoordinatesImpl value,
          $Res Function(_$GuestOrderCoordinatesImpl) then) =
      __$$GuestOrderCoordinatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$GuestOrderCoordinatesImplCopyWithImpl<$Res>
    extends _$GuestOrderCoordinatesCopyWithImpl<$Res,
        _$GuestOrderCoordinatesImpl>
    implements _$$GuestOrderCoordinatesImplCopyWith<$Res> {
  __$$GuestOrderCoordinatesImplCopyWithImpl(_$GuestOrderCoordinatesImpl _value,
      $Res Function(_$GuestOrderCoordinatesImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestOrderCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$GuestOrderCoordinatesImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestOrderCoordinatesImpl implements _GuestOrderCoordinates {
  const _$GuestOrderCoordinatesImpl({required this.lat, required this.lng});

  factory _$GuestOrderCoordinatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestOrderCoordinatesImplFromJson(json);

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'GuestOrderCoordinates(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestOrderCoordinatesImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  /// Create a copy of GuestOrderCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestOrderCoordinatesImplCopyWith<_$GuestOrderCoordinatesImpl>
      get copyWith => __$$GuestOrderCoordinatesImplCopyWithImpl<
          _$GuestOrderCoordinatesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestOrderCoordinatesImplToJson(
      this,
    );
  }
}

abstract class _GuestOrderCoordinates implements GuestOrderCoordinates {
  const factory _GuestOrderCoordinates(
      {required final double lat,
      required final double lng}) = _$GuestOrderCoordinatesImpl;

  factory _GuestOrderCoordinates.fromJson(Map<String, dynamic> json) =
      _$GuestOrderCoordinatesImpl.fromJson;

  @override
  double get lat;
  @override
  double get lng;

  /// Create a copy of GuestOrderCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestOrderCoordinatesImplCopyWith<_$GuestOrderCoordinatesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GuestOrderResponse _$GuestOrderResponseFromJson(Map<String, dynamic> json) {
  return _GuestOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$GuestOrderResponse {
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  GuestOrderData? get data => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this GuestOrderResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestOrderResponseCopyWith<GuestOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestOrderResponseCopyWith<$Res> {
  factory $GuestOrderResponseCopyWith(
          GuestOrderResponse value, $Res Function(GuestOrderResponse) then) =
      _$GuestOrderResponseCopyWithImpl<$Res, GuestOrderResponse>;
  @useResult
  $Res call(
      {bool success, String? message, GuestOrderData? data, String? error});

  $GuestOrderDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$GuestOrderResponseCopyWithImpl<$Res, $Val extends GuestOrderResponse>
    implements $GuestOrderResponseCopyWith<$Res> {
  _$GuestOrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GuestOrderData?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of GuestOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GuestOrderDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $GuestOrderDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GuestOrderResponseImplCopyWith<$Res>
    implements $GuestOrderResponseCopyWith<$Res> {
  factory _$$GuestOrderResponseImplCopyWith(_$GuestOrderResponseImpl value,
          $Res Function(_$GuestOrderResponseImpl) then) =
      __$$GuestOrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success, String? message, GuestOrderData? data, String? error});

  @override
  $GuestOrderDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$GuestOrderResponseImplCopyWithImpl<$Res>
    extends _$GuestOrderResponseCopyWithImpl<$Res, _$GuestOrderResponseImpl>
    implements _$$GuestOrderResponseImplCopyWith<$Res> {
  __$$GuestOrderResponseImplCopyWithImpl(_$GuestOrderResponseImpl _value,
      $Res Function(_$GuestOrderResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$GuestOrderResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GuestOrderData?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestOrderResponseImpl implements _GuestOrderResponse {
  const _$GuestOrderResponseImpl(
      {required this.success, this.message, this.data, this.error});

  factory _$GuestOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestOrderResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String? message;
  @override
  final GuestOrderData? data;
  @override
  final String? error;

  @override
  String toString() {
    return 'GuestOrderResponse(success: $success, message: $message, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestOrderResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data, error);

  /// Create a copy of GuestOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestOrderResponseImplCopyWith<_$GuestOrderResponseImpl> get copyWith =>
      __$$GuestOrderResponseImplCopyWithImpl<_$GuestOrderResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestOrderResponseImplToJson(
      this,
    );
  }
}

abstract class _GuestOrderResponse implements GuestOrderResponse {
  const factory _GuestOrderResponse(
      {required final bool success,
      final String? message,
      final GuestOrderData? data,
      final String? error}) = _$GuestOrderResponseImpl;

  factory _GuestOrderResponse.fromJson(Map<String, dynamic> json) =
      _$GuestOrderResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String? get message;
  @override
  GuestOrderData? get data;
  @override
  String? get error;

  /// Create a copy of GuestOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestOrderResponseImplCopyWith<_$GuestOrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GuestOrderData _$GuestOrderDataFromJson(Map<String, dynamic> json) {
  return _GuestOrderData.fromJson(json);
}

/// @nodoc
mixin _$GuestOrderData {
  String get orderId => throw _privateConstructorUsedError;
  String get trackingUrl => throw _privateConstructorUsedError;
  String? get paymentUrl => throw _privateConstructorUsedError;
  String? get estimatedDeliveryTime => throw _privateConstructorUsedError;
  String? get orderNumber => throw _privateConstructorUsedError;
  double? get totalAmount => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;

  /// Serializes this GuestOrderData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestOrderData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestOrderDataCopyWith<GuestOrderData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestOrderDataCopyWith<$Res> {
  factory $GuestOrderDataCopyWith(
          GuestOrderData value, $Res Function(GuestOrderData) then) =
      _$GuestOrderDataCopyWithImpl<$Res, GuestOrderData>;
  @useResult
  $Res call(
      {String orderId,
      String trackingUrl,
      String? paymentUrl,
      String? estimatedDeliveryTime,
      String? orderNumber,
      double? totalAmount,
      String? currency});
}

/// @nodoc
class _$GuestOrderDataCopyWithImpl<$Res, $Val extends GuestOrderData>
    implements $GuestOrderDataCopyWith<$Res> {
  _$GuestOrderDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestOrderData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? trackingUrl = null,
    Object? paymentUrl = freezed,
    Object? estimatedDeliveryTime = freezed,
    Object? orderNumber = freezed,
    Object? totalAmount = freezed,
    Object? currency = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      trackingUrl: null == trackingUrl
          ? _value.trackingUrl
          : trackingUrl // ignore: cast_nullable_to_non_nullable
              as String,
      paymentUrl: freezed == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedDeliveryTime: freezed == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNumber: freezed == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuestOrderDataImplCopyWith<$Res>
    implements $GuestOrderDataCopyWith<$Res> {
  factory _$$GuestOrderDataImplCopyWith(_$GuestOrderDataImpl value,
          $Res Function(_$GuestOrderDataImpl) then) =
      __$$GuestOrderDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderId,
      String trackingUrl,
      String? paymentUrl,
      String? estimatedDeliveryTime,
      String? orderNumber,
      double? totalAmount,
      String? currency});
}

/// @nodoc
class __$$GuestOrderDataImplCopyWithImpl<$Res>
    extends _$GuestOrderDataCopyWithImpl<$Res, _$GuestOrderDataImpl>
    implements _$$GuestOrderDataImplCopyWith<$Res> {
  __$$GuestOrderDataImplCopyWithImpl(
      _$GuestOrderDataImpl _value, $Res Function(_$GuestOrderDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestOrderData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? trackingUrl = null,
    Object? paymentUrl = freezed,
    Object? estimatedDeliveryTime = freezed,
    Object? orderNumber = freezed,
    Object? totalAmount = freezed,
    Object? currency = freezed,
  }) {
    return _then(_$GuestOrderDataImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      trackingUrl: null == trackingUrl
          ? _value.trackingUrl
          : trackingUrl // ignore: cast_nullable_to_non_nullable
              as String,
      paymentUrl: freezed == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedDeliveryTime: freezed == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNumber: freezed == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestOrderDataImpl implements _GuestOrderData {
  const _$GuestOrderDataImpl(
      {required this.orderId,
      required this.trackingUrl,
      this.paymentUrl,
      this.estimatedDeliveryTime,
      this.orderNumber,
      this.totalAmount,
      this.currency});

  factory _$GuestOrderDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestOrderDataImplFromJson(json);

  @override
  final String orderId;
  @override
  final String trackingUrl;
  @override
  final String? paymentUrl;
  @override
  final String? estimatedDeliveryTime;
  @override
  final String? orderNumber;
  @override
  final double? totalAmount;
  @override
  final String? currency;

  @override
  String toString() {
    return 'GuestOrderData(orderId: $orderId, trackingUrl: $trackingUrl, paymentUrl: $paymentUrl, estimatedDeliveryTime: $estimatedDeliveryTime, orderNumber: $orderNumber, totalAmount: $totalAmount, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestOrderDataImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.trackingUrl, trackingUrl) ||
                other.trackingUrl == trackingUrl) &&
            (identical(other.paymentUrl, paymentUrl) ||
                other.paymentUrl == paymentUrl) &&
            (identical(other.estimatedDeliveryTime, estimatedDeliveryTime) ||
                other.estimatedDeliveryTime == estimatedDeliveryTime) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, trackingUrl, paymentUrl,
      estimatedDeliveryTime, orderNumber, totalAmount, currency);

  /// Create a copy of GuestOrderData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestOrderDataImplCopyWith<_$GuestOrderDataImpl> get copyWith =>
      __$$GuestOrderDataImplCopyWithImpl<_$GuestOrderDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestOrderDataImplToJson(
      this,
    );
  }
}

abstract class _GuestOrderData implements GuestOrderData {
  const factory _GuestOrderData(
      {required final String orderId,
      required final String trackingUrl,
      final String? paymentUrl,
      final String? estimatedDeliveryTime,
      final String? orderNumber,
      final double? totalAmount,
      final String? currency}) = _$GuestOrderDataImpl;

  factory _GuestOrderData.fromJson(Map<String, dynamic> json) =
      _$GuestOrderDataImpl.fromJson;

  @override
  String get orderId;
  @override
  String get trackingUrl;
  @override
  String? get paymentUrl;
  @override
  String? get estimatedDeliveryTime;
  @override
  String? get orderNumber;
  @override
  double? get totalAmount;
  @override
  String? get currency;

  /// Create a copy of GuestOrderData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestOrderDataImplCopyWith<_$GuestOrderDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GuestOrderTracking _$GuestOrderTrackingFromJson(Map<String, dynamic> json) {
  return _GuestOrderTracking.fromJson(json);
}

/// @nodoc
mixin _$GuestOrderTracking {
  String get orderId => throw _privateConstructorUsedError;
  String get orderNumber => throw _privateConstructorUsedError;
  GuestOrderStatus get status => throw _privateConstructorUsedError;
  String get restaurantName => throw _privateConstructorUsedError;
  List<GuestOrderItem> get items => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get deliveryAddress => throw _privateConstructorUsedError;
  String? get driverName => throw _privateConstructorUsedError;
  String? get driverPhone => throw _privateConstructorUsedError;
  GuestOrderCoordinates? get driverLocation =>
      throw _privateConstructorUsedError;
  String? get estimatedDeliveryTime => throw _privateConstructorUsedError;
  List<GuestOrderStatusUpdate>? get statusHistory =>
      throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this GuestOrderTracking to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestOrderTracking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestOrderTrackingCopyWith<GuestOrderTracking> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestOrderTrackingCopyWith<$Res> {
  factory $GuestOrderTrackingCopyWith(
          GuestOrderTracking value, $Res Function(GuestOrderTracking) then) =
      _$GuestOrderTrackingCopyWithImpl<$Res, GuestOrderTracking>;
  @useResult
  $Res call(
      {String orderId,
      String orderNumber,
      GuestOrderStatus status,
      String restaurantName,
      List<GuestOrderItem> items,
      double totalAmount,
      String currency,
      String deliveryAddress,
      String? driverName,
      String? driverPhone,
      GuestOrderCoordinates? driverLocation,
      String? estimatedDeliveryTime,
      List<GuestOrderStatusUpdate>? statusHistory,
      DateTime createdAt,
      DateTime? updatedAt});

  $GuestOrderCoordinatesCopyWith<$Res>? get driverLocation;
}

/// @nodoc
class _$GuestOrderTrackingCopyWithImpl<$Res, $Val extends GuestOrderTracking>
    implements $GuestOrderTrackingCopyWith<$Res> {
  _$GuestOrderTrackingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestOrderTracking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? orderNumber = null,
    Object? status = null,
    Object? restaurantName = null,
    Object? items = null,
    Object? totalAmount = null,
    Object? currency = null,
    Object? deliveryAddress = null,
    Object? driverName = freezed,
    Object? driverPhone = freezed,
    Object? driverLocation = freezed,
    Object? estimatedDeliveryTime = freezed,
    Object? statusHistory = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GuestOrderStatus,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GuestOrderItem>,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      driverPhone: freezed == driverPhone
          ? _value.driverPhone
          : driverPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      driverLocation: freezed == driverLocation
          ? _value.driverLocation
          : driverLocation // ignore: cast_nullable_to_non_nullable
              as GuestOrderCoordinates?,
      estimatedDeliveryTime: freezed == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHistory: freezed == statusHistory
          ? _value.statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<GuestOrderStatusUpdate>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of GuestOrderTracking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GuestOrderCoordinatesCopyWith<$Res>? get driverLocation {
    if (_value.driverLocation == null) {
      return null;
    }

    return $GuestOrderCoordinatesCopyWith<$Res>(_value.driverLocation!,
        (value) {
      return _then(_value.copyWith(driverLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GuestOrderTrackingImplCopyWith<$Res>
    implements $GuestOrderTrackingCopyWith<$Res> {
  factory _$$GuestOrderTrackingImplCopyWith(_$GuestOrderTrackingImpl value,
          $Res Function(_$GuestOrderTrackingImpl) then) =
      __$$GuestOrderTrackingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderId,
      String orderNumber,
      GuestOrderStatus status,
      String restaurantName,
      List<GuestOrderItem> items,
      double totalAmount,
      String currency,
      String deliveryAddress,
      String? driverName,
      String? driverPhone,
      GuestOrderCoordinates? driverLocation,
      String? estimatedDeliveryTime,
      List<GuestOrderStatusUpdate>? statusHistory,
      DateTime createdAt,
      DateTime? updatedAt});

  @override
  $GuestOrderCoordinatesCopyWith<$Res>? get driverLocation;
}

/// @nodoc
class __$$GuestOrderTrackingImplCopyWithImpl<$Res>
    extends _$GuestOrderTrackingCopyWithImpl<$Res, _$GuestOrderTrackingImpl>
    implements _$$GuestOrderTrackingImplCopyWith<$Res> {
  __$$GuestOrderTrackingImplCopyWithImpl(_$GuestOrderTrackingImpl _value,
      $Res Function(_$GuestOrderTrackingImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestOrderTracking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? orderNumber = null,
    Object? status = null,
    Object? restaurantName = null,
    Object? items = null,
    Object? totalAmount = null,
    Object? currency = null,
    Object? deliveryAddress = null,
    Object? driverName = freezed,
    Object? driverPhone = freezed,
    Object? driverLocation = freezed,
    Object? estimatedDeliveryTime = freezed,
    Object? statusHistory = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$GuestOrderTrackingImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GuestOrderStatus,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GuestOrderItem>,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      driverPhone: freezed == driverPhone
          ? _value.driverPhone
          : driverPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      driverLocation: freezed == driverLocation
          ? _value.driverLocation
          : driverLocation // ignore: cast_nullable_to_non_nullable
              as GuestOrderCoordinates?,
      estimatedDeliveryTime: freezed == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHistory: freezed == statusHistory
          ? _value._statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<GuestOrderStatusUpdate>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestOrderTrackingImpl implements _GuestOrderTracking {
  const _$GuestOrderTrackingImpl(
      {required this.orderId,
      required this.orderNumber,
      required this.status,
      required this.restaurantName,
      required final List<GuestOrderItem> items,
      required this.totalAmount,
      required this.currency,
      required this.deliveryAddress,
      this.driverName,
      this.driverPhone,
      this.driverLocation,
      this.estimatedDeliveryTime,
      final List<GuestOrderStatusUpdate>? statusHistory,
      required this.createdAt,
      this.updatedAt})
      : _items = items,
        _statusHistory = statusHistory;

  factory _$GuestOrderTrackingImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestOrderTrackingImplFromJson(json);

  @override
  final String orderId;
  @override
  final String orderNumber;
  @override
  final GuestOrderStatus status;
  @override
  final String restaurantName;
  final List<GuestOrderItem> _items;
  @override
  List<GuestOrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final double totalAmount;
  @override
  final String currency;
  @override
  final String deliveryAddress;
  @override
  final String? driverName;
  @override
  final String? driverPhone;
  @override
  final GuestOrderCoordinates? driverLocation;
  @override
  final String? estimatedDeliveryTime;
  final List<GuestOrderStatusUpdate>? _statusHistory;
  @override
  List<GuestOrderStatusUpdate>? get statusHistory {
    final value = _statusHistory;
    if (value == null) return null;
    if (_statusHistory is EqualUnmodifiableListView) return _statusHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'GuestOrderTracking(orderId: $orderId, orderNumber: $orderNumber, status: $status, restaurantName: $restaurantName, items: $items, totalAmount: $totalAmount, currency: $currency, deliveryAddress: $deliveryAddress, driverName: $driverName, driverPhone: $driverPhone, driverLocation: $driverLocation, estimatedDeliveryTime: $estimatedDeliveryTime, statusHistory: $statusHistory, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestOrderTrackingImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.driverPhone, driverPhone) ||
                other.driverPhone == driverPhone) &&
            (identical(other.driverLocation, driverLocation) ||
                other.driverLocation == driverLocation) &&
            (identical(other.estimatedDeliveryTime, estimatedDeliveryTime) ||
                other.estimatedDeliveryTime == estimatedDeliveryTime) &&
            const DeepCollectionEquality()
                .equals(other._statusHistory, _statusHistory) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderId,
      orderNumber,
      status,
      restaurantName,
      const DeepCollectionEquality().hash(_items),
      totalAmount,
      currency,
      deliveryAddress,
      driverName,
      driverPhone,
      driverLocation,
      estimatedDeliveryTime,
      const DeepCollectionEquality().hash(_statusHistory),
      createdAt,
      updatedAt);

  /// Create a copy of GuestOrderTracking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestOrderTrackingImplCopyWith<_$GuestOrderTrackingImpl> get copyWith =>
      __$$GuestOrderTrackingImplCopyWithImpl<_$GuestOrderTrackingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestOrderTrackingImplToJson(
      this,
    );
  }
}

abstract class _GuestOrderTracking implements GuestOrderTracking {
  const factory _GuestOrderTracking(
      {required final String orderId,
      required final String orderNumber,
      required final GuestOrderStatus status,
      required final String restaurantName,
      required final List<GuestOrderItem> items,
      required final double totalAmount,
      required final String currency,
      required final String deliveryAddress,
      final String? driverName,
      final String? driverPhone,
      final GuestOrderCoordinates? driverLocation,
      final String? estimatedDeliveryTime,
      final List<GuestOrderStatusUpdate>? statusHistory,
      required final DateTime createdAt,
      final DateTime? updatedAt}) = _$GuestOrderTrackingImpl;

  factory _GuestOrderTracking.fromJson(Map<String, dynamic> json) =
      _$GuestOrderTrackingImpl.fromJson;

  @override
  String get orderId;
  @override
  String get orderNumber;
  @override
  GuestOrderStatus get status;
  @override
  String get restaurantName;
  @override
  List<GuestOrderItem> get items;
  @override
  double get totalAmount;
  @override
  String get currency;
  @override
  String get deliveryAddress;
  @override
  String? get driverName;
  @override
  String? get driverPhone;
  @override
  GuestOrderCoordinates? get driverLocation;
  @override
  String? get estimatedDeliveryTime;
  @override
  List<GuestOrderStatusUpdate>? get statusHistory;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of GuestOrderTracking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestOrderTrackingImplCopyWith<_$GuestOrderTrackingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GuestOrderStatusUpdate _$GuestOrderStatusUpdateFromJson(
    Map<String, dynamic> json) {
  return _GuestOrderStatusUpdate.fromJson(json);
}

/// @nodoc
mixin _$GuestOrderStatusUpdate {
  GuestOrderStatus get status => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;

  /// Serializes this GuestOrderStatusUpdate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestOrderStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestOrderStatusUpdateCopyWith<GuestOrderStatusUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestOrderStatusUpdateCopyWith<$Res> {
  factory $GuestOrderStatusUpdateCopyWith(GuestOrderStatusUpdate value,
          $Res Function(GuestOrderStatusUpdate) then) =
      _$GuestOrderStatusUpdateCopyWithImpl<$Res, GuestOrderStatusUpdate>;
  @useResult
  $Res call(
      {GuestOrderStatus status,
      DateTime timestamp,
      String? note,
      String? location});
}

/// @nodoc
class _$GuestOrderStatusUpdateCopyWithImpl<$Res,
        $Val extends GuestOrderStatusUpdate>
    implements $GuestOrderStatusUpdateCopyWith<$Res> {
  _$GuestOrderStatusUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestOrderStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? timestamp = null,
    Object? note = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GuestOrderStatus,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuestOrderStatusUpdateImplCopyWith<$Res>
    implements $GuestOrderStatusUpdateCopyWith<$Res> {
  factory _$$GuestOrderStatusUpdateImplCopyWith(
          _$GuestOrderStatusUpdateImpl value,
          $Res Function(_$GuestOrderStatusUpdateImpl) then) =
      __$$GuestOrderStatusUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GuestOrderStatus status,
      DateTime timestamp,
      String? note,
      String? location});
}

/// @nodoc
class __$$GuestOrderStatusUpdateImplCopyWithImpl<$Res>
    extends _$GuestOrderStatusUpdateCopyWithImpl<$Res,
        _$GuestOrderStatusUpdateImpl>
    implements _$$GuestOrderStatusUpdateImplCopyWith<$Res> {
  __$$GuestOrderStatusUpdateImplCopyWithImpl(
      _$GuestOrderStatusUpdateImpl _value,
      $Res Function(_$GuestOrderStatusUpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestOrderStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? timestamp = null,
    Object? note = freezed,
    Object? location = freezed,
  }) {
    return _then(_$GuestOrderStatusUpdateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GuestOrderStatus,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestOrderStatusUpdateImpl implements _GuestOrderStatusUpdate {
  const _$GuestOrderStatusUpdateImpl(
      {required this.status,
      required this.timestamp,
      this.note,
      this.location});

  factory _$GuestOrderStatusUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestOrderStatusUpdateImplFromJson(json);

  @override
  final GuestOrderStatus status;
  @override
  final DateTime timestamp;
  @override
  final String? note;
  @override
  final String? location;

  @override
  String toString() {
    return 'GuestOrderStatusUpdate(status: $status, timestamp: $timestamp, note: $note, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestOrderStatusUpdateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, timestamp, note, location);

  /// Create a copy of GuestOrderStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestOrderStatusUpdateImplCopyWith<_$GuestOrderStatusUpdateImpl>
      get copyWith => __$$GuestOrderStatusUpdateImplCopyWithImpl<
          _$GuestOrderStatusUpdateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestOrderStatusUpdateImplToJson(
      this,
    );
  }
}

abstract class _GuestOrderStatusUpdate implements GuestOrderStatusUpdate {
  const factory _GuestOrderStatusUpdate(
      {required final GuestOrderStatus status,
      required final DateTime timestamp,
      final String? note,
      final String? location}) = _$GuestOrderStatusUpdateImpl;

  factory _GuestOrderStatusUpdate.fromJson(Map<String, dynamic> json) =
      _$GuestOrderStatusUpdateImpl.fromJson;

  @override
  GuestOrderStatus get status;
  @override
  DateTime get timestamp;
  @override
  String? get note;
  @override
  String? get location;

  /// Create a copy of GuestOrderStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestOrderStatusUpdateImplCopyWith<_$GuestOrderStatusUpdateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GuestUser _$GuestUserFromJson(Map<String, dynamic> json) {
  return _GuestUser.fromJson(json);
}

/// @nodoc
mixin _$GuestUser {
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get tempId => throw _privateConstructorUsedError;

  /// Serializes this GuestUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestUserCopyWith<GuestUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestUserCopyWith<$Res> {
  factory $GuestUserCopyWith(GuestUser value, $Res Function(GuestUser) then) =
      _$GuestUserCopyWithImpl<$Res, GuestUser>;
  @useResult
  $Res call({String name, String phone, String? email, String? tempId});
}

/// @nodoc
class _$GuestUserCopyWithImpl<$Res, $Val extends GuestUser>
    implements $GuestUserCopyWith<$Res> {
  _$GuestUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? email = freezed,
    Object? tempId = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      tempId: freezed == tempId
          ? _value.tempId
          : tempId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuestUserImplCopyWith<$Res>
    implements $GuestUserCopyWith<$Res> {
  factory _$$GuestUserImplCopyWith(
          _$GuestUserImpl value, $Res Function(_$GuestUserImpl) then) =
      __$$GuestUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String phone, String? email, String? tempId});
}

/// @nodoc
class __$$GuestUserImplCopyWithImpl<$Res>
    extends _$GuestUserCopyWithImpl<$Res, _$GuestUserImpl>
    implements _$$GuestUserImplCopyWith<$Res> {
  __$$GuestUserImplCopyWithImpl(
      _$GuestUserImpl _value, $Res Function(_$GuestUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? email = freezed,
    Object? tempId = freezed,
  }) {
    return _then(_$GuestUserImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      tempId: freezed == tempId
          ? _value.tempId
          : tempId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestUserImpl implements _GuestUser {
  const _$GuestUserImpl(
      {required this.name, required this.phone, this.email, this.tempId});

  factory _$GuestUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestUserImplFromJson(json);

  @override
  final String name;
  @override
  final String phone;
  @override
  final String? email;
  @override
  final String? tempId;

  @override
  String toString() {
    return 'GuestUser(name: $name, phone: $phone, email: $email, tempId: $tempId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestUserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.tempId, tempId) || other.tempId == tempId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, phone, email, tempId);

  /// Create a copy of GuestUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestUserImplCopyWith<_$GuestUserImpl> get copyWith =>
      __$$GuestUserImplCopyWithImpl<_$GuestUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestUserImplToJson(
      this,
    );
  }
}

abstract class _GuestUser implements GuestUser {
  const factory _GuestUser(
      {required final String name,
      required final String phone,
      final String? email,
      final String? tempId}) = _$GuestUserImpl;

  factory _GuestUser.fromJson(Map<String, dynamic> json) =
      _$GuestUserImpl.fromJson;

  @override
  String get name;
  @override
  String get phone;
  @override
  String? get email;
  @override
  String? get tempId;

  /// Create a copy of GuestUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestUserImplCopyWith<_$GuestUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
