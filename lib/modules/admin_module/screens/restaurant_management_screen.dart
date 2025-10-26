/// Restaurant Management Screen
/// Admin interface for managing restaurants
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/models/user_management.dart';
import '../providers/restaurant_management_provider.dart';
import '../widgets/admin_drawer.dart';

class RestaurantManagementScreen extends ConsumerStatefulWidget {
  const RestaurantManagementScreen({super.key});

  @override
  ConsumerState<RestaurantManagementScreen> createState() =>
      _RestaurantManagementScreenState();
}

class _RestaurantManagementScreenState
    extends ConsumerState<RestaurantManagementScreen> {
  final _searchController = TextEditingController();
  RestaurantStatus? _selectedStatus;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final restaurantState = ref.watch(restaurantManagementProvider);

    return Scaffold(
      drawer: const AdminDrawer(),
      appBar: AppBar(
        title: const Text('Gestion des Restaurants'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
            tooltip: 'Filtrer',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(restaurantManagementProvider.notifier).loadRestaurants();
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
                hintText: 'Rechercher un restaurant...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          ref
                              .read(restaurantManagementProvider.notifier)
                              .searchRestaurants('');
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
                Future.delayed(const Duration(milliseconds: 500), () {
                  if (_searchController.text == value) {
                    ref
                        .read(restaurantManagementProvider.notifier)
                        .searchRestaurants(value);
                  }
                });
              },
            ),
          ),

          // Active Filters
          if (restaurantState.filterStatus != null ||
              restaurantState.searchQuery != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (restaurantState.filterStatus != null)
                    Chip(
                      label: Text(
                          'Statut: ${restaurantState.filterStatus!.displayName}'),
                      deleteIcon: const Icon(Icons.close, size: 18),
                      onDeleted: () {
                        setState(() => _selectedStatus = null);
                        ref
                            .read(restaurantManagementProvider.notifier)
                            .applyFilters(
                              status: null,
                              searchQuery: restaurantState.searchQuery,
                            );
                      },
                      backgroundColor: Colors.orange[50],
                      deleteIconColor: Colors.orange[700],
                    ),
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _selectedStatus = null;
                        _searchController.clear();
                      });
                      ref
                          .read(restaurantManagementProvider.notifier)
                          .clearFilters();
                    },
                    icon: const Icon(Icons.clear_all, size: 16),
                    label: const Text('Effacer tout'),
                  ),
                ],
              ),
            ),

          // Restaurant List
          Expanded(
            child: restaurantState.isLoading &&
                    restaurantState.restaurants.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : restaurantState.error != null &&
                        restaurantState.restaurants.isEmpty
                    ? _buildErrorView(restaurantState.error!)
                    : restaurantState.restaurants.isEmpty
                        ? _buildEmptyView()
                        : RefreshIndicator(
                            onRefresh: () async {
                              ref
                                  .read(restaurantManagementProvider.notifier)
                                  .loadRestaurants();
                            },
                            child: ListView.builder(
                              padding: const EdgeInsets.all(16),
                              itemCount: restaurantState.restaurants.length,
                              itemBuilder: (context, index) {
                                final restaurant =
                                    restaurantState.restaurants[index];
                                return _buildRestaurantCard(context, restaurant);
                              },
                            ),
                          ),
          ),

          // Pagination
          if (restaurantState.restaurants.isNotEmpty)
            _buildPagination(restaurantState),
        ],
      ),
    );
  }

  Widget _buildRestaurantCard(
      BuildContext context, RestaurantAccount restaurant) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: _getStatusColor(restaurant.status),
          child: Icon(
            _getStatusIcon(restaurant.status),
            color: Colors.white,
          ),
        ),
        title: Text(
          restaurant.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(restaurant.email,
                style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            const SizedBox(height: 4),
            Row(
              children: [
                _buildStatusBadge(restaurant.status),
                const SizedBox(width: 8),
                Text(
                  'Commission: ${restaurant.commissionRate.toStringAsFixed(1)}%',
                  style: TextStyle(fontSize: 11, color: Colors.grey[700]),
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
                _buildInfoRow(Icons.location_on, 'Adresse', restaurant.address),
                _buildInfoRow(Icons.phone, 'Téléphone', restaurant.phoneNumber),
                _buildInfoRow(Icons.food_bank, 'Type de cuisine',
                    restaurant.cuisineType ?? 'Non spécifié'),
                _buildInfoRow(Icons.shopping_bag, 'Commandes',
                    '${restaurant.totalOrders}'),
                _buildInfoRow(Icons.attach_money, 'Revenus',
                    '${restaurant.totalRevenue.toStringAsFixed(0)} XAF'),
                _buildInfoRow(Icons.star, 'Note',
                    '${restaurant.averageRating.toStringAsFixed(1)}/5'),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    if (restaurant.status ==
                        RestaurantStatus.pendingVerification)
                      ...[
                        ElevatedButton.icon(
                          onPressed: () =>
                              _verifyRestaurant(context, restaurant),
                          icon: const Icon(Icons.check_circle, size: 18),
                          label: const Text('Approuver'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: () =>
                              _rejectRestaurant(context, restaurant),
                          icon: const Icon(Icons.cancel, size: 18),
                          label: const Text('Rejeter'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                          ),
                        ),
                      ],
                    if (restaurant.status == RestaurantStatus.active)
                      OutlinedButton.icon(
                        onPressed: () =>
                            _suspendRestaurant(context, restaurant),
                        icon: const Icon(Icons.block, size: 18),
                        label: const Text('Suspendre'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.orange,
                        ),
                      ),
                    ElevatedButton.icon(
                      onPressed: () =>
                          _updateCommissionRate(context, restaurant),
                      icon: const Icon(Icons.percent, size: 18),
                      label: const Text('Commission'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
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
          Icon(icon, size: 18, color: Colors.grey[600]),
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

  Widget _buildStatusBadge(RestaurantStatus status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: _getStatusColor(status).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _getStatusColor(status).withValues(alpha: 0.3)),
      ),
      child: Text(
        status.displayName,
        style: TextStyle(
          fontSize: 10,
          color: _getStatusColor(status),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Color _getStatusColor(RestaurantStatus status) {
    switch (status) {
      case RestaurantStatus.active:
        return Colors.green;
      case RestaurantStatus.inactive:
        return Colors.grey;
      case RestaurantStatus.pendingVerification:
        return Colors.blue;
      case RestaurantStatus.rejected:
        return Colors.red;
      case RestaurantStatus.suspended:
        return Colors.orange;
      case RestaurantStatus.closedTemporarily:
        return Colors.amber;
      case RestaurantStatus.closedPermanently:
        return Colors.red[900]!;
    }
  }

  IconData _getStatusIcon(RestaurantStatus status) {
    switch (status) {
      case RestaurantStatus.active:
        return Icons.check_circle;
      case RestaurantStatus.inactive:
        return Icons.radio_button_unchecked;
      case RestaurantStatus.pendingVerification:
        return Icons.hourglass_empty;
      case RestaurantStatus.rejected:
        return Icons.cancel;
      case RestaurantStatus.suspended:
        return Icons.block;
      case RestaurantStatus.closedTemporarily:
      case RestaurantStatus.closedPermanently:
        return Icons.close;
    }
  }

  Widget _buildErrorView(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Erreur de chargement',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              error,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(restaurantManagementProvider.notifier).loadRestaurants();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Réessayer'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_outlined, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'Aucun restaurant trouvé',
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

  Widget _buildPagination(RestaurantManagementState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: state.currentPage > 1
                ? () => ref
                    .read(restaurantManagementProvider.notifier)
                    .previousPage()
                : null,
            icon: const Icon(Icons.chevron_left),
            label: const Text('Précédent'),
          ),
          Text(
            'Page ${state.currentPage}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextButton.icon(
            onPressed: state.hasMore
                ? () =>
                    ref.read(restaurantManagementProvider.notifier).nextPage()
                : null,
            icon: const Icon(Icons.chevron_right),
            label: const Text('Suivant'),
            iconAlignment: IconAlignment.end,
          ),
        ],
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filtrer les restaurants'),
        content: StatefulBuilder(
          builder: (context, setDialogState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Statut:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: RestaurantStatus.values.map((status) {
                    return FilterChip(
                      label: Text(status.displayName),
                      selected: _selectedStatus == status,
                      onSelected: (selected) {
                        setDialogState(() {
                          _selectedStatus = selected ? status : null;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(restaurantManagementProvider.notifier).applyFilters(
                    status: _selectedStatus,
                    searchQuery:
                        ref.read(restaurantManagementProvider).searchQuery,
                  );
              Navigator.pop(context);
            },
            child: const Text('Appliquer'),
          ),
        ],
      ),
    );
  }

  void _verifyRestaurant(
      BuildContext context, RestaurantAccount restaurant) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Approuver le restaurant'),
        content: Text('Approuver ${restaurant.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Approuver'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      final success = await ref
          .read(restaurantManagementProvider.notifier)
          .verifyRestaurant(restaurant.restaurantId);

      if (success && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Restaurant approuvé avec succès'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  void _rejectRestaurant(
      BuildContext context, RestaurantAccount restaurant) async {
    final reasonController = TextEditingController();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Rejeter le restaurant'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Rejeter ${restaurant.name}?'),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                labelText: 'Raison du rejet',
                border: OutlineInputBorder(),
                hintText: 'Expliquez pourquoi...',
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              if (reasonController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Veuillez fournir une raison')),
                );
                return;
              }
              Navigator.pop(context, true);
            },
            child: const Text('Rejeter'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      final success = await ref
          .read(restaurantManagementProvider.notifier)
          .rejectRestaurant(
            restaurant.restaurantId,
            reasonController.text.trim(),
          );

      if (success && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Restaurant rejeté'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _suspendRestaurant(
      BuildContext context, RestaurantAccount restaurant) async {
    final reasonController = TextEditingController();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Suspendre le restaurant'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Suspendre ${restaurant.name}?'),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                labelText: 'Raison de la suspension',
                border: OutlineInputBorder(),
                hintText: 'Expliquez pourquoi...',
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () {
              if (reasonController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Veuillez fournir une raison')),
                );
                return;
              }
              Navigator.pop(context, true);
            },
            child: const Text('Suspendre'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      final success = await ref
          .read(restaurantManagementProvider.notifier)
          .suspendRestaurant(
            restaurant.restaurantId,
            reasonController.text.trim(),
          );

      if (success && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Restaurant suspendu'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    }
  }

  void _updateCommissionRate(
      BuildContext context, RestaurantAccount restaurant) async {
    final rateController = TextEditingController(
      text: restaurant.commissionRate.toStringAsFixed(1),
    );

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Modifier la commission'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Taux actuel: ${restaurant.commissionRate.toStringAsFixed(1)}%'),
            const SizedBox(height: 16),
            TextField(
              controller: rateController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nouveau taux (%)',
                border: OutlineInputBorder(),
                hintText: 'Ex: 15.0',
                suffixText: '%',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              final rate = double.tryParse(rateController.text);
              if (rate == null || rate < 0 || rate > 30) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content:
                          Text('Taux invalide (doit être entre 0 et 30)')),
                );
                return;
              }
              Navigator.pop(context, true);
            },
            child: const Text('Mettre à jour'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      final rate = double.parse(rateController.text);
      final success = await ref
          .read(restaurantManagementProvider.notifier)
          .updateCommissionRate(restaurant.restaurantId, rate);

      if (success && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Taux de commission mis à jour'),
            backgroundColor: Colors.blue,
          ),
        );
      }
    }
  }
}
