/// Menu Item Details Model
class MenuItemDetails {
  final String id;
  final String name;
  final String description;
  final double price;
  final String? imageUrl;
  final bool isAvailable;
  final String categoryId;
  final int preparationTime;
  final List<String>? allergens;
  final Map<String, dynamic>? customizations;

  const MenuItemDetails({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
    this.isAvailable = true,
    required this.categoryId,
    this.preparationTime = 15,
    this.allergens,
    this.customizations,
  });

  factory MenuItemDetails.fromJson(Map<String, dynamic> json) {
    return MenuItemDetails(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
      isAvailable: json['isAvailable'] as bool? ?? true,
      categoryId: json['categoryId'] as String,
      preparationTime: json['preparationTime'] as int? ?? 15,
      allergens: (json['allergens'] as List<dynamic>?)?.cast<String>(),
      customizations: json['customizations'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'isAvailable': isAvailable,
      'categoryId': categoryId,
      'preparationTime': preparationTime,
      if (allergens != null) 'allergens': allergens,
      if (customizations != null) 'customizations': customizations,
    };
  }

  MenuItemDetails copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    bool? isAvailable,
    String? categoryId,
    int? preparationTime,
    List<String>? allergens,
    Map<String, dynamic>? customizations,
  }) {
    return MenuItemDetails(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      isAvailable: isAvailable ?? this.isAvailable,
      categoryId: categoryId ?? this.categoryId,
      preparationTime: preparationTime ?? this.preparationTime,
      allergens: allergens ?? this.allergens,
      customizations: customizations ?? this.customizations,
    );
  }
}
