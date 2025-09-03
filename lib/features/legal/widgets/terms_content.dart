import 'package:flutter/material.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/constants/app_constants.dart';

/// Terms and Conditions Content Widget
/// Contains the complete terms and conditions text in French
class TermsContent extends StatelessWidget {
  const TermsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Introduction Section
        _buildSection(
          context,
          title: '1. Introduction',
          content: '''
Bienvenue chez ${AppConstants.appName}. Ces conditions générales d'utilisation (les "Conditions") régissent votre utilisation de notre application mobile de livraison de nourriture et des services associés.

En utilisant notre application, vous acceptez d'être lié par ces Conditions. Si vous n'acceptez pas ces Conditions, veuillez ne pas utiliser notre service.
''',
        ),

        _buildSection(
          context,
          title: '2. Description du Service',
          content: '''
${AppConstants.appName} est une plateforme de livraison de nourriture qui permet aux utilisateurs de :
• Commander des repas auprès de restaurants partenaires
• Suivre leurs commandes en temps réel
• Payer en ligne ou à la livraison
• Gérer leur profil et leurs préférences

Notre mission est de connecter les Camerounais avec les meilleurs restaurants locaux pour une expérience de livraison exceptionnelle.
''',
        ),

        _buildSection(
          context,
          title: '3. Inscription et Compte',
          content: '''
Pour utiliser notre service, vous devez :
• Avoir au moins 18 ans ou obtenir l'autorisation parentale
• Fournir des informations exactes et à jour
• Maintenir la sécurité de votre compte
• Nous informer de toute utilisation non autorisée

Vous êtes responsable de toutes les activités qui se produisent sur votre compte.
''',
        ),

        _buildSection(
          context,
          title: '4. Commandes et Paiements',
          content: '''
Conditions de commande :
• Les prix affichés incluent la TVA le cas échéant
• Les frais de livraison sont clairement indiqués
• Le montant minimum de commande est de ${AppConstants.minimumOrderAmount.toInt()} FCFA
• Les temps de livraison sont estimatifs et peuvent varier

Moyens de paiement acceptés :
• Mobile Money MTN
• Mobile Money Orange
• EU Mobile
• Espèces à la livraison
''',
        ),

        _buildSection(
          context,
          title: '5. Livraison',
          content: '''
Nos services de livraison couvrent actuellement :
• Yaoundé et ses environs
• Douala et ses environs
• D'autres villes seront ajoutées progressivement

Conditions de livraison :
• Délai moyen de livraison : 30-45 minutes
• Frais de livraison standards : ${AppConstants.deliveryFee.toInt()} FCFA
• Livraison gratuite pour commandes supérieures à 10 000 FCFA
• Le client doit être disponible à l'adresse indiquée
''',
        ),

        _buildSection(
          context,
          title: '6. Annulation et Remboursement',
          content: '''
Politique d'annulation :
• Annulation gratuite jusqu'à 5 minutes après validation
• Annulation possible jusqu'à préparation de la commande
• Remboursement intégral en cas d'annulation par le restaurant
• Remboursement sous 3-5 jours ouvrables selon le moyen de paiement

En cas de problème avec votre commande, contactez-nous immédiatement via WhatsApp ou l'application.
''',
        ),

        _buildSection(
          context,
          title: '7. Responsabilité',
          content: '''
${AppConstants.appName} agit en tant qu'intermédiaire entre les utilisateurs et les restaurants. Nous nous efforçons de fournir un service de qualité mais ne pouvons garantir :
• La disponibilité constante de tous les restaurants
• La qualité exacte des produits (responsabilité du restaurant)
• L'exactitude des temps de livraison en cas de force majeure

Notre responsabilité est limitée au montant de la commande concernée.
''',
        ),

        _buildSection(
          context,
          title: '8. Données Personnelles',
          content: '''
Nous respectons votre vie privée et traitons vos données personnelles conformément à notre Politique de Confidentialité.

Données collectées :
• Informations de compte (nom, téléphone, email)
• Adresses de livraison
• Historique des commandes
• Données d'utilisation de l'application

Vos données ne sont jamais vendues à des tiers et sont utilisées uniquement pour améliorer notre service.
''',
        ),

        _buildSection(
          context,
          title: '9. Propriété Intellectuelle',
          content: '''
Tous les contenus de l'application (textes, images, logos, interface) sont protégés par les droits de propriété intellectuelle.

Il est interdit de :
• Copier ou reproduire le contenu sans autorisation
• Utiliser nos marques commerciales
• Modifier ou créer des œuvres dérivées
• Utiliser l'application à des fins commerciales non autorisées
''',
        ),

        _buildSection(
          context,
          title: '10. Modification des Conditions',
          content: '''
Nous nous réservons le droit de modifier ces Conditions à tout moment. Les modifications importantes vous seront notifiées par :
• Notification push dans l'application
• Email à votre adresse enregistrée
• Message lors de votre prochaine connexion

L'utilisation continue de l'application après modification vaut acceptation des nouvelles conditions.
''',
        ),

        _buildSection(
          context,
          title: '11. Contact',
          content: '''
Pour toute question concernant ces Conditions, contactez-nous :

${AppConstants.companyName}
Email : ${AppConstants.companyEmail}
Téléphone : ${AppConstants.companyPhone}
WhatsApp : ${AppConstants.companyWhatsApp}
Adresse : ${AppConstants.companyAddress}

Support client disponible :
• Lundi - Vendredi : 8h00 - 20h00
• Samedi - Dimanche : 9h00 - 18h00
''',
        ),

        _buildSection(
          context,
          title: '12. Dispositions Générales',
          content: '''
Ces Conditions sont régies par le droit camerounais. Tout litige sera soumis aux tribunaux compétents du Cameroun.

Si une disposition de ces Conditions est jugée invalide, les autres dispositions restent en vigueur.

Date de dernière mise à jour : 2 septembre 2025
Version : 1.0
''',
        ),

        const SizedBox(height: DesignTokens.spaceXXL),
        
        // Footer
        Container(
          padding: const EdgeInsets.all(DesignTokens.spaceLG),
          decoration: BoxDecoration(
            color: DesignTokens.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          ),
          child: Column(
            children: [
              const Icon(
                Icons.verified_user,
                size: DesignTokens.iconLG,
                color: DesignTokens.primaryColor,
              ),
              const SizedBox(height: DesignTokens.spaceMD),
              Text(
                'Votre confiance est notre priorité',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: DesignTokens.fontWeightSemiBold,
                  color: DesignTokens.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: DesignTokens.spaceXS),
              Text(
                'Nous nous engageons à respecter ces conditions pour vous offrir le meilleur service possible.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSection(BuildContext context, {
    required String title,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: DesignTokens.spaceLG),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: DesignTokens.fontWeightSemiBold,
              color: DesignTokens.primaryColor,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceSM),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(DesignTokens.spaceMD),
            decoration: BoxDecoration(
              color: DesignTokens.backgroundSecondary,
              borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
              border: Border.all(
                color: DesignTokens.lightGrey,
                width: 1,
              ),
            ),
            child: Text(
              content.trim(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.5,
                color: DesignTokens.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
