import 'dart:async';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:logging/logging.dart';

import '../../constants/app_constants.dart';
import '../../models/api_responses.dart' as api;
import '../../error/app_error.dart';
import '../../../features/orders/domain/models/order.dart';

/// Comprehensive WebSocket service for real-time features
class WebSocketService {
  static WebSocketService? _instance;
  static WebSocketService get instance => _instance ??= WebSocketService._();
  
  WebSocketService._();

  final Logger _logger = Logger('WebSocketService');
  io.Socket? _socket;
  bool _isConnected = false;
  String? _userId;
  String? _userRole;

  // Stream controllers for different real-time events
  final _orderStatusController = StreamController<api.OrderStatusUpdate>.broadcast();
  final _driverLocationController = StreamController<api.DriverLocation>.broadcast();
  final _restaurantStatusController = StreamController<RestaurantStatusUpdate>.broadcast();
  final _newOrderController = StreamController<Order>.broadcast();
  final _connectionStatusController = StreamController<bool>.broadcast();

  // Public streams
  Stream<api.OrderStatusUpdate> get orderStatusStream => _orderStatusController.stream;
  Stream<api.DriverLocation> get driverLocationStream => _driverLocationController.stream;
  Stream<RestaurantStatusUpdate> get restaurantStatusStream => _restaurantStatusController.stream;
  Stream<Order> get newOrderStream => _newOrderController.stream;
  Stream<bool> get connectionStatusStream => _connectionStatusController.stream;

  bool get isConnected => _isConnected;

  /// Connect to WebSocket server with authentication
  Future<void> connect({
    required String userId,
    required String userRole,
    required String token,
  }) async {
    try {
      if (_socket != null && _isConnected) {
        _logger.info('WebSocket already connected');
        return;
      }

      _userId = userId;
      _userRole = userRole;

      _logger.info('Connecting to WebSocket server...');

      _socket = io.io(
        AppConstants.baseUrl.replaceAll('/api', ''), // Remove /api for socket connection
        io.OptionBuilder()
            .setTransports(['websocket', 'polling'])
            .enableAutoConnect()
            .enableReconnection()
            .setReconnectionAttempts(5)
            .setReconnectionDelay(1000)
            .setAuth({
              'token': token,
              'userId': userId,
              'role': userRole,
            })
            .build(),
      );

      _setupEventHandlers();
      
      _logger.info('WebSocket connection initiated');
    } catch (e) {
      _logger.severe('Failed to connect to WebSocket: $e');
      throw const AppError.networkError(
        message: 'Failed to establish real-time connection',
      );
    }
  }

  /// Setup event handlers for WebSocket
  void _setupEventHandlers() {
    if (_socket == null) return;

    // Connection events
    _socket!.onConnect((_) {
      _logger.info('WebSocket connected successfully');
      _isConnected = true;
      _connectionStatusController.add(true);
      
      // Join user-specific rooms based on role
      _joinUserRooms();
    });

    _socket!.onDisconnect((reason) {
      _logger.warning('WebSocket disconnected: $reason');
      _isConnected = false;
      _connectionStatusController.add(false);
    });

    _socket!.onConnectError((error) {
      _logger.severe('WebSocket connection error: $error');
      _isConnected = false;
      _connectionStatusController.add(false);
    });

    _socket!.onError((error) {
      _logger.severe('WebSocket error: $error');
    });

    // Business logic events
    _setupBusinessEventHandlers();
  }

  /// Setup business-specific event handlers
  void _setupBusinessEventHandlers() {
    if (_socket == null) return;

    // Order status updates
    _socket!.on('order_status_update', (data) {
      try {
        final update = api.OrderStatusUpdate.fromJson(data);
        _orderStatusController.add(update);
        _logger.info('Order status updated: ${update.status}');
      } catch (e) {
        _logger.warning('Failed to parse order status update: $e');
      }
    });

    // Driver location updates
    _socket!.on('driver_location_update', (data) {
      try {
        final location = api.DriverLocation.fromJson(data);
        _driverLocationController.add(location);
      } catch (e) {
        _logger.warning('Failed to parse driver location: $e');
      }
    });

    // Restaurant status updates
    _socket!.on('restaurant_status_update', (data) {
      try {
        final update = RestaurantStatusUpdate.fromJson(data);
        _restaurantStatusController.add(update);
      } catch (e) {
        _logger.warning('Failed to parse restaurant status: $e');
      }
    });

    // New orders (for restaurants and drivers)
    _socket!.on('new_order', (data) {
      try {
        final order = Order.fromJson(data);
        _newOrderController.add(order);
        _logger.info('New order received: ${order.id}');
      } catch (e) {
        _logger.warning('Failed to parse new order: $e');
      }
    });

    // Driver assignment notifications
    _socket!.on('driver_assigned', (data) {
      try {
        final update = api.OrderStatusUpdate.fromJson(data);
        _orderStatusController.add(update);
      } catch (e) {
        _logger.warning('Failed to parse driver assignment: $e');
      }
    });

    // Order completion notifications
    _socket!.on('order_completed', (data) {
      try {
        final update = api.OrderStatusUpdate.fromJson(data);
        _orderStatusController.add(update);
      } catch (e) {
        _logger.warning('Failed to parse order completion: $e');
      }
    });
  }

  /// Join user-specific rooms based on role
  void _joinUserRooms() {
    if (_socket == null || !_isConnected || _userId == null || _userRole == null) {
      return;
    }

    // Join general user room
    _socket!.emit('join_user_room', {
      'userId': _userId,
      'role': _userRole,
    });

    // Join role-specific rooms
    switch (_userRole) {
      case 'customer':
        _socket!.emit('join_customer_room', {'userId': _userId});
        break;
      case 'restaurant_owner':
        _socket!.emit('join_restaurant_room', {'userId': _userId});
        break;
      case 'delivery_agent':
        _socket!.emit('join_driver_room', {'userId': _userId});
        break;
      case 'admin':
        _socket!.emit('join_admin_room', {'userId': _userId});
        break;
    }

    _logger.info('Joined WebSocket rooms for role: $_userRole');
  }

  /// Subscribe to order updates for a specific order
  void subscribeToOrderUpdates(String orderId) {
    if (_socket == null || !_isConnected) {
      _logger.warning('Cannot subscribe to order updates: not connected');
      return;
    }

    _socket!.emit('subscribe_order_updates', {'orderId': orderId});
    _logger.info('Subscribed to updates for order: $orderId');
  }

  /// Unsubscribe from order updates
  void unsubscribeFromOrderUpdates(String orderId) {
    if (_socket == null || !_isConnected) return;

    _socket!.emit('unsubscribe_order_updates', {'orderId': orderId});
    _logger.info('Unsubscribed from updates for order: $orderId');
  }

  /// Update driver location (for drivers)
  void updateDriverLocation({
    required double latitude,
    required double longitude,
    required String orderId,
  }) {
    if (_socket == null || !_isConnected) return;

    _socket!.emit('driver_location_update', {
      'latitude': latitude,
      'longitude': longitude,
      'orderId': orderId,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  /// Update order status (for restaurants and drivers)
  void updateOrderStatus({
    required String orderId,
    required String status,
    String? message,
  }) {
    if (_socket == null || !_isConnected) return;

    _socket!.emit('order_status_update', {
      'orderId': orderId,
      'status': status,
      'message': message,
      'updatedBy': _userId,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  /// Send driver availability status
  void updateDriverAvailability(bool isAvailable) {
    if (_socket == null || !_isConnected || _userRole != 'delivery_agent') return;

    _socket!.emit('driver_availability_update', {
      'driverId': _userId,
      'isAvailable': isAvailable,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  /// Accept order (for drivers)
  void acceptOrder(String orderId) {
    if (_socket == null || !_isConnected) return;

    _socket!.emit('accept_order', {
      'orderId': orderId,
      'driverId': _userId,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  /// Reject order (for restaurants and drivers)
  void rejectOrder(String orderId, {String? reason}) {
    if (_socket == null || !_isConnected) return;

    _socket!.emit('reject_order', {
      'orderId': orderId,
      'rejectedBy': _userId,
      'reason': reason,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  /// Send typing indicator (for chat features)
  void sendTypingIndicator({
    required String conversationId,
    required bool isTyping,
  }) {
    if (_socket == null || !_isConnected) return;

    _socket!.emit('typing_indicator', {
      'conversationId': conversationId,
      'userId': _userId,
      'isTyping': isTyping,
    });
  }

  /// Disconnect from WebSocket server
  Future<void> disconnect() async {
    try {
      _logger.info('Disconnecting WebSocket...');
      
      _socket?.disconnect();
      _socket?.dispose();
      _socket = null;
      _isConnected = false;
      _userId = null;
      _userRole = null;
      
      _connectionStatusController.add(false);
      
      _logger.info('WebSocket disconnected successfully');
    } catch (e) {
      _logger.severe('Error disconnecting WebSocket: $e');
    }
  }

  /// Dispose all resources
  void dispose() {
    disconnect();
    
    // Close all stream controllers
    _orderStatusController.close();
    _driverLocationController.close();
    _restaurantStatusController.close();
    _newOrderController.close();
    _connectionStatusController.close();
  }

  /// Reconnect to WebSocket
  Future<void> reconnect() async {
    if (_userId != null && _userRole != null) {
      await disconnect();
      // Note: In a real implementation, you'd need to get a fresh token
      // await connect(userId: _userId!, userRole: _userRole!, token: token);
    }
  }
}

/// Extension for Order model integration
extension OrderWebSocket on Order {
  void subscribeToUpdates() {
    WebSocketService.instance.subscribeToOrderUpdates(id);
  }

  void unsubscribeFromUpdates() {
    WebSocketService.instance.unsubscribeFromOrderUpdates(id);
  }
}

/// Restaurant status update model
class RestaurantStatusUpdate {
  final String restaurantId;
  final bool isOpen;
  final String? message;
  final DateTime timestamp;

  RestaurantStatusUpdate({
    required this.restaurantId,
    required this.isOpen,
    this.message,
    required this.timestamp,
  });

  factory RestaurantStatusUpdate.fromJson(Map<String, dynamic> json) {
    return RestaurantStatusUpdate(
      restaurantId: json['restaurantId'],
      isOpen: json['isOpen'],
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'restaurantId': restaurantId,
      'isOpen': isOpen,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}