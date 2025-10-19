import 'package:flutter/material.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';
import 'package:eatfast_mobile/shared/models/live_order.dart';
import 'package:eatfast_mobile/shared/models/exports.dart' as shared_models;

class LiveOrdersPreview extends StatelessWidget {
  final List<LiveOrder> orders;
  final Function(String orderId) onOrderTap;
  final Function(String orderId, int estimatedPrepTime)? onAcceptOrder;
  final Function(String orderId, String reason)? onRejectOrder;

  const LiveOrdersPreview({
    super.key,
    required this.orders,
    required this.onOrderTap,
    this.onAcceptOrder,
    this.onRejectOrder,
  });

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return _buildEmptyState(context);
    }

    return Column(
      children: orders.map((order) => _buildOrderCard(context, order)).toList(),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DesignTokens.spaceXL),
      decoration: BoxDecoration(
        color: DesignTokens.white,
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
        boxShadow: [
          BoxShadow(
            color: DesignTokens.shadowColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(
            Icons.inbox_outlined,
            size: 48,
            color: DesignTokens.textTertiary,
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          Text(
            'Aucune commande active',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: DesignTokens.textSecondary,
              fontWeight: DesignTokens.fontWeightMedium,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceXS),
          Text(
            'Les nouvelles commandes appara�tront ici',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: DesignTokens.textTertiary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(BuildContext context, LiveOrder order) {
    return Container(
      margin: const EdgeInsets.only(bottom: DesignTokens.spaceMD),
      child: GestureDetector(
        onTap: () => onOrderTap(order.orderId),
        child: Container(
          padding: const EdgeInsets.all(DesignTokens.spaceMD),
          decoration: BoxDecoration(
            color: DesignTokens.white,
            borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
            border: Border.all(
              color: _getStatusColor(order.status).withValues(alpha: 0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: DesignTokens.shadowColor.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: DesignTokens.spaceSM,
                      vertical: DesignTokens.spaceXS,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(
                        order.status,
                      ).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(
                        DesignTokens.radiusXS,
                      ),
                    ),
                    child: Text(
                      order.status.displayName,
                      style: TextStyle(
                        color: _getStatusColor(order.status),
                        fontSize: 12,
                        fontWeight: DesignTokens.fontWeightMedium,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '#${order.orderId.substring(0, 8)}',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: DesignTokens.fontWeightBold,
                      color: DesignTokens.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: DesignTokens.spaceMD),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.customerName,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: DesignTokens.fontWeightSemiBold,
                              ),
                        ),
                        const SizedBox(height: DesignTokens.spaceXXS),
                        Text(
                          '${order.items.length} article(s) � ${order.totalAmount.toStringAsFixed(0)} FCFA',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: DesignTokens.textSecondary),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _formatTime(order.orderTime),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: DesignTokens.textTertiary,
                        ),
                      ),
                      if (order.estimatedPrepTime > 0) ...[
                        const SizedBox(height: DesignTokens.spaceXXS),
                        Row(
                          children: [
                            const Icon(
                              Icons.timer_outlined,
                              size: 14,
                              color: DesignTokens.warningColor,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              '${order.estimatedPrepTime} min',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: DesignTokens.warningColor,
                                    fontWeight: DesignTokens.fontWeightMedium,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ],
              ),
              if (order.specialInstructions.isNotEmpty) ...[
                const SizedBox(height: DesignTokens.spaceSM),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(DesignTokens.spaceSM),
                  decoration: BoxDecoration(
                    color: DesignTokens.backgroundGrey,
                    borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.note_outlined,
                        size: 16,
                        color: DesignTokens.textSecondary,
                      ),
                      const SizedBox(width: DesignTokens.spaceXS),
                      Expanded(
                        child: Text(
                          order.specialInstructions,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: DesignTokens.textSecondary),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              if (order.status == shared_models.OrderStatus.pending) ...[
                const SizedBox(height: DesignTokens.spaceMD),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _showRejectDialog(context, order),
                        icon: const Icon(Icons.close, size: 18),
                        label: const Text('Rejeter'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: DesignTokens.errorColor,
                          side: const BorderSide(
                            color: DesignTokens.errorColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: DesignTokens.spaceMD),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        onPressed: () => _showAcceptDialog(context, order),
                        icon: const Icon(Icons.check, size: 18),
                        label: const Text('Accepter'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: DesignTokens.successColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(shared_models.OrderStatus status) {
    switch (status) {
      case shared_models.OrderStatus.pending:
        return DesignTokens.warningColor;
      case shared_models.OrderStatus.accepted:
        return DesignTokens.infoColor;
      case shared_models.OrderStatus.preparing:
        return DesignTokens.primaryColor;
      case shared_models.OrderStatus.ready:
        return DesignTokens.successColor;
      case shared_models.OrderStatus.pickedUp:
        return DesignTokens.successColor;
      case shared_models.OrderStatus.delivered:
        return DesignTokens.successColor;
      case shared_models.OrderStatus.cancelled:
        return DesignTokens.textTertiary;
      case shared_models.OrderStatus.rejected:
        return DesignTokens.errorColor;
      default:
        return DesignTokens.textTertiary;
    }
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return '� l\'instant';
    } else if (difference.inMinutes < 60) {
      return 'Il y a ${difference.inMinutes} min';
    } else if (difference.inHours < 24) {
      return 'Il y a ${difference.inHours}h';
    } else {
      return '${dateTime.day}/${dateTime.month}';
    }
  }

  void _showAcceptDialog(BuildContext context, LiveOrder order) {
    int estimatedTime = 15;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
          ),
          title: const Text(
            'Accepter la commande',
            style: TextStyle(fontWeight: DesignTokens.fontWeightBold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Temps de pr�paration estim�:'),
              const SizedBox(height: DesignTokens.spaceMD),
              Row(
                children: [
                  IconButton(
                    onPressed: estimatedTime > 5
                        ? () => setState(() => estimatedTime -= 5)
                        : null,
                    icon: const Icon(Icons.remove),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        '$estimatedTime minutes',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: DesignTokens.fontWeightBold,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => setState(() => estimatedTime += 5),
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                if (onAcceptOrder != null) {
                  onAcceptOrder!(order.orderId, estimatedTime);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: DesignTokens.successColor,
              ),
              child: const Text('Accepter'),
            ),
          ],
        ),
      ),
    );
  }

  void _showRejectDialog(BuildContext context, LiveOrder order) {
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
        ),
        title: const Text(
          'Rejeter la commande',
          style: TextStyle(fontWeight: DesignTokens.fontWeightBold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Pourquoi rejetez-vous cette commande?'),
            const SizedBox(height: DesignTokens.spaceMD),
            TextField(
              controller: reasonController,
              decoration: InputDecoration(
                hintText: 'Raison du rejet...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                ),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              reasonController.dispose();
              Navigator.pop(context);
            },
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              final reason = reasonController.text.trim();
              reasonController.dispose();
              Navigator.pop(context);

              if (reason.isNotEmpty && onRejectOrder != null) {
                onRejectOrder!(order.orderId, reason);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: DesignTokens.errorColor,
            ),
            child: const Text('Rejeter'),
          ),
        ],
      ),
    );
  }
}
