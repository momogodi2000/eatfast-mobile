import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:eatfast_mobile/shared/services/restaurants/domain/models/restaurant.dart';
import 'package:eatfast_mobile/shared/services/cart/domain/models/cart_item.dart';

class ScheduledOrder {
  final String id;
  final String userId;
  final String restaurantId;
  final Restaurant restaurant;
  final List<CartItem> items;
  final double subtotal;
  final double deliveryFee;
  final double total;
  final String currency;
  final DateTime scheduledDate;
  final ScheduledOrderStatus status;
  final String deliveryAddress;
  final String? deliveryInstructions;
  final bool isRecurring;
  final RecurrencePattern? recurrencePattern;
  final String? paymentMethodId;
  final DateTime? lastExecutedAt;
  final DateTime? nextExecutionAt;
  final int? executionCount;
  final int? maxExecutions;
  final DateTime? pausedUntil;
  final Map<String, dynamic>? metadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ScheduledOrder({
    required this.id,
    required this.userId,
    required this.restaurantId,
    required this.restaurant,
    required this.items,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.currency,
    required this.scheduledDate,
    required this.status,
    required this.deliveryAddress,
    this.deliveryInstructions,
    required this.isRecurring,
    this.recurrencePattern,
    this.paymentMethodId,
    this.lastExecutedAt,
    this.nextExecutionAt,
    this.executionCount,
    this.maxExecutions,
    this.pausedUntil,
    this.metadata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ScheduledOrder.fromJson(Map<String, dynamic> json) {
    return ScheduledOrder(
      id: json['id'] as String,
      userId: json['userId'] as String,
      restaurantId: json['restaurantId'] as String,
      restaurant: Restaurant.fromJson(json['restaurant'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      subtotal: (json['subtotal'] as num).toDouble(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      currency: json['currency'] as String,
      scheduledDate: DateTime.parse(json['scheduledDate'] as String),
      status: ScheduledOrderStatus.values.firstWhere((e) => e.name == json['status']),
      deliveryAddress: json['deliveryAddress'] as String,
      deliveryInstructions: json['deliveryInstructions'] as String?,
      isRecurring: json['isRecurring'] as bool,
      recurrencePattern: json['recurrencePattern'] != null
          ? RecurrencePattern.fromJson(json['recurrencePattern'] as Map<String, dynamic>)
          : null,
      paymentMethodId: json['paymentMethodId'] as String?,
      lastExecutedAt: json['lastExecutedAt'] != null
          ? DateTime.parse(json['lastExecutedAt'] as String)
          : null,
      nextExecutionAt: json['nextExecutionAt'] != null
          ? DateTime.parse(json['nextExecutionAt'] as String)
          : null,
      executionCount: json['executionCount'] as int?,
      maxExecutions: json['maxExecutions'] as int?,
      pausedUntil: json['pausedUntil'] != null
          ? DateTime.parse(json['pausedUntil'] as String)
          : null,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  ScheduledOrder copyWith({
    String? id,
    String? userId,
    String? restaurantId,
    Restaurant? restaurant,
    List<CartItem>? items,
    double? subtotal,
    double? deliveryFee,
    double? total,
    String? currency,
    DateTime? scheduledDate,
    ScheduledOrderStatus? status,
    String? deliveryAddress,
    String? deliveryInstructions,
    bool? isRecurring,
    RecurrencePattern? recurrencePattern,
    String? paymentMethodId,
    DateTime? lastExecutedAt,
    DateTime? nextExecutionAt,
    int? executionCount,
    int? maxExecutions,
    DateTime? pausedUntil,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ScheduledOrder(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      restaurantId: restaurantId ?? this.restaurantId,
      restaurant: restaurant ?? this.restaurant,
      items: items ?? this.items,
      subtotal: subtotal ?? this.subtotal,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      total: total ?? this.total,
      currency: currency ?? this.currency,
      scheduledDate: scheduledDate ?? this.scheduledDate,
      status: status ?? this.status,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      deliveryInstructions: deliveryInstructions ?? this.deliveryInstructions,
      isRecurring: isRecurring ?? this.isRecurring,
      recurrencePattern: recurrencePattern ?? this.recurrencePattern,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      lastExecutedAt: lastExecutedAt ?? this.lastExecutedAt,
      nextExecutionAt: nextExecutionAt ?? this.nextExecutionAt,
      executionCount: executionCount ?? this.executionCount,
      maxExecutions: maxExecutions ?? this.maxExecutions,
      pausedUntil: pausedUntil ?? this.pausedUntil,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'restaurantId': restaurantId,
      'restaurant': restaurant.toJson(),
      'items': items.map((e) => e.toJson()).toList(),
      'subtotal': subtotal,
      'deliveryFee': deliveryFee,
      'total': total,
      'currency': currency,
      'scheduledDate': scheduledDate.toIso8601String(),
      'status': status.name,
      'deliveryAddress': deliveryAddress,
      if (deliveryInstructions != null) 'deliveryInstructions': deliveryInstructions,
      'isRecurring': isRecurring,
      if (recurrencePattern != null) 'recurrencePattern': recurrencePattern!.toJson(),
      if (paymentMethodId != null) 'paymentMethodId': paymentMethodId,
      if (lastExecutedAt != null) 'lastExecutedAt': lastExecutedAt!.toIso8601String(),
      if (nextExecutionAt != null) 'nextExecutionAt': nextExecutionAt!.toIso8601String(),
      if (executionCount != null) 'executionCount': executionCount,
      if (maxExecutions != null) 'maxExecutions': maxExecutions,
      if (pausedUntil != null) 'pausedUntil': pausedUntil!.toIso8601String(),
      if (metadata != null) 'metadata': metadata,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class RecurrencePattern {
  final RecurrenceType type;
  final int interval;
  final List<int>? daysOfWeek; // 1-7 for Monday-Sunday
  final List<int>? daysOfMonth; // 1-31
  final int? dayOfMonth; // Specific day of month
  final String? timeOfDay; // HH:mm format
  final DateTime? endDate;
  final int? maxOccurrences;

  const RecurrencePattern({
    required this.type,
    required this.interval,
    this.daysOfWeek,
    this.daysOfMonth,
    this.dayOfMonth,
    this.timeOfDay,
    this.endDate,
    this.maxOccurrences,
  });

  factory RecurrencePattern.fromJson(Map<String, dynamic> json) {
    return RecurrencePattern(
      type: RecurrenceType.values.firstWhere((e) => e.name == json['type']),
      interval: json['interval'] as int,
      daysOfWeek: json['daysOfWeek'] != null
          ? (json['daysOfWeek'] as List<dynamic>).cast<int>()
          : null,
      daysOfMonth: json['daysOfMonth'] != null
          ? (json['daysOfMonth'] as List<dynamic>).cast<int>()
          : null,
      dayOfMonth: json['dayOfMonth'] as int?,
      timeOfDay: json['timeOfDay'] as String?,
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'] as String)
          : null,
      maxOccurrences: json['maxOccurrences'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'interval': interval,
      if (daysOfWeek != null) 'daysOfWeek': daysOfWeek,
      if (daysOfMonth != null) 'daysOfMonth': daysOfMonth,
      if (dayOfMonth != null) 'dayOfMonth': dayOfMonth,
      if (timeOfDay != null) 'timeOfDay': timeOfDay,
      if (endDate != null) 'endDate': endDate!.toIso8601String(),
      if (maxOccurrences != null) 'maxOccurrences': maxOccurrences,
    };
  }

  RecurrencePattern copyWith({
    RecurrenceType? type,
    int? interval,
    List<int>? daysOfWeek,
    List<int>? daysOfMonth,
    int? dayOfMonth,
    String? timeOfDay,
    DateTime? endDate,
    int? maxOccurrences,
  }) {
    return RecurrencePattern(
      type: type ?? this.type,
      interval: interval ?? this.interval,
      daysOfWeek: daysOfWeek ?? this.daysOfWeek,
      daysOfMonth: daysOfMonth ?? this.daysOfMonth,
      dayOfMonth: dayOfMonth ?? this.dayOfMonth,
      timeOfDay: timeOfDay ?? this.timeOfDay,
      endDate: endDate ?? this.endDate,
      maxOccurrences: maxOccurrences ?? this.maxOccurrences,
    );
  }
}

enum ScheduledOrderStatus {
  @JsonValue('scheduled')
  scheduled,
  @JsonValue('processing')
  processing,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('failed')
  failed,
  @JsonValue('paused')
  paused,
}

enum RecurrenceType {
  @JsonValue('daily')
  daily,
  @JsonValue('weekly')
  weekly,
  @JsonValue('monthly')
  monthly,
  @JsonValue('custom')
  custom,
}

extension ScheduledOrderStatusExtension on ScheduledOrderStatus {
  String get displayName {
    switch (this) {
      case ScheduledOrderStatus.scheduled:
        return 'Programmée';
      case ScheduledOrderStatus.processing:
        return 'En cours';
      case ScheduledOrderStatus.completed:
        return 'Complétée';
      case ScheduledOrderStatus.cancelled:
        return 'Annulée';
      case ScheduledOrderStatus.failed:
        return 'Échouée';
      case ScheduledOrderStatus.paused:
        return 'En pause';
    }
  }

  Color get color {
    switch (this) {
      case ScheduledOrderStatus.scheduled:
        return Colors.blue;
      case ScheduledOrderStatus.processing:
        return Colors.orange;
      case ScheduledOrderStatus.completed:
        return Colors.green;
      case ScheduledOrderStatus.cancelled:
        return Colors.red;
      case ScheduledOrderStatus.failed:
        return Colors.red.shade300;
      case ScheduledOrderStatus.paused:
        return Colors.grey;
    }
  }

  IconData get icon {
    switch (this) {
      case ScheduledOrderStatus.scheduled:
        return Icons.schedule;
      case ScheduledOrderStatus.processing:
        return Icons.hourglass_top;
      case ScheduledOrderStatus.completed:
        return Icons.check_circle;
      case ScheduledOrderStatus.cancelled:
        return Icons.cancel;
      case ScheduledOrderStatus.failed:
        return Icons.error;
      case ScheduledOrderStatus.paused:
        return Icons.pause_circle;
    }
  }
}

extension RecurrenceTypeExtension on RecurrenceType {
  String get displayName {
    switch (this) {
      case RecurrenceType.daily:
        return 'Quotidienne';
      case RecurrenceType.weekly:
        return 'Hebdomadaire';
      case RecurrenceType.monthly:
        return 'Mensuelle';
      case RecurrenceType.custom:
        return 'Personnalisée';
    }
  }
}

// Helper class for creating scheduled orders
class CreateScheduledOrderRequest {
  final String restaurantId;
  final List<CartItem> items;
  final DateTime scheduledDate;
  final String deliveryAddress;
  final String? deliveryInstructions;
  final bool isRecurring;
  final RecurrencePattern? recurrencePattern;
  final String? paymentMethodId;
  final int? maxExecutions;

  const CreateScheduledOrderRequest({
    required this.restaurantId,
    required this.items,
    required this.scheduledDate,
    required this.deliveryAddress,
    this.deliveryInstructions,
    required this.isRecurring,
    this.recurrencePattern,
    this.paymentMethodId,
    this.maxExecutions,
  });

  factory CreateScheduledOrderRequest.fromJson(Map<String, dynamic> json) {
    return CreateScheduledOrderRequest(
      restaurantId: json['restaurantId'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      scheduledDate: DateTime.parse(json['scheduledDate'] as String),
      deliveryAddress: json['deliveryAddress'] as String,
      deliveryInstructions: json['deliveryInstructions'] as String?,
      isRecurring: json['isRecurring'] as bool,
      recurrencePattern: json['recurrencePattern'] != null
          ? RecurrencePattern.fromJson(json['recurrencePattern'] as Map<String, dynamic>)
          : null,
      paymentMethodId: json['paymentMethodId'] as String?,
      maxExecutions: json['maxExecutions'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'restaurantId': restaurantId,
      'items': items.map((e) => e.toJson()).toList(),
      'scheduledDate': scheduledDate.toIso8601String(),
      'deliveryAddress': deliveryAddress,
      if (deliveryInstructions != null) 'deliveryInstructions': deliveryInstructions,
      'isRecurring': isRecurring,
      if (recurrencePattern != null) 'recurrencePattern': recurrencePattern!.toJson(),
      if (paymentMethodId != null) 'paymentMethodId': paymentMethodId,
      if (maxExecutions != null) 'maxExecutions': maxExecutions,
    };
  }
}

// Response for scheduled order operations
class ScheduledOrderResponse {
  final bool success;
  final String? message;
  final ScheduledOrder? order;
  final String? error;

  const ScheduledOrderResponse({
    required this.success,
    this.message,
    this.order,
    this.error,
  });

  factory ScheduledOrderResponse.fromJson(Map<String, dynamic> json) {
    return ScheduledOrderResponse(
      success: json['success'] as bool,
      message: json['message'] as String?,
      order: json['order'] != null
          ? ScheduledOrder.fromJson(json['order'] as Map<String, dynamic>)
          : null,
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      if (message != null) 'message': message,
      if (order != null) 'order': order!.toJson(),
      if (error != null) 'error': error,
    };
  }
}
