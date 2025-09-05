// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) {
  return _MenuItem.fromJson(json);
}

/// @nodoc
mixin _$MenuItem {
  String get id => throw _privateConstructorUsedError;
  String get restaurantId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  List<String> get allergens => throw _privateConstructorUsedError;
  List<DietaryTag> get dietaryTags => throw _privateConstructorUsedError;
  List<MenuItemCustomization> get customizations =>
      throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  int get preparationTime => throw _privateConstructorUsedError;
  double get calories => throw _privateConstructorUsedError;
  String? get nutritionalInfo => throw _privateConstructorUsedError;
  bool get isPopular => throw _privateConstructorUsedError;
  bool get isRecommended => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this MenuItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuItemCopyWith<MenuItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemCopyWith<$Res> {
  factory $MenuItemCopyWith(MenuItem value, $Res Function(MenuItem) then) =
      _$MenuItemCopyWithImpl<$Res, MenuItem>;
  @useResult
  $Res call(
      {String id,
      String restaurantId,
      String name,
      String description,
      double price,
      String imageUrl,
      String categoryId,
      List<String> allergens,
      List<DietaryTag> dietaryTags,
      List<MenuItemCustomization> customizations,
      bool isAvailable,
      int preparationTime,
      double calories,
      String? nutritionalInfo,
      bool isPopular,
      bool isRecommended,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$MenuItemCopyWithImpl<$Res, $Val extends MenuItem>
    implements $MenuItemCopyWith<$Res> {
  _$MenuItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? restaurantId = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? categoryId = null,
    Object? allergens = null,
    Object? dietaryTags = null,
    Object? customizations = null,
    Object? isAvailable = null,
    Object? preparationTime = null,
    Object? calories = null,
    Object? nutritionalInfo = freezed,
    Object? isPopular = null,
    Object? isRecommended = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
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
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      allergens: null == allergens
          ? _value.allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dietaryTags: null == dietaryTags
          ? _value.dietaryTags
          : dietaryTags // ignore: cast_nullable_to_non_nullable
              as List<DietaryTag>,
      customizations: null == customizations
          ? _value.customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as List<MenuItemCustomization>,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      preparationTime: null == preparationTime
          ? _value.preparationTime
          : preparationTime // ignore: cast_nullable_to_non_nullable
              as int,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double,
      nutritionalInfo: freezed == nutritionalInfo
          ? _value.nutritionalInfo
          : nutritionalInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      isPopular: null == isPopular
          ? _value.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecommended: null == isRecommended
          ? _value.isRecommended
          : isRecommended // ignore: cast_nullable_to_non_nullable
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
abstract class _$$MenuItemImplCopyWith<$Res>
    implements $MenuItemCopyWith<$Res> {
  factory _$$MenuItemImplCopyWith(
          _$MenuItemImpl value, $Res Function(_$MenuItemImpl) then) =
      __$$MenuItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String restaurantId,
      String name,
      String description,
      double price,
      String imageUrl,
      String categoryId,
      List<String> allergens,
      List<DietaryTag> dietaryTags,
      List<MenuItemCustomization> customizations,
      bool isAvailable,
      int preparationTime,
      double calories,
      String? nutritionalInfo,
      bool isPopular,
      bool isRecommended,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$MenuItemImplCopyWithImpl<$Res>
    extends _$MenuItemCopyWithImpl<$Res, _$MenuItemImpl>
    implements _$$MenuItemImplCopyWith<$Res> {
  __$$MenuItemImplCopyWithImpl(
      _$MenuItemImpl _value, $Res Function(_$MenuItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? restaurantId = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? categoryId = null,
    Object? allergens = null,
    Object? dietaryTags = null,
    Object? customizations = null,
    Object? isAvailable = null,
    Object? preparationTime = null,
    Object? calories = null,
    Object? nutritionalInfo = freezed,
    Object? isPopular = null,
    Object? isRecommended = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$MenuItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
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
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      allergens: null == allergens
          ? _value._allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dietaryTags: null == dietaryTags
          ? _value._dietaryTags
          : dietaryTags // ignore: cast_nullable_to_non_nullable
              as List<DietaryTag>,
      customizations: null == customizations
          ? _value._customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as List<MenuItemCustomization>,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      preparationTime: null == preparationTime
          ? _value.preparationTime
          : preparationTime // ignore: cast_nullable_to_non_nullable
              as int,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double,
      nutritionalInfo: freezed == nutritionalInfo
          ? _value.nutritionalInfo
          : nutritionalInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      isPopular: null == isPopular
          ? _value.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecommended: null == isRecommended
          ? _value.isRecommended
          : isRecommended // ignore: cast_nullable_to_non_nullable
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
class _$MenuItemImpl implements _MenuItem {
  const _$MenuItemImpl(
      {required this.id,
      required this.restaurantId,
      required this.name,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.categoryId,
      final List<String> allergens = const [],
      final List<DietaryTag> dietaryTags = const [],
      final List<MenuItemCustomization> customizations = const [],
      this.isAvailable = true,
      this.preparationTime = 0,
      this.calories = 0,
      this.nutritionalInfo,
      this.isPopular = false,
      this.isRecommended = false,
      this.createdAt,
      this.updatedAt})
      : _allergens = allergens,
        _dietaryTags = dietaryTags,
        _customizations = customizations;

  factory _$MenuItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemImplFromJson(json);

  @override
  final String id;
  @override
  final String restaurantId;
  @override
  final String name;
  @override
  final String description;
  @override
  final double price;
  @override
  final String imageUrl;
  @override
  final String categoryId;
  final List<String> _allergens;
  @override
  @JsonKey()
  List<String> get allergens {
    if (_allergens is EqualUnmodifiableListView) return _allergens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allergens);
  }

  final List<DietaryTag> _dietaryTags;
  @override
  @JsonKey()
  List<DietaryTag> get dietaryTags {
    if (_dietaryTags is EqualUnmodifiableListView) return _dietaryTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dietaryTags);
  }

  final List<MenuItemCustomization> _customizations;
  @override
  @JsonKey()
  List<MenuItemCustomization> get customizations {
    if (_customizations is EqualUnmodifiableListView) return _customizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customizations);
  }

  @override
  @JsonKey()
  final bool isAvailable;
  @override
  @JsonKey()
  final int preparationTime;
  @override
  @JsonKey()
  final double calories;
  @override
  final String? nutritionalInfo;
  @override
  @JsonKey()
  final bool isPopular;
  @override
  @JsonKey()
  final bool isRecommended;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'MenuItem(id: $id, restaurantId: $restaurantId, name: $name, description: $description, price: $price, imageUrl: $imageUrl, categoryId: $categoryId, allergens: $allergens, dietaryTags: $dietaryTags, customizations: $customizations, isAvailable: $isAvailable, preparationTime: $preparationTime, calories: $calories, nutritionalInfo: $nutritionalInfo, isPopular: $isPopular, isRecommended: $isRecommended, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            const DeepCollectionEquality()
                .equals(other._allergens, _allergens) &&
            const DeepCollectionEquality()
                .equals(other._dietaryTags, _dietaryTags) &&
            const DeepCollectionEquality()
                .equals(other._customizations, _customizations) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.preparationTime, preparationTime) ||
                other.preparationTime == preparationTime) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.nutritionalInfo, nutritionalInfo) ||
                other.nutritionalInfo == nutritionalInfo) &&
            (identical(other.isPopular, isPopular) ||
                other.isPopular == isPopular) &&
            (identical(other.isRecommended, isRecommended) ||
                other.isRecommended == isRecommended) &&
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
      restaurantId,
      name,
      description,
      price,
      imageUrl,
      categoryId,
      const DeepCollectionEquality().hash(_allergens),
      const DeepCollectionEquality().hash(_dietaryTags),
      const DeepCollectionEquality().hash(_customizations),
      isAvailable,
      preparationTime,
      calories,
      nutritionalInfo,
      isPopular,
      isRecommended,
      createdAt,
      updatedAt);

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemImplCopyWith<_$MenuItemImpl> get copyWith =>
      __$$MenuItemImplCopyWithImpl<_$MenuItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuItemImplToJson(
      this,
    );
  }
}

abstract class _MenuItem implements MenuItem {
  const factory _MenuItem(
      {required final String id,
      required final String restaurantId,
      required final String name,
      required final String description,
      required final double price,
      required final String imageUrl,
      required final String categoryId,
      final List<String> allergens,
      final List<DietaryTag> dietaryTags,
      final List<MenuItemCustomization> customizations,
      final bool isAvailable,
      final int preparationTime,
      final double calories,
      final String? nutritionalInfo,
      final bool isPopular,
      final bool isRecommended,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$MenuItemImpl;

  factory _MenuItem.fromJson(Map<String, dynamic> json) =
      _$MenuItemImpl.fromJson;

  @override
  String get id;
  @override
  String get restaurantId;
  @override
  String get name;
  @override
  String get description;
  @override
  double get price;
  @override
  String get imageUrl;
  @override
  String get categoryId;
  @override
  List<String> get allergens;
  @override
  List<DietaryTag> get dietaryTags;
  @override
  List<MenuItemCustomization> get customizations;
  @override
  bool get isAvailable;
  @override
  int get preparationTime;
  @override
  double get calories;
  @override
  String? get nutritionalInfo;
  @override
  bool get isPopular;
  @override
  bool get isRecommended;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuItemImplCopyWith<_$MenuItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuCategory _$MenuCategoryFromJson(Map<String, dynamic> json) {
  return _MenuCategory.fromJson(json);
}

/// @nodoc
mixin _$MenuCategory {
  String get id => throw _privateConstructorUsedError;
  String get restaurantId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

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
      {String id,
      String restaurantId,
      String name,
      String description,
      String imageUrl,
      int sortOrder,
      bool isAvailable,
      DateTime? createdAt,
      DateTime? updatedAt});
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
    Object? id = null,
    Object? restaurantId = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? sortOrder = null,
    Object? isAvailable = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
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
abstract class _$$MenuCategoryImplCopyWith<$Res>
    implements $MenuCategoryCopyWith<$Res> {
  factory _$$MenuCategoryImplCopyWith(
          _$MenuCategoryImpl value, $Res Function(_$MenuCategoryImpl) then) =
      __$$MenuCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String restaurantId,
      String name,
      String description,
      String imageUrl,
      int sortOrder,
      bool isAvailable,
      DateTime? createdAt,
      DateTime? updatedAt});
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
    Object? id = null,
    Object? restaurantId = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? sortOrder = null,
    Object? isAvailable = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$MenuCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
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
class _$MenuCategoryImpl implements _MenuCategory {
  const _$MenuCategoryImpl(
      {required this.id,
      required this.restaurantId,
      required this.name,
      required this.description,
      this.imageUrl = '',
      this.sortOrder = 0,
      this.isAvailable = true,
      this.createdAt,
      this.updatedAt});

  factory _$MenuCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuCategoryImplFromJson(json);

  @override
  final String id;
  @override
  final String restaurantId;
  @override
  final String name;
  @override
  final String description;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final int sortOrder;
  @override
  @JsonKey()
  final bool isAvailable;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'MenuCategory(id: $id, restaurantId: $restaurantId, name: $name, description: $description, imageUrl: $imageUrl, sortOrder: $sortOrder, isAvailable: $isAvailable, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, restaurantId, name,
      description, imageUrl, sortOrder, isAvailable, createdAt, updatedAt);

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
      {required final String id,
      required final String restaurantId,
      required final String name,
      required final String description,
      final String imageUrl,
      final int sortOrder,
      final bool isAvailable,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$MenuCategoryImpl;

  factory _MenuCategory.fromJson(Map<String, dynamic> json) =
      _$MenuCategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get restaurantId;
  @override
  String get name;
  @override
  String get description;
  @override
  String get imageUrl;
  @override
  int get sortOrder;
  @override
  bool get isAvailable;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of MenuCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuCategoryImplCopyWith<_$MenuCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuItemCustomization _$MenuItemCustomizationFromJson(
    Map<String, dynamic> json) {
  return _MenuItemCustomization.fromJson(json);
}

/// @nodoc
mixin _$MenuItemCustomization {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // 'single', 'multiple', 'quantity'
  bool get isRequired => throw _privateConstructorUsedError;
  List<CustomizationOption> get options => throw _privateConstructorUsedError;

  /// Serializes this MenuItemCustomization to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuItemCustomization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuItemCustomizationCopyWith<MenuItemCustomization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemCustomizationCopyWith<$Res> {
  factory $MenuItemCustomizationCopyWith(MenuItemCustomization value,
          $Res Function(MenuItemCustomization) then) =
      _$MenuItemCustomizationCopyWithImpl<$Res, MenuItemCustomization>;
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      bool isRequired,
      List<CustomizationOption> options});
}

/// @nodoc
class _$MenuItemCustomizationCopyWithImpl<$Res,
        $Val extends MenuItemCustomization>
    implements $MenuItemCustomizationCopyWith<$Res> {
  _$MenuItemCustomizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuItemCustomization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? isRequired = null,
    Object? options = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<CustomizationOption>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuItemCustomizationImplCopyWith<$Res>
    implements $MenuItemCustomizationCopyWith<$Res> {
  factory _$$MenuItemCustomizationImplCopyWith(
          _$MenuItemCustomizationImpl value,
          $Res Function(_$MenuItemCustomizationImpl) then) =
      __$$MenuItemCustomizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      bool isRequired,
      List<CustomizationOption> options});
}

/// @nodoc
class __$$MenuItemCustomizationImplCopyWithImpl<$Res>
    extends _$MenuItemCustomizationCopyWithImpl<$Res,
        _$MenuItemCustomizationImpl>
    implements _$$MenuItemCustomizationImplCopyWith<$Res> {
  __$$MenuItemCustomizationImplCopyWithImpl(_$MenuItemCustomizationImpl _value,
      $Res Function(_$MenuItemCustomizationImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuItemCustomization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? isRequired = null,
    Object? options = null,
  }) {
    return _then(_$MenuItemCustomizationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<CustomizationOption>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuItemCustomizationImpl implements _MenuItemCustomization {
  const _$MenuItemCustomizationImpl(
      {required this.id,
      required this.name,
      required this.type,
      required this.isRequired,
      final List<CustomizationOption> options = const []})
      : _options = options;

  factory _$MenuItemCustomizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemCustomizationImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
// 'single', 'multiple', 'quantity'
  @override
  final bool isRequired;
  final List<CustomizationOption> _options;
  @override
  @JsonKey()
  List<CustomizationOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'MenuItemCustomization(id: $id, name: $name, type: $type, isRequired: $isRequired, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemCustomizationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, type, isRequired,
      const DeepCollectionEquality().hash(_options));

  /// Create a copy of MenuItemCustomization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemCustomizationImplCopyWith<_$MenuItemCustomizationImpl>
      get copyWith => __$$MenuItemCustomizationImplCopyWithImpl<
          _$MenuItemCustomizationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuItemCustomizationImplToJson(
      this,
    );
  }
}

abstract class _MenuItemCustomization implements MenuItemCustomization {
  const factory _MenuItemCustomization(
      {required final String id,
      required final String name,
      required final String type,
      required final bool isRequired,
      final List<CustomizationOption> options}) = _$MenuItemCustomizationImpl;

  factory _MenuItemCustomization.fromJson(Map<String, dynamic> json) =
      _$MenuItemCustomizationImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get type; // 'single', 'multiple', 'quantity'
  @override
  bool get isRequired;
  @override
  List<CustomizationOption> get options;

  /// Create a copy of MenuItemCustomization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuItemCustomizationImplCopyWith<_$MenuItemCustomizationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CustomizationOption _$CustomizationOptionFromJson(Map<String, dynamic> json) {
  return _CustomizationOption.fromJson(json);
}

/// @nodoc
mixin _$CustomizationOption {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get additionalPrice => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;

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
  $Res call({String id, String name, double additionalPrice, bool isAvailable});
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
    Object? additionalPrice = null,
    Object? isAvailable = null,
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
      additionalPrice: null == additionalPrice
          ? _value.additionalPrice
          : additionalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call({String id, String name, double additionalPrice, bool isAvailable});
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
    Object? additionalPrice = null,
    Object? isAvailable = null,
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
      additionalPrice: null == additionalPrice
          ? _value.additionalPrice
          : additionalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomizationOptionImpl implements _CustomizationOption {
  const _$CustomizationOptionImpl(
      {required this.id,
      required this.name,
      required this.additionalPrice,
      this.isAvailable = true});

  factory _$CustomizationOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomizationOptionImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double additionalPrice;
  @override
  @JsonKey()
  final bool isAvailable;

  @override
  String toString() {
    return 'CustomizationOption(id: $id, name: $name, additionalPrice: $additionalPrice, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomizationOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.additionalPrice, additionalPrice) ||
                other.additionalPrice == additionalPrice) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, additionalPrice, isAvailable);

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
      required final double additionalPrice,
      final bool isAvailable}) = _$CustomizationOptionImpl;

  factory _CustomizationOption.fromJson(Map<String, dynamic> json) =
      _$CustomizationOptionImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get additionalPrice;
  @override
  bool get isAvailable;

  /// Create a copy of CustomizationOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomizationOptionImplCopyWith<_$CustomizationOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
