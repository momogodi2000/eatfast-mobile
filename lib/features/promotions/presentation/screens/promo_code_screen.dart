import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../shared/widgets/buttons/app_button.dart';
import '../../providers/promo_code_provider.dart';
import '../../domain/models/promo_code.dart';

class PromoCodeScreen extends ConsumerStatefulWidget {
  final double orderAmount;
  final double deliveryFee;
  final List<String> restaurantIds;
  final List<String> categoryIds;
  final bool isFirstOrder;
  final Function(AppliedPromo?) onPromoApplied;

  const PromoCodeScreen({
    super.key,
    required this.orderAmount,
    required this.deliveryFee,
    required this.restaurantIds,
    required this.categoryIds,
    required this.isFirstOrder,
    required this.onPromoApplied,
  });

  @override
  ConsumerState<PromoCodeScreen> createState() => _PromoCodeScreenState();
}

class _PromoCodeScreenState extends ConsumerState<PromoCodeScreen> {
  final _promoCodeController = TextEditingController();
  
  @override
  void dispose() {
    _promoCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final promoState = ref.watch(promoCodeProvider);
    final validPromoCodes = ref.read(promoCodeProvider.notifier).getValidPromoCodes(
      orderAmount: widget.orderAmount,
      restaurantIds: widget.restaurantIds,
      categoryIds: widget.categoryIds,
      isFirstOrder: widget.isFirstOrder,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Codes promo'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        children: [
          // Promo code input section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Entrez votre code promo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _promoCodeController,
                        decoration: InputDecoration(
                          hintText: 'Ex: WELCOME20',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon: const Icon(Icons.local_offer),
                          errorText: promoState.error,
                        ),
                        textCapitalization: TextCapitalization.characters,
                        onSubmitted: (_) => _applyPromoCode(),
                      ),
                    ),
                    const SizedBox(width: 12),
                    AppButton(
                      onPressed: promoState.isLoading ? null : _applyPromoCode,
                      text: 'Appliquer',
                      isLoading: promoState.isLoading,
                      size: AppButtonSize.small,
                    ),
                  ],
                ),
                
                // Currently applied promo
                if (promoState.appliedPromo != null) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.green.withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Code appliqué: ${promoState.appliedPromo!.promoCode.code}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                'Économie: ${promoState.appliedPromo!.discountAmount.toInt()} FCFA',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, size: 20),
                          onPressed: _removePromoCode,
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          
          // Available promo codes list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (validPromoCodes.isNotEmpty) ...[
                  const Text(
                    'Codes disponibles pour cette commande',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...validPromoCodes.map((promo) => _buildPromoCard(promo)),
                ],
                
                if (validPromoCodes.isEmpty && promoState.availablePromoCodes.isNotEmpty) ...[
                  const Text(
                    'Autres codes disponibles',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ces codes ne peuvent pas être appliqués à cette commande',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...promoState.availablePromoCodes
                      .where((promo) => !validPromoCodes.contains(promo))
                      .map((promo) => _buildPromoCard(promo, isDisabled: true)),
                ],
                
                if (promoState.availablePromoCodes.isEmpty && !promoState.isLoading) ...[
                  const SizedBox(height: 64),
                  Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.local_offer_outlined,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Aucun code promo disponible',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Revenez bientôt pour découvrir nos offres!',
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          
          // Bottom action bar
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: AppButton(
                  onPressed: () {
                    widget.onPromoApplied(promoState.appliedPromo);
                    context.pop();
                  },
                  text: promoState.appliedPromo != null
                      ? 'Confirmer (${promoState.appliedPromo!.discountAmount.toInt()} FCFA économisés)'
                      : 'Continuer sans code promo',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCard(PromoCode promo, {bool isDisabled = false}) {
    final canApply = !isDisabled && promo.canApplyToOrder(
      orderAmount: widget.orderAmount,
      restaurantIds: widget.restaurantIds,
      categoryIds: widget.categoryIds,
      isFirstOrder: widget.isFirstOrder,
    );

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: canApply ? () => _applySpecificPromo(promo) : null,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: isDisabled 
                          ? Colors.grey.withOpacity(0.2)
                          : DesignTokens.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      promo.code,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isDisabled 
                            ? Colors.grey
                            : DesignTokens.primaryColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: isDisabled 
                          ? Colors.grey.withOpacity(0.2)
                          : Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      promo.type.formatValue(promo.value),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: isDisabled ? Colors.grey : Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 8),
              
              Text(
                promo.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDisabled ? Colors.grey : null,
                ),
              ),
              
              const SizedBox(height: 4),
              
              Text(
                promo.description,
                style: TextStyle(
                  fontSize: 14,
                  color: isDisabled ? Colors.grey : Colors.grey[600],
                ),
              ),
              
              const SizedBox(height: 8),
              
              if (promo.minimumOrderAmount > 0)
                Text(
                  'Commande minimum: ${promo.minimumOrderAmount.toInt()} FCFA',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDisabled ? Colors.grey : Colors.grey[500],
                  ),
                ),
              
              if (promo.usageLimit > 0)
                Text(
                  'Utilisations restantes: ${promo.usageLimit - promo.usageCount}',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDisabled ? Colors.grey : Colors.grey[500],
                  ),
                ),
              
              if (!canApply && !isDisabled)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    _getUnavailableReason(promo),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _getUnavailableReason(PromoCode promo) {
    if (widget.orderAmount < promo.minimumOrderAmount) {
      return 'Commande minimum de ${promo.minimumOrderAmount.toInt()} FCFA requise';
    }
    if (promo.isFirstTimeOnly && !widget.isFirstOrder) {
      return 'Réservé aux nouveaux clients';
    }
    if (!promo.isValid) {
      return 'Code expiré ou non valide';
    }
    return 'Non applicable à cette commande';
  }

  Future<void> _applyPromoCode() async {
    if (_promoCodeController.text.trim().isEmpty) return;

    ref.read(promoCodeProvider.notifier).clearError();
    
    final success = await ref.read(promoCodeProvider.notifier).applyPromoCode(
      code: _promoCodeController.text.trim(),
      orderAmount: widget.orderAmount,
      deliveryFee: widget.deliveryFee,
      restaurantIds: widget.restaurantIds,
      categoryIds: widget.categoryIds,
      isFirstOrder: widget.isFirstOrder,
    );

    if (success) {
      _promoCodeController.clear();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Code promo appliqué avec succès!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  Future<void> _applySpecificPromo(PromoCode promo) async {
    final success = await ref.read(promoCodeProvider.notifier).applyPromoCode(
      code: promo.code,
      orderAmount: widget.orderAmount,
      deliveryFee: widget.deliveryFee,
      restaurantIds: widget.restaurantIds,
      categoryIds: widget.categoryIds,
      isFirstOrder: widget.isFirstOrder,
    );

    if (success) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Code ${promo.code} appliqué!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  void _removePromoCode() {
    ref.read(promoCodeProvider.notifier).removePromoCode();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Code promo retiré'),
      ),
    );
  }
}
