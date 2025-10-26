class PromoCode {
  final String id;
  final String code;
  final String title;
  final String description;
  final PromoCodeType type;
  final double value;
  final double minimumOrderAmount;
  final double? maximumDiscountAmount;
  final DateTime startDate;
  final DateTime endDate;
  final bool isActive;
  final bool isFirstTimeOnly;
  final int usageLimit;
  final int usageCount;
  final List<String> applicableRestaurants;
  final List<String> applicableCategories;

  const PromoCode({
    required this.id,
    required this.code,
    required this.title,
    required this.description,
    required this.type,
    required this.value,
    this.minimumOrderAmount = 0,
    this.maximumDiscountAmount,
    required this.startDate,
    required this.endDate,
    this.isActive = true,
    this.isFirstTimeOnly = false,
    this.usageLimit = 0,
    this.usageCount = 0,
    this.applicableRestaurants = const [],
    this.applicableCategories = const [],
  });

  factory PromoCode.fromJson(Map<String, dynamic> json) {
    return PromoCode(
      id: json['id'] as String,
      code: json['code'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: PromoCodeType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => PromoCodeType.percentage,
      ),
      value: (json['value'] as num).toDouble(),
      minimumOrderAmount: (json['minimumOrderAmount'] as num?)?.toDouble() ?? 0,
      maximumDiscountAmount: (json['maximumDiscountAmount'] as num?)?.toDouble(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      isActive: json['isActive'] as bool? ?? true,
      isFirstTimeOnly: json['isFirstTimeOnly'] as bool? ?? false,
      usageLimit: json['usageLimit'] as int? ?? 0,
      usageCount: json['usageCount'] as int? ?? 0,
      applicableRestaurants: List<String>.from(json['applicableRestaurants'] ?? []),
      applicableCategories: List<String>.from(json['applicableCategories'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'title': title,
      'description': description,
      'type': type.name,
      'value': value,
      'minimumOrderAmount': minimumOrderAmount,
      'maximumDiscountAmount': maximumDiscountAmount,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'isActive': isActive,
      'isFirstTimeOnly': isFirstTimeOnly,
      'usageLimit': usageLimit,
      'usageCount': usageCount,
      'applicableRestaurants': applicableRestaurants,
      'applicableCategories': applicableCategories,
    };
  }

  bool get isValid {
    final now = DateTime.now();
    return isActive && 
           now.isAfter(startDate) && 
           now.isBefore(endDate) &&
           (usageLimit == 0 || usageCount < usageLimit);
  }

  bool canApplyToOrder({
    required double orderAmount,
    required List<String> restaurantIds,
    required List<String> categoryIds,
    required bool isFirstOrder,
  }) {
    if (!isValid) return false;
    
    if (orderAmount < minimumOrderAmount) return false;
    
    if (isFirstTimeOnly && !isFirstOrder) return false;
    
    if (applicableRestaurants.isNotEmpty && 
        !restaurantIds.any(applicableRestaurants.contains)) {
      return false;
    }
    
    if (applicableCategories.isNotEmpty && 
        !categoryIds.any(applicableCategories.contains)) {
      return false;
    }
    
    return true;
  }

  double calculateDiscount(double orderAmount, double deliveryFee) {
    switch (type) {
      case PromoCodeType.percentage:
        double discount = orderAmount * (value / 100);
        if (maximumDiscountAmount != null && discount > maximumDiscountAmount!) {
          discount = maximumDiscountAmount!;
        }
        return discount;
      case PromoCodeType.fixed:
        return value > orderAmount ? orderAmount : value;
      case PromoCodeType.freeDelivery:
        return deliveryFee;
    }
  }
}

enum PromoCodeType {
  percentage,
  fixed,
  freeDelivery,
}

extension PromoCodeTypeExtension on PromoCodeType {
  String get displayName {
    switch (this) {
      case PromoCodeType.percentage:
        return 'Pourcentage';
      case PromoCodeType.fixed:
        return 'Montant fixe';
      case PromoCodeType.freeDelivery:
        return 'Livraison gratuite';
    }
  }

  String formatValue(double value) {
    switch (this) {
      case PromoCodeType.percentage:
        return '${value.toInt()}%';
      case PromoCodeType.fixed:
        return '${value.toInt()} FCFA';
      case PromoCodeType.freeDelivery:
        return 'Gratuit';
    }
  }
}

class AppliedPromo {
  final PromoCode promoCode;
  final double discountAmount;
  final DateTime appliedAt;

  const AppliedPromo({
    required this.promoCode,
    required this.discountAmount,
    required this.appliedAt,
  });

  factory AppliedPromo.fromJson(Map<String, dynamic> json) {
    return AppliedPromo(
      promoCode: PromoCode.fromJson(json['promoCode'] as Map<String, dynamic>),
      discountAmount: (json['discountAmount'] as num).toDouble(),
      appliedAt: DateTime.parse(json['appliedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'promoCode': promoCode.toJson(),
      'discountAmount': discountAmount,
      'appliedAt': appliedAt.toIso8601String(),
    };
  }
}
