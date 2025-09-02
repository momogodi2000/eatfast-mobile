import 'package:flutter/material.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/constants/app_constants.dart';

/// Widget containing the terms and conditions content
class TermsContent extends StatelessWidget {
  const TermsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection(
            context,
            'Objet',
            'Les présentes conditions générales d\'utilisation (CGU) régissent l\'utilisation de l\'application mobile ${AppConstants.appName}, éditée par ${AppConstants.companyName}.',
          ),
          
          _buildSection(
            context,
            'Acceptation des conditions',
            'En téléchargeant, installant ou utilisant l\'application ${AppConstants.appName}, vous acceptez expressément les présentes conditions générales d\'utilisation. Si vous n\'acceptez pas ces conditions, veuillez ne pas utiliser l\'application.',
          ),
          
          _buildSection(
            context,
            'Description du service',
            '${AppConstants.appName} est une application de livraison de nourriture qui permet aux utilisateurs de commander des plats auprès de restaurants partenaires au Cameroun. Notre service inclut :\n\n• Navigation et sélection de restaurants\n• Commande de plats en ligne\n• Paiement sécurisé\n• Suivi de livraison en temps réel\n• Service client dédié',
          ),
          
          _buildSection(
            context,
            'Inscription et compte utilisateur',
            'Pour utiliser ${AppConstants.appName}, vous devez créer un compte en fournissant des informations exactes et complètes. Vous êtes responsable de :\n\n• La confidentialité de vos identifiants de connexion\n• Toutes les activités qui se déroulent sous votre compte\n• La mise à jour de vos informations personnelles',
          ),
          
          _buildSection(
            context,
            'Commandes et paiements',
            'En passant une commande via ${AppConstants.appName}, vous vous engagez à :\n\n• Fournir des informations de livraison exactes\n• Effectuer le paiement selon les modalités proposées\n• Être présent à l\'adresse de livraison au moment convenu\n• Respecter les conditions d\'annulation',
          ),
          
          _buildSection(
            context,
            'Politique d\'annulation',
            'Les commandes peuvent être annulées :\n\n• Gratuitement dans les 2 minutes suivant la confirmation\n• Avec des frais réduits avant la préparation du plat\n• Des frais complets peuvent s\'appliquer si la préparation a commencé',
          ),
          
          _buildSection(
            context,
            'Livraison',
            'Nos services de livraison sont soumis aux conditions suivantes :\n\n• Zone de livraison limitée aux grandes villes du Cameroun\n• Frais de livraison variables selon la distance\n• Délai de livraison estimatif de ${AppConstants.estimatedDeliveryTime} minutes\n• Commande minimum de ${AppConstants.minimumOrderAmount.toInt()} FCFA',
          ),
          
          _buildSection(
            context,
            'Protection des données personnelles',
            'Nous nous engageons à protéger vos données personnelles conformément aux lois camerounaises en vigueur. Vos données sont utilisées uniquement pour :\n\n• Traiter vos commandes\n• Améliorer notre service\n• Vous contacter concernant vos commandes\n• Envoyer des promotions (avec votre consentement)',
          ),
          
          _buildSection(
            context,
            'Propriété intellectuelle',
            'L\'application ${AppConstants.appName}, son contenu, ses fonctionnalités et sa technologie sont la propriété exclusive de ${AppConstants.companyName} et sont protégés par les lois sur la propriété intellectuelle.',
          ),
          
          _buildSection(
            context,
            'Responsabilité',
            '${AppConstants.companyName} s\'efforce de fournir un service de qualité mais ne peut garantir :\n\n• La disponibilité continue de l\'application\n• L\'exactitude de toutes les informations des restaurants\n• Le respect des délais de livraison en cas de force majeure',
          ),
          
          _buildSection(
            context,
            'Modification des conditions',
            'Nous nous réservons le droit de modifier ces conditions générales d\'utilisation à tout moment. Les modifications entreront en vigueur dès leur publication dans l\'application.',
          ),
          
          _buildSection(
            context,
            'Contact',
            'Pour toute question concernant ces conditions générales d\'utilisation, vous pouvez nous contacter :\n\n• Email : ${AppConstants.companyEmail}\n• Téléphone : ${AppConstants.companyPhone}\n• Adresse : ${AppConstants.companyAddress}',
          ),
          
          _buildSection(
            context,
            'Droit applicable',
            'Les présentes conditions générales d\'utilisation sont soumises au droit camerounais. Tout litige sera soumis à la compétence des tribunaux de Yaoundé.',
          ),
          
          const SizedBox(height: DesignTokens.spaceXL),
          
          Container(
            padding: const EdgeInsets.all(DesignTokens.spaceMD),
            decoration: BoxDecoration(
              color: DesignTokens.lightGrey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dernière mise à jour',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: DesignTokens.fontWeightSemiBold,
                  ),
                ),
                const SizedBox(height: DesignTokens.spaceXS),
                Text(
                  'Ces conditions générales d\'utilisation ont été mises à jour le 1er septembre 2025.',
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

  Widget _buildSection(BuildContext context, String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: DesignTokens.spaceLG),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: DesignTokens.fontWeightBold,
              color: DesignTokens.primaryColor,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.6,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
