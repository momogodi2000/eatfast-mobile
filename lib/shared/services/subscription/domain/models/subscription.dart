/// Subscription models for premium features
enum SubscriptionPlanType {
  free('free'),
  basic('basic'),
  premium('premium'),
  business('business');

  const SubscriptionPlanType(this.value);
  final String value;

  static SubscriptionPlanType fromString(String value) {
    return SubscriptionPlanType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => SubscriptionPlanType.free,
    );
  }
}

enum SubscriptionStatus {
  active('active'),
  inactive('inactive'),
  cancelled('cancelled'),
  expired('expired'),
  pending('pending'),
  suspended('suspended'),
  paused('paused'),
  trial('trial');

  const SubscriptionStatus(this.value);
  final String value;

  static SubscriptionStatus fromString(String value) {
    return SubscriptionStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => SubscriptionStatus.inactive,
    );
  }
}

enum BillingInterval {
  monthly('monthly'),
  quarterly('quarterly'),
  yearly('yearly');

  const BillingInterval(this.value);
  final String value;

  static BillingInterval fromString(String value) {
    return BillingInterval.values.firstWhere(
      (interval) => interval.value == value,
      orElse: () => BillingInterval.monthly,
    );
  }
}

enum BillingStatus {
  paid('paid'),
  pending('pending'),
  failed('failed'),
  refunded('refunded');

  const BillingStatus(this.value);
  final String value;

  static BillingStatus fromString(String value) {
    return BillingStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => BillingStatus.pending,
    );
  }
}

/// Subscription plan model
class SubscriptionPlan {
  final String id;
  final String name;
  final String description;
  final SubscriptionPlanType type;
  final double monthlyPrice;
  final double yearlyPrice;
  final double price; // Current price based on billing cycle
  final String currency;
  final String billingCycle;
  final int maxOrders;
  final int maxRestaurants;
  final bool hasAnalytics;
  final bool hasPrioritySupport;
  final bool isPopular;
  final Map<String, dynamic> features;
  final List<String> benefits;
  final bool isActive;

  const SubscriptionPlan({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.monthlyPrice,
    required this.yearlyPrice,
    double? price,
    this.currency = 'XAF',
    this.billingCycle = 'monthly',
    this.maxOrders = -1,
    this.maxRestaurants = -1,
    this.hasAnalytics = false,
    this.hasPrioritySupport = false,
    this.isPopular = false,
    required this.features,
    required this.benefits,
    this.isActive = true,
  }) : price = price ?? monthlyPrice;

  factory SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlan(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      type: SubscriptionPlanType.fromString(json['type'] ?? 'free'),
      monthlyPrice: (json['monthlyPrice'] ?? 0).toDouble(),
      yearlyPrice: (json['yearlyPrice'] ?? 0).toDouble(),
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
      currency: json['currency'] ?? 'XAF',
      billingCycle: json['billingCycle'] ?? 'monthly',
      maxOrders: json['maxOrders'] ?? -1,
      maxRestaurants: json['maxRestaurants'] ?? -1,
      hasAnalytics: json['hasAnalytics'] ?? false,
      hasPrioritySupport: json['hasPrioritySupport'] ?? false,
      isPopular: json['isPopular'] ?? false,
      features: json['features'] ?? {},
      benefits: List<String>.from(json['benefits'] ?? []),
      isActive: json['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type.value,
      'monthlyPrice': monthlyPrice,
      'yearlyPrice': yearlyPrice,
      'price': price,
      'currency': currency,
      'billingCycle': billingCycle,
      'maxOrders': maxOrders,
      'maxRestaurants': maxRestaurants,
      'hasAnalytics': hasAnalytics,
      'hasPrioritySupport': hasPrioritySupport,
      'isPopular': isPopular,
      'features': features,
      'benefits': benefits,
      'isActive': isActive,
    };
  }
}

/// User subscription model
class UserSubscription {
  final String id;
  final String userId;
  final String planId;
  final SubscriptionPlan? plan;
  final SubscriptionStatus status;
  final BillingInterval billingInterval;
  final double amount;
  final DateTime startDate;
  final DateTime? endDate;
  final DateTime? trialEndDate;
  final DateTime? nextBillingDate;
  final bool autoRenew;
  final String? paymentMethodId;
  final int ordersLimit;
  final int ordersUsed;
  final Map<String, dynamic>? metadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserSubscription({
    required this.id,
    required this.userId,
    required this.planId,
    this.plan,
    required this.status,
    required this.billingInterval,
    required this.amount,
    required this.startDate,
    this.endDate,
    this.trialEndDate,
    this.nextBillingDate,
    this.autoRenew = true,
    this.paymentMethodId,
    this.ordersLimit = -1,
    this.ordersUsed = 0,
    this.metadata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserSubscription.fromJson(Map<String, dynamic> json) {
    return UserSubscription(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      planId: json['planId'] ?? '',
      plan: json['plan'] != null
          ? SubscriptionPlan.fromJson(json['plan'])
          : null,
      status: SubscriptionStatus.fromString(json['status'] ?? 'inactive'),
      billingInterval: BillingInterval.fromString(
        json['billingInterval'] ?? 'monthly',
      ),
      amount: (json['amount'] ?? 0).toDouble(),
      startDate: DateTime.parse(
        json['startDate'] ?? DateTime.now().toIso8601String(),
      ),
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      trialEndDate: json['trialEndDate'] != null
          ? DateTime.parse(json['trialEndDate'])
          : null,
      nextBillingDate: json['nextBillingDate'] != null
          ? DateTime.parse(json['nextBillingDate'])
          : null,
      autoRenew: json['autoRenew'] ?? true,
      paymentMethodId: json['paymentMethodId'],
      ordersLimit: json['ordersLimit'] ?? -1,
      ordersUsed: json['ordersUsed'] ?? 0,
      metadata: json['metadata'],
      createdAt: DateTime.parse(
        json['createdAt'] ?? DateTime.now().toIso8601String(),
      ),
      updatedAt: DateTime.parse(
        json['updatedAt'] ?? DateTime.now().toIso8601String(),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'planId': planId,
      if (plan != null) 'plan': plan!.toJson(),
      'status': status.value,
      'billingInterval': billingInterval.value,
      'amount': amount,
      'startDate': startDate.toIso8601String(),
      if (endDate != null) 'endDate': endDate!.toIso8601String(),
      if (trialEndDate != null) 'trialEndDate': trialEndDate!.toIso8601String(),
      if (nextBillingDate != null)
        'nextBillingDate': nextBillingDate!.toIso8601String(),
      'autoRenew': autoRenew,
      if (paymentMethodId != null) 'paymentMethodId': paymentMethodId,
      'ordersLimit': ordersLimit,
      'ordersUsed': ordersUsed,
      if (metadata != null) 'metadata': metadata,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  UserSubscription copyWith({
    String? id,
    String? userId,
    String? planId,
    SubscriptionPlan? plan,
    SubscriptionStatus? status,
    BillingInterval? billingInterval,
    double? amount,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? trialEndDate,
    DateTime? nextBillingDate,
    bool? autoRenew,
    String? paymentMethodId,
    int? ordersLimit,
    int? ordersUsed,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserSubscription(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      planId: planId ?? this.planId,
      plan: plan ?? this.plan,
      status: status ?? this.status,
      billingInterval: billingInterval ?? this.billingInterval,
      amount: amount ?? this.amount,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      trialEndDate: trialEndDate ?? this.trialEndDate,
      nextBillingDate: nextBillingDate ?? this.nextBillingDate,
      autoRenew: autoRenew ?? this.autoRenew,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      ordersLimit: ordersLimit ?? this.ordersLimit,
      ordersUsed: ordersUsed ?? this.ordersUsed,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  bool get isActive => status == SubscriptionStatus.active;
  bool get isTrial => status == SubscriptionStatus.trial;
  bool get isExpired => status == SubscriptionStatus.expired;
  bool get isCancelled => status == SubscriptionStatus.cancelled;

  int get daysRemaining {
    if (endDate == null) return -1;
    return endDate!.difference(DateTime.now()).inDays;
  }

  bool get isTrialActive {
    if (trialEndDate == null) return false;
    return trialEndDate!.isAfter(DateTime.now());
  }
}

/// Subscription usage model
class SubscriptionUsage {
  final String subscriptionId;
  final int ordersUsed;
  final int ordersLimit;
  final int featuresUsed;
  final int featuresLimit;
  final DateTime periodStart;
  final DateTime periodEnd;

  const SubscriptionUsage({
    required this.subscriptionId,
    required this.ordersUsed,
    required this.ordersLimit,
    required this.featuresUsed,
    required this.featuresLimit,
    required this.periodStart,
    required this.periodEnd,
  });

  factory SubscriptionUsage.fromJson(Map<String, dynamic> json) {
    return SubscriptionUsage(
      subscriptionId: json['subscriptionId'] ?? '',
      ordersUsed: json['ordersUsed'] ?? 0,
      ordersLimit: json['ordersLimit'] ?? 0,
      featuresUsed: json['featuresUsed'] ?? 0,
      featuresLimit: json['featuresLimit'] ?? 0,
      periodStart: DateTime.parse(
        json['periodStart'] ?? DateTime.now().toIso8601String(),
      ),
      periodEnd: DateTime.parse(
        json['periodEnd'] ?? DateTime.now().toIso8601String(),
      ),
    );
  }

  double get usagePercentage {
    if (ordersLimit == 0) return 0.0;
    return (ordersUsed / ordersLimit * 100).clamp(0.0, 100.0);
  }

  bool get hasReachedLimit => ordersUsed >= ordersLimit;
}

/// Billing history model
class BillingHistory {
  final String id;
  final String subscriptionId;
  final double amount;
  final String currency;
  final BillingStatus status;
  final DateTime billingDate;
  final DateTime? paidDate;
  final String? invoiceUrl;
  final String? paymentMethodId;

  const BillingHistory({
    required this.id,
    required this.subscriptionId,
    required this.amount,
    this.currency = 'XAF',
    required this.status,
    required this.billingDate,
    this.paidDate,
    this.invoiceUrl,
    this.paymentMethodId,
  });

  factory BillingHistory.fromJson(Map<String, dynamic> json) {
    return BillingHistory(
      id: json['id'] ?? '',
      subscriptionId: json['subscriptionId'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      currency: json['currency'] ?? 'XAF',
      status: BillingStatus.fromString(json['status'] ?? 'pending'),
      billingDate: DateTime.parse(
        json['billingDate'] ?? DateTime.now().toIso8601String(),
      ),
      paidDate: json['paidDate'] != null
          ? DateTime.parse(json['paidDate'])
          : null,
      invoiceUrl: json['invoiceUrl'],
      paymentMethodId: json['paymentMethodId'],
    );
  }

  bool get isPaid => status == BillingStatus.paid;
  bool get isPending => status == BillingStatus.pending;
  bool get isFailed => status == BillingStatus.failed;
}
