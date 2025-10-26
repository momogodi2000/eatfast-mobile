import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/utils/utils/responsive_utils.dart';

class ResponsiveRestaurantDashboardScreen extends ConsumerStatefulWidget {
  final String restaurantId;

  const ResponsiveRestaurantDashboardScreen({
    super.key,
    required this.restaurantId,
  });

  @override
  ConsumerState<ResponsiveRestaurantDashboardScreen> createState() =>
      _ResponsiveRestaurantDashboardScreenState();
}

class _ResponsiveRestaurantDashboardScreenState
    extends ConsumerState<ResponsiveRestaurantDashboardScreen>
    with AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: ResponsiveLayout(
          mobile: _buildMobileLayout(),
          tablet: _buildTabletLayout(),
          desktop: _buildDesktopLayout(),
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: CustomScrollView(
        slivers: [
          _buildResponsiveAppBar(),
          SliverPadding(
            padding: ResponsiveUtils.responsivePadding(
              context,
              mobile: const EdgeInsets.all(16),
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildStatsSection(),
                const SizedBox(height: 16),
                _buildQuickActions(),
                const SizedBox(height: 16),
                _buildLiveOrders(),
                const SizedBox(height: 16),
                _buildPerformanceChart(),
                const SizedBox(height: 16),
                _buildPopularItems(),
                const SizedBox(height: 80), // Bottom navigation space
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletLayout() {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: CustomScrollView(
        slivers: [
          _buildResponsiveAppBar(),
          SliverPadding(
            padding: ResponsiveUtils.responsivePadding(
              context,
              tablet: const EdgeInsets.all(24),
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildStatsSection(),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          _buildQuickActions(),
                          const SizedBox(height: 24),
                          _buildPopularItems(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          _buildLiveOrders(),
                          const SizedBox(height: 24),
                          _buildPerformanceChart(),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: CustomScrollView(
        slivers: [
          _buildResponsiveAppBar(),
          SliverPadding(
            padding: ResponsiveUtils.responsivePadding(
              context,
              desktop: const EdgeInsets.all(32),
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildStatsSection(),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          _buildQuickActions(),
                          const SizedBox(height: 32),
                          _buildPopularItems(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          _buildLiveOrders(),
                          const SizedBox(height: 32),
                          _buildPerformanceChart(),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveAppBar() {
    final theme = Theme.of(context);
    
    return SliverAppBar(
      expandedHeight: ResponsiveUtils.responsiveValue(
        context,
        mobile: 200.0,
        tablet: 220.0,
        desktop: 240.0,
      ),
      floating: false,
      pinned: true,
      backgroundColor: theme.colorScheme.primary,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        title: const ResponsiveText(
          'Tableau de bord',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          mobileFontSize: 18,
          tabletFontSize: 20,
          desktopFontSize: 22,
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.colorScheme.primary,
                theme.colorScheme.primary.withValues(alpha: 0.8),
              ],
            ),
          ),
          child: ResponsiveContainer(
            mobilePadding: const EdgeInsets.only(top: 80, left: 16, right: 16),
            tabletPadding: const EdgeInsets.only(top: 90, left: 24, right: 24),
            desktopPadding: const EdgeInsets.only(top: 100, left: 32, right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const ResponsiveText(
                  'Restaurant Le Bon Goût',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                  mobileFontSize: 16,
                  tabletFontSize: 18,
                  desktopFontSize: 20,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.store,
                      color: Colors.white70,
                      size: ResponsiveUtils.responsiveIconSize(
                        context,
                        mobile: 16,
                        tablet: 18,
                        desktop: 20,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const ResponsiveText(
                      'Propriétaire de restaurant',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                      mobileFontSize: 14,
                      tabletFontSize: 16,
                      desktopFontSize: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: _showNotifications,
          icon: Stack(
            children: [
              Icon(
                Icons.notifications,
                size: ResponsiveUtils.responsiveIconSize(context),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: _showMenu,
          icon: Icon(
            Icons.more_vert,
            size: ResponsiveUtils.responsiveIconSize(context),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsSection() {
    return ResponsiveGrid(
      mobileColumns: 2,
      tabletColumns: 4,
      desktopColumns: 4,
      childAspectRatio: ResponsiveUtils.responsiveValue(
        context,
        mobile: 1.2,
        tablet: 1.1,
        desktop: 1.0,
      ),
      children: [
        _buildStatCard(
          'Commandes aujourd\'hui',
          '24',
          Icons.shopping_bag,
          Colors.blue,
          '+12%',
        ),
        _buildStatCard(
          'Revenus du jour',
          '45,670 FCFA',
          Icons.monetization_on,
          Colors.green,
          '+8%',
        ),
        _buildStatCard(
          'Note moyenne',
          '4.8 ⭐',
          Icons.star,
          Colors.orange,
          '+0.2',
        ),
        _buildStatCard(
          'Temps moyen',
          '28 min',
          Icons.access_time,
          Colors.purple,
          '-3 min',
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color, String change) {
    final theme = Theme.of(context);
    
    return Card(
      elevation: ResponsiveUtils.responsiveValue(
        context,
        mobile: 2.0,
        tablet: 3.0,
        desktop: 4.0,
      ),
      child: ResponsiveContainer(
        mobilePadding: const EdgeInsets.all(12),
        tabletPadding: const EdgeInsets.all(16),
        desktopPadding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(
                    ResponsiveUtils.responsiveValue(
                      context,
                      mobile: 6.0,
                      tablet: 8.0,
                      desktop: 10.0,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: ResponsiveUtils.responsiveIconSize(
                      context,
                      mobile: 16,
                      tablet: 20,
                      desktop: 24,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ResponsiveText(
                    change,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                    mobileFontSize: 10,
                    tabletFontSize: 11,
                    desktopFontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ResponsiveText(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: color,
              ),
              mobileFontSize: 18,
              tabletFontSize: 20,
              desktopFontSize: 22,
            ),
            ResponsiveText(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              mobileFontSize: 12,
              tabletFontSize: 14,
              desktopFontSize: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Card(
      child: ResponsiveContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ResponsiveText(
              'Actions rapides',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
              mobileFontSize: 16,
              tabletFontSize: 18,
              desktopFontSize: 20,
            ),
            SizedBox(height: ResponsiveUtils.responsiveValue(
              context,
              mobile: 12.0,
              tablet: 16.0,
              desktop: 20.0,
            )),
            ResponsiveGrid(
              mobileColumns: 2,
              tabletColumns: 2,
              desktopColumns: 2,
              childAspectRatio: 1.5,
              children: [
                _buildActionTile(
                  'Menu',
                  'Gérer les plats',
                  Icons.restaurant_menu,
                  Colors.blue,
                  () {},
                ),
                _buildActionTile(
                  'Horaires',
                  'Heures d\'ouverture',
                  Icons.schedule,
                  Colors.green,
                  () {},
                ),
                _buildActionTile(
                  'Promotions',
                  'Offres spéciales',
                  Icons.local_offer,
                  Colors.orange,
                  () {},
                ),
                _buildActionTile(
                  'Assistance',
                  'Centre d\'aide',
                  Icons.help_center,
                  Colors.purple,
                  () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile(String title, String subtitle, IconData icon, Color color, VoidCallback onTap) {
    return Card(
      elevation: 1,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: ResponsiveContainer(
          mobilePadding: const EdgeInsets.all(8),
          tabletPadding: const EdgeInsets.all(12),
          desktopPadding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(
                  ResponsiveUtils.responsiveValue(
                    context,
                    mobile: 8.0,
                    tablet: 10.0,
                    desktop: 12.0,
                  ),
                ),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: ResponsiveUtils.responsiveIconSize(
                    context,
                    mobile: 20,
                    tablet: 24,
                    desktop: 28,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ResponsiveText(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                mobileFontSize: 12,
                tabletFontSize: 14,
                desktopFontSize: 16,
                textAlign: TextAlign.center,
              ),
              ResponsiveText(
                subtitle,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                ),
                mobileFontSize: 10,
                tabletFontSize: 11,
                desktopFontSize: 12,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLiveOrders() {
    return Card(
      child: ResponsiveContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const ResponsiveText(
                  'Commandes en cours',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  mobileFontSize: 16,
                  tabletFontSize: 18,
                  desktopFontSize: 20,
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const ResponsiveText(
                    '3 nouvelles',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w600,
                    ),
                    mobileFontSize: 10,
                    tabletFontSize: 11,
                    desktopFontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Live orders list would go here
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: ResponsiveText(
                  'Liste des commandes en cours',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                  mobileFontSize: 14,
                  tabletFontSize: 16,
                  desktopFontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceChart() {
    return Card(
      child: ResponsiveContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ResponsiveText(
              'Performance de la semaine',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
              mobileFontSize: 16,
              tabletFontSize: 18,
              desktopFontSize: 20,
            ),
            const SizedBox(height: 16),
            Container(
              height: ResponsiveUtils.responsiveValue(
                context,
                mobile: 200.0,
                tablet: 250.0,
                desktop: 300.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: ResponsiveText(
                  'Graphique de performance',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                  mobileFontSize: 14,
                  tabletFontSize: 16,
                  desktopFontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularItems() {
    return Card(
      child: ResponsiveContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ResponsiveText(
              'Plats populaires',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
              mobileFontSize: 16,
              tabletFontSize: 18,
              desktopFontSize: 20,
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      width: ResponsiveUtils.responsiveValue(
                        context,
                        mobile: 40.0,
                        tablet: 48.0,
                        desktop: 56.0,
                      ),
                      height: ResponsiveUtils.responsiveValue(
                        context,
                        mobile: 40.0,
                        tablet: 48.0,
                        desktop: 56.0,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.restaurant,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        size: ResponsiveUtils.responsiveIconSize(
                          context,
                          mobile: 20,
                          tablet: 24,
                          desktop: 28,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ResponsiveText(
                            'Plat populaire ${index + 1}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                            mobileFontSize: 14,
                            tabletFontSize: 16,
                            desktopFontSize: 18,
                          ),
                          ResponsiveText(
                            '${20 + index * 5} commandes',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                            ),
                            mobileFontSize: 12,
                            tabletFontSize: 14,
                            desktopFontSize: 16,
                          ),
                        ],
                      ),
                    ),
                    ResponsiveText(
                      '${2500 + index * 500} FCFA',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      mobileFontSize: 12,
                      tabletFontSize: 14,
                      desktopFontSize: 16,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refreshData() async {
    // Implement refresh logic
    await Future.delayed(const Duration(seconds: 1));
  }

  void _showNotifications() {
    // Implement notifications
  }

  void _showMenu() {
    // Implement menu
  }
}
