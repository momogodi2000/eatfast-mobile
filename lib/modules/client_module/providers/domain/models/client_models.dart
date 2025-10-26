/// Client Domain Models
/// Data models for client/customer module
library;

import 'package:eatfast_mobile/shared/models/exports.dart' as shared_models;

// =================================================================
// LOYALTY PROGRAM MODELS
// =================================================================

class LoyaltyStatus {
  final int currentPoints;
  final String tier;
  final int pointsToNextTier;
  final String? nextTier;
  final int lifetimePoints;
  final List<LoyaltyReward> availableRewards;

  LoyaltyStatus({
    required this.currentPoints,
    required this.tier,
    required this.pointsToNextTier,
    this.nextTier,
    required this.lifetimePoints,
    required this.availableRewards,
  });

  factory LoyaltyStatus.fromJson(Map<String, dynamic> json) {
    return LoyaltyStatus(
      currentPoints: json['currentPoints'] as int? ?? 0,
      tier: json['tier'] as String? ?? 'bronze',
      pointsToNextTier: json['pointsToNextTier'] as int? ?? 0,
      nextTier: json['nextTier'] as String?,
      lifetimePoints: json['lifetimePoints'] as int? ?? 0,
      availableRewards: (json['availableRewards'] as List<dynamic>?)
              ?.map((r) => LoyaltyReward.fromJson(r as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentPoints': currentPoints,
      'tier': tier,
      'pointsToNextTier': pointsToNextTier,
      'nextTier': nextTier,
      'lifetimePoints': lifetimePoints,
      'availableRewards': availableRewards.map((r) => r.toJson()).toList(),
    };
  }
}

class LoyaltyReward {
  final String id;
  final String name;
  final int cost;
  final String description;
  final String? imageUrl;

  LoyaltyReward({
    required this.id,
    required this.name,
    required this.cost,
    required this.description,
    this.imageUrl,
  });

  factory LoyaltyReward.fromJson(Map<String, dynamic> json) {
    return LoyaltyReward(
      id: json['id'] as String,
      name: json['name'] as String,
      cost: json['cost'] as int,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'cost': cost,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}

// =================================================================
// CLIENT RESTAURANT MODELS
// =================================================================

class ClientRestaurant {
  final String id;
  final String name;
  final String description;
  final String? imageUrl;
  final double rating;
  final int reviewCount;
  final String cuisineType;
  final String address;
  final double? distance;
  final int? estimatedDeliveryTime;
  final bool isOpen;
  final bool isFavorite;
  final double? minimumOrder;
  final double? deliveryFee;

  ClientRestaurant({
    required this.id,
    required this.name,
    required this.description,
    this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.cuisineType,
    required this.address,
    this.distance,
    this.estimatedDeliveryTime,
    required this.isOpen,
    this.isFavorite = false,
    this.minimumOrder,
    this.deliveryFee,
  });

  factory ClientRestaurant.fromJson(Map<String, dynamic> json) {
    return ClientRestaurant(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? json['image_url'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['reviewCount'] as int? ?? json['review_count'] as int? ?? 0,
      cuisineType: json['cuisineType'] as String? ?? json['cuisine_type'] as String? ?? '',
      address: json['address'] as String? ?? '',
      distance: (json['distance'] as num?)?.toDouble(),
      estimatedDeliveryTime: json['estimatedDeliveryTime'] as int? ?? json['estimated_delivery_time'] as int?,
      isOpen: json['isOpen'] as bool? ?? json['is_open'] as bool? ?? false,
      isFavorite: json['isFavorite'] as bool? ?? json['is_favorite'] as bool? ?? false,
      minimumOrder: (json['minimumOrder'] as num?)?.toDouble() ?? (json['minimum_order'] as num?)?.toDouble(),
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? (json['delivery_fee'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'rating': rating,
      'reviewCount': reviewCount,
      'cuisineType': cuisineType,
      'address': address,
      'distance': distance,
      'estimatedDeliveryTime': estimatedDeliveryTime,
      'isOpen': isOpen,
      'isFavorite': isFavorite,
      'minimumOrder': minimumOrder,
      'deliveryFee': deliveryFee,
    };
  }

  ClientRestaurant copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    double? rating,
    int? reviewCount,
    String? cuisineType,
    String? address,
    double? distance,
    int? estimatedDeliveryTime,
    bool? isOpen,
    bool? isFavorite,
    double? minimumOrder,
    double? deliveryFee,
  }) {
    return ClientRestaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      cuisineType: cuisineType ?? this.cuisineType,
      address: address ?? this.address,
      distance: distance ?? this.distance,
      estimatedDeliveryTime: estimatedDeliveryTime ?? this.estimatedDeliveryTime,
      isOpen: isOpen ?? this.isOpen,
      isFavorite: isFavorite ?? this.isFavorite,
      minimumOrder: minimumOrder ?? this.minimumOrder,
      deliveryFee: deliveryFee ?? this.deliveryFee,
    );
  }
}

// =================================================================
// CLIENT ORDER MODELS
// =================================================================

class ClientOrder {
  final String id;
  final String orderNumber;
  final String restaurantId;
  final String restaurantName;
  final String? restaurantImage;
  final List<OrderItem> items;
  final shared_models.OrderStatus status;
  final double subtotal;
  final double deliveryFee;
  final double tax;
  final double total;
  final String deliveryAddress;
  final DateTime createdAt;
  final DateTime? estimatedDeliveryTime;
  final DateTime? actualDeliveryTime;
  final String? driverId;
  final String? driverName;
  final String? driverPhone;
  final bool canCancel;
  final bool canRate;

  ClientOrder({
    required this.id,
    required this.orderNumber,
    required this.restaurantId,
    required this.restaurantName,
    this.restaurantImage,
    required this.items,
    required this.status,
    required this.subtotal,
    required this.deliveryFee,
    required this.tax,
    required this.total,
    required this.deliveryAddress,
    required this.createdAt,
    this.estimatedDeliveryTime,
    this.actualDeliveryTime,
    this.driverId,
    this.driverName,
    this.driverPhone,
    this.canCancel = false,
    this.canRate = false,
  });

  factory ClientOrder.fromJson(Map<String, dynamic> json) {
    return ClientOrder(
      id: json['id'] as String,
      orderNumber: json['orderNumber'] as String? ?? json['order_number'] as String? ?? '',
      restaurantId: json['restaurantId'] as String? ?? json['restaurant_id'] as String? ?? '',
      restaurantName: json['restaurantName'] as String? ?? json['restaurant_name'] as String? ?? '',
      restaurantImage: json['restaurantImage'] as String? ?? json['restaurant_image'] as String?,
      items: (json['items'] as List<dynamic>?)
              ?.map((item) => OrderItem.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
  status: shared_models.OrderStatus.fromString(json['status'] as String? ?? 'pending'),
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0.0,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? (json['delivery_fee'] as num?)?.toDouble() ?? 0.0,
      tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      deliveryAddress: json['deliveryAddress'] as String? ?? json['delivery_address'] as String? ?? '',
      createdAt: DateTime.parse(json['createdAt'] as String? ?? json['created_at'] as String? ?? DateTime.now().toIso8601String()),
      estimatedDeliveryTime: json['estimatedDeliveryTime'] != null || json['estimated_delivery_time'] != null
          ? DateTime.parse((json['estimatedDeliveryTime'] ?? json['estimated_delivery_time']) as String)
          : null,
      actualDeliveryTime: json['actualDeliveryTime'] != null || json['actual_delivery_time'] != null
          ? DateTime.parse((json['actualDeliveryTime'] ?? json['actual_delivery_time']) as String)
          : null,
      driverId: json['driverId'] as String? ?? json['driver_id'] as String?,
      driverName: json['driverName'] as String? ?? json['driver_name'] as String?,
      driverPhone: json['driverPhone'] as String? ?? json['driver_phone'] as String?,
      canCancel: json['canCancel'] as bool? ?? json['can_cancel'] as bool? ?? false,
      canRate: json['canRate'] as bool? ?? json['can_rate'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderNumber': orderNumber,
      'restaurantId': restaurantId,
      'restaurantName': restaurantName,
      'restaurantImage': restaurantImage,
      'items': items.map((item) => item.toJson()).toList(),
      'status': status.name,
      'subtotal': subtotal,
      'deliveryFee': deliveryFee,
      'tax': tax,
      'total': total,
      'deliveryAddress': deliveryAddress,
      'createdAt': createdAt.toIso8601String(),
      'estimatedDeliveryTime': estimatedDeliveryTime?.toIso8601String(),
      'actualDeliveryTime': actualDeliveryTime?.toIso8601String(),
      'driverId': driverId,
      'driverName': driverName,
      'driverPhone': driverPhone,
      'canCancel': canCancel,
      'canRate': canRate,
    };
  }
}

class OrderItem {
  final String id;
  final String menuId;
  final String name;
  final int quantity;
  final double price;
  final double total;
  final List<String> customizations;
  final String? imageUrl;

  OrderItem({
    required this.id,
    required this.menuId,
    required this.name,
    required this.quantity,
    required this.price,
    required this.total,
    this.customizations = const [],
    this.imageUrl,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'] as String,
      menuId: json['menuId'] as String? ?? json['menu_id'] as String? ?? '',
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      customizations: (json['customizations'] as List<dynamic>?)?.cast<String>() ?? [],
      imageUrl: json['imageUrl'] as String? ?? json['image_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'menuId': menuId,
      'name': name,
      'quantity': quantity,
      'price': price,
      'total': total,
      'customizations': customizations,
      'imageUrl': imageUrl,
    };
  }
}

// =================================================================
// CLIENT WALLET MODELS
// =================================================================

class ClientWallet {
  final double balance;
  final String currency;
  final double pendingCredits;
  final WalletTransaction? lastTransaction;

  ClientWallet({
    required this.balance,
    required this.currency,
    required this.pendingCredits,
    this.lastTransaction,
  });

  factory ClientWallet.fromJson(Map<String, dynamic> json) {
    return ClientWallet(
      balance: (json['balance'] as num?)?.toDouble() ?? 0.0,
      currency: json['currency'] as String? ?? 'XAF',
      pendingCredits: (json['pendingCredits'] as num?)?.toDouble() ?? (json['pending_credits'] as num?)?.toDouble() ?? 0.0,
      lastTransaction: json['lastTransaction'] != null || json['last_transaction'] != null
          ? WalletTransaction.fromJson((json['lastTransaction'] ?? json['last_transaction']) as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'balance': balance,
      'currency': currency,
      'pendingCredits': pendingCredits,
      'lastTransaction': lastTransaction?.toJson(),
    };
  }
}

class WalletTransaction {
  final String id;
  final String type;
  final double amount;
  final String description;
  final DateTime createdAt;

  WalletTransaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.description,
    required this.createdAt,
  });

  factory WalletTransaction.fromJson(Map<String, dynamic> json) {
    return WalletTransaction(
      id: json['id'] as String,
      type: json['type'] as String,
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String? ?? json['created_at'] as String? ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'amount': amount,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

