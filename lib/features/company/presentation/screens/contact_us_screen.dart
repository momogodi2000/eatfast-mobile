import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/design_tokens.dart';

/// Contact Us Screen
class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: const Text('Contactez-nous'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(DesignTokens.spaceLG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Nous sommes là pour vous aider',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: DesignTokens.fontWeightBold,
                ),
              ),
              
              const SizedBox(height: DesignTokens.spaceXS),
              
              Text(
                'N\'hésitez pas à nous contacter pour toute question ou suggestion',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: DesignTokens.textSecondary,
                ),
              ),
              
              const SizedBox(height: DesignTokens.spaceXXL),
              
              // Contact Methods
              _buildContactMethod(
                context,
                icon: Icons.phone_outlined,
                title: 'Téléphone',
                subtitle: AppConstants.companyPhone,
                onTap: () => _launchPhone(AppConstants.companyPhone),
              ),
              
              const SizedBox(height: DesignTokens.spaceMD),
              
              _buildContactMethod(
                context,
                icon: Icons.email_outlined,
                title: 'Email',
                subtitle: AppConstants.companyEmail,
                onTap: () => _launchEmail(AppConstants.companyEmail),
              ),
              
              const SizedBox(height: DesignTokens.spaceMD),
              
              _buildContactMethod(
                context,
                icon: Icons.chat_outlined,
                title: 'WhatsApp',
                subtitle: AppConstants.companyWhatsApp,
                onTap: () => _launchWhatsApp(AppConstants.companyWhatsApp),
              ),
              
              const SizedBox(height: DesignTokens.spaceMD),
              
              _buildContactMethod(
                context,
                icon: Icons.location_on_outlined,
                title: 'Adresse',
                subtitle: AppConstants.companyAddress,
                onTap: () => _launchMaps(AppConstants.companyAddress),
              ),
              
              const SizedBox(height: DesignTokens.spaceXXL),
              
              // Social Media
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(DesignTokens.spaceLG),
                decoration: BoxDecoration(
                  color: DesignTokens.lightGrey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
                ),
                child: Column(
                  children: [
                    Text(
                      'Suivez-nous sur les réseaux sociaux',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: DesignTokens.fontWeightSemiBold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: DesignTokens.spaceMD),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSocialButton(
                          context,
                          icon: Icons.facebook,
                          label: 'Facebook',
                          color: const Color(0xFF1877F2),
                          onTap: () => _launchUrl(AppConstants.facebookUrl),
                        ),
                        _buildSocialButton(
                          context,
                          icon: Icons.camera_alt_outlined,
                          label: 'Instagram',
                          color: const Color(0xFFE4405F),
                          onTap: () => _launchUrl(AppConstants.instagramUrl),
                        ),
                        _buildSocialButton(
                          context,
                          icon: Icons.alternate_email,
                          label: 'Twitter',
                          color: const Color(0xFF1DA1F2),
                          onTap: () => _launchUrl(AppConstants.twitterUrl),
                        ),
                        _buildSocialButton(
                          context,
                          icon: Icons.business,
                          label: 'LinkedIn',
                          color: const Color(0xFF0A66C2),
                          onTap: () => _launchUrl(AppConstants.linkedinUrl),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: DesignTokens.spaceXXL),
              
              // Operating Hours
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(DesignTokens.spaceLG),
                decoration: BoxDecoration(
                  color: DesignTokens.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Heures d\'ouverture',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: DesignTokens.fontWeightSemiBold,
                        color: DesignTokens.primaryColor,
                      ),
                    ),
                    
                    const SizedBox(height: DesignTokens.spaceMD),
                    
                    _buildOperatingHour('Lundi - Vendredi', '08:00 - 22:00'),
                    _buildOperatingHour('Samedi', '09:00 - 23:00'),
                    _buildOperatingHour('Dimanche', '10:00 - 21:00'),
                  ],
                ),
              ),
              
              const SizedBox(height: DesignTokens.spaceXXL),
              
              // FAQ Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Navigate to FAQ or show bottom sheet with FAQ
                    _showFAQ(context);
                  },
                  icon: const Icon(Icons.help_outline),
                  label: const Text('Questions Fréquentes (FAQ)'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactMethod(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: DesignTokens.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          ),
          child: Icon(
            icon,
            color: DesignTokens.primaryColor,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: DesignTokens.fontWeightSemiBold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(
                color: color.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
        ),
        const SizedBox(height: DesignTokens.spaceXS),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildOperatingHour(String day, String hours) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DesignTokens.spaceXS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(day),
          Text(
            hours,
            style: const TextStyle(
              fontWeight: DesignTokens.fontWeightSemiBold,
            ),
          ),
        ],
      ),
    );
  }

  void _launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  void _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Contact depuis l\'app EatFast',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  void _launchWhatsApp(String phoneNumber) async {
    final Uri whatsappUri = Uri.parse('https://wa.me/${phoneNumber.replaceAll('+', '').replaceAll(' ', '')}');
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    }
  }

  void _launchMaps(String address) async {
    final Uri mapsUri = Uri.parse('https://maps.google.com/?q=$address');
    if (await canLaunchUrl(mapsUri)) {
      await launchUrl(mapsUri);
    }
  }

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _showFAQ(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.all(DesignTokens.spaceLG),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Questions Fréquentes',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: DesignTokens.fontWeightBold,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceLG),
            Expanded(
              child: ListView(
                children: const [
                  ExpansionTile(
                    title: Text('Comment passer une commande ?'),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Vous pouvez passer votre commande directement via l\'application. Choisissez vos plats, ajoutez-les au panier et procédez au paiement.'),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text('Quels sont les modes de paiement acceptés ?'),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Nous acceptons Mobile Money (MTN, Orange), EU Mobile et les paiements en espèces à la livraison.'),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text('Quel est le délai de livraison ?'),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Le délai moyen de livraison est de 30 minutes, selon votre localisation et la disponibilité des plats.'),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text('Livrez-vous partout à Yaoundé ?'),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Nous livrons dans la plupart des quartiers de Yaoundé. Vérifiez la disponibilité de la livraison lors de la commande.'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
