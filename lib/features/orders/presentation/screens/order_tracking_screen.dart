import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import '../../../../core/theme/design_tokens.dart';
import '../../../../shared/widgets/loading/app_loading_indicator.dart';
import '../../../orders/domain/models/order.dart';
import '../../../orders/providers/order_provider.dart';
import '../widgets/order_status_timeline.dart';
import '../widgets/order_items_summary.dart';
import '../widgets/delivery_address_card.dart';

class OrderTrackingScreen extends ConsumerStatefulWidget {
  final String orderId;

  const OrderTrackingScreen({
    super.key,
    required this.orderId,
  });

  @override
  ConsumerState<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends ConsumerState<OrderTrackingScreen> {
  Timer? _refreshTimer;

  @override
  void initState() {
    super.initState();
    // Start tracking the order
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(activeOrderProvider.notifier).trackOrder(widget.orderId);
    });
    
    // Set up periodic refresh for real-time updates
    _startPeriodicRefresh();
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  void _startPeriodicRefresh() {
    _refreshTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      final activeState = ref.read(activeOrderProvider);
      if (activeState is ActiveOrderTracking && activeState.order.isActive) {
        ref.read(activeOrderProvider.notifier).refreshOrderStatus(widget.orderId);
      } else {
        // Stop refreshing if order is completed
        _refreshTimer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeOrderState = ref.watch(activeOrderProvider);

    return Scaffold(
      backgroundColor: DesignTokens.backgroundPrimary,
      appBar: AppBar(
        title: const Text('Suivi de commande'),
        backgroundColor: DesignTokens.primaryColor,
        foregroundColor: DesignTokens.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(activeOrderProvider.notifier).refreshOrderStatus(widget.orderId);
            },
          ),
        ],
      ),
      body: _buildBody(activeOrderState),
    );
  }

  Widget _buildBody(ActiveOrderState state) {
    return switch (state) {
      ActiveOrderInitial() || ActiveOrderLoading() => const AppLoadingIndicator(),
      
      ActiveOrderError(:final message) => Center(
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
                ref.read(activeOrderProvider.notifier).trackOrder(widget.orderId);
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Réessayer'),
            ),
          ],
        ),
      ),
      
      ActiveOrderTracking(:final order) => _buildOrderTracking(order),
      
      ActiveOrderPlacing() => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLoadingIndicator(),
            SizedBox(height: DesignTokens.spaceMD),
            Text('Finalisation de la commande...'),
          ],
        ),
      ),
    };
  }

  Widget _buildOrderTracking(Order order) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.read(activeOrderProvider.notifier).refreshOrderStatus(widget.orderId);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(DesignTokens.spaceLG),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order header
            _buildOrderHeader(order),
            
            const SizedBox(height: DesignTokens.spaceXL),
            
            // Status timeline
            OrderStatusTimeline(
              currentStatus: order.status,
              statusUpdates: order.statusUpdates,
              estimatedDeliveryTime: order.estimatedDeliveryTime,
            ),
            
            const SizedBox(height: DesignTokens.spaceXL),
            
            // Driver info (if order is on the way)
            if (order.status == OrderStatus.onTheWay && order.driverName != null)
              _buildDriverInfo(order),
            
            // Delivery address
            DeliveryAddressCard(address: order.deliveryAddress),
            
            const SizedBox(height: DesignTokens.spaceLG),
            
            // Order items summary
            OrderItemsSummary(order: order),
            
            const SizedBox(height: DesignTokens.spaceLG),
            
            // Action buttons
            _buildActionButtons(order),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderHeader(Order order) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      decoration: BoxDecoration(
        color: DesignTokens.white,
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Commande #${order.id.split('_').last.substring(0, 8)}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: DesignTokens.fontWeightBold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignTokens.spaceSM,
                  vertical: DesignTokens.spaceXS,
                ),
                decoration: BoxDecoration(
                  color: _getStatusColor(order.status).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                ),
                child: Text(
                  order.status.displayName,
                  style: TextStyle(
                    color: _getStatusColor(order.status),
                    fontSize: DesignTokens.fontSizeSM,
                    fontWeight: DesignTokens.fontWeightSemiBold,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: DesignTokens.spaceSM),
          
          Text(
            order.restaurantName,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: DesignTokens.primaryColor,
              fontWeight: DesignTokens.fontWeightSemiBold,
            ),
          ),
          
          const SizedBox(height: DesignTokens.spaceXS),
          
          Row(
            children: [
              const Icon(
                Icons.access_time,
                size: 16,
                color: DesignTokens.textSecondary,
              ),
              const SizedBox(width: DesignTokens.spaceXS),
              Text(
                'Commandé le ${_formatDateTime(order.createdAt!)}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: DesignTokens.textSecondary,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: DesignTokens.spaceXS),
          
          Row(
            children: [
              const Icon(
                Icons.attach_money,
                size: 16,
                color: DesignTokens.textSecondary,
              ),
              const SizedBox(width: DesignTokens.spaceXS),
              Text(
                'Total: ${order.total.toInt()} FCFA',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: DesignTokens.primaryColor,
                  fontWeight: DesignTokens.fontWeightBold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDriverInfo(Order order) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      margin: const EdgeInsets.only(bottom: DesignTokens.spaceLG),
      decoration: BoxDecoration(
        color: DesignTokens.white,
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
        border: Border.all(
          color: DesignTokens.successColor.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(DesignTokens.spaceSM),
                decoration: BoxDecoration(
                  color: DesignTokens.successColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.delivery_dining,
                  color: DesignTokens.successColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: DesignTokens.spaceMD),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Votre livreur',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: DesignTokens.fontWeightSemiBold,
                      ),
                    ),
                    Text(
                      order.driverName!,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: DesignTokens.successColor,
                        fontWeight: DesignTokens.fontWeightMedium,
                      ),
                    ),
                  ],
                ),
              ),
              if (order.driverPhone != null)
                IconButton(
                  icon: const Icon(
                    Icons.phone,
                    color: DesignTokens.successColor,
                  ),
                  onPressed: () {
                    // TODO: Implement phone call
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Appel: ${order.driverPhone}')),
                    );
                  },
                ),
            ],
          ),
          
          const SizedBox(height: DesignTokens.spaceMD),
          
          LinearProgressIndicator(
            value: 0.7, // Mock progress
            backgroundColor: DesignTokens.lightGrey.withValues(alpha: 0.3),
            color: DesignTokens.successColor,
          ),
          
          const SizedBox(height: DesignTokens.spaceXS),
          
          Text(
            'Arrivée prévue dans 10 minutes',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: DesignTokens.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(Order order) {
    return Column(
      children: [
        if (order.canBeCancelled) ...[
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _showCancelDialog(order),
              icon: const Icon(Icons.cancel_outlined),
              label: const Text('Annuler la commande'),
              style: OutlinedButton.styleFrom(
                foregroundColor: DesignTokens.errorColor,
                side: const BorderSide(color: DesignTokens.errorColor),
              ),
            ),
          ),
          const SizedBox(height: DesignTokens.spaceSM),
        ],
        
        if (order.isDelivered) ...[
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _showRatingDialog(order),
              icon: const Icon(Icons.star_outline),
              label: const Text('Évaluer la commande'),
            ),
          ),
          const SizedBox(height: DesignTokens.spaceSM),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _reorderOrder(order),
              icon: const Icon(Icons.refresh),
              label: const Text('Commander à nouveau'),
            ),
          ),
        ],
        
        if (order.restaurantName.isNotEmpty) ...[
          const SizedBox(height: DesignTokens.spaceSM),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                // TODO: Navigate to restaurant
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Voir ${order.restaurantName}')),
                );
              },
              icon: const Icon(Icons.restaurant),
              label: const Text('Voir le restaurant'),
            ),
          ),
        ],
      ],
    );
  }

  void _showCancelDialog(Order order) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Annuler la commande'),
        content: const Text(
          'Êtes-vous sûr de vouloir annuler cette commande ? Cette action ne peut pas être annulée.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Garder la commande'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(ordersProvider.notifier).cancelOrder(order.id);
              Navigator.pop(context); // Return to previous screen
            },
            child: const Text(
              'Annuler',
              style: TextStyle(color: DesignTokens.errorColor),
            ),
          ),
        ],
      ),
    );
  }

  void _showRatingDialog(Order order) {
    double rating = 5.0;
    final reviewController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Évaluer la commande'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Qu\'avez-vous pensé de votre commande de ${order.restaurantName} ?'),
              const SizedBox(height: DesignTokens.spaceLG),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: DesignTokens.warningColor,
                      size: 32,
                    ),
                    onPressed: () {
                      setState(() {
                        rating = index + 1.0;
                      });
                    },
                  );
                }),
              ),
              const SizedBox(height: DesignTokens.spaceMD),
              TextField(
                controller: reviewController,
                decoration: const InputDecoration(
                  hintText: 'Commentaire (optionnel)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                maxLength: 200,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // TODO: Submit rating
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Merci pour votre évaluation!')),
                );
              },
              child: const Text('Envoyer'),
            ),
          ],
        ),
      ),
    );
  }

  void _reorderOrder(Order order) {
    ref.read(ordersProvider.notifier).reorderOrder(order.id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Nouvelle commande créée!')),
    );
  }

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return DesignTokens.warningColor;
      case OrderStatus.confirmed:
      case OrderStatus.preparing:
        return DesignTokens.infoColor;
      case OrderStatus.ready:
      case OrderStatus.pickedUp:
      case OrderStatus.onTheWay:
        return DesignTokens.primaryColor;
      case OrderStatus.delivered:
        return DesignTokens.successColor;
      case OrderStatus.cancelled:
      case OrderStatus.refunded:
        return DesignTokens.errorColor;
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} à ${dateTime.hour}h${dateTime.minute.toString().padLeft(2, '0')}';
  }
}