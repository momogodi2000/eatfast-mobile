// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_management.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MenuCategory _$MenuCategoryFromJson(Map<String, dynamic> json) {
  return _MenuCategory.fromJson(json);
}

/// @nodoc
mixin _$MenuCategory {
  String get categoryId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<MenuItemDetails>? get items => throw _privateConstructorUsedError;

  /// Serializes this MenuCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuCategoryCopyWith<MenuCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCategoryCopyWith<$Res> {
  factory $MenuCategoryCopyWith(
          MenuCategory value, $Res Function(MenuCategory) then) =
      _$MenuCategoryCopyWithImpl<$Res, MenuCategory>;
  @useResult
  $Res call(
      {String categoryId,
      String name,
      String description,
      int sortOrder,
      bool isActive,
      String? imageUrl,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<MenuItemDetails>? items});
}

/// @nodoc
class _$MenuCategoryCopyWithImpl<$Res, $Val extends MenuCategory>
    implements $MenuCategoryCopyWith<$Res> {
  _$MenuCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? name = null,
    Object? description = null,
    Object? sortOrder = null,
    Object? isActive = null,
    Object? imageUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MenuItemDetails>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuCategoryImplCopyWith<$Res>
    implements $MenuCategoryCopyWith<$Res> {
  factory _$$MenuCategoryImplCopyWith(
          _$MenuCategoryImpl value, $Res Function(_$MenuCategoryImpl) then) =
      __$$MenuCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String categoryId,
      String name,
      String description,
      int sortOrder,
      bool isActive,
      String? imageUrl,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<MenuItemDetails>? items});
}

/// @nodoc
class __$$MenuCategoryImplCopyWithImpl<$Res>
    extends _$MenuCategoryCopyWithImpl<$Res, _$MenuCategoryImpl>
    implements _$$MenuCategoryImplCopyWith<$Res> {
  __$$MenuCategoryImplCopyWithImpl(
      _$MenuCategoryImpl _value, $Res Function(_$MenuCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? name = null,
    Object? description = null,
    Object? sortOrder = null,
    Object? isActive = null,
    Object? imageUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? items = freezed,
  }) {
    return _then(_$MenuCategoryImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MenuItemDetails>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuCategoryImpl implements _MenuCategory {
  const _$MenuCategoryImpl(
      {required this.categoryId,
      required this.name,
      required this.description,
      required this.sortOrder,
      required this.isActive,
      this.imageUrl,
      this.createdAt,
      this.updatedAt,
      final List<MenuItemDetails>? items})
      : _items = items;

  factory _$MenuCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuCategoryImplFromJson(json);

  @override
  final String categoryId;
  @override
  final String name;
  @override
  final String description;
  @override
  final int sortOrder;
  @override
  final bool isActive;
  @override
  final String? imageUrl;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  final List<MenuItemDetails>? _items;
  @override
  List<MenuItemDetails>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MenuCategory(categoryId: $categoryId, name: $name, description: $description, sortOrder: $sortOrder, isActive: $isActive, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuCategoryImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      categoryId,
      name,
      description,
      sortOrder,
      isActive,
      imageUrl,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_items));

  /// Create a copy of MenuCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuCategoryImplCopyWith<_$MenuCategoryImpl> get copyWith =>
      __$$MenuCategoryImplCopyWithImpl<_$MenuCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuCategoryImplToJson(
      this,
    );
  }
}

abstract class _MenuCategory implements MenuCategory {
  const factory _MenuCategory(
      {required final String categoryId,
      required final String name,
      required final String description,
      required final int sortOrder,
      required final bool isActive,
      final String? imageUrl,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final List<MenuItemDetails>? items}) = _$MenuCategoryImpl;

  factory _MenuCategory.fromJson(Map<String, dynamic> json) =
      _$MenuCategoryImpl.fromJson;

  @override
  String get categoryId;
  @override
  String get name;
  @override
  String get description;
  @override
  int get sortOrder;
  @override
  bool get isActive;
  @override
  String? get imageUrl;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  List<MenuItemDetails>? get items;

  /// Create a copy of MenuCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuCategoryImplCopyWith<_$MenuCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuItemDetails _$MenuItemDetailsFromJson(Map<String, dynamic> json) {
  return _MenuItemDetails.fromJson(json);
}

/// @nodoc
mixin _$MenuItemDetails {
  String get itemId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  int get preparationTime => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  List<String>? get allergens => throw _privateConstructorUsedError;
  List<String>? get dietaryTags => throw _privateConstructorUsedError;
  List<CustomizationOption>? get customizations =>
      throw _privateConstructorUsedError;
  int? get orderCount => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  int? get reviewCount => throw _privateConstructorUsedError;
  bool get isPopular => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this MenuItemDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuItemDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuItemDetailsCopyWith<MenuItemDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemDetailsCopyWith<$Res> {
  factory $MenuItemDetailsCopyWith(
          MenuItemDetails value, $Res Function(MenuItemDetails) then) =
      _$MenuItemDetailsCopyWithImpl<$Res, MenuItemDetails>;
  @useResult
  $Res call(
      {String itemId,
      String name,
      String description,
      double price,
      bool isAvailable,
      int preparationTime,
      String? imageUrl,
      List<String>? allergens,
      List<String>? dietaryTags,
      List<CustomizationOption>? customizations,
      int? orderCount,
      double? rating,
      int? reviewCount,
      bool isPopular,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$MenuItemDetailsCopyWithImpl<$Res, $Val extends MenuItemDetails>
    implements $MenuItemDetailsCopyWith<$Res> {
  _$MenuItemDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuItemDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? isAvailable = null,
    Object? preparationTime = null,
    Object? imageUrl = freezed,
    Object? allergens = freezed,
    Object? dietaryTags = freezed,
    Object? customizations = freezed,
    Object? orderCount = freezed,
    Object? rating = freezed,
    Object? reviewCount = freezed,
    Object? isPopular = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      preparationTime: null == preparationTime
          ? _value.preparationTime
          : preparationTime // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      allergens: freezed == allergens
          ? _value.allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      dietaryTags: freezed == dietaryTags
          ? _value.dietaryTags
          : dietaryTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      customizations: freezed == customizations
          ? _value.customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as List<CustomizationOption>?,
      orderCount: freezed == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      reviewCount: freezed == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isPopular: null == isPopular
          ? _value.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
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
abstract class _$$MenuItemDetailsImplCopyWith<$Res>
    implements $MenuItemDetailsCopyWith<$Res> {
  factory _$$MenuItemDetailsImplCopyWith(_$MenuItemDetailsImpl value,
          $Res Function(_$MenuItemDetailsImpl) then) =
      __$$MenuItemDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String itemId,
      String name,
      String description,
      double price,
      bool isAvailable,
      int preparationTime,
      String? imageUrl,
      List<String>? allergens,
      List<String>? dietaryTags,
      List<CustomizationOption>? customizations,
      int? orderCount,
      double? rating,
      int? reviewCount,
      bool isPopular,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$MenuItemDetailsImplCopyWithImpl<$Res>
    extends _$MenuItemDetailsCopyWithImpl<$Res, _$MenuItemDetailsImpl>
    implements _$$MenuItemDetailsImplCopyWith<$Res> {
  __$$MenuItemDetailsImplCopyWithImpl(
      _$MenuItemDetailsImpl _value, $Res Function(_$MenuItemDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuItemDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? isAvailable = null,
    Object? preparationTime = null,
    Object? imageUrl = freezed,
    Object? allergens = freezed,
    Object? dietaryTags = freezed,
    Object? customizations = freezed,
    Object? orderCount = freezed,
    Object? rating = freezed,
    Object? reviewCount = freezed,
    Object? isPopular = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$MenuItemDetailsImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      preparationTime: null == preparationTime
          ? _value.preparationTime
          : preparationTime // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      allergens: freezed == allergens
          ? _value._allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      dietaryTags: freezed == dietaryTags
          ? _value._dietaryTags
          : dietaryTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      customizations: freezed == customizations
          ? _value._customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as List<CustomizationOption>?,
      orderCount: freezed == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      reviewCount: freezed == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isPopular: null == isPopular
          ? _value.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
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
class _$MenuItemDetailsImpl implements _MenuItemDetails {
  const _$MenuItemDetailsImpl(
      {required this.itemId,
      required this.name,
      required this.description,
      required this.price,
      required this.isAvailable,
      required this.preparationTime,
      this.imageUrl,
      final List<String>? allergens,
      final List<String>? dietaryTags,
      final List<CustomizationOption>? customizations,
      this.orderCount,
      this.rating,
      this.reviewCount,
      this.isPopular = false,
      this.createdAt,
      this.updatedAt})
      : _allergens = allergens,
        _dietaryTags = dietaryTags,
        _customizations = customizations;

  factory _$MenuItemDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemDetailsImplFromJson(json);

  @override
  final String itemId;
  @override
  final String name;
  @override
  final String description;
  @override
  final double price;
  @override
  final bool isAvailable;
  @override
  final int preparationTime;
  @override
  final String? imageUrl;
  final List<String>? _allergens;
  @override
  List<String>? get allergens {
    final value = _allergens;
    if (value == null) return null;
    if (_allergens is EqualUnmodifiableListView) return _allergens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _dietaryTags;
  @override
  List<String>? get dietaryTags {
    final value = _dietaryTags;
    if (value == null) return null;
    if (_dietaryTags is EqualUnmodifiableListView) return _dietaryTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CustomizationOption>? _customizations;
  @override
  List<CustomizationOption>? get customizations {
    final value = _customizations;
    if (value == null) return null;
    if (_customizations is EqualUnmodifiableListView) return _customizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? orderCount;
  @override
  final double? rating;
  @override
  final int? reviewCount;
  @override
  @JsonKey()
  final bool isPopular;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'MenuItemDetails(itemId: $itemId, name: $name, description: $description, price: $price, isAvailable: $isAvailable, preparationTime: $preparationTime, imageUrl: $imageUrl, allergens: $allergens, dietaryTags: $dietaryTags, customizations: $customizations, orderCount: $orderCount, rating: $rating, reviewCount: $reviewCount, isPopular: $isPopular, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemDetailsImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.preparationTime, preparationTime) ||
                other.preparationTime == preparationTime) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality()
                .equals(other._allergens, _allergens) &&
            const DeepCollectionEquality()
                .equals(other._dietaryTags, _dietaryTags) &&
            const DeepCollectionEquality()
                .equals(other._customizations, _customizations) &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.isPopular, isPopular) ||
                other.isPopular == isPopular) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      itemId,
      name,
      description,
      price,
      isAvailable,
      preparationTime,
      imageUrl,
      const DeepCollectionEquality().hash(_allergens),
      const DeepCollectionEquality().hash(_dietaryTags),
      const DeepCollectionEquality().hash(_customizations),
      orderCount,
      rating,
      reviewCount,
      isPopular,
      createdAt,
      updatedAt);

  /// Create a copy of MenuItemDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemDetailsImplCopyWith<_$MenuItemDetailsImpl> get copyWith =>
      __$$MenuItemDetailsImplCopyWithImpl<_$MenuItemDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuItemDetailsImplToJson(
      this,
    );
  }
}

abstract class _MenuItemDetails implements MenuItemDetails {
  const factory _MenuItemDetails(
      {required final String itemId,
      required final String name,
      required final String description,
      required final double price,
      required final bool isAvailable,
      required final int preparationTime,
      final String? imageUrl,
      final List<String>? allergens,
      final List<String>? dietaryTags,
      final List<CustomizationOption>? customizations,
      final int? orderCount,
      final double? rating,
      final int? reviewCount,
      final bool isPopular,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$MenuItemDetailsImpl;

  factory _MenuItemDetails.fromJson(Map<String, dynamic> json) =
      _$MenuItemDetailsImpl.fromJson;

  @override
  String get itemId;
  @override
  String get name;
  @override
  String get description;
  @override
  double get price;
  @override
  bool get isAvailable;
  @override
  int get preparationTime;
  @override
  String? get imageUrl;
  @override
  List<String>? get allergens;
  @override
  List<String>? get dietaryTags;
  @override
  List<CustomizationOption>? get customizations;
  @override
  int? get orderCount;
  @override
  double? get rating;
  @override
  int? get reviewCount;
  @override
  bool get isPopular;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of MenuItemDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuItemDetailsImplCopyWith<_$MenuItemDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomizationOption _$CustomizationOptionFromJson(Map<String, dynamic> json) {
  return _CustomizationOption.fromJson(json);
}

/// @nodoc
mixin _$CustomizationOption {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  CustomizationType get type => throw _privateConstructorUsedError;
  bool get required => throw _privateConstructorUsedError;
  int get maxSelections => throw _privateConstructorUsedError;
  List<CustomizationChoice>? get choices => throw _privateConstructorUsedError;

  /// Serializes this CustomizationOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomizationOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomizationOptionCopyWith<CustomizationOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomizationOptionCopyWith<$Res> {
  factory $CustomizationOptionCopyWith(
          CustomizationOption value, $Res Function(CustomizationOption) then) =
      _$CustomizationOptionCopyWithImpl<$Res, CustomizationOption>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      CustomizationType type,
      bool required,
      int maxSelections,
      List<CustomizationChoice>? choices});
}

/// @nodoc
class _$CustomizationOptionCopyWithImpl<$Res, $Val extends CustomizationOption>
    implements $CustomizationOptionCopyWith<$Res> {
  _$CustomizationOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomizationOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? required = null,
    Object? maxSelections = null,
    Object? choices = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CustomizationType,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      maxSelections: null == maxSelections
          ? _value.maxSelections
          : maxSelections // ignore: cast_nullable_to_non_nullable
              as int,
      choices: freezed == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<CustomizationChoice>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomizationOptionImplCopyWith<$Res>
    implements $CustomizationOptionCopyWith<$Res> {
  factory _$$CustomizationOptionImplCopyWith(_$CustomizationOptionImpl value,
          $Res Function(_$CustomizationOptionImpl) then) =
      __$$CustomizationOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      CustomizationType type,
      bool required,
      int maxSelections,
      List<CustomizationChoice>? choices});
}

/// @nodoc
class __$$CustomizationOptionImplCopyWithImpl<$Res>
    extends _$CustomizationOptionCopyWithImpl<$Res, _$CustomizationOptionImpl>
    implements _$$CustomizationOptionImplCopyWith<$Res> {
  __$$CustomizationOptionImplCopyWithImpl(_$CustomizationOptionImpl _value,
      $Res Function(_$CustomizationOptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomizationOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? required = null,
    Object? maxSelections = null,
    Object? choices = freezed,
  }) {
    return _then(_$CustomizationOptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CustomizationType,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      maxSelections: null == maxSelections
          ? _value.maxSelections
          : maxSelections // ignore: cast_nullable_to_non_nullable
              as int,
      choices: freezed == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<CustomizationChoice>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomizationOptionImpl implements _CustomizationOption {
  const _$CustomizationOptionImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.type,
      required this.required,
      required this.maxSelections,
      final List<CustomizationChoice>? choices})
      : _choices = choices;

  factory _$CustomizationOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomizationOptionImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final CustomizationType type;
  @override
  final bool required;
  @override
  final int maxSelections;
  final List<CustomizationChoice>? _choices;
  @override
  List<CustomizationChoice>? get choices {
    final value = _choices;
    if (value == null) return null;
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CustomizationOption(id: $id, name: $name, description: $description, type: $type, required: $required, maxSelections: $maxSelections, choices: $choices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomizationOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.required, required) ||
                other.required == required) &&
            (identical(other.maxSelections, maxSelections) ||
                other.maxSelections == maxSelections) &&
            const DeepCollectionEquality().equals(other._choices, _choices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, type,
      required, maxSelections, const DeepCollectionEquality().hash(_choices));

  /// Create a copy of CustomizationOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomizationOptionImplCopyWith<_$CustomizationOptionImpl> get copyWith =>
      __$$CustomizationOptionImplCopyWithImpl<_$CustomizationOptionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomizationOptionImplToJson(
      this,
    );
  }
}

abstract class _CustomizationOption implements CustomizationOption {
  const factory _CustomizationOption(
      {required final String id,
      required final String name,
      required final String description,
      required final CustomizationType type,
      required final bool required,
      required final int maxSelections,
      final List<CustomizationChoice>? choices}) = _$CustomizationOptionImpl;

  factory _CustomizationOption.fromJson(Map<String, dynamic> json) =
      _$CustomizationOptionImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  CustomizationType get type;
  @override
  bool get required;
  @override
  int get maxSelections;
  @override
  List<CustomizationChoice>? get choices;

  /// Create a copy of CustomizationOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomizationOptionImplCopyWith<_$CustomizationOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomizationChoice _$CustomizationChoiceFromJson(Map<String, dynamic> json) {
  return _CustomizationChoice.fromJson(json);
}

/// @nodoc
mixin _$CustomizationChoice {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;

  /// Serializes this CustomizationChoice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomizationChoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomizationChoiceCopyWith<CustomizationChoice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomizationChoiceCopyWith<$Res> {
  factory $CustomizationChoiceCopyWith(
          CustomizationChoice value, $Res Function(CustomizationChoice) then) =
      _$CustomizationChoiceCopyWithImpl<$Res, CustomizationChoice>;
  @useResult
  $Res call(
      {String id, String name, double price, bool isAvailable, bool isDefault});
}

/// @nodoc
class _$CustomizationChoiceCopyWithImpl<$Res, $Val extends CustomizationChoice>
    implements $CustomizationChoiceCopyWith<$Res> {
  _$CustomizationChoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomizationChoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? isAvailable = null,
    Object? isDefault = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomizationChoiceImplCopyWith<$Res>
    implements $CustomizationChoiceCopyWith<$Res> {
  factory _$$CustomizationChoiceImplCopyWith(_$CustomizationChoiceImpl value,
          $Res Function(_$CustomizationChoiceImpl) then) =
      __$$CustomizationChoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, double price, bool isAvailable, bool isDefault});
}

/// @nodoc
class __$$CustomizationChoiceImplCopyWithImpl<$Res>
    extends _$CustomizationChoiceCopyWithImpl<$Res, _$CustomizationChoiceImpl>
    implements _$$CustomizationChoiceImplCopyWith<$Res> {
  __$$CustomizationChoiceImplCopyWithImpl(_$CustomizationChoiceImpl _value,
      $Res Function(_$CustomizationChoiceImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomizationChoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? isAvailable = null,
    Object? isDefault = null,
  }) {
    return _then(_$CustomizationChoiceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomizationChoiceImpl implements _CustomizationChoice {
  const _$CustomizationChoiceImpl(
      {required this.id,
      required this.name,
      required this.price,
      required this.isAvailable,
      required this.isDefault});

  factory _$CustomizationChoiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomizationChoiceImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;
  @override
  final bool isAvailable;
  @override
  final bool isDefault;

  @override
  String toString() {
    return 'CustomizationChoice(id: $id, name: $name, price: $price, isAvailable: $isAvailable, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomizationChoiceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, price, isAvailable, isDefault);

  /// Create a copy of CustomizationChoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomizationChoiceImplCopyWith<_$CustomizationChoiceImpl> get copyWith =>
      __$$CustomizationChoiceImplCopyWithImpl<_$CustomizationChoiceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomizationChoiceImplToJson(
      this,
    );
  }
}

abstract class _CustomizationChoice implements CustomizationChoice {
  const factory _CustomizationChoice(
      {required final String id,
      required final String name,
      required final double price,
      required final bool isAvailable,
      required final bool isDefault}) = _$CustomizationChoiceImpl;

  factory _CustomizationChoice.fromJson(Map<String, dynamic> json) =
      _$CustomizationChoiceImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get price;
  @override
  bool get isAvailable;
  @override
  bool get isDefault;

  /// Create a copy of CustomizationChoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomizationChoiceImplCopyWith<_$CustomizationChoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
