import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../shared/widgets/loading/shimmer_loading.dart';
import '../../domain/models/restaurant_stats.dart';

class PopularItemsList extends StatelessWidget {
  final List<PopularItem> items;
  final Function(String itemId) onItemTap;

  const PopularItemsList({
    super.key,
    required this.items,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return _buildEmptyState(context);
    }

    return Container(
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
          Padding(
            padding: const EdgeInsets.all(DesignTokens.spaceMD),
            child: Row(
              children: [
                Icon(
                  Icons.trending_up,
                  color: DesignTokens.successColor,
                  size: 20,
                ),
                const SizedBox(width: DesignTokens.spaceXS),
                Text(
                  'Top ${items.length} des articles',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: DesignTokens.fontWeightSemiBold,
                  ),
                ),
              ],
            ),
          ),
          ...items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return _buildItemTile(context, item, index + 1);
          }),
          const SizedBox(height: DesignTokens.spaceXS),
        ],
      ),
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
          Icon(
            Icons.restaurant_menu_outlined,
            size: 48,
            color: DesignTokens.textTertiary,
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          Text(
            'Aucun article populaire',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: DesignTokens.textSecondary,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceXS),
          Text(
            'Les articles les plus commandés apparaîtront ici',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: DesignTokens.textTertiary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildItemTile(BuildContext context, PopularItem item, int rank) {
    return InkWell(
      onTap: () => onItemTap(item.itemId),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: DesignTokens.spaceMD,
          vertical: DesignTokens.spaceSM,
        ),
        child: Row(
          children: [
            // Rank badge
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: _getRankColor(rank),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$rank',
                  style: const TextStyle(
                    color: DesignTokens.white,
                    fontWeight: DesignTokens.fontWeightBold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(width: DesignTokens.spaceMD),
            
            // Item image
            ClipRRect(
              borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
              child: CachedNetworkImage(
                imageUrl: item.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                placeholder: (context, url) => const ShimmerLoading(
                  child: SizedBox(width: 50, height: 50),
                ),
                errorWidget: (context, url, error) => Container(
                  width: 50,
                  height: 50,
                  color: DesignTokens.backgroundGrey,
                  child: const Icon(
                    Icons.fastfood,
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
                  Text(
                    item.itemName,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: DesignTokens.fontWeightSemiBold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 14,
                        color: DesignTokens.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${item.orderCount} commandes',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: DesignTokens.textSecondary,
                        ),
                      ),
                      const SizedBox(width: DesignTokens.spaceMD),
                      if (item.rating > 0) ...[
                        Icon(
                          Icons.star,
                          size: 14,
                          color: DesignTokens.warningColor,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          item.rating.toStringAsFixed(1),
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: DesignTokens.textSecondary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            
            // Revenue and trend
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${item.revenue.toStringAsFixed(0)} F',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: DesignTokens.fontWeightBold,
                    color: DesignTokens.successColor,
                  ),
                ),
                const SizedBox(height: 2),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DesignTokens.spaceXS,
                    vertical: 1,
                  ),
                  decoration: BoxDecoration(
                    color: DesignTokens.successColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignTokens.radiusXS),
                  ),
                  child: Text(
                    '↗ Tendance',
                    style: TextStyle(
                      color: DesignTokens.successColor,
                      fontSize: 10,
                      fontWeight: DesignTokens.fontWeightMedium,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return const Color(0xFFFFD700); // Gold
      case 2:
        return const Color(0xFFC0C0C0); // Silver
      case 3:
        return const Color(0xFFCD7F32); // Bronze
      default:
        return DesignTokens.primaryColor;
    }
  }
}