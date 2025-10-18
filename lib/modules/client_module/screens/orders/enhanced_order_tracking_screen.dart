import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:eatfast_mobile/modules/guest_module/providers/domain/models/guest_models.dart';
import 'package:eatfast_mobile/modules/guest_module/services/data/guest_service.dart';
import 'package:eatfast_mobile/shared/constants/api_constants.dart';
import 'package:eatfast_mobile/shared/config/app_config.dart';

class EnhancedOrderTrackingScreen extends ConsumerStatefulWidget {
  final String orderId;
  final bool isGuestOrder;

  const EnhancedOrderTrackingScreen({
    super.key,
    required this.orderId,
    this.isGuestOrder = false,
  });

  @override
  ConsumerState<EnhancedOrderTrackingScreen> createState() => _EnhancedOrderTrackingScreenState();
}

class _EnhancedOrderTrackingScreenState extends ConsumerState<EnhancedOrderTrackingScreen>
    with TickerProviderStateMixin {

  final GuestService _guestService = GuestService();

  GuestOrderTracking? _orderTracking;
  io.Socket? _socket;
  bool _isLoading = true;
  String? _error;

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _loadOrderData();
    if (AppConfig.enableWebSocketConnection) {
      _initializeWebSocket();
    }
  }

  void _initializeAnimations() {
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));
    _pulseController.repeat(reverse: true);
  }

  Future<void> _loadOrderData() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      if (widget.isGuestOrder) {
        final tracking = await _guestService.trackOrder(widget.orderId);
        setState(() {
          _orderTracking = tracking;
          _isLoading = false;
        });
      } else {
        // Load authenticated user order tracking
        // Implementation would go here for registered users
        setState(() {
          _error = 'Authenticated user tracking not implemented yet';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _initializeWebSocket() {
    try {
      _socket = io.io(
        AppConfig.baseUrl.replaceAll('/api', ''),
        io.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build(),
      );

      _socket!.connect();

      _socket!.onConnect((_) {
        debugPrint('WebSocket connected for order tracking');
        // Join order-specific room
        _socket!.emit('join_order_room', widget.orderId);
      });

      _socket!.on(ApiConstants.socketOrderUpdate, (data) {
        debugPrint('Order update received: $data');
        _handleOrderUpdate(data);
      });

      _socket!.on(ApiConstants.socketLocationUpdate, (data) {
        debugPrint('Location update received: $data');
        _handleLocationUpdate(data);
      });

      _socket!.onDisconnect((_) {
        debugPrint('WebSocket disconnected');
      });

      _socket!.onError((error) {
        debugPrint('WebSocket error: $error');
      });
    } catch (e) {
      debugPrint('Failed to initialize WebSocket: $e');
    }
  }

  void _handleOrderUpdate(dynamic data) {
    if (data['orderId'] == widget.orderId) {
      setState(() {
        // Update order status
        final newStatus = _parseOrderStatus(data['status']);
        if (_orderTracking != null && newStatus != null) {
          _orderTracking = _orderTracking!.copyWith(
            status: newStatus,
            updatedAt: DateTime.now(),
            statusHistory: [
              ..._orderTracking!.statusHistory ?? [],
              GuestOrderStatusUpdate(
                status: newStatus,
                timestamp: DateTime.now(),
                note: data['note'],
                location: data['location'],
              ),
            ],
          );
        }
      });
    }
  }

  void _handleLocationUpdate(dynamic data) {
    if (data['orderId'] == widget.orderId) {
      setState(() {
        if (_orderTracking != null) {
          _orderTracking = _orderTracking!.copyWith(
            driverLocation: GuestOrderCoordinates(
              lat: data['lat'],
              lng: data['lng'],
            ),
            updatedAt: DateTime.now(),
          );
        }
      });
    }
  }

  GuestOrderStatus? _parseOrderStatus(String? status) {
    if (status == null) return null;
    try {
      return GuestOrderStatus.values.firstWhere(
        (s) => s.name == status || s.toString().split('.').last == status,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suivi de commande'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadOrderData,
          ),
        ],
      ),
      body: _buildBody(),
      floatingActionButton: _orderTracking?.driverPhone != null
          ? FloatingActionButton(
              heroTag: 'enhanced_order_tracking_fab',
              onPressed: _callDriver,
              child: const Icon(Icons.phone),
            )
          : null,
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Chargement des informations de commande...'),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red[300],
            ),
            const SizedBox(height: 16),
            Text(
              'Erreur de chargement',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              _error!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadOrderData,
              child: const Text('Réessayer'),
            ),
          ],
        ),
      );
    }

    if (_orderTracking == null) {
      return const Center(
        child: Text('Aucune information de commande trouvée'),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadOrderData,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOrderHeader(),
            const SizedBox(height: 24),
            _buildStatusTimeline(),
            const SizedBox(height: 24),
            _buildOrderDetails(),
            if (_orderTracking!.driverName != null) ...[
              const SizedBox(height: 24),
              _buildDriverInfo(),
            ],
            const SizedBox(height: 24),
            _buildOrderItems(),
            const SizedBox(height: 24),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderHeader() {
    final order = _orderTracking!;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _getStatusColor(order.status),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    order.status.displayName,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: _getStatusColor(order.status),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (order.status.isActive)
                  AnimatedBuilder(
                    animation: _pulseAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _pulseAnimation.value,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _getStatusColor(order.status),
                            shape: BoxShape.circle,
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              order.status.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.restaurant),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    order.restaurantName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.receipt),
                const SizedBox(width: 8),
                Text('Commande #${order.orderNumber}'),
              ],
            ),
            if (order.estimatedDeliveryTime != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.schedule),
                  const SizedBox(width: 8),
                  Text('Livraison estimée: ${order.estimatedDeliveryTime}'),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatusTimeline() {
    final order = _orderTracking!;
    final allStatuses = [
      GuestOrderStatus.pending,
      GuestOrderStatus.confirmed,
      GuestOrderStatus.preparing,
      GuestOrderStatus.ready,
      GuestOrderStatus.assigned,
      GuestOrderStatus.pickedUp,
      GuestOrderStatus.onTheWay,
      GuestOrderStatus.delivered,
    ];

    final currentIndex = allStatuses.indexOf(order.status);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Progression de la commande',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ...allStatuses.asMap().entries.map((entry) {
              final index = entry.key;
              final status = entry.value;
              final isCompleted = index <= currentIndex && order.status != GuestOrderStatus.cancelled;
              final isCurrent = index == currentIndex;

              return _buildTimelineItem(
                status: status,
                isCompleted: isCompleted,
                isCurrent: isCurrent,
                isLast: index == allStatuses.length - 1,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem({
    required GuestOrderStatus status,
    required bool isCompleted,
    required bool isCurrent,
    required bool isLast,
  }) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isCompleted || isCurrent
                    ? _getStatusColor(status)
                    : Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: isCompleted
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : isCurrent
                      ? Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        )
                      : null,
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 32,
                color: isCompleted ? _getStatusColor(status) : Colors.grey[300],
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status.displayName,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                    color: isCompleted || isCurrent ? null : Colors.grey,
                  ),
                ),
                Text(
                  status.description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isCompleted || isCurrent ? null : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderDetails() {
    final order = _orderTracking!;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Détails de la commande',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Adresse de livraison'),
              subtitle: Text(order.deliveryAddress),
            ),
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text('Total'),
              subtitle: Text('${order.totalAmount.toStringAsFixed(0)} ${order.currency}'),
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Commandé le'),
              subtitle: Text(_formatDateTime(order.createdAt)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDriverInfo() {
    final order = _orderTracking!;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informations du livreur',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(order.driverName ?? 'Livreur assigné'),
              subtitle: order.driverPhone != null
                  ? Text('Téléphone: ${order.driverPhone}')
                  : null,
              trailing: order.driverPhone != null
                  ? IconButton(
                      icon: const Icon(Icons.phone),
                      onPressed: _callDriver,
                    )
                  : null,
            ),
            if (order.driverLocation != null) ...[
              const SizedBox(height: 8),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.map, size: 48),
                      SizedBox(height: 8),
                      Text('Carte du livreur'),
                      Text('(À implémenter avec Google Maps)'),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItems() {
    final order = _orderTracking!;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Articles commandés',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ...order.items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text('${item.quantity}x ${item.menuId}'), // This would be item name in real app
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    final order = _orderTracking!;

    return Column(
      children: [
        if (order.status.canCancel) ...[
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: _showCancelDialog,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
              ),
              child: const Text('Annuler la commande'),
            ),
          ),
          const SizedBox(height: 8),
        ],
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _shareOrder,
            child: const Text('Partager le suivi'),
          ),
        ),
        if (widget.isGuestOrder) ...[
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: _showAccountCreationDialog,
              child: const Text('Créer un compte'),
            ),
          ),
        ],
      ],
    );
  }

  Color _getStatusColor(GuestOrderStatus status) {
    switch (status) {
      case GuestOrderStatus.pending:
        return Colors.orange;
      case GuestOrderStatus.confirmed:
        return Colors.blue;
      case GuestOrderStatus.preparing:
        return Colors.amber;
      case GuestOrderStatus.ready:
        return Colors.purple;
      case GuestOrderStatus.assigned:
        return Colors.indigo;
      case GuestOrderStatus.pickedUp:
        return Colors.teal;
      case GuestOrderStatus.onTheWay:
        return Colors.green;
      case GuestOrderStatus.delivered:
        return Colors.green[700]!;
      case GuestOrderStatus.cancelled:
        return Colors.red;
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} à ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  void _callDriver() {
    if (_orderTracking?.driverPhone != null) {
      // Implementation for making phone call
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Appel vers ${_orderTracking!.driverPhone}')),
      );
    }
  }

  void _shareOrder() {
    // Implementation for sharing order tracking
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fonctionnalité de partage à implémenter')),
    );
  }

  void _showCancelDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Annuler la commande'),
        content: const Text(
          'Êtes-vous sûr de vouloir annuler cette commande ? '
          'Cette action ne peut pas être annulée.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Non'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _cancelOrder();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Oui, annuler'),
          ),
        ],
      ),
    );
  }

  void _cancelOrder() {
    // Implementation for canceling order
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Annulation de commande à implémenter')),
    );
  }

  void _showAccountCreationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Créer un compte'),
        content: const Text(
          'Créez un compte EatFast pour suivre toutes vos commandes '
          'et bénéficier de nos avantages.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Plus tard'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Navigate to account creation
            },
            child: const Text('Créer un compte'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _socket?.disconnect();
    _socket?.dispose();
    super.dispose();
  }
}
