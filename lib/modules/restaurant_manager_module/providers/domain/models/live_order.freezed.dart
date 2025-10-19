// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return _OrderItem.fromJson(json);
}

/// @nodoc
mixin _$OrderItem {
  String get itemId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  List<String>? get customizations => throw _privateConstructorUsedError;
  String? get specialNotes => throw _privateConstructorUsedError;

  /// Serializes this OrderItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res, OrderItem>;
  @useResult
  $Res call(
      {String itemId,
      String name,
      double price,
      int quantity,
      String? imageUrl,
      List<String>? customizations,
      String? specialNotes});
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res, $Val extends OrderItem>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? name = null,
    Object? price = null,
    Object? quantity = null,
    Object? imageUrl = freezed,
    Object? customizations = freezed,
    Object? specialNotes = freezed,
  }) {
    return _then(_value.copyWith(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      customizations: freezed == customizations
          ? _value.customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      specialNotes: freezed == specialNotes
          ? _value.specialNotes
          : specialNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemImplCopyWith<$Res>
    implements $OrderItemCopyWith<$Res> {
  factory _$$OrderItemImplCopyWith(
          _$OrderItemImpl value, $Res Function(_$OrderItemImpl) then) =
      __$$OrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String itemId,
      String name,
      double price,
      int quantity,
      String? imageUrl,
      List<String>? customizations,
      String? specialNotes});
}

/// @nodoc
class __$$OrderItemImplCopyWithImpl<$Res>
    extends _$OrderItemCopyWithImpl<$Res, _$OrderItemImpl>
    implements _$$OrderItemImplCopyWith<$Res> {
  __$$OrderItemImplCopyWithImpl(
      _$OrderItemImpl _value, $Res Function(_$OrderItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? name = null,
    Object? price = null,
    Object? quantity = null,
    Object? imageUrl = freezed,
    Object? customizations = freezed,
    Object? specialNotes = freezed,
  }) {
    return _then(_$OrderItemImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      customizations: freezed == customizations
          ? _value._customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      specialNotes: freezed == specialNotes
          ? _value.specialNotes
          : specialNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemImpl extends _OrderItem {
  const _$OrderItemImpl(
      {required this.itemId,
      required this.name,
      required this.price,
      required this.quantity,
      this.imageUrl,
      final List<String>? customizations,
      this.specialNotes})
      : _customizations = customizations,
        super._();

  factory _$OrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemImplFromJson(json);

  @override
  final String itemId;
  @override
  final String name;
  @override
  final double price;
  @override
  final int quantity;
  @override
  final String? imageUrl;
  final List<String>? _customizations;
  @override
  List<String>? get customizations {
    final value = _customizations;
    if (value == null) return null;
    if (_customizations is EqualUnmodifiableListView) return _customizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? specialNotes;

  @override
  String toString() {
    return 'OrderItem(itemId: $itemId, name: $name, price: $price, quantity: $quantity, imageUrl: $imageUrl, customizations: $customizations, specialNotes: $specialNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality()
                .equals(other._customizations, _customizations) &&
            (identical(other.specialNotes, specialNotes) ||
                other.specialNotes == specialNotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      itemId,
      name,
      price,
      quantity,
      imageUrl,
      const DeepCollectionEquality().hash(_customizations),
      specialNotes);

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      __$$OrderItemImplCopyWithImpl<_$OrderItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemImplToJson(
      this,
    );
  }
}

abstract class _OrderItem extends OrderItem {
  const factory _OrderItem(
      {required final String itemId,
      required final String name,
      required final double price,
      required final int quantity,
      final String? imageUrl,
      final List<String>? customizations,
      final String? specialNotes}) = _$OrderItemImpl;
  const _OrderItem._() : super._();

  factory _OrderItem.fromJson(Map<String, dynamic> json) =
      _$OrderItemImpl.fromJson;

  @override
  String get itemId;
  @override
  String get name;
  @override
  double get price;
  @override
  int get quantity;
  @override
  String? get imageUrl;
  @override
  List<String>? get customizations;
  @override
  String? get specialNotes;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LiveOrder _$LiveOrderFromJson(Map<String, dynamic> json) {
  return _LiveOrder.fromJson(json);
}

/// @nodoc
mixin _$LiveOrder {
  String get orderId => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  String get customerPhone => throw _privateConstructorUsedError;
  DateTime get orderTime => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  OrderStatus get status => throw _privateConstructorUsedError;
  int get estimatedPrepTime => throw _privateConstructorUsedError;
  PaymentStatus get paymentStatus => throw _privateConstructorUsedError;
  DeliveryType get deliveryType => throw _privateConstructorUsedError;
  String? get driverId => throw _privateConstructorUsedError;
  String? get driverName => throw _privateConstructorUsedError;
  String? get driverPhone => throw _privateConstructorUsedError;
  String? get specialInstructions => throw _privateConstructorUsedError;
  List<OrderItem> get items => throw _privateConstructorUsedError;
  DateTime? get acceptedAt => throw _privateConstructorUsedError;
  DateTime? get preparedAt => throw _privateConstructorUsedError;
  DateTime? get deliveredAt => throw _privateConstructorUsedError;

  /// Serializes this LiveOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveOrderCopyWith<LiveOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveOrderCopyWith<$Res> {
  factory $LiveOrderCopyWith(LiveOrder value, $Res Function(LiveOrder) then) =
      _$LiveOrderCopyWithImpl<$Res, LiveOrder>;
  @useResult
  $Res call(
      {String orderId,
      String customerName,
      String customerPhone,
      DateTime orderTime,
      double totalAmount,
      OrderStatus status,
      int estimatedPrepTime,
      PaymentStatus paymentStatus,
      DeliveryType deliveryType,
      String? driverId,
      String? driverName,
      String? driverPhone,
      String? specialInstructions,
      List<OrderItem> items,
      DateTime? acceptedAt,
      DateTime? preparedAt,
      DateTime? deliveredAt});
}

/// @nodoc
class _$LiveOrderCopyWithImpl<$Res, $Val extends LiveOrder>
    implements $LiveOrderCopyWith<$Res> {
  _$LiveOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? customerName = null,
    Object? customerPhone = null,
    Object? orderTime = null,
    Object? totalAmount = null,
    Object? status = null,
    Object? estimatedPrepTime = null,
    Object? paymentStatus = null,
    Object? deliveryType = null,
    Object? driverId = freezed,
    Object? driverName = freezed,
    Object? driverPhone = freezed,
    Object? specialInstructions = freezed,
    Object? items = null,
    Object? acceptedAt = freezed,
    Object? preparedAt = freezed,
    Object? deliveredAt = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      orderTime: null == orderTime
          ? _value.orderTime
          : orderTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      estimatedPrepTime: null == estimatedPrepTime
          ? _value.estimatedPrepTime
          : estimatedPrepTime // ignore: cast_nullable_to_non_nullable
              as int,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      deliveryType: null == deliveryType
          ? _value.deliveryType
          : deliveryType // ignore: cast_nullable_to_non_nullable
              as DeliveryType,
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
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      acceptedAt: freezed == acceptedAt
          ? _value.acceptedAt
          : acceptedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      preparedAt: freezed == preparedAt
          ? _value.preparedAt
          : preparedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveOrderImplCopyWith<$Res>
    implements $LiveOrderCopyWith<$Res> {
  factory _$$LiveOrderImplCopyWith(
          _$LiveOrderImpl value, $Res Function(_$LiveOrderImpl) then) =
      __$$LiveOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderId,
      String customerName,
      String customerPhone,
      DateTime orderTime,
      double totalAmount,
      OrderStatus status,
      int estimatedPrepTime,
      PaymentStatus paymentStatus,
      DeliveryType deliveryType,
      String? driverId,
      String? driverName,
      String? driverPhone,
      String? specialInstructions,
      List<OrderItem> items,
      DateTime? acceptedAt,
      DateTime? preparedAt,
      DateTime? deliveredAt});
}

/// @nodoc
class __$$LiveOrderImplCopyWithImpl<$Res>
    extends _$LiveOrderCopyWithImpl<$Res, _$LiveOrderImpl>
    implements _$$LiveOrderImplCopyWith<$Res> {
  __$$LiveOrderImplCopyWithImpl(
      _$LiveOrderImpl _value, $Res Function(_$LiveOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiveOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? customerName = null,
    Object? customerPhone = null,
    Object? orderTime = null,
    Object? totalAmount = null,
    Object? status = null,
    Object? estimatedPrepTime = null,
    Object? paymentStatus = null,
    Object? deliveryType = null,
    Object? driverId = freezed,
    Object? driverName = freezed,
    Object? driverPhone = freezed,
    Object? specialInstructions = freezed,
    Object? items = null,
    Object? acceptedAt = freezed,
    Object? preparedAt = freezed,
    Object? deliveredAt = freezed,
  }) {
    return _then(_$LiveOrderImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      orderTime: null == orderTime
          ? _value.orderTime
          : orderTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      estimatedPrepTime: null == estimatedPrepTime
          ? _value.estimatedPrepTime
          : estimatedPrepTime // ignore: cast_nullable_to_non_nullable
              as int,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      deliveryType: null == deliveryType
          ? _value.deliveryType
          : deliveryType // ignore: cast_nullable_to_non_nullable
              as DeliveryType,
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
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      acceptedAt: freezed == acceptedAt
          ? _value.acceptedAt
          : acceptedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      preparedAt: freezed == preparedAt
          ? _value.preparedAt
          : preparedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveOrderImpl implements _LiveOrder {
  const _$LiveOrderImpl(
      {required this.orderId,
      required this.customerName,
      required this.customerPhone,
      required this.orderTime,
      required this.totalAmount,
      required this.status,
      required this.estimatedPrepTime,
      required this.paymentStatus,
      required this.deliveryType,
      this.driverId,
      this.driverName,
      this.driverPhone,
      this.specialInstructions,
      required final List<OrderItem> items,
      this.acceptedAt,
      this.preparedAt,
      this.deliveredAt})
      : _items = items;

  factory _$LiveOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveOrderImplFromJson(json);

  @override
  final String orderId;
  @override
  final String customerName;
  @override
  final String customerPhone;
  @override
  final DateTime orderTime;
  @override
  final double totalAmount;
  @override
  final OrderStatus status;
  @override
  final int estimatedPrepTime;
  @override
  final PaymentStatus paymentStatus;
  @override
  final DeliveryType deliveryType;
  @override
  final String? driverId;
  @override
  final String? driverName;
  @override
  final String? driverPhone;
  @override
  final String? specialInstructions;
  final List<OrderItem> _items;
  @override
  List<OrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final DateTime? acceptedAt;
  @override
  final DateTime? preparedAt;
  @override
  final DateTime? deliveredAt;

  @override
  String toString() {
    return 'LiveOrder(orderId: $orderId, customerName: $customerName, customerPhone: $customerPhone, orderTime: $orderTime, totalAmount: $totalAmount, status: $status, estimatedPrepTime: $estimatedPrepTime, paymentStatus: $paymentStatus, deliveryType: $deliveryType, driverId: $driverId, driverName: $driverName, driverPhone: $driverPhone, specialInstructions: $specialInstructions, items: $items, acceptedAt: $acceptedAt, preparedAt: $preparedAt, deliveredAt: $deliveredAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveOrderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.orderTime, orderTime) ||
                other.orderTime == orderTime) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.estimatedPrepTime, estimatedPrepTime) ||
                other.estimatedPrepTime == estimatedPrepTime) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.deliveryType, deliveryType) ||
                other.deliveryType == deliveryType) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.driverPhone, driverPhone) ||
                other.driverPhone == driverPhone) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.acceptedAt, acceptedAt) ||
                other.acceptedAt == acceptedAt) &&
            (identical(other.preparedAt, preparedAt) ||
                other.preparedAt == preparedAt) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderId,
      customerName,
      customerPhone,
      orderTime,
      totalAmount,
      status,
      estimatedPrepTime,
      paymentStatus,
      deliveryType,
      driverId,
      driverName,
      driverPhone,
      specialInstructions,
      const DeepCollectionEquality().hash(_items),
      acceptedAt,
      preparedAt,
      deliveredAt);

  /// Create a copy of LiveOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveOrderImplCopyWith<_$LiveOrderImpl> get copyWith =>
      __$$LiveOrderImplCopyWithImpl<_$LiveOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveOrderImplToJson(
      this,
    );
  }
}

abstract class _LiveOrder implements LiveOrder {
  const factory _LiveOrder(
      {required final String orderId,
      required final String customerName,
      required final String customerPhone,
      required final DateTime orderTime,
      required final double totalAmount,
      required final OrderStatus status,
      required final int estimatedPrepTime,
      required final PaymentStatus paymentStatus,
      required final DeliveryType deliveryType,
      final String? driverId,
      final String? driverName,
      final String? driverPhone,
      final String? specialInstructions,
      required final List<OrderItem> items,
      final DateTime? acceptedAt,
      final DateTime? preparedAt,
      final DateTime? deliveredAt}) = _$LiveOrderImpl;

  factory _LiveOrder.fromJson(Map<String, dynamic> json) =
      _$LiveOrderImpl.fromJson;

  @override
  String get orderId;
  @override
  String get customerName;
  @override
  String get customerPhone;
  @override
  DateTime get orderTime;
  @override
  double get totalAmount;
  @override
  OrderStatus get status;
  @override
  int get estimatedPrepTime;
  @override
  PaymentStatus get paymentStatus;
  @override
  DeliveryType get deliveryType;
  @override
  String? get driverId;
  @override
  String? get driverName;
  @override
  String? get driverPhone;
  @override
  String? get specialInstructions;
  @override
  List<OrderItem> get items;
  @override
  DateTime? get acceptedAt;
  @override
  DateTime? get preparedAt;
  @override
  DateTime? get deliveredAt;

  /// Create a copy of LiveOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveOrderImplCopyWith<_$LiveOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
