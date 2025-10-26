// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FavoriteItem _$FavoriteItemFromJson(Map<String, dynamic> json) {
  return _FavoriteItem.fromJson(json);
}

/// @nodoc
mixin _$FavoriteItem {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get itemId => throw _privateConstructorUsedError;
  FavoriteType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime get createdAt =>
      throw _privateConstructorUsedError; // Additional properties for restaurant/dish favorites
  String? get restaurantName => throw _privateConstructorUsedError;
  String? get restaurantId => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  int? get reviewCount => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;

  /// Serializes this FavoriteItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FavoriteItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavoriteItemCopyWith<FavoriteItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteItemCopyWith<$Res> {
  factory $FavoriteItemCopyWith(
          FavoriteItem value, $Res Function(FavoriteItem) then) =
      _$FavoriteItemCopyWithImpl<$Res, FavoriteItem>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String itemId,
      FavoriteType type,
      String name,
      String? description,
      String? imageUrl,
      Map<String, dynamic>? metadata,
      DateTime createdAt,
      String? restaurantName,
      String? restaurantId,
      double? rating,
      int? reviewCount,
      double? price});
}

/// @nodoc
class _$FavoriteItemCopyWithImpl<$Res, $Val extends FavoriteItem>
    implements $FavoriteItemCopyWith<$Res> {
  _$FavoriteItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? itemId = null,
    Object? type = null,
    Object? name = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
    Object? restaurantName = freezed,
    Object? restaurantId = freezed,
    Object? rating = freezed,
    Object? reviewCount = freezed,
    Object? price = freezed,
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
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FavoriteType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      restaurantName: freezed == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurantId: freezed == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      reviewCount: freezed == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteItemImplCopyWith<$Res>
    implements $FavoriteItemCopyWith<$Res> {
  factory _$$FavoriteItemImplCopyWith(
          _$FavoriteItemImpl value, $Res Function(_$FavoriteItemImpl) then) =
      __$$FavoriteItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String itemId,
      FavoriteType type,
      String name,
      String? description,
      String? imageUrl,
      Map<String, dynamic>? metadata,
      DateTime createdAt,
      String? restaurantName,
      String? restaurantId,
      double? rating,
      int? reviewCount,
      double? price});
}

/// @nodoc
class __$$FavoriteItemImplCopyWithImpl<$Res>
    extends _$FavoriteItemCopyWithImpl<$Res, _$FavoriteItemImpl>
    implements _$$FavoriteItemImplCopyWith<$Res> {
  __$$FavoriteItemImplCopyWithImpl(
      _$FavoriteItemImpl _value, $Res Function(_$FavoriteItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? itemId = null,
    Object? type = null,
    Object? name = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
    Object? restaurantName = freezed,
    Object? restaurantId = freezed,
    Object? rating = freezed,
    Object? reviewCount = freezed,
    Object? price = freezed,
  }) {
    return _then(_$FavoriteItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FavoriteType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      restaurantName: freezed == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurantId: freezed == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      reviewCount: freezed == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteItemImpl extends _FavoriteItem {
  const _$FavoriteItemImpl(
      {required this.id,
      required this.userId,
      required this.itemId,
      required this.type,
      required this.name,
      this.description,
      this.imageUrl,
      final Map<String, dynamic>? metadata,
      required this.createdAt,
      this.restaurantName,
      this.restaurantId,
      this.rating,
      this.reviewCount,
      this.price})
      : _metadata = metadata,
        super._();

  factory _$FavoriteItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteItemImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String itemId;
  @override
  final FavoriteType type;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? imageUrl;
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
// Additional properties for restaurant/dish favorites
  @override
  final String? restaurantName;
  @override
  final String? restaurantId;
  @override
  final double? rating;
  @override
  final int? reviewCount;
  @override
  final double? price;

  @override
  String toString() {
    return 'FavoriteItem(id: $id, userId: $userId, itemId: $itemId, type: $type, name: $name, description: $description, imageUrl: $imageUrl, metadata: $metadata, createdAt: $createdAt, restaurantName: $restaurantName, restaurantId: $restaurantId, rating: $rating, reviewCount: $reviewCount, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      itemId,
      type,
      name,
      description,
      imageUrl,
      const DeepCollectionEquality().hash(_metadata),
      createdAt,
      restaurantName,
      restaurantId,
      rating,
      reviewCount,
      price);

  /// Create a copy of FavoriteItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteItemImplCopyWith<_$FavoriteItemImpl> get copyWith =>
      __$$FavoriteItemImplCopyWithImpl<_$FavoriteItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteItemImplToJson(
      this,
    );
  }
}

abstract class _FavoriteItem extends FavoriteItem {
  const factory _FavoriteItem(
      {required final String id,
      required final String userId,
      required final String itemId,
      required final FavoriteType type,
      required final String name,
      final String? description,
      final String? imageUrl,
      final Map<String, dynamic>? metadata,
      required final DateTime createdAt,
      final String? restaurantName,
      final String? restaurantId,
      final double? rating,
      final int? reviewCount,
      final double? price}) = _$FavoriteItemImpl;
  const _FavoriteItem._() : super._();

  factory _FavoriteItem.fromJson(Map<String, dynamic> json) =
      _$FavoriteItemImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get itemId;
  @override
  FavoriteType get type;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get imageUrl;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime get createdAt; // Additional properties for restaurant/dish favorites
  @override
  String? get restaurantName;
  @override
  String? get restaurantId;
  @override
  double? get rating;
  @override
  int? get reviewCount;
  @override
  double? get price;

  /// Create a copy of FavoriteItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoriteItemImplCopyWith<_$FavoriteItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReorderItem _$ReorderItemFromJson(Map<String, dynamic> json) {
  return _ReorderItem.fromJson(json);
}

/// @nodoc
mixin _$ReorderItem {
  String get orderId => throw _privateConstructorUsedError;
  String get restaurantName => throw _privateConstructorUsedError;
  String get restaurantImage => throw _privateConstructorUsedError;
  String get itemSummary => throw _privateConstructorUsedError;
  String get formattedTotal => throw _privateConstructorUsedError;
  String get orderDate => throw _privateConstructorUsedError;

  /// Serializes this ReorderItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReorderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReorderItemCopyWith<ReorderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReorderItemCopyWith<$Res> {
  factory $ReorderItemCopyWith(
          ReorderItem value, $Res Function(ReorderItem) then) =
      _$ReorderItemCopyWithImpl<$Res, ReorderItem>;
  @useResult
  $Res call(
      {String orderId,
      String restaurantName,
      String restaurantImage,
      String itemSummary,
      String formattedTotal,
      String orderDate});
}

/// @nodoc
class _$ReorderItemCopyWithImpl<$Res, $Val extends ReorderItem>
    implements $ReorderItemCopyWith<$Res> {
  _$ReorderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReorderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? restaurantName = null,
    Object? restaurantImage = null,
    Object? itemSummary = null,
    Object? formattedTotal = null,
    Object? orderDate = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantImage: null == restaurantImage
          ? _value.restaurantImage
          : restaurantImage // ignore: cast_nullable_to_non_nullable
              as String,
      itemSummary: null == itemSummary
          ? _value.itemSummary
          : itemSummary // ignore: cast_nullable_to_non_nullable
              as String,
      formattedTotal: null == formattedTotal
          ? _value.formattedTotal
          : formattedTotal // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReorderItemImplCopyWith<$Res>
    implements $ReorderItemCopyWith<$Res> {
  factory _$$ReorderItemImplCopyWith(
          _$ReorderItemImpl value, $Res Function(_$ReorderItemImpl) then) =
      __$$ReorderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderId,
      String restaurantName,
      String restaurantImage,
      String itemSummary,
      String formattedTotal,
      String orderDate});
}

/// @nodoc
class __$$ReorderItemImplCopyWithImpl<$Res>
    extends _$ReorderItemCopyWithImpl<$Res, _$ReorderItemImpl>
    implements _$$ReorderItemImplCopyWith<$Res> {
  __$$ReorderItemImplCopyWithImpl(
      _$ReorderItemImpl _value, $Res Function(_$ReorderItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReorderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? restaurantName = null,
    Object? restaurantImage = null,
    Object? itemSummary = null,
    Object? formattedTotal = null,
    Object? orderDate = null,
  }) {
    return _then(_$ReorderItemImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantImage: null == restaurantImage
          ? _value.restaurantImage
          : restaurantImage // ignore: cast_nullable_to_non_nullable
              as String,
      itemSummary: null == itemSummary
          ? _value.itemSummary
          : itemSummary // ignore: cast_nullable_to_non_nullable
              as String,
      formattedTotal: null == formattedTotal
          ? _value.formattedTotal
          : formattedTotal // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReorderItemImpl implements _ReorderItem {
  const _$ReorderItemImpl(
      {required this.orderId,
      required this.restaurantName,
      required this.restaurantImage,
      required this.itemSummary,
      required this.formattedTotal,
      required this.orderDate});

  factory _$ReorderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReorderItemImplFromJson(json);

  @override
  final String orderId;
  @override
  final String restaurantName;
  @override
  final String restaurantImage;
  @override
  final String itemSummary;
  @override
  final String formattedTotal;
  @override
  final String orderDate;

  @override
  String toString() {
    return 'ReorderItem(orderId: $orderId, restaurantName: $restaurantName, restaurantImage: $restaurantImage, itemSummary: $itemSummary, formattedTotal: $formattedTotal, orderDate: $orderDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReorderItemImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            (identical(other.restaurantImage, restaurantImage) ||
                other.restaurantImage == restaurantImage) &&
            (identical(other.itemSummary, itemSummary) ||
                other.itemSummary == itemSummary) &&
            (identical(other.formattedTotal, formattedTotal) ||
                other.formattedTotal == formattedTotal) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, restaurantName,
      restaurantImage, itemSummary, formattedTotal, orderDate);

  /// Create a copy of ReorderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReorderItemImplCopyWith<_$ReorderItemImpl> get copyWith =>
      __$$ReorderItemImplCopyWithImpl<_$ReorderItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReorderItemImplToJson(
      this,
    );
  }
}

abstract class _ReorderItem implements ReorderItem {
  const factory _ReorderItem(
      {required final String orderId,
      required final String restaurantName,
      required final String restaurantImage,
      required final String itemSummary,
      required final String formattedTotal,
      required final String orderDate}) = _$ReorderItemImpl;

  factory _ReorderItem.fromJson(Map<String, dynamic> json) =
      _$ReorderItemImpl.fromJson;

  @override
  String get orderId;
  @override
  String get restaurantName;
  @override
  String get restaurantImage;
  @override
  String get itemSummary;
  @override
  String get formattedTotal;
  @override
  String get orderDate;

  /// Create a copy of ReorderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReorderItemImplCopyWith<_$ReorderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
