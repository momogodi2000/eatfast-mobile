import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/models/delivery_order.dart';

class ActiveDeliveryCard extends ConsumerWidget {
  final DeliveryOrder order;
  final VoidCallback? onNavigate;
  final VoidCallback? onCallCustomer;
  final VoidCallback? onCallRestaurant;
  final VoidCallback? onMarkPickedUp;
  final VoidCallback? onMarkDelivered;
  final VoidCallback? onReportIssue;

  const ActiveDeliveryCard({
    super.key,
    required this.order,
    this.onNavigate,
    this.onCallCustomer,
    this.onCallRestaurant,
    this.onMarkPickedUp,
    this.onMarkDelivered,
    this.onReportIssue,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 3,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _getStatusColor(order.status).withValues(alpha: 0.1),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor(order.status),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        order.status.displayName,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Commande #${order.orderId.substring(0, 8)}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(
                      Icons.restaurant,
                      color: colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        order.restaurantName,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (onCallRestaurant != null)
                      IconButton(
                        onPressed: onCallRestaurant,
                        icon: const Icon(Icons.phone),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.green.withValues(alpha: 0.1),
                          foregroundColor: Colors.green,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        order.restaurantAddress,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(height: 1),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.customerName,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            order.customerPhone,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurface.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (onCallCustomer != null)
                      IconButton(
                        onPressed: onCallCustomer,
                        icon: const Icon(Icons.phone),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.blue.withValues(alpha: 0.1),
                          foregroundColor: Colors.blue,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        order.deliveryAddress,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _InfoCard(
                        icon: Icons.monetization_on,
                        label: 'Gain',
                        value: '${order.deliveryFee.toStringAsFixed(0)} FCFA',
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 12),
                    if (order.distanceKm != null)
                      Expanded(
                        child: _InfoCard(
                          icon: Icons.route,
                          label: 'Distance',
                          value: '${order.distanceKm!.toStringAsFixed(1)} km',
                          color: Colors.blue,
                        ),
                      ),
                    if (order.estimatedDuration != null)
                      const SizedBox(width: 12),
                    if (order.estimatedDuration != null)
                      Expanded(
                        child: _InfoCard(
                          icon: Icons.access_time,
                          label: 'Temps est.',
                          value: '${order.estimatedDuration} min',
                          color: Colors.orange,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                if (onNavigate != null)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: onNavigate,
                      icon: const Icon(Icons.navigation),
                      label: Text(_getNavigationLabel(order.status)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    if (_canMarkPickedUp(order.status) && onMarkPickedUp != null)
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: onMarkPickedUp,
                          icon: const Icon(Icons.check_circle, size: 18),
                          label: const Text('Récupéré'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    if (_canMarkDelivered(order.status) && onMarkDelivered != null)
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: onMarkDelivered,
                          icon: const Icon(Icons.delivery_dining, size: 18),
                          label: const Text('Livré'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    if ((_canMarkPickedUp(order.status) || _canMarkDelivered(order.status)) &&
                        onReportIssue != null)
                      const SizedBox(width: 12),
                    if (onReportIssue != null)
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: onReportIssue,
                          icon: const Icon(Icons.report_problem, size: 18),
                          label: const Text('Problème'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: BorderSide(color: Colors.red.withValues(alpha: 0.3)),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(DeliveryStatus status) {
    switch (status) {
      case DeliveryStatus.assigned:
        return Colors.orange;
      case DeliveryStatus.accepted:
        return Colors.blue;
      case DeliveryStatus.pickingUp:
        return Colors.purple;
      case DeliveryStatus.pickedUp:
        return Colors.teal;
      case DeliveryStatus.delivering:
        return Colors.green;
      case DeliveryStatus.delivered:
        return Colors.green.shade700;
      case DeliveryStatus.cancelled:
        return Colors.red;
      case DeliveryStatus.failed:
        return Colors.red.shade700;
    }
  }

  String _getNavigationLabel(DeliveryStatus status) {
    switch (status) {
      case DeliveryStatus.assigned:
      case DeliveryStatus.accepted:
      case DeliveryStatus.pickingUp:
        return 'Aller au restaurant';
      case DeliveryStatus.pickedUp:
      case DeliveryStatus.delivering:
        return 'Aller chez le client';
      default:
        return 'Navigation';
    }
  }

  bool _canMarkPickedUp(DeliveryStatus status) {
    return status == DeliveryStatus.pickingUp;
  }

  bool _canMarkDelivered(DeliveryStatus status) {
    return status == DeliveryStatus.delivering;
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
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
        children: [
          Icon(
            icon,
            color: color,
            size: 20,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: color.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}
