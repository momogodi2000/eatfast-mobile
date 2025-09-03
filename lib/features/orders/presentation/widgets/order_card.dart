import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../domain/models/order.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback? onTap;
  final VoidCallback? onReorder;

  const OrderCard({
    super.key,
    required this.order,
    this.onTap,
    this.onReorder,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
        child: Padding(
          padding: const EdgeInsets.all(DesignTokens.spaceLG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with order number and status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Commande #${order.id.split('_').last.substring(0, 8)}',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: DesignTokens.fontWeightBold,
                          ),
                        ),
                        const SizedBox(height: DesignTokens.spaceXXS),
                        Text(
                          order.restaurantName,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: DesignTokens.primaryColor,
                            fontWeight: DesignTokens.fontWeightMedium,
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
                      color: _getStatusColor(order.status).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                    ),
                    child: Text(
                      order.status.displayName,
                      style: TextStyle(
                        color: _getStatusColor(order.status),
                        fontSize: DesignTokens.fontSizeXS,
                        fontWeight: DesignTokens.fontWeightSemiBold,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: DesignTokens.spaceMD),
              
              // Order items preview
              Row(
                children: [
                  // First few items images
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: (order.items.length > 3 ? 3 : order.items.length),
                      itemBuilder: (context, index) {
                        final item = order.items[index];
                        return Container(
                          margin: EdgeInsets.only(
                            right: index < 2 ? DesignTokens.spaceXS : 0,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                            child: CachedNetworkImage(
                              imageUrl: item.menuItem.imageUrl,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                width: 40,
                                height: 40,
                                color: DesignTokens.lightGrey.withValues(alpha: 0.3),
                                child: const Icon(
                                  Icons.fastfood,
                                  size: 16,
                                  color: DesignTokens.textTertiary,
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                width: 40,
                                height: 40,
                                color: DesignTokens.lightGrey.withValues(alpha: 0.3),
                                child: const Icon(
                                  Icons.fastfood,
                                  size: 16,
                                  color: DesignTokens.textTertiary,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  
                  const SizedBox(width: DesignTokens.spaceSM),
                  
                  // Order summary
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${order.itemCount} article(s)',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: DesignTokens.fontWeightMedium,
                          ),
                        ),
                        Text(
                          '${order.total.toInt()} FCFA',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: DesignTokens.primaryColor,
                            fontWeight: DesignTokens.fontWeightBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: DesignTokens.spaceMD),
              
              // Order date and actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (order.createdAt != null)
                    Text(
                      _formatDate(order.createdAt!),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: DesignTokens.textSecondary,
                      ),
                    )
                  else
                    const SizedBox.shrink(),
                  
                  Row(
                    children: [
                      if (order.isActive)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: DesignTokens.spaceXS,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: DesignTokens.primaryColor,
                            borderRadius: BorderRadius.circular(DesignTokens.radiusXS),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.visibility,
                                size: 12,
                                color: DesignTokens.white,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                'Suivre',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: DesignTokens.white,
                                  fontSize: 10,
                                  fontWeight: DesignTokens.fontWeightMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      
                      if (onReorder != null) ...[ 
                        const SizedBox(width: DesignTokens.spaceXS),
                        GestureDetector(
                          onTap: onReorder,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: DesignTokens.spaceXS,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: DesignTokens.successColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(DesignTokens.radiusXS),
                              border: Border.all(
                                color: DesignTokens.successColor.withValues(alpha: 0.3),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.refresh,
                                  size: 12,
                                  color: DesignTokens.successColor,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  'Recommander',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: DesignTokens.successColor,
                                    fontSize: 10,
                                    fontWeight: DesignTokens.fontWeightMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return DesignTokens.warningColor;
      case OrderStatus.confirmed:
      case OrderStatus.preparing:
        return DesignTokens.infoColor;
      case OrderStatus.ready:
      case OrderStatus.pickedUp:
      case OrderStatus.onTheWay:
        return DesignTokens.primaryColor;
      case OrderStatus.delivered:
        return DesignTokens.successColor;
      case OrderStatus.cancelled:
      case OrderStatus.refunded:
        return DesignTokens.errorColor;
    }
  }

  String _formatDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays == 0) {
      return 'Aujourd\'hui ${dateTime.hour}h${dateTime.minute.toString().padLeft(2, '0')}';
    } else if (difference.inDays == 1) {
      return 'Hier ${dateTime.hour}h${dateTime.minute.toString().padLeft(2, '0')}';
    } else if (difference.inDays < 7) {
      return 'Il y a ${difference.inDays} jours';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}