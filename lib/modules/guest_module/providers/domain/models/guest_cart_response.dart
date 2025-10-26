// These models are manually implemented until code generation is run

/// Guest cart response model
class GuestCartResponse {
  final bool success;
  final String? message;
  final List<GuestCartItem> items;
  final double? totalAmount;
  final int? itemCount;

  const GuestCartResponse({
    required this.success,
    this.message,
    this.items = const [],
    this.totalAmount,
    this.itemCount,
  });

  factory GuestCartResponse.fromJson(Map<String, dynamic> json) {
    return GuestCartResponse(
      success: json['success'] as bool,
      message: json['message'] as String?,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => GuestCartItem.fromJson(e as Map<String, dynamic>))
              .toList() ?? [],
      totalAmount: json['totalAmount'] as double?,
      itemCount: json['itemCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'items': items.map((e) => e.toJson()).toList(),
      'totalAmount': totalAmount,
      'itemCount': itemCount,
    };
  }
}

/// Guest cart item model
class GuestCartItem {
  final String id;
  final String menuItemId;
  final String name;
  final double price;
  final int quantity;
  final String? imageUrl;
  final String? notes;
  final List<GuestCartItemOption>? options;

  const GuestCartItem({
    required this.id,
    required this.menuItemId,
    required this.name,
    required this.price,
    required this.quantity,
    this.imageUrl,
    this.notes,
    this.options,
  });

  factory GuestCartItem.fromJson(Map<String, dynamic> json) {
    return GuestCartItem(
      id: json['id'] as String,
      menuItemId: json['menuItemId'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      imageUrl: json['imageUrl'] as String?,
      notes: json['notes'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => GuestCartItemOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'menuItemId': menuItemId,
      'name': name,
      'price': price,
      'quantity': quantity,
      'imageUrl': imageUrl,
      'notes': notes,
      'options': options?.map((e) => e.toJson()).toList(),
    };
  }
}

/// Guest cart item option model
class GuestCartItemOption {
  final String id;
  final String name;
  final double price;
  final int quantity;

  const GuestCartItemOption({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  factory GuestCartItemOption.fromJson(Map<String, dynamic> json) {
    return GuestCartItemOption(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int? ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }
}

// Guest payment methods enum is defined in guest_models.dart
// The enum in guest_models.dart doesn't have 'creditCard' and 'wallet' options
// We'll need to make sure that code that references these options is updated
