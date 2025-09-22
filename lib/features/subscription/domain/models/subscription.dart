import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class SubscriptionPlan {
  final String id;
  final String name;
  final String description;
  final double price;
  final String currency;
  final SubscriptionDuration duration;
  final String type;
  final String billingCycle;
  final List<String> features;
  final int maxOrders;
  final int maxDeliveries;
  final int maxRestaurants;
  final bool hasAnalytics;
  final bool hasPrioritySupport;
  final bool hasCustomBranding;
  final bool isPopular;
  final bool isActive;
  final Map<String, dynamic>? metadata;

  const SubscriptionPlan({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.currency,
    required this.duration,
    required this.type,
    required this.billingCycle,
    required this.features,
    required this.maxOrders,
    required this.maxDeliveries,
    required this.maxRestaurants,
    required this.hasAnalytics,
    required this.hasPrioritySupport,
    required this.hasCustomBranding,
    this.isPopular = false,
    this.isActive = true,
    this.metadata,
  });

  factory SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlan(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      duration: SubscriptionDuration.values.firstWhere((e) => e.name == json['duration']),
      type: json['type'] as String,
      billingCycle: json['billingCycle'] as String,
      features: (json['features'] as List<dynamic>).cast<String>(),
      maxOrders: json['maxOrders'] as int,
      maxDeliveries: json['maxDeliveries'] as int,
      maxRestaurants: json['maxRestaurants'] as int,
      hasAnalytics: json['hasAnalytics'] as bool,
      hasPrioritySupport: json['hasPrioritySupport'] as bool,
      hasCustomBranding: json['hasCustomBranding'] as bool,
      isPopular: json['isPopular'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? true,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  SubscriptionPlan copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? currency,
    SubscriptionDuration? duration,
    String? type,
    String? billingCycle,
    List<String>? features,
    int? maxOrders,
    int? maxDeliveries,
    int? maxRestaurants,
    bool? hasAnalytics,
    bool? hasPrioritySupport,
    bool? hasCustomBranding,
    bool? isPopular,
    bool? isActive,
    Map<String, dynamic>? metadata,
  }) {
    return SubscriptionPlan(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      duration: duration ?? this.duration,
      type: type ?? this.type,
      billingCycle: billingCycle ?? this.billingCycle,
      features: features ?? this.features,
      maxOrders: maxOrders ?? this.maxOrders,
      maxDeliveries: maxDeliveries ?? this.maxDeliveries,
      maxRestaurants: maxRestaurants ?? this.maxRestaurants,
      hasAnalytics: hasAnalytics ?? this.hasAnalytics,
      hasPrioritySupport: hasPrioritySupport ?? this.hasPrioritySupport,
      hasCustomBranding: hasCustomBranding ?? this.hasCustomBranding,
      isPopular: isPopular ?? this.isPopular,
      isActive: isActive ?? this.isActive,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'currency': currency,
      'duration': duration.name,
      'type': type,
      'billingCycle': billingCycle,
      'features': features,
      'maxOrders': maxOrders,
      'maxDeliveries': maxDeliveries,
      'maxRestaurants': maxRestaurants,
      'hasAnalytics': hasAnalytics,
      'hasPrioritySupport': hasPrioritySupport,
      'hasCustomBranding': hasCustomBranding,
      'isPopular': isPopular,
      'isActive': isActive,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

class UserSubscription {
  final String id;
  final String userId;
  final SubscriptionPlan plan;
  final SubscriptionStatus status;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime nextBillingDate;
  final SubscriptionUsage currentUsage;
  final List<BillingHistory> billingHistory;
  final DateTime? cancelledAt;
  final String? cancellationReason;
  final Map<String, dynamic>? metadata;

  const UserSubscription({
    required this.id,
    required this.userId,
    required this.plan,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.nextBillingDate,
    required this.currentUsage,
    required this.billingHistory,
    this.cancelledAt,
    this.cancellationReason,
    this.metadata,
  });

  factory UserSubscription.fromJson(Map<String, dynamic> json) {
    return UserSubscription(
      id: json['id'] as String,
      userId: json['userId'] as String,
      plan: SubscriptionPlan.fromJson(json['plan'] as Map<String, dynamic>),
      status: SubscriptionStatus.values.firstWhere((e) => e.name == json['status']),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      nextBillingDate: DateTime.parse(json['nextBillingDate'] as String),
      currentUsage: SubscriptionUsage.fromJson(json['currentUsage'] as Map<String, dynamic>),
      billingHistory: (json['billingHistory'] as List<dynamic>)
          .map((e) => BillingHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      cancelledAt: json['cancelledAt'] != null
          ? DateTime.parse(json['cancelledAt'] as String)
          : null,
      cancellationReason: json['cancellationReason'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  UserSubscription copyWith({
    String? id,
    String? userId,
    SubscriptionPlan? plan,
    SubscriptionStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? nextBillingDate,
    SubscriptionUsage? currentUsage,
    List<BillingHistory>? billingHistory,
    DateTime? cancelledAt,
    String? cancellationReason,
    Map<String, dynamic>? metadata,
  }) {
    return UserSubscription(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      plan: plan ?? this.plan,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      nextBillingDate: nextBillingDate ?? this.nextBillingDate,
      currentUsage: currentUsage ?? this.currentUsage,
      billingHistory: billingHistory ?? this.billingHistory,
      cancelledAt: cancelledAt ?? this.cancelledAt,
      cancellationReason: cancellationReason ?? this.cancellationReason,
      metadata: metadata ?? this.metadata,
    );
  }

  bool get isActive => status == SubscriptionStatus.active || status == SubscriptionStatus.trial;

  int get ordersUsed => currentUsage.ordersUsed;
  int get ordersLimit => plan.maxOrders;
}

class SubscriptionUsage {
  final int ordersUsed;
  final int deliveriesUsed;
  final double storageUsed;
  final int apiCallsUsed;
  final DateTime lastUpdated;

  const SubscriptionUsage({
    required this.ordersUsed,
    required this.deliveriesUsed,
    required this.storageUsed,
    required this.apiCallsUsed,
    required this.lastUpdated,
  });

  factory SubscriptionUsage.fromJson(Map<String, dynamic> json) {
    return SubscriptionUsage(
      ordersUsed: json['ordersUsed'] as int,
      deliveriesUsed: json['deliveriesUsed'] as int,
      storageUsed: (json['storageUsed'] as num).toDouble(),
      apiCallsUsed: json['apiCallsUsed'] as int,
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );
  }

  SubscriptionUsage copyWith({
    int? ordersUsed,
    int? deliveriesUsed,
    double? storageUsed,
    int? apiCallsUsed,
    DateTime? lastUpdated,
  }) {
    return SubscriptionUsage(
      ordersUsed: ordersUsed ?? this.ordersUsed,
      deliveriesUsed: deliveriesUsed ?? this.deliveriesUsed,
      storageUsed: storageUsed ?? this.storageUsed,
      apiCallsUsed: apiCallsUsed ?? this.apiCallsUsed,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}

class BillingHistory {
  final String id;
  final double amount;
  final String currency;
  final DateTime billingDate;
  final BillingStatus status;
  final String paymentMethod;
  final String? invoiceUrl;
  final String? receiptUrl;
  final Map<String, dynamic>? metadata;

  const BillingHistory({
    required this.id,
    required this.amount,
    required this.currency,
    required this.billingDate,
    required this.status,
    required this.paymentMethod,
    this.invoiceUrl,
    this.receiptUrl,
    this.metadata,
  });

  factory BillingHistory.fromJson(Map<String, dynamic> json) {
    return BillingHistory(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      billingDate: DateTime.parse(json['billingDate'] as String),
      status: BillingStatus.values.firstWhere((e) => e.name == json['status']),
      paymentMethod: json['paymentMethod'] as String,
      invoiceUrl: json['invoiceUrl'] as String?,
      receiptUrl: json['receiptUrl'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  BillingHistory copyWith({
    String? id,
    double? amount,
    String? currency,
    DateTime? billingDate,
    BillingStatus? status,
    String? paymentMethod,
    String? invoiceUrl,
    String? receiptUrl,
    Map<String, dynamic>? metadata,
  }) {
    return BillingHistory(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      billingDate: billingDate ?? this.billingDate,
      status: status ?? this.status,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      invoiceUrl: invoiceUrl ?? this.invoiceUrl,
      receiptUrl: receiptUrl ?? this.receiptUrl,
      metadata: metadata ?? this.metadata,
    );
  }
}

enum SubscriptionDuration {
  @JsonValue('monthly')
  monthly,
  @JsonValue('quarterly')
  quarterly,
  @JsonValue('yearly')
  yearly,
}

enum SubscriptionStatus {
  @JsonValue('active')
  active,
  @JsonValue('inactive')
  inactive,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('expired')
  expired,
  @JsonValue('suspended')
  suspended,
  @JsonValue('trial')
  trial,
  @JsonValue('paused')
  paused,
}

enum BillingStatus {
  @JsonValue('paid')
  paid,
  @JsonValue('pending')
  pending,
  @JsonValue('failed')
  failed,
  @JsonValue('refunded')
  refunded,
}

extension SubscriptionDurationExtension on SubscriptionDuration {
  String get displayName {
    switch (this) {
      case SubscriptionDuration.monthly:
        return 'Mensuel';
      case SubscriptionDuration.quarterly:
        return 'Trimestriel';
      case SubscriptionDuration.yearly:
        return 'Annuel';
    }
  }

  int get durationInDays {
    switch (this) {
      case SubscriptionDuration.monthly:
        return 30;
      case SubscriptionDuration.quarterly:
        return 90;
      case SubscriptionDuration.yearly:
        return 365;
    }
  }
}

extension SubscriptionStatusExtension on SubscriptionStatus {
  String get displayName {
    switch (this) {
      case SubscriptionStatus.active:
        return 'Actif';
      case SubscriptionStatus.inactive:
        return 'Inactif';
      case SubscriptionStatus.cancelled:
        return 'Annulé';
      case SubscriptionStatus.expired:
        return 'Expiré';
      case SubscriptionStatus.suspended:
        return 'Suspendu';
      case SubscriptionStatus.trial:
        return 'Période d\'essai';
      case SubscriptionStatus.paused:
        return 'En pause';
    }
  }

  Color get color {
    switch (this) {
      case SubscriptionStatus.active:
        return Colors.green;
      case SubscriptionStatus.inactive:
        return Colors.grey;
      case SubscriptionStatus.cancelled:
        return Colors.red;
      case SubscriptionStatus.expired:
        return Colors.orange;
      case SubscriptionStatus.suspended:
        return Colors.purple;
      case SubscriptionStatus.trial:
        return Colors.blue;
      case SubscriptionStatus.paused:
        return Colors.amber;
    }
  }
}

extension BillingStatusExtension on BillingStatus {
  String get displayName {
    switch (this) {
      case BillingStatus.paid:
        return 'Payé';
      case BillingStatus.pending:
        return 'En attente';
      case BillingStatus.failed:
        return 'Échoué';
      case BillingStatus.refunded:
        return 'Remboursé';
    }
  }

  Color get color {
    switch (this) {
      case BillingStatus.paid:
        return Colors.green;
      case BillingStatus.pending:
        return Colors.orange;
      case BillingStatus.failed:
        return Colors.red;
      case BillingStatus.refunded:
        return Colors.blue;
    }
  }
}