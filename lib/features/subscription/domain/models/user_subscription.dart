import 'subscription.dart';

class UserSubscription {
  final String id;
  final String userId;
  final String planId;
  final SubscriptionPlan plan;
  final SubscriptionStatus status;
  final DateTime startDate;
  final DateTime? endDate;
  final DateTime? cancelledAt;
  final DateTime nextBillingDate;
  final double currentUsage;
  final int ordersUsed;
  final int ordersLimit;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserSubscription({
    required this.id,
    required this.userId,
    required this.planId,
    required this.plan,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.cancelledAt,
    required this.nextBillingDate,
    required this.currentUsage,
    required this.ordersUsed,
    required this.ordersLimit,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserSubscription.fromJson(Map<String, dynamic> json) {
    return UserSubscription(
      id: json['id'] as String,
      userId: json['userId'] as String,
      planId: json['planId'] as String,
      plan: SubscriptionPlan.fromJson(json['plan'] as Map<String, dynamic>),
      status: SubscriptionStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => SubscriptionStatus.active,
      ),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate'] as String) : null,
      cancelledAt: json['cancelledAt'] != null ? DateTime.parse(json['cancelledAt'] as String) : null,
      nextBillingDate: DateTime.parse(json['nextBillingDate'] as String),
      currentUsage: (json['currentUsage'] as num).toDouble(),
      ordersUsed: json['ordersUsed'] as int,
      ordersLimit: json['ordersLimit'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  UserSubscription copyWith({
    String? id,
    String? userId,
    String? planId,
    SubscriptionPlan? plan,
    SubscriptionStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? cancelledAt,
    DateTime? nextBillingDate,
    double? currentUsage,
    int? ordersUsed,
    int? ordersLimit,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserSubscription(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      planId: planId ?? this.planId,
      plan: plan ?? this.plan,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      cancelledAt: cancelledAt ?? this.cancelledAt,
      nextBillingDate: nextBillingDate ?? this.nextBillingDate,
      currentUsage: currentUsage ?? this.currentUsage,
      ordersUsed: ordersUsed ?? this.ordersUsed,
      ordersLimit: ordersLimit ?? this.ordersLimit,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  bool get isActive => status == SubscriptionStatus.active || status == SubscriptionStatus.trial;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'planId': planId,
      'plan': plan.toJson(),
      'status': status.name,
      'startDate': startDate.toIso8601String(),
      if (endDate != null) 'endDate': endDate!.toIso8601String(),
      if (cancelledAt != null) 'cancelledAt': cancelledAt!.toIso8601String(),
      'nextBillingDate': nextBillingDate.toIso8601String(),
      'currentUsage': currentUsage,
      'ordersUsed': ordersUsed,
      'ordersLimit': ordersLimit,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

enum SubscriptionStatus {
  active,
  cancelled,
  expired,
  paused,
  trial,
}