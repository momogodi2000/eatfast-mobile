import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlatformStatsCards extends ConsumerWidget {
  const PlatformStatsCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Statistiques de la plateforme',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.5,
          children: const [
            _StatCard(
              title: 'Revenus totaux',
              value: '2,450,000 FCFA',
              subtitle: '+12% ce mois',
              icon: Icons.monetization_on,
              color: Colors.green,
              trend: TrendType.up,
            ),
            _StatCard(
              title: 'Commandes actives',
              value: '156',
              subtitle: 'En cours de livraison',
              icon: Icons.delivery_dining,
              color: Colors.blue,
              trend: TrendType.stable,
            ),
            _StatCard(
              title: 'Utilisateurs actifs',
              value: '12,450',
              subtitle: '+245 aujourd\'hui',
              icon: Icons.people,
              color: Colors.purple,
              trend: TrendType.up,
            ),
            _StatCard(
              title: 'Restaurants en ligne',
              value: '287',
              subtitle: '94% de disponibilité',
              icon: Icons.restaurant,
              color: Colors.orange,
              trend: TrendType.up,
            ),
          ],
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;
  final TrendType trend;

  const _StatCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.trend,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 20,
                  ),
                ),
                const Spacer(),
                Icon(
                  _getTrendIcon(),
                  color: _getTrendColor(),
                  size: 16,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
            Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: _getTrendColor(),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getTrendIcon() {
    switch (trend) {
      case TrendType.up:
        return Icons.trending_up;
      case TrendType.down:
        return Icons.trending_down;
      case TrendType.stable:
        return Icons.trending_flat;
    }
  }

  Color _getTrendColor() {
    switch (trend) {
      case TrendType.up:
        return Colors.green;
      case TrendType.down:
        return Colors.red;
      case TrendType.stable:
        return Colors.grey;
    }
  }
}

enum TrendType { up, down, stable }
