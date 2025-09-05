// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get restaurantId => throw _privateConstructorUsedError;
  String get restaurantName => throw _privateConstructorUsedError;
  List<CartItem> get items => throw _privateConstructorUsedError;
  OrderStatus get status => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  UserAddress get deliveryAddress => throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  String? get specialInstructions => throw _privateConstructorUsedError;
  String? get driverId => throw _privateConstructorUsedError;
  String? get driverName => throw _privateConstructorUsedError;
  String? get driverPhone => throw _privateConstructorUsedError;
  DateTime? get estimatedDeliveryTime => throw _privateConstructorUsedError;
  DateTime? get actualDeliveryTime => throw _privateConstructorUsedError;
  List<OrderStatusUpdate> get statusUpdates =>
      throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String restaurantId,
      String restaurantName,
      List<CartItem> items,
      OrderStatus status,
      double subtotal,
      double deliveryFee,
      double tax,
      double discount,
      double total,
      UserAddress deliveryAddress,
      PaymentMethod paymentMethod,
      String? specialInstructions,
      String? driverId,
      String? driverName,
      String? driverPhone,
      DateTime? estimatedDeliveryTime,
      DateTime? actualDeliveryTime,
      List<OrderStatusUpdate> statusUpdates,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? restaurantId = null,
    Object? restaurantName = null,
    Object? items = null,
    Object? status = null,
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? tax = null,
    Object? discount = null,
    Object? total = null,
    Object? deliveryAddress = null,
    Object? paymentMethod = null,
    Object? specialInstructions = freezed,
    Object? driverId = freezed,
    Object? driverName = freezed,
    Object? driverPhone = freezed,
    Object? estimatedDeliveryTime = freezed,
    Object? actualDeliveryTime = freezed,
    Object? statusUpdates = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as UserAddress,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      driverPhone: freezed == driverPhone
          ? _value.driverPhone
          : driverPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedDeliveryTime: freezed == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualDeliveryTime: freezed == actualDeliveryTime
          ? _value.actualDeliveryTime
          : actualDeliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      statusUpdates: null == statusUpdates
          ? _value.statusUpdates
          : statusUpdates // ignore: cast_nullable_to_non_nullable
              as List<OrderStatusUpdate>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String restaurantId,
      String restaurantName,
      List<CartItem> items,
      OrderStatus status,
      double subtotal,
      double deliveryFee,
      double tax,
      double discount,
      double total,
      UserAddress deliveryAddress,
      PaymentMethod paymentMethod,
      String? specialInstructions,
      String? driverId,
      String? driverName,
      String? driverPhone,
      DateTime? estimatedDeliveryTime,
      DateTime? actualDeliveryTime,
      List<OrderStatusUpdate> statusUpdates,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? restaurantId = null,
    Object? restaurantName = null,
    Object? items = null,
    Object? status = null,
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? tax = null,
    Object? discount = null,
    Object? total = null,
    Object? deliveryAddress = null,
    Object? paymentMethod = null,
    Object? specialInstructions = freezed,
    Object? driverId = freezed,
    Object? driverName = freezed,
    Object? driverPhone = freezed,
    Object? estimatedDeliveryTime = freezed,
    Object? actualDeliveryTime = freezed,
    Object? statusUpdates = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$OrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as UserAddress,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      driverPhone: freezed == driverPhone
          ? _value.driverPhone
          : driverPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedDeliveryTime: freezed == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualDeliveryTime: freezed == actualDeliveryTime
          ? _value.actualDeliveryTime
          : actualDeliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      statusUpdates: null == statusUpdates
          ? _value._statusUpdates
          : statusUpdates // ignore: cast_nullable_to_non_nullable
              as List<OrderStatusUpdate>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl extends _Order {
  const _$OrderImpl(
      {required this.id,
      required this.userId,
      required this.restaurantId,
      required this.restaurantName,
      required final List<CartItem> items,
      required this.status,
      required this.subtotal,
      required this.deliveryFee,
      required this.tax,
      required this.discount,
      required this.total,
      required this.deliveryAddress,
      required this.paymentMethod,
      this.specialInstructions,
      this.driverId,
      this.driverName,
      this.driverPhone,
      this.estimatedDeliveryTime,
      this.actualDeliveryTime,
      final List<OrderStatusUpdate> statusUpdates = const [],
      this.createdAt,
      this.updatedAt})
      : _items = items,
        _statusUpdates = statusUpdates,
        super._();

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String restaurantId;
  @override
  final String restaurantName;
  final List<CartItem> _items;
  @override
  List<CartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final OrderStatus status;
  @override
  final double subtotal;
  @override
  final double deliveryFee;
  @override
  final double tax;
  @override
  final double discount;
  @override
  final double total;
  @override
  final UserAddress deliveryAddress;
  @override
  final PaymentMethod paymentMethod;
  @override
  final String? specialInstructions;
  @override
  final String? driverId;
  @override
  final String? driverName;
  @override
  final String? driverPhone;
  @override
  final DateTime? estimatedDeliveryTime;
  @override
  final DateTime? actualDeliveryTime;
  final List<OrderStatusUpdate> _statusUpdates;
  @override
  @JsonKey()
  List<OrderStatusUpdate> get statusUpdates {
    if (_statusUpdates is EqualUnmodifiableListView) return _statusUpdates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statusUpdates);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Order(id: $id, userId: $userId, restaurantId: $restaurantId, restaurantName: $restaurantName, items: $items, status: $status, subtotal: $subtotal, deliveryFee: $deliveryFee, tax: $tax, discount: $discount, total: $total, deliveryAddress: $deliveryAddress, paymentMethod: $paymentMethod, specialInstructions: $specialInstructions, driverId: $driverId, driverName: $driverName, driverPhone: $driverPhone, estimatedDeliveryTime: $estimatedDeliveryTime, actualDeliveryTime: $actualDeliveryTime, statusUpdates: $statusUpdates, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.driverPhone, driverPhone) ||
                other.driverPhone == driverPhone) &&
            (identical(other.estimatedDeliveryTime, estimatedDeliveryTime) ||
                other.estimatedDeliveryTime == estimatedDeliveryTime) &&
            (identical(other.actualDeliveryTime, actualDeliveryTime) ||
                other.actualDeliveryTime == actualDeliveryTime) &&
            const DeepCollectionEquality()
                .equals(other._statusUpdates, _statusUpdates) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        restaurantId,
        restaurantName,
        const DeepCollectionEquality().hash(_items),
        status,
        subtotal,
        deliveryFee,
        tax,
        discount,
        total,
        deliveryAddress,
        paymentMethod,
        specialInstructions,
        driverId,
        driverName,
        driverPhone,
        estimatedDeliveryTime,
        actualDeliveryTime,
        const DeepCollectionEquality().hash(_statusUpdates),
        createdAt,
        updatedAt
      ]);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order extends Order {
  const factory _Order(
      {required final String id,
      required final String userId,
      required final String restaurantId,
      required final String restaurantName,
      required final List<CartItem> items,
      required final OrderStatus status,
      required final double subtotal,
      required final double deliveryFee,
      required final double tax,
      required final double discount,
      required final double total,
      required final UserAddress deliveryAddress,
      required final PaymentMethod paymentMethod,
      final String? specialInstructions,
      final String? driverId,
      final String? driverName,
      final String? driverPhone,
      final DateTime? estimatedDeliveryTime,
      final DateTime? actualDeliveryTime,
      final List<OrderStatusUpdate> statusUpdates,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$OrderImpl;
  const _Order._() : super._();

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get restaurantId;
  @override
  String get restaurantName;
  @override
  List<CartItem> get items;
  @override
  OrderStatus get status;
  @override
  double get subtotal;
  @override
  double get deliveryFee;
  @override
  double get tax;
  @override
  double get discount;
  @override
  double get total;
  @override
  UserAddress get deliveryAddress;
  @override
  PaymentMethod get paymentMethod;
  @override
  String? get specialInstructions;
  @override
  String? get driverId;
  @override
  String? get driverName;
  @override
  String? get driverPhone;
  @override
  DateTime? get estimatedDeliveryTime;
  @override
  DateTime? get actualDeliveryTime;
  @override
  List<OrderStatusUpdate> get statusUpdates;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderStatusUpdate _$OrderStatusUpdateFromJson(Map<String, dynamic> json) {
  return _OrderStatusUpdate.fromJson(json);
}

/// @nodoc
mixin _$OrderStatusUpdate {
  String get id => throw _privateConstructorUsedError;
  OrderStatus get status => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get updatedBy => throw _privateConstructorUsedError;

  /// Serializes this OrderStatusUpdate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderStatusUpdateCopyWith<OrderStatusUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusUpdateCopyWith<$Res> {
  factory $OrderStatusUpdateCopyWith(
          OrderStatusUpdate value, $Res Function(OrderStatusUpdate) then) =
      _$OrderStatusUpdateCopyWithImpl<$Res, OrderStatusUpdate>;
  @useResult
  $Res call(
      {String id,
      OrderStatus status,
      DateTime timestamp,
      String? message,
      String? updatedBy});
}

/// @nodoc
class _$OrderStatusUpdateCopyWithImpl<$Res, $Val extends OrderStatusUpdate>
    implements $OrderStatusUpdateCopyWith<$Res> {
  _$OrderStatusUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? timestamp = null,
    Object? message = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderStatusUpdateImplCopyWith<$Res>
    implements $OrderStatusUpdateCopyWith<$Res> {
  factory _$$OrderStatusUpdateImplCopyWith(_$OrderStatusUpdateImpl value,
          $Res Function(_$OrderStatusUpdateImpl) then) =
      __$$OrderStatusUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      OrderStatus status,
      DateTime timestamp,
      String? message,
      String? updatedBy});
}

/// @nodoc
class __$$OrderStatusUpdateImplCopyWithImpl<$Res>
    extends _$OrderStatusUpdateCopyWithImpl<$Res, _$OrderStatusUpdateImpl>
    implements _$$OrderStatusUpdateImplCopyWith<$Res> {
  __$$OrderStatusUpdateImplCopyWithImpl(_$OrderStatusUpdateImpl _value,
      $Res Function(_$OrderStatusUpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? timestamp = null,
    Object? message = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_$OrderStatusUpdateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderStatusUpdateImpl implements _OrderStatusUpdate {
  const _$OrderStatusUpdateImpl(
      {required this.id,
      required this.status,
      required this.timestamp,
      this.message,
      this.updatedBy});

  factory _$OrderStatusUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderStatusUpdateImplFromJson(json);

  @override
  final String id;
  @override
  final OrderStatus status;
  @override
  final DateTime timestamp;
  @override
  final String? message;
  @override
  final String? updatedBy;

  @override
  String toString() {
    return 'OrderStatusUpdate(id: $id, status: $status, timestamp: $timestamp, message: $message, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStatusUpdateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, status, timestamp, message, updatedBy);

  /// Create a copy of OrderStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStatusUpdateImplCopyWith<_$OrderStatusUpdateImpl> get copyWith =>
      __$$OrderStatusUpdateImplCopyWithImpl<_$OrderStatusUpdateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderStatusUpdateImplToJson(
      this,
    );
  }
}

abstract class _OrderStatusUpdate implements OrderStatusUpdate {
  const factory _OrderStatusUpdate(
      {required final String id,
      required final OrderStatus status,
      required final DateTime timestamp,
      final String? message,
      final String? updatedBy}) = _$OrderStatusUpdateImpl;

  factory _OrderStatusUpdate.fromJson(Map<String, dynamic> json) =
      _$OrderStatusUpdateImpl.fromJson;

  @override
  String get id;
  @override
  OrderStatus get status;
  @override
  DateTime get timestamp;
  @override
  String? get message;
  @override
  String? get updatedBy;

  /// Create a copy of OrderStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderStatusUpdateImplCopyWith<_$OrderStatusUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
