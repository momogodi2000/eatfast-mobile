/// Restaurant Manager Navigation Drawer
/// Provides navigation to all restaurant management modules
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:eatfast_mobile/shared/services/auth/providers/unified_auth_provider.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';

class RestaurantManagerDrawer extends ConsumerWidget {
  final String restaurantId;

  const RestaurantManagerDrawer({
    super.key,
    required this.restaurantId,
  });

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
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  DesignTokens.primaryColor,
                  DesignTokens.primaryColor.withValues(alpha: 0.8),
                ],
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: DesignTokens.white,
              child: Icon(
                Icons.restaurant_menu,
                size: 40,
                color: DesignTokens.primaryColor,
              ),
            ),
            accountName: Text(
              user?.name ?? 'Restaurant Manager',
              style: const TextStyle(
                fontWeight: DesignTokens.fontWeightBold,
                fontSize: 18,
                color: DesignTokens.white,
              ),
            ),
            accountEmail: Text(
              user?.email ?? 'manager@eatfast.com',
              style: const TextStyle(
                fontSize: 14,
                color: DesignTokens.white,
              ),
            ),
          ),

          // Navigation Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Dashboard Section
                _buildDrawerItem(
                  context: context,
                  icon: Icons.dashboard,
                  title: 'Tableau de Bord',
                  subtitle: 'Vue d\'ensemble',
                  route: '/restaurant-dashboard/$restaurantId',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/restaurant-dashboard/$restaurantId'),
                ),
                const Divider(),

                // Order Management Section
                _buildSectionHeader('Gestion des Commandes'),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.receipt_long,
                  title: 'Commandes en Direct',
                  subtitle: 'G�rer les commandes',
                  route: '/restaurant-owner/$restaurantId/orders',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/restaurant-owner/$restaurantId/orders'),
                ),
                const Divider(),

                // Menu Management Section
                _buildSectionHeader('Gestion du Menu'),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.restaurant_menu,
                  title: 'Menu',
                  subtitle: 'G�rer les plats',
                  route: '/restaurant-owner/$restaurantId/menu',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/restaurant-owner/$restaurantId/menu'),
                ),
                const Divider(),

                // Analytics Section
                _buildSectionHeader('Analyses & Rapports'),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.analytics,
                  title: 'Analytiques',
                  subtitle: 'Statistiques & rapports',
                  route: '/restaurant-owner/$restaurantId/analytics',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/restaurant-owner/$restaurantId/analytics'),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.trending_up,
                  title: 'Pr�visions',
                  subtitle: 'Demande pr�vue',
                  route: '/restaurant-owner/$restaurantId/forecast',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/restaurant-owner/$restaurantId/forecast'),
                ),
                const Divider(),

                // Financial Section
                _buildSectionHeader('Finances'),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.account_balance_wallet,
                  title: 'Portefeuille',
                  subtitle: 'Solde & transactions',
                  route: '/restaurant-owner/$restaurantId/wallet',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/restaurant-owner/$restaurantId/wallet'),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.monetization_on,
                  title: 'Rapports Financiers',
                  subtitle: 'Revenus & d�penses',
                  route: '/restaurant-owner/$restaurantId/financial-reports',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/restaurant-owner/$restaurantId/financial-reports'),
                ),
                const Divider(),

                // Settings Section
                _buildSectionHeader('Param�tres'),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.store,
                  title: 'Profil Restaurant',
                  subtitle: 'Informations & param�tres',
                  route: '/restaurant-owner/$restaurantId/profile',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/restaurant-owner/$restaurantId/profile'),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.notifications,
                  title: 'Notifications',
                  subtitle: 'Alertes & messages',
                  route: '/restaurant-owner/$restaurantId/notifications',
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, '/restaurant-owner/$restaurantId/notifications'),
                  badge: '3', // TODO: Get real count from provider
                ),
              ],
            ),
          ),

          // Logout Button
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: DesignTokens.errorColor),
            title: const Text(
              'D�connexion',
              style: TextStyle(
                color: DesignTokens.errorColor,
                fontWeight: DesignTokens.fontWeightBold,
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
          fontWeight: DesignTokens.fontWeightBold,
          color: DesignTokens.textSecondary,
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
      selectedTileColor: DesignTokens.primaryColor.withValues(alpha: 0.1),
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(
            icon,
            color: isSelected ? DesignTokens.primaryColor : DesignTokens.textSecondary,
          ),
          if (badge != null)
            Positioned(
              right: -8,
              top: -4,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: DesignTokens.errorColor,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 18,
                  minHeight: 18,
                ),
                child: Text(
                  badge,
                  style: const TextStyle(
                    color: DesignTokens.white,
                    fontSize: 10,
                    fontWeight: DesignTokens.fontWeightBold,
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
          fontWeight: isSelected ? DesignTokens.fontWeightBold : DesignTokens.fontWeightNormal,
          color: isSelected ? DesignTokens.primaryColor : DesignTokens.textPrimary,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: isSelected
            ? DesignTokens.primaryColor.withValues(alpha: 0.7)
            : DesignTokens.textSecondary,
        ),
      ),
      trailing: isSelected
          ? const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: DesignTokens.primaryColor,
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
            title: const Text('D�connexion'),
            content: const Text('�tes-vous s�r de vouloir vous d�connecter?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Annuler'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: DesignTokens.errorColor,
                  foregroundColor: DesignTokens.white,
                ),
                onPressed: () => Navigator.pop(context, true),
                child: const Text('D�connexion'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
