/// Financial Reports Screen
/// Comprehensive financial analytics and reporting for admins
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/admin_dashboard_provider.dart';
import '../widgets/admin_drawer.dart';

class FinancialReportsScreen extends ConsumerStatefulWidget {
  const FinancialReportsScreen({super.key});

  @override
  ConsumerState<FinancialReportsScreen> createState() => _FinancialReportsScreenState();
}

class _FinancialReportsScreenState extends ConsumerState<FinancialReportsScreen> {
  DateTime _startDate = DateTime.now().subtract(const Duration(days: 30));
  DateTime _endDate = DateTime.now();
  String _selectedPeriod = '30d';

  final DateFormat _dateFormat = DateFormat('dd MMM yyyy');
  final NumberFormat _currencyFormat = NumberFormat.currency(
    symbol: 'XAF ',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    final dashboardState = ref.watch(adminDashboardProvider);

    return Scaffold(
      drawer: const AdminDrawer(),
      appBar: AppBar(
        title: const Text('Rapports Financiers'),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: const Icon(Icons.date_range),
            onPressed: _showDateRangePicker,
            tooltip: 'Période',
          ),
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {
              // TODO: Export functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Export - À venir')),
              );
            },
            tooltip: 'Exporter',
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(adminDashboardProvider.notifier).refreshDashboardStats();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Period Selector
              _buildPeriodSelector(),
              const SizedBox(height: 16),

              // Date Range Display
              _buildDateRangeCard(),
              const SizedBox(height: 24),

              // Revenue Overview
              _buildSectionHeader('Aperçu des Revenus', Icons.attach_money),
              const SizedBox(height: 12),
              _buildRevenueOverview(dashboardState),
              const SizedBox(height: 24),

              // Orders Statistics
              _buildSectionHeader('Statistiques des Commandes', Icons.shopping_bag),
              const SizedBox(height: 12),
              _buildOrdersStatistics(dashboardState),
              const SizedBox(height: 24),

              // Platform Performance
              _buildSectionHeader('Performance de la Plateforme', Icons.trending_up),
              const SizedBox(height: 12),
              _buildPlatformPerformance(dashboardState),
              const SizedBox(height: 24),

              // Top Performers
              _buildSectionHeader('Meilleurs Performers', Icons.star),
              const SizedBox(height: 12),
              if (dashboardState.stats?.topRestaurants != null &&
                  dashboardState.stats!.topRestaurants.isNotEmpty)
                _buildTopRestaurants(dashboardState.stats!.topRestaurants)
              else
                _buildEmptyCard('Aucune donnée disponible'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPeriodSelector() {
    final periods = {
      '7d': '7 jours',
      '30d': '30 jours',
      '90d': '90 jours',
      'custom': 'Personnalisé',
    };

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: periods.entries.map((entry) {
            final isSelected = _selectedPeriod == entry.key;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  label: Text(entry.value),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        _selectedPeriod = entry.key;
                        if (entry.key != 'custom') {
                          _updateDateRange(entry.key);
                        } else {
                          _showDateRangePicker();
                        }
                      });
                    }
                  },
                  labelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildDateRangeCard() {
    return Card(
      color: Colors.purple[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.calendar_today, color: Colors.purple[700]),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Période sélectionnée',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.purple[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${_dateFormat.format(_startDate)} - ${_dateFormat.format(_endDate)}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[900],
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: _showDateRangePicker,
              child: const Text('Modifier'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.purple[700]),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildRevenueOverview(AdminDashboardState state) {
    final stats = state.stats;
    if (stats == null) {
      return _buildLoadingCard();
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildRevenueItem(
              'Revenus totaux',
              stats.totalRevenue,
              Icons.account_balance_wallet,
              Colors.purple,
            ),
            const Divider(height: 24),
            _buildRevenueItem(
              'Revenus aujourd\'hui',
              stats.todayRevenue,
              Icons.today,
              Colors.green,
            ),
            const Divider(height: 24),
            _buildRevenueItem(
              'Commission plateforme',
              stats.platformCommission,
              Icons.percent,
              Colors.blue,
            ),
            const Divider(height: 24),
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(
                    'Valeur moyenne',
                    _currencyFormat.format(stats.averageOrderValue),
                    Icons.shopping_cart,
                    Colors.orange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildMetricCard(
                    'Commandes totales',
                    '${stats.totalOrders}',
                    Icons.receipt_long,
                    Colors.teal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueItem(String label, double amount, IconData icon, Color color) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.1),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _currencyFormat.format(amount),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
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

  Widget _buildOrdersStatistics(AdminDashboardState state) {
    final stats = state.stats;
    if (stats == null) {
      return _buildLoadingCard();
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildOrderStatCard(
                    'Totales',
                    stats.totalOrders,
                    Icons.all_inclusive,
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildOrderStatCard(
                    'Complétées',
                    stats.completedOrders,
                    Icons.check_circle,
                    Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildOrderStatCard(
                    'En attente',
                    stats.pendingOrders,
                    Icons.hourglass_empty,
                    Colors.orange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildOrderStatCard(
                    'Annulées',
                    stats.cancelledOrders,
                    Icons.cancel,
                    Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderStatCard(String label, int count, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(
            '$count',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlatformPerformance(AdminDashboardState state) {
    final stats = state.stats;
    if (stats == null) {
      return _buildLoadingCard();
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildPerformanceMetric(
              'Utilisateurs actifs',
              '${stats.activeUsers}',
              '${stats.totalUsers} total',
              Icons.people,
              Colors.blue,
            ),
            const Divider(height: 24),
            _buildPerformanceMetric(
              'Restaurants actifs',
              '${stats.activeRestaurants}',
              '${stats.totalRestaurants} total',
              Icons.restaurant,
              Colors.orange,
            ),
            const Divider(height: 24),
            _buildPerformanceMetric(
              'Livreurs en ligne',
              '${stats.onlineDrivers}',
              '${stats.totalDrivers} total',
              Icons.delivery_dining,
              Colors.green,
            ),
            const Divider(height: 24),
            _buildPerformanceMetric(
              'Temps de livraison moyen',
              '${stats.averageDeliveryTime.toStringAsFixed(0)} min',
              'Performance livraison',
              Icons.timer,
              Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceMetric(
    String label,
    String value,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.1),
          radius: 24,
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
                subtitle,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTopRestaurants(List topRestaurants) {
    return Card(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: topRestaurants.length > 5 ? 5 : topRestaurants.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final restaurant = topRestaurants[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: _getPositionColor(index),
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              restaurant.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '${restaurant.totalOrders} commandes • Note: ${restaurant.averageRating.toStringAsFixed(1)}★',
              style: const TextStyle(fontSize: 12),
            ),
            trailing: Text(
              _currencyFormat.format(restaurant.totalRevenue),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadingCard() {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildEmptyCard(String message) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Text(
            message,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
      ),
    );
  }

  Color _getPositionColor(int index) {
    switch (index) {
      case 0:
        return Colors.amber;
      case 1:
        return Colors.grey[400]!;
      case 2:
        return Colors.brown[400]!;
      default:
        return Colors.blue;
    }
  }

  void _updateDateRange(String period) {
    setState(() {
      _endDate = DateTime.now();
      switch (period) {
        case '7d':
          _startDate = _endDate.subtract(const Duration(days: 7));
          break;
        case '30d':
          _startDate = _endDate.subtract(const Duration(days: 30));
          break;
        case '90d':
          _startDate = _endDate.subtract(const Duration(days: 90));
          break;
      }
    });
  }

  Future<void> _showDateRangePicker() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: DateTimeRange(start: _startDate, end: _endDate),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.purple,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
        _selectedPeriod = 'custom';
      });
    }
  }
}
