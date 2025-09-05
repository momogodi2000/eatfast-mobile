import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/auth/providers/auth_provider.dart';
import '../../../../core/router/route_names.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        children: [
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
                            (user.name ?? user.email)
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
                          user.name ?? user.email,
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
                                'Compte vérifié',
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
            subtitle: 'Gérer vos informations personnelles',
            onTap: () => context.push(RouteNames.editProfile),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.lock,
            title: 'Sécurité',
            subtitle: 'Mot de passe et authentification',
            onTap: () => _showComingSoonSnackBar(context),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.privacy_tip,
            title: 'Confidentialité',
            subtitle: 'Contrôlez vos données personnelles',
            onTap: () => _showComingSoonSnackBar(context),
          ),

          const Divider(),

          // App Settings Section
          _buildSectionHeader('Application'),
          _buildSettingsTile(
            context,
            icon: Icons.language,
            title: 'Langue',
            subtitle: 'Français (par défaut)',
            onTap: () => context.push(RouteNames.languageSettings),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.notifications,
            title: 'Notifications',
            subtitle: 'Gérer les alertes et les rappels',
            onTap: () => _showComingSoonSnackBar(context),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.dark_mode,
            title: 'Thème',
            subtitle: 'Clair / Sombre',
            onTap: () => _showComingSoonSnackBar(context),
          ),

          const Divider(),

          // Payment & Delivery Section
          _buildSectionHeader('Paiement & Livraison'),
          _buildSettingsTile(
            context,
            icon: Icons.payment,
            title: 'Méthodes de paiement',
            subtitle: 'Gérer vos cartes et comptes',
            onTap: () => _showComingSoonSnackBar(context),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.location_on,
            title: 'Adresses de livraison',
            subtitle: 'Gérer vos adresses favorites',
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
            title: 'À propos',
            subtitle: 'Informations sur l\'application',
            onTap: () => context.push(RouteNames.aboutUs),
          ),

          const Divider(),

          // Legal Section
          _buildSectionHeader('Légal'),
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
            title: 'Politique de confidentialité',
            subtitle: 'Comment nous utilisons vos données',
            onTap: () => _showComingSoonSnackBar(context),
          ),

          const Divider(),

          // Dangerous Actions Section
          _buildSectionHeader('Zone dangereuse', textColor: Colors.red),
          _buildSettingsTile(
            context,
            icon: Icons.exit_to_app,
            title: 'Se déconnecter',
            subtitle: 'Quitter votre session actuelle',
            textColor: Colors.red,
            onTap: () => _showLogoutDialog(context, ref),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.delete_forever,
            title: 'Supprimer le compte',
            subtitle: 'Effacer définitivement votre compte',
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
                  '© 2024 EatFast Cameroun',
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
        content: Text('Fonctionnalité bientôt disponible'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Déconnexion'),
        content: const Text('Êtes-vous sûr de vouloir vous déconnecter?'),
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
            child: const Text('Se déconnecter'),
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
          'Cette action est irréversible. Toutes vos données seront définitivement supprimées.',
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
