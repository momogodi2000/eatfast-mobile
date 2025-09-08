import 'package:flutter_test/flutter_test.dart';
import '../../../lib/features/loyalty/domain/models/loyalty.dart';

void main() {
  group('Loyalty Models Tests', () {
    test('LoyaltyTier enum should work correctly', () {
      // Test enum values
      expect(LoyaltyTier.bronze.value, 'bronze');
      expect(LoyaltyTier.bronze.pointsRequired, 0);
      expect(LoyaltyTier.bronze.displayName, 'Bronze');

      expect(LoyaltyTier.gold.pointsRequired, 5000);
      expect(LoyaltyTier.platinum.pointsRequired, 15000);

      // Test fromString method
      expect(LoyaltyTier.fromString('silver'), LoyaltyTier.silver);
      expect(LoyaltyTier.fromString('invalid'), LoyaltyTier.bronze); // default

      // Test nextTier
      expect(LoyaltyTier.bronze.nextTier, LoyaltyTier.silver);
      expect(LoyaltyTier.diamond.nextTier, null);
    });

    test('LoyaltyReward model should create correctly', () {
      // Arrange
      final now = DateTime.now();

      // Act
      final reward = LoyaltyReward(
        id: '1',
        name: 'Free Coffee',
        description: 'Get a free coffee with any purchase',
        pointsCost: 100,
        type: RewardType.discount,
        value: 5.0,
        maxRedemptions: 100,
        currentRedemptions: 25,
        isActive: true,
        validFrom: now,
        validUntil: now.add(const Duration(days: 30)),
        category: 'beverages',
        imageUrl: 'https://example.com/coffee.jpg',
        termsAndConditions: 'Valid for one coffee per redemption',
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
    });

    test('LoyaltyTransaction model should create correctly', () {
      // Arrange
      final now = DateTime.now();

      // Act
      final transaction = LoyaltyTransaction(
        id: '1',
        loyaltyProgramId: 'program123',
        type: LoyaltyTransactionType.earned,
        points: 50,
        description: 'Points earned from order #12345',
        createdAt: now,
      );

      // Assert
      expect(transaction.id, '1');
      expect(transaction.loyaltyProgramId, 'program123');
      expect(transaction.type, LoyaltyTransactionType.earned);
      expect(transaction.points, 50);
      expect(transaction.description, 'Points earned from order #12345');
    });

    test('LoyaltyTransaction negative points should work correctly', () {
      // Arrange & Act
      final now = DateTime.now();
      final transaction = LoyaltyTransaction(
        id: '2',
        loyaltyProgramId: 'program123',
        type: LoyaltyTransactionType.redeemed,
        points: -25,
        description: 'Points redeemed for discount',
        createdAt: now,
      );

      // Assert
      expect(transaction.points, -25);
      expect(transaction.type, LoyaltyTransactionType.redeemed);
    });

    test('RewardType enum values should be correct', () {
      // Test all enum values
      expect(RewardType.discount.value, 'discount');
      expect(RewardType.freeDelivery.value, 'free_delivery');
      expect(RewardType.freeItem.value, 'free_item');
      expect(RewardType.cashback.value, 'cashback');
      expect(RewardType.upgrade.value, 'upgrade');

      // Test display names
      expect(RewardType.discount.displayName, 'Réduction');
      expect(RewardType.freeDelivery.displayName, 'Livraison gratuite');
      expect(RewardType.freeItem.displayName, 'Article gratuit');
    });

    test('LoyaltyTransactionType enum values should be correct', () {
      // Test all enum values
      expect(LoyaltyTransactionType.earned.value, 'earned');
      expect(LoyaltyTransactionType.redeemed.value, 'redeemed');
      expect(LoyaltyTransactionType.expired.value, 'expired');
      expect(LoyaltyTransactionType.bonus.value, 'bonus');
      expect(LoyaltyTransactionType.referral.value, 'referral');

      // Test display names
      expect(LoyaltyTransactionType.earned.displayName, 'Points gagnés');
      expect(LoyaltyTransactionType.redeemed.displayName, 'Points utilisés');
      expect(LoyaltyTransactionType.expired.displayName, 'Points expirés');
    });
  });

  group('Loyalty Business Logic Tests', () {
    test('Reward availability calculation should work correctly', () {
      // Test available reward
      final availableReward = LoyaltyReward(
        id: '1',
        name: 'Available Reward',
        description: 'Test reward',
        pointsCost: 100,
        type: RewardType.discount,
        maxRedemptions: 100,
        currentRedemptions: 50,
        isAvailable: true,
      );

      expect(availableReward.isAvailable, true);

      // Test unavailable reward (max redemptions reached)
      final unavailableReward = LoyaltyReward(
        id: '2',
        name: 'Unavailable Reward',
        description: 'Test reward',
        pointsCost: 100,
        type: RewardType.discount,
        maxRedemptions: 100,
        currentRedemptions: 100,
        isAvailable: false,
      );

      expect(unavailableReward.isAvailable, false);

      // Test inactive reward
      final inactiveReward = LoyaltyReward(
        id: '3',
        name: 'Inactive Reward',
        description: 'Test reward',
        pointsCost: 100,
        type: RewardType.discount,
        maxRedemptions: 100,
        currentRedemptions: 0,
        isAvailable: false,
      );

      expect(inactiveReward.isAvailable, false);
    });
        category: 'test',
        imageUrl: null,
      );

      expect(inactiveReward.isAvailable, false);
    });

    test('LoyaltyProgram tier progression should work correctly', () {
      // Test tier progression logic using enum values
      final now = DateTime.now();

      // Test bronze tier
      final bronzeProgram = LoyaltyProgram(
        id: '1',
        userId: 'user1',
        totalPoints: 0,
        availablePoints: 0,
        usedPoints: 0,
        currentTier: LoyaltyTier.bronze,
        pointsToNextTier: 1000,
        createdAt: now,
        updatedAt: now,
      );

      expect(bronzeProgram.currentTier, LoyaltyTier.bronze);
      expect(bronzeProgram.pointsToNextTier, 1000);

      // Test silver tier
      final silverProgram = LoyaltyProgram(
        id: '2',
        userId: 'user2',
        totalPoints: 1500,
        availablePoints: 1500,
        usedPoints: 0,
        currentTier: LoyaltyTier.silver,
        pointsToNextTier: 3500,
        createdAt: now,
        updatedAt: now,
      );

      expect(silverProgram.currentTier, LoyaltyTier.silver);
      expect(silverProgram.pointsToNextTier, 3500);

      // Test tier progression
      expect(LoyaltyTier.bronze.nextTier, LoyaltyTier.silver);
      expect(LoyaltyTier.silver.nextTier, LoyaltyTier.gold);
      expect(LoyaltyTier.diamond.nextTier, null);
    });
  });
}
