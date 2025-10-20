/// Client Dashboard Screen
/// Main hub for authenticated clients/customers
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/widgets/client_drawer.dart';
import 'package:eatfast_mobile/shared/services/loyalty/providers/loyalty_provider.dart';
import 'package:eatfast_mobile/shared/services/wallet/providers/wallet_provider.dart';
import '../providers/client_orders_provider.dart';
import 'package:eatfast_mobile/shared/services/auth/providers/unified_auth_provider.dart';
import 'package:eatfast_mobile/shared/services/orders/providers/order_provider.dart';

class ClientDashboardScreen extends ConsumerStatefulWidget {
  const ClientDashboardScreen({super.key});

  @override
  ConsumerState<ClientDashboardScreen> createState() => _ClientDashboardScreenState();
}

class _ClientDashboardScreenState extends ConsumerState<ClientDashboardScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize client data on dashboard load
    Future.microtask(() {
      ref.read(loyaltyProvider.notifier).refresh();
      ref.read(clientOrdersProvider.notifier).loadOrders();
      ref.read(walletProvider.notifier).fetchWallet();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final user = authState.user;
    final loyaltyState = ref.watch(loyaltyProvider);
    final walletAsync = ref.watch(walletProvider);
    final ordersAsync = ref.watch(clientOrdersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Tableau de Bord'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Navigate to notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Navigate to search
            },
          ),
        ],
      ),
      drawer: const ClientDrawer(),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bienvenue, ${user?.firstName ?? 'Client'}!',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Commandez vos plats préférés',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Quick Stats Cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    // Loyalty Points Card
                    Expanded(
                      child: _buildStatCard(
                        context: context,
                        icon: Icons.stars,
                        color: Colors.amber,
                        title: 'Points Fidélité',
                        value: loyaltyState.isLoading
                            ? '...'
                            : loyaltyState.availablePoints.toString(),
                        onTap: () {
                          // TODO: Navigate to loyalty screen
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Wallet Card
                    Expanded(
                      child: _buildStatCard(
                        context: context,
                        icon: Icons.account_balance_wallet,
                        color: Colors.green,
                        title: 'Portefeuille',
                        value: '${walletAsync.value?.balance.toStringAsFixed(0) ?? '0'} XAF',
                        onTap: () {
                          // TODO: Navigate to wallet screen
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    // Total Orders Card
                    Expanded(
                      child: _buildStatCard(
                        context: context,
                        icon: Icons.shopping_bag,
                        color: Colors.blue,
                        title: 'Total Commandes',
                        value: user?.totalOrders.toString() ?? '0',
                        onTap: () {
                          // TODO: Navigate to order history
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Tier Card
                    Expanded(
                      child: _buildStatCard(
                        context: context,
                        icon: Icons.emoji_events,
                        color: Colors.purple,
                        title: 'Niveau',
                        value: loyaltyState.isLoading
                            ? '...'
                            : loyaltyState.currentTier.name.toUpperCase(),
                        onTap: () {
                          // TODO: Navigate to loyalty screen
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Recent Orders Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Commandes Récentes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: Navigate to full order history
                      },
                      child: const Text('Voir tout'),
                    ),
                  ],
                ),
              ),

              // Orders List
              Builder(
                builder: (context) {
                  if (ordersAsync.isLoading) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(40),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (ordersAsync.error != null) {
                    return Padding(
                      padding: const EdgeInsets.all(40),
                      child: Center(
                        child: Text(
                          'Erreur de chargement: ${ordersAsync.error}',
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }

                  final orders = ordersAsync.allOrders;

                  if (orders.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(40),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(Icons.receipt_long, size: 64, color: Colors.grey),
                            SizedBox(height: 16),
                            Text(
                              'Aucune commande',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  // Show only first 5 recent orders
                  final recentOrders = orders.take(5).toList();
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: recentOrders.length,
                    itemBuilder: (context, index) {
                      final order = recentOrders[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: _getStatusColor(order.status).withValues(alpha: 0.2),
                            child: Icon(
                              _getStatusIcon(order.status),
                              color: _getStatusColor(order.status),
                            ),
                          ),
                          title: Text(
                            order.restaurantName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '${order.id.split('_').last.substring(0, 8)} • ${order.status.displayName}',
                          ),
                          trailing: Text(
                            '${order.total.toStringAsFixed(0)} XAF',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {
                            // TODO: Navigate to order detail
                          },
                        ),
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 24),

              // Quick Actions
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  'Actions Rapides',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: [
                    _buildQuickAction(
                      context: context,
                      icon: Icons.restaurant_menu,
                      label: 'Explorer',
                      color: Colors.orange,
                      onTap: () {
                        // TODO: Navigate to restaurants
                      },
                    ),
                    _buildQuickAction(
                      context: context,
                      icon: Icons.favorite,
                      label: 'Favoris',
                      color: Colors.red,
                      onTap: () {
                        // TODO: Navigate to favorites
                      },
                    ),
                    _buildQuickAction(
                      context: context,
                      icon: Icons.history,
                      label: 'Historique',
                      color: Colors.blue,
                      onTap: () {
                        // TODO: Navigate to order history
                      },
                    ),
                    _buildQuickAction(
                      context: context,
                      icon: Icons.location_on,
                      label: 'Adresses',
                      color: Colors.green,
                      onTap: () {
                        // TODO: Navigate to addresses
                      },
                    ),
                    _buildQuickAction(
                      context: context,
                      icon: Icons.payment,
                      label: 'Paiements',
                      color: Colors.purple,
                      onTap: () {
                        // TODO: Navigate to payment methods
                      },
                    ),
                    _buildQuickAction(
                      context: context,
                      icon: Icons.support_agent,
                      label: 'Support',
                      color: Colors.teal,
                      onTap: () {
                        // TODO: Navigate to support
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required BuildContext context,
    required IconData icon,
    required Color color,
    required String title,
    required String value,
    VoidCallback? onTap,
  }) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 32),
              const SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAction({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
    VoidCallback? onTap,
  }) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(status) {
    switch (status.name) {
      case 'pending':
        return Colors.orange;
      case 'accepted':
      case 'preparing':
        return Colors.blue;
      case 'readyForPickup':
      case 'pickedUp':
        return Colors.purple;
      case 'delivered':
        return Colors.green;
      case 'cancelled':
      case 'rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(status) {
    switch (status.name) {
      case 'pending':
        return Icons.schedule;
      case 'accepted':
        return Icons.check_circle;
      case 'preparing':
        return Icons.restaurant;
      case 'readyForPickup':
        return Icons.shopping_bag;
      case 'pickedUp':
        return Icons.delivery_dining;
      case 'delivered':
        return Icons.done_all;
      case 'cancelled':
      case 'rejected':
        return Icons.cancel;
      default:
        return Icons.help;
    }
  }

  Future<void> _refreshData() async {
    await ref.read(loyaltyProvider.notifier).refresh();
    await ref.read(ordersProvider.notifier).loadOrders(refresh: true);
    await ref.read(walletProvider.notifier).fetchWallet();
  }
}

