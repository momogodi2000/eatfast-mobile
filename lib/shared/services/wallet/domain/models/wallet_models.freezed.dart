// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Wallet _$WalletFromJson(Map<String, dynamic> json) {
  return _Wallet.fromJson(json);
}

/// @nodoc
mixin _$Wallet {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Wallet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Wallet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletCopyWith<Wallet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletCopyWith<$Res> {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) then) =
      _$WalletCopyWithImpl<$Res, Wallet>;
  @useResult
  $Res call(
      {String id,
      String userId,
      double balance,
      String currency,
      bool isActive,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$WalletCopyWithImpl<$Res, $Val extends Wallet>
    implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Wallet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? balance = null,
    Object? currency = null,
    Object? isActive = null,
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
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$WalletImplCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$$WalletImplCopyWith(
          _$WalletImpl value, $Res Function(_$WalletImpl) then) =
      __$$WalletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      double balance,
      String currency,
      bool isActive,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$WalletImplCopyWithImpl<$Res>
    extends _$WalletCopyWithImpl<$Res, _$WalletImpl>
    implements _$$WalletImplCopyWith<$Res> {
  __$$WalletImplCopyWithImpl(
      _$WalletImpl _value, $Res Function(_$WalletImpl) _then)
      : super(_value, _then);

  /// Create a copy of Wallet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? balance = null,
    Object? currency = null,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$WalletImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$WalletImpl implements _Wallet {
  const _$WalletImpl(
      {required this.id,
      required this.userId,
      required this.balance,
      required this.currency,
      this.isActive = false,
      this.createdAt,
      this.updatedAt});

  factory _$WalletImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final double balance;
  @override
  final String currency;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Wallet(id: $id, userId: $userId, balance: $balance, currency: $currency, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, balance, currency,
      isActive, createdAt, updatedAt);

  /// Create a copy of Wallet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletImplCopyWith<_$WalletImpl> get copyWith =>
      __$$WalletImplCopyWithImpl<_$WalletImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletImplToJson(
      this,
    );
  }
}

abstract class _Wallet implements Wallet {
  const factory _Wallet(
      {required final String id,
      required final String userId,
      required final double balance,
      required final String currency,
      final bool isActive,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$WalletImpl;

  factory _Wallet.fromJson(Map<String, dynamic> json) = _$WalletImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  double get balance;
  @override
  String get currency;
  @override
  bool get isActive;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Wallet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletImplCopyWith<_$WalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WalletTransaction _$WalletTransactionFromJson(Map<String, dynamic> json) {
  return _WalletTransaction.fromJson(json);
}

/// @nodoc
mixin _$WalletTransaction {
  String get id => throw _privateConstructorUsedError;
  String get walletId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError; // 'credit', 'debit'
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get reference => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this WalletTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletTransactionCopyWith<WalletTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletTransactionCopyWith<$Res> {
  factory $WalletTransactionCopyWith(
          WalletTransaction value, $Res Function(WalletTransaction) then) =
      _$WalletTransactionCopyWithImpl<$Res, WalletTransaction>;
  @useResult
  $Res call(
      {String id,
      String walletId,
      String type,
      double amount,
      String currency,
      String description,
      String? reference,
      String? status,
      String? paymentMethod,
      Map<String, dynamic>? metadata,
      DateTime createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$WalletTransactionCopyWithImpl<$Res, $Val extends WalletTransaction>
    implements $WalletTransactionCopyWith<$Res> {
  _$WalletTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? walletId = null,
    Object? type = null,
    Object? amount = null,
    Object? currency = null,
    Object? description = null,
    Object? reference = freezed,
    Object? status = freezed,
    Object? paymentMethod = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      walletId: null == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
}

/// @nodoc
abstract class _$$WalletTransactionImplCopyWith<$Res>
    implements $WalletTransactionCopyWith<$Res> {
  factory _$$WalletTransactionImplCopyWith(_$WalletTransactionImpl value,
          $Res Function(_$WalletTransactionImpl) then) =
      __$$WalletTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String walletId,
      String type,
      double amount,
      String currency,
      String description,
      String? reference,
      String? status,
      String? paymentMethod,
      Map<String, dynamic>? metadata,
      DateTime createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$WalletTransactionImplCopyWithImpl<$Res>
    extends _$WalletTransactionCopyWithImpl<$Res, _$WalletTransactionImpl>
    implements _$$WalletTransactionImplCopyWith<$Res> {
  __$$WalletTransactionImplCopyWithImpl(_$WalletTransactionImpl _value,
      $Res Function(_$WalletTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? walletId = null,
    Object? type = null,
    Object? amount = null,
    Object? currency = null,
    Object? description = null,
    Object? reference = freezed,
    Object? status = freezed,
    Object? paymentMethod = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$WalletTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      walletId: null == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
class _$WalletTransactionImpl implements _WalletTransaction {
  const _$WalletTransactionImpl(
      {required this.id,
      required this.walletId,
      required this.type,
      required this.amount,
      required this.currency,
      required this.description,
      this.reference,
      this.status,
      this.paymentMethod,
      final Map<String, dynamic>? metadata,
      required this.createdAt,
      this.updatedAt})
      : _metadata = metadata;

  factory _$WalletTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletTransactionImplFromJson(json);

  @override
  final String id;
  @override
  final String walletId;
  @override
  final String type;
// 'credit', 'debit'
  @override
  final double amount;
  @override
  final String currency;
  @override
  final String description;
  @override
  final String? reference;
  @override
  final String? status;
  @override
  final String? paymentMethod;
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
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'WalletTransaction(id: $id, walletId: $walletId, type: $type, amount: $amount, currency: $currency, description: $description, reference: $reference, status: $status, paymentMethod: $paymentMethod, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      walletId,
      type,
      amount,
      currency,
      description,
      reference,
      status,
      paymentMethod,
      const DeepCollectionEquality().hash(_metadata),
      createdAt,
      updatedAt);

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletTransactionImplCopyWith<_$WalletTransactionImpl> get copyWith =>
      __$$WalletTransactionImplCopyWithImpl<_$WalletTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletTransactionImplToJson(
      this,
    );
  }
}

abstract class _WalletTransaction implements WalletTransaction {
  const factory _WalletTransaction(
      {required final String id,
      required final String walletId,
      required final String type,
      required final double amount,
      required final String currency,
      required final String description,
      final String? reference,
      final String? status,
      final String? paymentMethod,
      final Map<String, dynamic>? metadata,
      required final DateTime createdAt,
      final DateTime? updatedAt}) = _$WalletTransactionImpl;

  factory _WalletTransaction.fromJson(Map<String, dynamic> json) =
      _$WalletTransactionImpl.fromJson;

  @override
  String get id;
  @override
  String get walletId;
  @override
  String get type; // 'credit', 'debit'
  @override
  double get amount;
  @override
  String get currency;
  @override
  String get description;
  @override
  String? get reference;
  @override
  String? get status;
  @override
  String? get paymentMethod;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletTransactionImplCopyWith<_$WalletTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WalletTopupRequest _$WalletTopupRequestFromJson(Map<String, dynamic> json) {
  return _WalletTopupRequest.fromJson(json);
}

/// @nodoc
mixin _$WalletTopupRequest {
  double get amount => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get reference => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;

  /// Serializes this WalletTopupRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletTopupRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletTopupRequestCopyWith<WalletTopupRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletTopupRequestCopyWith<$Res> {
  factory $WalletTopupRequestCopyWith(
          WalletTopupRequest value, $Res Function(WalletTopupRequest) then) =
      _$WalletTopupRequestCopyWithImpl<$Res, WalletTopupRequest>;
  @useResult
  $Res call(
      {double amount,
      String description,
      String? reference,
      String paymentMethod});
}

/// @nodoc
class _$WalletTopupRequestCopyWithImpl<$Res, $Val extends WalletTopupRequest>
    implements $WalletTopupRequestCopyWith<$Res> {
  _$WalletTopupRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletTopupRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? description = null,
    Object? reference = freezed,
    Object? paymentMethod = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletTopupRequestImplCopyWith<$Res>
    implements $WalletTopupRequestCopyWith<$Res> {
  factory _$$WalletTopupRequestImplCopyWith(_$WalletTopupRequestImpl value,
          $Res Function(_$WalletTopupRequestImpl) then) =
      __$$WalletTopupRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double amount,
      String description,
      String? reference,
      String paymentMethod});
}

/// @nodoc
class __$$WalletTopupRequestImplCopyWithImpl<$Res>
    extends _$WalletTopupRequestCopyWithImpl<$Res, _$WalletTopupRequestImpl>
    implements _$$WalletTopupRequestImplCopyWith<$Res> {
  __$$WalletTopupRequestImplCopyWithImpl(_$WalletTopupRequestImpl _value,
      $Res Function(_$WalletTopupRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletTopupRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? description = null,
    Object? reference = freezed,
    Object? paymentMethod = null,
  }) {
    return _then(_$WalletTopupRequestImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletTopupRequestImpl implements _WalletTopupRequest {
  const _$WalletTopupRequestImpl(
      {required this.amount,
      required this.description,
      this.reference,
      this.paymentMethod = 'campay'});

  factory _$WalletTopupRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletTopupRequestImplFromJson(json);

  @override
  final double amount;
  @override
  final String description;
  @override
  final String? reference;
  @override
  @JsonKey()
  final String paymentMethod;

  @override
  String toString() {
    return 'WalletTopupRequest(amount: $amount, description: $description, reference: $reference, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletTopupRequestImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, description, reference, paymentMethod);

  /// Create a copy of WalletTopupRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletTopupRequestImplCopyWith<_$WalletTopupRequestImpl> get copyWith =>
      __$$WalletTopupRequestImplCopyWithImpl<_$WalletTopupRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletTopupRequestImplToJson(
      this,
    );
  }
}

abstract class _WalletTopupRequest implements WalletTopupRequest {
  const factory _WalletTopupRequest(
      {required final double amount,
      required final String description,
      final String? reference,
      final String paymentMethod}) = _$WalletTopupRequestImpl;

  factory _WalletTopupRequest.fromJson(Map<String, dynamic> json) =
      _$WalletTopupRequestImpl.fromJson;

  @override
  double get amount;
  @override
  String get description;
  @override
  String? get reference;
  @override
  String get paymentMethod;

  /// Create a copy of WalletTopupRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletTopupRequestImplCopyWith<_$WalletTopupRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WalletWithdrawRequest _$WalletWithdrawRequestFromJson(
    Map<String, dynamic> json) {
  return _WalletWithdrawRequest.fromJson(json);
}

/// @nodoc
mixin _$WalletWithdrawRequest {
  double get amount => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get reference => throw _privateConstructorUsedError;
  String get withdrawMethod => throw _privateConstructorUsedError;
  Map<String, dynamic>? get withdrawDetails =>
      throw _privateConstructorUsedError;

  /// Serializes this WalletWithdrawRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletWithdrawRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletWithdrawRequestCopyWith<WalletWithdrawRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletWithdrawRequestCopyWith<$Res> {
  factory $WalletWithdrawRequestCopyWith(WalletWithdrawRequest value,
          $Res Function(WalletWithdrawRequest) then) =
      _$WalletWithdrawRequestCopyWithImpl<$Res, WalletWithdrawRequest>;
  @useResult
  $Res call(
      {double amount,
      String description,
      String? reference,
      String withdrawMethod,
      Map<String, dynamic>? withdrawDetails});
}

/// @nodoc
class _$WalletWithdrawRequestCopyWithImpl<$Res,
        $Val extends WalletWithdrawRequest>
    implements $WalletWithdrawRequestCopyWith<$Res> {
  _$WalletWithdrawRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletWithdrawRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? description = null,
    Object? reference = freezed,
    Object? withdrawMethod = null,
    Object? withdrawDetails = freezed,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      withdrawMethod: null == withdrawMethod
          ? _value.withdrawMethod
          : withdrawMethod // ignore: cast_nullable_to_non_nullable
              as String,
      withdrawDetails: freezed == withdrawDetails
          ? _value.withdrawDetails
          : withdrawDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletWithdrawRequestImplCopyWith<$Res>
    implements $WalletWithdrawRequestCopyWith<$Res> {
  factory _$$WalletWithdrawRequestImplCopyWith(
          _$WalletWithdrawRequestImpl value,
          $Res Function(_$WalletWithdrawRequestImpl) then) =
      __$$WalletWithdrawRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double amount,
      String description,
      String? reference,
      String withdrawMethod,
      Map<String, dynamic>? withdrawDetails});
}

/// @nodoc
class __$$WalletWithdrawRequestImplCopyWithImpl<$Res>
    extends _$WalletWithdrawRequestCopyWithImpl<$Res,
        _$WalletWithdrawRequestImpl>
    implements _$$WalletWithdrawRequestImplCopyWith<$Res> {
  __$$WalletWithdrawRequestImplCopyWithImpl(_$WalletWithdrawRequestImpl _value,
      $Res Function(_$WalletWithdrawRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletWithdrawRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? description = null,
    Object? reference = freezed,
    Object? withdrawMethod = null,
    Object? withdrawDetails = freezed,
  }) {
    return _then(_$WalletWithdrawRequestImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      withdrawMethod: null == withdrawMethod
          ? _value.withdrawMethod
          : withdrawMethod // ignore: cast_nullable_to_non_nullable
              as String,
      withdrawDetails: freezed == withdrawDetails
          ? _value._withdrawDetails
          : withdrawDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletWithdrawRequestImpl implements _WalletWithdrawRequest {
  const _$WalletWithdrawRequestImpl(
      {required this.amount,
      required this.description,
      this.reference,
      this.withdrawMethod = 'bank_transfer',
      final Map<String, dynamic>? withdrawDetails})
      : _withdrawDetails = withdrawDetails;

  factory _$WalletWithdrawRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletWithdrawRequestImplFromJson(json);

  @override
  final double amount;
  @override
  final String description;
  @override
  final String? reference;
  @override
  @JsonKey()
  final String withdrawMethod;
  final Map<String, dynamic>? _withdrawDetails;
  @override
  Map<String, dynamic>? get withdrawDetails {
    final value = _withdrawDetails;
    if (value == null) return null;
    if (_withdrawDetails is EqualUnmodifiableMapView) return _withdrawDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'WalletWithdrawRequest(amount: $amount, description: $description, reference: $reference, withdrawMethod: $withdrawMethod, withdrawDetails: $withdrawDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletWithdrawRequestImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.withdrawMethod, withdrawMethod) ||
                other.withdrawMethod == withdrawMethod) &&
            const DeepCollectionEquality()
                .equals(other._withdrawDetails, _withdrawDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, description, reference,
      withdrawMethod, const DeepCollectionEquality().hash(_withdrawDetails));

  /// Create a copy of WalletWithdrawRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletWithdrawRequestImplCopyWith<_$WalletWithdrawRequestImpl>
      get copyWith => __$$WalletWithdrawRequestImplCopyWithImpl<
          _$WalletWithdrawRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletWithdrawRequestImplToJson(
      this,
    );
  }
}

abstract class _WalletWithdrawRequest implements WalletWithdrawRequest {
  const factory _WalletWithdrawRequest(
          {required final double amount,
          required final String description,
          final String? reference,
          final String withdrawMethod,
          final Map<String, dynamic>? withdrawDetails}) =
      _$WalletWithdrawRequestImpl;

  factory _WalletWithdrawRequest.fromJson(Map<String, dynamic> json) =
      _$WalletWithdrawRequestImpl.fromJson;

  @override
  double get amount;
  @override
  String get description;
  @override
  String? get reference;
  @override
  String get withdrawMethod;
  @override
  Map<String, dynamic>? get withdrawDetails;

  /// Create a copy of WalletWithdrawRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletWithdrawRequestImplCopyWith<_$WalletWithdrawRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WalletResponse _$WalletResponseFromJson(Map<String, dynamic> json) {
  return _WalletResponse.fromJson(json);
}

/// @nodoc
mixin _$WalletResponse {
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Wallet? get data => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this WalletResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletResponseCopyWith<WalletResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletResponseCopyWith<$Res> {
  factory $WalletResponseCopyWith(
          WalletResponse value, $Res Function(WalletResponse) then) =
      _$WalletResponseCopyWithImpl<$Res, WalletResponse>;
  @useResult
  $Res call({bool success, String? message, Wallet? data, String? error});

  $WalletCopyWith<$Res>? get data;
}

/// @nodoc
class _$WalletResponseCopyWithImpl<$Res, $Val extends WalletResponse>
    implements $WalletResponseCopyWith<$Res> {
  _$WalletResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletResponse
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
              as Wallet?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of WalletResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $WalletCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WalletResponseImplCopyWith<$Res>
    implements $WalletResponseCopyWith<$Res> {
  factory _$$WalletResponseImplCopyWith(_$WalletResponseImpl value,
          $Res Function(_$WalletResponseImpl) then) =
      __$$WalletResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String? message, Wallet? data, String? error});

  @override
  $WalletCopyWith<$Res>? get data;
}

/// @nodoc
class __$$WalletResponseImplCopyWithImpl<$Res>
    extends _$WalletResponseCopyWithImpl<$Res, _$WalletResponseImpl>
    implements _$$WalletResponseImplCopyWith<$Res> {
  __$$WalletResponseImplCopyWithImpl(
      _$WalletResponseImpl _value, $Res Function(_$WalletResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$WalletResponseImpl(
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
              as Wallet?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletResponseImpl implements _WalletResponse {
  const _$WalletResponseImpl(
      {required this.success, this.message, this.data, this.error});

  factory _$WalletResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String? message;
  @override
  final Wallet? data;
  @override
  final String? error;

  @override
  String toString() {
    return 'WalletResponse(success: $success, message: $message, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data, error);

  /// Create a copy of WalletResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletResponseImplCopyWith<_$WalletResponseImpl> get copyWith =>
      __$$WalletResponseImplCopyWithImpl<_$WalletResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletResponseImplToJson(
      this,
    );
  }
}

abstract class _WalletResponse implements WalletResponse {
  const factory _WalletResponse(
      {required final bool success,
      final String? message,
      final Wallet? data,
      final String? error}) = _$WalletResponseImpl;

  factory _WalletResponse.fromJson(Map<String, dynamic> json) =
      _$WalletResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String? get message;
  @override
  Wallet? get data;
  @override
  String? get error;

  /// Create a copy of WalletResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletResponseImplCopyWith<_$WalletResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WalletTransactionsResponse _$WalletTransactionsResponseFromJson(
    Map<String, dynamic> json) {
  return _WalletTransactionsResponse.fromJson(json);
}

/// @nodoc
mixin _$WalletTransactionsResponse {
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<WalletTransaction>? get data => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  Map<String, dynamic>? get pagination => throw _privateConstructorUsedError;

  /// Serializes this WalletTransactionsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletTransactionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletTransactionsResponseCopyWith<WalletTransactionsResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletTransactionsResponseCopyWith<$Res> {
  factory $WalletTransactionsResponseCopyWith(WalletTransactionsResponse value,
          $Res Function(WalletTransactionsResponse) then) =
      _$WalletTransactionsResponseCopyWithImpl<$Res,
          WalletTransactionsResponse>;
  @useResult
  $Res call(
      {bool success,
      String? message,
      List<WalletTransaction>? data,
      String? error,
      Map<String, dynamic>? pagination});
}

/// @nodoc
class _$WalletTransactionsResponseCopyWithImpl<$Res,
        $Val extends WalletTransactionsResponse>
    implements $WalletTransactionsResponseCopyWith<$Res> {
  _$WalletTransactionsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletTransactionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = freezed,
    Object? error = freezed,
    Object? pagination = freezed,
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
              as List<WalletTransaction>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletTransactionsResponseImplCopyWith<$Res>
    implements $WalletTransactionsResponseCopyWith<$Res> {
  factory _$$WalletTransactionsResponseImplCopyWith(
          _$WalletTransactionsResponseImpl value,
          $Res Function(_$WalletTransactionsResponseImpl) then) =
      __$$WalletTransactionsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      String? message,
      List<WalletTransaction>? data,
      String? error,
      Map<String, dynamic>? pagination});
}

/// @nodoc
class __$$WalletTransactionsResponseImplCopyWithImpl<$Res>
    extends _$WalletTransactionsResponseCopyWithImpl<$Res,
        _$WalletTransactionsResponseImpl>
    implements _$$WalletTransactionsResponseImplCopyWith<$Res> {
  __$$WalletTransactionsResponseImplCopyWithImpl(
      _$WalletTransactionsResponseImpl _value,
      $Res Function(_$WalletTransactionsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletTransactionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = freezed,
    Object? error = freezed,
    Object? pagination = freezed,
  }) {
    return _then(_$WalletTransactionsResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WalletTransaction>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      pagination: freezed == pagination
          ? _value._pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletTransactionsResponseImpl implements _WalletTransactionsResponse {
  const _$WalletTransactionsResponseImpl(
      {required this.success,
      this.message,
      final List<WalletTransaction>? data,
      this.error,
      final Map<String, dynamic>? pagination})
      : _data = data,
        _pagination = pagination;

  factory _$WalletTransactionsResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$WalletTransactionsResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String? message;
  final List<WalletTransaction>? _data;
  @override
  List<WalletTransaction>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? error;
  final Map<String, dynamic>? _pagination;
  @override
  Map<String, dynamic>? get pagination {
    final value = _pagination;
    if (value == null) return null;
    if (_pagination is EqualUnmodifiableMapView) return _pagination;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'WalletTransactionsResponse(success: $success, message: $message, data: $data, error: $error, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletTransactionsResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._pagination, _pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      success,
      message,
      const DeepCollectionEquality().hash(_data),
      error,
      const DeepCollectionEquality().hash(_pagination));

  /// Create a copy of WalletTransactionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletTransactionsResponseImplCopyWith<_$WalletTransactionsResponseImpl>
      get copyWith => __$$WalletTransactionsResponseImplCopyWithImpl<
          _$WalletTransactionsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletTransactionsResponseImplToJson(
      this,
    );
  }
}

abstract class _WalletTransactionsResponse
    implements WalletTransactionsResponse {
  const factory _WalletTransactionsResponse(
          {required final bool success,
          final String? message,
          final List<WalletTransaction>? data,
          final String? error,
          final Map<String, dynamic>? pagination}) =
      _$WalletTransactionsResponseImpl;

  factory _WalletTransactionsResponse.fromJson(Map<String, dynamic> json) =
      _$WalletTransactionsResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String? get message;
  @override
  List<WalletTransaction>? get data;
  @override
  String? get error;
  @override
  Map<String, dynamic>? get pagination;

  /// Create a copy of WalletTransactionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletTransactionsResponseImplCopyWith<_$WalletTransactionsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
