// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<CartItem> get items => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  String? get restaurantId => throw _privateConstructorUsedError;
  String? get restaurantName => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Cart to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call(
      {String id,
      String userId,
      List<CartItem> items,
      double subtotal,
      double deliveryFee,
      double tax,
      double discount,
      double total,
      String? restaurantId,
      String? restaurantName,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$CartCopyWithImpl<$Res, $Val extends Cart>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? items = null,
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? tax = null,
    Object? discount = null,
    Object? total = null,
    Object? restaurantId = freezed,
    Object? restaurantName = freezed,
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
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
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
      restaurantId: freezed == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurantName: freezed == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$CartImplCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$CartImplCopyWith(
          _$CartImpl value, $Res Function(_$CartImpl) then) =
      __$$CartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      List<CartItem> items,
      double subtotal,
      double deliveryFee,
      double tax,
      double discount,
      double total,
      String? restaurantId,
      String? restaurantName,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$CartImplCopyWithImpl<$Res>
    extends _$CartCopyWithImpl<$Res, _$CartImpl>
    implements _$$CartImplCopyWith<$Res> {
  __$$CartImplCopyWithImpl(_$CartImpl _value, $Res Function(_$CartImpl) _then)
      : super(_value, _then);

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? items = null,
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? tax = null,
    Object? discount = null,
    Object? total = null,
    Object? restaurantId = freezed,
    Object? restaurantName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CartImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
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
      restaurantId: freezed == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurantName: freezed == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$CartImpl extends _Cart {
  const _$CartImpl(
      {required this.id,
      required this.userId,
      final List<CartItem> items = const [],
      this.subtotal = 0.0,
      this.deliveryFee = 0.0,
      this.tax = 0.0,
      this.discount = 0.0,
      this.total = 0.0,
      this.restaurantId,
      this.restaurantName,
      this.createdAt,
      this.updatedAt})
      : _items = items,
        super._();

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  final List<CartItem> _items;
  @override
  @JsonKey()
  List<CartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final double subtotal;
  @override
  @JsonKey()
  final double deliveryFee;
  @override
  @JsonKey()
  final double tax;
  @override
  @JsonKey()
  final double discount;
  @override
  @JsonKey()
  final double total;
  @override
  final String? restaurantId;
  @override
  final String? restaurantName;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Cart(id: $id, userId: $userId, items: $items, subtotal: $subtotal, deliveryFee: $deliveryFee, tax: $tax, discount: $discount, total: $total, restaurantId: $restaurantId, restaurantName: $restaurantName, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
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
      userId,
      const DeepCollectionEquality().hash(_items),
      subtotal,
      deliveryFee,
      tax,
      discount,
      total,
      restaurantId,
      restaurantName,
      createdAt,
      updatedAt);

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      __$$CartImplCopyWithImpl<_$CartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartImplToJson(
      this,
    );
  }
}

abstract class _Cart extends Cart {
  const factory _Cart(
      {required final String id,
      required final String userId,
      final List<CartItem> items,
      final double subtotal,
      final double deliveryFee,
      final double tax,
      final double discount,
      final double total,
      final String? restaurantId,
      final String? restaurantName,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$CartImpl;
  const _Cart._() : super._();

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  List<CartItem> get items;
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
  String? get restaurantId;
  @override
  String? get restaurantName;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  String get id => throw _privateConstructorUsedError;
  MenuItem get menuItem => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  List<SelectedCustomization> get customizations =>
      throw _privateConstructorUsedError;
  String? get specialInstructions => throw _privateConstructorUsedError;
  double get itemTotal => throw _privateConstructorUsedError;
  DateTime? get addedAt => throw _privateConstructorUsedError;

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call(
      {String id,
      MenuItem menuItem,
      int quantity,
      List<SelectedCustomization> customizations,
      String? specialInstructions,
      double itemTotal,
      DateTime? addedAt});

  $MenuItemCopyWith<$Res> get menuItem;
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menuItem = null,
    Object? quantity = null,
    Object? customizations = null,
    Object? specialInstructions = freezed,
    Object? itemTotal = null,
    Object? addedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      menuItem: null == menuItem
          ? _value.menuItem
          : menuItem // ignore: cast_nullable_to_non_nullable
              as MenuItem,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      customizations: null == customizations
          ? _value.customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as List<SelectedCustomization>,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      itemTotal: null == itemTotal
          ? _value.itemTotal
          : itemTotal // ignore: cast_nullable_to_non_nullable
              as double,
      addedAt: freezed == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuItemCopyWith<$Res> get menuItem {
    return $MenuItemCopyWith<$Res>(_value.menuItem, (value) {
      return _then(_value.copyWith(menuItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
          _$CartItemImpl value, $Res Function(_$CartItemImpl) then) =
      __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      MenuItem menuItem,
      int quantity,
      List<SelectedCustomization> customizations,
      String? specialInstructions,
      double itemTotal,
      DateTime? addedAt});

  @override
  $MenuItemCopyWith<$Res> get menuItem;
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
      _$CartItemImpl _value, $Res Function(_$CartItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menuItem = null,
    Object? quantity = null,
    Object? customizations = null,
    Object? specialInstructions = freezed,
    Object? itemTotal = null,
    Object? addedAt = freezed,
  }) {
    return _then(_$CartItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      menuItem: null == menuItem
          ? _value.menuItem
          : menuItem // ignore: cast_nullable_to_non_nullable
              as MenuItem,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      customizations: null == customizations
          ? _value._customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as List<SelectedCustomization>,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      itemTotal: null == itemTotal
          ? _value.itemTotal
          : itemTotal // ignore: cast_nullable_to_non_nullable
              as double,
      addedAt: freezed == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemImpl extends _CartItem {
  const _$CartItemImpl(
      {required this.id,
      required this.menuItem,
      required this.quantity,
      final List<SelectedCustomization> customizations = const [],
      this.specialInstructions,
      this.itemTotal = 0.0,
      this.addedAt})
      : _customizations = customizations,
        super._();

  factory _$CartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemImplFromJson(json);

  @override
  final String id;
  @override
  final MenuItem menuItem;
  @override
  final int quantity;
  final List<SelectedCustomization> _customizations;
  @override
  @JsonKey()
  List<SelectedCustomization> get customizations {
    if (_customizations is EqualUnmodifiableListView) return _customizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customizations);
  }

  @override
  final String? specialInstructions;
  @override
  @JsonKey()
  final double itemTotal;
  @override
  final DateTime? addedAt;

  @override
  String toString() {
    return 'CartItem(id: $id, menuItem: $menuItem, quantity: $quantity, customizations: $customizations, specialInstructions: $specialInstructions, itemTotal: $itemTotal, addedAt: $addedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.menuItem, menuItem) ||
                other.menuItem == menuItem) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            const DeepCollectionEquality()
                .equals(other._customizations, _customizations) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions) &&
            (identical(other.itemTotal, itemTotal) ||
                other.itemTotal == itemTotal) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      menuItem,
      quantity,
      const DeepCollectionEquality().hash(_customizations),
      specialInstructions,
      itemTotal,
      addedAt);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemImplToJson(
      this,
    );
  }
}

abstract class _CartItem extends CartItem {
  const factory _CartItem(
      {required final String id,
      required final MenuItem menuItem,
      required final int quantity,
      final List<SelectedCustomization> customizations,
      final String? specialInstructions,
      final double itemTotal,
      final DateTime? addedAt}) = _$CartItemImpl;
  const _CartItem._() : super._();

  factory _CartItem.fromJson(Map<String, dynamic> json) =
      _$CartItemImpl.fromJson;

  @override
  String get id;
  @override
  MenuItem get menuItem;
  @override
  int get quantity;
  @override
  List<SelectedCustomization> get customizations;
  @override
  String? get specialInstructions;
  @override
  double get itemTotal;
  @override
  DateTime? get addedAt;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SelectedCustomization _$SelectedCustomizationFromJson(
    Map<String, dynamic> json) {
  return _SelectedCustomization.fromJson(json);
}

/// @nodoc
mixin _$SelectedCustomization {
  String get customizationId => throw _privateConstructorUsedError;
  String get customizationName => throw _privateConstructorUsedError;
  List<CustomizationOption> get options => throw _privateConstructorUsedError;

  /// Serializes this SelectedCustomization to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SelectedCustomization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SelectedCustomizationCopyWith<SelectedCustomization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedCustomizationCopyWith<$Res> {
  factory $SelectedCustomizationCopyWith(SelectedCustomization value,
          $Res Function(SelectedCustomization) then) =
      _$SelectedCustomizationCopyWithImpl<$Res, SelectedCustomization>;
  @useResult
  $Res call(
      {String customizationId,
      String customizationName,
      List<CustomizationOption> options});
}

/// @nodoc
class _$SelectedCustomizationCopyWithImpl<$Res,
        $Val extends SelectedCustomization>
    implements $SelectedCustomizationCopyWith<$Res> {
  _$SelectedCustomizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelectedCustomization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customizationId = null,
    Object? customizationName = null,
    Object? options = null,
  }) {
    return _then(_value.copyWith(
      customizationId: null == customizationId
          ? _value.customizationId
          : customizationId // ignore: cast_nullable_to_non_nullable
              as String,
      customizationName: null == customizationName
          ? _value.customizationName
          : customizationName // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<CustomizationOption>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedCustomizationImplCopyWith<$Res>
    implements $SelectedCustomizationCopyWith<$Res> {
  factory _$$SelectedCustomizationImplCopyWith(
          _$SelectedCustomizationImpl value,
          $Res Function(_$SelectedCustomizationImpl) then) =
      __$$SelectedCustomizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String customizationId,
      String customizationName,
      List<CustomizationOption> options});
}

/// @nodoc
class __$$SelectedCustomizationImplCopyWithImpl<$Res>
    extends _$SelectedCustomizationCopyWithImpl<$Res,
        _$SelectedCustomizationImpl>
    implements _$$SelectedCustomizationImplCopyWith<$Res> {
  __$$SelectedCustomizationImplCopyWithImpl(_$SelectedCustomizationImpl _value,
      $Res Function(_$SelectedCustomizationImpl) _then)
      : super(_value, _then);

  /// Create a copy of SelectedCustomization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customizationId = null,
    Object? customizationName = null,
    Object? options = null,
  }) {
    return _then(_$SelectedCustomizationImpl(
      customizationId: null == customizationId
          ? _value.customizationId
          : customizationId // ignore: cast_nullable_to_non_nullable
              as String,
      customizationName: null == customizationName
          ? _value.customizationName
          : customizationName // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<CustomizationOption>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectedCustomizationImpl implements _SelectedCustomization {
  const _$SelectedCustomizationImpl(
      {required this.customizationId,
      required this.customizationName,
      required final List<CustomizationOption> options})
      : _options = options;

  factory _$SelectedCustomizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectedCustomizationImplFromJson(json);

  @override
  final String customizationId;
  @override
  final String customizationName;
  final List<CustomizationOption> _options;
  @override
  List<CustomizationOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'SelectedCustomization(customizationId: $customizationId, customizationName: $customizationName, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedCustomizationImpl &&
            (identical(other.customizationId, customizationId) ||
                other.customizationId == customizationId) &&
            (identical(other.customizationName, customizationName) ||
                other.customizationName == customizationName) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, customizationId,
      customizationName, const DeepCollectionEquality().hash(_options));

  /// Create a copy of SelectedCustomization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedCustomizationImplCopyWith<_$SelectedCustomizationImpl>
      get copyWith => __$$SelectedCustomizationImplCopyWithImpl<
          _$SelectedCustomizationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectedCustomizationImplToJson(
      this,
    );
  }
}

abstract class _SelectedCustomization implements SelectedCustomization {
  const factory _SelectedCustomization(
          {required final String customizationId,
          required final String customizationName,
          required final List<CustomizationOption> options}) =
      _$SelectedCustomizationImpl;

  factory _SelectedCustomization.fromJson(Map<String, dynamic> json) =
      _$SelectedCustomizationImpl.fromJson;

  @override
  String get customizationId;
  @override
  String get customizationName;
  @override
  List<CustomizationOption> get options;

  /// Create a copy of SelectedCustomization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectedCustomizationImplCopyWith<_$SelectedCustomizationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
