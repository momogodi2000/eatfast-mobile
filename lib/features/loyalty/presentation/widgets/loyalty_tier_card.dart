import 'package:flutter/material.dart';
import '../../domain/models/loyalty.dart';

class LoyaltyTierCard extends StatelessWidget {
  final LoyaltyTier currentTier;
  final int pointsToNextTier;
  final double tierProgress;
  final VoidCallback? onTierInfoPressed;

  const LoyaltyTierCard({
    super.key,
    required this.currentTier,
    required this.pointsToNextTier,
    required this.tierProgress,
    this.onTierInfoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: _getTierGradient(),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: _getTierColor().withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Niveau ${currentTier.displayName}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    currentTier.description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: onTierInfoPressed,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _getTierIcon(),
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // Progress to next tier
          if (currentTier.nextTier != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Vers ${currentTier.nextTier!.displayName}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                Text(
                  '$pointsToNextTier points restants',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 6,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(3),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: tierProgress,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ] else
            Text(
              'Niveau Maximum Atteint! 🎉',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }

  LinearGradient _getTierGradient() {
    switch (currentTier) {
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
    switch (currentTier) {
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
    switch (currentTier) {
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