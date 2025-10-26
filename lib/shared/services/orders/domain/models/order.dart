import 'package:eatfast_mobile/shared/models/exports.dart' as shared_models;

/// Order model
class Order {
  final String id;
  final String orderNumber;
  final String restaurantId;
  final String restaurantName;
  final String? customerId;
  final String? customerName;
  final String? customerPhone;
  final List<OrderItem> items;
  final double subtotal;
  final double deliveryFee;
  final double tax;
  final double total;
  final shared_models.OrderStatus status;
  final String? deliveryAddress;
  final Map<String, dynamic>? deliveryCoordinates;
  final String paymentMethod;
  final String? paymentStatus;
  final String? driverId;
  final String? driverName;
  final String? driverPhone;
  final String? specialInstructions;
  final DateTime? estimatedDeliveryTime;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final List<OrderStatusUpdate>? statusUpdates;
  final double? discount;

  const Order({
    required this.id,
    required this.orderNumber,
    required this.restaurantId,
    required this.restaurantName,
    this.customerId,
    this.customerName,
    this.customerPhone,
    required this.items,
    required this.subtotal,
    required this.deliveryFee,
    required this.tax,
    required this.total,
    required this.status,
    this.deliveryAddress,
    this.deliveryCoordinates,
    required this.paymentMethod,
    this.paymentStatus,
    this.driverId,
    this.driverName,
    this.driverPhone,
    this.specialInstructions,
    this.estimatedDeliveryTime,
    required this.createdAt,
    this.updatedAt,
    this.statusUpdates,
    this.discount,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as String,
      orderNumber: json['orderNumber'] as String,
      restaurantId: json['restaurantId'] as String,
      restaurantName: json['restaurantName'] as String? ?? '',
      customerId: json['customerId'] as String?,
      customerName: json['customerName'] as String?,
      customerPhone: json['customerPhone'] as String?,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((item) => OrderItem.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0.0,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0.0,
      tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
  status: shared_models.OrderStatus.fromString(json['status'] as String? ?? 'pending'),
      deliveryAddress: json['deliveryAddress'] as String?,
      deliveryCoordinates: json['deliveryCoordinates'] as Map<String, dynamic>?,
      paymentMethod: json['paymentMethod'] as String? ?? 'cash',
      paymentStatus: json['paymentStatus'] as String?,
      driverId: json['driverId'] as String?,
      driverName: json['driverName'] as String?,
      driverPhone: json['driverPhone'] as String?,
      specialInstructions: json['specialInstructions'] as String?,
      estimatedDeliveryTime: json['estimatedDeliveryTime'] != null
          ? DateTime.parse(json['estimatedDeliveryTime'] as String)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      statusUpdates: (json['statusUpdates'] as List<dynamic>?)
          ?.map((update) => OrderStatusUpdate.fromJson(update as Map<String, dynamic>))
          .toList(),
      discount: (json['discount'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderNumber': orderNumber,
      'restaurantId': restaurantId,
      'restaurantName': restaurantName,
      if (customerId != null) 'customerId': customerId,
      if (customerName != null) 'customerName': customerName,
      if (customerPhone != null) 'customerPhone': customerPhone,
      'items': items.map((item) => item.toJson()).toList(),
      'subtotal': subtotal,
      'deliveryFee': deliveryFee,
      'tax': tax,
      'total': total,
      'status': status.value,
      if (deliveryAddress != null) 'deliveryAddress': deliveryAddress,
      if (deliveryCoordinates != null)
        'deliveryCoordinates': deliveryCoordinates,
      'paymentMethod': paymentMethod,
      if (paymentStatus != null) 'paymentStatus': paymentStatus,
      if (driverId != null) 'driverId': driverId,
      if (driverName != null) 'driverName': driverName,
      if (driverPhone != null) 'driverPhone': driverPhone,
      if (specialInstructions != null)
        'specialInstructions': specialInstructions,
      if (estimatedDeliveryTime != null)
        'estimatedDeliveryTime': estimatedDeliveryTime!.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt!.toIso8601String(),
      if (statusUpdates != null)
        'statusUpdates': statusUpdates!.map((update) => update.toJson()).toList(),
      if (discount != null) 'discount': discount,
    };
  }

  Order copyWith({
    String? id,
    String? orderNumber,
    String? restaurantId,
    String? restaurantName,
    String? customerId,
    String? customerName,
    String? customerPhone,
    List<OrderItem>? items,
    double? subtotal,
    double? deliveryFee,
    double? tax,
    double? total,
  shared_models.OrderStatus? status,
    String? deliveryAddress,
    Map<String, dynamic>? deliveryCoordinates,
    String? paymentMethod,
    String? paymentStatus,
    String? driverId,
    String? driverName,
    String? driverPhone,
    String? specialInstructions,
    DateTime? estimatedDeliveryTime,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<OrderStatusUpdate>? statusUpdates,
    double? discount,
  }) {
    return Order(
      id: id ?? this.id,
      orderNumber: orderNumber ?? this.orderNumber,
      restaurantId: restaurantId ?? this.restaurantId,
      restaurantName: restaurantName ?? this.restaurantName,
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      customerPhone: customerPhone ?? this.customerPhone,
      items: items ?? this.items,
      subtotal: subtotal ?? this.subtotal,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      tax: tax ?? this.tax,
      total: total ?? this.total,
      status: status ?? this.status,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      deliveryCoordinates: deliveryCoordinates ?? this.deliveryCoordinates,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      driverId: driverId ?? this.driverId,
      driverName: driverName ?? this.driverName,
      driverPhone: driverPhone ?? this.driverPhone,
      specialInstructions: specialInstructions ?? this.specialInstructions,
      estimatedDeliveryTime: estimatedDeliveryTime ?? this.estimatedDeliveryTime,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      statusUpdates: statusUpdates ?? this.statusUpdates,
      discount: discount ?? this.discount,
    );
  }

  bool get canBeCancelled {
    return status == shared_models.OrderStatus.created ||
      status == shared_models.OrderStatus.confirmed ||
      status == shared_models.OrderStatus.accepted;
  }

  /// Check if the order is currently active (not completed, cancelled, or refunded)
  bool get isActive => status.isActive;

  /// Check if the order has been delivered
  bool get isDelivered =>
  status == shared_models.OrderStatus.delivered || status == shared_models.OrderStatus.completed;

  /// Get the total number of items in the order
  int get itemCount => items.fold<int>(0, (sum, item) => sum + item.quantity);

  /// Get the actual delivery time from status updates
  DateTime? get actualDeliveryTime {
    if (statusUpdates == null || statusUpdates!.isEmpty) {
      return null;
    }

    try {
      final deliveredUpdate = statusUpdates!.firstWhere(
  (update) => update.status == shared_models.OrderStatus.delivered,
      );
      return deliveredUpdate.timestamp;
    } catch (e) {
      // If no delivered status update found, return null
      return null;
    }
  }
}

/// Order item model
class OrderItem {
  final String id;
  final String menuItemId;
  final String name;
  final int quantity;
  final double price;
  final double total;
  final String? imageUrl;
  final Map<String, dynamic>? customizations;

  const OrderItem({
    required this.id,
    required this.menuItemId,
    required this.name,
    required this.quantity,
    required this.price,
    required this.total,
    this.imageUrl,
    this.customizations,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'] as String,
      menuItemId: json['menuItemId'] as String,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
      customizations: json['customizations'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'menuItemId': menuItemId,
      'name': name,
      'quantity': quantity,
      'price': price,
      'total': total,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (customizations != null) 'customizations': customizations,
    };
  }
}

/// Order status update model
class OrderStatusUpdate {
  final shared_models.OrderStatus status;
  final DateTime timestamp;
  final String? note;
  final String? message;
  final String? updatedBy;

  const OrderStatusUpdate({
    required this.status,
    required this.timestamp,
    this.note,
    this.message,
    this.updatedBy,
  });

  factory OrderStatusUpdate.fromJson(Map<String, dynamic> json) {
    final noteOrMessage = json['note'] ?? json['message'];
    return OrderStatusUpdate(
  status: shared_models.OrderStatus.fromString(json['status'] as String? ?? 'pending'),
      timestamp: DateTime.parse(json['timestamp'] as String),
      note: noteOrMessage as String?,
      message: noteOrMessage,
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status.value,
      'timestamp': timestamp.toIso8601String(),
      if (note != null) 'note': note,
      if (message != null) 'message': message,
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}
