/// Real-time Order Tracking Screen
/// Enhanced version with WebSocket integration for live updates
/// TODO: Fix WebSocket integration and complete implementation
library;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:eatfast_mobile/shared/services/websocket/websocket_service.dart' as ws;
import 'package:eatfast_mobile/shared/constants/app_constants.dart';
import '../../domain/models/order.dart';
import '../widgets/order_status_timeline.dart';
import 'package:eatfast_mobile/shared/models/exports.dart';

class RealtimeOrderTrackingScreen extends ConsumerStatefulWidget {
  final String orderId;
  final Order? initialOrder;

  const RealtimeOrderTrackingScreen({
    super.key,
    required this.orderId,
    this.initialOrder,
  });

  @override
  ConsumerState<RealtimeOrderTrackingScreen> createState() => _RealtimeOrderTrackingScreenState();
}

class _RealtimeOrderTrackingScreenState extends ConsumerState<RealtimeOrderTrackingScreen>
    with TickerProviderStateMixin {
  late GoogleMapController _mapController;
  late AnimationController _pulseController;
  late AnimationController _driverMarkerController;

  StreamSubscription<ws.OrderStatusUpdate>? _orderSubscription;
  StreamSubscription<ws.DriverLocationUpdate>? _locationSubscription;
  StreamSubscription<ws.SocketConnectionStatus>? _connectionSubscription;

  Order? _currentOrder;
  ws.DriverLocationUpdate? _driverLocation;
  ws.SocketConnectionStatus _connectionStatus = ws.SocketConnectionStatus.disconnected;

  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  LatLng? _customerLocation;
  LatLng? _restaurantLocation;
  LatLng? _driverCurrentLocation;

  bool _isMapReady = false;
  bool _followDriver = true;
  String? _estimatedArrival;

  @override
  void initState() {
    super.initState();
    _currentOrder = widget.initialOrder;

    // Initialize animations
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _driverMarkerController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _initializeTracking();
  }

  Future<void> _initializeTracking() async {
    final webSocketService = ws.WebSocketService();

    // Subscribe to real-time updates
    _orderSubscription = webSocketService.orderUpdates.listen(_handleOrderUpdate);
    _locationSubscription = webSocketService.driverLocationUpdates.listen(_handleDriverLocation);
    _connectionSubscription = webSocketService.connectionStatus.listen(_handleConnectionStatus);

    // Subscribe to this specific order
    webSocketService.subscribeToOrder(widget.orderId);

    // Get initial location data
    await _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    try {
      // Get customer's current location
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
        final position = await Geolocator.getCurrentPosition();
        _customerLocation = LatLng(position.latitude, position.longitude);
      }

      // Load restaurant location from order (using delivery address as fallback)
      // TODO: Fix this when deliveryAddress structure includes coordinates
      // For now, use a default location if customer location is available
      if (_customerLocation != null) {
        _restaurantLocation = _customerLocation; // Temporary fallback
      }

      // Subscribe to driver location if order has driver
      if (_currentOrder?.driverId != null) {
        ws.WebSocketService().subscribeToDriverLocation(_currentOrder!.driverId!);
      }

      _updateMapMarkers();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur de localisation: $e')),
        );
      }
    }
  }

  void _handleOrderUpdate(ws.OrderStatusUpdate update) {
    if (update.orderId == widget.orderId) {
      setState(() {
        // Update order status
        if (_currentOrder != null) {
          _currentOrder = _currentOrder!.copyWith(
            status: _mapOrderStatus(update.status),
            estimatedDeliveryTime: update.estimatedDeliveryTime,
          );
        }

        // Update estimated arrival
        _estimatedArrival = update.estimatedDeliveryTime;

        // Subscribe to driver location when assigned
        if (update.driverId != null && _currentOrder?.driverId != update.driverId) {
          ws.WebSocketService().subscribeToDriverLocation(update.driverId!);
        }
      });

      // Show status update notification
      _showStatusNotification(update.status);
    }
  }

  void _handleDriverLocation(ws.DriverLocationUpdate update) {
    if (update.orderId == widget.orderId ||
        (_currentOrder?.driverId != null && update.driverId == _currentOrder!.driverId)) {

      setState(() {
        _driverCurrentLocation = LatLng(update.latitude, update.longitude);
      });

      _updateDriverMarker();

      // Auto-follow driver if enabled
      if (_followDriver && _isMapReady) {
        _animateToDriverLocation();
      }
    }
  }

  void _handleConnectionStatus(ws.SocketConnectionStatus status) {
    setState(() {
      _connectionStatus = status;
    });
  }

  void _updateMapMarkers() {
    _markers.clear();

    // Customer marker
    if (_customerLocation != null) {
      _markers.add(Marker(
        markerId: const MarkerId('customer'),
        position: _customerLocation!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: const InfoWindow(title: 'Votre position'),
      ));
    }

    // Restaurant marker
    if (_restaurantLocation != null) {
      _markers.add(Marker(
        markerId: const MarkerId('restaurant'),
        position: _restaurantLocation!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: InfoWindow(
          title: _currentOrder?.restaurantName ?? 'Restaurant',
          snippet: 'Point de départ',
        ),
      ));
    }

    // Driver marker
    _updateDriverMarker();
  }

  void _updateDriverMarker() {
    if (_driverCurrentLocation != null) {
      _markers.removeWhere((marker) => marker.markerId.value == 'driver');

      _markers.add(Marker(
        markerId: const MarkerId('driver'),
        position: _driverCurrentLocation!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: const InfoWindow(
          title: 'Livreur',
          snippet: 'Position en temps réel',
        ),
        anchor: const Offset(0.5, 0.5),
      ));
    }
  }

  void _animateToDriverLocation() {
    if (_driverCurrentLocation != null && _isMapReady) {
      _mapController.animateCamera(
        CameraUpdate.newLatLngZoom(_driverCurrentLocation!, 15),
      );
    }
  }

  OrderStatus _mapOrderStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending': return OrderStatus.created;
      case 'confirmed': return OrderStatus.confirmed;
      case 'preparing': return OrderStatus.preparing;
      case 'ready': return OrderStatus.readyForPickup;
      case 'picked_up': return OrderStatus.pickedUp;
      case 'in_transit': return OrderStatus.inTransit;
      case 'delivered': return OrderStatus.delivered;
      case 'cancelled': return OrderStatus.cancelled;
      default: return OrderStatus.created;
    }
  }

  void _showStatusNotification(String status) {
    String message = _getStatusMessage(status);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.notifications_active, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: _getStatusColor(status),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  String _getStatusMessage(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed': return 'Commande confirmée par le restaurant';
      case 'preparing': return 'Votre commande est en préparation';
      case 'ready': return 'Commande prête - En attente du livreur';
      case 'picked_up': return 'Commande récupérée par le livreur';
      case 'in_transit': return 'Le livreur est en route vers vous';
      case 'delivered': return 'Commande livrée avec succès!';
      case 'cancelled': return 'Commande annulée';
      default: return 'Mise à jour de commande';
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
      case 'preparing': return Colors.orange;
      case 'ready':
      case 'picked_up': return Colors.blue;
      case 'in_transit': return Colors.purple;
      case 'delivered': return Colors.green;
      case 'cancelled': return Colors.red;
      default: return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suivi en temps réel'),
        actions: [
          // Connection status indicator
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _connectionStatus == ws.SocketConnectionStatus.connected
                      ? Icons.wifi
                      : Icons.wifi_off,
                  color: _connectionStatus == ws.SocketConnectionStatus.connected
                      ? Colors.green
                      : Colors.red,
                  size: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  _getConnectionStatusText(),
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
      body: _currentOrder == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Order info header
                _buildOrderHeader(),

                // Map section
                Expanded(
                  flex: 3,
                  child: _buildMapSection(),
                ),

                // Timeline section
                Expanded(
                  flex: 2,
                  child: _buildTimelineSection(),
                ),
              ],
            ),
      floatingActionButton: _driverCurrentLocation != null
          ? FloatingActionButton(
              heroTag: 'realtime_order_tracking_fab',
              onPressed: () {
                setState(() {
                  _followDriver = !_followDriver;
                });
                if (_followDriver) {
                  _animateToDriverLocation();
                }
              },
              child: Icon(
                _followDriver ? Icons.gps_fixed : Icons.gps_not_fixed,
              ),
            )
          : null,
    );
  }

  Widget _buildOrderHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Commande #${widget.orderId.substring(0, 8)}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _currentOrder?.restaurantName ?? 'Restaurant',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                if (_estimatedArrival != null)
                  Text(
                    'Arrivée estimée: $_estimatedArrival',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _getStatusColor(_currentOrder?.status.toString() ?? ''),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              _getStatusDisplayName(_currentOrder?.status ?? OrderStatus.created),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapSection() {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: (controller) {
            _mapController = controller;
            _isMapReady = true;
            _updateMapMarkers();
          },
          initialCameraPosition: CameraPosition(
            target: _customerLocation ?? const LatLng(3.8480, 11.5021), // Default Yaoundé
            zoom: 14,
          ),
          markers: _markers,
          polylines: _polylines,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
        ),

        // Driver info overlay
        if (_driverLocation != null)
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: _buildDriverInfoCard(),
          ),
      ],
    );
  }

  Widget _buildDriverInfoCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            AnimatedBuilder(
              animation: _pulseController,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1.0 + (_pulseController.value * 0.1),
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Livreur en route',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Position mise à jour en temps réel',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                // Call driver functionality
                _showCallDriverDialog();
              },
              icon: const Icon(Icons.phone, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Statut de la commande',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: OrderStatusTimeline(
              order: _currentOrder!,
              showEstimatedTimes: true,
            ),
          ),
        ],
      ),
    );
  }

  String _getConnectionStatusText() {
    switch (_connectionStatus) {
      case ws.SocketConnectionStatus.connected:
        return 'En ligne';
      case ws.SocketConnectionStatus.connecting:
        return 'Connexion...';
      case ws.SocketConnectionStatus.reconnecting:
        return 'Reconnexion...';
      case ws.SocketConnectionStatus.disconnected:
        return 'Hors ligne';
      case ws.SocketConnectionStatus.error:
        return 'Erreur';
    }
  }

  String _getStatusDisplayName(OrderStatus status) {
    switch (status) {
      case OrderStatus.created:
        return 'En attente';
      case OrderStatus.confirmed:
        return 'Confirmée';
      case OrderStatus.preparing:
        return 'En préparation';
      case OrderStatus.readyForPickup:
        return 'Prête';
      case OrderStatus.pickedUp:
        return 'Récupérée';
      case OrderStatus.inTransit:
        return 'En transit';
      case OrderStatus.delivered:
        return 'Livrée';
      case OrderStatus.cancelled:
        return 'Annulée';
    }
  }

  void _showCallDriverDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Contacter le livreur'),
        content: const Text('Voulez-vous appeler le livreur?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Implement call functionality
            },
            child: const Text('Appeler'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _driverMarkerController.dispose();
    _orderSubscription?.cancel();
    _locationSubscription?.cancel();
    _connectionSubscription?.cancel();

    // Unsubscribe from WebSocket events
    ws.WebSocketService().unsubscribeFromOrder(widget.orderId);

    super.dispose();
  }
}
