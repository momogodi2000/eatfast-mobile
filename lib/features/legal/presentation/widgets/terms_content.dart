import 'package:flutter/material.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/constants/app_constants.dart';

/// Widget containing the terms and conditions content - Enhanced Design
class TermsContent extends StatelessWidget {
  const TermsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Welcome Banner
        Container(
          padding: const EdgeInsets.all(DesignTokens.spaceLG),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                DesignTokens.primaryColor.withValues(alpha: 0.1),
                DesignTokens.secondaryColor.withValues(alpha: 0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
            border: Border.all(
              color: DesignTokens.primaryColor.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: DesignTokens.primaryColor,
                    size: DesignTokens.iconLG,
                  ),
                  const SizedBox(width: DesignTokens.spaceMD),
                  Expanded(
                    child: Text(
                      'Conditions Générales d\'Utilisation',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: DesignTokens.fontWeightBold,
                            color: DesignTokens.primaryColor,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: DesignTokens.spaceMD),
              Text(
                'Merci de lire attentivement ces conditions avant d\'utiliser ${AppConstants.appName}. En utilisant notre service, vous acceptez ces conditions.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: DesignTokens.textSecondary,
                      height: 1.5,
                    ),
              ),
            ],
          ),
        ),

        const SizedBox(height: DesignTokens.spaceXL),

        _buildSection(
          context,
          icon: Icons.gavel,
          title: '1. Objet des CGU',
          content:
              'Les présentes Conditions Générales d\'Utilisation (CGU) régissent l\'utilisation de l\'application mobile ${AppConstants.appName}, éditée par ${AppConstants.companyName}, société de droit camerounais, dont le siège social est situé à ${AppConstants.companyAddress}.\n\nCes CGU définissent les droits et obligations de chaque partie dans le cadre de l\'utilisation de nos services de livraison de nourriture.',
        ),

        _buildSection(
          context,
          icon: Icons.check_circle_outline,
          title: '2. Acceptation des Conditions',
          content:
              'En téléchargeant, installant ou utilisant l\'application ${AppConstants.appName}, vous acceptez expressément et sans réserve les présentes conditions générales d\'utilisation.\n\nSi vous n\'acceptez pas ces conditions, veuillez ne pas utiliser l\'application. L\'utilisation continue de l\'application vaut acceptation des modifications éventuelles des présentes CGU.',
        ),

        _buildSection(
          context,
          icon: Icons.restaurant_menu,
          title: '3. Description du Service',
          content:
              '${AppConstants.appName} est une plateforme de mise en relation entre utilisateurs et restaurants partenaires au Cameroun. Notre service comprend :',
          bulletPoints: [
            'Navigation et découverte de restaurants locaux et internationaux',
            'Consultation des menus et tarifs en temps réel',
            'Commande de plats en ligne de manière sécurisée',
            'Paiement via Mobile Money (MTN, Orange), EU Mobile ou espèces',
            'Suivi de commande et livraison en temps réel',
            'Service client disponible et réactif',
            'Programme de fidélité et promotions exclusives',
          ],
        ),

        _buildSection(
          context,
          icon: Icons.person_add,
          title: '4. Inscription et Compte Utilisateur',
          content:
              'Pour utiliser ${AppConstants.appName}, vous devez créer un compte personnel en fournissant des informations exactes, complètes et à jour.',
          bulletPoints: [
            'Fournir une adresse email valide et un numéro de téléphone',
            'Créer un mot de passe sécurisé (minimum 6 caractères)',
            'Maintenir la confidentialité de vos identifiants',
            'Informer immédiatement ${AppConstants.appName} en cas d\'utilisation non autorisée',
            'Ne pas créer plusieurs comptes pour une même personne',
            'Mettre à jour vos informations personnelles régulièrement',
          ],
        ),

        _buildSection(
          context,
          icon: Icons.shopping_cart,
          title: '5. Commandes et Paiements',
          content:
              'En passant une commande via ${AppConstants.appName}, vous vous engagez à :',
          bulletPoints: [
            'Fournir des informations de livraison complètes et exactes',
            'Effectuer le paiement selon les modalités proposées dans l\'application',
            'Être présent ou disponible à l\'adresse de livraison au moment convenu',
            'Vérifier votre commande à la réception',
            'Respecter les conditions d\'annulation définies ci-dessous',
            'Payer le montant total incluant les frais de livraison',
          ],
        ),

        _buildSection(
          context,
          icon: Icons.cancel_outlined,
          title: '6. Politique d\'Annulation et de Remboursement',
          content: 'Les commandes peuvent être annulées selon les conditions suivantes :',
          bulletPoints: [
            'Annulation gratuite dans les 2 minutes suivant la confirmation',
            'Annulation avec frais de 20% avant la préparation du plat',
            'Frais de 50% si la préparation a commencé',
            'Aucun remboursement si le plat est en cours de livraison',
            'Remboursement complet en cas de problème de qualité justifié',
            'Délai de remboursement : 5 à 7 jours ouvrés',
          ],
        ),

        _buildSection(
          context,
          icon: Icons.delivery_dining,
          title: '7. Livraison',
          content: 'Nos services de livraison sont soumis aux conditions suivantes :',
          bulletPoints: [
            'Zone de livraison : Principales villes du Cameroun (Yaoundé, Douala, etc.)',
            'Frais de livraison : Variables selon la distance et le restaurant',
            'Délai de livraison estimé : ${AppConstants.estimatedDeliveryTime} à 45 minutes',
            'Commande minimum : ${AppConstants.minimumOrderAmount.toInt()} FCFA',
            'Les délais peuvent varier selon la circulation et la météo',
            'Le livreur vous contactera en cas de difficulté à trouver l\'adresse',
          ],
        ),

        _buildSection(
          context,
          icon: Icons.security,
          title: '8. Protection des Données Personnelles',
          content:
              'Nous nous engageons à protéger vos données personnelles conformément aux lois camerounaises et internationales en vigueur. Vos données sont utilisées exclusivement pour :',
          bulletPoints: [
            'Traiter et suivre vos commandes',
            'Améliorer la qualité de nos services',
            'Vous contacter concernant vos commandes',
            'Envoyer des promotions et offres (avec votre consentement préalable)',
            'Assurer la sécurité et prévenir les fraudes',
            'Respecter nos obligations légales et réglementaires',
          ],
        ),

        _buildSection(
          context,
          icon: Icons.copyright,
          title: '9. Propriété Intellectuelle',
          content:
              'L\'application ${AppConstants.appName}, son contenu (textes, images, logos, vidéos), ses fonctionnalités, son design et sa technologie sont la propriété exclusive de ${AppConstants.companyName} et sont protégés par les lois sur la propriété intellectuelle.\n\nToute reproduction, représentation, modification, publication ou adaptation non autorisée est strictement interdite.',
        ),

        _buildSection(
          context,
          icon: Icons.warning_amber,
          title: '10. Responsabilité et Limitations',
          content:
              '${AppConstants.companyName} s\'efforce de fournir un service de qualité optimale mais ne peut garantir :',
          bulletPoints: [
            'La disponibilité continue et ininterrompue de l\'application',
            'L\'exactitude absolue de toutes les informations fournies par les restaurants',
            'Le respect des délais de livraison en cas de force majeure',
            'La qualité des plats préparés par les restaurants partenaires',
            'L\'absence totale d\'erreurs techniques ou de bugs',
          ],
        ),

        _buildSection(
          context,
          icon: Icons.block,
          title: '11. Interdictions et Sanctions',
          content: 'Il est strictement interdit de :',
          bulletPoints: [
            'Utiliser l\'application à des fins illégales ou frauduleuses',
            'Créer de faux comptes ou usurper l\'identité d\'autrui',
            'Tenter de contourner les systèmes de sécurité',
            'Diffuser des virus ou codes malveillants',
            'Harceler, menacer ou insulter le personnel ou les livreurs',
            'Abuser des annulations ou demandes de remboursement',
          ],
          note:
              'Toute violation de ces règles peut entraîner la suspension ou la fermeture définitive de votre compte.',
        ),

        _buildSection(
          context,
          icon: Icons.edit_note,
          title: '12. Modification des Conditions',
          content:
              'Nous nous réservons le droit de modifier ces conditions générales d\'utilisation à tout moment pour refléter les changements de nos services, de la législation ou pour améliorer l\'expérience utilisateur.\n\nLes modifications entreront en vigueur dès leur publication dans l\'application. Nous vous informerons des modifications importantes par email ou notification push.',
        ),

        _buildSection(
          context,
          icon: Icons.contact_mail,
          title: '13. Contact et Support',
          content:
              'Pour toute question, réclamation ou information concernant ces conditions générales d\'utilisation ou nos services, vous pouvez nous contacter :',
          contactInfo: {
            'Email': AppConstants.companyEmail,
            'Téléphone': AppConstants.companyPhone,
            'WhatsApp': AppConstants.companyWhatsApp,
            'Adresse': AppConstants.companyAddress,
          },
          note: 'Notre service client est disponible du lundi au dimanche de 8h à 22h.',
        ),

        _buildSection(
          context,
          icon: Icons.gavel_outlined,
          title: '14. Droit Applicable et Juridiction',
          content:
              'Les présentes conditions générales d\'utilisation sont régies et interprétées conformément au droit camerounais.\n\nTout litige relatif à l\'interprétation ou à l\'exécution des présentes sera soumis, à défaut de règlement amiable, à la compétence exclusive des tribunaux de Yaoundé, Cameroun.',
        ),

        const SizedBox(height: DesignTokens.spaceXXL),

        // Last Update Section
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(DesignTokens.spaceLG),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                DesignTokens.infoColor.withValues(alpha: 0.1),
                DesignTokens.primaryColor.withValues(alpha: 0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
            border: Border.all(
              color: DesignTokens.infoColor.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.update,
                    color: DesignTokens.infoColor,
                    size: DesignTokens.iconMD,
                  ),
                  const SizedBox(width: DesignTokens.spaceSM),
                  Text(
                    'Dernière mise à jour',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: DesignTokens.fontWeightBold,
                          color: DesignTokens.infoColor,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: DesignTokens.spaceSM),
              Text(
                'Ces conditions générales d\'utilisation ont été mises à jour le 10 janvier 2025.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: DesignTokens.textSecondary,
                      fontWeight: DesignTokens.fontWeightMedium,
                    ),
              ),
              const SizedBox(height: DesignTokens.spaceXS),
              Text(
                'Version 1.0.0',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: DesignTokens.textTertiary,
                    ),
              ),
            ],
          ),
        ),

        const SizedBox(height: DesignTokens.spaceXL),

        // Footer
        Center(
          child: Column(
            children: [
              Text(
                '© 2025 ${AppConstants.companyName}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: DesignTokens.textTertiary,
                    ),
              ),
              const SizedBox(height: DesignTokens.spaceXS),
              Text(
                'Tous droits réservés',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: DesignTokens.textTertiary,
                    ),
              ),
            ],
          ),
        ),

        const SizedBox(height: DesignTokens.spaceXXL),
      ],
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String content,
    List<String>? bulletPoints,
    Map<String, String>? contactInfo,
    String? note,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: DesignTokens.spaceLG),
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? DesignTokens.surfaceColor
            : DesignTokens.white,
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
        border: Border.all(
          color: DesignTokens.lightGrey.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: DesignTokens.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(DesignTokens.spaceXS),
                decoration: BoxDecoration(
                  color: DesignTokens.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                ),
                child: Icon(
                  icon,
                  color: DesignTokens.primaryColor,
                  size: DesignTokens.iconMD,
                ),
              ),
              const SizedBox(width: DesignTokens.spaceMD),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: DesignTokens.fontWeightBold,
                        color: DesignTokens.primaryColor,
                      ),
                ),
              ),
            ],
          ),

          const SizedBox(height: DesignTokens.spaceMD),

          // Content
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.6,
                  color: DesignTokens.textPrimary,
                ),
            textAlign: TextAlign.justify,
          ),

          // Bullet Points
          if (bulletPoints != null && bulletPoints.isNotEmpty) ...[
            const SizedBox(height: DesignTokens.spaceMD),
            ...bulletPoints.map(
              (point) => Padding(
                padding: const EdgeInsets.only(bottom: DesignTokens.spaceXS),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: DesignTokens.primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: DesignTokens.spaceSM),
                    Expanded(
                      child: Text(
                        point,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              height: 1.5,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],

          // Contact Info
          if (contactInfo != null && contactInfo.isNotEmpty) ...[
            const SizedBox(height: DesignTokens.spaceMD),
            Container(
              padding: const EdgeInsets.all(DesignTokens.spaceMD),
              decoration: BoxDecoration(
                color: DesignTokens.primaryColor.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
              ),
              child: Column(
                children: contactInfo.entries
                    .map(
                      (entry) => Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: DesignTokens.spaceXS,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 90,
                              child: Text(
                                '${entry.key} :',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontWeight: DesignTokens.fontWeightSemiBold,
                                      color: DesignTokens.primaryColor,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                entry.value,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],

          // Note
          if (note != null) ...[
            const SizedBox(height: DesignTokens.spaceMD),
            Container(
              padding: const EdgeInsets.all(DesignTokens.spaceMD),
              decoration: BoxDecoration(
                color: DesignTokens.warningColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                border: Border.all(
                  color: DesignTokens.warningColor.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: DesignTokens.warningColor,
                    size: DesignTokens.iconSM,
                  ),
                  const SizedBox(width: DesignTokens.spaceSM),
                  Expanded(
                    child: Text(
                      note,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: DesignTokens.warningColor,
                            fontWeight: DesignTokens.fontWeightMedium,
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
}
