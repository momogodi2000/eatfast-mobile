import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecentActivitiesCard extends ConsumerWidget {
  const RecentActivitiesCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    // TODO: Replace with actual API call to admin activities endpoint
    final activities = [
      _Activity(
        type: ActivityType.newUser,
        title: 'Nouvel utilisateur',
        description: 'Jean Dupont s\'est inscrit',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        severity: ActivitySeverity.info,
      ),
      _Activity(
        type: ActivityType.orderIssue,
        title: 'Problème de commande',
        description: 'Commande #1234 annulée par le client',
        timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
        severity: ActivitySeverity.warning,
      ),
      _Activity(
        type: ActivityType.restaurantVerification,
        title: 'Restaurant vérifié',
        description: 'Le Bon Goût - Documents approuvés',
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        severity: ActivitySeverity.success,
      ),
      _Activity(
        type: ActivityType.systemAlert,
        title: 'Alerte système',
        description: 'Charge serveur élevée détectée',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        severity: ActivitySeverity.error,
      ),
      _Activity(
        type: ActivityType.driverOnline,
        title: 'Livreur en ligne',
        description: 'Marie Martin s\'est connectée',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        severity: ActivitySeverity.info,
      ),
      _Activity(
        type: ActivityType.paymentProcessed,
        title: 'Paiement traité',
        description: 'Virement de 15,000 FCFA vers Chez Paul',
        timestamp: DateTime.now().subtract(const Duration(hours: 3)),
        severity: ActivitySeverity.success,
      ),
    ];

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
                  Icons.history,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Activités récentes',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // Navigate to full activity log
                  },
                  child: const Text('Voir tout'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: activities.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final activity = activities[index];
                return _ActivityItem(activity: activity);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final _Activity activity;

  const _ActivityItem({required this.activity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _getSeverityColor(activity.severity).withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: _getSeverityColor(activity.severity).withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _getSeverityColor(activity.severity).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              _getActivityIcon(activity.type),
              color: _getSeverityColor(activity.severity),
              size: 16,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  activity.description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _formatTimestamp(activity.timestamp),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
            size: 16,
          ),
        ],
      ),
    );
  }

  Color _getSeverityColor(ActivitySeverity severity) {
    switch (severity) {
      case ActivitySeverity.info:
        return Colors.blue;
      case ActivitySeverity.success:
        return Colors.green;
      case ActivitySeverity.warning:
        return Colors.orange;
      case ActivitySeverity.error:
        return Colors.red;
    }
  }

  IconData _getActivityIcon(ActivityType type) {
    switch (type) {
      case ActivityType.newUser:
        return Icons.person_add;
      case ActivityType.orderIssue:
        return Icons.warning;
      case ActivityType.restaurantVerification:
        return Icons.verified;
      case ActivityType.systemAlert:
        return Icons.error;
      case ActivityType.driverOnline:
        return Icons.directions_car;
      case ActivityType.paymentProcessed:
        return Icons.payment;
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'À l\'instant';
    } else if (difference.inMinutes < 60) {
      return 'Il y a ${difference.inMinutes} min';
    } else if (difference.inHours < 24) {
      return 'Il y a ${difference.inHours}h';
    } else {
      return 'Il y a ${difference.inDays}j';
    }
  }
}

class _Activity {
  final ActivityType type;
  final String title;
  final String description;
  final DateTime timestamp;
  final ActivitySeverity severity;

  _Activity({
    required this.type,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.severity,
  });
}

enum ActivityType {
  newUser,
  orderIssue,
  restaurantVerification,
  systemAlert,
  driverOnline,
  paymentProcessed,
}

enum ActivitySeverity {
  info,
  success,
  warning,
  error,
}
