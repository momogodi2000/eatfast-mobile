// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupOrder _$GroupOrderFromJson(Map<String, dynamic> json) {
  return _GroupOrder.fromJson(json);
}

/// @nodoc
mixin _$GroupOrder {
  String get groupOrderId => throw _privateConstructorUsedError;
  String get organizerId => throw _privateConstructorUsedError;
  String get organizerName => throw _privateConstructorUsedError;
  String get restaurantId => throw _privateConstructorUsedError;
  String get restaurantName => throw _privateConstructorUsedError;
  GroupOrderStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get orderDeadline => throw _privateConstructorUsedError;
  List<GroupOrderParticipant> get participants =>
      throw _privateConstructorUsedError;
  List<GroupOrderItem> get items => throw _privateConstructorUsedError;
  GroupOrderPayment get paymentInfo => throw _privateConstructorUsedError;
  String? get groupName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get inviteCode => throw _privateConstructorUsedError;
  String? get deliveryAddress => throw _privateConstructorUsedError;
  double? get deliveryFee => throw _privateConstructorUsedError;
  double? get serviceFee => throw _privateConstructorUsedError;
  double? get totalAmount => throw _privateConstructorUsedError;
  DateTime? get estimatedDeliveryTime => throw _privateConstructorUsedError;
  String? get specialInstructions => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  bool get isPrivate => throw _privateConstructorUsedError;
  int get maxParticipants => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this GroupOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupOrderCopyWith<GroupOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupOrderCopyWith<$Res> {
  factory $GroupOrderCopyWith(
          GroupOrder value, $Res Function(GroupOrder) then) =
      _$GroupOrderCopyWithImpl<$Res, GroupOrder>;
  @useResult
  $Res call(
      {String groupOrderId,
      String organizerId,
      String organizerName,
      String restaurantId,
      String restaurantName,
      GroupOrderStatus status,
      DateTime createdAt,
      DateTime orderDeadline,
      List<GroupOrderParticipant> participants,
      List<GroupOrderItem> items,
      GroupOrderPayment paymentInfo,
      String? groupName,
      String? description,
      String? inviteCode,
      String? deliveryAddress,
      double? deliveryFee,
      double? serviceFee,
      double? totalAmount,
      DateTime? estimatedDeliveryTime,
      String? specialInstructions,
      List<String> tags,
      bool isPrivate,
      int maxParticipants,
      Map<String, dynamic>? metadata});

  $GroupOrderPaymentCopyWith<$Res> get paymentInfo;
}

/// @nodoc
class _$GroupOrderCopyWithImpl<$Res, $Val extends GroupOrder>
    implements $GroupOrderCopyWith<$Res> {
  _$GroupOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupOrderId = null,
    Object? organizerId = null,
    Object? organizerName = null,
    Object? restaurantId = null,
    Object? restaurantName = null,
    Object? status = null,
    Object? createdAt = null,
    Object? orderDeadline = null,
    Object? participants = null,
    Object? items = null,
    Object? paymentInfo = null,
    Object? groupName = freezed,
    Object? description = freezed,
    Object? inviteCode = freezed,
    Object? deliveryAddress = freezed,
    Object? deliveryFee = freezed,
    Object? serviceFee = freezed,
    Object? totalAmount = freezed,
    Object? estimatedDeliveryTime = freezed,
    Object? specialInstructions = freezed,
    Object? tags = null,
    Object? isPrivate = null,
    Object? maxParticipants = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      groupOrderId: null == groupOrderId
          ? _value.groupOrderId
          : groupOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      organizerName: null == organizerName
          ? _value.organizerName
          : organizerName // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GroupOrderStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderDeadline: null == orderDeadline
          ? _value.orderDeadline
          : orderDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<GroupOrderParticipant>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GroupOrderItem>,
      paymentInfo: null == paymentInfo
          ? _value.paymentInfo
          : paymentInfo // ignore: cast_nullable_to_non_nullable
              as GroupOrderPayment,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      inviteCode: freezed == inviteCode
          ? _value.inviteCode
          : inviteCode // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddress: freezed == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryFee: freezed == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double?,
      serviceFee: freezed == serviceFee
          ? _value.serviceFee
          : serviceFee // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedDeliveryTime: freezed == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      maxParticipants: null == maxParticipants
          ? _value.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  /// Create a copy of GroupOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupOrderPaymentCopyWith<$Res> get paymentInfo {
    return $GroupOrderPaymentCopyWith<$Res>(_value.paymentInfo, (value) {
      return _then(_value.copyWith(paymentInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GroupOrderImplCopyWith<$Res>
    implements $GroupOrderCopyWith<$Res> {
  factory _$$GroupOrderImplCopyWith(
          _$GroupOrderImpl value, $Res Function(_$GroupOrderImpl) then) =
      __$$GroupOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String groupOrderId,
      String organizerId,
      String organizerName,
      String restaurantId,
      String restaurantName,
      GroupOrderStatus status,
      DateTime createdAt,
      DateTime orderDeadline,
      List<GroupOrderParticipant> participants,
      List<GroupOrderItem> items,
      GroupOrderPayment paymentInfo,
      String? groupName,
      String? description,
      String? inviteCode,
      String? deliveryAddress,
      double? deliveryFee,
      double? serviceFee,
      double? totalAmount,
      DateTime? estimatedDeliveryTime,
      String? specialInstructions,
      List<String> tags,
      bool isPrivate,
      int maxParticipants,
      Map<String, dynamic>? metadata});

  @override
  $GroupOrderPaymentCopyWith<$Res> get paymentInfo;
}

/// @nodoc
class __$$GroupOrderImplCopyWithImpl<$Res>
    extends _$GroupOrderCopyWithImpl<$Res, _$GroupOrderImpl>
    implements _$$GroupOrderImplCopyWith<$Res> {
  __$$GroupOrderImplCopyWithImpl(
      _$GroupOrderImpl _value, $Res Function(_$GroupOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupOrderId = null,
    Object? organizerId = null,
    Object? organizerName = null,
    Object? restaurantId = null,
    Object? restaurantName = null,
    Object? status = null,
    Object? createdAt = null,
    Object? orderDeadline = null,
    Object? participants = null,
    Object? items = null,
    Object? paymentInfo = null,
    Object? groupName = freezed,
    Object? description = freezed,
    Object? inviteCode = freezed,
    Object? deliveryAddress = freezed,
    Object? deliveryFee = freezed,
    Object? serviceFee = freezed,
    Object? totalAmount = freezed,
    Object? estimatedDeliveryTime = freezed,
    Object? specialInstructions = freezed,
    Object? tags = null,
    Object? isPrivate = null,
    Object? maxParticipants = null,
    Object? metadata = freezed,
  }) {
    return _then(_$GroupOrderImpl(
      groupOrderId: null == groupOrderId
          ? _value.groupOrderId
          : groupOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      organizerName: null == organizerName
          ? _value.organizerName
          : organizerName // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GroupOrderStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderDeadline: null == orderDeadline
          ? _value.orderDeadline
          : orderDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<GroupOrderParticipant>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GroupOrderItem>,
      paymentInfo: null == paymentInfo
          ? _value.paymentInfo
          : paymentInfo // ignore: cast_nullable_to_non_nullable
              as GroupOrderPayment,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      inviteCode: freezed == inviteCode
          ? _value.inviteCode
          : inviteCode // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddress: freezed == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryFee: freezed == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double?,
      serviceFee: freezed == serviceFee
          ? _value.serviceFee
          : serviceFee // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedDeliveryTime: freezed == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      maxParticipants: null == maxParticipants
          ? _value.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
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
class _$GroupOrderImpl implements _GroupOrder {
  const _$GroupOrderImpl(
      {required this.groupOrderId,
      required this.organizerId,
      required this.organizerName,
      required this.restaurantId,
      required this.restaurantName,
      required this.status,
      required this.createdAt,
      required this.orderDeadline,
      required final List<GroupOrderParticipant> participants,
      required final List<GroupOrderItem> items,
      required this.paymentInfo,
      this.groupName,
      this.description,
      this.inviteCode,
      this.deliveryAddress,
      this.deliveryFee,
      this.serviceFee,
      this.totalAmount,
      this.estimatedDeliveryTime,
      this.specialInstructions,
      final List<String> tags = const [],
      this.isPrivate = false,
      this.maxParticipants = 10,
      final Map<String, dynamic>? metadata})
      : _participants = participants,
        _items = items,
        _tags = tags,
        _metadata = metadata;

  factory _$GroupOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupOrderImplFromJson(json);

  @override
  final String groupOrderId;
  @override
  final String organizerId;
  @override
  final String organizerName;
  @override
  final String restaurantId;
  @override
  final String restaurantName;
  @override
  final GroupOrderStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime orderDeadline;
  final List<GroupOrderParticipant> _participants;
  @override
  List<GroupOrderParticipant> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  final List<GroupOrderItem> _items;
  @override
  List<GroupOrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final GroupOrderPayment paymentInfo;
  @override
  final String? groupName;
  @override
  final String? description;
  @override
  final String? inviteCode;
  @override
  final String? deliveryAddress;
  @override
  final double? deliveryFee;
  @override
  final double? serviceFee;
  @override
  final double? totalAmount;
  @override
  final DateTime? estimatedDeliveryTime;
  @override
  final String? specialInstructions;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final bool isPrivate;
  @override
  @JsonKey()
  final int maxParticipants;
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
    return 'GroupOrder(groupOrderId: $groupOrderId, organizerId: $organizerId, organizerName: $organizerName, restaurantId: $restaurantId, restaurantName: $restaurantName, status: $status, createdAt: $createdAt, orderDeadline: $orderDeadline, participants: $participants, items: $items, paymentInfo: $paymentInfo, groupName: $groupName, description: $description, inviteCode: $inviteCode, deliveryAddress: $deliveryAddress, deliveryFee: $deliveryFee, serviceFee: $serviceFee, totalAmount: $totalAmount, estimatedDeliveryTime: $estimatedDeliveryTime, specialInstructions: $specialInstructions, tags: $tags, isPrivate: $isPrivate, maxParticipants: $maxParticipants, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupOrderImpl &&
            (identical(other.groupOrderId, groupOrderId) ||
                other.groupOrderId == groupOrderId) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.organizerName, organizerName) ||
                other.organizerName == organizerName) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.orderDeadline, orderDeadline) ||
                other.orderDeadline == orderDeadline) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.paymentInfo, paymentInfo) ||
                other.paymentInfo == paymentInfo) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.inviteCode, inviteCode) ||
                other.inviteCode == inviteCode) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.serviceFee, serviceFee) ||
                other.serviceFee == serviceFee) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.estimatedDeliveryTime, estimatedDeliveryTime) ||
                other.estimatedDeliveryTime == estimatedDeliveryTime) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.maxParticipants, maxParticipants) ||
                other.maxParticipants == maxParticipants) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        groupOrderId,
        organizerId,
        organizerName,
        restaurantId,
        restaurantName,
        status,
        createdAt,
        orderDeadline,
        const DeepCollectionEquality().hash(_participants),
        const DeepCollectionEquality().hash(_items),
        paymentInfo,
        groupName,
        description,
        inviteCode,
        deliveryAddress,
        deliveryFee,
        serviceFee,
        totalAmount,
        estimatedDeliveryTime,
        specialInstructions,
        const DeepCollectionEquality().hash(_tags),
        isPrivate,
        maxParticipants,
        const DeepCollectionEquality().hash(_metadata)
      ]);

  /// Create a copy of GroupOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupOrderImplCopyWith<_$GroupOrderImpl> get copyWith =>
      __$$GroupOrderImplCopyWithImpl<_$GroupOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupOrderImplToJson(
      this,
    );
  }
}

abstract class _GroupOrder implements GroupOrder {
  const factory _GroupOrder(
      {required final String groupOrderId,
      required final String organizerId,
      required final String organizerName,
      required final String restaurantId,
      required final String restaurantName,
      required final GroupOrderStatus status,
      required final DateTime createdAt,
      required final DateTime orderDeadline,
      required final List<GroupOrderParticipant> participants,
      required final List<GroupOrderItem> items,
      required final GroupOrderPayment paymentInfo,
      final String? groupName,
      final String? description,
      final String? inviteCode,
      final String? deliveryAddress,
      final double? deliveryFee,
      final double? serviceFee,
      final double? totalAmount,
      final DateTime? estimatedDeliveryTime,
      final String? specialInstructions,
      final List<String> tags,
      final bool isPrivate,
      final int maxParticipants,
      final Map<String, dynamic>? metadata}) = _$GroupOrderImpl;

  factory _GroupOrder.fromJson(Map<String, dynamic> json) =
      _$GroupOrderImpl.fromJson;

  @override
  String get groupOrderId;
  @override
  String get organizerId;
  @override
  String get organizerName;
  @override
  String get restaurantId;
  @override
  String get restaurantName;
  @override
  GroupOrderStatus get status;
  @override
  DateTime get createdAt;
  @override
  DateTime get orderDeadline;
  @override
  List<GroupOrderParticipant> get participants;
  @override
  List<GroupOrderItem> get items;
  @override
  GroupOrderPayment get paymentInfo;
  @override
  String? get groupName;
  @override
  String? get description;
  @override
  String? get inviteCode;
  @override
  String? get deliveryAddress;
  @override
  double? get deliveryFee;
  @override
  double? get serviceFee;
  @override
  double? get totalAmount;
  @override
  DateTime? get estimatedDeliveryTime;
  @override
  String? get specialInstructions;
  @override
  List<String> get tags;
  @override
  bool get isPrivate;
  @override
  int get maxParticipants;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of GroupOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupOrderImplCopyWith<_$GroupOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GroupOrderParticipant _$GroupOrderParticipantFromJson(
    Map<String, dynamic> json) {
  return _GroupOrderParticipant.fromJson(json);
}

/// @nodoc
mixin _$GroupOrderParticipant {
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  DateTime get joinedAt => throw _privateConstructorUsedError;
  ParticipantRole get role => throw _privateConstructorUsedError;
  ParticipantStatus get status => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  double? get contributionAmount => throw _privateConstructorUsedError;
  List<String> get orderItemIds => throw _privateConstructorUsedError;
  bool get hasOrdered => throw _privateConstructorUsedError;
  bool get hasPaid => throw _privateConstructorUsedError;
  DateTime? get lastActivity => throw _privateConstructorUsedError;
  Map<String, dynamic>? get preferences => throw _privateConstructorUsedError;

  /// Serializes this GroupOrderParticipant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupOrderParticipant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupOrderParticipantCopyWith<GroupOrderParticipant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupOrderParticipantCopyWith<$Res> {
  factory $GroupOrderParticipantCopyWith(GroupOrderParticipant value,
          $Res Function(GroupOrderParticipant) then) =
      _$GroupOrderParticipantCopyWithImpl<$Res, GroupOrderParticipant>;
  @useResult
  $Res call(
      {String userId,
      String userName,
      String email,
      DateTime joinedAt,
      ParticipantRole role,
      ParticipantStatus status,
      String? profilePicture,
      String? phoneNumber,
      double? contributionAmount,
      List<String> orderItemIds,
      bool hasOrdered,
      bool hasPaid,
      DateTime? lastActivity,
      Map<String, dynamic>? preferences});
}

/// @nodoc
class _$GroupOrderParticipantCopyWithImpl<$Res,
        $Val extends GroupOrderParticipant>
    implements $GroupOrderParticipantCopyWith<$Res> {
  _$GroupOrderParticipantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupOrderParticipant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? email = null,
    Object? joinedAt = null,
    Object? role = null,
    Object? status = null,
    Object? profilePicture = freezed,
    Object? phoneNumber = freezed,
    Object? contributionAmount = freezed,
    Object? orderItemIds = null,
    Object? hasOrdered = null,
    Object? hasPaid = null,
    Object? lastActivity = freezed,
    Object? preferences = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as ParticipantRole,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ParticipantStatus,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      contributionAmount: freezed == contributionAmount
          ? _value.contributionAmount
          : contributionAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      orderItemIds: null == orderItemIds
          ? _value.orderItemIds
          : orderItemIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hasOrdered: null == hasOrdered
          ? _value.hasOrdered
          : hasOrdered // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPaid: null == hasPaid
          ? _value.hasPaid
          : hasPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      lastActivity: freezed == lastActivity
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      preferences: freezed == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupOrderParticipantImplCopyWith<$Res>
    implements $GroupOrderParticipantCopyWith<$Res> {
  factory _$$GroupOrderParticipantImplCopyWith(
          _$GroupOrderParticipantImpl value,
          $Res Function(_$GroupOrderParticipantImpl) then) =
      __$$GroupOrderParticipantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String userName,
      String email,
      DateTime joinedAt,
      ParticipantRole role,
      ParticipantStatus status,
      String? profilePicture,
      String? phoneNumber,
      double? contributionAmount,
      List<String> orderItemIds,
      bool hasOrdered,
      bool hasPaid,
      DateTime? lastActivity,
      Map<String, dynamic>? preferences});
}

/// @nodoc
class __$$GroupOrderParticipantImplCopyWithImpl<$Res>
    extends _$GroupOrderParticipantCopyWithImpl<$Res,
        _$GroupOrderParticipantImpl>
    implements _$$GroupOrderParticipantImplCopyWith<$Res> {
  __$$GroupOrderParticipantImplCopyWithImpl(_$GroupOrderParticipantImpl _value,
      $Res Function(_$GroupOrderParticipantImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupOrderParticipant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? email = null,
    Object? joinedAt = null,
    Object? role = null,
    Object? status = null,
    Object? profilePicture = freezed,
    Object? phoneNumber = freezed,
    Object? contributionAmount = freezed,
    Object? orderItemIds = null,
    Object? hasOrdered = null,
    Object? hasPaid = null,
    Object? lastActivity = freezed,
    Object? preferences = freezed,
  }) {
    return _then(_$GroupOrderParticipantImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as ParticipantRole,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ParticipantStatus,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      contributionAmount: freezed == contributionAmount
          ? _value.contributionAmount
          : contributionAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      orderItemIds: null == orderItemIds
          ? _value._orderItemIds
          : orderItemIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hasOrdered: null == hasOrdered
          ? _value.hasOrdered
          : hasOrdered // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPaid: null == hasPaid
          ? _value.hasPaid
          : hasPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      lastActivity: freezed == lastActivity
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      preferences: freezed == preferences
          ? _value._preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupOrderParticipantImpl implements _GroupOrderParticipant {
  const _$GroupOrderParticipantImpl(
      {required this.userId,
      required this.userName,
      required this.email,
      required this.joinedAt,
      required this.role,
      required this.status,
      this.profilePicture,
      this.phoneNumber,
      this.contributionAmount,
      final List<String> orderItemIds = const [],
      this.hasOrdered = false,
      this.hasPaid = false,
      this.lastActivity,
      final Map<String, dynamic>? preferences})
      : _orderItemIds = orderItemIds,
        _preferences = preferences;

  factory _$GroupOrderParticipantImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupOrderParticipantImplFromJson(json);

  @override
  final String userId;
  @override
  final String userName;
  @override
  final String email;
  @override
  final DateTime joinedAt;
  @override
  final ParticipantRole role;
  @override
  final ParticipantStatus status;
  @override
  final String? profilePicture;
  @override
  final String? phoneNumber;
  @override
  final double? contributionAmount;
  final List<String> _orderItemIds;
  @override
  @JsonKey()
  List<String> get orderItemIds {
    if (_orderItemIds is EqualUnmodifiableListView) return _orderItemIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderItemIds);
  }

  @override
  @JsonKey()
  final bool hasOrdered;
  @override
  @JsonKey()
  final bool hasPaid;
  @override
  final DateTime? lastActivity;
  final Map<String, dynamic>? _preferences;
  @override
  Map<String, dynamic>? get preferences {
    final value = _preferences;
    if (value == null) return null;
    if (_preferences is EqualUnmodifiableMapView) return _preferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'GroupOrderParticipant(userId: $userId, userName: $userName, email: $email, joinedAt: $joinedAt, role: $role, status: $status, profilePicture: $profilePicture, phoneNumber: $phoneNumber, contributionAmount: $contributionAmount, orderItemIds: $orderItemIds, hasOrdered: $hasOrdered, hasPaid: $hasPaid, lastActivity: $lastActivity, preferences: $preferences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupOrderParticipantImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.contributionAmount, contributionAmount) ||
                other.contributionAmount == contributionAmount) &&
            const DeepCollectionEquality()
                .equals(other._orderItemIds, _orderItemIds) &&
            (identical(other.hasOrdered, hasOrdered) ||
                other.hasOrdered == hasOrdered) &&
            (identical(other.hasPaid, hasPaid) || other.hasPaid == hasPaid) &&
            (identical(other.lastActivity, lastActivity) ||
                other.lastActivity == lastActivity) &&
            const DeepCollectionEquality()
                .equals(other._preferences, _preferences));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      userName,
      email,
      joinedAt,
      role,
      status,
      profilePicture,
      phoneNumber,
      contributionAmount,
      const DeepCollectionEquality().hash(_orderItemIds),
      hasOrdered,
      hasPaid,
      lastActivity,
      const DeepCollectionEquality().hash(_preferences));

  /// Create a copy of GroupOrderParticipant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupOrderParticipantImplCopyWith<_$GroupOrderParticipantImpl>
      get copyWith => __$$GroupOrderParticipantImplCopyWithImpl<
          _$GroupOrderParticipantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupOrderParticipantImplToJson(
      this,
    );
  }
}

abstract class _GroupOrderParticipant implements GroupOrderParticipant {
  const factory _GroupOrderParticipant(
      {required final String userId,
      required final String userName,
      required final String email,
      required final DateTime joinedAt,
      required final ParticipantRole role,
      required final ParticipantStatus status,
      final String? profilePicture,
      final String? phoneNumber,
      final double? contributionAmount,
      final List<String> orderItemIds,
      final bool hasOrdered,
      final bool hasPaid,
      final DateTime? lastActivity,
      final Map<String, dynamic>? preferences}) = _$GroupOrderParticipantImpl;

  factory _GroupOrderParticipant.fromJson(Map<String, dynamic> json) =
      _$GroupOrderParticipantImpl.fromJson;

  @override
  String get userId;
  @override
  String get userName;
  @override
  String get email;
  @override
  DateTime get joinedAt;
  @override
  ParticipantRole get role;
  @override
  ParticipantStatus get status;
  @override
  String? get profilePicture;
  @override
  String? get phoneNumber;
  @override
  double? get contributionAmount;
  @override
  List<String> get orderItemIds;
  @override
  bool get hasOrdered;
  @override
  bool get hasPaid;
  @override
  DateTime? get lastActivity;
  @override
  Map<String, dynamic>? get preferences;

  /// Create a copy of GroupOrderParticipant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupOrderParticipantImplCopyWith<_$GroupOrderParticipantImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GroupOrderItem _$GroupOrderItemFromJson(Map<String, dynamic> json) {
  return _GroupOrderItem.fromJson(json);
}

/// @nodoc
mixin _$GroupOrderItem {
  String get itemId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get menuItemId => throw _privateConstructorUsedError;
  String get itemName => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  DateTime get addedAt => throw _privateConstructorUsedError;
  String? get itemImage => throw _privateConstructorUsedError;
  String? get itemDescription => throw _privateConstructorUsedError;
  List<String> get customizations => throw _privateConstructorUsedError;
  String? get specialInstructions => throw _privateConstructorUsedError;
  ItemStatus get status => throw _privateConstructorUsedError;
  double? get discountAmount => throw _privateConstructorUsedError;
  Map<String, dynamic>? get itemDetails => throw _privateConstructorUsedError;

  /// Serializes this GroupOrderItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupOrderItemCopyWith<GroupOrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupOrderItemCopyWith<$Res> {
  factory $GroupOrderItemCopyWith(
          GroupOrderItem value, $Res Function(GroupOrderItem) then) =
      _$GroupOrderItemCopyWithImpl<$Res, GroupOrderItem>;
  @useResult
  $Res call(
      {String itemId,
      String userId,
      String userName,
      String menuItemId,
      String itemName,
      double price,
      int quantity,
      DateTime addedAt,
      String? itemImage,
      String? itemDescription,
      List<String> customizations,
      String? specialInstructions,
      ItemStatus status,
      double? discountAmount,
      Map<String, dynamic>? itemDetails});
}

/// @nodoc
class _$GroupOrderItemCopyWithImpl<$Res, $Val extends GroupOrderItem>
    implements $GroupOrderItemCopyWith<$Res> {
  _$GroupOrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? userId = null,
    Object? userName = null,
    Object? menuItemId = null,
    Object? itemName = null,
    Object? price = null,
    Object? quantity = null,
    Object? addedAt = null,
    Object? itemImage = freezed,
    Object? itemDescription = freezed,
    Object? customizations = null,
    Object? specialInstructions = freezed,
    Object? status = null,
    Object? discountAmount = freezed,
    Object? itemDetails = freezed,
  }) {
    return _then(_value.copyWith(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      menuItemId: null == menuItemId
          ? _value.menuItemId
          : menuItemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      itemImage: freezed == itemImage
          ? _value.itemImage
          : itemImage // ignore: cast_nullable_to_non_nullable
              as String?,
      itemDescription: freezed == itemDescription
          ? _value.itemDescription
          : itemDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      customizations: null == customizations
          ? _value.customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ItemStatus,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      itemDetails: freezed == itemDetails
          ? _value.itemDetails
          : itemDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupOrderItemImplCopyWith<$Res>
    implements $GroupOrderItemCopyWith<$Res> {
  factory _$$GroupOrderItemImplCopyWith(_$GroupOrderItemImpl value,
          $Res Function(_$GroupOrderItemImpl) then) =
      __$$GroupOrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String itemId,
      String userId,
      String userName,
      String menuItemId,
      String itemName,
      double price,
      int quantity,
      DateTime addedAt,
      String? itemImage,
      String? itemDescription,
      List<String> customizations,
      String? specialInstructions,
      ItemStatus status,
      double? discountAmount,
      Map<String, dynamic>? itemDetails});
}

/// @nodoc
class __$$GroupOrderItemImplCopyWithImpl<$Res>
    extends _$GroupOrderItemCopyWithImpl<$Res, _$GroupOrderItemImpl>
    implements _$$GroupOrderItemImplCopyWith<$Res> {
  __$$GroupOrderItemImplCopyWithImpl(
      _$GroupOrderItemImpl _value, $Res Function(_$GroupOrderItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? userId = null,
    Object? userName = null,
    Object? menuItemId = null,
    Object? itemName = null,
    Object? price = null,
    Object? quantity = null,
    Object? addedAt = null,
    Object? itemImage = freezed,
    Object? itemDescription = freezed,
    Object? customizations = null,
    Object? specialInstructions = freezed,
    Object? status = null,
    Object? discountAmount = freezed,
    Object? itemDetails = freezed,
  }) {
    return _then(_$GroupOrderItemImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      menuItemId: null == menuItemId
          ? _value.menuItemId
          : menuItemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      itemImage: freezed == itemImage
          ? _value.itemImage
          : itemImage // ignore: cast_nullable_to_non_nullable
              as String?,
      itemDescription: freezed == itemDescription
          ? _value.itemDescription
          : itemDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      customizations: null == customizations
          ? _value._customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ItemStatus,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      itemDetails: freezed == itemDetails
          ? _value._itemDetails
          : itemDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupOrderItemImpl implements _GroupOrderItem {
  const _$GroupOrderItemImpl(
      {required this.itemId,
      required this.userId,
      required this.userName,
      required this.menuItemId,
      required this.itemName,
      required this.price,
      required this.quantity,
      required this.addedAt,
      this.itemImage,
      this.itemDescription,
      final List<String> customizations = const [],
      this.specialInstructions,
      this.status = ItemStatus.pending,
      this.discountAmount,
      final Map<String, dynamic>? itemDetails})
      : _customizations = customizations,
        _itemDetails = itemDetails;

  factory _$GroupOrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupOrderItemImplFromJson(json);

  @override
  final String itemId;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String menuItemId;
  @override
  final String itemName;
  @override
  final double price;
  @override
  final int quantity;
  @override
  final DateTime addedAt;
  @override
  final String? itemImage;
  @override
  final String? itemDescription;
  final List<String> _customizations;
  @override
  @JsonKey()
  List<String> get customizations {
    if (_customizations is EqualUnmodifiableListView) return _customizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customizations);
  }

  @override
  final String? specialInstructions;
  @override
  @JsonKey()
  final ItemStatus status;
  @override
  final double? discountAmount;
  final Map<String, dynamic>? _itemDetails;
  @override
  Map<String, dynamic>? get itemDetails {
    final value = _itemDetails;
    if (value == null) return null;
    if (_itemDetails is EqualUnmodifiableMapView) return _itemDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'GroupOrderItem(itemId: $itemId, userId: $userId, userName: $userName, menuItemId: $menuItemId, itemName: $itemName, price: $price, quantity: $quantity, addedAt: $addedAt, itemImage: $itemImage, itemDescription: $itemDescription, customizations: $customizations, specialInstructions: $specialInstructions, status: $status, discountAmount: $discountAmount, itemDetails: $itemDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupOrderItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.menuItemId, menuItemId) ||
                other.menuItemId == menuItemId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.itemImage, itemImage) ||
                other.itemImage == itemImage) &&
            (identical(other.itemDescription, itemDescription) ||
                other.itemDescription == itemDescription) &&
            const DeepCollectionEquality()
                .equals(other._customizations, _customizations) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            const DeepCollectionEquality()
                .equals(other._itemDetails, _itemDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      itemId,
      userId,
      userName,
      menuItemId,
      itemName,
      price,
      quantity,
      addedAt,
      itemImage,
      itemDescription,
      const DeepCollectionEquality().hash(_customizations),
      specialInstructions,
      status,
      discountAmount,
      const DeepCollectionEquality().hash(_itemDetails));

  /// Create a copy of GroupOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupOrderItemImplCopyWith<_$GroupOrderItemImpl> get copyWith =>
      __$$GroupOrderItemImplCopyWithImpl<_$GroupOrderItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupOrderItemImplToJson(
      this,
    );
  }
}

abstract class _GroupOrderItem implements GroupOrderItem {
  const factory _GroupOrderItem(
      {required final String itemId,
      required final String userId,
      required final String userName,
      required final String menuItemId,
      required final String itemName,
      required final double price,
      required final int quantity,
      required final DateTime addedAt,
      final String? itemImage,
      final String? itemDescription,
      final List<String> customizations,
      final String? specialInstructions,
      final ItemStatus status,
      final double? discountAmount,
      final Map<String, dynamic>? itemDetails}) = _$GroupOrderItemImpl;

  factory _GroupOrderItem.fromJson(Map<String, dynamic> json) =
      _$GroupOrderItemImpl.fromJson;

  @override
  String get itemId;
  @override
  String get userId;
  @override
  String get userName;
  @override
  String get menuItemId;
  @override
  String get itemName;
  @override
  double get price;
  @override
  int get quantity;
  @override
  DateTime get addedAt;
  @override
  String? get itemImage;
  @override
  String? get itemDescription;
  @override
  List<String> get customizations;
  @override
  String? get specialInstructions;
  @override
  ItemStatus get status;
  @override
  double? get discountAmount;
  @override
  Map<String, dynamic>? get itemDetails;

  /// Create a copy of GroupOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupOrderItemImplCopyWith<_$GroupOrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GroupOrderPayment _$GroupOrderPaymentFromJson(Map<String, dynamic> json) {
  return _GroupOrderPayment.fromJson(json);
}

/// @nodoc
mixin _$GroupOrderPayment {
  PaymentSplitType get splitType => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  Map<String, double> get participantAmounts =>
      throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  List<PaymentTransaction> get transactions =>
      throw _privateConstructorUsedError;
  String? get paymentInstructions => throw _privateConstructorUsedError;
  double? get tipAmount => throw _privateConstructorUsedError;
  bool get isPaymentCompleted => throw _privateConstructorUsedError;
  DateTime? get paymentDeadline => throw _privateConstructorUsedError;
  String? get paymentLinkId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get paymentDetails =>
      throw _privateConstructorUsedError;

  /// Serializes this GroupOrderPayment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupOrderPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupOrderPaymentCopyWith<GroupOrderPayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupOrderPaymentCopyWith<$Res> {
  factory $GroupOrderPaymentCopyWith(
          GroupOrderPayment value, $Res Function(GroupOrderPayment) then) =
      _$GroupOrderPaymentCopyWithImpl<$Res, GroupOrderPayment>;
  @useResult
  $Res call(
      {PaymentSplitType splitType,
      double totalAmount,
      Map<String, double> participantAmounts,
      PaymentMethod paymentMethod,
      List<PaymentTransaction> transactions,
      String? paymentInstructions,
      double? tipAmount,
      bool isPaymentCompleted,
      DateTime? paymentDeadline,
      String? paymentLinkId,
      Map<String, dynamic>? paymentDetails});
}

/// @nodoc
class _$GroupOrderPaymentCopyWithImpl<$Res, $Val extends GroupOrderPayment>
    implements $GroupOrderPaymentCopyWith<$Res> {
  _$GroupOrderPaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupOrderPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splitType = null,
    Object? totalAmount = null,
    Object? participantAmounts = null,
    Object? paymentMethod = null,
    Object? transactions = null,
    Object? paymentInstructions = freezed,
    Object? tipAmount = freezed,
    Object? isPaymentCompleted = null,
    Object? paymentDeadline = freezed,
    Object? paymentLinkId = freezed,
    Object? paymentDetails = freezed,
  }) {
    return _then(_value.copyWith(
      splitType: null == splitType
          ? _value.splitType
          : splitType // ignore: cast_nullable_to_non_nullable
              as PaymentSplitType,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      participantAmounts: null == participantAmounts
          ? _value.participantAmounts
          : participantAmounts // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<PaymentTransaction>,
      paymentInstructions: freezed == paymentInstructions
          ? _value.paymentInstructions
          : paymentInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      tipAmount: freezed == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      isPaymentCompleted: null == isPaymentCompleted
          ? _value.isPaymentCompleted
          : isPaymentCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentDeadline: freezed == paymentDeadline
          ? _value.paymentDeadline
          : paymentDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentLinkId: freezed == paymentLinkId
          ? _value.paymentLinkId
          : paymentLinkId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDetails: freezed == paymentDetails
          ? _value.paymentDetails
          : paymentDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupOrderPaymentImplCopyWith<$Res>
    implements $GroupOrderPaymentCopyWith<$Res> {
  factory _$$GroupOrderPaymentImplCopyWith(_$GroupOrderPaymentImpl value,
          $Res Function(_$GroupOrderPaymentImpl) then) =
      __$$GroupOrderPaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaymentSplitType splitType,
      double totalAmount,
      Map<String, double> participantAmounts,
      PaymentMethod paymentMethod,
      List<PaymentTransaction> transactions,
      String? paymentInstructions,
      double? tipAmount,
      bool isPaymentCompleted,
      DateTime? paymentDeadline,
      String? paymentLinkId,
      Map<String, dynamic>? paymentDetails});
}

/// @nodoc
class __$$GroupOrderPaymentImplCopyWithImpl<$Res>
    extends _$GroupOrderPaymentCopyWithImpl<$Res, _$GroupOrderPaymentImpl>
    implements _$$GroupOrderPaymentImplCopyWith<$Res> {
  __$$GroupOrderPaymentImplCopyWithImpl(_$GroupOrderPaymentImpl _value,
      $Res Function(_$GroupOrderPaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupOrderPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splitType = null,
    Object? totalAmount = null,
    Object? participantAmounts = null,
    Object? paymentMethod = null,
    Object? transactions = null,
    Object? paymentInstructions = freezed,
    Object? tipAmount = freezed,
    Object? isPaymentCompleted = null,
    Object? paymentDeadline = freezed,
    Object? paymentLinkId = freezed,
    Object? paymentDetails = freezed,
  }) {
    return _then(_$GroupOrderPaymentImpl(
      splitType: null == splitType
          ? _value.splitType
          : splitType // ignore: cast_nullable_to_non_nullable
              as PaymentSplitType,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      participantAmounts: null == participantAmounts
          ? _value._participantAmounts
          : participantAmounts // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<PaymentTransaction>,
      paymentInstructions: freezed == paymentInstructions
          ? _value.paymentInstructions
          : paymentInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      tipAmount: freezed == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      isPaymentCompleted: null == isPaymentCompleted
          ? _value.isPaymentCompleted
          : isPaymentCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentDeadline: freezed == paymentDeadline
          ? _value.paymentDeadline
          : paymentDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentLinkId: freezed == paymentLinkId
          ? _value.paymentLinkId
          : paymentLinkId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDetails: freezed == paymentDetails
          ? _value._paymentDetails
          : paymentDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupOrderPaymentImpl implements _GroupOrderPayment {
  const _$GroupOrderPaymentImpl(
      {required this.splitType,
      required this.totalAmount,
      required final Map<String, double> participantAmounts,
      required this.paymentMethod,
      final List<PaymentTransaction> transactions = const [],
      this.paymentInstructions,
      this.tipAmount,
      this.isPaymentCompleted = false,
      this.paymentDeadline,
      this.paymentLinkId,
      final Map<String, dynamic>? paymentDetails})
      : _participantAmounts = participantAmounts,
        _transactions = transactions,
        _paymentDetails = paymentDetails;

  factory _$GroupOrderPaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupOrderPaymentImplFromJson(json);

  @override
  final PaymentSplitType splitType;
  @override
  final double totalAmount;
  final Map<String, double> _participantAmounts;
  @override
  Map<String, double> get participantAmounts {
    if (_participantAmounts is EqualUnmodifiableMapView)
      return _participantAmounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_participantAmounts);
  }

  @override
  final PaymentMethod paymentMethod;
  final List<PaymentTransaction> _transactions;
  @override
  @JsonKey()
  List<PaymentTransaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final String? paymentInstructions;
  @override
  final double? tipAmount;
  @override
  @JsonKey()
  final bool isPaymentCompleted;
  @override
  final DateTime? paymentDeadline;
  @override
  final String? paymentLinkId;
  final Map<String, dynamic>? _paymentDetails;
  @override
  Map<String, dynamic>? get paymentDetails {
    final value = _paymentDetails;
    if (value == null) return null;
    if (_paymentDetails is EqualUnmodifiableMapView) return _paymentDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'GroupOrderPayment(splitType: $splitType, totalAmount: $totalAmount, participantAmounts: $participantAmounts, paymentMethod: $paymentMethod, transactions: $transactions, paymentInstructions: $paymentInstructions, tipAmount: $tipAmount, isPaymentCompleted: $isPaymentCompleted, paymentDeadline: $paymentDeadline, paymentLinkId: $paymentLinkId, paymentDetails: $paymentDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupOrderPaymentImpl &&
            (identical(other.splitType, splitType) ||
                other.splitType == splitType) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            const DeepCollectionEquality()
                .equals(other._participantAmounts, _participantAmounts) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.paymentInstructions, paymentInstructions) ||
                other.paymentInstructions == paymentInstructions) &&
            (identical(other.tipAmount, tipAmount) ||
                other.tipAmount == tipAmount) &&
            (identical(other.isPaymentCompleted, isPaymentCompleted) ||
                other.isPaymentCompleted == isPaymentCompleted) &&
            (identical(other.paymentDeadline, paymentDeadline) ||
                other.paymentDeadline == paymentDeadline) &&
            (identical(other.paymentLinkId, paymentLinkId) ||
                other.paymentLinkId == paymentLinkId) &&
            const DeepCollectionEquality()
                .equals(other._paymentDetails, _paymentDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      splitType,
      totalAmount,
      const DeepCollectionEquality().hash(_participantAmounts),
      paymentMethod,
      const DeepCollectionEquality().hash(_transactions),
      paymentInstructions,
      tipAmount,
      isPaymentCompleted,
      paymentDeadline,
      paymentLinkId,
      const DeepCollectionEquality().hash(_paymentDetails));

  /// Create a copy of GroupOrderPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupOrderPaymentImplCopyWith<_$GroupOrderPaymentImpl> get copyWith =>
      __$$GroupOrderPaymentImplCopyWithImpl<_$GroupOrderPaymentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupOrderPaymentImplToJson(
      this,
    );
  }
}

abstract class _GroupOrderPayment implements GroupOrderPayment {
  const factory _GroupOrderPayment(
      {required final PaymentSplitType splitType,
      required final double totalAmount,
      required final Map<String, double> participantAmounts,
      required final PaymentMethod paymentMethod,
      final List<PaymentTransaction> transactions,
      final String? paymentInstructions,
      final double? tipAmount,
      final bool isPaymentCompleted,
      final DateTime? paymentDeadline,
      final String? paymentLinkId,
      final Map<String, dynamic>? paymentDetails}) = _$GroupOrderPaymentImpl;

  factory _GroupOrderPayment.fromJson(Map<String, dynamic> json) =
      _$GroupOrderPaymentImpl.fromJson;

  @override
  PaymentSplitType get splitType;
  @override
  double get totalAmount;
  @override
  Map<String, double> get participantAmounts;
  @override
  PaymentMethod get paymentMethod;
  @override
  List<PaymentTransaction> get transactions;
  @override
  String? get paymentInstructions;
  @override
  double? get tipAmount;
  @override
  bool get isPaymentCompleted;
  @override
  DateTime? get paymentDeadline;
  @override
  String? get paymentLinkId;
  @override
  Map<String, dynamic>? get paymentDetails;

  /// Create a copy of GroupOrderPayment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupOrderPaymentImplCopyWith<_$GroupOrderPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentTransaction _$PaymentTransactionFromJson(Map<String, dynamic> json) {
  return _PaymentTransaction.fromJson(json);
}

/// @nodoc
mixin _$PaymentTransaction {
  String get transactionId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  TransactionStatus get status => throw _privateConstructorUsedError;
  String? get paymentMethodId => throw _privateConstructorUsedError;
  String? get transactionReference => throw _privateConstructorUsedError;
  String? get failureReason => throw _privateConstructorUsedError;
  Map<String, dynamic>? get transactionData =>
      throw _privateConstructorUsedError;

  /// Serializes this PaymentTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentTransactionCopyWith<PaymentTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentTransactionCopyWith<$Res> {
  factory $PaymentTransactionCopyWith(
          PaymentTransaction value, $Res Function(PaymentTransaction) then) =
      _$PaymentTransactionCopyWithImpl<$Res, PaymentTransaction>;
  @useResult
  $Res call(
      {String transactionId,
      String userId,
      String userName,
      double amount,
      DateTime timestamp,
      TransactionStatus status,
      String? paymentMethodId,
      String? transactionReference,
      String? failureReason,
      Map<String, dynamic>? transactionData});
}

/// @nodoc
class _$PaymentTransactionCopyWithImpl<$Res, $Val extends PaymentTransaction>
    implements $PaymentTransactionCopyWith<$Res> {
  _$PaymentTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? userId = null,
    Object? userName = null,
    Object? amount = null,
    Object? timestamp = null,
    Object? status = null,
    Object? paymentMethodId = freezed,
    Object? transactionReference = freezed,
    Object? failureReason = freezed,
    Object? transactionData = freezed,
  }) {
    return _then(_value.copyWith(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionStatus,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionReference: freezed == transactionReference
          ? _value.transactionReference
          : transactionReference // ignore: cast_nullable_to_non_nullable
              as String?,
      failureReason: freezed == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionData: freezed == transactionData
          ? _value.transactionData
          : transactionData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentTransactionImplCopyWith<$Res>
    implements $PaymentTransactionCopyWith<$Res> {
  factory _$$PaymentTransactionImplCopyWith(_$PaymentTransactionImpl value,
          $Res Function(_$PaymentTransactionImpl) then) =
      __$$PaymentTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String transactionId,
      String userId,
      String userName,
      double amount,
      DateTime timestamp,
      TransactionStatus status,
      String? paymentMethodId,
      String? transactionReference,
      String? failureReason,
      Map<String, dynamic>? transactionData});
}

/// @nodoc
class __$$PaymentTransactionImplCopyWithImpl<$Res>
    extends _$PaymentTransactionCopyWithImpl<$Res, _$PaymentTransactionImpl>
    implements _$$PaymentTransactionImplCopyWith<$Res> {
  __$$PaymentTransactionImplCopyWithImpl(_$PaymentTransactionImpl _value,
      $Res Function(_$PaymentTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? userId = null,
    Object? userName = null,
    Object? amount = null,
    Object? timestamp = null,
    Object? status = null,
    Object? paymentMethodId = freezed,
    Object? transactionReference = freezed,
    Object? failureReason = freezed,
    Object? transactionData = freezed,
  }) {
    return _then(_$PaymentTransactionImpl(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionStatus,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionReference: freezed == transactionReference
          ? _value.transactionReference
          : transactionReference // ignore: cast_nullable_to_non_nullable
              as String?,
      failureReason: freezed == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionData: freezed == transactionData
          ? _value._transactionData
          : transactionData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentTransactionImpl implements _PaymentTransaction {
  const _$PaymentTransactionImpl(
      {required this.transactionId,
      required this.userId,
      required this.userName,
      required this.amount,
      required this.timestamp,
      required this.status,
      this.paymentMethodId,
      this.transactionReference,
      this.failureReason,
      final Map<String, dynamic>? transactionData})
      : _transactionData = transactionData;

  factory _$PaymentTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentTransactionImplFromJson(json);

  @override
  final String transactionId;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final double amount;
  @override
  final DateTime timestamp;
  @override
  final TransactionStatus status;
  @override
  final String? paymentMethodId;
  @override
  final String? transactionReference;
  @override
  final String? failureReason;
  final Map<String, dynamic>? _transactionData;
  @override
  Map<String, dynamic>? get transactionData {
    final value = _transactionData;
    if (value == null) return null;
    if (_transactionData is EqualUnmodifiableMapView) return _transactionData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'PaymentTransaction(transactionId: $transactionId, userId: $userId, userName: $userName, amount: $amount, timestamp: $timestamp, status: $status, paymentMethodId: $paymentMethodId, transactionReference: $transactionReference, failureReason: $failureReason, transactionData: $transactionData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentTransactionImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentMethodId, paymentMethodId) ||
                other.paymentMethodId == paymentMethodId) &&
            (identical(other.transactionReference, transactionReference) ||
                other.transactionReference == transactionReference) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason) &&
            const DeepCollectionEquality()
                .equals(other._transactionData, _transactionData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionId,
      userId,
      userName,
      amount,
      timestamp,
      status,
      paymentMethodId,
      transactionReference,
      failureReason,
      const DeepCollectionEquality().hash(_transactionData));

  /// Create a copy of PaymentTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentTransactionImplCopyWith<_$PaymentTransactionImpl> get copyWith =>
      __$$PaymentTransactionImplCopyWithImpl<_$PaymentTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentTransactionImplToJson(
      this,
    );
  }
}

abstract class _PaymentTransaction implements PaymentTransaction {
  const factory _PaymentTransaction(
      {required final String transactionId,
      required final String userId,
      required final String userName,
      required final double amount,
      required final DateTime timestamp,
      required final TransactionStatus status,
      final String? paymentMethodId,
      final String? transactionReference,
      final String? failureReason,
      final Map<String, dynamic>? transactionData}) = _$PaymentTransactionImpl;

  factory _PaymentTransaction.fromJson(Map<String, dynamic> json) =
      _$PaymentTransactionImpl.fromJson;

  @override
  String get transactionId;
  @override
  String get userId;
  @override
  String get userName;
  @override
  double get amount;
  @override
  DateTime get timestamp;
  @override
  TransactionStatus get status;
  @override
  String? get paymentMethodId;
  @override
  String? get transactionReference;
  @override
  String? get failureReason;
  @override
  Map<String, dynamic>? get transactionData;

  /// Create a copy of PaymentTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentTransactionImplCopyWith<_$PaymentTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GroupOrderInvitation _$GroupOrderInvitationFromJson(Map<String, dynamic> json) {
  return _GroupOrderInvitation.fromJson(json);
}

/// @nodoc
mixin _$GroupOrderInvitation {
  String get invitationId => throw _privateConstructorUsedError;
  String get groupOrderId => throw _privateConstructorUsedError;
  String get invitedBy => throw _privateConstructorUsedError;
  String get invitedByName => throw _privateConstructorUsedError;
  String get invitedEmail => throw _privateConstructorUsedError;
  DateTime get sentAt => throw _privateConstructorUsedError;
  InvitationStatus get status => throw _privateConstructorUsedError;
  String? get invitedUserId => throw _privateConstructorUsedError;
  String? get invitedUserName => throw _privateConstructorUsedError;
  String? get personalMessage => throw _privateConstructorUsedError;
  DateTime? get respondedAt => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  String? get inviteLink => throw _privateConstructorUsedError;

  /// Serializes this GroupOrderInvitation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupOrderInvitation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupOrderInvitationCopyWith<GroupOrderInvitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupOrderInvitationCopyWith<$Res> {
  factory $GroupOrderInvitationCopyWith(GroupOrderInvitation value,
          $Res Function(GroupOrderInvitation) then) =
      _$GroupOrderInvitationCopyWithImpl<$Res, GroupOrderInvitation>;
  @useResult
  $Res call(
      {String invitationId,
      String groupOrderId,
      String invitedBy,
      String invitedByName,
      String invitedEmail,
      DateTime sentAt,
      InvitationStatus status,
      String? invitedUserId,
      String? invitedUserName,
      String? personalMessage,
      DateTime? respondedAt,
      DateTime? expiresAt,
      String? inviteLink});
}

/// @nodoc
class _$GroupOrderInvitationCopyWithImpl<$Res,
        $Val extends GroupOrderInvitation>
    implements $GroupOrderInvitationCopyWith<$Res> {
  _$GroupOrderInvitationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupOrderInvitation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationId = null,
    Object? groupOrderId = null,
    Object? invitedBy = null,
    Object? invitedByName = null,
    Object? invitedEmail = null,
    Object? sentAt = null,
    Object? status = null,
    Object? invitedUserId = freezed,
    Object? invitedUserName = freezed,
    Object? personalMessage = freezed,
    Object? respondedAt = freezed,
    Object? expiresAt = freezed,
    Object? inviteLink = freezed,
  }) {
    return _then(_value.copyWith(
      invitationId: null == invitationId
          ? _value.invitationId
          : invitationId // ignore: cast_nullable_to_non_nullable
              as String,
      groupOrderId: null == groupOrderId
          ? _value.groupOrderId
          : groupOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      invitedBy: null == invitedBy
          ? _value.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as String,
      invitedByName: null == invitedByName
          ? _value.invitedByName
          : invitedByName // ignore: cast_nullable_to_non_nullable
              as String,
      invitedEmail: null == invitedEmail
          ? _value.invitedEmail
          : invitedEmail // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InvitationStatus,
      invitedUserId: freezed == invitedUserId
          ? _value.invitedUserId
          : invitedUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      invitedUserName: freezed == invitedUserName
          ? _value.invitedUserName
          : invitedUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      personalMessage: freezed == personalMessage
          ? _value.personalMessage
          : personalMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      respondedAt: freezed == respondedAt
          ? _value.respondedAt
          : respondedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      inviteLink: freezed == inviteLink
          ? _value.inviteLink
          : inviteLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupOrderInvitationImplCopyWith<$Res>
    implements $GroupOrderInvitationCopyWith<$Res> {
  factory _$$GroupOrderInvitationImplCopyWith(_$GroupOrderInvitationImpl value,
          $Res Function(_$GroupOrderInvitationImpl) then) =
      __$$GroupOrderInvitationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String invitationId,
      String groupOrderId,
      String invitedBy,
      String invitedByName,
      String invitedEmail,
      DateTime sentAt,
      InvitationStatus status,
      String? invitedUserId,
      String? invitedUserName,
      String? personalMessage,
      DateTime? respondedAt,
      DateTime? expiresAt,
      String? inviteLink});
}

/// @nodoc
class __$$GroupOrderInvitationImplCopyWithImpl<$Res>
    extends _$GroupOrderInvitationCopyWithImpl<$Res, _$GroupOrderInvitationImpl>
    implements _$$GroupOrderInvitationImplCopyWith<$Res> {
  __$$GroupOrderInvitationImplCopyWithImpl(_$GroupOrderInvitationImpl _value,
      $Res Function(_$GroupOrderInvitationImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupOrderInvitation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationId = null,
    Object? groupOrderId = null,
    Object? invitedBy = null,
    Object? invitedByName = null,
    Object? invitedEmail = null,
    Object? sentAt = null,
    Object? status = null,
    Object? invitedUserId = freezed,
    Object? invitedUserName = freezed,
    Object? personalMessage = freezed,
    Object? respondedAt = freezed,
    Object? expiresAt = freezed,
    Object? inviteLink = freezed,
  }) {
    return _then(_$GroupOrderInvitationImpl(
      invitationId: null == invitationId
          ? _value.invitationId
          : invitationId // ignore: cast_nullable_to_non_nullable
              as String,
      groupOrderId: null == groupOrderId
          ? _value.groupOrderId
          : groupOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      invitedBy: null == invitedBy
          ? _value.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as String,
      invitedByName: null == invitedByName
          ? _value.invitedByName
          : invitedByName // ignore: cast_nullable_to_non_nullable
              as String,
      invitedEmail: null == invitedEmail
          ? _value.invitedEmail
          : invitedEmail // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InvitationStatus,
      invitedUserId: freezed == invitedUserId
          ? _value.invitedUserId
          : invitedUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      invitedUserName: freezed == invitedUserName
          ? _value.invitedUserName
          : invitedUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      personalMessage: freezed == personalMessage
          ? _value.personalMessage
          : personalMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      respondedAt: freezed == respondedAt
          ? _value.respondedAt
          : respondedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      inviteLink: freezed == inviteLink
          ? _value.inviteLink
          : inviteLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupOrderInvitationImpl implements _GroupOrderInvitation {
  const _$GroupOrderInvitationImpl(
      {required this.invitationId,
      required this.groupOrderId,
      required this.invitedBy,
      required this.invitedByName,
      required this.invitedEmail,
      required this.sentAt,
      required this.status,
      this.invitedUserId,
      this.invitedUserName,
      this.personalMessage,
      this.respondedAt,
      this.expiresAt,
      this.inviteLink});

  factory _$GroupOrderInvitationImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupOrderInvitationImplFromJson(json);

  @override
  final String invitationId;
  @override
  final String groupOrderId;
  @override
  final String invitedBy;
  @override
  final String invitedByName;
  @override
  final String invitedEmail;
  @override
  final DateTime sentAt;
  @override
  final InvitationStatus status;
  @override
  final String? invitedUserId;
  @override
  final String? invitedUserName;
  @override
  final String? personalMessage;
  @override
  final DateTime? respondedAt;
  @override
  final DateTime? expiresAt;
  @override
  final String? inviteLink;

  @override
  String toString() {
    return 'GroupOrderInvitation(invitationId: $invitationId, groupOrderId: $groupOrderId, invitedBy: $invitedBy, invitedByName: $invitedByName, invitedEmail: $invitedEmail, sentAt: $sentAt, status: $status, invitedUserId: $invitedUserId, invitedUserName: $invitedUserName, personalMessage: $personalMessage, respondedAt: $respondedAt, expiresAt: $expiresAt, inviteLink: $inviteLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupOrderInvitationImpl &&
            (identical(other.invitationId, invitationId) ||
                other.invitationId == invitationId) &&
            (identical(other.groupOrderId, groupOrderId) ||
                other.groupOrderId == groupOrderId) &&
            (identical(other.invitedBy, invitedBy) ||
                other.invitedBy == invitedBy) &&
            (identical(other.invitedByName, invitedByName) ||
                other.invitedByName == invitedByName) &&
            (identical(other.invitedEmail, invitedEmail) ||
                other.invitedEmail == invitedEmail) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.invitedUserId, invitedUserId) ||
                other.invitedUserId == invitedUserId) &&
            (identical(other.invitedUserName, invitedUserName) ||
                other.invitedUserName == invitedUserName) &&
            (identical(other.personalMessage, personalMessage) ||
                other.personalMessage == personalMessage) &&
            (identical(other.respondedAt, respondedAt) ||
                other.respondedAt == respondedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.inviteLink, inviteLink) ||
                other.inviteLink == inviteLink));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      invitationId,
      groupOrderId,
      invitedBy,
      invitedByName,
      invitedEmail,
      sentAt,
      status,
      invitedUserId,
      invitedUserName,
      personalMessage,
      respondedAt,
      expiresAt,
      inviteLink);

  /// Create a copy of GroupOrderInvitation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupOrderInvitationImplCopyWith<_$GroupOrderInvitationImpl>
      get copyWith =>
          __$$GroupOrderInvitationImplCopyWithImpl<_$GroupOrderInvitationImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupOrderInvitationImplToJson(
      this,
    );
  }
}

abstract class _GroupOrderInvitation implements GroupOrderInvitation {
  const factory _GroupOrderInvitation(
      {required final String invitationId,
      required final String groupOrderId,
      required final String invitedBy,
      required final String invitedByName,
      required final String invitedEmail,
      required final DateTime sentAt,
      required final InvitationStatus status,
      final String? invitedUserId,
      final String? invitedUserName,
      final String? personalMessage,
      final DateTime? respondedAt,
      final DateTime? expiresAt,
      final String? inviteLink}) = _$GroupOrderInvitationImpl;

  factory _GroupOrderInvitation.fromJson(Map<String, dynamic> json) =
      _$GroupOrderInvitationImpl.fromJson;

  @override
  String get invitationId;
  @override
  String get groupOrderId;
  @override
  String get invitedBy;
  @override
  String get invitedByName;
  @override
  String get invitedEmail;
  @override
  DateTime get sentAt;
  @override
  InvitationStatus get status;
  @override
  String? get invitedUserId;
  @override
  String? get invitedUserName;
  @override
  String? get personalMessage;
  @override
  DateTime? get respondedAt;
  @override
  DateTime? get expiresAt;
  @override
  String? get inviteLink;

  /// Create a copy of GroupOrderInvitation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupOrderInvitationImplCopyWith<_$GroupOrderInvitationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GroupOrderChat _$GroupOrderChatFromJson(Map<String, dynamic> json) {
  return _GroupOrderChat.fromJson(json);
}

/// @nodoc
mixin _$GroupOrderChat {
  String get messageId => throw _privateConstructorUsedError;
  String get groupOrderId => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get senderName => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  MessageType get type => throw _privateConstructorUsedError;
  String? get senderAvatar => throw _privateConstructorUsedError;
  String? get replyToMessageId => throw _privateConstructorUsedError;
  List<String> get mentions => throw _privateConstructorUsedError;
  bool get isSystemMessage => throw _privateConstructorUsedError;
  List<String> get readBy => throw _privateConstructorUsedError;
  Map<String, dynamic>? get attachments => throw _privateConstructorUsedError;

  /// Serializes this GroupOrderChat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupOrderChat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupOrderChatCopyWith<GroupOrderChat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupOrderChatCopyWith<$Res> {
  factory $GroupOrderChatCopyWith(
          GroupOrderChat value, $Res Function(GroupOrderChat) then) =
      _$GroupOrderChatCopyWithImpl<$Res, GroupOrderChat>;
  @useResult
  $Res call(
      {String messageId,
      String groupOrderId,
      String senderId,
      String senderName,
      String message,
      DateTime timestamp,
      MessageType type,
      String? senderAvatar,
      String? replyToMessageId,
      List<String> mentions,
      bool isSystemMessage,
      List<String> readBy,
      Map<String, dynamic>? attachments});
}

/// @nodoc
class _$GroupOrderChatCopyWithImpl<$Res, $Val extends GroupOrderChat>
    implements $GroupOrderChatCopyWith<$Res> {
  _$GroupOrderChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupOrderChat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? groupOrderId = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? message = null,
    Object? timestamp = null,
    Object? type = null,
    Object? senderAvatar = freezed,
    Object? replyToMessageId = freezed,
    Object? mentions = null,
    Object? isSystemMessage = null,
    Object? readBy = null,
    Object? attachments = freezed,
  }) {
    return _then(_value.copyWith(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      groupOrderId: null == groupOrderId
          ? _value.groupOrderId
          : groupOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      senderAvatar: freezed == senderAvatar
          ? _value.senderAvatar
          : senderAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      replyToMessageId: freezed == replyToMessageId
          ? _value.replyToMessageId
          : replyToMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
      mentions: null == mentions
          ? _value.mentions
          : mentions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isSystemMessage: null == isSystemMessage
          ? _value.isSystemMessage
          : isSystemMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      readBy: null == readBy
          ? _value.readBy
          : readBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupOrderChatImplCopyWith<$Res>
    implements $GroupOrderChatCopyWith<$Res> {
  factory _$$GroupOrderChatImplCopyWith(_$GroupOrderChatImpl value,
          $Res Function(_$GroupOrderChatImpl) then) =
      __$$GroupOrderChatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String messageId,
      String groupOrderId,
      String senderId,
      String senderName,
      String message,
      DateTime timestamp,
      MessageType type,
      String? senderAvatar,
      String? replyToMessageId,
      List<String> mentions,
      bool isSystemMessage,
      List<String> readBy,
      Map<String, dynamic>? attachments});
}

/// @nodoc
class __$$GroupOrderChatImplCopyWithImpl<$Res>
    extends _$GroupOrderChatCopyWithImpl<$Res, _$GroupOrderChatImpl>
    implements _$$GroupOrderChatImplCopyWith<$Res> {
  __$$GroupOrderChatImplCopyWithImpl(
      _$GroupOrderChatImpl _value, $Res Function(_$GroupOrderChatImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupOrderChat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? groupOrderId = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? message = null,
    Object? timestamp = null,
    Object? type = null,
    Object? senderAvatar = freezed,
    Object? replyToMessageId = freezed,
    Object? mentions = null,
    Object? isSystemMessage = null,
    Object? readBy = null,
    Object? attachments = freezed,
  }) {
    return _then(_$GroupOrderChatImpl(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      groupOrderId: null == groupOrderId
          ? _value.groupOrderId
          : groupOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      senderAvatar: freezed == senderAvatar
          ? _value.senderAvatar
          : senderAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      replyToMessageId: freezed == replyToMessageId
          ? _value.replyToMessageId
          : replyToMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
      mentions: null == mentions
          ? _value._mentions
          : mentions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isSystemMessage: null == isSystemMessage
          ? _value.isSystemMessage
          : isSystemMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      readBy: null == readBy
          ? _value._readBy
          : readBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attachments: freezed == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupOrderChatImpl implements _GroupOrderChat {
  const _$GroupOrderChatImpl(
      {required this.messageId,
      required this.groupOrderId,
      required this.senderId,
      required this.senderName,
      required this.message,
      required this.timestamp,
      required this.type,
      this.senderAvatar,
      this.replyToMessageId,
      final List<String> mentions = const [],
      this.isSystemMessage = false,
      final List<String> readBy = const [],
      final Map<String, dynamic>? attachments})
      : _mentions = mentions,
        _readBy = readBy,
        _attachments = attachments;

  factory _$GroupOrderChatImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupOrderChatImplFromJson(json);

  @override
  final String messageId;
  @override
  final String groupOrderId;
  @override
  final String senderId;
  @override
  final String senderName;
  @override
  final String message;
  @override
  final DateTime timestamp;
  @override
  final MessageType type;
  @override
  final String? senderAvatar;
  @override
  final String? replyToMessageId;
  final List<String> _mentions;
  @override
  @JsonKey()
  List<String> get mentions {
    if (_mentions is EqualUnmodifiableListView) return _mentions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mentions);
  }

  @override
  @JsonKey()
  final bool isSystemMessage;
  final List<String> _readBy;
  @override
  @JsonKey()
  List<String> get readBy {
    if (_readBy is EqualUnmodifiableListView) return _readBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readBy);
  }

  final Map<String, dynamic>? _attachments;
  @override
  Map<String, dynamic>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableMapView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'GroupOrderChat(messageId: $messageId, groupOrderId: $groupOrderId, senderId: $senderId, senderName: $senderName, message: $message, timestamp: $timestamp, type: $type, senderAvatar: $senderAvatar, replyToMessageId: $replyToMessageId, mentions: $mentions, isSystemMessage: $isSystemMessage, readBy: $readBy, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupOrderChatImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.groupOrderId, groupOrderId) ||
                other.groupOrderId == groupOrderId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.senderAvatar, senderAvatar) ||
                other.senderAvatar == senderAvatar) &&
            (identical(other.replyToMessageId, replyToMessageId) ||
                other.replyToMessageId == replyToMessageId) &&
            const DeepCollectionEquality().equals(other._mentions, _mentions) &&
            (identical(other.isSystemMessage, isSystemMessage) ||
                other.isSystemMessage == isSystemMessage) &&
            const DeepCollectionEquality().equals(other._readBy, _readBy) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      messageId,
      groupOrderId,
      senderId,
      senderName,
      message,
      timestamp,
      type,
      senderAvatar,
      replyToMessageId,
      const DeepCollectionEquality().hash(_mentions),
      isSystemMessage,
      const DeepCollectionEquality().hash(_readBy),
      const DeepCollectionEquality().hash(_attachments));

  /// Create a copy of GroupOrderChat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupOrderChatImplCopyWith<_$GroupOrderChatImpl> get copyWith =>
      __$$GroupOrderChatImplCopyWithImpl<_$GroupOrderChatImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupOrderChatImplToJson(
      this,
    );
  }
}

abstract class _GroupOrderChat implements GroupOrderChat {
  const factory _GroupOrderChat(
      {required final String messageId,
      required final String groupOrderId,
      required final String senderId,
      required final String senderName,
      required final String message,
      required final DateTime timestamp,
      required final MessageType type,
      final String? senderAvatar,
      final String? replyToMessageId,
      final List<String> mentions,
      final bool isSystemMessage,
      final List<String> readBy,
      final Map<String, dynamic>? attachments}) = _$GroupOrderChatImpl;

  factory _GroupOrderChat.fromJson(Map<String, dynamic> json) =
      _$GroupOrderChatImpl.fromJson;

  @override
  String get messageId;
  @override
  String get groupOrderId;
  @override
  String get senderId;
  @override
  String get senderName;
  @override
  String get message;
  @override
  DateTime get timestamp;
  @override
  MessageType get type;
  @override
  String? get senderAvatar;
  @override
  String? get replyToMessageId;
  @override
  List<String> get mentions;
  @override
  bool get isSystemMessage;
  @override
  List<String> get readBy;
  @override
  Map<String, dynamic>? get attachments;

  /// Create a copy of GroupOrderChat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupOrderChatImplCopyWith<_$GroupOrderChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GroupOrderTemplate _$GroupOrderTemplateFromJson(Map<String, dynamic> json) {
  return _GroupOrderTemplate.fromJson(json);
}

/// @nodoc
mixin _$GroupOrderTemplate {
  String get templateId => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  String get templateName => throw _privateConstructorUsedError;
  String get restaurantId => throw _privateConstructorUsedError;
  String get restaurantName => throw _privateConstructorUsedError;
  List<String> get defaultItems => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  int? get maxParticipants => throw _privateConstructorUsedError;
  PaymentSplitType? get defaultSplitType => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  int get useCount => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  Map<String, dynamic>? get templateSettings =>
      throw _privateConstructorUsedError;

  /// Serializes this GroupOrderTemplate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupOrderTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupOrderTemplateCopyWith<GroupOrderTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupOrderTemplateCopyWith<$Res> {
  factory $GroupOrderTemplateCopyWith(
          GroupOrderTemplate value, $Res Function(GroupOrderTemplate) then) =
      _$GroupOrderTemplateCopyWithImpl<$Res, GroupOrderTemplate>;
  @useResult
  $Res call(
      {String templateId,
      String createdBy,
      String templateName,
      String restaurantId,
      String restaurantName,
      List<String> defaultItems,
      DateTime createdAt,
      String? description,
      String? imageUrl,
      int? maxParticipants,
      PaymentSplitType? defaultSplitType,
      List<String> tags,
      int useCount,
      bool isActive,
      Map<String, dynamic>? templateSettings});
}

/// @nodoc
class _$GroupOrderTemplateCopyWithImpl<$Res, $Val extends GroupOrderTemplate>
    implements $GroupOrderTemplateCopyWith<$Res> {
  _$GroupOrderTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupOrderTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateId = null,
    Object? createdBy = null,
    Object? templateName = null,
    Object? restaurantId = null,
    Object? restaurantName = null,
    Object? defaultItems = null,
    Object? createdAt = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? maxParticipants = freezed,
    Object? defaultSplitType = freezed,
    Object? tags = null,
    Object? useCount = null,
    Object? isActive = null,
    Object? templateSettings = freezed,
  }) {
    return _then(_value.copyWith(
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      templateName: null == templateName
          ? _value.templateName
          : templateName // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      defaultItems: null == defaultItems
          ? _value.defaultItems
          : defaultItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      maxParticipants: freezed == maxParticipants
          ? _value.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int?,
      defaultSplitType: freezed == defaultSplitType
          ? _value.defaultSplitType
          : defaultSplitType // ignore: cast_nullable_to_non_nullable
              as PaymentSplitType?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      useCount: null == useCount
          ? _value.useCount
          : useCount // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      templateSettings: freezed == templateSettings
          ? _value.templateSettings
          : templateSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupOrderTemplateImplCopyWith<$Res>
    implements $GroupOrderTemplateCopyWith<$Res> {
  factory _$$GroupOrderTemplateImplCopyWith(_$GroupOrderTemplateImpl value,
          $Res Function(_$GroupOrderTemplateImpl) then) =
      __$$GroupOrderTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String templateId,
      String createdBy,
      String templateName,
      String restaurantId,
      String restaurantName,
      List<String> defaultItems,
      DateTime createdAt,
      String? description,
      String? imageUrl,
      int? maxParticipants,
      PaymentSplitType? defaultSplitType,
      List<String> tags,
      int useCount,
      bool isActive,
      Map<String, dynamic>? templateSettings});
}

/// @nodoc
class __$$GroupOrderTemplateImplCopyWithImpl<$Res>
    extends _$GroupOrderTemplateCopyWithImpl<$Res, _$GroupOrderTemplateImpl>
    implements _$$GroupOrderTemplateImplCopyWith<$Res> {
  __$$GroupOrderTemplateImplCopyWithImpl(_$GroupOrderTemplateImpl _value,
      $Res Function(_$GroupOrderTemplateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupOrderTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateId = null,
    Object? createdBy = null,
    Object? templateName = null,
    Object? restaurantId = null,
    Object? restaurantName = null,
    Object? defaultItems = null,
    Object? createdAt = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? maxParticipants = freezed,
    Object? defaultSplitType = freezed,
    Object? tags = null,
    Object? useCount = null,
    Object? isActive = null,
    Object? templateSettings = freezed,
  }) {
    return _then(_$GroupOrderTemplateImpl(
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      templateName: null == templateName
          ? _value.templateName
          : templateName // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      defaultItems: null == defaultItems
          ? _value._defaultItems
          : defaultItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      maxParticipants: freezed == maxParticipants
          ? _value.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int?,
      defaultSplitType: freezed == defaultSplitType
          ? _value.defaultSplitType
          : defaultSplitType // ignore: cast_nullable_to_non_nullable
              as PaymentSplitType?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      useCount: null == useCount
          ? _value.useCount
          : useCount // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      templateSettings: freezed == templateSettings
          ? _value._templateSettings
          : templateSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupOrderTemplateImpl implements _GroupOrderTemplate {
  const _$GroupOrderTemplateImpl(
      {required this.templateId,
      required this.createdBy,
      required this.templateName,
      required this.restaurantId,
      required this.restaurantName,
      required final List<String> defaultItems,
      required this.createdAt,
      this.description,
      this.imageUrl,
      this.maxParticipants,
      this.defaultSplitType,
      final List<String> tags = const [],
      this.useCount = 0,
      this.isActive = true,
      final Map<String, dynamic>? templateSettings})
      : _defaultItems = defaultItems,
        _tags = tags,
        _templateSettings = templateSettings;

  factory _$GroupOrderTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupOrderTemplateImplFromJson(json);

  @override
  final String templateId;
  @override
  final String createdBy;
  @override
  final String templateName;
  @override
  final String restaurantId;
  @override
  final String restaurantName;
  final List<String> _defaultItems;
  @override
  List<String> get defaultItems {
    if (_defaultItems is EqualUnmodifiableListView) return _defaultItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_defaultItems);
  }

  @override
  final DateTime createdAt;
  @override
  final String? description;
  @override
  final String? imageUrl;
  @override
  final int? maxParticipants;
  @override
  final PaymentSplitType? defaultSplitType;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final int useCount;
  @override
  @JsonKey()
  final bool isActive;
  final Map<String, dynamic>? _templateSettings;
  @override
  Map<String, dynamic>? get templateSettings {
    final value = _templateSettings;
    if (value == null) return null;
    if (_templateSettings is EqualUnmodifiableMapView) return _templateSettings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'GroupOrderTemplate(templateId: $templateId, createdBy: $createdBy, templateName: $templateName, restaurantId: $restaurantId, restaurantName: $restaurantName, defaultItems: $defaultItems, createdAt: $createdAt, description: $description, imageUrl: $imageUrl, maxParticipants: $maxParticipants, defaultSplitType: $defaultSplitType, tags: $tags, useCount: $useCount, isActive: $isActive, templateSettings: $templateSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupOrderTemplateImpl &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.templateName, templateName) ||
                other.templateName == templateName) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            const DeepCollectionEquality()
                .equals(other._defaultItems, _defaultItems) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.maxParticipants, maxParticipants) ||
                other.maxParticipants == maxParticipants) &&
            (identical(other.defaultSplitType, defaultSplitType) ||
                other.defaultSplitType == defaultSplitType) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.useCount, useCount) ||
                other.useCount == useCount) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._templateSettings, _templateSettings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      templateId,
      createdBy,
      templateName,
      restaurantId,
      restaurantName,
      const DeepCollectionEquality().hash(_defaultItems),
      createdAt,
      description,
      imageUrl,
      maxParticipants,
      defaultSplitType,
      const DeepCollectionEquality().hash(_tags),
      useCount,
      isActive,
      const DeepCollectionEquality().hash(_templateSettings));

  /// Create a copy of GroupOrderTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupOrderTemplateImplCopyWith<_$GroupOrderTemplateImpl> get copyWith =>
      __$$GroupOrderTemplateImplCopyWithImpl<_$GroupOrderTemplateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupOrderTemplateImplToJson(
      this,
    );
  }
}

abstract class _GroupOrderTemplate implements GroupOrderTemplate {
  const factory _GroupOrderTemplate(
      {required final String templateId,
      required final String createdBy,
      required final String templateName,
      required final String restaurantId,
      required final String restaurantName,
      required final List<String> defaultItems,
      required final DateTime createdAt,
      final String? description,
      final String? imageUrl,
      final int? maxParticipants,
      final PaymentSplitType? defaultSplitType,
      final List<String> tags,
      final int useCount,
      final bool isActive,
      final Map<String, dynamic>? templateSettings}) = _$GroupOrderTemplateImpl;

  factory _GroupOrderTemplate.fromJson(Map<String, dynamic> json) =
      _$GroupOrderTemplateImpl.fromJson;

  @override
  String get templateId;
  @override
  String get createdBy;
  @override
  String get templateName;
  @override
  String get restaurantId;
  @override
  String get restaurantName;
  @override
  List<String> get defaultItems;
  @override
  DateTime get createdAt;
  @override
  String? get description;
  @override
  String? get imageUrl;
  @override
  int? get maxParticipants;
  @override
  PaymentSplitType? get defaultSplitType;
  @override
  List<String> get tags;
  @override
  int get useCount;
  @override
  bool get isActive;
  @override
  Map<String, dynamic>? get templateSettings;

  /// Create a copy of GroupOrderTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupOrderTemplateImplCopyWith<_$GroupOrderTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GroupOrderStats _$GroupOrderStatsFromJson(Map<String, dynamic> json) {
  return _GroupOrderStats.fromJson(json);
}

/// @nodoc
mixin _$GroupOrderStats {
  String get userId => throw _privateConstructorUsedError;
  int get totalGroupOrders => throw _privateConstructorUsedError;
  int get organizedOrders => throw _privateConstructorUsedError;
  int get participatedOrders => throw _privateConstructorUsedError;
  double get totalSpent => throw _privateConstructorUsedError;
  double get averageOrderValue => throw _privateConstructorUsedError;
  String get favoriteRestaurant => throw _privateConstructorUsedError;
  List<String> get frequentParticipants => throw _privateConstructorUsedError;
  DateTime? get lastGroupOrder => throw _privateConstructorUsedError;
  Map<String, int>? get restaurantOrderCounts =>
      throw _privateConstructorUsedError;
  Map<String, double>? get monthlySpending =>
      throw _privateConstructorUsedError;

  /// Serializes this GroupOrderStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupOrderStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupOrderStatsCopyWith<GroupOrderStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupOrderStatsCopyWith<$Res> {
  factory $GroupOrderStatsCopyWith(
          GroupOrderStats value, $Res Function(GroupOrderStats) then) =
      _$GroupOrderStatsCopyWithImpl<$Res, GroupOrderStats>;
  @useResult
  $Res call(
      {String userId,
      int totalGroupOrders,
      int organizedOrders,
      int participatedOrders,
      double totalSpent,
      double averageOrderValue,
      String favoriteRestaurant,
      List<String> frequentParticipants,
      DateTime? lastGroupOrder,
      Map<String, int>? restaurantOrderCounts,
      Map<String, double>? monthlySpending});
}

/// @nodoc
class _$GroupOrderStatsCopyWithImpl<$Res, $Val extends GroupOrderStats>
    implements $GroupOrderStatsCopyWith<$Res> {
  _$GroupOrderStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupOrderStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? totalGroupOrders = null,
    Object? organizedOrders = null,
    Object? participatedOrders = null,
    Object? totalSpent = null,
    Object? averageOrderValue = null,
    Object? favoriteRestaurant = null,
    Object? frequentParticipants = null,
    Object? lastGroupOrder = freezed,
    Object? restaurantOrderCounts = freezed,
    Object? monthlySpending = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalGroupOrders: null == totalGroupOrders
          ? _value.totalGroupOrders
          : totalGroupOrders // ignore: cast_nullable_to_non_nullable
              as int,
      organizedOrders: null == organizedOrders
          ? _value.organizedOrders
          : organizedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      participatedOrders: null == participatedOrders
          ? _value.participatedOrders
          : participatedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      favoriteRestaurant: null == favoriteRestaurant
          ? _value.favoriteRestaurant
          : favoriteRestaurant // ignore: cast_nullable_to_non_nullable
              as String,
      frequentParticipants: null == frequentParticipants
          ? _value.frequentParticipants
          : frequentParticipants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastGroupOrder: freezed == lastGroupOrder
          ? _value.lastGroupOrder
          : lastGroupOrder // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      restaurantOrderCounts: freezed == restaurantOrderCounts
          ? _value.restaurantOrderCounts
          : restaurantOrderCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      monthlySpending: freezed == monthlySpending
          ? _value.monthlySpending
          : monthlySpending // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupOrderStatsImplCopyWith<$Res>
    implements $GroupOrderStatsCopyWith<$Res> {
  factory _$$GroupOrderStatsImplCopyWith(_$GroupOrderStatsImpl value,
          $Res Function(_$GroupOrderStatsImpl) then) =
      __$$GroupOrderStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      int totalGroupOrders,
      int organizedOrders,
      int participatedOrders,
      double totalSpent,
      double averageOrderValue,
      String favoriteRestaurant,
      List<String> frequentParticipants,
      DateTime? lastGroupOrder,
      Map<String, int>? restaurantOrderCounts,
      Map<String, double>? monthlySpending});
}

/// @nodoc
class __$$GroupOrderStatsImplCopyWithImpl<$Res>
    extends _$GroupOrderStatsCopyWithImpl<$Res, _$GroupOrderStatsImpl>
    implements _$$GroupOrderStatsImplCopyWith<$Res> {
  __$$GroupOrderStatsImplCopyWithImpl(
      _$GroupOrderStatsImpl _value, $Res Function(_$GroupOrderStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupOrderStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? totalGroupOrders = null,
    Object? organizedOrders = null,
    Object? participatedOrders = null,
    Object? totalSpent = null,
    Object? averageOrderValue = null,
    Object? favoriteRestaurant = null,
    Object? frequentParticipants = null,
    Object? lastGroupOrder = freezed,
    Object? restaurantOrderCounts = freezed,
    Object? monthlySpending = freezed,
  }) {
    return _then(_$GroupOrderStatsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalGroupOrders: null == totalGroupOrders
          ? _value.totalGroupOrders
          : totalGroupOrders // ignore: cast_nullable_to_non_nullable
              as int,
      organizedOrders: null == organizedOrders
          ? _value.organizedOrders
          : organizedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      participatedOrders: null == participatedOrders
          ? _value.participatedOrders
          : participatedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      favoriteRestaurant: null == favoriteRestaurant
          ? _value.favoriteRestaurant
          : favoriteRestaurant // ignore: cast_nullable_to_non_nullable
              as String,
      frequentParticipants: null == frequentParticipants
          ? _value._frequentParticipants
          : frequentParticipants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastGroupOrder: freezed == lastGroupOrder
          ? _value.lastGroupOrder
          : lastGroupOrder // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      restaurantOrderCounts: freezed == restaurantOrderCounts
          ? _value._restaurantOrderCounts
          : restaurantOrderCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      monthlySpending: freezed == monthlySpending
          ? _value._monthlySpending
          : monthlySpending // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupOrderStatsImpl implements _GroupOrderStats {
  const _$GroupOrderStatsImpl(
      {required this.userId,
      required this.totalGroupOrders,
      required this.organizedOrders,
      required this.participatedOrders,
      required this.totalSpent,
      required this.averageOrderValue,
      required this.favoriteRestaurant,
      required final List<String> frequentParticipants,
      this.lastGroupOrder,
      final Map<String, int>? restaurantOrderCounts,
      final Map<String, double>? monthlySpending})
      : _frequentParticipants = frequentParticipants,
        _restaurantOrderCounts = restaurantOrderCounts,
        _monthlySpending = monthlySpending;

  factory _$GroupOrderStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupOrderStatsImplFromJson(json);

  @override
  final String userId;
  @override
  final int totalGroupOrders;
  @override
  final int organizedOrders;
  @override
  final int participatedOrders;
  @override
  final double totalSpent;
  @override
  final double averageOrderValue;
  @override
  final String favoriteRestaurant;
  final List<String> _frequentParticipants;
  @override
  List<String> get frequentParticipants {
    if (_frequentParticipants is EqualUnmodifiableListView)
      return _frequentParticipants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_frequentParticipants);
  }

  @override
  final DateTime? lastGroupOrder;
  final Map<String, int>? _restaurantOrderCounts;
  @override
  Map<String, int>? get restaurantOrderCounts {
    final value = _restaurantOrderCounts;
    if (value == null) return null;
    if (_restaurantOrderCounts is EqualUnmodifiableMapView)
      return _restaurantOrderCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, double>? _monthlySpending;
  @override
  Map<String, double>? get monthlySpending {
    final value = _monthlySpending;
    if (value == null) return null;
    if (_monthlySpending is EqualUnmodifiableMapView) return _monthlySpending;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'GroupOrderStats(userId: $userId, totalGroupOrders: $totalGroupOrders, organizedOrders: $organizedOrders, participatedOrders: $participatedOrders, totalSpent: $totalSpent, averageOrderValue: $averageOrderValue, favoriteRestaurant: $favoriteRestaurant, frequentParticipants: $frequentParticipants, lastGroupOrder: $lastGroupOrder, restaurantOrderCounts: $restaurantOrderCounts, monthlySpending: $monthlySpending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupOrderStatsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.totalGroupOrders, totalGroupOrders) ||
                other.totalGroupOrders == totalGroupOrders) &&
            (identical(other.organizedOrders, organizedOrders) ||
                other.organizedOrders == organizedOrders) &&
            (identical(other.participatedOrders, participatedOrders) ||
                other.participatedOrders == participatedOrders) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.averageOrderValue, averageOrderValue) ||
                other.averageOrderValue == averageOrderValue) &&
            (identical(other.favoriteRestaurant, favoriteRestaurant) ||
                other.favoriteRestaurant == favoriteRestaurant) &&
            const DeepCollectionEquality()
                .equals(other._frequentParticipants, _frequentParticipants) &&
            (identical(other.lastGroupOrder, lastGroupOrder) ||
                other.lastGroupOrder == lastGroupOrder) &&
            const DeepCollectionEquality()
                .equals(other._restaurantOrderCounts, _restaurantOrderCounts) &&
            const DeepCollectionEquality()
                .equals(other._monthlySpending, _monthlySpending));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      totalGroupOrders,
      organizedOrders,
      participatedOrders,
      totalSpent,
      averageOrderValue,
      favoriteRestaurant,
      const DeepCollectionEquality().hash(_frequentParticipants),
      lastGroupOrder,
      const DeepCollectionEquality().hash(_restaurantOrderCounts),
      const DeepCollectionEquality().hash(_monthlySpending));

  /// Create a copy of GroupOrderStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupOrderStatsImplCopyWith<_$GroupOrderStatsImpl> get copyWith =>
      __$$GroupOrderStatsImplCopyWithImpl<_$GroupOrderStatsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupOrderStatsImplToJson(
      this,
    );
  }
}

abstract class _GroupOrderStats implements GroupOrderStats {
  const factory _GroupOrderStats(
      {required final String userId,
      required final int totalGroupOrders,
      required final int organizedOrders,
      required final int participatedOrders,
      required final double totalSpent,
      required final double averageOrderValue,
      required final String favoriteRestaurant,
      required final List<String> frequentParticipants,
      final DateTime? lastGroupOrder,
      final Map<String, int>? restaurantOrderCounts,
      final Map<String, double>? monthlySpending}) = _$GroupOrderStatsImpl;

  factory _GroupOrderStats.fromJson(Map<String, dynamic> json) =
      _$GroupOrderStatsImpl.fromJson;

  @override
  String get userId;
  @override
  int get totalGroupOrders;
  @override
  int get organizedOrders;
  @override
  int get participatedOrders;
  @override
  double get totalSpent;
  @override
  double get averageOrderValue;
  @override
  String get favoriteRestaurant;
  @override
  List<String> get frequentParticipants;
  @override
  DateTime? get lastGroupOrder;
  @override
  Map<String, int>? get restaurantOrderCounts;
  @override
  Map<String, double>? get monthlySpending;

  /// Create a copy of GroupOrderStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupOrderStatsImplCopyWith<_$GroupOrderStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
