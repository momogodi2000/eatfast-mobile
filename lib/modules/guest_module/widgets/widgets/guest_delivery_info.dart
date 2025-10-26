import 'package:flutter/material.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';

/// Guest delivery information form widget
class GuestDeliveryInfo extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController notesController;

  const GuestDeliveryInfo({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.addressController,
    required this.notesController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      decoration: BoxDecoration(
        color: DesignTokens.white,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        boxShadow: [
          BoxShadow(
            color: DesignTokens.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: DesignTokens.primaryColor,
                size: DesignTokens.iconMD,
              ),
              const SizedBox(width: DesignTokens.spaceSM),
              Text(
                'Informations de livraison',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: DesignTokens.fontWeightBold,
                  color: DesignTokens.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: DesignTokens.spaceMD),

          // Name field
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Nom complet *',
              prefixIcon: Icon(Icons.person_outline),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Veuillez entrer votre nom';
              }
              return null;
            },
          ),

          const SizedBox(height: DesignTokens.spaceMD),

          // Phone field
          TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Numéro de téléphone *',
              prefixIcon: Icon(Icons.phone_outlined),
              border: OutlineInputBorder(),
              hintText: '+237 6XX XXX XXX',
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Veuillez entrer votre numéro de téléphone';
              }
              if (!RegExp(
                r'^\+?[0-9]{8,15}$',
              ).hasMatch(value.replaceAll(' ', ''))) {
                return 'Numéro de téléphone invalide';
              }
              return null;
            },
          ),

          const SizedBox(height: DesignTokens.spaceMD),

          // Address field
          TextFormField(
            controller: addressController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Adresse de livraison *',
              prefixIcon: Icon(Icons.location_on_outlined),
              border: OutlineInputBorder(),
              hintText: 'Quartier, rue, numéro de maison, point de repère...',
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Veuillez entrer votre adresse';
              }
              if (value.trim().length < 10) {
                return 'Adresse trop courte';
              }
              return null;
            },
          ),

          const SizedBox(height: DesignTokens.spaceMD),

          // Notes field (optional)
          TextFormField(
            controller: notesController,
            maxLines: 2,
            decoration: const InputDecoration(
              labelText: 'Instructions spéciales (optionnel)',
              prefixIcon: Icon(Icons.note_outlined),
              border: OutlineInputBorder(),
              hintText: 'Instructions pour le livreur...',
            ),
          ),

          const SizedBox(height: DesignTokens.spaceMD),

          // Info message
          Container(
            padding: const EdgeInsets.all(DesignTokens.spaceSM),
            decoration: BoxDecoration(
              color: DesignTokens.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
              border: Border.all(
                color: DesignTokens.primaryColor.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: DesignTokens.primaryColor,
                  size: DesignTokens.iconSM,
                ),
                const SizedBox(width: DesignTokens.spaceSM),
                Expanded(
                  child: Text(
                    'Vous recevrez un SMS de confirmation avec les détails de votre commande.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: DesignTokens.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
