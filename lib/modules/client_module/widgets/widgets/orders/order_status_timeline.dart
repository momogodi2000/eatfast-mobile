import 'package:flutter/material.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';
import 'package:eatfast_mobile/shared/models/exports.dart' as shared_models;

class OrderStatusTimeline extends StatelessWidget {
  final shared_models.OrderStatus currentStatus;
  final List<shared_models.OrderStatusUpdate> statusUpdates;
  final DateTime? estimatedDeliveryTime;

  const OrderStatusTimeline({
    super.key,
    required this.currentStatus,
    required this.statusUpdates,
    this.estimatedDeliveryTime,
  });

  @override
  Widget build(BuildContext context) {
    final activeStatuses = [
      shared_models.OrderStatus.created,
      shared_models.OrderStatus.confirmed,
      shared_models.OrderStatus.preparing,
      shared_models.OrderStatus.readyForPickup,
      shared_models.OrderStatus.assignedDriver,
      shared_models.OrderStatus.pickedUp,
      shared_models.OrderStatus.inTransit,
      shared_models.OrderStatus.delivered,
    ];

    // Don't show timeline for cancelled orders
  if (currentStatus == shared_models.OrderStatus.cancelled || currentStatus == shared_models.OrderStatus.refunded) {
      return _buildCancelledStatus(context);
    }

    return Container(
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      decoration: BoxDecoration(
        color: DesignTokens.white,
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Statut de la commande',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: DesignTokens.fontWeightBold,
            ),
          ),
          
          const SizedBox(height: DesignTokens.spaceLG),
          
          // Timeline
          Column(
            children: activeStatuses.asMap().entries.map((entry) {
              final index = entry.key;
              final status = entry.value;
              final isActive = _getStatusIndex(currentStatus) >= index;
              final isCurrent = status == currentStatus;
              final statusUpdate = _getStatusUpdate(status);
              
              return _buildTimelineItem(
                context,
                status: status,
                isActive: isActive,
                isCurrent: isCurrent,
                isLast: index == activeStatuses.length - 1,
                statusUpdate: statusUpdate,
              );
            }).toList(),
          ),
          
          // Estimated delivery time
            if (estimatedDeliveryTime != null && currentStatus != shared_models.OrderStatus.delivered) ...[
            const SizedBox(height: DesignTokens.spaceLG),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(DesignTokens.spaceMD),
              decoration: BoxDecoration(
                color: DesignTokens.infoColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.schedule,
                    color: DesignTokens.infoColor,
                    size: 20,
                  ),
                  const SizedBox(width: DesignTokens.spaceXS),
                  Expanded(
                    child: Text(
                      'Livraison pr�vue: ${_formatDeliveryTime(estimatedDeliveryTime!)}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: DesignTokens.infoColor,
                        fontWeight: DesignTokens.fontWeightMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context, {
    required OrderStatus status,
    required bool isActive,
    required bool isCurrent,
    required bool isLast,
    OrderStatusUpdate? statusUpdate,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline indicator
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isActive ? _getStatusColor(status) : DesignTokens.lightGrey,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isCurrent 
                      ? _getStatusColor(status) 
                      : isActive 
                          ? _getStatusColor(status) 
                          : DesignTokens.lightGrey,
                  width: isCurrent ? 3 : 1,
                ),
              ),
              child: Center(
                child: Icon(
                  isActive ? _getStatusIcon(status) : Icons.radio_button_unchecked,
                  color: isActive ? DesignTokens.white : DesignTokens.textTertiary,
                  size: 12,
                ),
              ),
            ),
            
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: isActive ? _getStatusColor(status) : DesignTokens.lightGrey,
              ),
          ],
        ),
        
        const SizedBox(width: DesignTokens.spaceMD),
        
        // Timeline content
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: isLast ? 0 : DesignTokens.spaceLG,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status.displayName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: isCurrent 
                        ? DesignTokens.fontWeightBold 
                        : DesignTokens.fontWeightMedium,
                    color: isActive ? DesignTokens.textPrimary : DesignTokens.textTertiary,
                  ),
                ),
                
                if (statusUpdate != null) ...[
                  const SizedBox(height: DesignTokens.spaceXS),
                  Text(
                    statusUpdate.message ?? status.displayName,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isActive ? DesignTokens.textSecondary : DesignTokens.textTertiary,
                    ),
                  ),
                  
                  const SizedBox(height: DesignTokens.spaceXS),
                  Text(
                    _formatTime(statusUpdate.timestamp),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: DesignTokens.textTertiary,
                    ),
                  ),
                ] else if (!isActive) ...[
                  const SizedBox(height: DesignTokens.spaceXS),
                  Text(
                    'En attente',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: DesignTokens.textTertiary,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCancelledStatus(BuildContext context) {
  final cancelUpdate = statusUpdates.where((update) => 
    update.status == shared_models.OrderStatus.cancelled).firstOrNull;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      decoration: BoxDecoration(
        color: DesignTokens.white,
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
        border: Border.all(
          color: DesignTokens.errorColor.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.cancel_outlined,
            size: 48,
            color: DesignTokens.errorColor,
          ),
          
          const SizedBox(height: DesignTokens.spaceMD),
          
          Text(
            'Commande annul�e',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: DesignTokens.errorColor,
              fontWeight: DesignTokens.fontWeightBold,
            ),
          ),
          
          if (cancelUpdate != null) ...[
            const SizedBox(height: DesignTokens.spaceSM),
            Text(
              cancelUpdate.message ?? 'Votre commande a �t� annul�e',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: DesignTokens.textSecondary,
              ),
            ),
            
            const SizedBox(height: DesignTokens.spaceXS),
            Text(
              'Le ${_formatTime(cancelUpdate.timestamp)}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: DesignTokens.textTertiary,
              ),
            ),
          ],
        ],
      ),
    );
  }

  shared_models.OrderStatusUpdate? _getStatusUpdate(shared_models.OrderStatus status) {
    return statusUpdates.where((update) => update.status == status).firstOrNull;
  }

  int _getStatusIndex(shared_models.OrderStatus status) {
    switch (status) {
      case shared_models.OrderStatus.created:
        return 0;
      case shared_models.OrderStatus.confirmed:
        return 1;
      case shared_models.OrderStatus.accepted:
        return 2;
      case shared_models.OrderStatus.preparing:
        return 3;
      case shared_models.OrderStatus.readyForPickup:
        return 4;
      case shared_models.OrderStatus.assignedDriver:
        return 5;
      case shared_models.OrderStatus.pickedUp:
        return 6;
      case shared_models.OrderStatus.inTransit:
        return 7;
      case shared_models.OrderStatus.delivered:
        return 8;
      case shared_models.OrderStatus.completed:
        return 9;
      default:
        return -1;
    }
  }

  Color _getStatusColor(shared_models.OrderStatus status) {
    switch (status) {
      case shared_models.OrderStatus.created:
      case shared_models.OrderStatus.pending:
        return DesignTokens.warningColor;
      case shared_models.OrderStatus.confirmed:
      case shared_models.OrderStatus.accepted:
      case shared_models.OrderStatus.preparing:
      case shared_models.OrderStatus.ready:
        return DesignTokens.infoColor;
      case shared_models.OrderStatus.readyForPickup:
      case shared_models.OrderStatus.assignedDriver:
      case shared_models.OrderStatus.pickedUp:
      case shared_models.OrderStatus.onTheWay:
      case shared_models.OrderStatus.inTransit:
        return DesignTokens.primaryColor;
      case shared_models.OrderStatus.delivered:
      case shared_models.OrderStatus.completed:
        return DesignTokens.successColor;
      case shared_models.OrderStatus.cancelled:
      case shared_models.OrderStatus.rejected:
      case shared_models.OrderStatus.refunded:
      case shared_models.OrderStatus.expired:
        return DesignTokens.errorColor;
      default:
        return DesignTokens.textTertiary;
    }
  }

  IconData _getStatusIcon(shared_models.OrderStatus status) {
    switch (status) {
      case shared_models.OrderStatus.created:
      case shared_models.OrderStatus.pending:
        return Icons.schedule;
      case shared_models.OrderStatus.confirmed:
      case shared_models.OrderStatus.accepted:
        return Icons.check;
      case shared_models.OrderStatus.preparing:
      case shared_models.OrderStatus.ready:
        return Icons.restaurant;
      case shared_models.OrderStatus.readyForPickup:
        return Icons.check_circle;
      case shared_models.OrderStatus.assignedDriver:
      case shared_models.OrderStatus.pickedUp:
        return Icons.local_shipping;
      case shared_models.OrderStatus.inTransit:
      case shared_models.OrderStatus.onTheWay:
        return Icons.delivery_dining;
      case shared_models.OrderStatus.delivered:
      case shared_models.OrderStatus.completed:
        return Icons.done_all;
      case shared_models.OrderStatus.cancelled:
      case shared_models.OrderStatus.rejected:
      case shared_models.OrderStatus.refunded:
      case shared_models.OrderStatus.expired:
        return Icons.cancel;
      default:
        return Icons.radio_button_unchecked;
    }
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour}h${dateTime.minute.toString().padLeft(2, '0')}';
  }

  String _formatDeliveryTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = dateTime.difference(now);
    
    if (difference.inMinutes <= 0) {
      return 'Maintenant';
    } else if (difference.inMinutes < 60) {
      return 'Dans ${difference.inMinutes} minutes';
    } else {
      return '� ${dateTime.hour}h${dateTime.minute.toString().padLeft(2, '0')}';
    }
  }
}
