/// Admin Dashboard Screen
/// Production-ready admin interface for user management and system monitoring
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:eatfast_mobile/shared/services/auth/providers/unified_auth_provider.dart';
import '../providers/admin_dashboard_provider.dart';
import '../widgets/admin_drawer.dart';

class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;
    final dashboardState = ref.watch(adminDashboardProvider);

    return Scaffold(
      drawer: const AdminDrawer(),
      appBar: AppBar(
        title: const Text('Tableau de Bord Admin'),
        backgroundColor: Colors.deepPurple,
        actions: [
          if (dashboardState.isRefreshing)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                ref.read(adminDashboardProvider.notifier).refreshDashboardStats();
              },
              tooltip: 'Actualiser',
            ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Navigate to notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final authNotifier = ref.read(authProvider.notifier);
              await authNotifier.logout();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.deepPurple,
                      child: Text(
                        user?.name.substring(0, 1).toUpperCase() ?? 'A',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bienvenue, ${user?.name ?? 'Admin'}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            user?.email ?? 'admin@eatfast.com',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Administrateur',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.deepPurple[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Statistics Overview
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Aper�u Statistiques',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (dashboardState.lastUpdated != null)
                  Text(
                    'Derni�re MAJ: ${_formatTime(dashboardState.lastUpdated!)}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),

            // Show loading or error state
            if (dashboardState.isLoading && dashboardState.stats == null)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (dashboardState.error != null && dashboardState.stats == null)
              Card(
                color: Colors.red[50],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.error, color: Colors.red),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Erreur de chargement',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              dashboardState.error!,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          ref.read(adminDashboardProvider.notifier).loadDashboardStats();
                        },
                        child: const Text('R�essayer'),
                      ),
                    ],
                  ),
                ),
              )
            else if (dashboardState.stats != null)
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.5,
                children: [
                  _buildStatCard(
                    'Utilisateurs',
                    '${dashboardState.stats!.totalUsers}',
                    Icons.people,
                    Colors.blue,
                    subtitle: '${dashboardState.stats!.activeUsers} actifs',
                  ),
                  _buildStatCard(
                    'Commandes',
                    '${dashboardState.stats!.todayOrders}',
                    Icons.shopping_bag,
                    Colors.green,
                    subtitle: 'Aujourd\'hui',
                  ),
                  _buildStatCard(
                    'Restaurants',
                    '${dashboardState.stats!.totalRestaurants}',
                    Icons.restaurant,
                    Colors.orange,
                    subtitle: '${dashboardState.stats!.activeRestaurants} actifs',
                  ),
                  _buildStatCard(
                    'Revenus',
                    '${_formatRevenue(dashboardState.stats!.todayRevenue)} XAF',
                    Icons.attach_money,
                    Colors.purple,
                    subtitle: 'Aujourd\'hui',
                  ),
                ],
              ),

            const SizedBox(height: 24),

            // Quick Actions
            const Text(
              'Actions Rapides',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            _buildQuickAction(
              'Gestion Utilisateurs',
              'G�rer les comptes utilisateurs',
              Icons.people_alt,
              Colors.blue,
              () {
                context.push('/admin/users');
              },
            ),

            const SizedBox(height: 12),

            _buildQuickAction(
              'Validation Restaurants',
              'Approuver ou rejeter les restaurants',
              Icons.store,
              Colors.orange,
              () {
                // TODO: Navigate to restaurant validation
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Validation restaurants - � venir'),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            _buildQuickAction(
              'Suivi Livraisons',
              'Voir les livraisons en temps r�el',
              Icons.local_shipping,
              Colors.green,
              () {
                // TODO: Navigate to delivery tracking
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Suivi livraisons - � venir'),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            _buildQuickAction(
              'Rapports Financiers',
              'G�n�rer et consulter les rapports',
              Icons.analytics,
              Colors.purple,
              () {
                // TODO: Navigate to financial reports
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Rapports financiers - � venir'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color, {
    String? subtitle,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (subtitle != null)
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }

  String _formatRevenue(double revenue) {
    if (revenue >= 1000000) {
      return '${(revenue / 1000000).toStringAsFixed(1)}M';
    } else if (revenue >= 1000) {
      return '${(revenue / 1000).toStringAsFixed(1)}K';
    }
    return revenue.toStringAsFixed(0);
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'A l\'instant';
    } else if (difference.inMinutes < 60) {
      return 'Il y a ${difference.inMinutes}min';
    } else if (difference.inHours < 24) {
      return 'Il y a ${difference.inHours}h';
    } else {
      return '${dateTime.day}/${dateTime.month} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
    }
  }

  Widget _buildQuickAction(
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
