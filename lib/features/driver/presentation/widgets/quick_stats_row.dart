import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/driver_profile.dart';

class QuickStatsRow extends ConsumerWidget {
  final DriverProfile driver;
  final VoidCallback? onViewPerformance;

  const QuickStatsRow({
    super.key,
    required this.driver,
    this.onViewPerformance,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.analytics,
                  color: colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Statistiques rapides',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                if (onViewPerformance != null)
                  TextButton(
                    onPressed: onViewPerformance,
                    child: const Text('Voir plus'),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _StatItem(
                    icon: Icons.star,
                    label: 'Note',
                    value: driver.rating.toStringAsFixed(1),
                    color: Colors.orange,
                    suffix: '★',
                  ),
                ),
                Expanded(
                  child: _StatItem(
                    icon: Icons.delivery_dining,
                    label: 'Livraisons',
                    value: _formatNumber(driver.totalDeliveries),
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  child: _StatItem(
                    icon: Icons.monetization_on,
                    label: 'Gains totaux',
                    value: _formatCurrency(driver.totalEarnings),
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  child: _StatItem(
                    icon: _getOnlineIcon(),
                    label: 'Statut',
                    value: driver.isOnline ? 'En ligne' : 'Hors ligne',
                    color: driver.isOnline ? Colors.green : Colors.grey,
                    isSmallText: true,
                  ),
                ),
              ],
            ),
            if (driver.weeklyStats.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Divider(height: 1),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.trending_up,
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Performance cette semaine',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _WeeklyStatItem(
                      label: 'Livraisons',
                      value: _getWeeklyDeliveries().toString(),
                      icon: Icons.local_shipping,
                      color: Colors.purple,
                    ),
                  ),
                  Expanded(
                    child: _WeeklyStatItem(
                      label: 'Gains',
                      value: _formatCurrency(_getWeeklyEarnings()),
                      icon: Icons.account_balance_wallet,
                      color: Colors.teal,
                    ),
                  ),
                  Expanded(
                    child: _WeeklyStatItem(
                      label: 'Heures',
                      value: '${_getWeeklyHours()}h',
                      icon: Icons.access_time,
                      color: Colors.indigo,
                    ),
                  ),
                  Expanded(
                    child: _WeeklyStatItem(
                      label: 'Note moy.',
                      value: _getWeeklyRating().toStringAsFixed(1),
                      icon: Icons.star_rate,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getOnlineIcon() {
    if (driver.isOnline) {
      return driver.isAvailable ? Icons.check_circle : Icons.pause_circle;
    }
    return Icons.offline_bolt;
  }

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }

  String _formatCurrency(double amount) {
    if (amount >= 1000000) {
      return '${(amount / 1000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000) {
      return '${(amount / 1000).toStringAsFixed(1)}K';
    }
    return amount.toStringAsFixed(0);
  }

  int _getWeeklyDeliveries() {
    if (driver.weeklyStats.isEmpty) return 0;
    return driver.weeklyStats
        .map((stat) => stat.deliveries)
        .reduce((a, b) => a + b);
  }

  double _getWeeklyEarnings() {
    if (driver.weeklyStats.isEmpty) return 0.0;
    return driver.weeklyStats
        .map((stat) => stat.earnings)
        .reduce((a, b) => a + b);
  }

  int _getWeeklyHours() {
    if (driver.weeklyStats.isEmpty) return 0;
    return driver.weeklyStats
        .map((stat) => stat.onlineHours)
        .reduce((a, b) => a + b);
  }

  double _getWeeklyRating() {
    if (driver.weeklyStats.isEmpty) return 0.0;
    final totalRating = driver.weeklyStats
        .map((stat) => stat.rating)
        .reduce((a, b) => a + b);
    return totalRating / driver.weeklyStats.length;
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final String? suffix;
  final bool isSmallText;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    this.suffix,
    this.isSmallText = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
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
        const SizedBox(height: 6),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: color,
              fontSize: isSmallText ? 11 : null,
            ),
            children: [
              TextSpan(text: value),
              if (suffix != null)
                TextSpan(
                  text: suffix,
                  style: TextStyle(
                    color: color.withValues(alpha: 0.7),
                    fontSize: isSmallText ? 10 : 12,
                  ),
                ),
            ],
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _WeeklyStatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _WeeklyStatItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 16,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: color,
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: color.withValues(alpha: 0.8),
              fontSize: 9,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}