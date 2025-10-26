/// Loyalty program models and types
library;

enum LoyaltyTier {
  bronze('bronze', 0),
  silver('silver', 1000),
  gold('gold', 5000),
  platinum('platinum', 15000),
  diamond('diamond', 50000);

  const LoyaltyTier(this.value, this.pointsRequired);
  final String value;
  final int pointsRequired;

  static LoyaltyTier fromString(String value) {
    return LoyaltyTier.values.firstWhere(
      (tier) => tier.value == value,
      orElse: () => LoyaltyTier.bronze,
    );
  }

  String get displayName {
    switch (this) {
      case LoyaltyTier.bronze:
        return 'Bronze';
      case LoyaltyTier.silver:
        return 'Silver';
      case LoyaltyTier.gold:
        return 'Gold';
      case LoyaltyTier.platinum:
        return 'Platinum';
      case LoyaltyTier.diamond:
        return 'Diamond';
    }
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

  LoyaltyTier? get nextTier {
    final currentIndex = LoyaltyTier.values.indexOf(this);
    if (currentIndex < LoyaltyTier.values.length - 1) {
      return LoyaltyTier.values[currentIndex + 1];
    }
    return null;
  }

  List<String> get benefits {
    switch (this) {
      case LoyaltyTier.bronze:
        return [
          '1 point par commande',
          'Accès aux offres spéciales',
          'Récompenses de base',
        ];
      case LoyaltyTier.silver:
        return [
          '2 points par commande',
          'Réductions exclusives 5%',
          'Livraison prioritaire',
          'Support client prioritaire',
        ];
      case LoyaltyTier.gold:
        return [
          '3 points par commande',
          'Réductions exclusives 10%',
          'Livraison gratuite',
          'Accès aux offres premium',
          'Support VIP',
        ];
      case LoyaltyTier.platinum:
        return [
          '4 points par commande',
          'Réductions exclusives 15%',
          'Livraison gratuite express',
          'Offres premium exclusives',
          'Service prioritaire 24/7',
          'Cadeaux d\'anniversaire',
        ];
      case LoyaltyTier.diamond:
        return [
          '5 points par commande',
          'Réductions exclusives 20%',
          'Livraison gratuite premium',
          'Accès anticipé aux nouveautés',
          'Concierge personnel',
          'Événements exclusifs VIP',
          'Cadeaux premium',
        ];
    }
  }
}

enum RewardType {
  discount('discount'),
  freeDelivery('free_delivery'),
  freeItem('free_item'),
  cashback('cashback'),
  upgrade('upgrade');

  const RewardType(this.value);
  final String value;

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

enum RedemptionStatus {
  pending('pending'),
  completed('completed'),
  rejected('rejected');

  const RedemptionStatus(this.value);
  final String value;
}

enum LoyaltyTransactionType {
  earned,
  redeemed,
  expired,
  bonus,
  referral;

  static LoyaltyTransactionType fromString(String value) {
    return LoyaltyTransactionType.values.firstWhere(
      (type) => type.name == value,
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

class LoyaltyReward {
  final String id;
  final String title;
  final String name; // Alias for title
  final String description;
  final int pointsCost;
  final RewardType type;
  final bool isActive;
  final DateTime? expiryDate;

  const LoyaltyReward({
    required this.id,
    required this.title,
    required this.description,
    required this.pointsCost,
    required this.type,
    this.isActive = true,
    this.expiryDate,
  }) : name = title;

  bool get canRedeem =>
      isActive && (expiryDate == null || expiryDate!.isAfter(DateTime.now()));
}

class LoyaltyTransaction {
  final String id;
  final LoyaltyTransactionType type;
  final int points;
  final String description;
  final DateTime timestamp;
  final DateTime createdAt;
  final String? rewardId;
  final String? orderId;
  final String? referenceId;
  final Map<String, dynamic>? metadata;
  final String? status;

  const LoyaltyTransaction({
    required this.id,
    required this.type,
    required this.points,
    required this.description,
    required this.timestamp,
    this.rewardId,
    this.orderId,
    this.referenceId,
    this.metadata,
    this.status,
  }) : createdAt = timestamp;

  factory LoyaltyTransaction.fromJson(Map<String, dynamic> json) {
    return LoyaltyTransaction(
      id: json['id'] ?? '',
      type: LoyaltyTransactionType.fromString(json['type'] ?? 'earned'),
      points: json['points'] ?? 0,
      description: json['description'] ?? '',
      timestamp: DateTime.parse(json['timestamp'] ?? DateTime.now().toIso8601String()),
      rewardId: json['rewardId'],
      orderId: json['orderId'],
      referenceId: json['referenceId'],
      metadata: json['metadata'],
      status: json['status'],
    );
  }
}

class LoyaltyRedemptionRequest {
  final String id;
  final String rewardId;
  final LoyaltyReward reward;
  final int pointsRequired;
  final RedemptionStatus status;
  final DateTime requestedAt;
  final DateTime? redeemedAt;
  final String? rejectionReason;

  const LoyaltyRedemptionRequest({
    required this.id,
    required this.rewardId,
    required this.reward,
    required this.pointsRequired,
    required this.status,
    required this.requestedAt,
    this.redeemedAt,
    this.rejectionReason,
  });
}

class LoyaltyState {
  final int currentPoints;
  final int totalPoints;
  final int availablePoints;
  final LoyaltyTier currentTier;
  final int pointsToNextTier;
  final double? tierProgress;
  final List<LoyaltyTransaction> transactions;
  final List<LoyaltyReward> availableRewards;
  final bool isLoading;
  final bool isLoadingTransactions;
  final bool isLoadingRewards;
  final String? error;
  final Map<String, dynamic>? transactionsPagination;

  const LoyaltyState({
    required this.currentPoints,
    int? totalPoints,
    int? availablePoints,
    required this.currentTier,
    required this.pointsToNextTier,
    this.tierProgress,
    required this.transactions,
    required this.availableRewards,
    this.isLoading = false,
    this.isLoadingTransactions = false,
    this.isLoadingRewards = false,
    this.error,
    this.transactionsPagination,
  }) : totalPoints = totalPoints ?? currentPoints,
       availablePoints = availablePoints ?? currentPoints;

  LoyaltyState copyWith({
    int? currentPoints,
    int? totalPoints,
    int? availablePoints,
    LoyaltyTier? currentTier,
    int? pointsToNextTier,
    double? tierProgress,
    List<LoyaltyTransaction>? transactions,
    List<LoyaltyReward>? availableRewards,
    bool? isLoading,
    bool? isLoadingTransactions,
    bool? isLoadingRewards,
    String? error,
    Map<String, dynamic>? transactionsPagination,
  }) {
    return LoyaltyState(
      currentPoints: currentPoints ?? this.currentPoints,
      totalPoints: totalPoints ?? this.totalPoints,
      availablePoints: availablePoints ?? this.availablePoints,
      currentTier: currentTier ?? this.currentTier,
      pointsToNextTier: pointsToNextTier ?? this.pointsToNextTier,
      tierProgress: tierProgress ?? this.tierProgress,
      transactions: transactions ?? this.transactions,
      availableRewards: availableRewards ?? this.availableRewards,
      isLoading: isLoading ?? this.isLoading,
      isLoadingTransactions:
          isLoadingTransactions ?? this.isLoadingTransactions,
      isLoadingRewards: isLoadingRewards ?? this.isLoadingRewards,
      error: error,
      transactionsPagination:
          transactionsPagination ?? this.transactionsPagination,
    );
  }
}
