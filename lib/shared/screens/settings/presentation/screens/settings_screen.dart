import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';
import 'package:eatfast_mobile/shared/themes/theme_provider.dart';
import 'package:eatfast_mobile/shared/services/auth/providers/unified_auth_provider.dart';
import 'package:eatfast_mobile/shared/config/router/route_names.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Param�tres'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        children: [
          // Guest Authentication Section
          if (user == null) ...[
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: DesignTokens.primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bienvenue !',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: DesignTokens.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Connectez-vous pour acc�der � toutes les fonctionnalit�s',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => context.push(RouteNames.login),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: DesignTokens.primaryColor,
                            foregroundColor: DesignTokens.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text('Se connecter'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => context.push(RouteNames.register),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: DesignTokens.primaryColor),
                            foregroundColor: DesignTokens.primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text('S\'inscrire'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
          ],

          // User Info Section
          if (user != null)
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: DesignTokens.primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: DesignTokens.primaryColor.withValues(alpha: 0.2),
                    backgroundImage: user.avatar != null
                        ? NetworkImage(user.avatar!)
                        : null,
                    child: user.avatar == null
                        ? Text(
                            (user.name.isNotEmpty ? user.name : user.email)
                                .split(' ')
                                .map((n) => n.isEmpty ? '' : n[0])
                                .take(2)
                                .join()
                                .toUpperCase(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: DesignTokens.primaryColor,
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name.isNotEmpty ? user.name : user.email,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          user.email,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        if (user.isVerified)
                          const Row(
                            children: [
                              Icon(
                                Icons.verified,
                                size: 16,
                                color: Colors.green,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Compte v�rifi�',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          // Account Settings Section
          _buildSectionHeader('Compte'),
          _buildSettingsTile(
            context,
            icon: Icons.person,
            title: 'Modifier le profil',
            subtitle: 'G�rer vos informations personnelles',
            onTap: () => context.push(RouteNames.editProfile),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.lock,
            title: 'S�curit�',
            subtitle: 'Mot de passe et authentification',
            onTap: () => _showComingSoonSnackBar(context),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.privacy_tip,
            title: 'Confidentialit�',
            subtitle: 'Contr�lez vos donn�es personnelles',
            onTap: () => _showComingSoonSnackBar(context),
          ),

          const Divider(),

          // App Settings Section
          _buildSectionHeader('Application'),
          _buildSettingsTile(
            context,
            icon: Icons.language,
            title: 'Langue',
            subtitle: 'Fran�ais (par d�faut)',
            onTap: () => context.push(RouteNames.languageSettings),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.notifications,
            title: 'Notifications',
            subtitle: 'G�rer les alertes et les rappels',
            onTap: () => _showComingSoonSnackBar(context),
          ),
          _buildThemeTile(context, ref),

          const Divider(),

          // Payment & Delivery Section
          _buildSectionHeader('Paiement & Livraison'),
          _buildSettingsTile(
            context,
            icon: Icons.payment,
            title: 'M�thodes de paiement',
            subtitle: 'G�rer vos cartes et comptes',
            onTap: () => _showComingSoonSnackBar(context),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.location_on,
            title: 'Adresses de livraison',
            subtitle: 'G�rer vos adresses favorites',
            onTap: () => _showComingSoonSnackBar(context),
          ),

          const Divider(),

          // Support Section
          _buildSectionHeader('Aide & Support'),
          _buildSettingsTile(
            context,
            icon: Icons.help,
            title: 'Centre d\'aide',
            subtitle: 'FAQ et guides d\'utilisation',
            onTap: () => _showComingSoonSnackBar(context),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.contact_support,
            title: 'Nous contacter',
            subtitle: 'Support client et feedback',
            onTap: () => context.push(RouteNames.contactUs),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.info,
            title: '� propos',
            subtitle: 'Informations sur l\'application',
            onTap: () => context.push(RouteNames.aboutUs),
          ),

          const Divider(),

          // Legal Section
          _buildSectionHeader('L�gal'),
          _buildSettingsTile(
            context,
            icon: Icons.description,
            title: 'Conditions d\'utilisation',
            subtitle: 'Nos termes et conditions',
            onTap: () => context.push(RouteNames.terms),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.policy,
            title: 'Politique de confidentialit�',
            subtitle: 'Comment nous utilisons vos donn�es',
            onTap: () => _showComingSoonSnackBar(context),
          ),

          const Divider(),

          // Dangerous Actions Section
          _buildSectionHeader('Zone dangereuse', textColor: Colors.red),
          _buildSettingsTile(
            context,
            icon: Icons.exit_to_app,
            title: 'Se d�connecter',
            subtitle: 'Quitter votre session actuelle',
            textColor: Colors.red,
            onTap: () => _showLogoutDialog(context, ref),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.delete_forever,
            title: 'Supprimer le compte',
            subtitle: 'Effacer d�finitivement votre compte',
            textColor: Colors.red,
            onTap: () => _showDeleteAccountDialog(context),
          ),

          const SizedBox(height: 32),

          // App Version
          Center(
            child: Column(
              children: [
                Text(
                  'EatFast v1.0.0',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                Text(
                  '� 2024 EatFast Cameroun',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, {Color? textColor}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: textColor ?? Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildThemeTile(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    String themeSubtitle;

    switch (themeState.themeMode) {
      case AppThemeMode.light:
        themeSubtitle = 'Clair';
        break;
      case AppThemeMode.dark:
        themeSubtitle = 'Sombre';
        break;
      case AppThemeMode.system:
        themeSubtitle = 'Automatique (syst�me)';
        break;
    }

    return ListTile(
      leading: Icon(
        Icons.brightness_6,
        color: Colors.grey[700],
      ),
      title: const Text(
        'Th�me',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        themeSubtitle,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.grey,
      ),
      onTap: () => _showThemeDialog(context, ref),
    );
  }

  void _showThemeDialog(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.read(themeProvider).themeMode;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choisir un th�me'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<AppThemeMode>(
              title: const Text('Clair'),
              value: AppThemeMode.light,
              groupValue: currentTheme,
              onChanged: (value) {
                if (value != null) {
                  ref.read(themeProvider.notifier).setLightTheme();
                  Navigator.of(context).pop();
                }
              },
            ),
            RadioListTile<AppThemeMode>(
              title: const Text('Sombre'),
              value: AppThemeMode.dark,
              groupValue: currentTheme,
              onChanged: (value) {
                if (value != null) {
                  ref.read(themeProvider.notifier).setDarkTheme();
                  Navigator.of(context).pop();
                }
              },
            ),
            RadioListTile<AppThemeMode>(
              title: const Text('Automatique (syst�me)'),
              value: AppThemeMode.system,
              groupValue: currentTheme,
              onChanged: (value) {
                if (value != null) {
                  ref.read(themeProvider.notifier).setSystemTheme();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: textColor ?? Colors.grey[700],
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }

  void _showComingSoonSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Fonctionnalit� bient�t disponible'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('D�connexion'),
        content: const Text('�tes-vous s�r de vouloir vous d�connecter?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await ref.read(authProvider.notifier).logout();
              if (context.mounted) {
                context.go('/login');
              }
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('Se d�connecter'),
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Supprimer le compte'),
        content: const Text(
          'Cette action est irr�versible. Toutes vos donn�es seront d�finitivement supprim�es.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Contactez le support pour supprimer votre compte'),
                  backgroundColor: Colors.orange,
                ),
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }
}
