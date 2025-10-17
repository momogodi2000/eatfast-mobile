import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';
import 'package:eatfast_mobile/shared/models/order.dart';

class OrderItemsSummary extends StatefulWidget {
  final Order order;

  const OrderItemsSummary({
    super.key,
    required this.order,
  });

  @override
  State<OrderItemsSummary> createState() => _OrderItemsSummaryState();
}

class _OrderItemsSummaryState extends State<OrderItemsSummary> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
          // Header
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(DesignTokens.radiusLG),
              topRight: Radius.circular(DesignTokens.radiusLG),
            ),
            child: Padding(
              padding: const EdgeInsets.all(DesignTokens.spaceLG),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Articles command�s',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: DesignTokens.fontWeightSemiBold,
                        ),
                      ),
                      Text(
                        '${widget.order.itemCount} article(s) � ${widget.order.subtotal.toInt()} FCFA',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: DesignTokens.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.expand_more),
                  ),
                ],
              ),
            ),
          ),
          
          // Items list
          if (_isExpanded) ...[
            const Divider(height: 1),
            
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.order.items.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = widget.order.items[index];
                return _buildOrderItem(item);
              },
            ),
            
            const Divider(height: 1),
            
            // Order summary
            Padding(
              padding: const EdgeInsets.all(DesignTokens.spaceLG),
              child: Column(
                children: [
                  _buildSummaryRow('Sous-total', '${widget.order.subtotal.toInt()} FCFA'),
                  _buildSummaryRow('Livraison', '${widget.order.deliveryFee.toInt()} FCFA'),
                  _buildSummaryRow('Taxes', '${widget.order.tax.toInt()} FCFA'),
                  if (widget.order.discount > 0)
                    _buildSummaryRow('Remise', '-${widget.order.discount.toInt()} FCFA', isDiscount: true),
                  const Divider(),
                  _buildSummaryRow(
                    'Total',
                    '${widget.order.total.toInt()} FCFA',
                    isTotal: true,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildOrderItem(item) {
    return Padding(
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Item image
          ClipRRect(
            borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
            child: CachedNetworkImage(
              imageUrl: item.menuItem.imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: 50,
                height: 50,
                color: DesignTokens.lightGrey.withValues(alpha: 0.3),
                child: const Icon(
                  Icons.fastfood,
                  size: 20,
                  color: DesignTokens.textTertiary,
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: 50,
                height: 50,
                color: DesignTokens.lightGrey.withValues(alpha: 0.3),
                child: const Icon(
                  Icons.fastfood,
                  size: 20,
                  color: DesignTokens.textTertiary,
                ),
              ),
            ),
          ),
          
          const SizedBox(width: DesignTokens.spaceMD),
          
          // Item details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.menuItem.name,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: DesignTokens.fontWeightSemiBold,
                        ),
                      ),
                    ),
                    Text(
                      'x${item.quantity}',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: DesignTokens.primaryColor,
                        fontWeight: DesignTokens.fontWeightBold,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: DesignTokens.spaceXS),
                
                // Customizations
                if (item.customizations.isNotEmpty) ...[
                  ...item.customizations.map((customization) {
                    final optionNames = customization.options.map((option) => option.name).join(', ');
                    return Padding(
                      padding: const EdgeInsets.only(bottom: DesignTokens.spaceXXS),
                      child: Text(
                        '${customization.customizationName}: $optionNames',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: DesignTokens.textSecondary,
                        ),
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: DesignTokens.spaceXS),
                ],
                
                // Special instructions
                if (item.specialInstructions?.isNotEmpty == true) ...[
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: DesignTokens.spaceSM,
                      vertical: DesignTokens.spaceXS,
                    ),
                    decoration: BoxDecoration(
                      color: DesignTokens.infoColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(DesignTokens.radiusXS),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.note_outlined,
                          size: 12,
                          color: DesignTokens.infoColor,
                        ),
                        const SizedBox(width: DesignTokens.spaceXS),
                        Expanded(
                          child: Text(
                            item.specialInstructions!,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: DesignTokens.infoColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: DesignTokens.spaceXS),
                ],
                
                // Price
                Text(
                  '${item.totalPrice.toInt()} FCFA',
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
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false, bool isDiscount = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DesignTokens.spaceXS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? DesignTokens.fontSizeMD : DesignTokens.fontSizeSM,
              fontWeight: isTotal ? DesignTokens.fontWeightBold : DesignTokens.fontWeightNormal,
              color: isDiscount ? DesignTokens.successColor : DesignTokens.textPrimary,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? DesignTokens.fontSizeMD : DesignTokens.fontSizeSM,
              fontWeight: isTotal ? DesignTokens.fontWeightBold : DesignTokens.fontWeightMedium,
              color: isTotal 
                  ? DesignTokens.primaryColor
                  : isDiscount 
                      ? DesignTokens.successColor 
                      : DesignTokens.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
