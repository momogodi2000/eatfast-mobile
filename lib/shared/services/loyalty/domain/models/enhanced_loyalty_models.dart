import 'package:freezed_annotation/freezed_annotation.dart';

part 'enhanced_loyalty_models.freezed.dart';
part 'enhanced_loyalty_models.g.dart';

/// Main loyalty status model
@freezed
class LoyaltyStatus with _$LoyaltyStatus {
  const factory LoyaltyStatus({
    required String userId,
    required int totalPoints,
    required int availablePoints,
    required LoyaltyTier currentTier,
    required LoyaltyTier? nextTier,
    required int pointsToNextTier,
    required double progressToNextTier,
    required String referralCode,
    required DateTime joinDate,
    required DateTime lastActivity,
    required LoyaltyStats stats,
    required List<Achievement> achievements,
    @Default([]) List<ActiveBonus> activeBonuses,
    @Default([]) List<String> badges,
  }) = _LoyaltyStatus;

  factory LoyaltyStatus.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyStatusFromJson(json);
}

/// Loyalty tier model
@freezed
class LoyaltyTier with _$LoyaltyTier {
  const factory LoyaltyTier({
    required String id,
    required String name,
    required String displayName,
    required int minPoints,
    required int maxPoints,
    required String color,
    required String icon,
    required double discountPercentage,
    required List<TierBenefit> benefits,
    required Map<String, dynamic> perks,
    @Default(1.0) double pointsMultiplier,
    required String description,
  }) = _LoyaltyTier;

  factory LoyaltyTier.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyTierFromJson(json);
}

/// Tier benefit model
@freezed
class TierBenefit with _$TierBenefit {
  const factory TierBenefit({
    required String id,
    required String title,
    required String description,
    required String type,
    required String icon,
    required bool isActive,
    Map<String, dynamic>? metadata,
  }) = _TierBenefit;

  factory TierBenefit.fromJson(Map<String, dynamic> json) =>
      _$TierBenefitFromJson(json);
}

/// Loyalty statistics model
@freezed
class LoyaltyStats with _$LoyaltyStats {
  const factory LoyaltyStats({
    required int totalPointsEarned,
    required int totalPointsRedeemed,
    required int totalOrders,
    required double totalSpent,
    required int referralsCount,
    required int achievementsCount,
    required DateTime firstOrderDate,
    required int streakDays,
    required int monthlyOrders,
    required double averageOrderValue,
  }) = _LoyaltyStats;

  factory LoyaltyStats.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyStatsFromJson(json);
}

/// Achievement model
@freezed
class Achievement with _$Achievement {
  const factory Achievement({
    required String id,
    required String title,
    required String description,
    required String category,
    required String icon,
    required int pointsReward,
    required bool isUnlocked,
    required DateTime? unlockedDate,
    required double progress,
    required int target,
    required Map<String, dynamic> criteria,
    @Default(false) bool isNew,
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);
}

/// Active bonus model
@freezed
class ActiveBonus with _$ActiveBonus {
  const factory ActiveBonus({
    required String id,
    required String title,
    required String description,
    required String type,
    required double multiplier,
    required DateTime startDate,
    required DateTime endDate,
    required Map<String, dynamic> conditions,
    @Default(false) bool isUsed,
  }) = _ActiveBonus;

  factory ActiveBonus.fromJson(Map<String, dynamic> json) =>
      _$ActiveBonusFromJson(json);
}

/// Loyalty transaction model
@freezed
class LoyaltyTransaction with _$LoyaltyTransaction {
  const factory LoyaltyTransaction({
    required String id,
    required String type,
    required int points,
    required String description,
    required DateTime timestamp,
    String? orderId,
    String? referenceId,
    String? rewardId,
    Map<String, dynamic>? metadata,
    required String status,
  }) = _LoyaltyTransaction;

  factory LoyaltyTransaction.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyTransactionFromJson(json);
}

/// Loyalty reward model
@freezed
class LoyaltyReward with _$LoyaltyReward {
  const factory LoyaltyReward({
    required String id,
    required String title,
    required String description,
    required String category,
    required int pointsRequired,
    required String type,
    required String value,
    required String icon,
    required String image,
    required bool isAvailable,
    required int stock,
    required DateTime? expiryDate,
    required List<String> terms,
    Map<String, dynamic>? metadata,
    @Default(false) bool isPopular,
    @Default(false) bool isLimitedTime,
  }) = _LoyaltyReward;

  factory LoyaltyReward.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyRewardFromJson(json);
}

/// Redemption result model
@freezed
class RedemptionResult with _$RedemptionResult {
  const factory RedemptionResult({
    required String redemptionId,
    required String rewardId,
    required String rewardTitle,
    required int pointsUsed,
    required int remainingPoints,
    required String status,
    required DateTime redeemedAt,
    String? promoCode,
    String? voucherCode,
    DateTime? validUntil,
    Map<String, dynamic>? rewardData,
  }) = _RedemptionResult;

  factory RedemptionResult.fromJson(Map<String, dynamic> json) =>
      _$RedemptionResultFromJson(json);
}

/// Loyalty configuration model
@freezed
class LoyaltyConfig with _$LoyaltyConfig {
  const factory LoyaltyConfig({
    required List<LoyaltyTier> tiers,
    required Map<String, int> pointsRules,
    required Map<String, double> bonusMultipliers,
    required int referralPointsReward,
    required int signupPointsReward,
    required int reviewPointsReward,
    required int dailyCheckInPoints,
    required Map<String, dynamic> specialOffers,
    required DateTime configVersion,
  }) = _LoyaltyConfig;

  factory LoyaltyConfig.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyConfigFromJson(json);
}

/// Loyalty dashboard model
@freezed
class LoyaltyDashboard with _$LoyaltyDashboard {
  const factory LoyaltyDashboard({
    required LoyaltyStatus status,
    required List<LoyaltyReward> featuredRewards,
    required List<Achievement> nearbyAchievements,
    required List<EarningOpportunity> earningOpportunities,
    required List<SpecialEvent> activeEvents,
    required List<LoyaltyRecommendation> recommendations,
    required LoyaltyInsights insights,
  }) = _LoyaltyDashboard;

  factory LoyaltyDashboard.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyDashboardFromJson(json);
}

/// Points earning result model
@freezed
class PointsEarnResult with _$PointsEarnResult {
  const factory PointsEarnResult({
    required String transactionId,
    required int pointsEarned,
    required int totalPoints,
    required String action,
    required DateTime timestamp,
    String? bonusDescription,
    int? bonusPoints,
    bool? tierUpgraded,
    LoyaltyTier? newTier,
  }) = _PointsEarnResult;

  factory PointsEarnResult.fromJson(Map<String, dynamic> json) =>
      _$PointsEarnResultFromJson(json);
}

/// Reward eligibility model
@freezed
class RewardEligibility with _$RewardEligibility {
  const factory RewardEligibility({
    required bool isEligible,
    required String rewardId,
    String? reason,
    int? pointsNeeded,
    List<String>? missingRequirements,
    DateTime? availableFrom,
  }) = _RewardEligibility;

  factory RewardEligibility.fromJson(Map<String, dynamic> json) =>
      _$RewardEligibilityFromJson(json);
}

/// Earning opportunity model
@freezed
class EarningOpportunity with _$EarningOpportunity {
  const factory EarningOpportunity({
    required String id,
    required String title,
    required String description,
    required String action,
    required int pointsReward,
    required String category,
    required String icon,
    required bool isCompleted,
    required DateTime? completedAt,
    required DateTime? expiresAt,
    @Default(1) int maxCompletions,
    @Default(0) int currentCompletions,
    Map<String, dynamic>? metadata,
  }) = _EarningOpportunity;

  factory EarningOpportunity.fromJson(Map<String, dynamic> json) =>
      _$EarningOpportunityFromJson(json);
}

/// Share result model
@freezed
class ShareResult with _$ShareResult {
  const factory ShareResult({
    required String shareId,
    required String shareUrl,
    required String referralCode,
    required String platform,
    required DateTime sharedAt,
    int? bonusPoints,
  }) = _ShareResult;

  factory ShareResult.fromJson(Map<String, dynamic> json) =>
      _$ShareResultFromJson(json);
}

/// Loyalty recommendation model
@freezed
class LoyaltyRecommendation with _$LoyaltyRecommendation {
  const factory LoyaltyRecommendation({
    required String id,
    required String type,
    required String title,
    required String description,
    required String action,
    required int priority,
    required String icon,
    Map<String, dynamic>? data,
    DateTime? expiresAt,
  }) = _LoyaltyRecommendation;

  factory LoyaltyRecommendation.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyRecommendationFromJson(json);
}

/// Special event model
@freezed
class SpecialEvent with _$SpecialEvent {
  const factory SpecialEvent({
    required String id,
    required String title,
    required String description,
    required String type,
    required DateTime startDate,
    required DateTime endDate,
    required Map<String, dynamic> rules,
    required List<EventReward> rewards,
    required bool isActive,
    required String bannerImage,
    @Default(1.0) double pointsMultiplier,
  }) = _SpecialEvent;

  factory SpecialEvent.fromJson(Map<String, dynamic> json) =>
      _$SpecialEventFromJson(json);
}

/// Event reward model
@freezed
class EventReward with _$EventReward {
  const factory EventReward({
    required String id,
    required String title,
    required String description,
    required int pointsRequired,
    required String type,
    required bool isUnlocked,
    Map<String, dynamic>? metadata,
  }) = _EventReward;

  factory EventReward.fromJson(Map<String, dynamic> json) =>
      _$EventRewardFromJson(json);
}

/// Loyalty insights model
@freezed
class LoyaltyInsights with _$LoyaltyInsights {
  const factory LoyaltyInsights({
    required String mostActiveDay,
    required String favoriteCategory,
    required double averagePointsPerOrder,
    required int daysUntilTierExpiry,
    required List<String> recommendedActions,
    required Map<String, dynamic> spendingPattern,
    required double savingsFromLoyalty,
  }) = _LoyaltyInsights;

  factory LoyaltyInsights.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyInsightsFromJson(json);
}
