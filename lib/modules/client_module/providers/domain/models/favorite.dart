class Favorite {
  final String id;
  final String userId;
  final String itemId;
  final FavoriteType type;
  final DateTime createdAt;
  final Map<String, dynamic>? metadata; // Additional data like restaurant info, customization
  
  const Favorite({
    required this.id,
    required this.userId,
    required this.itemId,
    required this.type,
    required this.createdAt,
    this.metadata,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      id: json['id'],
      userId: json['userId'],
      itemId: json['itemId'],
      type: FavoriteType.values.firstWhere(
        (t) => t.name == json['type'],
        orElse: () => FavoriteType.restaurant,
      ),
      createdAt: DateTime.parse(json['createdAt']),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'itemId': itemId,
      'type': type.name,
      'createdAt': createdAt.toIso8601String(),
      'metadata': metadata,
    };
  }

  Favorite copyWith({
    String? id,
    String? userId,
    String? itemId,
    FavoriteType? type,
    DateTime? createdAt,
    Map<String, dynamic>? metadata,
  }) {
    return Favorite(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      itemId: itemId ?? this.itemId,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      metadata: metadata ?? this.metadata,
    );
  }
}

enum FavoriteType {
  restaurant,
  item;

  String get displayName {
    switch (this) {
      case FavoriteType.restaurant:
        return 'Restaurant';
      case FavoriteType.item:
        return 'Plat';
    }
  }

  String get icon {
    switch (this) {
      case FavoriteType.restaurant:
        return 'assets/icons/restaurant.svg';
      case FavoriteType.item:
        return 'assets/icons/food.svg';
    }
  }
}

class FavoriteItem {
  final Favorite favorite;
  final String name;
  final String description;
  final String imageUrl;
  final double? price;
  final double? rating;
  final int? reviewCount;
  final bool isAvailable;
  final String? restaurantName;
  final String? restaurantId;
  
  const FavoriteItem({
    required this.favorite,
    required this.name,
    required this.description,
    required this.imageUrl,
    this.price,
    this.rating,
    this.reviewCount,
    this.isAvailable = true,
    this.restaurantName,
    this.restaurantId,
  });

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    return FavoriteItem(
      favorite: Favorite.fromJson(json['favorite']),
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      price: json['price']?.toDouble(),
      rating: json['rating']?.toDouble(),
      reviewCount: json['reviewCount'],
      isAvailable: json['isAvailable'] ?? true,
      restaurantName: json['restaurantName'],
      restaurantId: json['restaurantId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'favorite': favorite.toJson(),
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'rating': rating,
      'reviewCount': reviewCount,
      'isAvailable': isAvailable,
      'restaurantName': restaurantName,
      'restaurantId': restaurantId,
    };
  }

  String get formattedPrice {
    return price != null ? '${price!.toInt()} FCFA' : 'Prix non disponible';
  }

  String get formattedRating {
    return rating != null ? rating!.toStringAsFixed(1) : 'N/A';
  }

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(favorite.createdAt);
    
    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return 'Il y a ${difference.inMinutes}min';
      }
      return 'Il y a ${difference.inHours}h';
    } else if (difference.inDays < 7) {
      return 'Il y a ${difference.inDays}j';
    } else if (difference.inDays < 30) {
      return 'Il y a ${(difference.inDays / 7).floor()}sem';
    } else {
      return 'Il y a ${(difference.inDays / 30).floor()}mois';
    }
  }
}

class ReorderItem {
  final String orderId;
  final String orderDate;
  final List<OrderItemData> items;
  final String restaurantId;
  final String restaurantName;
  final String restaurantImage;
  final double totalAmount;
  final int itemCount;
  
  const ReorderItem({
    required this.orderId,
    required this.orderDate,
    required this.items,
    required this.restaurantId,
    required this.restaurantName,
    required this.restaurantImage,
    required this.totalAmount,
    required this.itemCount,
  });

  factory ReorderItem.fromJson(Map<String, dynamic> json) {
    return ReorderItem(
      orderId: json['orderId'],
      orderDate: json['orderDate'],
      items: (json['items'] as List)
          .map((item) => OrderItemData.fromJson(item))
          .toList(),
      restaurantId: json['restaurantId'],
      restaurantName: json['restaurantName'],
      restaurantImage: json['restaurantImage'],
      totalAmount: (json['totalAmount'] as num).toDouble(),
      itemCount: json['itemCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'orderDate': orderDate,
      'items': items.map((item) => item.toJson()).toList(),
      'restaurantId': restaurantId,
      'restaurantName': restaurantName,
      'restaurantImage': restaurantImage,
      'totalAmount': totalAmount,
      'itemCount': itemCount,
    };
  }

  String get formattedTotal {
    return '${totalAmount.toInt()} FCFA';
  }

  String get itemSummary {
    if (items.length == 1) {
      return items.first.name;
    } else if (items.length == 2) {
      return '${items.first.name}, ${items.last.name}';
    } else {
      return '${items.first.name} et ${items.length - 1} autre${items.length > 2 ? 's' : ''}';
    }
  }
}

class OrderItemData {
  final String id;
  final String name;
  final String image;
  final double price;
  final int quantity;
  final List<String> customizations;
  
  const OrderItemData({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    this.customizations = const [],
  });

  factory OrderItemData.fromJson(Map<String, dynamic> json) {
    return OrderItemData(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      customizations: List<String>.from(json['customizations'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'customizations': customizations,
    };
  }
}
