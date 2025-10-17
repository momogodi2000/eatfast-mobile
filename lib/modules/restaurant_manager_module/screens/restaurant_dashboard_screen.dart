import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';
import 'package:eatfast_mobile/shared/widgets/common/app_loading_indicator.dart';
import 'package:eatfast_mobile/modules/restaurant_manager_module/providers/restaurant_owner_provider.dart';
import 'package:eatfast_mobile/shared/models/restaurant_stats.dart';
import 'package:eatfast_mobile/shared/models/live_order.dart';
import '../widgets/widgets/dashboard_stats_card.dart';
import '../widgets/widgets/quick_actions_grid.dart';
import '../widgets/widgets/live_orders_preview.dart';
import '../widgets/widgets/performance_chart.dart';
import '../widgets/widgets/popular_items_list.dart';
import '../widgets/widgets/restaurant_manager_drawer.dart';

class RestaurantDashboardScreen extends ConsumerStatefulWidget {
  final String restaurantId;
  
  const RestaurantDashboardScreen({
    super.key,
    required this.restaurantId,
  });

  @override
  ConsumerState<RestaurantDashboardScreen> createState() => _RestaurantDashboardScreenState();
}

class _RestaurantDashboardScreenState extends ConsumerState<RestaurantDashboardScreen>
    with AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    final dashboardState = ref.watch(restaurantOwnerProvider(widget.restaurantId));
    final liveOrdersAsync = ref.watch(liveOrdersProvider(widget.restaurantId));
    
    return Scaffold(
      backgroundColor: DesignTokens.backgroundGrey,
      drawer: RestaurantManagerDrawer(restaurantId: widget.restaurantId),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => _refreshData(),
          child: CustomScrollView(
            slivers: [
              _buildAppBar(),
              SliverPadding(
                padding: const EdgeInsets.all(DesignTokens.spaceMD),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildStatsSection(dashboardState.stats),
                    const SizedBox(height: DesignTokens.spaceLG),
                    _buildQuickActions(),
                    const SizedBox(height: DesignTokens.spaceLG),
                    _buildLiveOrdersSection(liveOrdersAsync),
                    const SizedBox(height: DesignTokens.spaceLG),
                    _buildPerformanceSection(dashboardState.stats),
                    const SizedBox(height: DesignTokens.spaceLG),
                    _buildPopularItemsSection(dashboardState.stats),
                    const SizedBox(height: DesignTokens.spaceXL),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'restaurant_dashboard_fab',
        onPressed: () => _showNewOrderDialog(),
        icon: const Icon(Icons.add),
        label: const Text('Nouvelle commande'),
        backgroundColor: DesignTokens.primaryColor,
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 120,
      floating: false,
      pinned: true,
      backgroundColor: DesignTokens.primaryColor,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu, color: DesignTokens.white),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'Tableau de bord',
          style: TextStyle(
            color: DesignTokens.white,
            fontWeight: DesignTokens.fontWeightBold,
          ),
        ),
        background: Container(
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
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => context.push('/restaurant-owner/${widget.restaurantId}/notifications'),
          icon: Stack(
            children: [
              const Icon(Icons.notifications_outlined, color: DesignTokens.white),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: DesignTokens.errorColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(
                      color: DesignTokens.white,
                      fontSize: 10,
                      fontWeight: DesignTokens.fontWeightBold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => context.push('/restaurant-owner/${widget.restaurantId}/settings'),
          icon: const Icon(Icons.settings_outlined, color: DesignTokens.white),
        ),
      ],
    );
  }

  Widget _buildStatsSection(RestaurantStats? stats) {
    if (stats == null) {
      return const AppLoadingIndicator();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Statistiques d\'aujourd\'hui',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: DesignTokens.fontWeightBold,
            color: DesignTokens.textPrimary,
          ),
        ),
        const SizedBox(height: DesignTokens.spaceMD),
        Row(
          children: [
            Expanded(
              child: DashboardStatsCard(
                title: 'Commandes',
                value: stats.completedToday.toString(),
                subtitle: 'Aujourd\'hui',
                icon: Icons.receipt_long,
                color: DesignTokens.primaryColor,
                trend: '+12%',
              ),
            ),
            const SizedBox(width: DesignTokens.spaceMD),
            Expanded(
              child: DashboardStatsCard(
                title: 'Revenus',
                value: '${stats.todayRevenue.toStringAsFixed(0)} FCFA',
                subtitle: 'Aujourd\'hui',
                icon: Icons.payments,
                color: DesignTokens.successColor,
                trend: '+8%',
              ),
            ),
          ],
        ),
        const SizedBox(height: DesignTokens.spaceMD),
        Row(
          children: [
            Expanded(
              child: DashboardStatsCard(
                title: 'Note moyenne',
                value: stats.averageRating.toStringAsFixed(1),
                subtitle: '? ${stats.totalOrders} avis',
                icon: Icons.star,
                color: DesignTokens.warningColor,
              ),
            ),
            const SizedBox(width: DesignTokens.spaceMD),
            Expanded(
              child: DashboardStatsCard(
                title: 'En attente',
                value: stats.pendingOrders.toString(),
                subtitle: 'Commandes',
                icon: Icons.hourglass_empty,
                color: stats.pendingOrders > 5 ? DesignTokens.errorColor : DesignTokens.infoColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Actions rapides',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: DesignTokens.fontWeightBold,
            color: DesignTokens.textPrimary,
          ),
        ),
        const SizedBox(height: DesignTokens.spaceMD),
        QuickActionsGrid(
          restaurantId: widget.restaurantId,
        ),
      ],
    );
  }

  Widget _buildLiveOrdersSection(AsyncValue<List<LiveOrder>> liveOrdersAsync) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Commandes en direct',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: DesignTokens.fontWeightBold,
                color: DesignTokens.textPrimary,
              ),
            ),
            TextButton.icon(
              onPressed: () => context.push('/restaurant-owner/${widget.restaurantId}/orders'),
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Tout voir'),
            ),
          ],
        ),
        const SizedBox(height: DesignTokens.spaceMD),
        liveOrdersAsync.when(
          data: (orders) => LiveOrdersPreview(
            orders: orders.where((order) => order.status.isActive).take(3).toList(),
            onOrderTap: (orderId) => context.push('/restaurant-owner/${widget.restaurantId}/orders/$orderId'),
          ),
          loading: () => const AppLoadingIndicator(),
          error: (error, _) => Container(
            padding: const EdgeInsets.all(DesignTokens.spaceMD),
            decoration: BoxDecoration(
              color: DesignTokens.errorColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
            ),
            child: Row(
              children: [
                const Icon(Icons.error_outline, color: DesignTokens.errorColor),
                const SizedBox(width: DesignTokens.spaceSM),
                Expanded(
                  child: Text(
                    'Erreur: $error',
                    style: const TextStyle(color: DesignTokens.errorColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPerformanceSection(RestaurantStats? stats) {
    if (stats == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Performance',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: DesignTokens.fontWeightBold,
                color: DesignTokens.textPrimary,
              ),
            ),
            TextButton.icon(
              onPressed: () => context.push('/restaurant-owner/${widget.restaurantId}/analytics'),
              icon: const Icon(Icons.analytics),
              label: const Text('Analytiques'),
            ),
          ],
        ),
        const SizedBox(height: DesignTokens.spaceMD),
        PerformanceChart(
          dailyStats: stats.weeklyStats,
          height: 200,
        ),
      ],
    );
  }

  Widget _buildPopularItemsSection(RestaurantStats? stats) {
    if (stats == null || stats.popularItems.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Articles populaires',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: DesignTokens.fontWeightBold,
                color: DesignTokens.textPrimary,
              ),
            ),
            TextButton.icon(
              onPressed: () => context.push('/restaurant-owner/${widget.restaurantId}/menu'),
              icon: const Icon(Icons.restaurant_menu),
              label: const Text('G�rer menu'),
            ),
          ],
        ),
        const SizedBox(height: DesignTokens.spaceMD),
        PopularItemsList(
          items: stats.popularItems.take(5).toList(),
          onItemTap: (itemId) => context.push('/restaurant-owner/${widget.restaurantId}/menu/items/$itemId'),
        ),
      ],
    );
  }

  Future<void> _refreshData() async {
    await Future.wait([
      ref.refresh(dashboardStatsProvider(widget.restaurantId).future),
      ref.refresh(liveOrdersProvider(widget.restaurantId).future),
    ]);
  }

  void _showNewOrderDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: DraggableScrollableSheet(
          initialChildSize: 0.7,
          maxChildSize: 0.95,
          minChildSize: 0.5,
          builder: (context, scrollController) => Container(
            decoration: const BoxDecoration(
              color: DesignTokens.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(DesignTokens.radiusXL),
                topRight: Radius.circular(DesignTokens.radiusXL),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: DesignTokens.spaceMD),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: DesignTokens.lightGrey,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(DesignTokens.spaceLG),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nouvelle commande',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: DesignTokens.fontWeightBold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: DesignTokens.spaceLG),
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: DesignTokens.primaryColor,
                          child: Icon(Icons.phone, color: DesignTokens.white),
                        ),
                        title: const Text('Commande t�l�phonique'),
                        subtitle: const Text('Cr�er une commande pour un client'),
                        onTap: () {
                          Navigator.pop(context);
                          context.push('/restaurant-owner/${widget.restaurantId}/orders/create');
                        },
                      ),
                      ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: DesignTokens.successColor,
                          child: Icon(Icons.store, color: DesignTokens.white),
                        ),
                        title: const Text('Commande sur place'),
                        subtitle: const Text('Pour les clients qui mangent au restaurant'),
                        onTap: () {
                          Navigator.pop(context);
                          context.push('/restaurant-owner/${widget.restaurantId}/orders/dine-in');
                        },
                      ),
                      ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: DesignTokens.warningColor,
                          child: Icon(Icons.takeout_dining, color: DesignTokens.white),
                        ),
                        title: const Text('� emporter'),
                        subtitle: const Text('Commande � r�cup�rer par le client'),
                        onTap: () {
                          Navigator.pop(context);
                          context.push('/restaurant-owner/${widget.restaurantId}/orders/takeaway');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
