import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RealTimeMetricsCard extends ConsumerWidget {
  const RealTimeMetricsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.timeline,
                  color: colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Métriques en temps réel',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'LIVE',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
              children: const [
                _MetricItem(
                  title: 'Livreurs en ligne',
                  value: '89',
                  subtitle: 'Actifs',
                  icon: Icons.directions_car,
                  color: Colors.green,
                  isLive: true,
                ),
                _MetricItem(
                  title: 'Commandes/min',
                  value: '3.2',
                  subtitle: 'Moyenne',
                  icon: Icons.speed,
                  color: Colors.blue,
                  isLive: true,
                ),
                _MetricItem(
                  title: 'Temps moy. livraison',
                  value: '28min',
                  subtitle: 'Actuel',
                  icon: Icons.access_time,
                  color: Colors.orange,
                  isLive: true,
                ),
                _MetricItem(
                  title: 'Satisfaction',
                  value: '4.7★',
                  subtitle: 'Score',
                  icon: Icons.star,
                  color: Colors.amber,
                  isLive: false,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: _QuickMetric(
                      label: 'Commandes aujourd\'hui',
                      value: '1,234',
                      changePercent: '+8.3%',
                      isPositive: true,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: colorScheme.outline.withValues(alpha: 0.3),
                  ),
                  const Expanded(
                    child: _QuickMetric(
                      label: 'Revenus aujourd\'hui',
                      value: '45,670 FCFA',
                      changePercent: '+12.1%',
                      isPositive: true,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: colorScheme.outline.withValues(alpha: 0.3),
                  ),
                  const Expanded(
                    child: _QuickMetric(
                      label: 'Taux d\'annulation',
                      value: '2.3%',
                      changePercent: '-0.5%',
                      isPositive: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricItem extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;
  final bool isLive;

  const _MetricItem({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.isLive,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Icon(
                icon,
                color: color,
                size: 24,
              ),
              if (isLive)
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          FittedBox(
            child: Text(
              value,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ),
          FittedBox(
            child: Text(
              title,
              style: theme.textTheme.bodySmall?.copyWith(
                color: color,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          FittedBox(
            child: Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: color.withValues(alpha: 0.7),
                fontSize: 9,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickMetric extends StatelessWidget {
  final String label;
  final String value;
  final String changePercent;
  final bool isPositive;

  const _QuickMetric({
    required this.label,
    required this.value,
    required this.changePercent,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isPositive ? Icons.trending_up : Icons.trending_down,
              color: isPositive ? Colors.green : Colors.red,
              size: 12,
            ),
            const SizedBox(width: 2),
            Text(
              changePercent,
              style: theme.textTheme.bodySmall?.copyWith(
                color: isPositive ? Colors.green : Colors.red,
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
