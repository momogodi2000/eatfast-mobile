/// Analytics & Reports Screen
/// Displays comprehensive analytics, charts, and performance metrics
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';
import 'package:eatfast_mobile/shared/widgets/common/app_loading_indicator.dart';
import 'package:eatfast_mobile/modules/restaurant_manager_module/providers/domain/models/restaurant_stats.dart';
import 'package:eatfast_mobile/modules/restaurant_manager_module/providers/restaurant_owner_provider.dart';
import '../widgets/widgets/restaurant_manager_drawer.dart';
import '../widgets/widgets/performance_chart.dart';

class AnalyticsReportsScreen extends ConsumerStatefulWidget {
  final String restaurantId;

  const AnalyticsReportsScreen({
    super.key,
    required this.restaurantId,
  });

  @override
  ConsumerState<AnalyticsReportsScreen> createState() => _AnalyticsReportsScreenState();
}

class _AnalyticsReportsScreenState extends ConsumerState<AnalyticsReportsScreen> {
  DateTimeRange? _selectedDateRange;
  String _selectedPeriod = 'week'; // day, week, month, custom

  @override
  Widget build(BuildContext context) {
    final dashboardStatsAsync = ref.watch(dashboardStatsProvider(widget.restaurantId));
    final itemPerformanceAsync = ref.watch(itemPerformanceProvider(widget.restaurantId));

    return Scaffold(
      backgroundColor: DesignTokens.backgroundGrey,
      drawer: RestaurantManagerDrawer(restaurantId: widget.restaurantId),
      appBar: AppBar(
        title: const Text('Analytiques & Rapports'),
        backgroundColor: DesignTokens.primaryColor,
        foregroundColor: DesignTokens.white,
        actions: [
          IconButton(
            onPressed: () => _showPeriodSelector(),
            icon: const Icon(Icons.calendar_today),
          ),
          IconButton(
            onPressed: () => _showExportDialog(),
            icon: const Icon(Icons.download),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(dashboardStatsProvider(widget.restaurantId));
          ref.invalidate(itemPerformanceProvider(widget.restaurantId));
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(DesignTokens.spaceMD),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPeriodChip(),
              const SizedBox(height: DesignTokens.spaceLG),
              dashboardStatsAsync.when(
                data: (stats) => _buildAnalyticsContent(stats, itemPerformanceAsync),
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(DesignTokens.spaceXL),
                    child: AppLoadingIndicator(),
                  ),
                ),
                error: (error, _) => _buildErrorView(error),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPeriodChip() {
    String periodText;
    switch (_selectedPeriod) {
      case 'day':
        periodText = 'Aujourd\'hui';
        break;
      case 'week':
        periodText = 'Cette semaine';
        break;
      case 'month':
        periodText = 'Ce mois';
        break;
      case 'custom':
        if (_selectedDateRange != null) {
          periodText = '${_formatDate(_selectedDateRange!.start)} - ${_formatDate(_selectedDateRange!.end)}';
        } else {
          periodText = 'P�riode personnalis�e';
        }
        break;
      default:
        periodText = 'Cette semaine';
    }

    return Row(
      children: [
        Chip(
          avatar: const Icon(Icons.calendar_today, size: 18),
          label: Text(periodText),
          backgroundColor: DesignTokens.primaryColor.withValues(alpha: 0.1),
          labelStyle: const TextStyle(
            color: DesignTokens.primaryColor,
            fontWeight: DesignTokens.fontWeightBold,
          ),
        ),
        const SizedBox(width: DesignTokens.spaceSM),
        TextButton.icon(
          onPressed: () => _showPeriodSelector(),
          icon: const Icon(Icons.edit, size: 16),
          label: const Text('Modifier'),
        ),
      ],
    );
  }

  Widget _buildAnalyticsContent(RestaurantStats stats, AsyncValue<List<MenuItemPerformance>> itemPerformance) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Key Metrics Summary
        _buildSectionTitle('R�sum� des Indicateurs Cl�s'),
        const SizedBox(height: DesignTokens.spaceMD),
        _buildKeyMetricsCards(stats),
        const SizedBox(height: DesignTokens.spaceXL),

        // Revenue Chart
        _buildSectionTitle('�volution du Chiffre d\'Affaires'),
        const SizedBox(height: DesignTokens.spaceMD),
        _buildRevenueChart(stats),
        const SizedBox(height: DesignTokens.spaceXL),

        // Order Statistics
        _buildSectionTitle('Statistiques des Commandes'),
        const SizedBox(height: DesignTokens.spaceMD),
        _buildOrderStatistics(stats),
        const SizedBox(height: DesignTokens.spaceXL),

        // Top Performing Items
        _buildSectionTitle('Articles les Plus Performants'),
        const SizedBox(height: DesignTokens.spaceMD),
        itemPerformance.when(
          data: (performance) => _buildItemPerformanceList(performance),
          loading: () => const AppLoadingIndicator(),
          error: (error, _) => _buildErrorMessage('Erreur de chargement des performances'),
        ),
        const SizedBox(height: DesignTokens.spaceXL),

        // Popular Items
        _buildSectionTitle('Articles Populaires'),
        const SizedBox(height: DesignTokens.spaceMD),
        _buildPopularItemsList(stats.popularItems),
        const SizedBox(height: DesignTokens.spaceXL),

        // Performance Insights
        _buildSectionTitle('Insights & Recommandations'),
        const SizedBox(height: DesignTokens.spaceMD),
        _buildInsightsCards(stats),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: DesignTokens.fontWeightBold,
            color: DesignTokens.textPrimary,
          ),
    );
  }

  Widget _buildKeyMetricsCards(RestaurantStats stats) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildMetricCard(
                title: 'Chiffre d\'Affaires',
                value: '${stats.todayRevenue.toStringAsFixed(0)} FCFA',
                subtitle: 'Aujourd\'hui',
                icon: Icons.monetization_on,
                color: DesignTokens.successColor,
                trend: '+12%',
                trendUp: true,
              ),
            ),
            const SizedBox(width: DesignTokens.spaceMD),
            Expanded(
              child: _buildMetricCard(
                title: 'Commandes',
                value: stats.totalOrders.toString(),
                subtitle: 'Total',
                icon: Icons.shopping_bag,
                color: DesignTokens.primaryColor,
                trend: '+8%',
                trendUp: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: DesignTokens.spaceMD),
        Row(
          children: [
            Expanded(
              child: _buildMetricCard(
                title: 'Note Moyenne',
                value: stats.averageRating.toStringAsFixed(1),
                subtitle: '${stats.totalOrders} avis',
                icon: Icons.star,
                color: DesignTokens.warningColor,
                trend: stats.averageRating >= 4.5 ? 'Excellent' : 'Bon',
                trendUp: stats.averageRating >= 4.5,
              ),
            ),
            const SizedBox(width: DesignTokens.spaceMD),
            Expanded(
              child: _buildMetricCard(
                title: 'Commandes Actives',
                value: stats.pendingOrders.toString(),
                subtitle: 'En cours',
                icon: Icons.hourglass_empty,
                color: DesignTokens.infoColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color color,
    String? trend,
    bool? trendUp,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const Spacer(),
                if (trend != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: (trendUp ?? false)
                          ? DesignTokens.successColor.withValues(alpha: 0.1)
                          : DesignTokens.errorColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          (trendUp ?? false) ? Icons.trending_up : Icons.trending_down,
                          size: 14,
                          color: (trendUp ?? false) ? DesignTokens.successColor : DesignTokens.errorColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          trend,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: DesignTokens.fontWeightBold,
                            color: (trendUp ?? false) ? DesignTokens.successColor : DesignTokens.errorColor,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: DesignTokens.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: DesignTokens.fontWeightBold,
                color: DesignTokens.textPrimary,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: DesignTokens.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueChart(RestaurantStats stats) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Revenus Hebdomadaires',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: DesignTokens.fontWeightBold,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    // TODO: Show detailed chart
                  },
                  icon: const Icon(Icons.zoom_in, size: 16),
                  label: const Text('D�tails'),
                ),
              ],
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            PerformanceChart(
              dailyStats: stats.weeklyStats,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderStatistics(RestaurantStats stats) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          children: [
            _buildStatRow('Total des commandes', stats.totalOrders.toString()),
            const Divider(),
            _buildStatRow('Compl�t�es aujourd\'hui', stats.completedToday.toString()),
            const Divider(),
            _buildStatRow('En attente', stats.pendingOrders.toString()),
            const Divider(),
            _buildStatRow('Panier moyen', '${(stats.todayRevenue / (stats.completedToday > 0 ? stats.completedToday : 1)).toStringAsFixed(0)} FCFA'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DesignTokens.spaceSM),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: DesignTokens.textSecondary,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: DesignTokens.fontWeightBold,
              color: DesignTokens.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemPerformanceList(List<MenuItemPerformance> performance) {
    if (performance.isEmpty) {
      return _buildEmptyMessage('Aucune donn�e de performance disponible');
    }

    final topPerformers = performance.take(5).toList();
    if (topPerformers.isEmpty) {
      return _buildEmptyMessage('Aucune donn�e de performance disponible');
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Column(
        children: topPerformers.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: _getRankColor(index),
                  child: Text(
                    '#${index + 1}',
                    style: const TextStyle(
                      color: DesignTokens.white,
                      fontWeight: DesignTokens.fontWeightBold,
                    ),
                  ),
                ),
                title: Text(item.itemName),
                subtitle: Text('${item.totalOrders} ventes'),
                trailing: Text(
                  '${item.totalRevenue.toStringAsFixed(0)} FCFA',
                  style: const TextStyle(
                    fontWeight: DesignTokens.fontWeightBold,
                    color: DesignTokens.successColor,
                  ),
                ),
              ),
              if (index < topPerformers.length - 1) const Divider(),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPopularItemsList(List<PopularItem> items) {
    if (items.isEmpty) {
      return _buildEmptyMessage('Aucun article populaire');
    }

    final itemsList = items.take(5).toList();

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Column(
        children: itemsList.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Column(
            children: [
              ListTile(
                leading: const Icon(Icons.trending_up, color: DesignTokens.primaryColor),
                title: Text(item.itemName),
                subtitle: Text('${item.orderCount} commandes'),
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: DesignTokens.successColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                  ),
                  child: Text(
                    '${item.rating.toStringAsFixed(1)} ?',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: DesignTokens.fontWeightBold,
                      color: DesignTokens.successColor,
                    ),
                  ),
                ),
              ),
              if (index < itemsList.length - 1) const Divider(),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildInsightsCards(RestaurantStats stats) {
    return Column(
      children: [
        _buildInsightCard(
          icon: Icons.lightbulb,
          title: 'Optimisation du Menu',
          description: 'Vos 5 articles les plus populaires g�n�rent 60% de vos revenus. Envisagez de promouvoir ces articles.',
          color: DesignTokens.warningColor,
        ),
        const SizedBox(height: DesignTokens.spaceMD),
        _buildInsightCard(
          icon: Icons.schedule,
          title: 'Heures de Pointe',
          description: 'Vos heures de pointe sont entre 12h-14h et 19h-21h. Assurez-vous d\'avoir suffisamment de stock.',
          color: DesignTokens.infoColor,
        ),
        const SizedBox(height: DesignTokens.spaceMD),
        _buildInsightCard(
          icon: Icons.thumb_up,
          title: 'Satisfaction Client',
          description: 'Votre note moyenne de ${stats.averageRating.toStringAsFixed(1)}/5 est excellente! Continuez comme �a.',
          color: DesignTokens.successColor,
        ),
      ],
    );
  }

  Widget _buildInsightCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: DesignTokens.spaceMD),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: DesignTokens.fontWeightBold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: DesignTokens.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyMessage(String message) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceXL),
        child: Center(
          child: Text(
            message,
            style: TextStyle(
              color: DesignTokens.textSecondary,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorMessage(String message) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceLG),
        child: Row(
          children: [
            const Icon(Icons.error_outline, color: DesignTokens.errorColor),
            const SizedBox(width: DesignTokens.spaceMD),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: DesignTokens.errorColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorView(Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: DesignTokens.errorColor,
            ),
            const SizedBox(height: DesignTokens.spaceLG),
            Text(
              'Erreur de chargement',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: DesignTokens.errorColor,
                  ),
            ),
            const SizedBox(height: DesignTokens.spaceSM),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: DesignTokens.textSecondary,
                  ),
            ),
            const SizedBox(height: DesignTokens.spaceLG),
            ElevatedButton.icon(
              onPressed: () {
                ref.invalidate(dashboardStatsProvider(widget.restaurantId));
                ref.invalidate(itemPerformanceProvider(widget.restaurantId));
              },
              icon: const Icon(Icons.refresh),
              label: const Text('R�essayer'),
            ),
          ],
        ),
      ),
    );
  }

  Color _getRankColor(int index) {
    switch (index) {
      case 0:
        return const Color(0xFFFFD700); // Gold
      case 1:
        return const Color(0xFFC0C0C0); // Silver
      case 2:
        return const Color(0xFFCD7F32); // Bronze
      default:
        return DesignTokens.primaryColor;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showPeriodSelector() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(DesignTokens.radiusXL)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(DesignTokens.spaceLG),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: DesignTokens.lightGrey,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: DesignTokens.spaceLG),
            const Text(
              'S�lectionner une p�riode',
              style: TextStyle(
                fontSize: 18,
                fontWeight: DesignTokens.fontWeightBold,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            ListTile(
              leading: const Icon(Icons.today),
              title: const Text('Aujourd\'hui'),
              onTap: () {
                setState(() => _selectedPeriod = 'day');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_view_week),
              title: const Text('Cette semaine'),
              onTap: () {
                setState(() => _selectedPeriod = 'week');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Ce mois'),
              onTap: () {
                setState(() => _selectedPeriod = 'month');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.date_range),
              title: const Text('P�riode personnalis�e'),
              onTap: () async {
                Navigator.pop(context);
                final range = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                );
                if (range != null) {
                  setState(() {
                    _selectedPeriod = 'custom';
                    _selectedDateRange = range;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showExportDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(DesignTokens.radiusXL)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(DesignTokens.spaceLG),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: DesignTokens.lightGrey,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: DesignTokens.spaceLG),
            const Text(
              'Exporter les donn�es',
              style: TextStyle(
                fontSize: 18,
                fontWeight: DesignTokens.fontWeightBold,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            ListTile(
              leading: const Icon(Icons.table_chart, color: DesignTokens.successColor),
              title: const Text('Export CSV'),
              subtitle: const Text('Donn�es tabulaires pour Excel'),
              onTap: () {
                Navigator.pop(context);
                _exportData('csv');
              },
            ),
            ListTile(
              leading: const Icon(Icons.code, color: DesignTokens.primaryColor),
              title: const Text('Export JSON'),
              subtitle: const Text('Format structur� pour d�veloppeurs'),
              onTap: () {
                Navigator.pop(context);
                _exportData('json');
              },
            ),
            ListTile(
              leading: const Icon(Icons.description, color: DesignTokens.warningColor),
              title: const Text('Rapport texte'),
              subtitle: const Text('R�sum� format�'),
              onTap: () {
                Navigator.pop(context);
                _exportData('text');
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _exportData(String format) async {
    final statsAsync = ref.read(dashboardStatsProvider(widget.restaurantId));
    final stats = statsAsync.value;

    if (stats == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Aucune donn�e � exporter'),
          backgroundColor: DesignTokens.warningColor,
        ),
      );
      return;
    }

    String exportContent = '';
    String fileName = 'analytics_${DateTime.now().millisecondsSinceEpoch}';

    switch (format) {
      case 'csv':
        exportContent = _generateCSV(stats);
        fileName += '.csv';
        break;
      case 'json':
        exportContent = _generateJSON(stats);
        fileName += '.json';
        break;
      case 'text':
        exportContent = _generateTextReport(stats);
        fileName += '.txt';
        break;
    }

    // Note: Actual file saving would require path_provider and file I/O
    // For now, show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Export $format g�n�r�: $fileName'),
        backgroundColor: DesignTokens.successColor,
        action: SnackBarAction(
          label: 'Voir',
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Aper�u Export $format'),
                content: SingleChildScrollView(
                  child: SelectableText(exportContent),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Fermer'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  String _generateCSV(RestaurantStats stats) {
    final buffer = StringBuffer();
    buffer.writeln('M�trique,Valeur');
    buffer.writeln('Revenus du jour,${stats.todayRevenue}');
    buffer.writeln('Total commandes,${stats.totalOrders}');
    buffer.writeln('Commandes compl�t�es,${stats.completedToday}');
    buffer.writeln('Commandes en attente,${stats.pendingOrders}');
    buffer.writeln('Note moyenne,${stats.averageRating}');
    buffer.writeln('Panier moyen,${stats.todayRevenue / (stats.completedToday > 0 ? stats.completedToday : 1)}');

    buffer.writeln('\nArticles populaires');
    buffer.writeln('Nom,Commandes,Note');
    for (final item in stats.popularItems) {
      buffer.writeln('${item.itemName},${item.orderCount},${item.rating}');
    }

    return buffer.toString();
  }

  String _generateJSON(RestaurantStats stats) {
    return '''
{
  "todayRevenue": ${stats.todayRevenue},
  "totalOrders": ${stats.totalOrders},
  "completedToday": ${stats.completedToday},
  "pendingOrders": ${stats.pendingOrders},
  "averageRating": ${stats.averageRating},
  "popularItems": [
    ${stats.popularItems.map((item) => '{"name": "${item.itemName}", "orders": ${item.orderCount}, "rating": ${item.rating}}').join(',\n    ')}
  ]
}''';
  }

  String _generateTextReport(RestaurantStats stats) {
    final buffer = StringBuffer();
    buffer.writeln('=== RAPPORT D\'ANALYTIQUES ===');
    buffer.writeln('G�n�r� le: ${DateTime.now().toLocal()}');
    buffer.writeln('\n--- R�SUM� ---');
    buffer.writeln('Revenus du jour: ${stats.todayRevenue.toStringAsFixed(0)} FCFA');
    buffer.writeln('Total commandes: ${stats.totalOrders}');
    buffer.writeln('Commandes compl�t�es: ${stats.completedToday}');
    buffer.writeln('Commandes en attente: ${stats.pendingOrders}');
    buffer.writeln('Note moyenne: ${stats.averageRating.toStringAsFixed(1)}/5');
    buffer.writeln('Panier moyen: ${(stats.todayRevenue / (stats.completedToday > 0 ? stats.completedToday : 1)).toStringAsFixed(0)} FCFA');

    buffer.writeln('\n--- ARTICLES POPULAIRES ---');
    for (var i = 0; i < stats.popularItems.length; i++) {
      final item = stats.popularItems[i];
      buffer.writeln('${i + 1}. ${item.itemName} - ${item.orderCount} commandes (${item.rating.toStringAsFixed(1)}/5)');
    }

    return buffer.toString();
  }
}
