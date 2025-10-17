import 'package:eatfast_mobile/shared/models/delivery_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';
import 'package:eatfast_mobile/modules/driver_module/widgets/widgets/driver_status_card.dart';
import 'package:eatfast_mobile/modules/driver_module/widgets/widgets/earnings_summary_card.dart';
import 'package:eatfast_mobile/modules/driver_module/widgets/widgets/available_orders_list.dart';
import 'package:eatfast_mobile/modules/driver_module/widgets/widgets/active_delivery_card.dart';
import 'package:eatfast_mobile/modules/driver_module/widgets/widgets/quick_stats_row.dart';
import 'package:eatfast_mobile/modules/driver_module/providers/domain/providers/driver_providers.dart';
import 'package:eatfast_mobile/modules/driver_module/services/data/driver_service.dart' hide driverServiceProvider;

class DriverDashboardScreen extends ConsumerStatefulWidget {
  final String driverId;
  
  const DriverDashboardScreen({
    super.key,
    required this.driverId,
  });

  @override
  ConsumerState<DriverDashboardScreen> createState() => _DriverDashboardScreenState();
}

class _DriverDashboardScreenState extends ConsumerState<DriverDashboardScreen>
    with AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true;
  
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    _loadDriverData();
  }

  Future<void> _loadDriverData() async {
    try {
      // Load driver data from API
      await ref.read(driverProfileProvider.notifier).fetchDriverProfile(widget.driverId);
      await ref.read(driverEarningsProvider.notifier).fetchDriverEarnings(widget.driverId);
      await ref.read(availableOrdersProvider.notifier).fetchAvailableOrders();
      await ref.read(activeDeliveryProvider.notifier).fetchActiveDelivery(widget.driverId);
      
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
          error = e.toString();
        });
      }
    }
  }

  Future<void> _refreshData() async {
    await _loadDriverData();
  }

  void _toggleOnlineStatus(bool isOnline) async {
    try {
      await ref.read(driverServiceProvider).updateDriverStatus(
        driverId: widget.driverId,
        isOnline: isOnline,
      );
      // Refresh driver profile after status change
      await ref.read(driverProfileProvider.notifier).fetchDriverProfile(widget.driverId);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur: ${e.toString()}')),
        );
      }
    }
  }

  void _toggleAvailability(bool isAvailable) {
    // This would typically update driver availability status
    // Implementation depends on backend API
  }

  void _navigateToCustomer() {
    // Navigate to customer location
  }

  void _contactCustomer() {
    // Contact customer via phone/chat
  }

  void _contactRestaurant() {
    // Contact restaurant via phone/chat
  }

  void _markPickedUp() {
    // Mark order as picked up
  }

  void _markDelivered() {
    // Mark order as delivered
  }

  void _showLocationSettings() {
    // Show location settings dialog
  }

  void _reportIssue() {
    // Report issue with current delivery
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return Scaffold(
      backgroundColor: DesignTokens.backgroundGrey,
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
                    _buildDriverStatusCard(),
                    const SizedBox(height: DesignTokens.spaceLG),
                    _buildQuickStats(),
                    const SizedBox(height: DesignTokens.spaceLG),
                    _buildEarningsSummary(),
                    const SizedBox(height: DesignTokens.spaceLG),
                    _buildActiveDeliverySection(),
                    const SizedBox(height: DesignTokens.spaceLG),
                    _buildAvailableOrdersSection(),
                    const SizedBox(height: DesignTokens.spaceXL),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 120,
      floating: false,
      pinned: true,
      backgroundColor: DesignTokens.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'Tableau de bord chauffeur',
          style: TextStyle(
            color: DesignTokens.white,
            fontWeight: DesignTokens.fontWeightBold,
            fontSize: 18,
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
          onPressed: () => _showLocationSettings(),
          icon: Stack(
            children: [
              const Icon(Icons.location_on, color: DesignTokens.white),
              // Show offline indicator if driver is offline
              if (ref.watch(driverProfileProvider)?.isOnline == false)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: DesignTokens.errorColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => context.push('/driver/${widget.driverId}/notifications'),
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
                    '2',
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
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert, color: DesignTokens.white),
          onSelected: (value) => _handleMenuAction(value),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'profile',
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Mon profil'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const PopupMenuItem(
              value: 'earnings',
              child: ListTile(
                leading: Icon(Icons.account_balance_wallet),
                title: Text('Revenus d�taill�s'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const PopupMenuItem(
              value: 'support',
              child: ListTile(
                leading: Icon(Icons.help),
                title: Text('Support'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const PopupMenuItem(
              value: 'settings',
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Param�tres'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDriverStatusCard() {
    final driver = ref.watch(driverProfileProvider);
    if (driver == null) return const SizedBox.shrink();

    return DriverStatusCard(
      driver: driver,
      onToggleOnline: () => _toggleOnlineStatus(!driver.isOnline),
      onToggleAvailable: () => _toggleAvailability(!driver.isAvailable),
    );
  }

  Widget _buildQuickStats() {
    final driver = ref.watch(driverProfileProvider);
    if (driver == null) return const SizedBox.shrink();

    return QuickStatsRow(
      driver: driver,
      onViewPerformance: () => context.push('/driver/${widget.driverId}/performance'),
    );
  }

  Widget _buildEarningsSummary() {
    final earnings = ref.watch(driverEarningsProvider);
    if (earnings == null) return const SizedBox.shrink();

    return EarningsSummaryCard(
      earnings: earnings,
      onViewDetails: () => context.push('/driver/${widget.driverId}/earnings'),
    );
  }

  Widget _buildActiveDeliverySection() {
    final activeOrder = ref.watch(activeDeliveryProvider);

    if (activeOrder == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.delivery_dining, color: Colors.orange),
            const SizedBox(width: 8),
            const Text(
              'Livraison en cours',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () => context.push('/driver/${widget.driverId}/active-delivery'),
              child: const Text('Voir d�tails'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ActiveDeliveryCard(
          order: activeOrder,
          onNavigate: () => _navigateToCustomer(),
          onCallCustomer: () => _contactCustomer(),
          onCallRestaurant: () => _contactRestaurant(),
          onMarkPickedUp: () => _markPickedUp(),
          onMarkDelivered: () => _markDelivered(),
          onReportIssue: () => _reportIssue(),
        ),
      ],
    );
  }

  Widget _buildAvailableOrdersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Commandes disponibles',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: DesignTokens.fontWeightBold,
                color: DesignTokens.textPrimary,
              ),
            ),
            if (ref.watch(driverProfileProvider)?.isOnline == true &&
                ref.watch(driverProfileProvider)?.isAvailable == true)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignTokens.spaceXS,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: DesignTokens.successColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusXS),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: DesignTokens.successColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Recherche...',
                      style: TextStyle(
                        color: DesignTokens.successColor,
                        fontSize: 10,
                        fontWeight: DesignTokens.fontWeightMedium,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(height: DesignTokens.spaceMD),
        AvailableOrdersList(
          orders: ref.watch(availableOrdersProvider),
          onAcceptOrder: (orderId) => _acceptOrder(orderId),
          onRejectOrder: (orderId) => _rejectOrder(orderId, 'Raison du refus'),
          onOrderTap: (order) => context.push('/driver/order/${(order as DeliveryOrder?)?.orderId}'),
        ),
      ],
    );
  }

  Widget _buildFloatingActionButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: 'emergency',
          onPressed: () => _showEmergencyDialog(),
          backgroundColor: DesignTokens.errorColor,
          child: const Icon(Icons.emergency, color: DesignTokens.white),
        ),
        const SizedBox(height: DesignTokens.spaceMD),
        FloatingActionButton.extended(
          heroTag: 'navigation',
          onPressed: () => _openMapsApp(),
          icon: const Icon(Icons.navigation),
          label: const Text('Navigation'),
          backgroundColor: DesignTokens.infoColor,
        ),
      ],
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: DesignTokens.white,
        boxShadow: [
          BoxShadow(
            color: DesignTokens.shadowColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignTokens.spaceLG,
            vertical: DesignTokens.spaceMD,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.home,
                label: 'Accueil',
                isSelected: true,
                onTap: () {},
              ),
              _buildNavItem(
                icon: Icons.assignment,
                label: 'Commandes',
                isSelected: false,
                onTap: () => context.push('/driver/${widget.driverId}/orders'),
              ),
              _buildNavItem(
                icon: Icons.account_balance_wallet,
                label: 'Revenus',
                isSelected: false,
                onTap: () => context.push('/driver/${widget.driverId}/earnings'),
              ),
              _buildNavItem(
                icon: Icons.person,
                label: 'Profil',
                isSelected: false,
                onTap: () => context.push('/driver/${widget.driverId}/profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? DesignTokens.primaryColor : DesignTokens.textTertiary,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? DesignTokens.primaryColor : DesignTokens.textTertiary,
              fontSize: 12,
              fontWeight: isSelected ? DesignTokens.fontWeightMedium : DesignTokens.fontWeightRegular,
            ),
          ),
        ],
      ),
    );
  }


  // Removed unused _showStatusChangeSnackbar method

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: DesignTokens.warningColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'profile':
        context.push('/driver/${widget.driverId}/profile');
        break;
      case 'earnings':
        context.push('/driver/${widget.driverId}/earnings');
        break;
      case 'support':
        context.push('/driver/${widget.driverId}/support');
        break;
      case 'settings':
        context.push('/driver/${widget.driverId}/settings');
        break;
    }
  }

  void _acceptOrder(String orderId) {
    // TODO: Implement order acceptance
    _showSnackbar('Commande accept�e');
  }

  void _rejectOrder(String orderId, String reason) {
    // TODO: Implement order rejection
    _showSnackbar('Commande rejet�e');
  }

  void _showEmergencyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
        ),
        title: const Text(
          'Urgence',
          style: TextStyle(
            color: DesignTokens.errorColor,
            fontWeight: DesignTokens.fontWeightBold,
          ),
        ),
        content: const Text('Appelez-vous les services d\'urgence?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Call emergency services
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: DesignTokens.errorColor,
            ),
            child: const Text('Appeler 112'),
          ),
        ],
      ),
    );
  }

  void _openMapsApp() {
    // TODO: Open maps app with current location
  }
}
