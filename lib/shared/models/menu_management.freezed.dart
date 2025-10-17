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
  List<MenuItemDetails> get items => throw _privateConstructorUsedError;

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
      List<MenuItemDetails> items});
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
    Object? items = null,
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
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MenuItemDetails>,
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
      List<MenuItemDetails> items});
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
    Object? items = null,
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
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MenuItemDetails>,
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
      final List<MenuItemDetails> items = const []})
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
  final List<MenuItemDetails> _items;
  @override
  @JsonKey()
  List<MenuItemDetails> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
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
      final List<MenuItemDetails> items}) = _$MenuCategoryImpl;

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
  List<MenuItemDetails> get items;

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
  bool get isPopular => throw _privateConstructorUsedError;
  int get preparationTime => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  List<String> get allergens => throw _privateConstructorUsedError;
  List<String> get dietaryTags => throw _privateConstructorUsedError;
  List<CustomizationOption> get customizations =>
      throw _privateConstructorUsedError;
  int get orderCount => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
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
      bool isPopular,
      int preparationTime,
      String? imageUrl,
      List<String> allergens,
      List<String> dietaryTags,
      List<CustomizationOption> customizations,
      int orderCount,
      double rating,
      int reviewCount,
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
    Object? isPopular = null,
    Object? preparationTime = null,
    Object? imageUrl = freezed,
    Object? allergens = null,
    Object? dietaryTags = null,
    Object? customizations = null,
    Object? orderCount = null,
    Object? rating = null,
    Object? reviewCount = null,
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
      isPopular: null == isPopular
          ? _value.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
              as bool,
      preparationTime: null == preparationTime
          ? _value.preparationTime
          : preparationTime // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      allergens: null == allergens
          ? _value.allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dietaryTags: null == dietaryTags
          ? _value.dietaryTags
          : dietaryTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customizations: null == customizations
          ? _value.customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as List<CustomizationOption>,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
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
      bool isPopular,
      int preparationTime,
      String? imageUrl,
      List<String> allergens,
      List<String> dietaryTags,
      List<CustomizationOption> customizations,
      int orderCount,
      double rating,
      int reviewCount,
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
    Object? isPopular = null,
    Object? preparationTime = null,
    Object? imageUrl = freezed,
    Object? allergens = null,
    Object? dietaryTags = null,
    Object? customizations = null,
    Object? orderCount = null,
    Object? rating = null,
    Object? reviewCount = null,
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
      isPopular: null == isPopular
          ? _value.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
              as bool,
      preparationTime: null == preparationTime
          ? _value.preparationTime
          : preparationTime // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      allergens: null == allergens
          ? _value._allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dietaryTags: null == dietaryTags
          ? _value._dietaryTags
          : dietaryTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customizations: null == customizations
          ? _value._customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as List<CustomizationOption>,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
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
      required this.isPopular,
      required this.preparationTime,
      this.imageUrl,
      final List<String> allergens = const [],
      final List<String> dietaryTags = const [],
      final List<CustomizationOption> customizations = const [],
      this.orderCount = 0,
      this.rating = 0.0,
      this.reviewCount = 0,
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
  final bool isPopular;
  @override
  final int preparationTime;
  @override
  final String? imageUrl;
  final List<String> _allergens;
  @override
  @JsonKey()
  List<String> get allergens {
    if (_allergens is EqualUnmodifiableListView) return _allergens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allergens);
  }

  final List<String> _dietaryTags;
  @override
  @JsonKey()
  List<String> get dietaryTags {
    if (_dietaryTags is EqualUnmodifiableListView) return _dietaryTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dietaryTags);
  }

  final List<CustomizationOption> _customizations;
  @override
  @JsonKey()
  List<CustomizationOption> get customizations {
    if (_customizations is EqualUnmodifiableListView) return _customizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customizations);
  }

  @override
  @JsonKey()
  final int orderCount;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final int reviewCount;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'MenuItemDetails(itemId: $itemId, name: $name, description: $description, price: $price, isAvailable: $isAvailable, isPopular: $isPopular, preparationTime: $preparationTime, imageUrl: $imageUrl, allergens: $allergens, dietaryTags: $dietaryTags, customizations: $customizations, orderCount: $orderCount, rating: $rating, reviewCount: $reviewCount, createdAt: $createdAt, updatedAt: $updatedAt)';
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
            (identical(other.isPopular, isPopular) ||
                other.isPopular == isPopular) &&
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
      isPopular,
      preparationTime,
      imageUrl,
      const DeepCollectionEquality().hash(_allergens),
      const DeepCollectionEquality().hash(_dietaryTags),
      const DeepCollectionEquality().hash(_customizations),
      orderCount,
      rating,
      reviewCount,
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
      required final bool isPopular,
      required final int preparationTime,
      final String? imageUrl,
      final List<String> allergens,
      final List<String> dietaryTags,
      final List<CustomizationOption> customizations,
      final int orderCount,
      final double rating,
      final int reviewCount,
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
  bool get isPopular;
  @override
  int get preparationTime;
  @override
  String? get imageUrl;
  @override
  List<String> get allergens;
  @override
  List<String> get dietaryTags;
  @override
  List<CustomizationOption> get customizations;
  @override
  int get orderCount;
  @override
  double get rating;
  @override
  int get reviewCount;
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
  String get optionId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  CustomizationType get type => throw _privateConstructorUsedError;
  bool get isRequired => throw _privateConstructorUsedError;
  List<CustomizationChoice> get choices => throw _privateConstructorUsedError;

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
      {String optionId,
      String name,
      CustomizationType type,
      bool isRequired,
      List<CustomizationChoice> choices});
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
    Object? optionId = null,
    Object? name = null,
    Object? type = null,
    Object? isRequired = null,
    Object? choices = null,
  }) {
    return _then(_value.copyWith(
      optionId: null == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CustomizationType,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<CustomizationChoice>,
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
      {String optionId,
      String name,
      CustomizationType type,
      bool isRequired,
      List<CustomizationChoice> choices});
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
    Object? optionId = null,
    Object? name = null,
    Object? type = null,
    Object? isRequired = null,
    Object? choices = null,
  }) {
    return _then(_$CustomizationOptionImpl(
      optionId: null == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CustomizationType,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<CustomizationChoice>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomizationOptionImpl implements _CustomizationOption {
  const _$CustomizationOptionImpl(
      {required this.optionId,
      required this.name,
      required this.type,
      required this.isRequired,
      final List<CustomizationChoice> choices = const []})
      : _choices = choices;

  factory _$CustomizationOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomizationOptionImplFromJson(json);

  @override
  final String optionId;
  @override
  final String name;
  @override
  final CustomizationType type;
  @override
  final bool isRequired;
  final List<CustomizationChoice> _choices;
  @override
  @JsonKey()
  List<CustomizationChoice> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  String toString() {
    return 'CustomizationOption(optionId: $optionId, name: $name, type: $type, isRequired: $isRequired, choices: $choices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomizationOptionImpl &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            const DeepCollectionEquality().equals(other._choices, _choices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, optionId, name, type, isRequired,
      const DeepCollectionEquality().hash(_choices));

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
      {required final String optionId,
      required final String name,
      required final CustomizationType type,
      required final bool isRequired,
      final List<CustomizationChoice> choices}) = _$CustomizationOptionImpl;

  factory _CustomizationOption.fromJson(Map<String, dynamic> json) =
      _$CustomizationOptionImpl.fromJson;

  @override
  String get optionId;
  @override
  String get name;
  @override
  CustomizationType get type;
  @override
  bool get isRequired;
  @override
  List<CustomizationChoice> get choices;

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
  String get choiceId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get additionalPrice => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;

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
      {String choiceId,
      String name,
      double additionalPrice,
      bool isDefault,
      bool isAvailable});
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
    Object? choiceId = null,
    Object? name = null,
    Object? additionalPrice = null,
    Object? isDefault = null,
    Object? isAvailable = null,
  }) {
    return _then(_value.copyWith(
      choiceId: null == choiceId
          ? _value.choiceId
          : choiceId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      additionalPrice: null == additionalPrice
          ? _value.additionalPrice
          : additionalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
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
      {String choiceId,
      String name,
      double additionalPrice,
      bool isDefault,
      bool isAvailable});
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
    Object? choiceId = null,
    Object? name = null,
    Object? additionalPrice = null,
    Object? isDefault = null,
    Object? isAvailable = null,
  }) {
    return _then(_$CustomizationChoiceImpl(
      choiceId: null == choiceId
          ? _value.choiceId
          : choiceId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      additionalPrice: null == additionalPrice
          ? _value.additionalPrice
          : additionalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomizationChoiceImpl implements _CustomizationChoice {
  const _$CustomizationChoiceImpl(
      {required this.choiceId,
      required this.name,
      required this.additionalPrice,
      required this.isDefault,
      required this.isAvailable});

  factory _$CustomizationChoiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomizationChoiceImplFromJson(json);

  @override
  final String choiceId;
  @override
  final String name;
  @override
  final double additionalPrice;
  @override
  final bool isDefault;
  @override
  final bool isAvailable;

  @override
  String toString() {
    return 'CustomizationChoice(choiceId: $choiceId, name: $name, additionalPrice: $additionalPrice, isDefault: $isDefault, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomizationChoiceImpl &&
            (identical(other.choiceId, choiceId) ||
                other.choiceId == choiceId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.additionalPrice, additionalPrice) ||
                other.additionalPrice == additionalPrice) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, choiceId, name, additionalPrice, isDefault, isAvailable);

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
      {required final String choiceId,
      required final String name,
      required final double additionalPrice,
      required final bool isDefault,
      required final bool isAvailable}) = _$CustomizationChoiceImpl;

  factory _CustomizationChoice.fromJson(Map<String, dynamic> json) =
      _$CustomizationChoiceImpl.fromJson;

  @override
  String get choiceId;
  @override
  String get name;
  @override
  double get additionalPrice;
  @override
  bool get isDefault;
  @override
  bool get isAvailable;

  /// Create a copy of CustomizationChoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomizationChoiceImplCopyWith<_$CustomizationChoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuItemPerformance _$MenuItemPerformanceFromJson(Map<String, dynamic> json) {
  return _MenuItemPerformance.fromJson(json);
}

/// @nodoc
mixin _$MenuItemPerformance {
  String get itemId => throw _privateConstructorUsedError;
  String get itemName => throw _privateConstructorUsedError;
  int get totalOrders => throw _privateConstructorUsedError;
  double get totalRevenue => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  double get profitMargin => throw _privateConstructorUsedError;
  List<DailyPerformance> get dailyStats => throw _privateConstructorUsedError;

  /// Serializes this MenuItemPerformance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuItemPerformance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuItemPerformanceCopyWith<MenuItemPerformance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemPerformanceCopyWith<$Res> {
  factory $MenuItemPerformanceCopyWith(
          MenuItemPerformance value, $Res Function(MenuItemPerformance) then) =
      _$MenuItemPerformanceCopyWithImpl<$Res, MenuItemPerformance>;
  @useResult
  $Res call(
      {String itemId,
      String itemName,
      int totalOrders,
      double totalRevenue,
      double averageRating,
      int reviewCount,
      double profitMargin,
      List<DailyPerformance> dailyStats});
}

/// @nodoc
class _$MenuItemPerformanceCopyWithImpl<$Res, $Val extends MenuItemPerformance>
    implements $MenuItemPerformanceCopyWith<$Res> {
  _$MenuItemPerformanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuItemPerformance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? itemName = null,
    Object? totalOrders = null,
    Object? totalRevenue = null,
    Object? averageRating = null,
    Object? reviewCount = null,
    Object? profitMargin = null,
    Object? dailyStats = null,
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
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      profitMargin: null == profitMargin
          ? _value.profitMargin
          : profitMargin // ignore: cast_nullable_to_non_nullable
              as double,
      dailyStats: null == dailyStats
          ? _value.dailyStats
          : dailyStats // ignore: cast_nullable_to_non_nullable
              as List<DailyPerformance>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuItemPerformanceImplCopyWith<$Res>
    implements $MenuItemPerformanceCopyWith<$Res> {
  factory _$$MenuItemPerformanceImplCopyWith(_$MenuItemPerformanceImpl value,
          $Res Function(_$MenuItemPerformanceImpl) then) =
      __$$MenuItemPerformanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String itemId,
      String itemName,
      int totalOrders,
      double totalRevenue,
      double averageRating,
      int reviewCount,
      double profitMargin,
      List<DailyPerformance> dailyStats});
}

/// @nodoc
class __$$MenuItemPerformanceImplCopyWithImpl<$Res>
    extends _$MenuItemPerformanceCopyWithImpl<$Res, _$MenuItemPerformanceImpl>
    implements _$$MenuItemPerformanceImplCopyWith<$Res> {
  __$$MenuItemPerformanceImplCopyWithImpl(_$MenuItemPerformanceImpl _value,
      $Res Function(_$MenuItemPerformanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuItemPerformance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? itemName = null,
    Object? totalOrders = null,
    Object? totalRevenue = null,
    Object? averageRating = null,
    Object? reviewCount = null,
    Object? profitMargin = null,
    Object? dailyStats = null,
  }) {
    return _then(_$MenuItemPerformanceImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      profitMargin: null == profitMargin
          ? _value.profitMargin
          : profitMargin // ignore: cast_nullable_to_non_nullable
              as double,
      dailyStats: null == dailyStats
          ? _value._dailyStats
          : dailyStats // ignore: cast_nullable_to_non_nullable
              as List<DailyPerformance>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuItemPerformanceImpl implements _MenuItemPerformance {
  const _$MenuItemPerformanceImpl(
      {required this.itemId,
      required this.itemName,
      required this.totalOrders,
      required this.totalRevenue,
      required this.averageRating,
      required this.reviewCount,
      required this.profitMargin,
      final List<DailyPerformance> dailyStats = const []})
      : _dailyStats = dailyStats;

  factory _$MenuItemPerformanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemPerformanceImplFromJson(json);

  @override
  final String itemId;
  @override
  final String itemName;
  @override
  final int totalOrders;
  @override
  final double totalRevenue;
  @override
  final double averageRating;
  @override
  final int reviewCount;
  @override
  final double profitMargin;
  final List<DailyPerformance> _dailyStats;
  @override
  @JsonKey()
  List<DailyPerformance> get dailyStats {
    if (_dailyStats is EqualUnmodifiableListView) return _dailyStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyStats);
  }

  @override
  String toString() {
    return 'MenuItemPerformance(itemId: $itemId, itemName: $itemName, totalOrders: $totalOrders, totalRevenue: $totalRevenue, averageRating: $averageRating, reviewCount: $reviewCount, profitMargin: $profitMargin, dailyStats: $dailyStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemPerformanceImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.profitMargin, profitMargin) ||
                other.profitMargin == profitMargin) &&
            const DeepCollectionEquality()
                .equals(other._dailyStats, _dailyStats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      itemId,
      itemName,
      totalOrders,
      totalRevenue,
      averageRating,
      reviewCount,
      profitMargin,
      const DeepCollectionEquality().hash(_dailyStats));

  /// Create a copy of MenuItemPerformance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemPerformanceImplCopyWith<_$MenuItemPerformanceImpl> get copyWith =>
      __$$MenuItemPerformanceImplCopyWithImpl<_$MenuItemPerformanceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuItemPerformanceImplToJson(
      this,
    );
  }
}

abstract class _MenuItemPerformance implements MenuItemPerformance {
  const factory _MenuItemPerformance(
      {required final String itemId,
      required final String itemName,
      required final int totalOrders,
      required final double totalRevenue,
      required final double averageRating,
      required final int reviewCount,
      required final double profitMargin,
      final List<DailyPerformance> dailyStats}) = _$MenuItemPerformanceImpl;

  factory _MenuItemPerformance.fromJson(Map<String, dynamic> json) =
      _$MenuItemPerformanceImpl.fromJson;

  @override
  String get itemId;
  @override
  String get itemName;
  @override
  int get totalOrders;
  @override
  double get totalRevenue;
  @override
  double get averageRating;
  @override
  int get reviewCount;
  @override
  double get profitMargin;
  @override
  List<DailyPerformance> get dailyStats;

  /// Create a copy of MenuItemPerformance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuItemPerformanceImplCopyWith<_$MenuItemPerformanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyPerformance _$DailyPerformanceFromJson(Map<String, dynamic> json) {
  return _DailyPerformance.fromJson(json);
}

/// @nodoc
mixin _$DailyPerformance {
  DateTime get date => throw _privateConstructorUsedError;
  int get orders => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;

  /// Serializes this DailyPerformance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyPerformance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyPerformanceCopyWith<DailyPerformance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyPerformanceCopyWith<$Res> {
  factory $DailyPerformanceCopyWith(
          DailyPerformance value, $Res Function(DailyPerformance) then) =
      _$DailyPerformanceCopyWithImpl<$Res, DailyPerformance>;
  @useResult
  $Res call({DateTime date, int orders, double revenue});
}

/// @nodoc
class _$DailyPerformanceCopyWithImpl<$Res, $Val extends DailyPerformance>
    implements $DailyPerformanceCopyWith<$Res> {
  _$DailyPerformanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyPerformance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? orders = null,
    Object? revenue = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyPerformanceImplCopyWith<$Res>
    implements $DailyPerformanceCopyWith<$Res> {
  factory _$$DailyPerformanceImplCopyWith(_$DailyPerformanceImpl value,
          $Res Function(_$DailyPerformanceImpl) then) =
      __$$DailyPerformanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, int orders, double revenue});
}

/// @nodoc
class __$$DailyPerformanceImplCopyWithImpl<$Res>
    extends _$DailyPerformanceCopyWithImpl<$Res, _$DailyPerformanceImpl>
    implements _$$DailyPerformanceImplCopyWith<$Res> {
  __$$DailyPerformanceImplCopyWithImpl(_$DailyPerformanceImpl _value,
      $Res Function(_$DailyPerformanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyPerformance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? orders = null,
    Object? revenue = null,
  }) {
    return _then(_$DailyPerformanceImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyPerformanceImpl implements _DailyPerformance {
  const _$DailyPerformanceImpl(
      {required this.date, required this.orders, required this.revenue});

  factory _$DailyPerformanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyPerformanceImplFromJson(json);

  @override
  final DateTime date;
  @override
  final int orders;
  @override
  final double revenue;

  @override
  String toString() {
    return 'DailyPerformance(date: $date, orders: $orders, revenue: $revenue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyPerformanceImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.orders, orders) || other.orders == orders) &&
            (identical(other.revenue, revenue) || other.revenue == revenue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, orders, revenue);

  /// Create a copy of DailyPerformance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyPerformanceImplCopyWith<_$DailyPerformanceImpl> get copyWith =>
      __$$DailyPerformanceImplCopyWithImpl<_$DailyPerformanceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyPerformanceImplToJson(
      this,
    );
  }
}

abstract class _DailyPerformance implements DailyPerformance {
  const factory _DailyPerformance(
      {required final DateTime date,
      required final int orders,
      required final double revenue}) = _$DailyPerformanceImpl;

  factory _DailyPerformance.fromJson(Map<String, dynamic> json) =
      _$DailyPerformanceImpl.fromJson;

  @override
  DateTime get date;
  @override
  int get orders;
  @override
  double get revenue;

  /// Create a copy of DailyPerformance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyPerformanceImplCopyWith<_$DailyPerformanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
