import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/models/driver_profile.dart';

class DriverStatusCard extends ConsumerWidget {
  final DriverProfile driver;
  final VoidCallback? onToggleOnline;
  final VoidCallback? onToggleAvailable;

  const DriverStatusCard({
    super.key,
    required this.driver,
    this.onToggleOnline,
    this.onToggleAvailable,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: driver.isOnline
                      ? Colors.green.withValues(alpha: 0.2)
                      : Colors.grey.withValues(alpha: 0.2),
                  child: Icon(
                    driver.isOnline
                        ? Icons.directions_car
                        : Icons.car_crash,
                    color: driver.isOnline ? Colors.green : Colors.grey,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Statut du livreur',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        driver.status.displayName,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: _getStatusColor(driver.status),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: driver.isOnline
                        ? Colors.green.withValues(alpha: 0.1)
                        : Colors.grey.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    driver.isOnline ? 'En ligne' : 'Hors ligne',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: driver.isOnline ? Colors.green : Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _StatusToggle(
                    title: 'En ligne',
                    subtitle: 'Recevoir des commandes',
                    isEnabled: driver.isOnline,
                    onToggle: onToggleOnline,
                    icon: Icons.power_settings_new,
                    enabledColor: Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatusToggle(
                    title: 'Disponible',
                    subtitle: 'Accepter livraisons',
                    isEnabled: driver.isAvailable && driver.isOnline,
                    onToggle: driver.isOnline ? onToggleAvailable : null,
                    icon: Icons.check_circle,
                    enabledColor: Colors.blue,
                  ),
                ),
              ],
            ),
            if (driver.status != DriverStatus.active) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.orange.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: Colors.orange,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _getStatusMessage(driver.status),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.orange.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(DriverStatus status) {
    switch (status) {
      case DriverStatus.active:
        return Colors.green;
      case DriverStatus.inactive:
        return Colors.grey;
      case DriverStatus.suspended:
        return Colors.red;
      case DriverStatus.pendingVerification:
        return Colors.orange;
      case DriverStatus.documentsRequired:
        return Colors.amber;
    }
  }

  String _getStatusMessage(DriverStatus status) {
    switch (status) {
      case DriverStatus.active:
        return 'Votre compte est actif et vous pouvez recevoir des commandes.';
      case DriverStatus.inactive:
        return 'Votre compte est inactif. Contactez le support pour plus d\'informations.';
      case DriverStatus.suspended:
        return 'Votre compte est suspendu. Contactez le support client.';
      case DriverStatus.pendingVerification:
        return 'Votre compte est en cours de vérification. Cela peut prendre 24-48h.';
      case DriverStatus.documentsRequired:
        return 'Des documents sont requis pour activer votre compte.';
    }
  }
}

class _StatusToggle extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isEnabled;
  final VoidCallback? onToggle;
  final IconData icon;
  final Color enabledColor;

  const _StatusToggle({
    required this.title,
    required this.subtitle,
    required this.isEnabled,
    required this.onToggle,
    required this.icon,
    required this.enabledColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onToggle,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isEnabled
              ? enabledColor.withValues(alpha: 0.1)
              : Colors.grey.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isEnabled
                ? enabledColor.withValues(alpha: 0.3)
                : Colors.grey.withValues(alpha: 0.3),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isEnabled ? enabledColor : Colors.grey,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: isEnabled ? enabledColor : Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: isEnabled
                    ? enabledColor.withValues(alpha: 0.8)
                    : Colors.grey.withValues(alpha: 0.8),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
