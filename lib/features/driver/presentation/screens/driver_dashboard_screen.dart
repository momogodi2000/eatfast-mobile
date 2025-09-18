import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/design_tokens.dart';
import '../widgets/driver_status_card.dart';
import '../widgets/earnings_summary_card.dart';
import '../widgets/available_orders_list.dart';
import '../widgets/active_delivery_card.dart';
import '../widgets/quick_stats_row.dart';
import '../../domain/models/driver_profile.dart';
import '../../domain/models/driver_earnings.dart';
import '../../domain/models/delivery_order.dart';

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
      driverId: 'driver123',
      name: 'Jean Mbeki',
      email: 'jean@example.com',
      phoneNumber: '+237 612 34 56 78',
      licenseNumber: 'LIC123456',
      vehicleType: 'Moto',
      vehicleModel: 'Yamaha XTZ',
      vehiclePlateNumber: 'YAO-123-CD',
      status: DriverStatus.active,
      rating: 4.8,
      totalDeliveries: 1250,
      totalEarnings: 850000,
      isOnline: false,
      isAvailable: true,
      weeklyStats: [
        DeliveryStatistics(
          date: DateTime.now().subtract(const Duration(days: 6)),
          deliveries: 8,
          earnings: 15000,
          rating: 4.7,
          onlineHours: 6,
        ),
        DeliveryStatistics(
          date: DateTime.now().subtract(const Duration(days: 5)),
          deliveries: 12,
          earnings: 22000,
          rating: 4.9,
          onlineHours: 8,
        ),
        // Add more mock data as needed
      ],
    );

    mockEarnings = const DriverEarnings(
      driverId: 'driver123',
      totalEarnings: 850000,
      todayEarnings: 25000,
      weekEarnings: 125000,
      monthEarnings: 485000,
      totalDeliveries: 1250,
      todayDeliveries: 12,
      weekDeliveries: 85,
      monthDeliveries: 320,
      averageRating: 4.8,
      completionRate: 98.5,
      onlineHours: 180,
      hourlyRate: 2500,
    );

    mockOrders = [
      DeliveryOrder(
        orderId: 'ORD001234',
        restaurantId: 'REST001',
        restaurantName: 'Restaurant Le Cameroun',
        restaurantAddress: '123 Rue de la République, Yaoundé',
        restaurantLatitude: 3.8480,
        restaurantLongitude: 11.5021,
        customerName: 'Marie Dupont',
        customerPhone: '+237 612 34 56 78',
        deliveryAddress: '456 Rue de la Paix, Yaoundé',
        deliveryLatitude: 3.8580,
        deliveryLongitude: 11.5121,
        orderTime: DateTime.now().subtract(const Duration(minutes: 30)),
        expectedDeliveryTime: DateTime.now().add(const Duration(minutes: 15)),
        orderValue: 15000,
        deliveryFee: 1500,
        status: DeliveryStatus.assigned,
        paymentMethod: PaymentMethod.cash,
        isPaid: false,
        specialInstructions: 'Frapper à la porte, ne pas sonner',
        distanceKm: 2.5,
        estimatedDuration: 15,
        items: [
          const OrderItem(
            itemName: 'Ndolé avec du riz',
            quantity: 2,
            price: 5000,
          ),
          const OrderItem(
            itemName: 'Boisson fraîche',
            quantity: 1,
            price: 1500,
          ),
        ],
      ),
    ];

    mockActiveOrder = DeliveryOrder(
      orderId: 'ORD001235',
      restaurantId: 'REST002',
      restaurantName: 'Chez Mama Africa',
      restaurantAddress: '789 Avenue Kennedy, Douala',
      restaurantLatitude: 4.0483,
      restaurantLongitude: 9.7043,
      customerName: 'Paul Tchinda',
      customerPhone: '+237 699 87 65 43',
      deliveryAddress: '321 Rue de la Joie, Douala',
      deliveryLatitude: 4.0583,
      deliveryLongitude: 9.7143,
      orderTime: DateTime.now().subtract(const Duration(hours: 1)),
      expectedDeliveryTime: DateTime.now().add(const Duration(minutes: 10)),
      orderValue: 12000,
      deliveryFee: 1200,
      status: DeliveryStatus.delivering,
      paymentMethod: PaymentMethod.mobileMoney,
      isPaid: true,
      distanceKm: 1.8,
      estimatedDuration: 10,
      pickedUpAt: DateTime.now().subtract(const Duration(minutes: 20)),
      items: [
        const OrderItem(
          itemName: 'Poulet DG',
          quantity: 1,
          price: 8000,
        ),
        const OrderItem(
          itemName: 'Plantain frit',
          quantity: 1,
          price: 2000,
        ),
      ],
    );
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
      floatingActionButton: isOnline ? _buildFloatingActionButton() : null,
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
              if (!isOnline)
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
                title: Text('Revenus détaillés'),
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
                title: Text('Paramètres'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDriverStatusCard() {
    return DriverStatusCard(
      driver: mockDriver.copyWith(
        isOnline: isOnline,
        isAvailable: isAvailable,
      ),
      onToggleOnline: () => _toggleOnlineStatus(!isOnline),
      onToggleAvailable: () => _toggleAvailability(!isAvailable),
    );
  }

  Widget _buildQuickStats() {
    return QuickStatsRow(
      driver: mockDriver,
      onViewPerformance: () => context.push('/driver/${widget.driverId}/performance'),
    );
  }

  Widget _buildEarningsSummary() {
    return EarningsSummaryCard(
      earnings: mockEarnings,
      onViewDetails: () => context.push('/driver/${widget.driverId}/earnings'),
    );
  }

  Widget _buildActiveDeliverySection() {
    // Check if driver has active delivery
    final hasActiveDelivery = mockActiveOrder != null;

    if (!hasActiveDelivery) {
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
              child: const Text('Voir détails'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ActiveDeliveryCard(
          order: mockActiveOrder!,
          onNavigate: () => _navigateToCustomer(),
          onCallCustomer: () => _contactCustomer(),
          onCallRestaurant: () => _contactRestaurant(),
          onMarkPickedUp: () => _markPickedUp(),
          onMarkDelivered: () => _markDelivered(),
          onReportIssue: () => _reportIssue(),
        ),
      ],
    );
  }  Widget _buildAvailableOrdersSection() {
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
            if (isOnline && isAvailable)
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
          orders: mockOrders,
          onAcceptOrder: (orderId) => _acceptOrder(orderId),
          onRejectOrder: (orderId) => _rejectOrder(orderId, 'Raison du refus'),
          onOrderTap: (order) => context.push('/driver/order/${order.orderId}'),
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

  Future<void> _refreshData() async {
    // TODO: Implement data refresh
    await Future.delayed(const Duration(seconds: 1));
  }

  void _toggleOnlineStatus(bool value) {
    setState(() {
      isOnline = value;
      if (!value) {
        isAvailable = false;
      }
    });
    
    // TODO: Update status on server
    _showStatusChangeSnackbar(value ? 'En ligne' : 'Hors ligne');
  }

  void _toggleAvailability(bool value) {
    if (!isOnline && value) {
      _showSnackbar('Vous devez être en ligne pour être disponible');
      return;
    }
    
    setState(() {
      isAvailable = value;
    });
    
    // TODO: Update availability on server
    _showStatusChangeSnackbar(value ? 'Disponible' : 'Indisponible');
  }

  void _showStatusChangeSnackbar(String status) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Statut mis à jour: $status'),
        backgroundColor: DesignTokens.successColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: DesignTokens.warningColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showLocationSettings() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(DesignTokens.radiusXL),
          topRight: Radius.circular(DesignTokens.radiusXL),
        ),
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
            const Icon(
              Icons.location_on,
              size: 48,
              color: DesignTokens.primaryColor,
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            Text(
              'Partage de localisation',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: DesignTokens.fontWeightBold,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceXS),
            const Text(
              'Votre localisation est partagée pour vous assigner des commandes proches',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: DesignTokens.spaceLG),
            SwitchListTile(
              title: const Text('Partage de localisation'),
              subtitle: const Text('Requis pour recevoir des commandes'),
              value: isOnline,
              onChanged: _toggleOnlineStatus,
            ),
          ],
        ),
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

  void _contactCustomer() {
    // TODO: Implement customer contact
    debugPrint('Contact customer');
  }

  void _navigateToCustomer() {
    // TODO: Implement navigation to customer location
    debugPrint('Navigate to customer location');
  }

  void _contactRestaurant() {
    // TODO: Implement restaurant contact functionality
    debugPrint('Contact restaurant');
  }

  void _markPickedUp() {
    // TODO: Implement mark as picked up functionality
    debugPrint('Mark order as picked up');
  }

  void _markDelivered() {
    // TODO: Implement mark as delivered functionality
    debugPrint('Mark order as delivered');
  }

  void _reportIssue() {
    // TODO: Implement issue reporting
    debugPrint('Report issue');
  }

  void _acceptOrder(String orderId) {
    // TODO: Implement order acceptance
    _showSnackbar('Commande acceptée');
  }

  void _rejectOrder(String orderId, String reason) {
    // TODO: Implement order rejection
    _showSnackbar('Commande rejetée');
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