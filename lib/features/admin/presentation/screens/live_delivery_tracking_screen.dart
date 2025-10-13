/// Live Delivery Tracking Screen
/// Real-time tracking of active deliveries for admins
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/admin_dashboard_provider.dart';
import '../widgets/admin_drawer.dart';

class LiveDeliveryTrackingScreen extends ConsumerStatefulWidget {
  const LiveDeliveryTrackingScreen({super.key});

  @override
  ConsumerState<LiveDeliveryTrackingScreen> createState() =>
      _LiveDeliveryTrackingScreenState();
}

class _LiveDeliveryTrackingScreenState
    extends ConsumerState<LiveDeliveryTrackingScreen> {
  String _selectedFilter = 'all';

  @override
  Widget build(BuildContext context) {
    final dashboardState = ref.watch(adminDashboardProvider);

    return Scaffold(
      drawer: const AdminDrawer(),
      appBar: AppBar(
        title: const Text('Suivi des Livraisons en Temps Réel'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(adminDashboardProvider.notifier).refreshDashboardStats();
            },
            tooltip: 'Actualiser',
          ),
          IconButton(
            icon: const Icon(Icons.map),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Vue carte - À venir')),
              );
            },
            tooltip: 'Vue Carte',
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Tabs
          _buildFilterTabs(),

          // Stats Overview
          _buildStatsOverview(dashboardState),

          // Active Deliveries List
          Expanded(
            child: _buildDeliveriesList(dashboardState),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    final filters = {
      'all': 'Toutes',
      'pending': 'En attente',
      'pickup': 'Ramassage',
      'transit': 'En transit',
      'delivery': 'Livraison',
    };

    return Container(
      color: Colors.green[50],
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: filters.entries.map((entry) {
            final isSelected = _selectedFilter == entry.key;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: FilterChip(
                label: Text(entry.value),
                selected: isSelected,
                onSelected: (selected) {
                  if (selected) {
                    setState(() => _selectedFilter = entry.key);
                  }
                },
                backgroundColor: Colors.white,
                selectedColor: Colors.green,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildStatsOverview(AdminDashboardState state) {
    final stats = state.stats;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              'Livreurs actifs',
              stats?.onlineDrivers.toString() ?? '0',
              Icons.delivery_dining,
              Colors.green,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              'En cours',
              stats?.pendingOrders.toString() ?? '0',
              Icons.local_shipping,
              Colors.orange,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              'Complétées',
              stats?.todayOrders.toString() ?? '0',
              Icons.check_circle,
              Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveriesList(AdminDashboardState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Mock data for demonstration - would be replaced with real API data
    final mockDeliveries = _getMockDeliveries();

    if (mockDeliveries.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_shipping_outlined, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'Aucune livraison en cours',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Les livraisons actives apparaîtront ici',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(adminDashboardProvider.notifier).refreshDashboardStats();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mockDeliveries.length,
        itemBuilder: (context, index) {
          final delivery = mockDeliveries[index];
          return _buildDeliveryCard(delivery);
        },
      ),
    );
  }

  Widget _buildDeliveryCard(Map<String, dynamic> delivery) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: _getStatusColor(delivery['status']),
          child: Icon(
            _getStatusIcon(delivery['status']),
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Text(
          'Commande #${delivery['orderId']}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              delivery['customerName'],
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                _buildStatusBadge(delivery['status']),
                const SizedBox(width: 8),
                Text(
                  delivery['estimatedTime'],
                  style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow(Icons.restaurant, 'Restaurant', delivery['restaurant']),
                _buildInfoRow(Icons.person, 'Livreur', delivery['driver']),
                _buildInfoRow(Icons.location_on, 'Adresse', delivery['address']),
                _buildInfoRow(Icons.phone, 'Téléphone', delivery['phone']),
                _buildInfoRow(Icons.attach_money, 'Montant', '${delivery['amount']} XAF'),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // TODO: Call driver
                        },
                        icon: const Icon(Icons.phone, size: 18),
                        label: const Text('Appeler'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // TODO: Track on map
                        },
                        icon: const Icon(Icons.map, size: 18),
                        label: const Text('Carte'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: _getStatusColor(status).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _getStatusColor(status).withValues(alpha: 0.3)),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 10,
          color: _getStatusColor(status),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
      case 'en attente':
        return Colors.orange;
      case 'pickup':
      case 'ramassage':
        return Colors.blue;
      case 'transit':
      case 'en transit':
        return Colors.purple;
      case 'delivery':
      case 'livraison':
        return Colors.green;
      case 'completed':
      case 'complétée':
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
      case 'en attente':
        return Icons.hourglass_empty;
      case 'pickup':
      case 'ramassage':
        return Icons.store;
      case 'transit':
      case 'en transit':
        return Icons.local_shipping;
      case 'delivery':
      case 'livraison':
        return Icons.location_on;
      case 'completed':
      case 'complétée':
        return Icons.check_circle;
      default:
        return Icons.info;
    }
  }

  List<Map<String, dynamic>> _getMockDeliveries() {
    // Mock data - would be replaced with real API call
    return [
      {
        'orderId': '12345',
        'customerName': 'Jean Dupont',
        'restaurant': 'Restaurant Le Bon Goût',
        'driver': 'Pierre Martin',
        'address': 'Bastos, Yaoundé',
        'phone': '+237 6 XX XX XX XX',
        'amount': '15000',
        'status': 'En transit',
        'estimatedTime': 'Arrivée dans 15 min',
      },
      {
        'orderId': '12346',
        'customerName': 'Marie Kouam',
        'restaurant': 'Pizza Paradise',
        'driver': 'Thomas Nkong',
        'address': 'Akwa, Douala',
        'phone': '+237 6 XX XX XX XX',
        'amount': '8500',
        'status': 'Ramassage',
        'estimatedTime': 'Arrivée dans 25 min',
      },
      {
        'orderId': '12347',
        'customerName': 'Paul Ndongo',
        'restaurant': 'Chez Mama',
        'driver': 'Jean Fotso',
        'address': 'Omnisport, Yaoundé',
        'phone': '+237 6 XX XX XX XX',
        'amount': '12000',
        'status': 'Livraison',
        'estimatedTime': 'Arrivée dans 5 min',
      },
    ];
  }
}
