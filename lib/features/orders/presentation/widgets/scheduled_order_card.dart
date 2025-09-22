import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/models/scheduled_order.dart';

class ScheduledOrderCard extends StatelessWidget {
  final ScheduledOrder order;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onCancel;
  final VoidCallback? onToggle;
  final bool showActions;

  const ScheduledOrderCard({
    super.key,
    required this.order,
    this.onTap,
    this.onEdit,
    this.onCancel,
    this.onToggle,
    this.showActions = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 12),
              _buildOrderDetails(context),
              if (showActions) ...[
                const SizedBox(height: 16),
                _buildActions(context),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: order.status.color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            order.status.icon,
            color: order.status.color,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.restaurant.name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                order.status.displayName,
                style: TextStyle(
                  color: order.status.color,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        if (order.isRecurring)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.repeat,
                  size: 12,
                  color: Colors.blue.shade700,
                ),
                const SizedBox(width: 4),
                Text(
                  'Récurrent',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue.shade700,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildOrderDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.schedule,
              size: 16,
              color: Colors.grey.shade600,
            ),
            const SizedBox(width: 8),
            Text(
              'Programmé pour le ${_formatDateTime(order.scheduledDate)}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(
              Icons.location_on,
              size: 16,
              color: Colors.grey.shade600,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                order.deliveryAddress,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(
              Icons.shopping_cart,
              size: 16,
              color: Colors.grey.shade600,
            ),
            const SizedBox(width: 8),
            Text(
              '${order.items.length} article${order.items.length > 1 ? 's' : ''}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade700,
              ),
            ),
            const Spacer(),
            Text(
              '${order.total.toStringAsFixed(0)} ${order.currency}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        if (order.isRecurring && order.recurrencePattern != null) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.repeat,
                size: 16,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 8),
              Text(
                _getRecurrenceDescription(order.recurrencePattern!),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    final actions = <Widget>[];

    if (order.status == ScheduledOrderStatus.scheduled) {
      if (onEdit != null) {
        actions.add(
          OutlinedButton.icon(
            onPressed: onEdit,
            icon: const Icon(Icons.edit, size: 16),
            label: const Text('Modifier'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        );
      }

      if (onCancel != null) {
        actions.add(
          OutlinedButton.icon(
            onPressed: onCancel,
            icon: const Icon(Icons.cancel, size: 16),
            label: const Text('Annuler'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        );
      }
    }

    if (order.isRecurring && onToggle != null) {
      actions.add(
        ElevatedButton.icon(
          onPressed: onToggle,
          icon: Icon(
            order.status == ScheduledOrderStatus.paused ? Icons.play_arrow : Icons.pause,
            size: 16,
          ),
          label: Text(
            order.status == ScheduledOrderStatus.paused ? 'Reprendre' : 'Suspendre',
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
      );
    }

    if (actions.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: actions,
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('d MMM yyyy à HH:mm', 'fr_FR').format(dateTime);
  }

  String _getRecurrenceDescription(RecurrencePattern pattern) {
    switch (pattern.type) {
      case RecurrenceType.daily:
        return pattern.interval == 1
            ? 'Tous les jours'
            : 'Tous les ${pattern.interval} jours';
      case RecurrenceType.weekly:
        if (pattern.daysOfWeek != null && pattern.daysOfWeek!.isNotEmpty) {
          final daysNames = pattern.daysOfWeek!.map((day) => _getDayName(day)).join(', ');
          return pattern.interval == 1
              ? 'Chaque $daysNames'
              : 'Toutes les ${pattern.interval} semaines le $daysNames';
        }
        return pattern.interval == 1
            ? 'Chaque semaine'
            : 'Toutes les ${pattern.interval} semaines';
      case RecurrenceType.monthly:
        if (pattern.dayOfMonth != null) {
          return pattern.interval == 1
              ? 'Le ${pattern.dayOfMonth} de chaque mois'
              : 'Le ${pattern.dayOfMonth} tous les ${pattern.interval} mois';
        }
        return pattern.interval == 1
            ? 'Chaque mois'
            : 'Tous les ${pattern.interval} mois';
      case RecurrenceType.custom:
        return 'Récurrence personnalisée';
    }
  }

  String _getDayName(int day) {
    const dayNames = [
      'Lundi',
      'Mardi',
      'Mercredi',
      'Jeudi',
      'Vendredi',
      'Samedi',
      'Dimanche'
    ];
    return dayNames[day - 1];
  }
}