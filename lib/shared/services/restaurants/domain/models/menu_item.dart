// Temporary manual implementation until build_runner is fixed
class MenuItem {
  const MenuItem({
    required this.id,
    required this.restaurantId,
    this.categoryId,
    required this.name,
    this.description,
    required this.price,
    this.imageUrl,
    required this.category,
    this.allergens = const [],
    this.ingredients = const [],
    this.options = const [],
    this.dietaryTags = const [],
    this.isAvailable = true,
    this.isActive = true,
    this.isPopular = false,
    this.isRecommended = false,
    this.preparationTime = 0,
    this.calories = 0,
    this.nutritionalInfo,
    this.isVegetarian = false,
    this.isVegan = false,
    this.featured = false,
    this.popularityScore = 0,
    this.discount = 0.0,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String restaurantId;
  final String? categoryId;
  final String name;
  final String? description;
  final double price;
  final String? imageUrl;
  final String category;
  final List<String> allergens;
  final List<String> ingredients;
  final List<MenuItemCustomization> options;
  final List<DietaryTag> dietaryTags;
  final bool isAvailable;
  final bool isActive;
  final bool isPopular;
  final bool isRecommended;
  final int preparationTime;
  final int calories;
  final String? nutritionalInfo;
  final bool isVegetarian;
  final bool isVegan;
  final bool featured;
  final int popularityScore;
  final double discount;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'] as String,
      restaurantId: json['restaurantId'] as String,
      categoryId: json['categoryId'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
      category: json['category'] as String,
      allergens: (json['allergens'] as List<dynamic>?)?.cast<String>() ?? [],
      ingredients: (json['ingredients'] as List<dynamic>?)?.cast<String>() ?? [],
      options: (json['options'] as List<dynamic>?)?.map((e) => MenuItemCustomization.fromJson(e as Map<String, dynamic>)).toList() ?? [],
      dietaryTags: (json['dietaryTags'] as List<dynamic>?)?.map((e) => DietaryTag.values.firstWhere((tag) => tag.name == e)).toList() ?? [],
      isAvailable: json['isAvailable'] as bool? ?? true,
      isActive: json['isActive'] as bool? ?? true,
      isPopular: json['isPopular'] as bool? ?? false,
      isRecommended: json['isRecommended'] as bool? ?? false,
      preparationTime: json['preparationTime'] as int? ?? 0,
      calories: json['calories'] as int? ?? 0,
      nutritionalInfo: json['nutritionalInfo'] as String?,
      isVegetarian: json['isVegetarian'] as bool? ?? false,
      isVegan: json['isVegan'] as bool? ?? false,
      featured: json['featured'] as bool? ?? false,
      popularityScore: json['popularityScore'] as int? ?? 0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'restaurantId': restaurantId,
      'categoryId': categoryId,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'category': category,
      'allergens': allergens,
      'ingredients': ingredients,
      'options': options.map((e) => e.toJson()).toList(),
      'dietaryTags': dietaryTags.map((e) => e.name).toList(),
      'isAvailable': isAvailable,
      'isActive': isActive,
      'isPopular': isPopular,
      'isRecommended': isRecommended,
      'preparationTime': preparationTime,
      'calories': calories,
      'nutritionalInfo': nutritionalInfo,
      'isVegetarian': isVegetarian,
      'isVegan': isVegan,
      'featured': featured,
      'popularityScore': popularityScore,
      'discount': discount,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

class MenuCategory {
  final String id;
  final String name;
  final String description;
  final int displayOrder;

  MenuCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.displayOrder,
  });

  factory MenuCategory.fromJson(Map<String, dynamic> json) {
    return MenuCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      displayOrder: json['displayOrder'] as int? ?? 0,
    );
  }
}

class MenuItemCustomization {
  const MenuItemCustomization({
    required this.id,
    required this.name,
    required this.type,
    required this.isRequired,
    this.options = const [],
  });

  final String id;
  final String name;
  final String type;
  final bool isRequired;
  final List<CustomizationOption> options;

  factory MenuItemCustomization.fromJson(Map<String, dynamic> json) {
    return MenuItemCustomization(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      isRequired: json['isRequired'] as bool,
      options: (json['options'] as List<dynamic>?)?.map((e) => CustomizationOption.fromJson(e as Map<String, dynamic>)).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'isRequired': isRequired,
      'options': options.map((e) => e.toJson()).toList(),
    };
  }
}

class CustomizationOption {
  const CustomizationOption({
    required this.id,
    required this.name,
    required this.additionalPrice,
    this.isAvailable = true,
  });

  final String id;
  final String name;
  final double additionalPrice;
  final bool isAvailable;

  factory CustomizationOption.fromJson(Map<String, dynamic> json) {
    return CustomizationOption(
      id: json['id'] as String,
      name: json['name'] as String,
      additionalPrice: (json['additionalPrice'] as num).toDouble(),
      isAvailable: json['isAvailable'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'additionalPrice': additionalPrice,
      'isAvailable': isAvailable,
    };
  }
}

enum DietaryTag {
  vegetarian,
  vegan,
  glutenFree,
  dairyFree,
  halal,
  kosher,
  spicy,
  healthy,
  organic,
}
