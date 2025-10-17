import 'package:flutter/material.dart';
import 'package:eatfast_mobile/shared/services/subscription/domain/models/subscription.dart';

class SubscriptionUsageWidget extends StatelessWidget {
  final UserSubscription subscription;

  const SubscriptionUsageWidget({super.key, required this.subscription});

  @override
  Widget build(BuildContext context) {
    final usagePercentage = subscription.ordersLimit > 0
        ? (subscription.ordersUsed / subscription.ordersLimit).clamp(0.0, 1.0)
        : 0.0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Utilisation du plan',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildUsageItem(
              title: 'Commandes utilisées',
              used: subscription.ordersUsed,
              total: subscription.ordersLimit,
              percentage: usagePercentage,
            ),
            const SizedBox(height: 16),
            _buildNextBillingInfo(context),
            const SizedBox(height: 16),
            _buildStatusChip(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUsageItem({
    required String title,
    required int used,
    required int total,
    required double percentage,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(
              '$used / $total',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: percentage,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(
            percentage > 0.8 ? Colors.red : Colors.green,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${(percentage * 100).toStringAsFixed(1)}% utilisé',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildNextBillingInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_today, color: Theme.of(context).primaryColor),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Prochaine facturation',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  _formatDate(subscription.nextBillingDate),
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context) {
    final (statusColor, statusText) = switch (subscription.status) {
      SubscriptionStatus.active => (Colors.green, 'Actif'),
      SubscriptionStatus.cancelled => (Colors.red, 'Annulé'),
      SubscriptionStatus.expired => (Colors.grey, 'Expiré'),
      SubscriptionStatus.paused => (Colors.orange, 'En pause'),
      SubscriptionStatus.trial => (Colors.blue, 'Période d\'essai'),
      SubscriptionStatus.inactive => (Colors.grey, 'Inactif'),
      SubscriptionStatus.suspended => (Colors.red, 'Suspendu'),
    };

    return Chip(
      label: Text(statusText),
      backgroundColor: statusColor.withValues(alpha: 0.1),
      labelStyle: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
