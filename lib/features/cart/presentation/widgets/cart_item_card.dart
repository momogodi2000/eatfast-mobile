import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../domain/models/cart.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;
  final Function(int) onQuantityChanged;
  final VoidCallback onRemove;
  final Function(String?) onUpdateInstructions;

  const CartItemCard({
    super.key,
    required this.cartItem,
    required this.onQuantityChanged,
    required this.onRemove,
    required this.onUpdateInstructions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          children: [
            // Main item row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Item image
                _buildItemImage(),
                
                const SizedBox(width: DesignTokens.spaceMD),
                
                // Item details
                Expanded(child: _buildItemDetails(context)),
                
                // Remove button
                IconButton(
                  icon: const Icon(
                    Icons.delete_outline,
                    color: DesignTokens.errorColor,
                  ),
                  onPressed: onRemove,
                  tooltip: 'Supprimer',
                ),
              ],
            ),
            
            // Customizations
            if (cartItem.customizations.isNotEmpty) ...[
              const SizedBox(height: DesignTokens.spaceSM),
              _buildCustomizations(context),
            ],
            
            // Special instructions
            const SizedBox(height: DesignTokens.spaceSM),
            _buildSpecialInstructions(context),
            
            const SizedBox(height: DesignTokens.spaceSM),
            
            // Quantity controls and total
            _buildBottomRow(context),
          ],
        ),
      ),
    );
  }

  Widget _buildItemImage() {
    final imageUrl = cartItem.menuItem.imageUrl;
    
    if (imageUrl == null || imageUrl.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        child: Container(
          width: 60,
          height: 60,
          color: DesignTokens.lightGrey.withValues(alpha: 0.3),
          child: const Icon(
            Icons.fastfood,
            size: 24,
            color: DesignTokens.textTertiary,
          ),
        ),
      );
    }
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          width: 60,
          height: 60,
          color: DesignTokens.lightGrey.withValues(alpha: 0.3),
          child: const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: 60,
          height: 60,
          color: DesignTokens.lightGrey.withValues(alpha: 0.3),
          child: const Icon(
            Icons.fastfood,
            size: 24,
            color: DesignTokens.textTertiary,
          ),
        ),
      ),
    );
  }

  Widget _buildItemDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartItem.menuItem.name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: DesignTokens.fontWeightSemiBold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        
        const SizedBox(height: DesignTokens.spaceXS),
        
        Text(
          '${cartItem.menuItem.price.toInt()} FCFA chacun',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: DesignTokens.textSecondary,
          ),
        ),
        
        if (cartItem.customizations.isNotEmpty) ...[
          const SizedBox(height: DesignTokens.spaceXS),
          Text(
            'Personnalisé',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: DesignTokens.primaryColor,
              fontWeight: DesignTokens.fontWeightMedium,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildCustomizations(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(DesignTokens.spaceSM),
      decoration: BoxDecoration(
        color: DesignTokens.backgroundSecondary,
        borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personnalisations:',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: DesignTokens.fontWeightMedium,
              color: DesignTokens.textSecondary,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceXS),
          ...cartItem.customizations.map((customization) {
            final optionNames = customization.options.map((option) => option.name).join(', ');
            final additionalPrice = customization.options.fold<double>(
              0.0, 
              (sum, option) => sum + option.additionalPrice,
            );
            
            return Padding(
              padding: const EdgeInsets.only(bottom: DesignTokens.spaceXXS),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${customization.customizationName}: $optionNames',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  if (additionalPrice > 0)
                    Text(
                      '+${additionalPrice.toInt()} FCFA',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: DesignTokens.primaryColor,
                        fontWeight: DesignTokens.fontWeightMedium,
                      ),
                    ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSpecialInstructions(BuildContext context) {
    return GestureDetector(
      onTap: () => _showInstructionsDialog(context),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(DesignTokens.spaceSM),
        decoration: BoxDecoration(
          color: cartItem.specialInstructions?.isNotEmpty == true 
              ? DesignTokens.infoColor.withValues(alpha: 0.1)
              : DesignTokens.lightGrey.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
          border: Border.all(
            color: cartItem.specialInstructions?.isNotEmpty == true
                ? DesignTokens.infoColor.withValues(alpha: 0.3)
                : DesignTokens.lightGrey.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.note_outlined,
              size: 16,
              color: cartItem.specialInstructions?.isNotEmpty == true
                  ? DesignTokens.infoColor
                  : DesignTokens.textTertiary,
            ),
            const SizedBox(width: DesignTokens.spaceXS),
            Expanded(
              child: Text(
                cartItem.specialInstructions?.isNotEmpty == true
                    ? cartItem.specialInstructions!
                    : 'Ajouter des instructions spéciales',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: cartItem.specialInstructions?.isNotEmpty == true
                      ? DesignTokens.textPrimary
                      : DesignTokens.textTertiary,
                  fontStyle: cartItem.specialInstructions?.isNotEmpty == true
                      ? FontStyle.normal
                      : FontStyle.italic,
                ),
              ),
            ),
            const Icon(
              Icons.edit_outlined,
              size: 14,
              color: DesignTokens.textTertiary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Quantity controls
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: cartItem.quantity > 1 
                  ? () => onQuantityChanged(cartItem.quantity - 1)
                  : null,
              iconSize: 32,
              color: cartItem.quantity > 1 
                  ? DesignTokens.primaryColor 
                  : DesignTokens.textTertiary,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: DesignTokens.spaceSM,
                vertical: DesignTokens.spaceXS,
              ),
              decoration: BoxDecoration(
                color: DesignTokens.primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
              ),
              child: Text(
                cartItem.quantity.toString(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: DesignTokens.fontWeightBold,
                  color: DesignTokens.primaryColor,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () => onQuantityChanged(cartItem.quantity + 1),
              iconSize: 32,
              color: DesignTokens.primaryColor,
            ),
          ],
        ),
        
        // Total price
        Text(
          '${cartItem.totalPrice.toInt()} FCFA',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: DesignTokens.fontWeightBold,
            color: DesignTokens.primaryColor,
          ),
        ),
      ],
    );
  }

  void _showInstructionsDialog(BuildContext context) {
    final controller = TextEditingController(text: cartItem.specialInstructions ?? '');
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Instructions spéciales'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Ex: Sans oignons, bien cuit, etc.',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
          maxLength: 200,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              final instructions = controller.text.trim();
              onUpdateInstructions(instructions.isEmpty ? null : instructions);
              Navigator.pop(context);
            },
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );
  }
}