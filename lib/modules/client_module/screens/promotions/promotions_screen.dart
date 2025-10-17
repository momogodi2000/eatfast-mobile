import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:eatfast_mobile/shared/config/router/route_names.dart';
import 'package:eatfast_mobile/shared/constants/app_constants.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';

/// Promotions Screen - Shows current offers and special deals
/// Accessible by both guest and authenticated users
class PromotionsScreen extends ConsumerStatefulWidget {
  const PromotionsScreen({super.key});

  @override
  ConsumerState<PromotionsScreen> createState() => _PromotionsScreenState();
}

class _PromotionsScreenState extends ConsumerState<PromotionsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.backgroundLight,
      appBar: AppBar(
        title: const Text(
          'Promotions & Offres',
          style: TextStyle(
            color: DesignTokens.white,
            fontWeight: DesignTokens.fontWeightBold,
          ),
        ),
        backgroundColor: DesignTokens.primaryColor,
        iconTheme: const IconThemeData(color: DesignTokens.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Banner
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    DesignTokens.primaryColor,
                    DesignTokens.accentColor,
                  ],
                ),
                borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
                boxShadow: [
                  BoxShadow(
                    color: DesignTokens.primaryColor.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(DesignTokens.spaceLG),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.celebration,
                      color: DesignTokens.white,
                      size: DesignTokens.iconXL,
                    ),
                    const SizedBox(height: DesignTokens.spaceMD),
                    Text(
                      'Bienvenue chez EatFast!',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: DesignTokens.white,
                        fontWeight: DesignTokens.fontWeightBold,
                      ),
                    ),
                    const SizedBox(height: DesignTokens.spaceSM),
                    Text(
                      'D�couvrez nos offres exclusives et �conomisez sur vos plats pr�f�r�s',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: DesignTokens.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: DesignTokens.spaceLG),

            // Current Promotions Section
            Text(
              'Promotions en cours',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: DesignTokens.fontWeightBold,
                color: DesignTokens.textPrimary,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceMD),

            // Promotion Cards
            ...List.generate(3, (index) => _buildPromotionCard(context, index)),

            const SizedBox(height: DesignTokens.spaceLG),

            // Company Info Section
            Text(
              '� propos d\'EatFast Cameroun',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: DesignTokens.fontWeightBold,
                color: DesignTokens.textPrimary,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceMD),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(DesignTokens.spaceLG),
              decoration: BoxDecoration(
                color: DesignTokens.white,
                borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                boxShadow: [
                  BoxShadow(
                    color: DesignTokens.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: DesignTokens.primaryColor.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            AppConstants.logoAsset,
                            width: 35,
                            height: 35,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.restaurant,
                                size: 30,
                                color: DesignTokens.primaryColor,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: DesignTokens.spaceMD),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'EatFast Cameroun',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: DesignTokens.fontWeightBold,
                                color: DesignTokens.primaryColor,
                              ),
                            ),
                            Text(
                              'Yaound� - Simbock',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: DesignTokens.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: DesignTokens.spaceMD),
                  Text(
                    'Notre mission',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: DesignTokens.fontWeightSemiBold,
                      color: DesignTokens.textPrimary,
                    ),
                  ),
                  const SizedBox(height: DesignTokens.spaceSM),
                  Text(
                    'Connecter les Camerounais � leurs plats traditionnels pr�f�r�s avec une livraison rapide et fiable. Nous valorisons la cuisine locale et soutenons les restaurants de notre communaut�.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: DesignTokens.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: DesignTokens.spaceMD),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => context.go(RouteNames.aboutUs),
                          icon: const Icon(Icons.info_outline),
                          label: const Text('En savoir plus'),
                        ),
                      ),
                      const SizedBox(width: DesignTokens.spaceMD),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => context.go(RouteNames.contactUs),
                          icon: const Icon(Icons.contact_mail),
                          label: const Text('Nous contacter'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: DesignTokens.primaryColor,
                            foregroundColor: DesignTokens.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: DesignTokens.spaceXXL),
          ],
        ),
      ),
    );
  }

  Widget _buildPromotionCard(BuildContext context, int index) {
    final promotions = [
      {
        'title': 'Premi�re commande -20%',
        'description': '�conomisez 20% sur votre premi�re commande avec le code BIENVENUE20',
        'code': 'BIENVENUE20',
        'color': DesignTokens.successColor,
        'icon': Icons.star,
      },
      {
        'title': 'Livraison gratuite',
        'description': 'Livraison gratuite pour toute commande sup�rieure � 15,000 FCFA',
        'code': 'LIVRAISON0',
        'color': DesignTokens.accentColor,
        'icon': Icons.delivery_dining,
      },
      {
        'title': 'Menu du jour -15%',
        'description': 'R�duction sp�ciale sur notre s�lection quotidienne de plats traditionnels',
        'code': 'TRADITION15',
        'color': DesignTokens.warningColor,
        'icon': Icons.restaurant_menu,
      },
    ];

    final promo = promotions[index];

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: DesignTokens.spaceMD),
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      decoration: BoxDecoration(
        color: DesignTokens.white,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        border: Border.all(
          color: (promo['color'] as Color).withValues(alpha: 0.3),
          width: 1,
        ),
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
              Container(
                padding: const EdgeInsets.all(DesignTokens.spaceSM),
                decoration: BoxDecoration(
                  color: (promo['color'] as Color).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                ),
                child: Icon(
                  promo['icon'] as IconData,
                  color: promo['color'] as Color,
                  size: DesignTokens.iconMD,
                ),
              ),
              const SizedBox(width: DesignTokens.spaceMD),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      promo['title'] as String,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: DesignTokens.fontWeightBold,
                        color: promo['color'] as Color,
                      ),
                    ),
                    Text(
                      promo['description'] as String,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: DesignTokens.textSecondary,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: DesignTokens.spaceMD,
              vertical: DesignTokens.spaceSM,
            ),
            decoration: BoxDecoration(
              color: (promo['color'] as Color).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
              border: Border.all(
                color: (promo['color'] as Color).withValues(alpha: 0.3),
                style: BorderStyle.solid,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Code: ',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: DesignTokens.textSecondary,
                  ),
                ),
                Text(
                  promo['code'] as String,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: DesignTokens.fontWeightBold,
                    color: promo['color'] as Color,
                    fontFamily: 'monospace',
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
