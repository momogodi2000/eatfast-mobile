import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SystemHealthCard extends ConsumerWidget {
  const SystemHealthCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                Icon(
                  Icons.health_and_safety,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'État du système',
                  style: theme.textTheme.titleMedium?.copyWith(
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
                        'OPÉRATIONNEL',
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
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
              children: [
                _HealthMetric(
                  title: 'Disponibilité',
                  value: '99.9%',
                  status: HealthStatus.excellent,
                  icon: Icons.cloud_done,
                ),
                _HealthMetric(
                  title: 'Temps de réponse',
                  value: '45ms',
                  status: HealthStatus.good,
                  icon: Icons.speed,
                ),
                _HealthMetric(
                  title: 'Charge CPU',
                  value: '23%',
                  status: HealthStatus.good,
                  icon: Icons.memory,
                ),
                _HealthMetric(
                  title: 'Utilisation RAM',
                  value: '67%',
                  status: HealthStatus.warning,
                  icon: Icons.storage,
                ),
                _HealthMetric(
                  title: 'Espace disque',
                  value: '34%',
                  status: HealthStatus.good,
                  icon: Icons.sd_storage,
                ),
                _HealthMetric(
                  title: 'Connexions DB',
                  value: '12/50',
                  status: HealthStatus.excellent,
                  icon: Icons.storage,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.timeline,
                        size: 16,
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Services système',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 16,
                    runSpacing: 8,
                    children: [
                      _ServiceStatus(
                        name: 'API Gateway',
                        status: ServiceStatus.online,
                      ),
                      _ServiceStatus(
                        name: 'Base de données',
                        status: ServiceStatus.online,
                      ),
                      _ServiceStatus(
                        name: 'Redis Cache',
                        status: ServiceStatus.online,
                      ),
                      _ServiceStatus(
                        name: 'File d\'attente',
                        status: ServiceStatus.online,
                      ),
                      _ServiceStatus(
                        name: 'Service de paiement',
                        status: ServiceStatus.maintenance,
                      ),
                      _ServiceStatus(
                        name: 'Notifications push',
                        status: ServiceStatus.online,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Refresh system health
                    },
                    icon: const Icon(Icons.refresh, size: 16),
                    label: const Text('Actualiser'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primaryContainer,
                      foregroundColor: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // View detailed system logs
                    },
                    icon: const Icon(Icons.article, size: 16),
                    label: const Text('Voir les logs'),
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

class _HealthMetric extends StatelessWidget {
  final String title;
  final String value;
  final HealthStatus status;
  final IconData icon;

  const _HealthMetric({
    required this.title,
    required this.value,
    required this.status,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = _getStatusColor(status);

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
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          Text(
            title,
            style: theme.textTheme.bodySmall?.copyWith(
              color: color,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(HealthStatus status) {
    switch (status) {
      case HealthStatus.excellent:
        return Colors.green;
      case HealthStatus.good:
        return Colors.blue;
      case HealthStatus.warning:
        return Colors.orange;
      case HealthStatus.critical:
        return Colors.red;
    }
  }
}

class _ServiceStatus extends StatelessWidget {
  final String name;
  final ServiceStatus status;

  const _ServiceStatus({
    required this.name,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: _getStatusColor(status),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          name,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(ServiceStatus status) {
    switch (status) {
      case ServiceStatus.online:
        return Colors.green;
      case ServiceStatus.offline:
        return Colors.red;
      case ServiceStatus.maintenance:
        return Colors.orange;
    }
  }
}

enum HealthStatus {
  excellent,
  good,
  warning,
  critical,
}

enum ServiceStatus {
  online,
  offline,
  maintenance,
}