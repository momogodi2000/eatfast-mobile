import 'package:flutter/material.dart';
import '../../domain/models/loyalty.dart';

class RewardsShowcase extends StatelessWidget {
  final int availablePoints;
  final Function(LoyaltyReward) onRewardTap;

  const RewardsShowcase({
    super.key,
    required this.availablePoints,
    required this.onRewardTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 0),
        itemCount: _getFeaturedRewards().length,
        itemBuilder: (context, index) {
          final reward = _getFeaturedRewards()[index];
          return Padding(
            padding: EdgeInsets.only(
              right: index < _getFeaturedRewards().length - 1 ? 16 : 0,
            ),
            child: _RewardCard(
              reward: reward,
              availablePoints: availablePoints,
              onTap: () => onRewardTap(reward),
            ),
          );
        },
      ),
    );
  }

  List<LoyaltyReward> _getFeaturedRewards() {
    return [
      LoyaltyReward(
        id: 'reward_1',
        name: 'Livraison Gratuite',
        description: 'Livraison gratuite sur votre prochaine commande',
        pointsCost: 500,
        type: RewardType.freeDelivery,
        rewardData: {'deliveryValue': 1000},
      ),
      LoyaltyReward(
        id: 'reward_2',
        name: 'Réduction 10%',
        description: 'Réduction de 10% sur votre prochaine commande',
        pointsCost: 750,
        type: RewardType.discount,
        rewardData: {'discountPercentage': 10, 'maxDiscount': 5000},
      ),
      LoyaltyReward(
        id: 'reward_3',
        name: 'Boisson Gratuite',
        description: 'Une boisson gratuite avec votre commande',
        pointsCost: 300,
        type: RewardType.freeItem,
        rewardData: {'itemType': 'beverage'},
      ),
      LoyaltyReward(
        id: 'reward_4',
        name: 'Cashback 1000 XAF',
        description: 'Remboursement de 1000 XAF sur votre portefeuille',
        pointsCost: 1000,
        type: RewardType.cashback,
        rewardData: {'amount': 1000},
      ),
      LoyaltyReward(
        id: 'reward_5',
        name: 'Réduction 15%',
        description: 'Réduction de 15% sur les commandes de plus de 10000 XAF',
        pointsCost: 1200,
        type: RewardType.discount,
        rewardData: {'discountPercentage': 15, 'minOrderAmount': 10000},
      ),
    ];
  }
}

class _RewardCard extends StatelessWidget {
  final LoyaltyReward reward;
  final int availablePoints;
  final VoidCallback onTap;

  const _RewardCard({
    required this.reward,
    required this.availablePoints,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final canAfford = availablePoints >= reward.pointsCost;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: canAfford 
                ? Theme.of(context).primaryColor.withOpacity(0.3)
                : Colors.grey[300]!,
            width: canAfford ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: _getRewardTypeColor().withOpacity(0.1),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Center(
                child: Icon(
                  _getRewardTypeIcon(),
                  size: 32,
                  color: _getRewardTypeColor(),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reward.name,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: canAfford ? Colors.black87 : Colors.grey[600],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: Text(
                        reward.description,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: canAfford ? Colors.grey[600] : Colors.grey[500],
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: canAfford 
                                ? Theme.of(context).primaryColor
                                : Colors.grey[400],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${reward.pointsCost} pts',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (!canAfford)
                          Icon(
                            Icons.lock,
                            size: 16,
                            color: Colors.grey[400],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getRewardTypeColor() {
    switch (reward.type) {
      case RewardType.discount:
        return Colors.orange;
      case RewardType.freeDelivery:
        return Colors.blue;
      case RewardType.freeItem:
        return Colors.green;
      case RewardType.cashback:
        return Colors.purple;
      case RewardType.upgrade:
        return Colors.red;
    }
  }

  IconData _getRewardTypeIcon() {
    switch (reward.type) {
      case RewardType.discount:
        return Icons.local_offer;
      case RewardType.freeDelivery:
        return Icons.delivery_dining;
      case RewardType.freeItem:
        return Icons.free_breakfast;
      case RewardType.cashback:
        return Icons.account_balance_wallet;
      case RewardType.upgrade:
        return Icons.upgrade;
    }
  }
}