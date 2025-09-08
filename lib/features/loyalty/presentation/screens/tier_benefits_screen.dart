import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/loyalty_provider.dart';
import '../../domain/models/loyalty.dart';

class TierBenefitsScreen extends ConsumerWidget {
  const TierBenefitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loyaltyState = ref.watch(loyaltyProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Niveaux et Avantages'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Current Tier Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withValues(alpha: 0.8),
                  ],
                ),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Votre Niveau Actuel',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    loyaltyState.currentTier.displayName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    loyaltyState.currentTier.description,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  if (loyaltyState.currentTier.nextTier != null) ...[
                    Text(
                      'Prochain niveau: ${loyaltyState.currentTier.nextTier!.displayName}',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.8),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${loyaltyState.pointsToNextTier} points restants',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ] else
                    Text(
                      'Niveau Maximum Atteint! 🎉',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Tier Benefits List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tous les Niveaux',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...LoyaltyTier.values.map((tier) => _TierCard(
                    tier: tier,
                    currentTier: loyaltyState.currentTier,
                    totalPoints: loyaltyState.totalPoints,
                  )),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // How to Earn Points Section
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue[50]!,
                    Colors.blue[100]!.withValues(alpha: 0.5),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blue[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.blue[700],
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Comment Gagner des Points',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildHowToEarnItem(
                    context,
                    Icons.shopping_cart,
                    'Commandes',
                    'Gagnez des points à chaque commande selon votre niveau',
                  ),
                  _buildHowToEarnItem(
                    context,
                    Icons.cake,
                    'Anniversaire',
                    'Points bonus spéciaux le jour de votre anniversaire',
                  ),
                  _buildHowToEarnItem(
                    context,
                    Icons.people,
                    'Parrainage',
                    'Invitez vos amis et gagnez des points de parrainage',
                  ),
                  _buildHowToEarnItem(
                    context,
                    Icons.star,
                    'Offres Spéciales',
                    'Participez aux promotions pour des points bonus',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildHowToEarnItem(BuildContext context, IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.blue[700],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.blue[600],
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TierCard extends StatelessWidget {
  final LoyaltyTier tier;
  final LoyaltyTier currentTier;
  final int totalPoints;

  const _TierCard({
    required this.tier,
    required this.currentTier,
    required this.totalPoints,
  });

  @override
  Widget build(BuildContext context) {
    final isCurrentTier = tier == currentTier;
    final isAchieved = totalPoints >= tier.pointsRequired;
    final isNextTier = tier == currentTier.nextTier;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isCurrentTier 
              ? Theme.of(context).primaryColor
              : Colors.grey[200]!,
          width: isCurrentTier ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: _getTierGradient(),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(
                    _getTierIcon(),
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            tier.displayName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (isCurrentTier)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'ACTUEL',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        tier.description,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        tier.pointsRequired == 0 
                            ? 'Point de départ'
                            : '${tier.pointsRequired} points requis',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isAchieved && !isCurrentTier)
                  Icon(
                    Icons.check_circle,
                    color: Colors.white.withValues(alpha: 0.8),
                    size: 20,
                  )
                else if (isNextTier)
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white.withValues(alpha: 0.8),
                    size: 20,
                  )
                else if (!isAchieved)
                  Icon(
                    Icons.lock,
                    color: Colors.white.withValues(alpha: 0.6),
                    size: 20,
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Avantages',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ...tier.benefits.map((benefit) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.only(top: 6),
                        decoration: BoxDecoration(
                          color: _getTierColor(),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          benefit,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isAchieved ? Colors.black87 : Colors.grey[600],
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  LinearGradient _getTierGradient() {
    switch (tier) {
      case LoyaltyTier.bronze:
        return const LinearGradient(
          colors: [Color(0xFFCD7F32), Color(0xFFB8692C)],
        );
      case LoyaltyTier.silver:
        return const LinearGradient(
          colors: [Color(0xFFC0C0C0), Color(0xFFA8A8A8)],
        );
      case LoyaltyTier.gold:
        return const LinearGradient(
          colors: [Color(0xFFFFD700), Color(0xFFDAA520)],
        );
      case LoyaltyTier.platinum:
        return const LinearGradient(
          colors: [Color(0xFFE5E4E2), Color(0xFFB8B8B0)],
        );
      case LoyaltyTier.diamond:
        return const LinearGradient(
          colors: [Color(0xFFB9F2FF), Color(0xFF00CED1)],
        );
    }
  }

  Color _getTierColor() {
    switch (tier) {
      case LoyaltyTier.bronze:
        return const Color(0xFFCD7F32);
      case LoyaltyTier.silver:
        return const Color(0xFFC0C0C0);
      case LoyaltyTier.gold:
        return const Color(0xFFFFD700);
      case LoyaltyTier.platinum:
        return const Color(0xFFE5E4E2);
      case LoyaltyTier.diamond:
        return const Color(0xFF00CED1);
    }
  }

  IconData _getTierIcon() {
    switch (tier) {
      case LoyaltyTier.bronze:
        return Icons.emoji_events;
      case LoyaltyTier.silver:
        return Icons.emoji_events;
      case LoyaltyTier.gold:
        return Icons.emoji_events;
      case LoyaltyTier.platinum:
        return Icons.military_tech;
      case LoyaltyTier.diamond:
        return Icons.diamond;
    }
  }
}