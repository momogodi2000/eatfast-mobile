// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeliveryOrder _$DeliveryOrderFromJson(Map<String, dynamic> json) {
  return _DeliveryOrder.fromJson(json);
}

/// @nodoc
mixin _$DeliveryOrder {
  String get orderId => throw _privateConstructorUsedError;
  String get restaurantId => throw _privateConstructorUsedError;
  String get restaurantName => throw _privateConstructorUsedError;
  String get restaurantAddress => throw _privateConstructorUsedError;
  double get restaurantLatitude => throw _privateConstructorUsedError;
  double get restaurantLongitude => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  String get customerPhone => throw _privateConstructorUsedError;
  String get deliveryAddress => throw _privateConstructorUsedError;
  double get deliveryLatitude => throw _privateConstructorUsedError;
  double get deliveryLongitude => throw _privateConstructorUsedError;
  DateTime get orderTime => throw _privateConstructorUsedError;
  DateTime get expectedDeliveryTime => throw _privateConstructorUsedError;
  double get orderValue => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  DeliveryStatus get status => throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  bool get isPaid => throw _privateConstructorUsedError;
  String? get specialInstructions => throw _privateConstructorUsedError;
  String? get customerNotes => throw _privateConstructorUsedError;
  double? get distanceKm => throw _privateConstructorUsedError;
  int? get estimatedDuration => throw _privateConstructorUsedError;
  DateTime? get pickedUpAt => throw _privateConstructorUsedError;
  DateTime? get deliveredAt => throw _privateConstructorUsedError;
  String? get deliveryProofImageUrl => throw _privateConstructorUsedError;
  String? get customerSignatureUrl => throw _privateConstructorUsedError;
  String? get otpCode => throw _privateConstructorUsedError;
  List<OrderItem> get items => throw _privateConstructorUsedError;

  /// Serializes this DeliveryOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryOrderCopyWith<DeliveryOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryOrderCopyWith<$Res> {
  factory $DeliveryOrderCopyWith(
          DeliveryOrder value, $Res Function(DeliveryOrder) then) =
      _$DeliveryOrderCopyWithImpl<$Res, DeliveryOrder>;
  @useResult
  $Res call(
      {String orderId,
      String restaurantId,
      String restaurantName,
      String restaurantAddress,
      double restaurantLatitude,
      double restaurantLongitude,
      String customerName,
      String customerPhone,
      String deliveryAddress,
      double deliveryLatitude,
      double deliveryLongitude,
      DateTime orderTime,
      DateTime expectedDeliveryTime,
      double orderValue,
      double deliveryFee,
      DeliveryStatus status,
      PaymentMethod paymentMethod,
      bool isPaid,
      String? specialInstructions,
      String? customerNotes,
      double? distanceKm,
      int? estimatedDuration,
      DateTime? pickedUpAt,
      DateTime? deliveredAt,
      String? deliveryProofImageUrl,
      String? customerSignatureUrl,
      String? otpCode,
      List<OrderItem> items});
}

/// @nodoc
class _$DeliveryOrderCopyWithImpl<$Res, $Val extends DeliveryOrder>
    implements $DeliveryOrderCopyWith<$Res> {
  _$DeliveryOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? restaurantId = null,
    Object? restaurantName = null,
    Object? restaurantAddress = null,
    Object? restaurantLatitude = null,
    Object? restaurantLongitude = null,
    Object? customerName = null,
    Object? customerPhone = null,
    Object? deliveryAddress = null,
    Object? deliveryLatitude = null,
    Object? deliveryLongitude = null,
    Object? orderTime = null,
    Object? expectedDeliveryTime = null,
    Object? orderValue = null,
    Object? deliveryFee = null,
    Object? status = null,
    Object? paymentMethod = null,
    Object? isPaid = null,
    Object? specialInstructions = freezed,
    Object? customerNotes = freezed,
    Object? distanceKm = freezed,
    Object? estimatedDuration = freezed,
    Object? pickedUpAt = freezed,
    Object? deliveredAt = freezed,
    Object? deliveryProofImageUrl = freezed,
    Object? customerSignatureUrl = freezed,
    Object? otpCode = freezed,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantAddress: null == restaurantAddress
          ? _value.restaurantAddress
          : restaurantAddress // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantLatitude: null == restaurantLatitude
          ? _value.restaurantLatitude
          : restaurantLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      restaurantLongitude: null == restaurantLongitude
          ? _value.restaurantLongitude
          : restaurantLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryLatitude: null == deliveryLatitude
          ? _value.deliveryLatitude
          : deliveryLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryLongitude: null == deliveryLongitude
          ? _value.deliveryLongitude
          : deliveryLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      orderTime: null == orderTime
          ? _value.orderTime
          : orderTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expectedDeliveryTime: null == expectedDeliveryTime
          ? _value.expectedDeliveryTime
          : expectedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderValue: null == orderValue
          ? _value.orderValue
          : orderValue // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      customerNotes: freezed == customerNotes
          ? _value.customerNotes
          : customerNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      distanceKm: freezed == distanceKm
          ? _value.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedDuration: freezed == estimatedDuration
          ? _value.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      pickedUpAt: freezed == pickedUpAt
          ? _value.pickedUpAt
          : pickedUpAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryProofImageUrl: freezed == deliveryProofImageUrl
          ? _value.deliveryProofImageUrl
          : deliveryProofImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      customerSignatureUrl: freezed == customerSignatureUrl
          ? _value.customerSignatureUrl
          : customerSignatureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      otpCode: freezed == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryOrderImplCopyWith<$Res>
    implements $DeliveryOrderCopyWith<$Res> {
  factory _$$DeliveryOrderImplCopyWith(
          _$DeliveryOrderImpl value, $Res Function(_$DeliveryOrderImpl) then) =
      __$$DeliveryOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderId,
      String restaurantId,
      String restaurantName,
      String restaurantAddress,
      double restaurantLatitude,
      double restaurantLongitude,
      String customerName,
      String customerPhone,
      String deliveryAddress,
      double deliveryLatitude,
      double deliveryLongitude,
      DateTime orderTime,
      DateTime expectedDeliveryTime,
      double orderValue,
      double deliveryFee,
      DeliveryStatus status,
      PaymentMethod paymentMethod,
      bool isPaid,
      String? specialInstructions,
      String? customerNotes,
      double? distanceKm,
      int? estimatedDuration,
      DateTime? pickedUpAt,
      DateTime? deliveredAt,
      String? deliveryProofImageUrl,
      String? customerSignatureUrl,
      String? otpCode,
      List<OrderItem> items});
}

/// @nodoc
class __$$DeliveryOrderImplCopyWithImpl<$Res>
    extends _$DeliveryOrderCopyWithImpl<$Res, _$DeliveryOrderImpl>
    implements _$$DeliveryOrderImplCopyWith<$Res> {
  __$$DeliveryOrderImplCopyWithImpl(
      _$DeliveryOrderImpl _value, $Res Function(_$DeliveryOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? restaurantId = null,
    Object? restaurantName = null,
    Object? restaurantAddress = null,
    Object? restaurantLatitude = null,
    Object? restaurantLongitude = null,
    Object? customerName = null,
    Object? customerPhone = null,
    Object? deliveryAddress = null,
    Object? deliveryLatitude = null,
    Object? deliveryLongitude = null,
    Object? orderTime = null,
    Object? expectedDeliveryTime = null,
    Object? orderValue = null,
    Object? deliveryFee = null,
    Object? status = null,
    Object? paymentMethod = null,
    Object? isPaid = null,
    Object? specialInstructions = freezed,
    Object? customerNotes = freezed,
    Object? distanceKm = freezed,
    Object? estimatedDuration = freezed,
    Object? pickedUpAt = freezed,
    Object? deliveredAt = freezed,
    Object? deliveryProofImageUrl = freezed,
    Object? customerSignatureUrl = freezed,
    Object? otpCode = freezed,
    Object? items = null,
  }) {
    return _then(_$DeliveryOrderImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantAddress: null == restaurantAddress
          ? _value.restaurantAddress
          : restaurantAddress // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantLatitude: null == restaurantLatitude
          ? _value.restaurantLatitude
          : restaurantLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      restaurantLongitude: null == restaurantLongitude
          ? _value.restaurantLongitude
          : restaurantLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryLatitude: null == deliveryLatitude
          ? _value.deliveryLatitude
          : deliveryLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryLongitude: null == deliveryLongitude
          ? _value.deliveryLongitude
          : deliveryLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      orderTime: null == orderTime
          ? _value.orderTime
          : orderTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expectedDeliveryTime: null == expectedDeliveryTime
          ? _value.expectedDeliveryTime
          : expectedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderValue: null == orderValue
          ? _value.orderValue
          : orderValue // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      customerNotes: freezed == customerNotes
          ? _value.customerNotes
          : customerNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      distanceKm: freezed == distanceKm
          ? _value.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedDuration: freezed == estimatedDuration
          ? _value.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      pickedUpAt: freezed == pickedUpAt
          ? _value.pickedUpAt
          : pickedUpAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryProofImageUrl: freezed == deliveryProofImageUrl
          ? _value.deliveryProofImageUrl
          : deliveryProofImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      customerSignatureUrl: freezed == customerSignatureUrl
          ? _value.customerSignatureUrl
          : customerSignatureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      otpCode: freezed == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryOrderImpl implements _DeliveryOrder {
  const _$DeliveryOrderImpl(
      {required this.orderId,
      required this.restaurantId,
      required this.restaurantName,
      required this.restaurantAddress,
      required this.restaurantLatitude,
      required this.restaurantLongitude,
      required this.customerName,
      required this.customerPhone,
      required this.deliveryAddress,
      required this.deliveryLatitude,
      required this.deliveryLongitude,
      required this.orderTime,
      required this.expectedDeliveryTime,
      required this.orderValue,
      required this.deliveryFee,
      required this.status,
      required this.paymentMethod,
      required this.isPaid,
      this.specialInstructions,
      this.customerNotes,
      this.distanceKm,
      this.estimatedDuration,
      this.pickedUpAt,
      this.deliveredAt,
      this.deliveryProofImageUrl,
      this.customerSignatureUrl,
      this.otpCode,
      final List<OrderItem> items = const []})
      : _items = items;

  factory _$DeliveryOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryOrderImplFromJson(json);

  @override
  final String orderId;
  @override
  final String restaurantId;
  @override
  final String restaurantName;
  @override
  final String restaurantAddress;
  @override
  final double restaurantLatitude;
  @override
  final double restaurantLongitude;
  @override
  final String customerName;
  @override
  final String customerPhone;
  @override
  final String deliveryAddress;
  @override
  final double deliveryLatitude;
  @override
  final double deliveryLongitude;
  @override
  final DateTime orderTime;
  @override
  final DateTime expectedDeliveryTime;
  @override
  final double orderValue;
  @override
  final double deliveryFee;
  @override
  final DeliveryStatus status;
  @override
  final PaymentMethod paymentMethod;
  @override
  final bool isPaid;
  @override
  final String? specialInstructions;
  @override
  final String? customerNotes;
  @override
  final double? distanceKm;
  @override
  final int? estimatedDuration;
  @override
  final DateTime? pickedUpAt;
  @override
  final DateTime? deliveredAt;
  @override
  final String? deliveryProofImageUrl;
  @override
  final String? customerSignatureUrl;
  @override
  final String? otpCode;
  final List<OrderItem> _items;
  @override
  @JsonKey()
  List<OrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'DeliveryOrder(orderId: $orderId, restaurantId: $restaurantId, restaurantName: $restaurantName, restaurantAddress: $restaurantAddress, restaurantLatitude: $restaurantLatitude, restaurantLongitude: $restaurantLongitude, customerName: $customerName, customerPhone: $customerPhone, deliveryAddress: $deliveryAddress, deliveryLatitude: $deliveryLatitude, deliveryLongitude: $deliveryLongitude, orderTime: $orderTime, expectedDeliveryTime: $expectedDeliveryTime, orderValue: $orderValue, deliveryFee: $deliveryFee, status: $status, paymentMethod: $paymentMethod, isPaid: $isPaid, specialInstructions: $specialInstructions, customerNotes: $customerNotes, distanceKm: $distanceKm, estimatedDuration: $estimatedDuration, pickedUpAt: $pickedUpAt, deliveredAt: $deliveredAt, deliveryProofImageUrl: $deliveryProofImageUrl, customerSignatureUrl: $customerSignatureUrl, otpCode: $otpCode, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryOrderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            (identical(other.restaurantAddress, restaurantAddress) ||
                other.restaurantAddress == restaurantAddress) &&
            (identical(other.restaurantLatitude, restaurantLatitude) ||
                other.restaurantLatitude == restaurantLatitude) &&
            (identical(other.restaurantLongitude, restaurantLongitude) ||
                other.restaurantLongitude == restaurantLongitude) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.deliveryLatitude, deliveryLatitude) ||
                other.deliveryLatitude == deliveryLatitude) &&
            (identical(other.deliveryLongitude, deliveryLongitude) ||
                other.deliveryLongitude == deliveryLongitude) &&
            (identical(other.orderTime, orderTime) ||
                other.orderTime == orderTime) &&
            (identical(other.expectedDeliveryTime, expectedDeliveryTime) ||
                other.expectedDeliveryTime == expectedDeliveryTime) &&
            (identical(other.orderValue, orderValue) ||
                other.orderValue == orderValue) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions) &&
            (identical(other.customerNotes, customerNotes) ||
                other.customerNotes == customerNotes) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.estimatedDuration, estimatedDuration) ||
                other.estimatedDuration == estimatedDuration) &&
            (identical(other.pickedUpAt, pickedUpAt) ||
                other.pickedUpAt == pickedUpAt) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.deliveryProofImageUrl, deliveryProofImageUrl) ||
                other.deliveryProofImageUrl == deliveryProofImageUrl) &&
            (identical(other.customerSignatureUrl, customerSignatureUrl) ||
                other.customerSignatureUrl == customerSignatureUrl) &&
            (identical(other.otpCode, otpCode) || other.otpCode == otpCode) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        orderId,
        restaurantId,
        restaurantName,
        restaurantAddress,
        restaurantLatitude,
        restaurantLongitude,
        customerName,
        customerPhone,
        deliveryAddress,
        deliveryLatitude,
        deliveryLongitude,
        orderTime,
        expectedDeliveryTime,
        orderValue,
        deliveryFee,
        status,
        paymentMethod,
        isPaid,
        specialInstructions,
        customerNotes,
        distanceKm,
        estimatedDuration,
        pickedUpAt,
        deliveredAt,
        deliveryProofImageUrl,
        customerSignatureUrl,
        otpCode,
        const DeepCollectionEquality().hash(_items)
      ]);

  /// Create a copy of DeliveryOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryOrderImplCopyWith<_$DeliveryOrderImpl> get copyWith =>
      __$$DeliveryOrderImplCopyWithImpl<_$DeliveryOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryOrderImplToJson(
      this,
    );
  }
}

abstract class _DeliveryOrder implements DeliveryOrder {
  const factory _DeliveryOrder(
      {required final String orderId,
      required final String restaurantId,
      required final String restaurantName,
      required final String restaurantAddress,
      required final double restaurantLatitude,
      required final double restaurantLongitude,
      required final String customerName,
      required final String customerPhone,
      required final String deliveryAddress,
      required final double deliveryLatitude,
      required final double deliveryLongitude,
      required final DateTime orderTime,
      required final DateTime expectedDeliveryTime,
      required final double orderValue,
      required final double deliveryFee,
      required final DeliveryStatus status,
      required final PaymentMethod paymentMethod,
      required final bool isPaid,
      final String? specialInstructions,
      final String? customerNotes,
      final double? distanceKm,
      final int? estimatedDuration,
      final DateTime? pickedUpAt,
      final DateTime? deliveredAt,
      final String? deliveryProofImageUrl,
      final String? customerSignatureUrl,
      final String? otpCode,
      final List<OrderItem> items}) = _$DeliveryOrderImpl;

  factory _DeliveryOrder.fromJson(Map<String, dynamic> json) =
      _$DeliveryOrderImpl.fromJson;

  @override
  String get orderId;
  @override
  String get restaurantId;
  @override
  String get restaurantName;
  @override
  String get restaurantAddress;
  @override
  double get restaurantLatitude;
  @override
  double get restaurantLongitude;
  @override
  String get customerName;
  @override
  String get customerPhone;
  @override
  String get deliveryAddress;
  @override
  double get deliveryLatitude;
  @override
  double get deliveryLongitude;
  @override
  DateTime get orderTime;
  @override
  DateTime get expectedDeliveryTime;
  @override
  double get orderValue;
  @override
  double get deliveryFee;
  @override
  DeliveryStatus get status;
  @override
  PaymentMethod get paymentMethod;
  @override
  bool get isPaid;
  @override
  String? get specialInstructions;
  @override
  String? get customerNotes;
  @override
  double? get distanceKm;
  @override
  int? get estimatedDuration;
  @override
  DateTime? get pickedUpAt;
  @override
  DateTime? get deliveredAt;
  @override
  String? get deliveryProofImageUrl;
  @override
  String? get customerSignatureUrl;
  @override
  String? get otpCode;
  @override
  List<OrderItem> get items;

  /// Create a copy of DeliveryOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryOrderImplCopyWith<_$DeliveryOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return _OrderItem.fromJson(json);
}

/// @nodoc
mixin _$OrderItem {
  String get itemName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  List<String> get customizations => throw _privateConstructorUsedError;

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
      {String itemName,
      int quantity,
      double price,
      List<String> customizations});
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
    Object? itemName = null,
    Object? quantity = null,
    Object? price = null,
    Object? customizations = null,
  }) {
    return _then(_value.copyWith(
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      customizations: null == customizations
          ? _value.customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      {String itemName,
      int quantity,
      double price,
      List<String> customizations});
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
    Object? itemName = null,
    Object? quantity = null,
    Object? price = null,
    Object? customizations = null,
  }) {
    return _then(_$OrderItemImpl(
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      customizations: null == customizations
          ? _value._customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemImpl implements _OrderItem {
  const _$OrderItemImpl(
      {required this.itemName,
      required this.quantity,
      required this.price,
      final List<String> customizations = const []})
      : _customizations = customizations;

  factory _$OrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemImplFromJson(json);

  @override
  final String itemName;
  @override
  final int quantity;
  @override
  final double price;
  final List<String> _customizations;
  @override
  @JsonKey()
  List<String> get customizations {
    if (_customizations is EqualUnmodifiableListView) return _customizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customizations);
  }

  @override
  String toString() {
    return 'OrderItem(itemName: $itemName, quantity: $quantity, price: $price, customizations: $customizations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemImpl &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality()
                .equals(other._customizations, _customizations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemName, quantity, price,
      const DeepCollectionEquality().hash(_customizations));

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

abstract class _OrderItem implements OrderItem {
  const factory _OrderItem(
      {required final String itemName,
      required final int quantity,
      required final double price,
      final List<String> customizations}) = _$OrderItemImpl;

  factory _OrderItem.fromJson(Map<String, dynamic> json) =
      _$OrderItemImpl.fromJson;

  @override
  String get itemName;
  @override
  int get quantity;
  @override
  double get price;
  @override
  List<String> get customizations;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
