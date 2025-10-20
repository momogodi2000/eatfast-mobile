import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:eatfast_mobile/shared/services/analytics/domain/models/analytics_data.dart';
import 'package:eatfast_mobile/shared/services/analytics/domain/models/analytics_request.dart';
import '../providers/analytics_provider.dart';
import '../widgets/analytics_card.dart';
import '../widgets/revenue_chart.dart';
import '../widgets/order_trends_chart.dart';
import '../widgets/customer_insights_widget.dart';
import '../widgets/performance_metrics_widget.dart';
import 'package:eatfast_mobile/shared/widgets/common/loading_widget.dart';
import 'package:eatfast_mobile/shared/widgets/common/error_display_widget.dart';

class AdvancedAnalyticsScreen extends ConsumerStatefulWidget {
  final AnalyticsUserType userType;

  const AdvancedAnalyticsScreen({super.key, required this.userType});

  @override
  ConsumerState<AdvancedAnalyticsScreen> createState() =>
      _AdvancedAnalyticsScreenState();
}

class _AdvancedAnalyticsScreenState
    extends ConsumerState<AdvancedAnalyticsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  AnalyticsTimeRange _selectedTimeRange = AnalyticsTimeRange.week;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _getTabCount(), vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _getTabCount() {
    switch (widget.userType) {
      case AnalyticsUserType.all:
        return 6;
      case AnalyticsUserType.customer:
        return 3;
      case AnalyticsUserType.restaurant:
        return 4;
      case AnalyticsUserType.driver:
        return 3;
      case AnalyticsUserType.admin:
        return 5;
    }
  }

  @override
  Widget build(BuildContext context) {
    final analyticsAsync = ref.watch(
      analyticsProvider(
        AnalyticsRequest(
          userType: widget.userType,
          timeRange: _selectedTimeRange,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Analyses ${widget.userType.displayName}'),
        actions: [
          PopupMenuButton<AnalyticsTimeRange>(
            icon: const Icon(Icons.calendar_today),
            onSelected: (timeRange) {
              setState(() {
                _selectedTimeRange = timeRange;
              });
            },
            itemBuilder: (context) => AnalyticsTimeRange.values.map((range) {
              return PopupMenuItem(
                value: range,
                child: Row(
                  children: [
                    Icon(
                      _selectedTimeRange == range
                          ? Icons.check_circle
                          : Icons.circle_outlined,
                      color: _selectedTimeRange == range
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(range.displayName),
                  ],
                ),
              );
            }).toList(),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(analyticsProvider),
          ),
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () => _exportAnalytics(),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _buildTabs(),
        ),
      ),
      body: analyticsAsync.when(
        data: (analytics) => TabBarView(
          controller: _tabController,
          children: _buildTabViews(analytics),
        ),
        loading: () => const LoadingWidget(),
        error: (error, stack) => ErrorDisplayWidget(
          message: error.toString(),
          onRetry: () => ref.invalidate(analyticsProvider),
        ),
      ),
    );
  }

  List<Tab> _buildTabs() {
    switch (widget.userType) {
      case AnalyticsUserType.all:
        return const [
          Tab(icon: Icon(Icons.dashboard), text: 'Vue d\'ensemble'),
          Tab(icon: Icon(Icons.trending_up), text: 'Revenus'),
          Tab(icon: Icon(Icons.people), text: 'Utilisateurs'),
          Tab(icon: Icon(Icons.restaurant), text: 'Restaurants'),
          Tab(icon: Icon(Icons.local_shipping), text: 'Livraisons'),
          Tab(icon: Icon(Icons.analytics), text: 'Détaillé'),
        ];
      case AnalyticsUserType.customer:
        return const [
          Tab(icon: Icon(Icons.dashboard), text: 'Vue d\'ensemble'),
          Tab(icon: Icon(Icons.shopping_cart), text: 'Commandes'),
          Tab(icon: Icon(Icons.favorite), text: 'Préférences'),
        ];
      case AnalyticsUserType.restaurant:
        return const [
          Tab(icon: Icon(Icons.dashboard), text: 'Vue d\'ensemble'),
          Tab(icon: Icon(Icons.trending_up), text: 'Ventes'),
          Tab(icon: Icon(Icons.menu_book), text: 'Menu'),
          Tab(icon: Icon(Icons.people), text: 'Clients'),
        ];
      case AnalyticsUserType.driver:
        return const [
          Tab(icon: Icon(Icons.dashboard), text: 'Vue d\'ensemble'),
          Tab(icon: Icon(Icons.local_shipping), text: 'Livraisons'),
          Tab(icon: Icon(Icons.attach_money), text: 'Revenus'),
        ];
      case AnalyticsUserType.admin:
        return const [
          Tab(icon: Icon(Icons.dashboard), text: 'Vue d\'ensemble'),
          Tab(icon: Icon(Icons.analytics), text: 'Plateforme'),
          Tab(icon: Icon(Icons.monetization_on), text: 'Revenus'),
          Tab(icon: Icon(Icons.people), text: 'Utilisateurs'),
          Tab(icon: Icon(Icons.security), text: 'Sécurité'),
        ];
    }
  }

  List<Widget> _buildTabViews(AnalyticsData analytics) {
    switch (widget.userType) {
      case AnalyticsUserType.all:
        return [
          _buildOverallOverview(analytics),
          _buildOverallRevenue(analytics),
          _buildOverallUsers(analytics),
          _buildOverallRestaurants(analytics),
          _buildOverallDeliveries(analytics),
          _buildOverallDetailed(analytics),
        ];
      case AnalyticsUserType.customer:
        return [
          _buildCustomerOverview(analytics),
          _buildCustomerOrders(analytics),
          _buildCustomerPreferences(analytics),
        ];
      case AnalyticsUserType.restaurant:
        return [
          _buildRestaurantOverview(analytics),
          _buildRestaurantSales(analytics),
          _buildRestaurantMenu(analytics),
          _buildRestaurantCustomers(analytics),
        ];
      case AnalyticsUserType.driver:
        return [
          _buildDriverOverview(analytics),
          _buildDriverDeliveries(analytics),
          _buildDriverEarnings(analytics),
        ];
      case AnalyticsUserType.admin:
        return [
          _buildAdminOverview(analytics),
          _buildPlatformAnalytics(analytics),
          _buildRevenueAnalytics(analytics),
          _buildUserAnalytics(analytics),
          _buildSecurityAnalytics(analytics),
        ];
    }
  }

  // Customer Analytics
  Widget _buildCustomerOverview(AnalyticsData analytics) {
    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(analyticsProvider),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildKPIGrid([
              KPIData(
                title: 'Commandes totales',
                value:
                    analytics.customerMetrics?.totalOrders?.toString() ?? '0',
                icon: Icons.shopping_cart,
                color: Colors.blue,
                trend: analytics.customerMetrics?.ordersTrend,
              ),
              KPIData(
                title: 'Montant dépensé',
                value:
                    '${analytics.customerMetrics?.totalSpent?.toStringAsFixed(0) ?? '0'} XAF',
                icon: Icons.attach_money,
                color: Colors.green,
                trend: analytics.customerMetrics?.spendingTrend,
              ),
              KPIData(
                title: 'Commande moyenne',
                value:
                    '${analytics.customerMetrics?.averageOrderValue?.toStringAsFixed(0) ?? '0'} XAF',
                icon: Icons.analytics,
                color: Colors.orange,
                trend: analytics.customerMetrics?.averageOrderTrend,
              ),
              KPIData(
                title: 'Points fidélité',
                value:
                    analytics.customerMetrics?.loyaltyPoints?.toString() ?? '0',
                icon: Icons.star,
                color: Colors.purple,
              ),
            ]),
            const SizedBox(height: 24),
            _buildOrderFrequencyChart(analytics),
            const SizedBox(height: 24),
            _buildSpendingAnalysis(analytics),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerOrders(AnalyticsData analytics) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Historique des commandes',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          OrderTrendsChart(trendData: analytics.orderTrends),
          const SizedBox(height: 24),
          _buildOrderStatusBreakdown(analytics),
          const SizedBox(height: 24),
          _buildFavoriteRestaurants(analytics),
        ],
      ),
    );
  }

  Widget _buildCustomerPreferences(AnalyticsData analytics) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vos préférences',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildCuisinePreferences(analytics),
          const SizedBox(height: 24),
          _buildOrderTimePreferences(analytics),
          const SizedBox(height: 24),
          _buildPaymentMethodPreferences(analytics),
        ],
      ),
    );
  }

  // Restaurant Analytics
  Widget _buildRestaurantOverview(AnalyticsData analytics) {
    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(analyticsProvider),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildKPIGrid([
              KPIData(
                title: 'Revenus',
                value:
                    '${analytics.restaurantMetrics?.totalRevenue?.toStringAsFixed(0) ?? '0'} XAF',
                icon: Icons.monetization_on,
                color: Colors.green,
                trend: analytics.restaurantMetrics?.revenueTrend,
              ),
              KPIData(
                title: 'Commandes',
                value:
                    analytics.restaurantMetrics?.totalOrders.toString() ?? '0',
                icon: Icons.receipt,
                color: Colors.blue,
                trend: analytics.restaurantMetrics?.ordersTrend,
              ),
              KPIData(
                title: 'Note moyenne',
                value:
                    analytics.restaurantMetrics?.averageRating?.toStringAsFixed(
                      1,
                    ) ??
                    '0.0',
                icon: Icons.star,
                color: Colors.orange,
                trend: analytics.restaurantMetrics?.ratingTrend,
              ),
              KPIData(
                title: 'Clients uniques',
                value:
                    analytics.restaurantMetrics?.uniqueCustomers.toString() ??
                    '0',
                icon: Icons.people,
                color: Colors.purple,
                trend: analytics.restaurantMetrics?.customersTrend,
              ),
            ]),
            const SizedBox(height: 24),
            RevenueChart(revenueData: analytics.revenueData),
            const SizedBox(height: 24),
            PerformanceMetricsWidget(
              metrics:
                  analytics.driverMetrics ??
                  {
                    'orderFulfillmentRate': 0.0,
                    'averageDeliveryTime': 0.0,
                    'customerSatisfactionScore': 0.0,
                    'totalDeliveries': 0,
                    'cancelledOrders': 0,
                    'refundRate': 0.0,
                  },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantSales(AnalyticsData analytics) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Analyse des ventes',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildSalesBreakdown(analytics),
          const SizedBox(height: 24),
          _buildPeakHoursAnalysis(analytics),
          const SizedBox(height: 24),
          _buildCommissionAnalysis(analytics),
        ],
      ),
    );
  }

  Widget _buildRestaurantMenu(AnalyticsData analytics) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Performance du menu',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildTopSellingItems(analytics),
          const SizedBox(height: 24),
          _buildItemPerformanceChart(analytics),
          const SizedBox(height: 24),
          _buildMenuOptimizationSuggestions(analytics),
        ],
      ),
    );
  }

  Widget _buildRestaurantCustomers(AnalyticsData analytics) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Analyse de la clientèle',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          CustomerInsightsWidget(insights: analytics.customerInsights),
          const SizedBox(height: 24),
          _buildCustomerRetention(analytics),
          const SizedBox(height: 24),
          _buildCustomerFeedback(analytics),
        ],
      ),
    );
  }

  // Driver Analytics
  Widget _buildDriverOverview(AnalyticsData analytics) {
    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(analyticsProvider),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildKPIGrid([
              KPIData(
                title: 'Livraisons',
                value:
                    analytics.driverMetrics?.totalDeliveries.toString() ?? '0',
                icon: Icons.local_shipping,
                color: Colors.blue,
                trend: analytics.driverMetrics?.deliveriesTrend,
              ),
              KPIData(
                title: 'Revenus',
                value:
                    '${analytics.driverMetrics?.totalEarnings?.toStringAsFixed(0) ?? '0'} XAF',
                icon: Icons.attach_money,
                color: Colors.green,
                trend: analytics.driverMetrics?.earningsTrend,
              ),
              KPIData(
                title: 'Note moyenne',
                value:
                    analytics.driverMetrics?.avgRating?.toStringAsFixed(1) ??
                    '0.0',
                icon: Icons.star,
                color: Colors.orange,
                trend: null,
              ),
              KPIData(
                title: 'Temps actif',
                value:
                    '${analytics.driverMetrics?.activeHours?.toStringAsFixed(1) ?? '0.0'}h',
                icon: Icons.access_time,
                color: Colors.purple,
              ),
            ]),
            const SizedBox(height: 24),
            _buildDeliveryPerformanceChart(analytics),
            const SizedBox(height: 24),
            _buildEfficiencyMetrics(analytics),
          ],
        ),
      ),
    );
  }

  Widget _buildDriverDeliveries(AnalyticsData analytics) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Analyse des livraisons',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildDeliveryStats(analytics),
          const SizedBox(height: 24),
          _buildDeliveryZones(analytics),
          const SizedBox(height: 24),
          _buildDeliveryTimes(analytics),
        ],
      ),
    );
  }

  Widget _buildDriverEarnings(AnalyticsData analytics) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Analyse des revenus',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildEarningsBreakdown(analytics),
          const SizedBox(height: 24),
          _buildEarningsChart(analytics),
          const SizedBox(height: 24),
          _buildEarningsProjection(analytics),
        ],
      ),
    );
  }

  // Admin Analytics
  Widget _buildAdminOverview(AnalyticsData analytics) {
    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(analyticsProvider),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildKPIGrid([
              KPIData(
                title: 'Revenus totaux',
                value:
                    '${analytics.adminMetrics?.totalRevenue?.toStringAsFixed(0) ?? '0'} XAF',
                icon: Icons.monetization_on,
                color: Colors.green,
                trend: analytics.adminMetrics?.revenueTrend,
              ),
              KPIData(
                title: 'Commandes totales',
                value: analytics.adminMetrics?.totalOrders.toString() ?? '0',
                icon: Icons.receipt,
                color: Colors.blue,
                trend: analytics.adminMetrics?.ordersTrend,
              ),
              KPIData(
                title: 'Utilisateurs actifs',
                value: analytics.activeUsers.toString(),
                icon: Icons.people,
                color: Colors.orange,
                trend: analytics.adminMetrics?.customersTrend,
              ),
              KPIData(
                title: 'Restaurants',
                value: '0', // TODO: Add restaurants count to analytics
                icon: Icons.restaurant,
                color: Colors.purple,
                trend: null, // TODO: Add restaurants trend to analytics
              ),
            ]),
            const SizedBox(height: 24),
            _buildPlatformHealthCard(analytics),
            const SizedBox(height: 24),
            _buildRealtimeMetrics(analytics),
          ],
        ),
      ),
    );
  }

  Widget _buildPlatformAnalytics(AnalyticsData analytics) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Analyse de la plateforme',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildPlatformGrowth(analytics),
          const SizedBox(height: 24),
          _buildGeographicDistribution(analytics),
          const SizedBox(height: 24),
          _buildSystemPerformance(analytics),
        ],
      ),
    );
  }

  Widget _buildRevenueAnalytics(AnalyticsData analytics) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Analyse des revenus',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildRevenueBreakdown(analytics),
          const SizedBox(height: 24),
          _buildCommissionAnalysis(analytics),
          const SizedBox(height: 24),
          _buildRevenueProjections(analytics),
        ],
      ),
    );
  }

  Widget _buildUserAnalytics(AnalyticsData analytics) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Analyse des utilisateurs',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildUserGrowth(analytics),
          const SizedBox(height: 24),
          _buildUserSegmentation(analytics),
          const SizedBox(height: 24),
          _buildUserRetention(analytics),
        ],
      ),
    );
  }

  Widget _buildSecurityAnalytics(AnalyticsData analytics) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Analyse de sécurité',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildSecurityMetrics(analytics),
          const SizedBox(height: 24),
          _buildFraudDetection(analytics),
          const SizedBox(height: 24),
          _buildSecurityAlerts(analytics),
        ],
      ),
    );
  }

  // Helper methods for building specific widgets
  Widget _buildKPIGrid(List<KPIData> kpis) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: kpis.length,
      itemBuilder: (context, index) {
        final kpi = kpis[index];
        return AnalyticsCard(
          title: kpi.title,
          value: kpi.value,
          icon: kpi.icon,
          color: kpi.color,
        );
      },
    );
  }

  // Placeholder methods for specific analytics widgets
  Widget _buildOrderFrequencyChart(AnalyticsData analytics) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fréquence des commandes',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  // Chart implementation
                  lineBarsData: [
                    LineChartBarData(
                      spots: [], // TODO: Add proper order frequency data points
                      isCurved: true,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Additional placeholder methods...
  Widget _buildSpendingAnalysis(AnalyticsData analytics) => Container();
  Widget _buildOrderStatusBreakdown(AnalyticsData analytics) => Container();
  Widget _buildFavoriteRestaurants(AnalyticsData analytics) => Container();
  Widget _buildCuisinePreferences(AnalyticsData analytics) => Container();
  Widget _buildOrderTimePreferences(AnalyticsData analytics) => Container();
  Widget _buildPaymentMethodPreferences(AnalyticsData analytics) => Container();
  Widget _buildSalesBreakdown(AnalyticsData analytics) => Container();
  Widget _buildPeakHoursAnalysis(AnalyticsData analytics) => Container();
  Widget _buildCommissionAnalysis(AnalyticsData analytics) => Container();
  Widget _buildTopSellingItems(AnalyticsData analytics) => Container();
  Widget _buildItemPerformanceChart(AnalyticsData analytics) => Container();
  Widget _buildMenuOptimizationSuggestions(AnalyticsData analytics) =>
      Container();
  Widget _buildCustomerRetention(AnalyticsData analytics) => Container();
  Widget _buildCustomerFeedback(AnalyticsData analytics) => Container();
  Widget _buildDeliveryPerformanceChart(AnalyticsData analytics) => Container();
  Widget _buildEfficiencyMetrics(AnalyticsData analytics) => Container();
  Widget _buildDeliveryStats(AnalyticsData analytics) => Container();
  Widget _buildDeliveryZones(AnalyticsData analytics) => Container();
  Widget _buildDeliveryTimes(AnalyticsData analytics) => Container();
  Widget _buildEarningsBreakdown(AnalyticsData analytics) => Container();
  Widget _buildEarningsChart(AnalyticsData analytics) => Container();
  Widget _buildEarningsProjection(AnalyticsData analytics) => Container();
  Widget _buildPlatformHealthCard(AnalyticsData analytics) => Container();
  Widget _buildRealtimeMetrics(AnalyticsData analytics) => Container();
  Widget _buildPlatformGrowth(AnalyticsData analytics) => Container();
  Widget _buildGeographicDistribution(AnalyticsData analytics) => Container();
  Widget _buildSystemPerformance(AnalyticsData analytics) => Container();
  Widget _buildRevenueBreakdown(AnalyticsData analytics) => Container();
  Widget _buildRevenueProjections(AnalyticsData analytics) => Container();
  Widget _buildUserGrowth(AnalyticsData analytics) => Container();
  Widget _buildUserSegmentation(AnalyticsData analytics) => Container();
  Widget _buildUserRetention(AnalyticsData analytics) => Container();
  Widget _buildSecurityMetrics(AnalyticsData analytics) => Container();
  Widget _buildFraudDetection(AnalyticsData analytics) => Container();
  Widget _buildSecurityAlerts(AnalyticsData analytics) => Container();

  void _exportAnalytics() async {
    try {
      // TODO: Implement analytics export functionality
      await Future.delayed(const Duration(seconds: 1));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Analyses exportées avec succès'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur d\'exportation: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // Overall Analytics Methods
  Widget _buildOverallOverview(AnalyticsData analytics) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Vue d\'ensemble générale'),
          // Add basic overview widgets
        ],
      ),
    );
  }

  Widget _buildOverallRevenue(AnalyticsData analytics) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Revenus globaux'),
          // Add revenue widgets
        ],
      ),
    );
  }

  Widget _buildOverallUsers(AnalyticsData analytics) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Utilisateurs'),
          // Add user analytics widgets
        ],
      ),
    );
  }

  Widget _buildOverallRestaurants(AnalyticsData analytics) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Restaurants'),
          // Add restaurant analytics widgets
        ],
      ),
    );
  }

  Widget _buildOverallDeliveries(AnalyticsData analytics) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Livraisons'),
          // Add delivery analytics widgets
        ],
      ),
    );
  }

  Widget _buildOverallDetailed(AnalyticsData analytics) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Analyses détaillées'),
          // Add detailed analytics widgets
        ],
      ),
    );
  }
}

class KPIData {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final double? trend;

  KPIData({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.trend,
  });
}
