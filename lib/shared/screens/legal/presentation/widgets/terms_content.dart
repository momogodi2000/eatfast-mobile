import 'package:flutter/material.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';
import 'package:eatfast_mobile/shared/constants/app_constants.dart';

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
                      'Conditions G�n�rales d\'Utilisation',
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
              'Les pr�sentes Conditions G�n�rales d\'Utilisation (CGU) r�gissent l\'utilisation de l\'application mobile ${AppConstants.appName}, �dit�e par ${AppConstants.companyName}, soci�t� de droit camerounais, dont le si�ge social est situ� � ${AppConstants.companyAddress}.\n\nCes CGU d�finissent les droits et obligations de chaque partie dans le cadre de l\'utilisation de nos services de livraison de nourriture.',
        ),

        _buildSection(
          context,
          icon: Icons.check_circle_outline,
          title: '2. Acceptation des Conditions',
          content:
              'En t�l�chargeant, installant ou utilisant l\'application ${AppConstants.appName}, vous acceptez express�ment et sans r�serve les pr�sentes conditions g�n�rales d\'utilisation.\n\nSi vous n\'acceptez pas ces conditions, veuillez ne pas utiliser l\'application. L\'utilisation continue de l\'application vaut acceptation des modifications �ventuelles des pr�sentes CGU.',
        ),

        _buildSection(
          context,
          icon: Icons.restaurant_menu,
          title: '3. Description du Service',
          content:
              '${AppConstants.appName} est une plateforme de mise en relation entre utilisateurs et restaurants partenaires au Cameroun. Notre service comprend :',
          bulletPoints: [
            'Navigation et d�couverte de restaurants locaux et internationaux',
            'Consultation des menus et tarifs en temps r�el',
            'Commande de plats en ligne de mani�re s�curis�e',
            'Paiement via Mobile Money (MTN, Orange), EU Mobile ou esp�ces',
            'Suivi de commande et livraison en temps r�el',
            'Service client disponible et r�actif',
            'Programme de fid�lit� et promotions exclusives',
          ],
        ),

        _buildSection(
          context,
          icon: Icons.person_add,
          title: '4. Inscription et Compte Utilisateur',
          content:
              'Pour utiliser ${AppConstants.appName}, vous devez cr�er un compte personnel en fournissant des informations exactes, compl�tes et � jour.',
          bulletPoints: [
            'Fournir une adresse email valide et un num�ro de t�l�phone',
            'Cr�er un mot de passe s�curis� (minimum 6 caract�res)',
            'Maintenir la confidentialit� de vos identifiants',
            'Informer imm�diatement ${AppConstants.appName} en cas d\'utilisation non autoris�e',
            'Ne pas cr�er plusieurs comptes pour une m�me personne',
            'Mettre � jour vos informations personnelles r�guli�rement',
          ],
        ),

        _buildSection(
          context,
          icon: Icons.shopping_cart,
          title: '5. Commandes et Paiements',
          content:
              'En passant une commande via ${AppConstants.appName}, vous vous engagez � :',
          bulletPoints: [
            'Fournir des informations de livraison compl�tes et exactes',
            'Effectuer le paiement selon les modalit�s propos�es dans l\'application',
            '�tre pr�sent ou disponible � l\'adresse de livraison au moment convenu',
            'V�rifier votre commande � la r�ception',
            'Respecter les conditions d\'annulation d�finies ci-dessous',
            'Payer le montant total incluant les frais de livraison',
          ],
        ),

        _buildSection(
          context,
          icon: Icons.cancel_outlined,
          title: '6. Politique d\'Annulation et de Remboursement',
          content: 'Les commandes peuvent �tre annul�es selon les conditions suivantes :',
          bulletPoints: [
            'Annulation gratuite dans les 2 minutes suivant la confirmation',
            'Annulation avec frais de 20% avant la pr�paration du plat',
            'Frais de 50% si la pr�paration a commenc�',
            'Aucun remboursement si le plat est en cours de livraison',
            'Remboursement complet en cas de probl�me de qualit� justifi�',
            'D�lai de remboursement : 5 � 7 jours ouvr�s',
          ],
        ),

        _buildSection(
          context,
          icon: Icons.delivery_dining,
          title: '7. Livraison',
          content: 'Nos services de livraison sont soumis aux conditions suivantes :',
          bulletPoints: [
            'Zone de livraison : Principales villes du Cameroun (Yaound�, Douala, etc.)',
            'Frais de livraison : Variables selon la distance et le restaurant',
            'D�lai de livraison estim� : ${AppConstants.estimatedDeliveryTime} � 45 minutes',
            'Commande minimum : ${AppConstants.minimumOrderAmount.toInt()} FCFA',
            'Les d�lais peuvent varier selon la circulation et la m�t�o',
            'Le livreur vous contactera en cas de difficult� � trouver l\'adresse',
          ],
        ),

        _buildSection(
          context,
          icon: Icons.security,
          title: '8. Protection des Donn�es Personnelles',
          content:
              'Nous nous engageons � prot�ger vos donn�es personnelles conform�ment aux lois camerounaises et internationales en vigueur. Vos donn�es sont utilis�es exclusivement pour :',
          bulletPoints: [
            'Traiter et suivre vos commandes',
            'Am�liorer la qualit� de nos services',
            'Vous contacter concernant vos commandes',
            'Envoyer des promotions et offres (avec votre consentement pr�alable)',
            'Assurer la s�curit� et pr�venir les fraudes',
            'Respecter nos obligations l�gales et r�glementaires',
          ],
        ),

        _buildSection(
          context,
          icon: Icons.copyright,
          title: '9. Propri�t� Intellectuelle',
          content:
              'L\'application ${AppConstants.appName}, son contenu (textes, images, logos, vid�os), ses fonctionnalit�s, son design et sa technologie sont la propri�t� exclusive de ${AppConstants.companyName} et sont prot�g�s par les lois sur la propri�t� intellectuelle.\n\nToute reproduction, repr�sentation, modification, publication ou adaptation non autoris�e est strictement interdite.',
        ),

        _buildSection(
          context,
          icon: Icons.warning_amber,
          title: '10. Responsabilit� et Limitations',
          content:
              '${AppConstants.companyName} s\'efforce de fournir un service de qualit� optimale mais ne peut garantir :',
          bulletPoints: [
            'La disponibilit� continue et ininterrompue de l\'application',
            'L\'exactitude absolue de toutes les informations fournies par les restaurants',
            'Le respect des d�lais de livraison en cas de force majeure',
            'La qualit� des plats pr�par�s par les restaurants partenaires',
            'L\'absence totale d\'erreurs techniques ou de bugs',
          ],
        ),

        _buildSection(
          context,
          icon: Icons.block,
          title: '11. Interdictions et Sanctions',
          content: 'Il est strictement interdit de :',
          bulletPoints: [
            'Utiliser l\'application � des fins ill�gales ou frauduleuses',
            'Cr�er de faux comptes ou usurper l\'identit� d\'autrui',
            'Tenter de contourner les syst�mes de s�curit�',
            'Diffuser des virus ou codes malveillants',
            'Harceler, menacer ou insulter le personnel ou les livreurs',
            'Abuser des annulations ou demandes de remboursement',
          ],
          note:
              'Toute violation de ces r�gles peut entra�ner la suspension ou la fermeture d�finitive de votre compte.',
        ),

        _buildSection(
          context,
          icon: Icons.edit_note,
          title: '12. Modification des Conditions',
          content:
              'Nous nous r�servons le droit de modifier ces conditions g�n�rales d\'utilisation � tout moment pour refl�ter les changements de nos services, de la l�gislation ou pour am�liorer l\'exp�rience utilisateur.\n\nLes modifications entreront en vigueur d�s leur publication dans l\'application. Nous vous informerons des modifications importantes par email ou notification push.',
        ),

        _buildSection(
          context,
          icon: Icons.contact_mail,
          title: '13. Contact et Support',
          content:
              'Pour toute question, r�clamation ou information concernant ces conditions g�n�rales d\'utilisation ou nos services, vous pouvez nous contacter :',
          contactInfo: {
            'Email': AppConstants.companyEmail,
            'T�l�phone': AppConstants.companyPhone,
            'WhatsApp': AppConstants.companyWhatsApp,
            'Adresse': AppConstants.companyAddress,
          },
          note: 'Notre service client est disponible du lundi au dimanche de 8h � 22h.',
        ),

        _buildSection(
          context,
          icon: Icons.gavel_outlined,
          title: '14. Droit Applicable et Juridiction',
          content:
              'Les pr�sentes conditions g�n�rales d\'utilisation sont r�gies et interpr�t�es conform�ment au droit camerounais.\n\nTout litige relatif � l\'interpr�tation ou � l\'ex�cution des pr�sentes sera soumis, � d�faut de r�glement amiable, � la comp�tence exclusive des tribunaux de Yaound�, Cameroun.',
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
                    'Derni�re mise � jour',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: DesignTokens.fontWeightBold,
                          color: DesignTokens.infoColor,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: DesignTokens.spaceSM),
              Text(
                'Ces conditions g�n�rales d\'utilisation ont �t� mises � jour le 10 janvier 2025.',
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
                '� 2025 ${AppConstants.companyName}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: DesignTokens.textTertiary,
                    ),
              ),
              const SizedBox(height: DesignTokens.spaceXS),
              Text(
                'Tous droits r�serv�s',
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
