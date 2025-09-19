import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/loyalty_provider.dart';
import '../../domain/models/loyalty.dart';

class RewardsCatalogScreen extends ConsumerStatefulWidget {
  const RewardsCatalogScreen({super.key});

  @override
  ConsumerState<RewardsCatalogScreen> createState() => _RewardsCatalogScreenState();
}

class _RewardsCatalogScreenState extends ConsumerState<RewardsCatalogScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(loyaltyProvider.notifier).loadAvailableRewards();
    });
  }

  @override
  Widget build(BuildContext context) {
    final loyaltyState = ref.watch(loyaltyProvider);
    final filterState = ref.watch(rewardsFilterProvider);
    final filteredRewards = ref.watch(filteredRewardsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogue des Récompenses'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterBottomSheet(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // Points Balance Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.8),
                ],
              ),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Points Disponibles',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${loyaltyState.availablePoints} points',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Active Filters
          if (_hasActiveFilters(filterState))
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Wrap(
                spacing: 8,
                children: _buildActiveFilterChips(context, filterState),
              ),
            ),

          // Rewards List
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => ref.read(loyaltyProvider.notifier).loadAvailableRewards(),
              child: loyaltyState.isLoadingRewards
                  ? _buildLoadingState()
                  : filteredRewards.isEmpty
                      ? _buildEmptyState(context)
                      : _buildRewardsList(context, filteredRewards, loyaltyState.availablePoints),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 6,
      itemBuilder: (context, index) => _buildLoadingRewardTile(),
    );
  }

  Widget _buildLoadingRewardTile() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 200,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: 80,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.card_giftcard,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'Aucune Récompense Disponible',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Gagnez plus de points en passant des commandes pour débloquer des récompenses',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardsList(BuildContext context, List<LoyaltyReward> rewards, int availablePoints) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: rewards.length,
      itemBuilder: (context, index) {
        final reward = rewards[index];
        return _RewardTile(
          reward: reward,
          availablePoints: availablePoints,
          onTap: () => _showRewardDetails(context, reward, availablePoints),
        );
      },
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _FilterBottomSheet(),
    );
  }

  void _showRewardDetails(BuildContext context, LoyaltyReward reward, int availablePoints) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _RewardDetailsBottomSheet(
        reward: reward,
        availablePoints: availablePoints,
        onRedeem: () async {
          final request = LoyaltyRedemptionRequest(rewardId: reward.id);
          final success = await ref.read(loyaltyProvider.notifier).redeemPoints(request);
          
          if (success && mounted) {
            if (mounted) {
              Navigator.of(context).pop();
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Récompense ${reward.name} échangée avec succès!'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            }
          }
        },
      ),
    );
  }

  bool _hasActiveFilters(RewardsFilterState filterState) {
    return filterState.selectedType != null || 
           filterState.maxPointsCost != null ||
           !filterState.showOnlyAffordable;
  }

  List<Widget> _buildActiveFilterChips(BuildContext context, RewardsFilterState filterState) {
    final List<Widget> chips = [];

    if (filterState.selectedType != null) {
      chips.add(
        Chip(
          label: Text(filterState.selectedType!.displayName),
          deleteIcon: const Icon(Icons.close, size: 16),
          onDeleted: () {
            ref.read(rewardsFilterProvider.notifier).setType(null);
          },
        ),
      );
    }

    if (filterState.maxPointsCost != null) {
      chips.add(
        Chip(
          label: Text('Max ${filterState.maxPointsCost} pts'),
          deleteIcon: const Icon(Icons.close, size: 16),
          onDeleted: () {
            ref.read(rewardsFilterProvider.notifier).setMaxPointsCost(null);
          },
        ),
      );
    }

    if (!filterState.showOnlyAffordable) {
      chips.add(
        Chip(
          label: const Text('Tout afficher'),
          deleteIcon: const Icon(Icons.close, size: 16),
          onDeleted: () {
            ref.read(rewardsFilterProvider.notifier).setShowOnlyAffordable(true);
          },
        ),
      );
    }

    return chips;
  }
}

class _RewardTile extends StatelessWidget {
  final LoyaltyReward reward;
  final int availablePoints;
  final VoidCallback onTap;

  const _RewardTile({
    required this.reward,
    required this.availablePoints,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final canAfford = availablePoints >= reward.pointsCost;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: canAfford 
                    ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.3)
                    : Colors.grey[300]!,
                width: canAfford ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: _getRewardTypeColor().withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Icon(
                      _getRewardTypeIcon(),
                      size: 28,
                      color: _getRewardTypeColor(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reward.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: canAfford ? Colors.black87 : Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        reward.description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: canAfford ? Colors.grey[600] : Colors.grey[500],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: canAfford 
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.grey[400],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              '${reward.pointsCost} points',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: _getRewardTypeColor().withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              reward.type.displayName,
                              style: TextStyle(
                                color: _getRewardTypeColor(),
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  canAfford ? Icons.arrow_forward_ios : Icons.lock,
                  size: 16,
                  color: canAfford ? Colors.grey[400] : Colors.grey[400],
                ),
              ],
            ),
          ),
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

class _FilterBottomSheet extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(rewardsFilterProvider);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Filtrer les Récompenses',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            
            Text(
              'Type de Récompense',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                FilterChip(
                  label: const Text('Tous'),
                  selected: filterState.selectedType == null,
                  onSelected: (_) => ref.read(rewardsFilterProvider.notifier).setType(null),
                ),
                ...RewardType.values.map((type) => FilterChip(
                  label: Text(type.displayName),
                  selected: filterState.selectedType == type,
                  onSelected: (_) => ref.read(rewardsFilterProvider.notifier).setType(type),
                )),
              ],
            ),
            
            const SizedBox(height: 20),
            
            SwitchListTile(
              title: const Text('Montrer seulement les récompenses abordables'),
              value: filterState.showOnlyAffordable,
              onChanged: (value) {
                ref.read(rewardsFilterProvider.notifier).setShowOnlyAffordable(value);
              },
            ),
            
            const SizedBox(height: 20),
            
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      ref.read(rewardsFilterProvider.notifier).reset();
                    },
                    child: const Text('Réinitialiser'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Appliquer'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RewardDetailsBottomSheet extends StatelessWidget {
  final LoyaltyReward reward;
  final int availablePoints;
  final VoidCallback onRedeem;

  const _RewardDetailsBottomSheet({
    required this.reward,
    required this.availablePoints,
    required this.onRedeem,
  });

  @override
  Widget build(BuildContext context) {
    final canAfford = availablePoints >= reward.pointsCost;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: _getRewardTypeColor().withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Icon(
                      _getRewardTypeIcon(),
                      size: 32,
                      color: _getRewardTypeColor(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reward.name,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: _getRewardTypeColor().withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          reward.type.displayName,
                          style: TextStyle(
                            color: _getRewardTypeColor(),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              reward.description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Coût en Points',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        '${reward.pointsCost} points',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Vos Points',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        '$availablePoints points',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: canAfford ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: canAfford && reward.canRedeem ? onRedeem : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  canAfford 
                      ? 'Échanger ${reward.pointsCost} points'
                      : 'Points insuffisants',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
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