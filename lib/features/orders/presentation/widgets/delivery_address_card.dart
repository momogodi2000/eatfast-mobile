import 'package:flutter/material.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../profile/domain/models.dart';
import '../../../profile/domain/user_address.dart';

class DeliveryAddressCard extends StatelessWidget {
  final UserAddress address;

  const DeliveryAddressCard({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      decoration: BoxDecoration(
        color: DesignTokens.white,
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
              Container(
                padding: const EdgeInsets.all(DesignTokens.spaceSM),
                decoration: BoxDecoration(
                  color: DesignTokens.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.location_on,
                  color: DesignTokens.primaryColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: DesignTokens.spaceMD),
              Expanded(
                child: Text(
                  'Adresse de livraison',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: DesignTokens.fontWeightSemiBold,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: DesignTokens.spaceMD),
          
          // Address label
          if (address.label?.isNotEmpty == true) ...[
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: DesignTokens.spaceSM,
                vertical: DesignTokens.spaceXS,
              ),
              decoration: BoxDecoration(
                color: DesignTokens.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(DesignTokens.radiusXS),
              ),
              child: Text(
                address.label!,
                style: TextStyle(
                  color: DesignTokens.primaryColor,
                  fontSize: DesignTokens.fontSizeXS,
                  fontWeight: DesignTokens.fontWeightMedium,
                ),
              ),
            ),
            const SizedBox(height: DesignTokens.spaceSM),
          ],
          
          // Full address
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (address.street.isNotEmpty)
                _buildAddressLine(context, address.street),
              
              if (address.buildingDetails?.isNotEmpty == true)
                _buildAddressLine(context, address.buildingDetails!),
              
              if (address.neighborhood?.isNotEmpty == true)
                _buildAddressLine(context, address.neighborhood!),
              
              _buildAddressLine(context, '${address.city}, ${address.region}'),
              
              if (address.postalCode?.isNotEmpty == true)
                _buildAddressLine(context, address.postalCode!),
              
              if (address.country.isNotEmpty)
                _buildAddressLine(context, address.country),
            ],
          ),
          
          // Delivery instructions
          if (address.deliveryInstructions?.isNotEmpty == true) ...[
            const SizedBox(height: DesignTokens.spaceMD),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(DesignTokens.spaceSM),
              decoration: BoxDecoration(
                color: DesignTokens.infoColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                border: Border.all(
                  color: DesignTokens.infoColor.withOpacity(0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 16,
                        color: DesignTokens.infoColor,
                      ),
                      const SizedBox(width: DesignTokens.spaceXS),
                      Text(
                        'Instructions de livraison',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: DesignTokens.infoColor,
                          fontWeight: DesignTokens.fontWeightMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: DesignTokens.spaceXS),
                  Text(
                    address.deliveryInstructions!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: DesignTokens.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
          
          // Contact info
          if (address.contactPhone?.isNotEmpty == true) ...[
            const SizedBox(height: DesignTokens.spaceMD),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  size: 16,
                  color: DesignTokens.textSecondary,
                ),
                const SizedBox(width: DesignTokens.spaceXS),
                Text(
                  address.contactPhone!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: DesignTokens.textSecondary,
                  ),
                ),
              ],
            ),
          ],
          
          // Actions
          const SizedBox(height: DesignTokens.spaceMD),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Open in maps
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Ouvrir dans Google Maps')),
                    );
                  },
                  icon: const Icon(Icons.map_outlined),
                  label: const Text('Voir sur la carte'),
                ),
              ),
              
              if (address.contactPhone?.isNotEmpty == true) ...[
                const SizedBox(width: DesignTokens.spaceMD),
                OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Call phone number
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Appeler ${address.contactPhone}')),
                    );
                  },
                  icon: const Icon(Icons.phone),
                  label: const Text('Appeler'),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddressLine(BuildContext context, String line) {
    return Padding(
      padding: const EdgeInsets.only(bottom: DesignTokens.spaceXS),
      child: Text(
        line,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          height: 1.4,
        ),
      ),
    );
  }
}