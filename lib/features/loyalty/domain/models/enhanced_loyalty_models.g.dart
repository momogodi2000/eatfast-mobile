// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enhanced_loyalty_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoyaltyStatusImpl _$$LoyaltyStatusImplFromJson(Map<String, dynamic> json) =>
    _$LoyaltyStatusImpl(
      userId: json['userId'] as String,
      totalPoints: (json['totalPoints'] as num).toInt(),
      availablePoints: (json['availablePoints'] as num).toInt(),
      currentTier:
          LoyaltyTier.fromJson(json['currentTier'] as Map<String, dynamic>),
      nextTier: json['nextTier'] == null
          ? null
          : LoyaltyTier.fromJson(json['nextTier'] as Map<String, dynamic>),
      pointsToNextTier: (json['pointsToNextTier'] as num).toInt(),
      progressToNextTier: (json['progressToNextTier'] as num).toDouble(),
      referralCode: json['referralCode'] as String,
      joinDate: DateTime.parse(json['joinDate'] as String),
      lastActivity: DateTime.parse(json['lastActivity'] as String),
      stats: LoyaltyStats.fromJson(json['stats'] as Map<String, dynamic>),
      achievements: (json['achievements'] as List<dynamic>)
          .map((e) => Achievement.fromJson(e as Map<String, dynamic>))
          .toList(),
      activeBonuses: (json['activeBonuses'] as List<dynamic>?)
              ?.map((e) => ActiveBonus.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      badges: (json['badges'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LoyaltyStatusImplToJson(_$LoyaltyStatusImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'totalPoints': instance.totalPoints,
      'availablePoints': instance.availablePoints,
      'currentTier': instance.currentTier,
      'nextTier': instance.nextTier,
      'pointsToNextTier': instance.pointsToNextTier,
      'progressToNextTier': instance.progressToNextTier,
      'referralCode': instance.referralCode,
      'joinDate': instance.joinDate.toIso8601String(),
      'lastActivity': instance.lastActivity.toIso8601String(),
      'stats': instance.stats,
      'achievements': instance.achievements,
      'activeBonuses': instance.activeBonuses,
      'badges': instance.badges,
    };

_$LoyaltyTierImpl _$$LoyaltyTierImplFromJson(Map<String, dynamic> json) =>
    _$LoyaltyTierImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      minPoints: (json['minPoints'] as num).toInt(),
      maxPoints: (json['maxPoints'] as num).toInt(),
      color: json['color'] as String,
      icon: json['icon'] as String,
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      benefits: (json['benefits'] as List<dynamic>)
          .map((e) => TierBenefit.fromJson(e as Map<String, dynamic>))
          .toList(),
      perks: json['perks'] as Map<String, dynamic>,
      pointsMultiplier: (json['pointsMultiplier'] as num?)?.toDouble() ?? 1.0,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$LoyaltyTierImplToJson(_$LoyaltyTierImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
      'minPoints': instance.minPoints,
      'maxPoints': instance.maxPoints,
      'color': instance.color,
      'icon': instance.icon,
      'discountPercentage': instance.discountPercentage,
      'benefits': instance.benefits,
      'perks': instance.perks,
      'pointsMultiplier': instance.pointsMultiplier,
      'description': instance.description,
    };

_$TierBenefitImpl _$$TierBenefitImplFromJson(Map<String, dynamic> json) =>
    _$TierBenefitImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      icon: json['icon'] as String,
      isActive: json['isActive'] as bool,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$TierBenefitImplToJson(_$TierBenefitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'icon': instance.icon,
      'isActive': instance.isActive,
      'metadata': instance.metadata,
    };

_$LoyaltyStatsImpl _$$LoyaltyStatsImplFromJson(Map<String, dynamic> json) =>
    _$LoyaltyStatsImpl(
      totalPointsEarned: (json['totalPointsEarned'] as num).toInt(),
      totalPointsRedeemed: (json['totalPointsRedeemed'] as num).toInt(),
      totalOrders: (json['totalOrders'] as num).toInt(),
      totalSpent: (json['totalSpent'] as num).toDouble(),
      referralsCount: (json['referralsCount'] as num).toInt(),
      achievementsCount: (json['achievementsCount'] as num).toInt(),
      firstOrderDate: DateTime.parse(json['firstOrderDate'] as String),
      streakDays: (json['streakDays'] as num).toInt(),
      monthlyOrders: (json['monthlyOrders'] as num).toInt(),
      averageOrderValue: (json['averageOrderValue'] as num).toDouble(),
    );

Map<String, dynamic> _$$LoyaltyStatsImplToJson(_$LoyaltyStatsImpl instance) =>
    <String, dynamic>{
      'totalPointsEarned': instance.totalPointsEarned,
      'totalPointsRedeemed': instance.totalPointsRedeemed,
      'totalOrders': instance.totalOrders,
      'totalSpent': instance.totalSpent,
      'referralsCount': instance.referralsCount,
      'achievementsCount': instance.achievementsCount,
      'firstOrderDate': instance.firstOrderDate.toIso8601String(),
      'streakDays': instance.streakDays,
      'monthlyOrders': instance.monthlyOrders,
      'averageOrderValue': instance.averageOrderValue,
    };

_$AchievementImpl _$$AchievementImplFromJson(Map<String, dynamic> json) =>
    _$AchievementImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      icon: json['icon'] as String,
      pointsReward: (json['pointsReward'] as num).toInt(),
      isUnlocked: json['isUnlocked'] as bool,
      unlockedDate: json['unlockedDate'] == null
          ? null
          : DateTime.parse(json['unlockedDate'] as String),
      progress: (json['progress'] as num).toDouble(),
      target: (json['target'] as num).toInt(),
      criteria: json['criteria'] as Map<String, dynamic>,
      isNew: json['isNew'] as bool? ?? false,
    );

Map<String, dynamic> _$$AchievementImplToJson(_$AchievementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'icon': instance.icon,
      'pointsReward': instance.pointsReward,
      'isUnlocked': instance.isUnlocked,
      'unlockedDate': instance.unlockedDate?.toIso8601String(),
      'progress': instance.progress,
      'target': instance.target,
      'criteria': instance.criteria,
      'isNew': instance.isNew,
    };

_$ActiveBonusImpl _$$ActiveBonusImplFromJson(Map<String, dynamic> json) =>
    _$ActiveBonusImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      multiplier: (json['multiplier'] as num).toDouble(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      conditions: json['conditions'] as Map<String, dynamic>,
      isUsed: json['isUsed'] as bool? ?? false,
    );

Map<String, dynamic> _$$ActiveBonusImplToJson(_$ActiveBonusImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'multiplier': instance.multiplier,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'conditions': instance.conditions,
      'isUsed': instance.isUsed,
    };

_$LoyaltyTransactionImpl _$$LoyaltyTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$LoyaltyTransactionImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      points: (json['points'] as num).toInt(),
      description: json['description'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      orderId: json['orderId'] as String?,
      referenceId: json['referenceId'] as String?,
      rewardId: json['rewardId'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$LoyaltyTransactionImplToJson(
        _$LoyaltyTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'points': instance.points,
      'description': instance.description,
      'timestamp': instance.timestamp.toIso8601String(),
      'orderId': instance.orderId,
      'referenceId': instance.referenceId,
      'rewardId': instance.rewardId,
      'metadata': instance.metadata,
      'status': instance.status,
    };

_$LoyaltyRewardImpl _$$LoyaltyRewardImplFromJson(Map<String, dynamic> json) =>
    _$LoyaltyRewardImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      pointsRequired: (json['pointsRequired'] as num).toInt(),
      type: json['type'] as String,
      value: json['value'] as String,
      icon: json['icon'] as String,
      image: json['image'] as String,
      isAvailable: json['isAvailable'] as bool,
      stock: (json['stock'] as num).toInt(),
      expiryDate: json['expiryDate'] == null
          ? null
          : DateTime.parse(json['expiryDate'] as String),
      terms: (json['terms'] as List<dynamic>).map((e) => e as String).toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
      isPopular: json['isPopular'] as bool? ?? false,
      isLimitedTime: json['isLimitedTime'] as bool? ?? false,
    );

Map<String, dynamic> _$$LoyaltyRewardImplToJson(_$LoyaltyRewardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'pointsRequired': instance.pointsRequired,
      'type': instance.type,
      'value': instance.value,
      'icon': instance.icon,
      'image': instance.image,
      'isAvailable': instance.isAvailable,
      'stock': instance.stock,
      'expiryDate': instance.expiryDate?.toIso8601String(),
      'terms': instance.terms,
      'metadata': instance.metadata,
      'isPopular': instance.isPopular,
      'isLimitedTime': instance.isLimitedTime,
    };

_$RedemptionResultImpl _$$RedemptionResultImplFromJson(
        Map<String, dynamic> json) =>
    _$RedemptionResultImpl(
      redemptionId: json['redemptionId'] as String,
      rewardId: json['rewardId'] as String,
      rewardTitle: json['rewardTitle'] as String,
      pointsUsed: (json['pointsUsed'] as num).toInt(),
      remainingPoints: (json['remainingPoints'] as num).toInt(),
      status: json['status'] as String,
      redeemedAt: DateTime.parse(json['redeemedAt'] as String),
      promoCode: json['promoCode'] as String?,
      voucherCode: json['voucherCode'] as String?,
      validUntil: json['validUntil'] == null
          ? null
          : DateTime.parse(json['validUntil'] as String),
      rewardData: json['rewardData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$RedemptionResultImplToJson(
        _$RedemptionResultImpl instance) =>
    <String, dynamic>{
      'redemptionId': instance.redemptionId,
      'rewardId': instance.rewardId,
      'rewardTitle': instance.rewardTitle,
      'pointsUsed': instance.pointsUsed,
      'remainingPoints': instance.remainingPoints,
      'status': instance.status,
      'redeemedAt': instance.redeemedAt.toIso8601String(),
      'promoCode': instance.promoCode,
      'voucherCode': instance.voucherCode,
      'validUntil': instance.validUntil?.toIso8601String(),
      'rewardData': instance.rewardData,
    };

_$LoyaltyConfigImpl _$$LoyaltyConfigImplFromJson(Map<String, dynamic> json) =>
    _$LoyaltyConfigImpl(
      tiers: (json['tiers'] as List<dynamic>)
          .map((e) => LoyaltyTier.fromJson(e as Map<String, dynamic>))
          .toList(),
      pointsRules: Map<String, int>.from(json['pointsRules'] as Map),
      bonusMultipliers: (json['bonusMultipliers'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      referralPointsReward: (json['referralPointsReward'] as num).toInt(),
      signupPointsReward: (json['signupPointsReward'] as num).toInt(),
      reviewPointsReward: (json['reviewPointsReward'] as num).toInt(),
      dailyCheckInPoints: (json['dailyCheckInPoints'] as num).toInt(),
      specialOffers: json['specialOffers'] as Map<String, dynamic>,
      configVersion: DateTime.parse(json['configVersion'] as String),
    );

Map<String, dynamic> _$$LoyaltyConfigImplToJson(_$LoyaltyConfigImpl instance) =>
    <String, dynamic>{
      'tiers': instance.tiers,
      'pointsRules': instance.pointsRules,
      'bonusMultipliers': instance.bonusMultipliers,
      'referralPointsReward': instance.referralPointsReward,
      'signupPointsReward': instance.signupPointsReward,
      'reviewPointsReward': instance.reviewPointsReward,
      'dailyCheckInPoints': instance.dailyCheckInPoints,
      'specialOffers': instance.specialOffers,
      'configVersion': instance.configVersion.toIso8601String(),
    };

_$LoyaltyDashboardImpl _$$LoyaltyDashboardImplFromJson(
        Map<String, dynamic> json) =>
    _$LoyaltyDashboardImpl(
      status: LoyaltyStatus.fromJson(json['status'] as Map<String, dynamic>),
      featuredRewards: (json['featuredRewards'] as List<dynamic>)
          .map((e) => LoyaltyReward.fromJson(e as Map<String, dynamic>))
          .toList(),
      nearbyAchievements: (json['nearbyAchievements'] as List<dynamic>)
          .map((e) => Achievement.fromJson(e as Map<String, dynamic>))
          .toList(),
      earningOpportunities: (json['earningOpportunities'] as List<dynamic>)
          .map((e) => EarningOpportunity.fromJson(e as Map<String, dynamic>))
          .toList(),
      activeEvents: (json['activeEvents'] as List<dynamic>)
          .map((e) => SpecialEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommendations: (json['recommendations'] as List<dynamic>)
          .map((e) => LoyaltyRecommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      insights:
          LoyaltyInsights.fromJson(json['insights'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoyaltyDashboardImplToJson(
        _$LoyaltyDashboardImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'featuredRewards': instance.featuredRewards,
      'nearbyAchievements': instance.nearbyAchievements,
      'earningOpportunities': instance.earningOpportunities,
      'activeEvents': instance.activeEvents,
      'recommendations': instance.recommendations,
      'insights': instance.insights,
    };

_$PointsEarnResultImpl _$$PointsEarnResultImplFromJson(
        Map<String, dynamic> json) =>
    _$PointsEarnResultImpl(
      transactionId: json['transactionId'] as String,
      pointsEarned: (json['pointsEarned'] as num).toInt(),
      totalPoints: (json['totalPoints'] as num).toInt(),
      action: json['action'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      bonusDescription: json['bonusDescription'] as String?,
      bonusPoints: (json['bonusPoints'] as num?)?.toInt(),
      tierUpgraded: json['tierUpgraded'] as bool?,
      newTier: json['newTier'] == null
          ? null
          : LoyaltyTier.fromJson(json['newTier'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PointsEarnResultImplToJson(
        _$PointsEarnResultImpl instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'pointsEarned': instance.pointsEarned,
      'totalPoints': instance.totalPoints,
      'action': instance.action,
      'timestamp': instance.timestamp.toIso8601String(),
      'bonusDescription': instance.bonusDescription,
      'bonusPoints': instance.bonusPoints,
      'tierUpgraded': instance.tierUpgraded,
      'newTier': instance.newTier,
    };

_$RewardEligibilityImpl _$$RewardEligibilityImplFromJson(
        Map<String, dynamic> json) =>
    _$RewardEligibilityImpl(
      isEligible: json['isEligible'] as bool,
      rewardId: json['rewardId'] as String,
      reason: json['reason'] as String?,
      pointsNeeded: (json['pointsNeeded'] as num?)?.toInt(),
      missingRequirements: (json['missingRequirements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      availableFrom: json['availableFrom'] == null
          ? null
          : DateTime.parse(json['availableFrom'] as String),
    );

Map<String, dynamic> _$$RewardEligibilityImplToJson(
        _$RewardEligibilityImpl instance) =>
    <String, dynamic>{
      'isEligible': instance.isEligible,
      'rewardId': instance.rewardId,
      'reason': instance.reason,
      'pointsNeeded': instance.pointsNeeded,
      'missingRequirements': instance.missingRequirements,
      'availableFrom': instance.availableFrom?.toIso8601String(),
    };

_$EarningOpportunityImpl _$$EarningOpportunityImplFromJson(
        Map<String, dynamic> json) =>
    _$EarningOpportunityImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      action: json['action'] as String,
      pointsReward: (json['pointsReward'] as num).toInt(),
      category: json['category'] as String,
      icon: json['icon'] as String,
      isCompleted: json['isCompleted'] as bool,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      maxCompletions: (json['maxCompletions'] as num?)?.toInt() ?? 1,
      currentCompletions: (json['currentCompletions'] as num?)?.toInt() ?? 0,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$EarningOpportunityImplToJson(
        _$EarningOpportunityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'action': instance.action,
      'pointsReward': instance.pointsReward,
      'category': instance.category,
      'icon': instance.icon,
      'isCompleted': instance.isCompleted,
      'completedAt': instance.completedAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'maxCompletions': instance.maxCompletions,
      'currentCompletions': instance.currentCompletions,
      'metadata': instance.metadata,
    };

_$ShareResultImpl _$$ShareResultImplFromJson(Map<String, dynamic> json) =>
    _$ShareResultImpl(
      shareId: json['shareId'] as String,
      shareUrl: json['shareUrl'] as String,
      referralCode: json['referralCode'] as String,
      platform: json['platform'] as String,
      sharedAt: DateTime.parse(json['sharedAt'] as String),
      bonusPoints: (json['bonusPoints'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ShareResultImplToJson(_$ShareResultImpl instance) =>
    <String, dynamic>{
      'shareId': instance.shareId,
      'shareUrl': instance.shareUrl,
      'referralCode': instance.referralCode,
      'platform': instance.platform,
      'sharedAt': instance.sharedAt.toIso8601String(),
      'bonusPoints': instance.bonusPoints,
    };

_$LoyaltyRecommendationImpl _$$LoyaltyRecommendationImplFromJson(
        Map<String, dynamic> json) =>
    _$LoyaltyRecommendationImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      action: json['action'] as String,
      priority: (json['priority'] as num).toInt(),
      icon: json['icon'] as String,
      data: json['data'] as Map<String, dynamic>?,
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$$LoyaltyRecommendationImplToJson(
        _$LoyaltyRecommendationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'action': instance.action,
      'priority': instance.priority,
      'icon': instance.icon,
      'data': instance.data,
      'expiresAt': instance.expiresAt?.toIso8601String(),
    };

_$SpecialEventImpl _$$SpecialEventImplFromJson(Map<String, dynamic> json) =>
    _$SpecialEventImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      rules: json['rules'] as Map<String, dynamic>,
      rewards: (json['rewards'] as List<dynamic>)
          .map((e) => EventReward.fromJson(e as Map<String, dynamic>))
          .toList(),
      isActive: json['isActive'] as bool,
      bannerImage: json['bannerImage'] as String,
      pointsMultiplier: (json['pointsMultiplier'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$$SpecialEventImplToJson(_$SpecialEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'rules': instance.rules,
      'rewards': instance.rewards,
      'isActive': instance.isActive,
      'bannerImage': instance.bannerImage,
      'pointsMultiplier': instance.pointsMultiplier,
    };

_$EventRewardImpl _$$EventRewardImplFromJson(Map<String, dynamic> json) =>
    _$EventRewardImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      pointsRequired: (json['pointsRequired'] as num).toInt(),
      type: json['type'] as String,
      isUnlocked: json['isUnlocked'] as bool,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$EventRewardImplToJson(_$EventRewardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'pointsRequired': instance.pointsRequired,
      'type': instance.type,
      'isUnlocked': instance.isUnlocked,
      'metadata': instance.metadata,
    };

_$LoyaltyInsightsImpl _$$LoyaltyInsightsImplFromJson(
        Map<String, dynamic> json) =>
    _$LoyaltyInsightsImpl(
      mostActiveDay: json['mostActiveDay'] as String,
      favoriteCategory: json['favoriteCategory'] as String,
      averagePointsPerOrder: (json['averagePointsPerOrder'] as num).toDouble(),
      daysUntilTierExpiry: (json['daysUntilTierExpiry'] as num).toInt(),
      recommendedActions: (json['recommendedActions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      spendingPattern: json['spendingPattern'] as Map<String, dynamic>,
      savingsFromLoyalty: (json['savingsFromLoyalty'] as num).toDouble(),
    );

Map<String, dynamic> _$$LoyaltyInsightsImplToJson(
        _$LoyaltyInsightsImpl instance) =>
    <String, dynamic>{
      'mostActiveDay': instance.mostActiveDay,
      'favoriteCategory': instance.favoriteCategory,
      'averagePointsPerOrder': instance.averagePointsPerOrder,
      'daysUntilTierExpiry': instance.daysUntilTierExpiry,
      'recommendedActions': instance.recommendedActions,
      'spendingPattern': instance.spendingPattern,
      'savingsFromLoyalty': instance.savingsFromLoyalty,
    };
