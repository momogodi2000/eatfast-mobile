/// Order Management Screen
/// Admin interface for managing all orders
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/admin_drawer.dart';
import '../providers/order_management_provider.dart';

class OrderManagementScreen extends ConsumerStatefulWidget {
  const OrderManagementScreen({super.key});

  @override
  ConsumerState<OrderManagementScreen> createState() =>
      _OrderManagementScreenState();
}

class _OrderManagementScreenState extends ConsumerState<OrderManagementScreen> {
  final _searchController = TextEditingController();
  String? _selectedStatus;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orderState = ref.watch(orderManagementProvider);
    final orderNotifier = ref.read(orderManagementProvider.notifier);

    return Scaffold(
      drawer: const AdminDrawer(),
      appBar: AppBar(
        title: const Text('Gestion des Commandes'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(orderNotifier),
            tooltip: 'Filtrer',
          ),
          if (orderState.isLoading)
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
                orderNotifier.loadOrders();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Commandes actualisées')),
                );
              },
              tooltip: 'Actualiser',
            ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher par numéro ou nom...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              onChanged: (value) {
                orderNotifier.searchOrders(value);
              },
            ),
          ),

          // Error State
          if (orderState.error != null)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red[200]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red[700]),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      orderState.error!,
                      style: TextStyle(color: Colors.red[700], fontSize: 12),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 18),
                    onPressed: () => orderNotifier.clearError(),
                    color: Colors.red[700],
                  ),
                ],
              ),
            ),

          // Statistics Cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Total',
                    '${orderState.orders.length}',
                    Icons.shopping_bag,
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'En cours',
                    '${orderState.orders.where((o) => o['status'] == 'in_progress' || o['status'] == 'preparing' || o['status'] == 'delivering').length}',
                    Icons.pending,
                    Colors.orange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Terminées',
                    '${orderState.orders.where((o) => o['status'] == 'completed' || o['status'] == 'delivered').length}',
                    Icons.check_circle,
                    Colors.green,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Active Filters
          if (orderState.filterStatus != null || orderState.fromDate != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Wrap(
                spacing: 8,
                children: [
                  if (orderState.filterStatus != null)
                    Chip(
                      label: Text('Statut: ${_getStatusLabel(orderState.filterStatus!)}'),
                      deleteIcon: const Icon(Icons.close, size: 18),
                      onDeleted: () {
                        orderNotifier.filterByStatus(null);
                      },
                      backgroundColor: Colors.green[50],
                      deleteIconColor: Colors.green[700],
                    ),
                  if (orderState.fromDate != null || orderState.toDate != null)
                    Chip(
                      label: const Text('Filtre de date actif'),
                      deleteIcon: const Icon(Icons.close, size: 18),
                      onDeleted: () {
                        orderNotifier.clearDateRangeFilter();
                      },
                      backgroundColor: Colors.blue[50],
                      deleteIconColor: Colors.blue[700],
                    ),
                ],
              ),
            ),

          // Order List
          Expanded(
            child: orderState.isLoading && orderState.orders.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : orderState.orders.isEmpty
                    ? _buildEmptyView()
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: orderState.orders.length + 1,
                        itemBuilder: (context, index) {
                          if (index == orderState.orders.length) {
                            return const SizedBox(height: 80); // Pagination placeholder
                          }
                          final order = orderState.orders[index];
                          return _buildOrderCard(order, orderNotifier);
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, size: 24, color: color),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order, OrderManagementNotifier notifier) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: _getStatusColor(order['status']),
          child: Icon(
            _getStatusIcon(order['status']),
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Text(
          order['id'],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order['customerName'],
              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                _buildStatusBadge(order['status']),
                const SizedBox(width: 8),
                Text(
                  '${order['total']} XAF',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
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
                _buildInfoRow(Icons.restaurant, 'Restaurant', order['restaurant']),
                _buildInfoRow(Icons.shopping_cart, 'Articles', '${order['items']} items'),
                _buildInfoRow(Icons.calendar_today, 'Date', order['date']),
                _buildInfoRow(Icons.attach_money, 'Total', '${order['total']} XAF'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _viewOrderDetails(order),
                        icon: const Icon(Icons.visibility, size: 18),
                        label: const Text('Détails'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (order['status'] != 'completed' &&
                        order['status'] != 'delivered' &&
                        order['status'] != 'cancelled')
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _cancelOrder(order),
                          icon: const Icon(Icons.cancel, size: 18),
                          label: const Text('Annuler'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
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
                    fontWeight: FontWeight.w500,
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
        _getStatusLabel(status),
        style: TextStyle(
          fontSize: 10,
          color: _getStatusColor(status),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'pending':
        return Colors.blue;
      case 'confirmed':
        return Colors.lightBlue;
      case 'preparing':
      case 'in_progress':
        return Colors.orange;
      case 'ready':
        return Colors.amber;
      case 'delivering':
        return Colors.purple;
      case 'completed':
      case 'delivered':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'pending':
        return Icons.hourglass_empty;
      case 'confirmed':
        return Icons.check;
      case 'preparing':
      case 'in_progress':
        return Icons.restaurant;
      case 'ready':
        return Icons.done_all;
      case 'delivering':
        return Icons.local_shipping;
      case 'completed':
      case 'delivered':
        return Icons.check_circle;
      case 'cancelled':
        return Icons.cancel;
      default:
        return Icons.help;
    }
  }

  String _getStatusLabel(String status) {
    switch (status) {
      case 'pending':
        return 'En attente';
      case 'confirmed':
        return 'Confirmée';
      case 'preparing':
        return 'En préparation';
      case 'in_progress':
        return 'En cours';
      case 'ready':
        return 'Prête';
      case 'delivering':
        return 'En livraison';
      case 'completed':
        return 'Terminée';
      case 'delivered':
        return 'Livrée';
      case 'cancelled':
        return 'Annulée';
      default:
        return status;
    }
  }

  Widget _buildEmptyView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag_outlined, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'Aucune commande trouvée',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Essayez de modifier vos filtres',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterDialog(OrderManagementNotifier notifier) {
    String? tempSelectedStatus = _selectedStatus;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filtrer les commandes'),
        content: StatefulBuilder(
          builder: (context, setDialogState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Statut:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      FilterChip(
                        label: const Text('En attente'),
                        selected: tempSelectedStatus == 'pending',
                        onSelected: (selected) {
                          setDialogState(() {
                            tempSelectedStatus = selected ? 'pending' : null;
                          });
                        },
                      ),
                      FilterChip(
                        label: const Text('Confirmée'),
                        selected: tempSelectedStatus == 'confirmed',
                        onSelected: (selected) {
                          setDialogState(() {
                            tempSelectedStatus = selected ? 'confirmed' : null;
                          });
                        },
                      ),
                      FilterChip(
                        label: const Text('En préparation'),
                        selected: tempSelectedStatus == 'preparing',
                        onSelected: (selected) {
                          setDialogState(() {
                            tempSelectedStatus = selected ? 'preparing' : null;
                          });
                        },
                      ),
                      FilterChip(
                        label: const Text('En cours'),
                        selected: tempSelectedStatus == 'in_progress',
                        onSelected: (selected) {
                          setDialogState(() {
                            tempSelectedStatus = selected ? 'in_progress' : null;
                          });
                        },
                      ),
                      FilterChip(
                        label: const Text('Prête'),
                        selected: tempSelectedStatus == 'ready',
                        onSelected: (selected) {
                          setDialogState(() {
                            tempSelectedStatus = selected ? 'ready' : null;
                          });
                        },
                      ),
                      FilterChip(
                        label: const Text('En livraison'),
                        selected: tempSelectedStatus == 'delivering',
                        onSelected: (selected) {
                          setDialogState(() {
                            tempSelectedStatus = selected ? 'delivering' : null;
                          });
                        },
                      ),
                      FilterChip(
                        label: const Text('Livrée'),
                        selected: tempSelectedStatus == 'delivered',
                        onSelected: (selected) {
                          setDialogState(() {
                            tempSelectedStatus = selected ? 'delivered' : null;
                          });
                        },
                      ),
                      FilterChip(
                        label: const Text('Terminée'),
                        selected: tempSelectedStatus == 'completed',
                        onSelected: (selected) {
                          setDialogState(() {
                            tempSelectedStatus = selected ? 'completed' : null;
                          });
                        },
                      ),
                      FilterChip(
                        label: const Text('Annulée'),
                        selected: tempSelectedStatus == 'cancelled',
                        onSelected: (selected) {
                          setDialogState(() {
                            tempSelectedStatus = selected ? 'cancelled' : null;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (tempSelectedStatus != null) {
                setState(() {
                  _selectedStatus = null;
                });
                notifier.filterByStatus(null);
              }
              Navigator.pop(context);
            },
            child: const Text('Réinitialiser'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedStatus = tempSelectedStatus;
              });
              notifier.filterByStatus(tempSelectedStatus);
              Navigator.pop(context);
            },
            child: const Text('Appliquer'),
          ),
        ],
      ),
    );
  }

  void _viewOrderDetails(Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Commande ${order['id']}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Client: ${order['customerName']}'),
            Text('Restaurant: ${order['restaurant']}'),
            Text('Articles: ${order['items']}'),
            Text('Total: ${order['total']} XAF'),
            Text('Date: ${order['date']}'),
            Text('Statut: ${_getStatusLabel(order['status'])}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  void _cancelOrder(Map<String, dynamic> order) async {
    final reasonController = TextEditingController();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Annuler la commande'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Êtes-vous sûr de vouloir annuler la commande ${order['id']}?'),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                labelText: 'Raison de l\'annulation *',
                border: OutlineInputBorder(),
                hintText: 'Ex: Demande du client, produit non disponible...',
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Non'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              if (reasonController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Veuillez entrer une raison'),
                    backgroundColor: Colors.orange,
                  ),
                );
                return;
              }
              Navigator.pop(context, true);
            },
            child: const Text('Oui, annuler'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      final notifier = ref.read(orderManagementProvider.notifier);
      final success = await notifier.cancelOrder(
        order['id'] ?? order['orderId'] ?? '',
        reasonController.text.trim(),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              success
                  ? 'Commande ${order['id']} annulée avec succès'
                  : 'Erreur lors de l\'annulation de la commande',
            ),
            backgroundColor: success ? Colors.green : Colors.red,
          ),
        );
      }
    }

    reasonController.dispose();
  }
}
