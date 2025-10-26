import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/models/driver_earnings.dart';

class EarningsSummaryCard extends ConsumerWidget {
  final DriverEarnings earnings;
  final VoidCallback? onViewDetails;

  const EarningsSummaryCard({
    super.key,
    required this.earnings,
    this.onViewDetails,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.account_balance_wallet,
                  color: colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Résumé des gains',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (onViewDetails != null)
                  TextButton(
                    onPressed: onViewDetails,
                    child: const Text('Détails'),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _EarningsStat(
                    title: 'Aujourd\'hui',
                    amount: earnings.todayEarnings,
                    deliveries: earnings.todayDeliveries,
                    color: Colors.green,
                    icon: Icons.today,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _EarningsStat(
                    title: 'Cette semaine',
                    amount: earnings.weekEarnings,
                    deliveries: earnings.weekDeliveries,
                    color: Colors.blue,
                    icon: Icons.date_range,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _EarningsStat(
                    title: 'Ce mois',
                    amount: earnings.monthEarnings,
                    deliveries: earnings.monthDeliveries,
                    color: Colors.purple,
                    icon: Icons.calendar_month,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _EarningsStat(
                    title: 'Total',
                    amount: earnings.totalEarnings,
                    deliveries: earnings.totalDeliveries,
                    color: Colors.orange,
                    icon: Icons.star,
                  ),
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
                  Expanded(
                    child: _MetricItem(
                      label: 'Note moyenne',
                      value: '${earnings.averageRating.toStringAsFixed(1)} ⭐',
                      icon: Icons.star_rate,
                    ),
                  ),
                  Expanded(
                    child: _MetricItem(
                      label: 'Taux de completion',
                      value: '${earnings.completionRate.toStringAsFixed(1)}%',
                      icon: Icons.check_circle,
                    ),
                  ),
                  Expanded(
                    child: _MetricItem(
                      label: 'Taux horaire',
                      value: '${earnings.hourlyRate.toStringAsFixed(0)} FCFA/h',
                      icon: Icons.access_time,
                    ),
                  ),
                ],
              ),
            ),
            if (earnings.recentTransactions.isNotEmpty) ...[
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(
                    Icons.history,
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Dernières transactions',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Column(
                children: earnings.recentTransactions
                    .take(3)
                    .map((transaction) => _TransactionItem(
                          transaction: transaction,
                        ))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _EarningsStat extends StatelessWidget {
  final String title;
  final double amount;
  final int deliveries;
  final Color color;
  final IconData icon;

  const _EarningsStat({
    required this.title,
    required this.amount,
    required this.deliveries,
    required this.color,
    required this.icon,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: color,
                size: 16,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '${amount.toStringAsFixed(0)} FCFA',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          Text(
            '$deliveries livraisons',
            style: theme.textTheme.bodySmall?.copyWith(
              color: color.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _MetricItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Icon(
          icon,
          size: 20,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final EarningTransaction transaction;

  const _TransactionItem({
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPositive = transaction.type.isPositive;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: isPositive
                  ? Colors.green.withValues(alpha: 0.1)
                  : Colors.red.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              _getTransactionIcon(transaction.type),
              size: 14,
              color: isPositive ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.type.displayName,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (transaction.restaurantName != null)
                  Text(
                    transaction.restaurantName!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
              ],
            ),
          ),
          Text(
            '${isPositive ? '+' : '-'}${transaction.amount.toStringAsFixed(0)} FCFA',
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: isPositive ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getTransactionIcon(EarningType type) {
    switch (type) {
      case EarningType.delivery:
        return Icons.delivery_dining;
      case EarningType.tip:
        return Icons.attach_money;
      case EarningType.bonus:
        return Icons.card_giftcard;
      case EarningType.incentive:
        return Icons.trending_up;
      case EarningType.penalty:
        return Icons.trending_down;
      case EarningType.adjustment:
        return Icons.tune;
    }
  }
}
