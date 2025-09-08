/// Loyalty system models for the EatFast app
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

/// Loyalty tiers
enum LoyaltyTier {
  bronze('bronze', 0, 'Bronze'),
  silver('silver', 1000, 'Silver'),
  gold('gold', 5000, 'Gold'),
  platinum('platinum', 15000, 'Platinum'),
  diamond('diamond', 50000, 'Diamond');

  const LoyaltyTier(this.value, this.pointsRequired, this.displayName);
  final String value;
  final int pointsRequired;
  final String displayName;

  static LoyaltyTier fromString(String value) {
    return LoyaltyTier.values.firstWhere(
      (tier) => tier.value == value,
      orElse: () => LoyaltyTier.bronze,
    );
  }

  LoyaltyTier? get nextTier {
    final currentIndex = LoyaltyTier.values.indexOf(this);
    if (currentIndex < LoyaltyTier.values.length - 1) {
      return LoyaltyTier.values[currentIndex + 1];
    }
    return null;
  }

  String get description {
    switch (this) {
      case LoyaltyTier.bronze:
        return 'Découvrez nos récompenses de base';
      case LoyaltyTier.silver:
        return 'Profitez de réductions exclusives';
      case LoyaltyTier.gold:
        return 'Accédez aux offres premium';
      case LoyaltyTier.platinum:
        return 'Bénéficiez d\'un service prioritaire';
      case LoyaltyTier.diamond:
        return 'Profitez du meilleur programme de fidélité';
    }
  }

  String get iconPath {
    switch (this) {
      case LoyaltyTier.bronze:
        return 'assets/images/bronze_tier.png';
      case LoyaltyTier.silver:
        return 'assets/images/silver_tier.png';
      case LoyaltyTier.gold:
        return 'assets/images/gold_tier.png';
      case LoyaltyTier.platinum:
        return 'assets/images/platinum_tier.png';
      case LoyaltyTier.diamond:
        return 'assets/images/diamond_tier.png';
    }
  }

  List<String> get benefits {
    switch (this) {
      case LoyaltyTier.bronze:
        return [
          'Gagnez 1 point par 100 XAF dépensés',
          'Accès aux offres spéciales',
          'Points d\'anniversaire',
        ];
      case LoyaltyTier.silver:
        return [
          'Gagnez 1.5 points par 100 XAF dépensés',
          'Livraison gratuite sur certaines commandes',
          'Accès anticipé aux nouvelles offres',
          'Réduction de 5% sur les commandes de plus de 5000 XAF',
        ];
      case LoyaltyTier.gold:
        return [
          'Gagnez 2 points par 100 XAF dépensés',
          'Livraison gratuite illimitée',
          'Réduction de 10% sur les commandes de plus de 3000 XAF',
          'Support client prioritaire',
          'Cadeau d\'anniversaire spécial',
        ];
      case LoyaltyTier.platinum:
        return [
          'Gagnez 2.5 points par 100 XAF dépensés',
          'Livraison express gratuite',
          'Réduction de 15% sur toutes les commandes',
          'Accès aux restaurants exclusifs',
          'Concierge culinaire personnel',
        ];
      case LoyaltyTier.diamond:
        return [
          'Gagnez 3 points par 100 XAF dépensés',
          'Livraison VIP gratuite',
          'Réduction de 20% sur toutes les commandes',
          'Événements exclusifs et dégustations',
          'Menu personnalisé et recommandations',
          'Service de table virtuel',
        ];
    }
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