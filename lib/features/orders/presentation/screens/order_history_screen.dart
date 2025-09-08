import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../shared/widgets/loading/app_loading_indicator.dart';
import '../../../orders/domain/models/order.dart';
import '../../../orders/providers/order_provider.dart';
import '../widgets/order_card.dart';

class OrderHistoryScreen extends ConsumerStatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  ConsumerState<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends ConsumerState<OrderHistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    
    // Load orders when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(ordersProvider.notifier).loadOrders();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ordersState = ref.watch(ordersProvider);

    return Scaffold(
      backgroundColor: DesignTokens.backgroundPrimary,
      appBar: AppBar(
        title: const Text('Mes commandes'),
        backgroundColor: DesignTokens.primaryColor,
        foregroundColor: DesignTokens.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: DesignTokens.white,
          labelColor: DesignTokens.white,
          unselectedLabelColor: DesignTokens.white.withValues(alpha: 0.7),
          tabs: const [
            Tab(text: 'Toutes'),
            Tab(text: 'En cours'),
            Tab(text: 'Livrées'),
            Tab(text: 'Annulées'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrdersList(ordersState, null),
          _buildOrdersList(ordersState, [
            OrderStatus.created,
            OrderStatus.confirmed,
            OrderStatus.accepted,
            OrderStatus.preparing,
            OrderStatus.readyForPickup,
            OrderStatus.assignedDriver,
            OrderStatus.pickedUp,
            OrderStatus.inTransit,
          ]),
          _buildOrdersList(ordersState, [OrderStatus.delivered, OrderStatus.completed]),
          _buildOrdersList(ordersState, [
            OrderStatus.cancelled,
            OrderStatus.rejected,
            OrderStatus.refunded,
            OrderStatus.expired,
          ]),
        ],
      ),
    );
  }

  Widget _buildOrdersList(OrdersState state, List<OrderStatus>? statusFilter) {
    return switch (state) {
      OrdersInitial() || OrdersLoading() => const AppLoadingIndicator(),
      
      OrdersError(:final message) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: DesignTokens.errorColor.withValues(alpha: 0.5),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            Text(
              'Erreur de chargement',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: DesignTokens.spaceSM),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: DesignTokens.textSecondary,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceLG),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(ordersProvider.notifier).loadOrders();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Réessayer'),
            ),
          ],
        ),
      ),
      
      OrdersLoaded(:final orders) => _buildOrdersListContent(orders, statusFilter),
    };
  }

  Widget _buildOrdersListContent(List<Order> orders, List<OrderStatus>? statusFilter) {
    // Filter orders by status if specified
    final filteredOrders = statusFilter != null
        ? orders.where((order) => statusFilter.contains(order.status)).toList()
        : orders;

    if (filteredOrders.isEmpty) {
      return _buildEmptyState(statusFilter);
    }

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(ordersProvider.notifier).loadOrders();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(DesignTokens.spaceLG),
        itemCount: filteredOrders.length,
        itemBuilder: (context, index) {
          final order = filteredOrders[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: DesignTokens.spaceMD),
            child: OrderCard(
              order: order,
              onTap: () {
                if (order.isActive) {
                  context.go('/order-tracking/${order.id}');
                } else {
                  _showOrderDetailsDialog(order);
                }
              },
              onReorder: order.isDelivered
                  ? () => ref.read(ordersProvider.notifier).reorderOrder(order.id)
                  : null,
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(List<OrderStatus>? statusFilter) {
    String message;
    IconData icon;
    
    if (statusFilter == null) {
      message = 'Aucune commande trouvée.\nCommencez par explorer nos restaurants !';
      icon = Icons.receipt_long_outlined;
    } else if (statusFilter.contains(OrderStatus.delivered) || statusFilter.contains(OrderStatus.completed)) {
      message = 'Aucune commande livrée.\nVos prochaines livraisons apparaîtront ici.';
      icon = Icons.done_all;
    } else if (statusFilter.contains(OrderStatus.cancelled) || statusFilter.contains(OrderStatus.rejected)) {
      message = 'Aucune commande annulée.';
      icon = Icons.cancel_outlined;
    } else {
      message = 'Aucune commande en cours.\nVos commandes actives apparaîtront ici.';
      icon = Icons.hourglass_empty;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: DesignTokens.textTertiary,
          ),
          const SizedBox(height: DesignTokens.spaceLG),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: DesignTokens.textSecondary,
              height: 1.4,
            ),
          ),
          if (statusFilter == null) ...[ 
            const SizedBox(height: DesignTokens.spaceXL),
            ElevatedButton.icon(
              onPressed: () {
                context.go('/restaurants');
              },
              icon: const Icon(Icons.restaurant),
              label: const Text('Explorer les restaurants'),
            ),
          ],
        ],
      ),
    );
  }

  void _showOrderDetailsDialog(Order order) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Commande #${order.id.split('_').last.substring(0, 8)}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOrderDetailRow('Restaurant', order.restaurantName),
            _buildOrderDetailRow('Statut', order.status.displayName),
            _buildOrderDetailRow('Articles', '${order.itemCount} article(s)'),
            _buildOrderDetailRow('Total', '${order.total.toInt()} FCFA'),
            if (order.createdAt != null)
              _buildOrderDetailRow('Date', _formatDate(order.createdAt!)),
            if (order.actualDeliveryTime != null)
              _buildOrderDetailRow('Livré le', _formatDate(order.actualDeliveryTime!)),
          ],
        ),
        actions: [
          if (order.isDelivered)
            TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
                ref.read(ordersProvider.notifier).reorderOrder(order.id);
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Recommander'),
            ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: DesignTokens.spaceXS),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: DesignTokens.fontWeightMedium,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} à ${dateTime.hour}h${dateTime.minute.toString().padLeft(2, '0')}';
  }
}