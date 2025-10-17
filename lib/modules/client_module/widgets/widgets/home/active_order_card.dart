import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';
import 'package:eatfast_mobile/shared/services/orders/providers/order_provider.dart';
import 'package:eatfast_mobile/shared/services/orders/domain/models/order.dart';

class ActiveOrderCard extends ConsumerWidget {
  const ActiveOrderCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeOrderState = ref.watch(activeOrderProvider);

    return switch (activeOrderState) {
      ActiveOrderTracking(:final order) => _buildActiveOrderCard(context, order),
      _ => const SizedBox.shrink(),
    };
  }

  Widget _buildActiveOrderCard(BuildContext context, Order order) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _getStatusColor(order.status),
            _getStatusColor(order.status).withValues(alpha: 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
        boxShadow: [
          BoxShadow(
            color: _getStatusColor(order.status).withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                _getStatusIcon(order.status),
                color: DesignTokens.white,
                size: 24,
              ),
              const SizedBox(width: DesignTokens.spaceSM),
              Expanded(
                child: Text(
                  'Commande en cours',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: DesignTokens.white,
                    fontWeight: DesignTokens.fontWeightBold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignTokens.spaceSM,
                  vertical: DesignTokens.spaceXS,
                ),
                decoration: BoxDecoration(
                  color: DesignTokens.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                ),
                child: Text(
                  order.status.displayName,
                  style: const TextStyle(
                    color: DesignTokens.white,
                    fontSize: DesignTokens.fontSizeXS,
                    fontWeight: DesignTokens.fontWeightMedium,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: DesignTokens.spaceSM),
          
          Text(
            order.restaurantName,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: DesignTokens.white.withValues(alpha: 0.9),
              fontWeight: DesignTokens.fontWeightMedium,
            ),
          ),
          
          const SizedBox(height: DesignTokens.spaceXS),
          
          Row(
            children: [
              Text(
                '${order.itemCount} article(s)',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: DesignTokens.white.withValues(alpha: 0.8),
                ),
              ),
              const Text(
                ' � ',
                style: TextStyle(
                  color: DesignTokens.white,
                ),
              ),
              Text(
                '${order.total.toInt()} FCFA',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: DesignTokens.white.withValues(alpha: 0.8),
                  fontWeight: DesignTokens.fontWeightMedium,
                ),
              ),
            ],
          ),
          
          if (order.estimatedDeliveryTime != null) ...[ 
            const SizedBox(height: DesignTokens.spaceSM),
            Row(
              children: [
                Icon(
                  Icons.schedule,
                  color: DesignTokens.white.withValues(alpha: 0.8),
                  size: 16,
                ),
                const SizedBox(width: DesignTokens.spaceXS),
                Text(
                  _formatDeliveryTime(order.estimatedDeliveryTime!),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: DesignTokens.white.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ],
          
          const SizedBox(height: DesignTokens.spaceMD),
          
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.go('/order-tracking/${order.id}');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: DesignTokens.white,
                foregroundColor: _getStatusColor(order.status),
                padding: const EdgeInsets.symmetric(
                  vertical: DesignTokens.spaceSM,
                ),
              ),
              child: const Text(
                'Suivre la commande',
                style: TextStyle(
                  fontWeight: DesignTokens.fontWeightSemiBold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.created:
        return DesignTokens.warningColor;
      case OrderStatus.confirmed:
      case OrderStatus.accepted:
      case OrderStatus.preparing:
        return DesignTokens.infoColor;
      case OrderStatus.readyForPickup:
      case OrderStatus.assignedDriver:
      case OrderStatus.pickedUp:
      case OrderStatus.inTransit:
        return DesignTokens.primaryColor;
      case OrderStatus.delivered:
      case OrderStatus.completed:
        return DesignTokens.successColor;
      case OrderStatus.cancelled:
      case OrderStatus.rejected:
      case OrderStatus.refunded:
      case OrderStatus.expired:
        return DesignTokens.errorColor;
    }
  }

  IconData _getStatusIcon(OrderStatus status) {
    switch (status) {
      case OrderStatus.created:
        return Icons.schedule;
      case OrderStatus.confirmed:
      case OrderStatus.accepted:
        return Icons.check_circle_outline;
      case OrderStatus.preparing:
        return Icons.restaurant;
      case OrderStatus.readyForPickup:
        return Icons.check_circle;
      case OrderStatus.assignedDriver:
      case OrderStatus.pickedUp:
        return Icons.local_shipping;
      case OrderStatus.inTransit:
        return Icons.delivery_dining;
      case OrderStatus.delivered:
      case OrderStatus.completed:
        return Icons.done_all;
      case OrderStatus.cancelled:
      case OrderStatus.rejected:
      case OrderStatus.refunded:
      case OrderStatus.expired:
        return Icons.cancel;
    }
  }

  String _formatDeliveryTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = dateTime.difference(now);
    
    if (difference.inMinutes <= 0) {
      return 'Livraison imminente';
    } else if (difference.inMinutes < 60) {
      return 'Livraison dans ${difference.inMinutes} min';
    } else {
      return 'Livraison � ${dateTime.hour}h${dateTime.minute.toString().padLeft(2, '0')}';
    }
  }
}
