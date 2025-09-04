import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../shared/widgets/loading/app_loading_indicator.dart';
import '../../providers/restaurant_owner_provider.dart';
import '../../domain/models/live_order.dart';
import '../widgets/order_filter_chips.dart';
import '../widgets/order_detail_card.dart';

class LiveOrdersScreen extends ConsumerStatefulWidget {
  final String restaurantId;
  
  const LiveOrdersScreen({
    super.key,
    required this.restaurantId,
  });

  @override
  ConsumerState<LiveOrdersScreen> createState() => _LiveOrdersScreenState();
}

class _LiveOrdersScreenState extends ConsumerState<LiveOrdersScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final restaurantState = ref.watch(restaurantOwnerProvider(widget.restaurantId));
    final liveOrdersAsync = ref.watch(liveOrdersProvider(widget.restaurantId));
    
    return Scaffold(
      backgroundColor: DesignTokens.backgroundGrey,
      appBar: AppBar(
        title: const Text('Commandes en direct'),
        backgroundColor: DesignTokens.primaryColor,
        foregroundColor: DesignTokens.white,
        actions: [
          IconButton(
            onPressed: () => _showSortOptions(context),
            icon: const Icon(Icons.sort),
          ),
          IconButton(
            onPressed: () => _refreshOrders(),
            icon: const Icon(Icons.refresh),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: DesignTokens.white,
          labelColor: DesignTokens.white,
          unselectedLabelColor: DesignTokens.white.withValues(alpha: 0.7),
          tabs: [
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Toutes'),
                  if (_getOrderCount(restaurantState.liveOrders, OrderFilter.all) > 0) ...[
                    const SizedBox(width: 4),
                    _buildBadge(_getOrderCount(restaurantState.liveOrders, OrderFilter.all)),
                  ],
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Attente'),
                  if (_getOrderCount(restaurantState.liveOrders, OrderFilter.pending) > 0) ...[
                    const SizedBox(width: 4),
                    _buildBadge(_getOrderCount(restaurantState.liveOrders, OrderFilter.pending)),
                  ],
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Préparation'),
                  if (_getOrderCount(restaurantState.liveOrders, OrderFilter.preparing) > 0) ...[
                    const SizedBox(width: 4),
                    _buildBadge(_getOrderCount(restaurantState.liveOrders, OrderFilter.preparing)),
                  ],
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Prêt'),
                  if (_getOrderCount(restaurantState.liveOrders, OrderFilter.ready) > 0) ...[
                    const SizedBox(width: 4),
                    _buildBadge(_getOrderCount(restaurantState.liveOrders, OrderFilter.ready)),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
      body: liveOrdersAsync.when(
        data: (orders) => TabBarView(
          controller: _tabController,
          children: [
            _buildOrdersList(orders, OrderFilter.all),
            _buildOrdersList(orders, OrderFilter.pending),
            _buildOrdersList(orders, OrderFilter.preparing),
            _buildOrdersList(orders, OrderFilter.ready),
          ],
        ),
        loading: () => const Center(child: AppLoadingIndicator()),
        error: (error, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: DesignTokens.errorColor,
              ),
              const SizedBox(height: DesignTokens.spaceMD),
              Text(
                'Erreur de connexion',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: DesignTokens.errorColor,
                ),
              ),
              const SizedBox(height: DesignTokens.spaceXS),
              Text(
                error.toString(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: DesignTokens.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: DesignTokens.spaceLG),
              ElevatedButton.icon(
                onPressed: _refreshOrders,
                icon: const Icon(Icons.refresh),
                label: const Text('Réessayer'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateOrderDialog(),
        icon: const Icon(Icons.add),
        label: const Text('Nouvelle commande'),
        backgroundColor: DesignTokens.primaryColor,
      ),
    );
  }

  Widget _buildBadge(int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: const BoxDecoration(
        color: DesignTokens.errorColor,
        shape: BoxShape.circle,
      ),
      child: Text(
        count.toString(),
        style: const TextStyle(
          color: DesignTokens.white,
          fontSize: 10,
          fontWeight: DesignTokens.fontWeightBold,
        ),
      ),
    );
  }

  Widget _buildOrdersList(List<LiveOrder> orders, OrderFilter filter) {
    final filteredOrders = _filterOrders(orders, filter);
    
    if (filteredOrders.isEmpty) {
      return _buildEmptyState(filter);
    }

    return RefreshIndicator(
      onRefresh: _refreshOrders,
      child: ListView.builder(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        itemCount: filteredOrders.length,
        itemBuilder: (context, index) {
          final order = filteredOrders[index];
          return OrderDetailCard(
            order: order,
            onTap: () => _showOrderDetail(order),
            onAccept: (estimatedTime) => _acceptOrder(order.orderId, estimatedTime),
            onReject: (reason) => _rejectOrder(order.orderId, reason),
            onStatusUpdate: (status) => _updateOrderStatus(order.orderId, status),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(OrderFilter filter) {
    String title;
    String subtitle;
    IconData icon;
    
    switch (filter) {
      case OrderFilter.all:
        title = 'Aucune commande';
        subtitle = 'Toutes les nouvelles commandes apparaîtront ici';
        icon = Icons.inbox_outlined;
        break;
      case OrderFilter.pending:
        title = 'Aucune commande en attente';
        subtitle = 'Les commandes nécessitant votre attention apparaîtront ici';
        icon = Icons.hourglass_empty;
        break;
      case OrderFilter.preparing:
        title = 'Aucune commande en préparation';
        subtitle = 'Les commandes acceptées apparaîtront ici';
        icon = Icons.restaurant;
        break;
      case OrderFilter.ready:
        title = 'Aucune commande prête';
        subtitle = 'Les commandes prêtes pour livraison apparaîtront ici';
        icon = Icons.done_all;
        break;
      case OrderFilter.completed:
        title = 'Aucune commande terminée';
        subtitle = 'Les commandes livrées apparaîtront ici';
        icon = Icons.check_circle_outline;
        break;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64,
              color: DesignTokens.textTertiary,
            ),
            const SizedBox(height: DesignTokens.spaceLG),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: DesignTokens.textSecondary,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceXS),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: DesignTokens.textTertiary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  List<LiveOrder> _filterOrders(List<LiveOrder> orders, OrderFilter filter) {
    switch (filter) {
      case OrderFilter.all:
        return orders.where((order) => order.status.isActive).toList();
      case OrderFilter.pending:
        return orders.where((order) => order.status == OrderStatus.pending).toList();
      case OrderFilter.preparing:
        return orders.where((order) => 
          order.status == OrderStatus.accepted || 
          order.status == OrderStatus.preparing
        ).toList();
      case OrderFilter.ready:
        return orders.where((order) => order.status == OrderStatus.ready).toList();
      case OrderFilter.completed:
        return orders.where((order) => order.status == OrderStatus.delivered).toList();
    }
  }

  int _getOrderCount(List<LiveOrder> orders, OrderFilter filter) {
    return _filterOrders(orders, filter).length;
  }

  Future<void> _refreshOrders() async {
    await ref.refresh(liveOrdersProvider(widget.restaurantId).future);
  }

  void _showOrderDetail(LiveOrder order) {
    context.push('/restaurant-owner/${widget.restaurantId}/orders/${order.orderId}');
  }

  void _acceptOrder(String orderId, int estimatedTime) {
    ref.read(restaurantOwnerProvider(widget.restaurantId).notifier)
        .acceptOrder(orderId, estimatedTime);
  }

  void _rejectOrder(String orderId, String reason) {
    ref.read(restaurantOwnerProvider(widget.restaurantId).notifier)
        .rejectOrder(orderId, reason);
  }

  void _updateOrderStatus(String orderId, OrderStatus status) {
    ref.read(restaurantOwnerProvider(widget.restaurantId).notifier)
        .updateOrderStatus(orderId, status);
  }

  void _showSortOptions(BuildContext context) {
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
            Text(
              'Trier par',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: DesignTokens.fontWeightBold,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Heure de commande'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.euro),
              title: const Text('Montant'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.priority_high),
              title: const Text('Priorité'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showCreateOrderDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.95,
        minChildSize: 0.4,
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
                      'Type de commande',
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
                    _buildOrderTypeOption(
                      title: 'Commande téléphonique',
                      subtitle: 'Créer une commande pour un client au téléphone',
                      icon: Icons.phone,
                      color: DesignTokens.primaryColor,
                      onTap: () {
                        Navigator.pop(context);
                        context.push('/restaurant-owner/${widget.restaurantId}/orders/create/phone');
                      },
                    ),
                    _buildOrderTypeOption(
                      title: 'Sur place',
                      subtitle: 'Pour les clients qui mangent au restaurant',
                      icon: Icons.store,
                      color: DesignTokens.successColor,
                      onTap: () {
                        Navigator.pop(context);
                        context.push('/restaurant-owner/${widget.restaurantId}/orders/create/dine-in');
                      },
                    ),
                    _buildOrderTypeOption(
                      title: 'À emporter',
                      subtitle: 'Commande à récupérer par le client',
                      icon: Icons.takeout_dining,
                      color: DesignTokens.warningColor,
                      onTap: () {
                        Navigator.pop(context);
                        context.push('/restaurant-owner/${widget.restaurantId}/orders/create/takeaway');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderTypeOption({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: DesignTokens.spaceMD),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: DesignTokens.white),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          side: BorderSide(color: DesignTokens.borderColor),
        ),
      ),
    );
  }
}