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
  final Map<String, dynamic>? customizations;
  final List<String>? selectedOptions;
  final String? specialInstructions;

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
    this.customizations,
    this.selectedOptions,
    this.specialInstructions,
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
      customizations: json['customizations'] as Map<String, dynamic>?,
      selectedOptions: (json['selectedOptions'] as List<dynamic>?)
          ?.cast<String>(),
      specialInstructions: json['specialInstructions'] as String?,
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
      if (customizations != null) 'customizations': customizations,
      if (selectedOptions != null) 'selectedOptions': selectedOptions,
      if (specialInstructions != null)
        'specialInstructions': specialInstructions,
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
    Map<String, dynamic>? customizations,
    List<String>? selectedOptions,
    String? specialInstructions,
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
    );
  }
}
