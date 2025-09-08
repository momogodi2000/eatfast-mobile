import 'package:flutter_test/flutter_test.dart';
import 'package:eatfast_mobile/features/loyalty/domain/models/loyalty_models.dart';
import 'package:eatfast_mobile/features/loyalty/domain/models/reward.dart';
import 'package:eatfast_mobile/features/loyalty/domain/models/loyalty_transaction.dart';

void main() {
  group('Loyalty Models Tests', () {
    test('LoyaltyTier model should create correctly', () {
      // Arrange & Act
      const tier = LoyaltyTier(
        id: '1',
        name: 'Bronze',
        description: 'Bronze tier description',
        pointsRequired: 0,
        benefits: ['Free delivery', 'Priority support'],
        color: '#CD7F32',
        icon: 'bronze_icon',
      );

      // Assert
      expect(tier.id, '1');
      expect(tier.name, 'Bronze');
      expect(tier.description, 'Bronze tier description');
      expect(tier.pointsRequired, 0);
      expect(tier.benefits.length, 2);
      expect(tier.benefits.first, 'Free delivery');
      expect(tier.color, '#CD7F32');
      expect(tier.icon, 'bronze_icon');
    });

    test('Reward model should create correctly', () {
      // Arrange & Act
      const reward = Reward(
        id: '1',
        name: 'Free Coffee',
        description: 'Get a free coffee with any purchase',
        pointsCost: 100,
        type: RewardType.discount,
        value: 5.0,
        maxRedemptions: 100,
        currentRedemptions: 25,
        isActive: true,
        validFrom: null,
        validUntil: null,
        category: 'beverages',
        imageUrl: 'https://example.com/coffee.jpg',
      );

      // Assert
      expect(reward.id, '1');
      expect(reward.name, 'Free Coffee');
      expect(reward.description, 'Get a free coffee with any purchase');
      expect(reward.pointsCost, 100);
      expect(reward.type, RewardType.discount);
      expect(reward.value, 5.0);
      expect(reward.maxRedemptions, 100);
      expect(reward.currentRedemptions, 25);
      expect(reward.isActive, true);
      expect(reward.category, 'beverages');
      expect(reward.imageUrl, 'https://example.com/coffee.jpg');
      expect(reward.isAvailable, true);
    });

    test('LoyaltyTransaction model should create correctly', () {
      // Arrange
      final now = DateTime.now();

      // Act
      const transaction = LoyaltyTransaction(
        id: '1',
        userId: 'user123',
        type: TransactionType.earned,
        points: 50,
        description: 'Points earned from order #12345',
        referenceId: 'order_12345',
        referenceType: 'order',
        createdAt: null,
      );

      // Assert
      expect(transaction.id, '1');
      expect(transaction.userId, 'user123');
      expect(transaction.type, TransactionType.earned);
      expect(transaction.points, 50);
      expect(transaction.description, 'Points earned from order #12345');
      expect(transaction.referenceId, 'order_12345');
      expect(transaction.referenceType, 'order');
      expect(transaction.isPositive, true);
    });

    test('LoyaltyTransaction negative points should work correctly', () {
      // Arrange & Act
      const transaction = LoyaltyTransaction(
        id: '2',
        userId: 'user123',
        type: TransactionType.redeemed,
        points: -25,
        description: 'Points redeemed for discount',
        referenceId: 'reward_456',
        referenceType: 'reward',
        createdAt: null,
      );

      // Assert
      expect(transaction.points, -25);
      expect(transaction.isPositive, false);
    });

    test('RewardType enum values should be correct', () {
      // Test all enum values
      expect(RewardType.discount.index, 0);
      expect(RewardType.freeItem.index, 1);
      expect(RewardType.percentageOff.index, 2);
      expect(RewardType.cashback.index, 3);

      expect(RewardType.discount.name, 'discount');
      expect(RewardType.freeItem.name, 'freeItem');
      expect(RewardType.percentageOff.name, 'percentageOff');
      expect(RewardType.cashback.name, 'cashback');
    });

    test('TransactionType enum values should be correct', () {
      // Test all enum values
      expect(TransactionType.earned.index, 0);
      expect(TransactionType.redeemed.index, 1);
      expect(TransactionType.expired.index, 2);
      expect(TransactionType.adjusted.index, 3);
      expect(TransactionType.bonus.index, 4);

      expect(TransactionType.earned.name, 'earned');
      expect(TransactionType.redeemed.name, 'redeemed');
      expect(TransactionType.expired.name, 'expired');
      expect(TransactionType.adjusted.name, 'adjusted');
      expect(TransactionType.bonus.name, 'bonus');
    });
  });

  group('Loyalty Business Logic Tests', () {
    test('Reward availability calculation should work correctly', () {
      // Test available reward
      const availableReward = Reward(
        id: '1',
        name: 'Available Reward',
        description: 'Test reward',
        pointsCost: 100,
        type: RewardType.discount,
        value: 10.0,
        maxRedemptions: 100,
        currentRedemptions: 50,
        isActive: true,
        validFrom: null,
        validUntil: null,
        category: 'test',
        imageUrl: null,
      );

      expect(availableReward.isAvailable, true);

      // Test unavailable reward (max redemptions reached)
      const unavailableReward = Reward(
        id: '2',
        name: 'Unavailable Reward',
        description: 'Test reward',
        pointsCost: 100,
        type: RewardType.discount,
        value: 10.0,
        maxRedemptions: 100,
        currentRedemptions: 100,
        isActive: true,
        validFrom: null,
        validUntil: null,
        category: 'test',
        imageUrl: null,
      );

      expect(unavailableReward.isAvailable, false);

      // Test inactive reward
      const inactiveReward = Reward(
        id: '3',
        name: 'Inactive Reward',
        description: 'Test reward',
        pointsCost: 100,
        type: RewardType.discount,
        value: 10.0,
        maxRedemptions: 100,
        currentRedemptions: 0,
        isActive: false,
        validFrom: null,
        validUntil: null,
        category: 'test',
        imageUrl: null,
      );

      expect(inactiveReward.isAvailable, false);
    });

    test('Loyalty tier progression should work correctly', () {
      // Test tier progression logic
      const bronzeTier = LoyaltyTier(
        id: '1',
        name: 'Bronze',
        description: 'Bronze tier',
        pointsRequired: 0,
        benefits: ['Basic benefits'],
        color: '#CD7F32',
        icon: 'bronze',
      );

      const silverTier = LoyaltyTier(
        id: '2',
        name: 'Silver',
        description: 'Silver tier',
        pointsRequired: 500,
        benefits: ['Free delivery', 'Priority support'],
        color: '#C0C0C0',
        icon: 'silver',
      );

      const goldTier = LoyaltyTier(
        id: '3',
        name: 'Gold',
        description: 'Gold tier',
        pointsRequired: 1500,
        benefits: ['Free delivery', 'Priority support', 'Exclusive offers'],
        color: '#FFD700',
        icon: 'gold',
      );

      // Test tier determination based on points
      expect(_getTierForPoints(0, [bronzeTier, silverTier, goldTier]), bronzeTier);
      expect(_getTierForPoints(250, [bronzeTier, silverTier, goldTier]), bronzeTier);
      expect(_getTierForPoints(500, [bronzeTier, silverTier, goldTier]), silverTier);
      expect(_getTierForPoints(1000, [bronzeTier, silverTier, goldTier]), silverTier);
      expect(_getTierForPoints(1500, [bronzeTier, silverTier, goldTier]), goldTier);
      expect(_getTierForPoints(2000, [bronzeTier, silverTier, goldTier]), goldTier);
    });
  });
}

// Helper function for testing tier determination
LoyaltyTier _getTierForPoints(int points, List<LoyaltyTier> tiers) {
  // Sort tiers by points required ascending
  final sortedTiers = tiers..sort((a, b) => a.pointsRequired.compareTo(b.pointsRequired));

  // Find the highest tier the user qualifies for
  for (int i = sortedTiers.length - 1; i >= 0; i--) {
    if (points >= sortedTiers[i].pointsRequired) {
      return sortedTiers[i];
    }
  }

  // Return the first tier if no tier is qualified
  return sortedTiers.first;
}
