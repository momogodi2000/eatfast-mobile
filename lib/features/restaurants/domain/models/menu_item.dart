import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item.freezed.dart';
part 'menu_item.g.dart';

@freezed
class MenuItem with _$MenuItem {
  const factory MenuItem({
    required String id,
    required String restaurantId,
    required String name,
    required String description,
    required double price,
    required String imageUrl,
    required String categoryId,
    @Default([]) List<String> allergens,
    @Default([]) List<DietaryTag> dietaryTags,
    @Default([]) List<MenuItemCustomization> customizations,
    @Default(true) bool isAvailable,
    @Default(0) int preparationTime,
    @Default(0) double calories,
    String? nutritionalInfo,
    @Default(false) bool isPopular,
    @Default(false) bool isRecommended,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _MenuItem;

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);
}

@freezed
class MenuCategory with _$MenuCategory {
  const factory MenuCategory({
    required String id,
    required String restaurantId,
    required String name,
    required String description,
    @Default('') String imageUrl,
    @Default(0) int sortOrder,
    @Default(true) bool isAvailable,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _MenuCategory;

  factory MenuCategory.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryFromJson(json);
}

@freezed
class MenuItemCustomization with _$MenuItemCustomization {
  const factory MenuItemCustomization({
    required String id,
    required String name,
    required String type, // 'single', 'multiple', 'quantity'
    required bool isRequired,
    @Default([]) List<CustomizationOption> options,
  }) = _MenuItemCustomization;

  factory MenuItemCustomization.fromJson(Map<String, dynamic> json) =>
      _$MenuItemCustomizationFromJson(json);
}

@freezed
class CustomizationOption with _$CustomizationOption {
  const factory CustomizationOption({
    required String id,
    required String name,
    required double additionalPrice,
    @Default(true) bool isAvailable,
  }) = _CustomizationOption;

  factory CustomizationOption.fromJson(Map<String, dynamic> json) =>
      _$CustomizationOptionFromJson(json);
}

enum DietaryTag {
  @JsonValue('vegetarian')
  vegetarian,
  @JsonValue('vegan')
  vegan,
  @JsonValue('gluten_free')
  glutenFree,
  @JsonValue('dairy_free')
  dairyFree,
  @JsonValue('halal')
  halal,
  @JsonValue('kosher')
  kosher,
  @JsonValue('spicy')
  spicy,
  @JsonValue('healthy')
  healthy,
  @JsonValue('organic')
  organic,
}