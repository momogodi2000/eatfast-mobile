import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:eatfast_mobile/shared/config/router/route_names.dart';
import 'package:eatfast_mobile/shared/constants/app_constants.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';
import 'package:eatfast_mobile/shared/widgets/common/app_loading_indicator.dart';
import 'package:eatfast_mobile/shared/services/cart/providers/cart_provider.dart';
import '../widgets/cart_item_card.dart';
import '../widgets/cart_conflict_dialog.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);

    // Listen for cart conflicts
    ref.listen<CartState>(cartProvider, (previous, next) {
      if (next is CartConflictingRestaurant) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => CartConflictDialog(
            currentRestaurantName: next.currentRestaurantName,
            newRestaurantName: next.newRestaurantName,
            onKeepCurrent: () {
              Navigator.of(context).pop();
              ref.read(cartProvider.notifier).dismissConflict();
            },
            onReplaceCart: () {
              Navigator.of(context).pop();
              ref
                  .read(cartProvider.notifier)
                  .clearAndAddItem(
                    next.pendingItem,
                    quantity: next.pendingQuantity,
                    customizations: next.pendingCustomizations,
                    specialInstructions: next.pendingInstructions,
                  );
            },
          ),
        );
      }
    });

    return Scaffold(
      backgroundColor: DesignTokens.backgroundPrimary,
      appBar: AppBar(
        title: const Text('Mon Panier'),
        backgroundColor: DesignTokens.primaryColor,
        foregroundColor: DesignTokens.white,
        elevation: 0,
        actions: [
          if (cartState is CartLoaded && cartState.cart.isNotEmpty)
            TextButton(
              onPressed: () => _showClearCartDialog(context, ref),
              child: const Text(
                'Vider',
                style: TextStyle(color: DesignTokens.white),
              ),
            ),
        ],
      ),
      body: _buildBody(context, ref, cartState),
      bottomNavigationBar: cartState is CartLoaded && cartState.cart.isNotEmpty
          ? _buildBottomBar(context, cartState.cart)
          : null,
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, CartState cartState) {
    return switch (cartState) {
      CartInitial() || CartLoading() => const AppLoadingIndicator(),

      CartError(:final message) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: DesignTokens.errorColor.withValues(alpha: 0.5),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            Text('Erreur', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: DesignTokens.spaceSM),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: DesignTokens.textSecondary,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceLG),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Retour'),
            ),
          ],
        ),
      ),

      CartLoaded(:final cart) =>
        cart.isEmpty
            ? _buildEmptyCart(context)
            : _buildCartContent(context, ref, cart),

      CartConflictingRestaurant() => const AppLoadingIndicator(),
    };
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_cart_outlined,
            size: 80,
            color: DesignTokens.textTertiary,
          ),
          const SizedBox(height: DesignTokens.spaceLG),
          Text(
            'Votre panier est vide',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: DesignTokens.textSecondary),
          ),
          const SizedBox(height: DesignTokens.spaceSM),
          Text(
            'Ajoutez des articles de vos restaurants pr�f�r�s',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: DesignTokens.textTertiary),
          ),
          const SizedBox(height: DesignTokens.spaceXL),
          ElevatedButton.icon(
            onPressed: () => context.go(RouteNames.restaurants),
            icon: const Icon(Icons.restaurant),
            label: const Text('Parcourir les restaurants'),
          ),
        ],
      ),
    );
  }

  Widget _buildCartContent(BuildContext context, WidgetRef ref, cart) {
    return Column(
      children: [
        // Restaurant info header
        if (cart.restaurantName != null) _buildRestaurantHeader(context, cart),

        // Cart items
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(DesignTokens.spaceMD),
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: DesignTokens.spaceMD),
                child: CartItemCard(
                  cartItem: item,
                  onQuantityChanged: (quantity) =>
                      _updateQuantity(context, item.id, quantity, ref),
                  onRemove: () => _removeItem(context, item.id, ref),
                  onUpdateInstructions: (instructions) =>
                      _updateInstructions(context, item.id, instructions, ref),
                ),
              );
            },
          ),
        ),

        // Order summary
        _buildOrderSummary(context, cart),
      ],
    );
  }

  Widget _buildRestaurantHeader(BuildContext context, cart) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      decoration: BoxDecoration(
        color: DesignTokens.white,
        border: Border(
          bottom: BorderSide(
            color: DesignTokens.borderColor.withValues(alpha: 0.3),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(DesignTokens.spaceSM),
            decoration: BoxDecoration(
              color: DesignTokens.primaryColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.restaurant,
              color: DesignTokens.primaryColor,
              size: 20,
            ),
          ),
          const SizedBox(width: DesignTokens.spaceMD),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Commande de ${cart.restaurantName}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: DesignTokens.fontWeightSemiBold,
                  ),
                ),
                Text(
                  '${cart.itemCount} article(s) � ${cart.subtotal.toInt()} FCFA',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: DesignTokens.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummary(BuildContext context, cart) {
    return Container(
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      decoration: const BoxDecoration(
        color: DesignTokens.white,
        border: Border(top: BorderSide(color: DesignTokens.borderColor)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'R�sum� de la commande',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: DesignTokens.fontWeightSemiBold,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceSM),
          _buildSummaryRow('Sous-total', '${cart.subtotal.toInt()} FCFA'),
          _buildSummaryRow('Livraison', '${cart.deliveryFee.toInt()} FCFA'),
          _buildSummaryRow('Taxes', '${cart.tax.toInt()} FCFA'),
          if (cart.discount > 0)
            _buildSummaryRow(
              'Remise',
              '-${cart.discount.toInt()} FCFA',
              isDiscount: true,
            ),
          const Divider(),
          _buildSummaryRow(
            'Total',
            '${cart.total.toInt()} FCFA',
            isTotal: true,
          ),

          if (cart.subtotal < AppConstants.minimumOrderAmount) ...[
            const SizedBox(height: DesignTokens.spaceSM),
            Container(
              padding: const EdgeInsets.all(DesignTokens.spaceSM),
              decoration: BoxDecoration(
                color: DesignTokens.warningColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: DesignTokens.warningColor,
                    size: 16,
                  ),
                  const SizedBox(width: DesignTokens.spaceXS),
                  Expanded(
                    child: Text(
                      'Ajoutez ${(AppConstants.minimumOrderAmount - cart.subtotal).toInt()} FCFA pour la livraison gratuite',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: DesignTokens.warningColor,
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

  Widget _buildSummaryRow(
    String label,
    String value, {
    bool isTotal = false,
    bool isDiscount = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DesignTokens.spaceXS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal
                  ? DesignTokens.fontSizeLG
                  : DesignTokens.fontSizeMD,
              fontWeight: isTotal
                  ? DesignTokens.fontWeightBold
                  : DesignTokens.fontWeightNormal,
              color: isDiscount
                  ? DesignTokens.successColor
                  : DesignTokens.textPrimary,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal
                  ? DesignTokens.fontSizeLG
                  : DesignTokens.fontSizeMD,
              fontWeight: isTotal
                  ? DesignTokens.fontWeightBold
                  : DesignTokens.fontWeightMedium,
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

  Widget _buildBottomBar(BuildContext context, cart) {
    final canCheckout = cart.subtotal >= AppConstants.minimumOrderAmount;

    return Container(
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      decoration: const BoxDecoration(
        color: DesignTokens.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!canCheckout)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(DesignTokens.spaceSM),
              margin: const EdgeInsets.only(bottom: DesignTokens.spaceSM),
              decoration: BoxDecoration(
                color: DesignTokens.errorColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
              ),
              child: Text(
                'Commande minimum: ${AppConstants.minimumOrderAmount.toInt()} FCFA',
                style: const TextStyle(
                  color: DesignTokens.errorColor,
                  fontSize: DesignTokens.fontSizeSM,
                  fontWeight: DesignTokens.fontWeightMedium,
                ),
                textAlign: TextAlign.center,
              ),
            ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: canCheckout ? () => _proceedToCheckout(context) : null,
              child: Text(
                'Commander � ${cart.total.toInt()} FCFA',
                style: const TextStyle(
                  fontSize: DesignTokens.fontSizeLG,
                  fontWeight: DesignTokens.fontWeightSemiBold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateQuantity(
    BuildContext context,
    String itemId,
    int quantity,
    WidgetRef ref,
  ) {
    ref.read(cartProvider.notifier).updateItemQuantity(itemId, quantity);
  }

  void _removeItem(BuildContext context, String itemId, WidgetRef ref) {
    ref.read(cartProvider.notifier).removeItem(itemId);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Article supprim� du panier'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _updateInstructions(
    BuildContext context,
    String itemId,
    String? instructions,
    WidgetRef ref,
  ) {
    ref
        .read(cartProvider.notifier)
        .updateItemInstructions(itemId, instructions);
  }

  void _showClearCartDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Vider le panier'),
        content: const Text(
          '�tes-vous s�r de vouloir supprimer tous les articles du panier ?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(cartProvider.notifier).clearCart();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Panier vid�'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text(
              'Vider',
              style: TextStyle(color: DesignTokens.errorColor),
            ),
          ),
        ],
      ),
    );
  }

  void _proceedToCheckout(BuildContext context) {
    context.go(RouteNames.checkout);
  }
}
