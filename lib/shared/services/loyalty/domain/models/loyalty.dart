/// Loyalty system models for the EatFast app
library;
import 'package:eatfast_mobile/shared/models/loyalty_models.dart';
class LoyaltyProgram {
  final String id;
  final String userId;
  final int totalPoints;
  final int availablePoints;
  final int usedPoints;
  final LoyaltyTier currentTier;
  final int pointsToNextTier;
  final List<LoyaltyTransaction> recentTransactions;
  final Map<String, dynamic> tierBenefits;
  final DateTime createdAt;
  final DateTime updatedAt;

  LoyaltyProgram({
    required this.id,
    required this.userId,
    required this.totalPoints,
    required this.availablePoints,
    required this.usedPoints,
    required this.currentTier,
    required this.pointsToNextTier,
    this.recentTransactions = const [],
    this.tierBenefits = const {},
    required this.createdAt,
    required this.updatedAt,
  });

  factory LoyaltyProgram.fromJson(Map<String, dynamic> json) {
    return LoyaltyProgram(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      totalPoints: json['totalPoints'] ?? 0,
      availablePoints: json['availablePoints'] ?? 0,
      usedPoints: json['usedPoints'] ?? 0,
      currentTier: LoyaltyTier.fromString(json['currentTier'] ?? 'bronze'),
      pointsToNextTier: json['pointsToNextTier'] ?? 0,
      recentTransactions: json['recentTransactions'] != null
          ? (json['recentTransactions'] as List)
              .map((t) => LoyaltyTransaction.fromJson(t))
              .toList()
          : [],
      tierBenefits: json['tierBenefits'] ?? {},
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'totalPoints': totalPoints,
      'availablePoints': availablePoints,
      'usedPoints': usedPoints,
      'currentTier': currentTier.value,
      'pointsToNextTier': pointsToNextTier,
      'recentTransactions': recentTransactions.map((t) => t.toJson()).toList(),
      'tierBenefits': tierBenefits,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  LoyaltyProgram copyWith({
    String? id,
    String? userId,
    int? totalPoints,
    int? availablePoints,
    int? usedPoints,
    LoyaltyTier? currentTier,
    int? pointsToNextTier,
    List<LoyaltyTransaction>? recentTransactions,
    Map<String, dynamic>? tierBenefits,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return LoyaltyProgram(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      totalPoints: totalPoints ?? this.totalPoints,
      availablePoints: availablePoints ?? this.availablePoints,
      usedPoints: usedPoints ?? this.usedPoints,
      currentTier: currentTier ?? this.currentTier,
      pointsToNextTier: pointsToNextTier ?? this.pointsToNextTier,
      recentTransactions: recentTransactions ?? this.recentTransactions,
      tierBenefits: tierBenefits ?? this.tierBenefits,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  double get tierProgress {
    if (pointsToNextTier <= 0) return 1.0;
    final tierThreshold = currentTier.pointsRequired;
    final nextTierThreshold = currentTier.nextTier?.pointsRequired ?? tierThreshold;
    final progressPoints = totalPoints - tierThreshold;
    final totalNeeded = nextTierThreshold - tierThreshold;
    return (progressPoints / totalNeeded).clamp(0.0, 1.0);
  }
}

/// Loyalty transaction model
class LoyaltyTransaction {
  final String id;
  final String loyaltyProgramId;
  final String? orderId;
  final LoyaltyTransactionType type;
  final int points;
  final String description;
  final Map<String, dynamic>? metadata;
  final DateTime createdAt;

  LoyaltyTransaction({
    required this.id,
    required this.loyaltyProgramId,
    this.orderId,
    required this.type,
    required this.points,
    required this.description,
    this.metadata,
    required this.createdAt,
  });

  factory LoyaltyTransaction.fromJson(Map<String, dynamic> json) {
    return LoyaltyTransaction(
      id: json['id'] ?? '',
      loyaltyProgramId: json['loyaltyProgramId'] ?? '',
      orderId: json['orderId'],
      type: LoyaltyTransactionType.fromString(json['type'] ?? 'earned'),
      points: json['points'] ?? 0,
      description: json['description'] ?? '',
      metadata: json['metadata'],
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'loyaltyProgramId': loyaltyProgramId,
      'orderId': orderId,
      'type': type.value,
      'points': points,
      'description': description,
      'metadata': metadata,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

/// Loyalty transaction types
enum LoyaltyTransactionType {
  earned('earned'),
  redeemed('redeemed'),
  expired('expired'),
  bonus('bonus'),
  referral('referral');

  const LoyaltyTransactionType(this.value);
  final String value;

  static LoyaltyTransactionType fromString(String value) {
    return LoyaltyTransactionType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => LoyaltyTransactionType.earned,
    );
  }

  String get displayName {
    switch (this) {
      case LoyaltyTransactionType.earned:
        return 'Points gagnés';
      case LoyaltyTransactionType.redeemed:
        return 'Points utilisés';
      case LoyaltyTransactionType.expired:
        return 'Points expirés';
      case LoyaltyTransactionType.bonus:
        return 'Points bonus';
      case LoyaltyTransactionType.referral:
        return 'Points parrainage';
    }
  }
}

/// Loyalty reward model
class LoyaltyReward {
  final String id;
  final String name;
  final String description;
  final int pointsCost;
  final RewardType type;
  final String? imageUrl;
  final Map<String, dynamic> rewardData;
  final bool isAvailable;
  final DateTime? expiresAt;
  final int maxRedemptions;
  final int currentRedemptions;

  LoyaltyReward({
    required this.id,
    required this.name,
    required this.description,
    required this.pointsCost,
    required this.type,
    this.imageUrl,
    this.rewardData = const {},
    this.isAvailable = true,
    this.expiresAt,
    this.maxRedemptions = -1,
    this.currentRedemptions = 0,
  });

  factory LoyaltyReward.fromJson(Map<String, dynamic> json) {
    return LoyaltyReward(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      pointsCost: json['pointsCost'] ?? 0,
      type: RewardType.fromString(json['type'] ?? 'discount'),
      imageUrl: json['imageUrl'],
      rewardData: json['rewardData'] ?? {},
      isAvailable: json['isAvailable'] ?? true,
      expiresAt: json['expiresAt'] != null 
          ? DateTime.parse(json['expiresAt'])
          : null,
      maxRedemptions: json['maxRedemptions'] ?? -1,
      currentRedemptions: json['currentRedemptions'] ?? 0,
    );
  }

  bool get canRedeem => 
      isAvailable && 
      (maxRedemptions == -1 || currentRedemptions < maxRedemptions) &&
      (expiresAt == null || expiresAt!.isAfter(DateTime.now()));
}

/// Reward types
enum RewardType {
  discount('discount'),
  freeDelivery('free_delivery'),
  freeItem('free_item'),
  cashback('cashback'),
  upgrade('upgrade');

  const RewardType(this.value);
  final String value;

  static RewardType fromString(String value) {
    return RewardType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => RewardType.discount,
    );
  }

  String get displayName {
    switch (this) {
      case RewardType.discount:
        return 'Réduction';
      case RewardType.freeDelivery:
        return 'Livraison gratuite';
      case RewardType.freeItem:
        return 'Article gratuit';
      case RewardType.cashback:
        return 'Remboursement';
      case RewardType.upgrade:
        return 'Amélioration';
    }
  }
}

/// Loyalty redemption request
class LoyaltyRedemptionRequest {
  final String rewardId;
  final String? orderId;
  final Map<String, dynamic>? metadata;

  LoyaltyRedemptionRequest({
    required this.rewardId,
    this.orderId,
    this.metadata,
  });

  Map<String, dynamic> toJson() {
    return {
      'rewardId': rewardId,
      if (orderId != null) 'orderId': orderId,
      if (metadata != null) 'metadata': metadata,
    };
  }
}
