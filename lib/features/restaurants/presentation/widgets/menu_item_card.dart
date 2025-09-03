import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../domain/models/menu_item.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;
  final VoidCallback onTap;

  const MenuItemCard({
    super.key,
    required this.menuItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
        child: Padding(
          padding: const EdgeInsets.all(DesignTokens.spaceMD),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Menu item image
              _buildImage(),
              
              const SizedBox(width: DesignTokens.spaceMD),
              
              // Menu item details
              Expanded(
                child: _buildDetails(context),
              ),
              
              // Add button
              _buildAddButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      child: CachedNetworkImage(
        imageUrl: menuItem.imageUrl,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          width: 80,
          height: 80,
          color: DesignTokens.lightGrey.withOpacity(0.3),
          child: const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: 80,
          height: 80,
          color: DesignTokens.lightGrey.withOpacity(0.3),
          child: const Icon(
            Icons.fastfood,
            size: 32,
            color: DesignTokens.textTertiary,
          ),
        ),
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name and badges
        Row(
          children: [
            Expanded(
              child: Text(
                menuItem.name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: DesignTokens.fontWeightSemiBold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Popular/Recommended badges
            if (menuItem.isPopular) ...[
              const SizedBox(width: DesignTokens.spaceXS),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignTokens.spaceXS,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: DesignTokens.warningColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusXS),
                ),
                child: Text(
                  'POPULAIRE',
                  style: TextStyle(
                    color: DesignTokens.warningColor,
                    fontSize: DesignTokens.fontSizeXXS,
                    fontWeight: DesignTokens.fontWeightBold,
                  ),
                ),
              ),
            ] else if (menuItem.isRecommended) ...[
              const SizedBox(width: DesignTokens.spaceXS),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignTokens.spaceXS,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: DesignTokens.successColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusXS),
                ),
                child: Text(
                  'RECOMMANDÉ',
                  style: TextStyle(
                    color: DesignTokens.successColor,
                    fontSize: DesignTokens.fontSizeXXS,
                    fontWeight: DesignTokens.fontWeightBold,
                  ),
                ),
              ),
            ],
          ],
        ),
        
        const SizedBox(height: DesignTokens.spaceXS),
        
        // Description
        Text(
          menuItem.description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: DesignTokens.textSecondary,
            height: 1.3,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        
        const SizedBox(height: DesignTokens.spaceSM),
        
        // Price and additional info
        Row(
          children: [
            Text(
              '${menuItem.price.toInt()} FCFA',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: DesignTokens.primaryColor,
                fontWeight: DesignTokens.fontWeightBold,
              ),
            ),
            
            const Spacer(),
            
            // Preparation time
            if (menuItem.preparationTime > 0) ...[
              Icon(
                Icons.access_time,
                size: 14,
                color: DesignTokens.textTertiary,
              ),
              const SizedBox(width: DesignTokens.spaceXXS),
              Text(
                '${menuItem.preparationTime}min',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: DesignTokens.textTertiary,
                ),
              ),
            ],
          ],
        ),
        
        const SizedBox(height: DesignTokens.spaceXS),
        
        // Dietary tags
        if (menuItem.dietaryTags.isNotEmpty)
          Wrap(
            spacing: DesignTokens.spaceXXS,
            runSpacing: DesignTokens.spaceXXS,
            children: menuItem.dietaryTags.take(3).map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignTokens.spaceXS,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: _getTagColor(tag).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusXS),
                ),
                child: Text(
                  _getTagDisplayName(tag),
                  style: TextStyle(
                    color: _getTagColor(tag),
                    fontSize: DesignTokens.fontSizeXXS,
                    fontWeight: DesignTokens.fontWeightMedium,
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

  Widget _buildAddButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Availability indicator
        if (!menuItem.isAvailable)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: DesignTokens.spaceXS,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: DesignTokens.errorColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(DesignTokens.radiusXS),
            ),
            child: Text(
              'INDISPONIBLE',
              style: TextStyle(
                color: DesignTokens.errorColor,
                fontSize: DesignTokens.fontSizeXXS,
                fontWeight: DesignTokens.fontWeightBold,
              ),
            ),
          )
        else
          Container(
            decoration: BoxDecoration(
              color: DesignTokens.primaryColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                color: DesignTokens.white,
                size: 20,
              ),
              onPressed: onTap,
              constraints: const BoxConstraints(
                minWidth: 36,
                minHeight: 36,
              ),
            ),
          ),
      ],
    );
  }

  Color _getTagColor(DietaryTag tag) {
    switch (tag) {
      case DietaryTag.vegetarian:
      case DietaryTag.vegan:
      case DietaryTag.healthy:
      case DietaryTag.organic:
        return DesignTokens.successColor;
      case DietaryTag.spicy:
        return DesignTokens.errorColor;
      case DietaryTag.glutenFree:
      case DietaryTag.dairyFree:
        return DesignTokens.warningColor;
      case DietaryTag.halal:
      case DietaryTag.kosher:
        return DesignTokens.infoColor;
    }
  }

  String _getTagDisplayName(DietaryTag tag) {
    switch (tag) {
      case DietaryTag.vegetarian:
        return 'Végé';
      case DietaryTag.vegan:
        return 'Végan';
      case DietaryTag.glutenFree:
        return 'Sans gluten';
      case DietaryTag.dairyFree:
        return 'Sans lactose';
      case DietaryTag.halal:
        return 'Halal';
      case DietaryTag.kosher:
        return 'Kosher';
      case DietaryTag.spicy:
        return 'Pimenté';
      case DietaryTag.healthy:
        return 'Sain';
      case DietaryTag.organic:
        return 'Bio';
    }
  }
}