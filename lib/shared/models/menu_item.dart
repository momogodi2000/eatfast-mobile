import 'package:json_annotation/json_annotation.dart';

/// Menu Item Model
part 'menu_item.g.dart';
part 'customization_option.g.dart';

@JsonSerializable()
class MenuItem {
  final String id;
  final String restaurantId;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final bool isAvailable;
  final List<String> categories;
  final List<CustomizationOption> customizationOptions;

  const MenuItem({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.isAvailable,
    required this.categories,
    required this.customizationOptions,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemToJson(this);
}

/// Customization Option Model

@JsonSerializable()
class CustomizationOption {
  final String id;
  final String name;
  final List<String> choices;
  final bool isRequired;
  final double additionalPrice;

  const CustomizationOption({
    required this.id,
    required this.name,
    required this.choices,
    required this.isRequired,
    this.additionalPrice = 0.0,
  });

  factory CustomizationOption.fromJson(Map<String, dynamic> json) => _$CustomizationOptionFromJson(json);
  Map<String, dynamic> toJson() => _$CustomizationOptionToJson(this);
}
