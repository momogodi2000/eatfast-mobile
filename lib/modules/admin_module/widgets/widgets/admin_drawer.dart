/// Admin Navigation Drawer
/// Provides easy navigation to all admin functionality modules
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:eatfast_mobile/shared/services/auth/providers/unified_auth_provider.dart';

class AdminDrawer extends ConsumerWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;
    final currentRoute = GoRouterState.of(context).uri.toString();

    return Drawer(
      child: Column(
        children: [
          // Drawer Header
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.deepPurple,
                  Colors.purple,
                ],
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                user?.name.substring(0, 1).toUpperCase() ?? 'A',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            accountName: Text(
              user?.name ?? 'Administrateur',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            accountEmail: Text(
              user?.email ?? 'admin@eatfast.com',
              style: const TextStyle(fontSize: 14),
            ),
          ),

          // Navigation Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  context: context,
                  icon: Icons.dashboard,
                  title: 'Tableau de Bord',
                  subtitle: 'Vue d\'ensemble',
                  route: '/admin',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/admin'),
                ),
                const Divider(),

                // User Management Section
                _buildSectionHeader('Gestion Utilisateurs'),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.people,
                  title: 'Utilisateurs',
                  subtitle: 'Gérer les comptes',
                  route: '/admin/users',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/admin/users'),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.person_add,
                  title: 'Nouveau Utilisateur',
                  subtitle: 'Créer un compte',
                  route: '/admin/users/create',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/admin/users/create'),
                ),
                const Divider(),

                // Restaurant Management Section
                _buildSectionHeader('Gestion Restaurants'),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.restaurant,
                  title: 'Restaurants',
                  subtitle: 'Tous les restaurants',
                  route: '/admin/restaurants',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/admin/restaurants'),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.pending_actions,
                  title: 'En Attente',
                  subtitle: 'Validation requise',
                  route: '/admin/restaurants/pending',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/admin/restaurants/pending'),
                  badge: '3', // TODO: Get real count from provider
                ),
                const Divider(),

                // Order Management Section
                _buildSectionHeader('Gestion Commandes'),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.shopping_bag,
                  title: 'Commandes',
                  subtitle: 'Toutes les commandes',
                  route: '/admin/orders',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/admin/orders'),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.local_shipping,
                  title: 'Livraisons en Direct',
                  subtitle: 'Suivi temps réel',
                  route: '/admin/live-tracking',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/admin/live-tracking'),
                ),
                const Divider(),

                // Financial Section
                _buildSectionHeader('Finances'),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.analytics,
                  title: 'Rapports Financiers',
                  subtitle: 'Revenus & statistiques',
                  route: '/admin/financial-reports',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/admin/financial-reports'),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.account_balance_wallet,
                  title: 'Paiements',
                  subtitle: 'Transactions',
                  route: '/admin/payments',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/admin/payments'),
                ),
                const Divider(),

                // Support Section
                _buildSectionHeader('Support'),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.support_agent,
                  title: 'Tickets',
                  subtitle: 'Support client',
                  route: '/admin/support',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/admin/support'),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.message,
                  title: 'WhatsApp',
                  subtitle: 'Gestion messages',
                  route: '/admin/whatsapp',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/admin/whatsapp'),
                ),
                const Divider(),

                // Marketing Section
                _buildSectionHeader('Marketing'),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.campaign,
                  title: 'Campagnes',
                  subtitle: 'Marketing',
                  route: '/admin/marketing',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/admin/marketing'),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.email,
                  title: 'Newsletter',
                  subtitle: 'Abonnés',
                  route: '/admin/newsletter',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/admin/newsletter'),
                ),
                const Divider(),

                // System Section
                _buildSectionHeader('Système'),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.settings,
                  title: 'Paramètres',
                  subtitle: 'Configuration',
                  route: '/admin/settings',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/admin/settings'),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.map,
                  title: 'Zones de Livraison',
                  subtitle: 'Gérer les zones',
                  route: '/admin/delivery-zones',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/admin/delivery-zones'),
                ),
              ],
            ),
          ),

          // Logout Button
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              'Déconnexion',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () async {
              final shouldLogout = await _showLogoutConfirmation(context);
              if (shouldLogout && context.mounted) {
                await ref.read(authProvider.notifier).logout();
              }
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required String route,
    required String currentRoute,
    required VoidCallback onTap,
    String? badge,
  }) {
    final isSelected = currentRoute == route;

    return ListTile(
      selected: isSelected,
      selectedTileColor: Colors.deepPurple.withValues(alpha: 0.1),
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.deepPurple : Colors.grey[700],
          ),
          if (badge != null)
            Positioned(
              right: -8,
              top: -4,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 18,
                  minHeight: 18,
                ),
                child: Text(
                  badge,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? Colors.deepPurple : Colors.black87,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: isSelected ? Colors.deepPurple[300] : Colors.grey[600],
        ),
      ),
      trailing: isSelected
          ? const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.deepPurple,
            )
          : null,
      onTap: onTap,
    );
  }

  void _navigateTo(BuildContext context, String route) {
    Navigator.pop(context); // Close drawer
    final currentRoute = GoRouterState.of(context).uri.toString();
    if (currentRoute != route) {
      context.go(route);
    }
  }

  Future<bool> _showLogoutConfirmation(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Déconnexion'),
            content: const Text('Êtes-vous sûr de vouloir vous déconnecter?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Annuler'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Déconnexion'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
