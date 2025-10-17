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
    @Default([]) List<MenuItemDetails> items,
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
    required bool isPopular,
    required int preparationTime,
    String? imageUrl,
    @Default([]) List<String> allergens,
    @Default([]) List<String> dietaryTags,
    @Default([]) List<CustomizationOption> customizations,
    @Default(0) int orderCount,
    @Default(0.0) double rating,
    @Default(0) int reviewCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _MenuItemDetails;

  factory MenuItemDetails.fromJson(Map<String, dynamic> json) =>
      _$MenuItemDetailsFromJson(json);
}

@freezed
class CustomizationOption with _$CustomizationOption {
  const factory CustomizationOption({
    required String optionId,
    required String name,
    required CustomizationType type,
    required bool isRequired,
    @Default([]) List<CustomizationChoice> choices,
  }) = _CustomizationOption;

  factory CustomizationOption.fromJson(Map<String, dynamic> json) =>
      _$CustomizationOptionFromJson(json);
}

@freezed
class CustomizationChoice with _$CustomizationChoice {
  const factory CustomizationChoice({
    required String choiceId,
    required String name,
    required double additionalPrice,
    required bool isDefault,
    required bool isAvailable,
  }) = _CustomizationChoice;

  factory CustomizationChoice.fromJson(Map<String, dynamic> json) =>
      _$CustomizationChoiceFromJson(json);
}

enum CustomizationType {
  @JsonValue('single_choice')
  singleChoice,
  @JsonValue('multiple_choice')
  multipleChoice,
  @JsonValue('text_input')
  textInput,
}

@freezed
class MenuItemPerformance with _$MenuItemPerformance {
  const factory MenuItemPerformance({
    required String itemId,
    required String itemName,
    required int totalOrders,
    required double totalRevenue,
    required double averageRating,
    required int reviewCount,
    required double profitMargin,
    @Default([]) List<DailyPerformance> dailyStats,
  }) = _MenuItemPerformance;

  factory MenuItemPerformance.fromJson(Map<String, dynamic> json) =>
      _$MenuItemPerformanceFromJson(json);
}

@freezed
class DailyPerformance with _$DailyPerformance {
  const factory DailyPerformance({
    required DateTime date,
    required int orders,
    required double revenue,
  }) = _DailyPerformance;

  factory DailyPerformance.fromJson(Map<String, dynamic> json) =>
      _$DailyPerformanceFromJson(json);
}
