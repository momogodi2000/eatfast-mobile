import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_management.freezed.dart';
part 'menu_management.g.dart';

@freezed
class MenuCategory with _$MenuCategory {
  const factory MenuCategory({
    required String categoryId,
    required String name,
    required String description,
    required int sortOrder,
    required bool isActive,
    String? imageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<MenuItemDetails>? items,
  }) = _MenuCategory;

  factory MenuCategory.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryFromJson(json);
}

@freezed
class MenuItemDetails with _$MenuItemDetails {
  const factory MenuItemDetails({
    required String itemId,
    required String name,
    required String description,
    required double price,
    required bool isAvailable,
    required int preparationTime,
    String? imageUrl,
    List<String>? allergens,
    List<String>? dietaryTags,
    List<CustomizationOption>? customizations,
    int? orderCount,
    double? rating,
    int? reviewCount,
    @Default(false) bool isPopular,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _MenuItemDetails;

  factory MenuItemDetails.fromJson(Map<String, dynamic> json) =>
      _$MenuItemDetailsFromJson(json);
}

@JsonEnum()
enum CustomizationType {
  SINGLE_SELECT,
  MULTI_SELECT,
  QUANTITY,
}

@freezed
class CustomizationOption with _$CustomizationOption {
  const factory CustomizationOption({
    required String id,
    required String name,
    required String description,
    required CustomizationType type,
    required bool required,
    required int maxSelections,
    List<CustomizationChoice>? choices,
  }) = _CustomizationOption;

  factory CustomizationOption.fromJson(Map<String, dynamic> json) =>
      _$CustomizationOptionFromJson(json);
}

@freezed
class CustomizationChoice with _$CustomizationChoice {
  const factory CustomizationChoice({
    required String id,
    required String name,
    required double price,
    required bool isAvailable,
    required bool isDefault,
  }) = _CustomizationChoice;

  factory CustomizationChoice.fromJson(Map<String, dynamic> json) =>
      _$CustomizationChoiceFromJson(json);
}