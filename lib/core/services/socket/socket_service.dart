import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:logging/logging.dart';
import 'dart:async';
import '../../constants/api_constants.dart';
import '../auth/auth_service.dart';
import '../../../features/orders/domain/models/order.dart';

/// Socket.IO service for real-time updates
class SocketService {
  final AuthService? _authService;
  final Logger _logger = Logger('SocketService');
  
  SocketService([this._authService]);
  
  io.Socket? _socket;
  bool _isConnected = false;
  
  // Stream controllers for different events
  final _orderUpdateController = StreamController<Order>.broadcast();
  final _driverLocationController = StreamController<DriverLocationUpdate>.broadcast();
  final _notificationController = StreamController<NotificationData>.broadcast();
  final _restaurantStatusController = StreamController<RestaurantStatusUpdate>.broadcast();
  
  
  // Stream getters
  Stream<Order> get orderUpdates => _orderUpdateController.stream;
  Stream<DriverLocationUpdate> get driverLocationUpdates => _driverLocationController.stream;
  Stream<NotificationData> get notifications => _notificationController.stream;
  Stream<RestaurantStatusUpdate> get restaurantStatusUpdates => _restaurantStatusController.stream;
  
  /// Initialize socket connection
  Future<void> connect() async {
    if (_isConnected && _socket != null) return;
    
    try {
      // Get auth token (only if auth service is available)
      bool isAuthenticated = false;
      if (_authService != null) {
        isAuthenticated = await _authService.isAuthenticated;
      }
      
      // Create socket with authentication
      Map<String, dynamic>? authData;
      if (isAuthenticated) {
        final token = await _getAuthToken();
        if (token != null) {
          authData = {'token': token};
        }
      }
      
      _socket = io.io(
        ApiConstants.baseUrl.replaceAll('/api', ''),
        io.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .enableReconnection()
            .setReconnectionAttempts(5)
            .setReconnectionDelay(1000)
            .setAuth(authData ?? <String, dynamic>{})
            .build(),
      );
      
      _setupEventListeners();
      
      _socket!.connect();
    } catch (e) {
      _logger.warning('Socket connection error: $e');
    }
  }
  
  /// Disconnect socket
  void disconnect() {
    _socket?.disconnect();
    _socket = null;
    _isConnected = false;
  }
  
  /// Setup event listeners
  void _setupEventListeners() {
    if (_socket == null) return;
    
    // Connection events
    _socket!.onConnect((_) {
      _isConnected = true;
      _logger.info('Socket connected');
    });
    
    _socket!.onDisconnect((_) {
      _isConnected = false;
      _logger.info('Socket disconnected');
    });
    
    _socket!.onConnectError((data) {
      _logger.warning('Socket connection error: $data');
    });
    
    // Order updates
    _socket!.on(ApiConstants.socketOrderUpdate, (data) {
      try {
        if (data is Map<String, dynamic>) {
          final order = Order.fromJson(data);
          _orderUpdateController.add(order);
        }
      } catch (e) {
        _logger.warning('Error parsing order update: $e');
      }
    });
    
    // Driver location updates
    _socket!.on(ApiConstants.socketLocationUpdate, (data) {
      try {
        if (data is Map<String, dynamic>) {
          final locationUpdate = DriverLocationUpdate.fromJson(data);
          _driverLocationController.add(locationUpdate);
        }
      } catch (e) {
        _logger.warning('Error parsing location update: $e');
      }
    });
    
    // Notifications
    _socket!.on(ApiConstants.socketNotification, (data) {
      try {
        if (data is Map<String, dynamic>) {
          final notification = NotificationData.fromJson(data);
          _notificationController.add(notification);
        }
      } catch (e) {
        _logger.warning('Error parsing notification: $e');
      }
    });
    
    // Restaurant status updates
    _socket!.on(ApiConstants.socketRestaurantStatus, (data) {
      try {
        if (data is Map<String, dynamic>) {
          final statusUpdate = RestaurantStatusUpdate.fromJson(data);
          _restaurantStatusController.add(statusUpdate);
        }
      } catch (e) {
        _logger.warning('Error parsing restaurant status: $e');
      }
    });
  }
  
  /// Join order room for updates
  void joinOrderRoom(String orderId) {
    _socket?.emit('join_order_room', {'orderId': orderId});
  }
  
  /// Leave order room
  void leaveOrderRoom(String orderId) {
    _socket?.emit('leave_order_room', {'orderId': orderId});
  }
  
  /// Join driver tracking room
  void joinDriverRoom(String driverId) {
    _socket?.emit('join_driver_room', {'driverId': driverId});
  }
  
  /// Leave driver tracking room
  void leaveDriverRoom(String driverId) {
    _socket?.emit('leave_driver_room', {'driverId': driverId});
  }
  
  /// Send driver location update (for drivers)
  void updateDriverLocation({
    required String orderId,
    required double lat,
    required double lng,
  }) {
    _socket?.emit('driver_location_update', {
      'orderId': orderId,
      'location': {
        'lat': lat,
        'lng': lng,
      },
      'timestamp': DateTime.now().toIso8601String(),
    });
  }
  
  /// Update driver status (for drivers)
  void updateDriverStatus({
    required String status,
    String? orderId,
  }) {
    _socket?.emit('driver_status_update', {
      'status': status,
      if (orderId != null) 'orderId': orderId,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }
  
  /// Get auth token for socket authentication
  Future<String?> _getAuthToken() async {
    if (_authService != null) {
      // Get token from the auth service - would need to add a method to get current token
      // For now, returning null until AuthService exposes token getter
      return null;
    }
    return null;
  }
  
  /// Check if socket is connected
  bool get isConnected => _isConnected;
  
  /// Dispose resources
  void dispose() {
    _orderUpdateController.close();
    _driverLocationController.close();
    _notificationController.close();
    _restaurantStatusController.close();
    disconnect();
  }
}

/// Models for socket events
class DriverLocationUpdate {
  final String orderId;
  final String driverId;
  final double lat;
  final double lng;
  final DateTime timestamp;
  
  DriverLocationUpdate({
    required this.orderId,
    required this.driverId,
    required this.lat,
    required this.lng,
    required this.timestamp,
  });
  
  factory DriverLocationUpdate.fromJson(Map<String, dynamic> json) {
    return DriverLocationUpdate(
      orderId: json['orderId'] as String,
      driverId: json['driverId'] as String,
      lat: (json['location']['lat'] as num).toDouble(),
      lng: (json['location']['lng'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
}

class NotificationData {
  final String id;
  final String type;
  final String title;
  final String message;
  final Map<String, dynamic>? data;
  final DateTime timestamp;
  
  NotificationData({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    this.data,
    required this.timestamp,
  });
  
  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      data: json['data'] as Map<String, dynamic>?,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
}

class RestaurantStatusUpdate {
  final String restaurantId;
  final String status;
  final bool isOpen;
  final String? message;
  final DateTime timestamp;
  
  RestaurantStatusUpdate({
    required this.restaurantId,
    required this.status,
    required this.isOpen,
    this.message,
    required this.timestamp,
  });
  
  factory RestaurantStatusUpdate.fromJson(Map<String, dynamic> json) {
    return RestaurantStatusUpdate(
      restaurantId: json['restaurantId'] as String,
      status: json['status'] as String,
      isOpen: json['isOpen'] as bool,
      message: json['message'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
}

// Provider for socket service
final socketServiceProvider = Provider<SocketService>((ref) {
  final service = SocketService();
  
  // Auto-connect when provider is created
  service.connect();
  
  // Dispose when provider is disposed
  ref.onDispose(() {
    service.dispose();
  });
  
  return service;
});
