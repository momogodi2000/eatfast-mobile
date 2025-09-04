import 'package:flutter/material.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../domain/models/live_order.dart';

class OrderDetailCard extends StatelessWidget {
  final LiveOrder order;
  final VoidCallback onTap;
  final Function(int estimatedTime) onAccept;
  final Function(String reason) onReject;
  final Function(OrderStatus status) onStatusUpdate;

  const OrderDetailCard({
    super.key,
    required this.order,
    required this.onTap,
    required this.onAccept,
    required this.onReject,
    required this.onStatusUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: DesignTokens.spaceMD),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(DesignTokens.spaceMD),
          decoration: BoxDecoration(
            color: DesignTokens.white,
            borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
            border: Border.all(
              color: _getStatusColor(order.status).withValues(alpha: 0.3),
              width: 2,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: DesignTokens.spaceMD),
              _buildCustomerInfo(),
              const SizedBox(height: DesignTokens.spaceMD),
              _buildOrderItems(),
              if (order.specialInstructions.isNotEmpty) ...[
                const SizedBox(height: DesignTokens.spaceMD),
                _buildSpecialInstructions(),
              ],
              const SizedBox(height: DesignTokens.spaceMD),
              _buildOrderSummary(),
              if (order.status == OrderStatus.pending) ...[
                const SizedBox(height: DesignTokens.spaceMD),
                _buildActionButtons(context),
              ] else if (order.status.isActive) ...[
                const SizedBox(height: DesignTokens.spaceMD),
                _buildStatusActions(context),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignTokens.spaceSM,
            vertical: DesignTokens.spaceXS,
          ),
          decoration: BoxDecoration(
            color: _getStatusColor(order.status).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(DesignTokens.radiusXS),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _getStatusColor(order.status),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: DesignTokens.spaceXS),
              Text(
                order.status.displayName,
                style: TextStyle(
                  color: _getStatusColor(order.status),
                  fontSize: 12,
                  fontWeight: DesignTokens.fontWeightMedium,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '#${order.orderId.substring(0, 8)}',
              style: const TextStyle(
                fontWeight: DesignTokens.fontWeightBold,
                color: DesignTokens.textPrimary,
              ),
            ),
            Text(
              _formatTime(order.orderTime),
              style: const TextStyle(
                fontSize: 12,
                color: DesignTokens.textTertiary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCustomerInfo() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: DesignTokens.primaryColor.withValues(alpha: 0.1),
          child: Text(
            order.customerName.substring(0, 1).toUpperCase(),
            style: TextStyle(
              color: DesignTokens.primaryColor,
              fontWeight: DesignTokens.fontWeightBold,
            ),
          ),
        ),
        const SizedBox(width: DesignTokens.spaceMD),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.customerName,
                style: const TextStyle(
                  fontWeight: DesignTokens.fontWeightSemiBold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    size: 14,
                    color: DesignTokens.textSecondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    order.customerPhone,
                    style: TextStyle(
                      color: DesignTokens.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignTokens.spaceXS,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: _getDeliveryTypeColor(order.deliveryType).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(DesignTokens.radiusXS),
          ),
          child: Text(
            _getDeliveryTypeText(order.deliveryType),
            style: TextStyle(
              color: _getDeliveryTypeColor(order.deliveryType),
              fontSize: 10,
              fontWeight: DesignTokens.fontWeightMedium,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderItems() {
    return Container(
      padding: const EdgeInsets.all(DesignTokens.spaceSM),
      decoration: BoxDecoration(
        color: DesignTokens.backgroundGrey,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.restaurant_menu,
                size: 16,
                color: DesignTokens.textSecondary,
              ),
              const SizedBox(width: DesignTokens.spaceXS),
              Text(
                'Articles commandés (${order.items.length})',
                style: TextStyle(
                  color: DesignTokens.textSecondary,
                  fontWeight: DesignTokens.fontWeightMedium,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: DesignTokens.spaceXS),
          ...order.items.take(3).map((item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: DesignTokens.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${item.quantity}',
                      style: const TextStyle(
                        color: DesignTokens.white,
                        fontSize: 10,
                        fontWeight: DesignTokens.fontWeightBold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: DesignTokens.spaceXS),
                Expanded(
                  child: Text(
                    item.itemName,
                    style: const TextStyle(
                      fontSize: 14,
                      color: DesignTokens.textPrimary,
                    ),
                  ),
                ),
                Text(
                  '${item.totalPrice.toStringAsFixed(0)} F',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: DesignTokens.fontWeightMedium,
                    color: DesignTokens.textPrimary,
                  ),
                ),
              ],
            ),
          )),
          if (order.items.length > 3) ...[
            const SizedBox(height: DesignTokens.spaceXS),
            Text(
              '+${order.items.length - 3} autres articles...',
              style: TextStyle(
                color: DesignTokens.textTertiary,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSpecialInstructions() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(DesignTokens.spaceSM),
      decoration: BoxDecoration(
        color: DesignTokens.warningColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        border: Border.all(
          color: DesignTokens.warningColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.note_outlined,
            size: 16,
            color: DesignTokens.warningColor,
          ),
          const SizedBox(width: DesignTokens.spaceXS),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Instructions spéciales:',
                  style: TextStyle(
                    color: DesignTokens.warningColor,
                    fontWeight: DesignTokens.fontWeightMedium,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  order.specialInstructions,
                  style: TextStyle(
                    color: DesignTokens.textPrimary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(
                Icons.access_time,
                size: 16,
                color: DesignTokens.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                order.estimatedPrepTime > 0 
                    ? '${order.estimatedPrepTime} min'
                    : 'Non défini',
                style: TextStyle(
                  color: DesignTokens.textSecondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignTokens.spaceSM,
            vertical: DesignTokens.spaceXS,
          ),
          decoration: BoxDecoration(
            color: DesignTokens.successColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(DesignTokens.radiusXS),
          ),
          child: Text(
            '${order.totalAmount.toStringAsFixed(0)} FCFA',
            style: TextStyle(
              color: DesignTokens.successColor,
              fontWeight: DesignTokens.fontWeightBold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _showRejectDialog(context),
            icon: const Icon(Icons.close, size: 18),
            label: const Text('Rejeter'),
            style: OutlinedButton.styleFrom(
              foregroundColor: DesignTokens.errorColor,
              side: BorderSide(color: DesignTokens.errorColor),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
        const SizedBox(width: DesignTokens.spaceMD),
        Expanded(
          flex: 2,
          child: ElevatedButton.icon(
            onPressed: () => _showAcceptDialog(context),
            icon: const Icon(Icons.check, size: 18),
            label: const Text('Accepter'),
            style: ElevatedButton.styleFrom(
              backgroundColor: DesignTokens.successColor,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusActions(BuildContext context) {
    List<Widget> actions = [];

    switch (order.status) {
      case OrderStatus.accepted:
        actions = [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => onStatusUpdate(OrderStatus.preparing),
              icon: const Icon(Icons.restaurant, size: 18),
              label: const Text('Commencer préparation'),
              style: ElevatedButton.styleFrom(
                backgroundColor: DesignTokens.primaryColor,
              ),
            ),
          ),
        ];
        break;
      case OrderStatus.preparing:
        actions = [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => onStatusUpdate(OrderStatus.ready),
              icon: const Icon(Icons.done, size: 18),
              label: const Text('Marquer comme prêt'),
              style: ElevatedButton.styleFrom(
                backgroundColor: DesignTokens.successColor,
              ),
            ),
          ),
        ];
        break;
      case OrderStatus.ready:
        actions = [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => onStatusUpdate(OrderStatus.pickedUp),
                    icon: const Icon(Icons.local_shipping, size: 18),
                    label: const Text('Récupéré'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: DesignTokens.infoColor,
                      side: BorderSide(color: DesignTokens.infoColor),
                    ),
                  ),
                ),
                const SizedBox(width: DesignTokens.spaceSM),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => onStatusUpdate(OrderStatus.delivered),
                    icon: const Icon(Icons.check_circle, size: 18),
                    label: const Text('Livré'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DesignTokens.successColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ];
        break;
      default:
        actions = [];
    }

    if (actions.isNotEmpty) {
      return Column(
        children: actions,
      );
    }
    return const SizedBox.shrink();
  }

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return DesignTokens.warningColor;
      case OrderStatus.accepted:
        return DesignTokens.infoColor;
      case OrderStatus.preparing:
        return DesignTokens.primaryColor;
      case OrderStatus.ready:
        return DesignTokens.successColor;
      case OrderStatus.pickedUp:
        return DesignTokens.successColor;
      case OrderStatus.delivered:
        return DesignTokens.successColor;
      case OrderStatus.cancelled:
        return DesignTokens.textTertiary;
      case OrderStatus.rejected:
        return DesignTokens.errorColor;
    }
  }

  Color _getDeliveryTypeColor(DeliveryType type) {
    switch (type) {
      case DeliveryType.delivery:
        return DesignTokens.primaryColor;
      case DeliveryType.pickup:
        return DesignTokens.warningColor;
      case DeliveryType.dineIn:
        return DesignTokens.successColor;
    }
  }

  String _getDeliveryTypeText(DeliveryType type) {
    switch (type) {
      case DeliveryType.delivery:
        return 'LIVRAISON';
      case DeliveryType.pickup:
        return 'À EMPORTER';
      case DeliveryType.dineIn:
        return 'SUR PLACE';
    }
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inMinutes < 1) {
      return 'À l\'instant';
    } else if (difference.inMinutes < 60) {
      return 'Il y a ${difference.inMinutes} min';
    } else if (difference.inHours < 24) {
      return 'Il y a ${difference.inHours}h';
    } else {
      return '${dateTime.day}/${dateTime.month} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
    }
  }

  void _showAcceptDialog(BuildContext context) {
    int estimatedTime = order.estimatedPrepTime > 0 ? order.estimatedPrepTime : 15;
    
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
              const Text('Temps de préparation estimé:'),
              const SizedBox(height: DesignTokens.spaceMD),
              Container(
                padding: const EdgeInsets.all(DesignTokens.spaceSM),
                decoration: BoxDecoration(
                  color: DesignTokens.backgroundGrey,
                  borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: estimatedTime > 5 
                          ? () => setState(() => estimatedTime -= 5) 
                          : null,
                      icon: const Icon(Icons.remove_circle_outline),
                      color: DesignTokens.primaryColor,
                    ),
                    Column(
                      children: [
                        Text(
                          '$estimatedTime',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: DesignTokens.fontWeightBold,
                            color: DesignTokens.primaryColor,
                          ),
                        ),
                        const Text(
                          'minutes',
                          style: TextStyle(
                            color: DesignTokens.textSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () => setState(() => estimatedTime += 5),
                      icon: const Icon(Icons.add_circle_outline),
                      color: DesignTokens.primaryColor,
                    ),
                  ],
                ),
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
                onAccept(estimatedTime);
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

  void _showRejectDialog(BuildContext context) {
    String reason = '';
    final reasons = [
      'Restaurant fermé',
      'Ingrédients non disponibles',
      'Trop de commandes',
      'Problème de livraison',
      'Autre raison...',
    ];
    
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
          ),
          title: const Text(
            'Rejeter la commande',
            style: TextStyle(fontWeight: DesignTokens.fontWeightBold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Pourquoi rejetez-vous cette commande?'),
              const SizedBox(height: DesignTokens.spaceMD),
              ...reasons.map((reasonText) => RadioListTile<String>(
                title: Text(reasonText),
                value: reasonText,
                groupValue: reason,
                onChanged: (value) => setState(() => reason = value ?? ''),
                contentPadding: EdgeInsets.zero,
              )),
              if (reason == 'Autre raison...') ...[
                const SizedBox(height: DesignTokens.spaceMD),
                TextField(
                  onChanged: (value) => reason = value,
                  decoration: InputDecoration(
                    hintText: 'Précisez la raison...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                    ),
                  ),
                  maxLines: 2,
                ),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: reason.isNotEmpty ? () {
                Navigator.pop(context);
                onReject(reason);
              } : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: DesignTokens.errorColor,
              ),
              child: const Text('Rejeter'),
            ),
          ],
        ),
      ),
    );
  }
}