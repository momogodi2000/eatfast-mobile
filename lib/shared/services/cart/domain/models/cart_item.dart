import 'package:eatfast_mobile/shared/services/restaurants/domain/models/menu_item.dart';

/// Selected customization for a cart item
class SelectedCustomization {
  final String customizationName;
  final List<CustomizationOption> options;

  const SelectedCustomization({
    required this.customizationName,
    required this.options,
  });

  factory SelectedCustomization.fromJson(Map<String, dynamic> json) {
    return SelectedCustomization(
      customizationName: json['customizationName'] as String,
      options:
          (json['options'] as List<dynamic>?)
              ?.map(
                (e) => CustomizationOption.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customizationName': customizationName,
      'options': options.map((e) => e.toJson()).toList(),
    };
  }
}

/// Cart item model
class CartItem {
  final String id;
  final String menuItemId;
  final String name;
  final String? description;
  final int quantity;
  final double price;
  final double total;
  final String? imageUrl;
  final String? restaurantId;
  final String? restaurantName;
  final List<SelectedCustomization> customizations;
  final List<String>? selectedOptions;
  final String? specialInstructions;
  final MenuItem? menuItem;
  final DateTime? addedAt;

  // Convenience getter for itemTotal (alias for total)
  double get itemTotal => total;

  // Convenience getter for totalPrice (alias for total)
  double get totalPrice => total;

  const CartItem({
    required this.id,
    required this.menuItemId,
    required this.name,
    this.description,
    required this.quantity,
    required this.price,
    required this.total,
    this.imageUrl,
    this.restaurantId,
    this.restaurantName,
    this.customizations = const [],
    this.selectedOptions,
    this.specialInstructions,
    this.menuItem,
    this.addedAt,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] as String,
      menuItemId: json['menuItemId'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
      restaurantId: json['restaurantId'] as String?,
      restaurantName: json['restaurantName'] as String?,
      customizations:
          (json['customizations'] as List<dynamic>?)
              ?.map(
                (e) =>
                    SelectedCustomization.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
      selectedOptions: (json['selectedOptions'] as List<dynamic>?)
          ?.cast<String>(),
      specialInstructions: json['specialInstructions'] as String?,
      menuItem: json['menuItem'] != null
          ? MenuItem.fromJson(json['menuItem'] as Map<String, dynamic>)
          : null,
      addedAt: json['addedAt'] != null
          ? DateTime.parse(json['addedAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'menuItemId': menuItemId,
      'name': name,
      if (description != null) 'description': description,
      'quantity': quantity,
      'price': price,
      'total': total,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (restaurantId != null) 'restaurantId': restaurantId,
      if (restaurantName != null) 'restaurantName': restaurantName,
      'customizations': customizations.map((e) => e.toJson()).toList(),
      if (selectedOptions != null) 'selectedOptions': selectedOptions,
      if (specialInstructions != null)
        'specialInstructions': specialInstructions,
      if (menuItem != null) 'menuItem': menuItem!.toJson(),
      if (addedAt != null) 'addedAt': addedAt!.toIso8601String(),
    };
  }

  CartItem copyWith({
    String? id,
    String? menuItemId,
    String? name,
    String? description,
    int? quantity,
    double? price,
    double? total,
    String? imageUrl,
    String? restaurantId,
    String? restaurantName,
    List<SelectedCustomization>? customizations,
    List<String>? selectedOptions,
    String? specialInstructions,
    MenuItem? menuItem,
    DateTime? addedAt,
  }) {
    return CartItem(
      id: id ?? this.id,
      menuItemId: menuItemId ?? this.menuItemId,
      name: name ?? this.name,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      total: total ?? this.total,
      imageUrl: imageUrl ?? this.imageUrl,
      restaurantId: restaurantId ?? this.restaurantId,
      restaurantName: restaurantName ?? this.restaurantName,
      customizations: customizations ?? this.customizations,
      selectedOptions: selectedOptions ?? this.selectedOptions,
      specialInstructions: specialInstructions ?? this.specialInstructions,
      menuItem: menuItem ?? this.menuItem,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}
