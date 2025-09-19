/// Real-time WebSocket Service for EatFast
/// Handles live order tracking, driver location updates, and real-time notifications

import 'dart:async';
// import 'dart:convert'; // Removed unused import
import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../constants/api_constants.dart';
// import '../../../features/orders/domain/models/order.dart'; // Removed unused import

enum SocketConnectionStatus {
  disconnected,
  connecting,
  connected,
  reconnecting,
  error
}

class WebSocketService {
  static final WebSocketService _instance = WebSocketService._internal();
  factory WebSocketService() => _instance;

  IO.Socket? _socket;
  SocketConnectionStatus _status = SocketConnectionStatus.disconnected;
  Timer? _heartbeatTimer;
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;
  static const int _maxReconnectAttempts = 5;
  static const Duration _heartbeatInterval = Duration(seconds: 30);
  static const Duration _reconnectDelay = Duration(seconds: 5);

  // Stream controllers for real-time events
  final StreamController<OrderStatusUpdate> _orderUpdatesController =
      StreamController<OrderStatusUpdate>.broadcast();
  final StreamController<DriverLocationUpdate> _driverLocationController =
      StreamController<DriverLocationUpdate>.broadcast();
  final StreamController<Map<String, dynamic>> _notificationController =
      StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<SocketConnectionStatus> _connectionStatusController =
      StreamController<SocketConnectionStatus>.broadcast();

  // Getters for streams
  Stream<OrderStatusUpdate> get orderUpdates => _orderUpdatesController.stream;
  Stream<DriverLocationUpdate> get driverLocationUpdates => _driverLocationController.stream;
  Stream<Map<String, dynamic>> get notifications => _notificationController.stream;
  Stream<SocketConnectionStatus> get connectionStatus => _connectionStatusController.stream;

  SocketConnectionStatus get currentStatus => _status;

  WebSocketService._internal();

  /// Initialize WebSocket connection
  Future<void> connect({required String userId, String? authToken}) async {
    if (_socket?.connected == true) {
      if (kDebugMode) print('WebSocket already connected');
      return;
    }

    _updateConnectionStatus(SocketConnectionStatus.connecting);

    try {
      // Extract base URL for socket connection
      final baseUrl = ApiConstants.baseUrl
          .replaceAll('/api/v1', '')
          .replaceAll('/api', '');

      _socket = IO.io(baseUrl, IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .enableReconnection()
          .setReconnectionAttempts(_maxReconnectAttempts)
          .setReconnectionDelay(_reconnectDelay.inMilliseconds)
          .setExtraHeaders({
            if (authToken != null) 'Authorization': 'Bearer $authToken',
            'X-User-ID': userId,
            'X-Platform': 'flutter_mobile',
          })
          .build());

      _setupEventListeners();
      _socket!.connect();

      if (kDebugMode) print('WebSocket connecting to: $baseUrl');
    } catch (e) {
      if (kDebugMode) print('WebSocket connection error: $e');
      _updateConnectionStatus(SocketConnectionStatus.error);
    }
  }

  /// Setup all event listeners
  void _setupEventListeners() {
    if (_socket == null) return;

    // Connection events
    _socket!.onConnect((_) {
      if (kDebugMode) print('WebSocket connected');
      _updateConnectionStatus(SocketConnectionStatus.connected);
      _reconnectAttempts = 0;
      _startHeartbeat();
      _joinUserRoom();
    });

    _socket!.onDisconnect((_) {
      if (kDebugMode) print('WebSocket disconnected');
      _updateConnectionStatus(SocketConnectionStatus.disconnected);
      _stopHeartbeat();
      _scheduleReconnect();
    });

    _socket!.onConnectError((error) {
      if (kDebugMode) print('WebSocket connection error: $error');
      _updateConnectionStatus(SocketConnectionStatus.error);
      _scheduleReconnect();
    });

    _socket!.onReconnect((_) {
      if (kDebugMode) print('WebSocket reconnected');
      _updateConnectionStatus(SocketConnectionStatus.connected);
      _reconnectAttempts = 0;
    });

    _socket!.onReconnectError((error) {
      if (kDebugMode) print('WebSocket reconnection error: $error');
      _reconnectAttempts++;
      if (_reconnectAttempts >= _maxReconnectAttempts) {
        _updateConnectionStatus(SocketConnectionStatus.error);
      }
    });

    // Business logic events - matching backend exactly
    _socket!.on('order_update', (data) {
      try {
        final orderUpdate = OrderStatusUpdate.fromJson(data);
        _orderUpdatesController.add(orderUpdate);
        if (kDebugMode) print('Order update received: ${orderUpdate.orderId} -> ${orderUpdate.status}');
      } catch (e) {
        if (kDebugMode) print('Error parsing order update: $e');
      }
    });

    _socket!.on('location_update', (data) {
      try {
        final locationUpdate = DriverLocationUpdate.fromJson(data);
        _driverLocationController.add(locationUpdate);
        if (kDebugMode) print('Driver location update: ${locationUpdate.driverId}');
      } catch (e) {
        if (kDebugMode) print('Error parsing location update: $e');
      }
    });

    _socket!.on('notification', (data) {
      try {
        final notification = Map<String, dynamic>.from(data);
        _notificationController.add(notification);
        if (kDebugMode) print('Real-time notification: ${notification['type']}');
      } catch (e) {
        if (kDebugMode) print('Error parsing notification: $e');
      }
    });

    _socket!.on('driver_status_update', (data) {
      try {
        if (kDebugMode) print('Driver status update: $data');
        // Handle driver status updates for restaurant owners
      } catch (e) {
        if (kDebugMode) print('Error parsing driver status: $e');
      }
    });

    _socket!.on('restaurant_status_update', (data) {
      try {
        if (kDebugMode) print('Restaurant status update: $data');
        // Handle restaurant status updates
      } catch (e) {
        if (kDebugMode) print('Error parsing restaurant status: $e');
      }
    });

    // Error handling
    _socket!.on('error', (error) {
      if (kDebugMode) print('WebSocket error: $error');
    });
  }

  /// Join user-specific room for targeted updates
  void _joinUserRoom() {
    if (_socket?.connected == true) {
      _socket!.emit('join_user_room');
      if (kDebugMode) print('Joined user-specific room');
    }
  }

  /// Start heartbeat to keep connection alive
  void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = Timer.periodic(_heartbeatInterval, (timer) {
      if (_socket?.connected == true) {
        _socket!.emit('ping');
      }
    });
  }

  /// Stop heartbeat timer
  void _stopHeartbeat() {
    _heartbeatTimer?.cancel();
  }

  /// Schedule reconnection attempt
  void _scheduleReconnect() {
    if (_reconnectAttempts < _maxReconnectAttempts) {
      _updateConnectionStatus(SocketConnectionStatus.reconnecting);
      _reconnectTimer?.cancel();
      _reconnectTimer = Timer(_reconnectDelay, () {
        _reconnectAttempts++;
        if (kDebugMode) print('Reconnection attempt $_reconnectAttempts');
        _socket?.connect();
      });
    }
  }

  /// Update connection status and notify listeners
  void _updateConnectionStatus(SocketConnectionStatus status) {
    _status = status;
    _connectionStatusController.add(status);
  }

  // Public methods for specific actions

  /// Subscribe to order updates for a specific order
  void subscribeToOrder(String orderId) {
    if (_socket?.connected == true) {
      _socket!.emit('subscribe_order', {'orderId': orderId});
      if (kDebugMode) print('Subscribed to order: $orderId');
    }
  }

  /// Unsubscribe from order updates
  void unsubscribeFromOrder(String orderId) {
    if (_socket?.connected == true) {
      _socket!.emit('unsubscribe_order', {'orderId': orderId});
      if (kDebugMode) print('Unsubscribed from order: $orderId');
    }
  }

  /// Subscribe to driver location updates
  void subscribeToDriverLocation(String driverId) {
    if (_socket?.connected == true) {
      _socket!.emit('subscribe_driver', {'driverId': driverId});
      if (kDebugMode) print('Subscribed to driver: $driverId');
    }
  }

  /// Send driver location update (for drivers)
  void updateDriverLocation({
    required double latitude,
    required double longitude,
    required String orderId,
  }) {
    if (_socket?.connected == true) {
      _socket!.emit('update_location', {
        'latitude': latitude,
        'longitude': longitude,
        'orderId': orderId,
        'timestamp': DateTime.now().toIso8601String(),
      });
    }
  }

  /// Update order status (for restaurants and drivers)
  void updateOrderStatus({
    required String orderId,
    required String status,
    Map<String, dynamic>? metadata,
  }) {
    if (_socket?.connected == true) {
      _socket!.emit('update_order_status', {
        'orderId': orderId,
        'status': status,
        'timestamp': DateTime.now().toIso8601String(),
        if (metadata != null) ...metadata,
      });
    }
  }

  /// Send custom message to specific user
  void sendMessage({
    required String recipientId,
    required String message,
    String? type,
  }) {
    if (_socket?.connected == true) {
      _socket!.emit('send_message', {
        'recipientId': recipientId,
        'message': message,
        'type': type ?? 'custom',
        'timestamp': DateTime.now().toIso8601String(),
      });
    }
  }

  /// Disconnect WebSocket
  void disconnect() {
    _heartbeatTimer?.cancel();
    _reconnectTimer?.cancel();
    _socket?.disconnect();
    _socket?.dispose();
    _socket = null;
    _updateConnectionStatus(SocketConnectionStatus.disconnected);
    if (kDebugMode) print('WebSocket disconnected manually');
  }

  /// Dispose all resources
  void dispose() {
    disconnect();
    _orderUpdatesController.close();
    _driverLocationController.close();
    _notificationController.close();
    _connectionStatusController.close();
  }
}

/// Order status update model
class OrderStatusUpdate {
  final String orderId;
  final String status;
  final String? estimatedDeliveryTime;
  final String? driverId;
  final String? restaurantId;
  final Map<String, dynamic>? metadata;
  final DateTime timestamp;

  OrderStatusUpdate({
    required this.orderId,
    required this.status,
    this.estimatedDeliveryTime,
    this.driverId,
    this.restaurantId,
    this.metadata,
    required this.timestamp,
  });

  factory OrderStatusUpdate.fromJson(Map<String, dynamic> json) {
    return OrderStatusUpdate(
      orderId: json['orderId'] ?? json['order_id'] ?? '',
      status: json['status'] ?? '',
      estimatedDeliveryTime: json['estimatedDeliveryTime'] ?? json['estimated_delivery_time'],
      driverId: json['driverId'] ?? json['driver_id'],
      restaurantId: json['restaurantId'] ?? json['restaurant_id'],
      metadata: json['metadata'],
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'status': status,
      'estimatedDeliveryTime': estimatedDeliveryTime,
      'driverId': driverId,
      'restaurantId': restaurantId,
      'metadata': metadata,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

/// Driver location update model
class DriverLocationUpdate {
  final String driverId;
  final double latitude;
  final double longitude;
  final String? orderId;
  final DateTime timestamp;
  final double? accuracy;
  final double? bearing;
  final double? speed;

  DriverLocationUpdate({
    required this.driverId,
    required this.latitude,
    required this.longitude,
    this.orderId,
    required this.timestamp,
    this.accuracy,
    this.bearing,
    this.speed,
  });

  factory DriverLocationUpdate.fromJson(Map<String, dynamic> json) {
    return DriverLocationUpdate(
      driverId: json['driverId'] ?? json['driver_id'] ?? '',
      latitude: (json['latitude'] ?? json['lat'] ?? 0.0).toDouble(),
      longitude: (json['longitude'] ?? json['lng'] ?? 0.0).toDouble(),
      orderId: json['orderId'] ?? json['order_id'],
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'])
          : DateTime.now(),
      accuracy: json['accuracy']?.toDouble(),
      bearing: json['bearing']?.toDouble(),
      speed: json['speed']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'driverId': driverId,
      'latitude': latitude,
      'longitude': longitude,
      'orderId': orderId,
      'timestamp': timestamp.toIso8601String(),
      'accuracy': accuracy,
      'bearing': bearing,
      'speed': speed,
    };
  }
}