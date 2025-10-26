/// Client Navigation Drawer
/// Provides easy navigation to all client functionality modules
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:eatfast_mobile/shared/services/auth/providers/unified_auth_provider.dart';
import 'package:eatfast_mobile/shared/config/router/route_names.dart';

class ClientDrawer extends ConsumerWidget {
  const ClientDrawer({super.key});

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
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withValues(alpha: 0.7),
                ],
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: user?.avatar != null ? NetworkImage(user!.avatar!) : null,
              child: user?.avatar == null
                  ? Text(
                      user?.firstName?.substring(0, 1).toUpperCase() ?? 'C',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : null,
            ),
            accountName: Text(
              user?.fullName ?? 'Client',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            accountEmail: Text(
              user?.email ?? 'client@eatfast.com',
              style: const TextStyle(fontSize: 14),
            ),
            otherAccountsPictures: [
              // Loyalty Tier Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.stars, size: 16, color: Colors.white),
                    const SizedBox(width: 4),
                    Text(
                      user?.loyaltyTier.toUpperCase() ?? 'BRONZE',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
                  route: RouteNames.clientDashboard,
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, RouteNames.clientDashboard),
                ),
                const Divider(),

                // Orders Section
                _buildSectionHeader('Commandes'),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.restaurant_menu,
                  title: 'Explorer Restaurants',
                  subtitle: 'D�couvrir & Commander',
                  route: RouteNames.restaurants,
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, RouteNames.restaurants),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.shopping_cart,
                  title: 'Mon Panier',
                  subtitle: 'Articles en cours',
                  route: RouteNames.cart,
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, RouteNames.cart),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.history,
                  title: 'Historique Commandes',
                  subtitle: 'Toutes mes commandes',
                  route: RouteNames.orderHistory,
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, RouteNames.orderHistory),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.local_shipping,
                  title: 'Suivi Livraison',
                  subtitle: 'Suivre en temps r�el',
                  route: RouteNames.orderTracking,
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, RouteNames.orderTracking),
                ),
                const Divider(),

                // Favorites & Loyalty Section
                _buildSectionHeader('R�compenses'),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.favorite,
                  title: 'Mes Favoris',
                  subtitle: 'Restaurants pr�f�r�s',
                  route: RouteNames.favorites,
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, RouteNames.favorites),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.stars,
                  title: 'Programme Fid�lit�',
                  subtitle: '${user?.loyaltyPoints ?? 0} points',
                  route: RouteNames.loyalty,
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, RouteNames.loyalty),
                  badge: user?.loyaltyPoints.toString(),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.local_offer,
                  title: 'Promotions',
                  subtitle: 'Offres & R�ductions',
                  route: RouteNames.promotions,
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, RouteNames.promotions),
                ),
                const Divider(),

                // Wallet & Payments Section
                _buildSectionHeader('Finance'),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.account_balance_wallet,
                  title: 'Mon Portefeuille',
                  subtitle: 'G�rer mon solde',
                  route: RouteNames.wallet,
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, RouteNames.wallet),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.payment,
                  title: 'Moyens de Paiement',
                  subtitle: 'Cartes & comptes',
                  route: RouteNames.paymentMethods,
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, RouteNames.paymentMethods),
                ),
                const Divider(),

                // Profile Section
                _buildSectionHeader('Profil'),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.person,
                  title: 'Mon Profil',
                  subtitle: 'Informations personnelles',
                  route: RouteNames.profile,
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, RouteNames.profile),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.location_on,
                  title: 'Mes Adresses',
                  subtitle: 'Livraison & facturation',
                  route: RouteNames.addresses,
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, RouteNames.addresses),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.settings,
                  title: 'Param�tres',
                  subtitle: 'Configuration',
                  route: RouteNames.settings,
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, RouteNames.settings),
                ),
                const Divider(),

                // Help & Support Section
                _buildSectionHeader('Aide'),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.support_agent,
                  title: 'Support Client',
                  subtitle: 'Besoin d\'aide?',
                  route: RouteNames.support,
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, RouteNames.support),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.info,
                  title: '� propos',
                  subtitle: 'EatFast',
                  route: RouteNames.aboutUs,
                  currentRoute: currentRoute,
                  onTap: () => _navigateTo(context, RouteNames.aboutUs),
                ),
              ],
            ),
          ),

          // Logout Button
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              'D�connexion',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () async {
              final shouldLogout = await _showLogoutConfirmation(context);
              if (shouldLogout && context.mounted) {
                await ref.read(authProvider.notifier).logout();
                if (context.mounted) {
                  context.go('/login');
                }
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
      selectedTileColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(
            icon,
            color: isSelected ? Theme.of(context).primaryColor : Colors.grey[700],
          ),
          if (badge != null && badge.isNotEmpty)
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
                  badge.length > 2 ? '99+' : badge,
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
          color: isSelected ? Theme.of(context).primaryColor : Colors.black87,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: isSelected ? Theme.of(context).primaryColor.withValues(alpha: 0.7) : Colors.grey[600],
        ),
      ),
      trailing: isSelected
          ? Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Theme.of(context).primaryColor,
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
                  backgroundColor: Colors.red,
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

