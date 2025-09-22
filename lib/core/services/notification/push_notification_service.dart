/// Push Notification Service for EatFast
/// Integrates with backend notification service using web push (no Firebase)
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../constants/api_constants.dart';
import '../api/api_client.dart';

class PushNotificationService {
  static final PushNotificationService _instance = PushNotificationService._internal();
  factory PushNotificationService() => _instance;

  FlutterLocalNotificationsPlugin? _localNotifications;
  String? _deviceToken;
  bool _isInitialized = false;

  // Stream controllers for different notification types
  final StreamController<NotificationData> _notificationController =
      StreamController<NotificationData>.broadcast();
  final StreamController<OrderNotification> _orderNotificationController =
      StreamController<OrderNotification>.broadcast();
  final StreamController<PromotionNotification> _promotionController =
      StreamController<PromotionNotification>.broadcast();

  // Getters for streams
  Stream<NotificationData> get notificationStream => _notificationController.stream;
  Stream<OrderNotification> get orderNotifications => _orderNotificationController.stream;
  Stream<PromotionNotification> get promotionNotifications => _promotionController.stream;

  PushNotificationService._internal();

  /// Initialize push notification service
  Future<void> initialize() async {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      await _initializeLocalNotifications();
      await _registerDeviceWithBackend();
      await _setupBackgroundListening();
      _isInitialized = true;
    }
  }

  /// Initialize device registration with backend
  Future<void> _registerDeviceWithBackend() async {
    try {
      // Request permission (iOS)
      if (Platform.isIOS) {
        await _requestIOSPermissions();
      }

      // Generate device token (can be device ID + timestamp)
      _deviceToken = await _generateDeviceToken();
      if (kDebugMode) print('Device Token: $_deviceToken');

      // Register token with backend
      if (_deviceToken != null) {
        await _registerPushSubscription(_deviceToken!);
      }

    } catch (e) {
      if (kDebugMode) print('Error registering device with backend: $e');
    }
  }

  /// Initialize local notifications for showing notifications when app is in foreground
  Future<void> _initializeLocalNotifications() async {
    _localNotifications = FlutterLocalNotificationsPlugin();

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications!.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Create notification channels for Android
    if (Platform.isAndroid) {
      await _createNotificationChannels();
    }
  }

  /// Create notification channels for different types of notifications
  Future<void> _createNotificationChannels() async {
    const orderChannel = AndroidNotificationChannel(
      'order_updates',
      'Mises à jour de commandes',
      description: 'Notifications pour les mises à jour de commandes',
      importance: Importance.high,
      sound: RawResourceAndroidNotificationSound('order_notification'),
    );

    const promotionChannel = AndroidNotificationChannel(
      'promotions',
      'Promotions et offres',
      description: 'Notifications pour les promotions et offres spéciales',
      importance: Importance.defaultImportance,
    );

    const generalChannel = AndroidNotificationChannel(
      'general',
      'Notifications générales',
      description: 'Notifications générales de l\'application',
      importance: Importance.defaultImportance,
    );

    await _localNotifications!
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(orderChannel);

    await _localNotifications!
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(promotionChannel);

    await _localNotifications!
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(generalChannel);
  }

  /// Setup background listening for backend notifications
  Future<void> _setupBackgroundListening() async {
    // Setup periodic check for notifications from backend
    Timer.periodic(const Duration(seconds: 30), (timer) async {
      if (_isInitialized) {
        await _checkForNewNotifications();
      }
    });
  }

  /// Request iOS permissions
  Future<void> _requestIOSPermissions() async {
    final status = await Permission.notification.request();
    if (kDebugMode) print('iOS permission status: $status');
  }

  /// Register push subscription with backend
  Future<void> _registerPushSubscription(String deviceToken) async {
    try {
      final apiClient = ApiClient();
      await apiClient.post(
        '/shared/mvp/notifications/register-subscription',
        data: {
          'subscription': {
            'endpoint': 'mobile://device/$deviceToken',
            'keys': {
              'p256dh': 'mobile-device-key',
              'auth': deviceToken,
            },
          },
          'deviceInfo': await _getDeviceInfo(),
        },
      );
      if (kDebugMode) print('Push subscription registered with backend');
    } catch (e) {
      if (kDebugMode) print('Error registering push subscription: $e');
    }
  }

  /// Get device information
  Future<Map<String, dynamic>> _getDeviceInfo() async {
    return {
      'platform': Platform.operatingSystem,
      'version': Platform.operatingSystemVersion,
      'isPhysicalDevice': true, // You can use device_info_plus for more details
    };
  }

  /// Check for new notifications from backend
  Future<void> _checkForNewNotifications() async {
    try {
      final apiClient = ApiClient();
      final response = await apiClient.get(
        '/shared/mvp/notifications/history',
        queryParameters: {'limit': 10, 'unread_only': true},
      );

      if (response.statusCode == 200) {
        final notifications = response.data['data']['notifications'] as List;
        for (final notificationData in notifications) {
          final notification = NotificationData.fromJson(notificationData);
          _handleForegroundNotification(notification);
        }
      }
    } catch (e) {
      if (kDebugMode) print('Error checking for notifications: $e');
    }
  }

  /// Handle foreground notifications (show local notification)
  void _handleForegroundNotification(NotificationData notificationData) {
    _notificationController.add(notificationData);

    // Show local notification for visual display
    _showLocalNotification(notificationData);

    // Route to specific streams based on type
    _routeNotificationByType(notificationData);
  }

  /// Show local notification
  Future<void> _showLocalNotification(NotificationData data) async {
    final channelId = _getChannelId(data.type);

    // ignore: unused_local_variable
    const androidDetails = AndroidNotificationDetails(
      'order_updates', // Will be replaced by channelId
      'Notifications EatFast',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
      enableVibration: true,
      playSound: true,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        channelId,
        'Notifications EatFast',
        importance: Importance.high,
        priority: Priority.high,
        showWhen: true,
        enableVibration: true,
        playSound: true,
      ),
      iOS: iosDetails,
    );

    await _localNotifications!.show(
      data.id?.hashCode ?? DateTime.now().millisecondsSinceEpoch,
      data.title,
      data.body,
      notificationDetails,
      payload: jsonEncode(data.toJson()),
    );
  }

  /// Get appropriate channel ID based on notification type
  String _getChannelId(NotificationType type) {
    switch (type) {
      case NotificationType.orderUpdate:
        return 'order_updates';
      case NotificationType.promotion:
        return 'promotions';
      case NotificationType.general:
      case NotificationType.driverLocation:
      case NotificationType.restaurantUpdate:
        return 'general';
    }
  }

  /// Route notifications to specific streams
  void _routeNotificationByType(NotificationData data) {
    switch (data.type) {
      case NotificationType.orderUpdate:
        if (data.orderId != null) {
          _orderNotificationController.add(OrderNotification.fromNotificationData(data));
        }
        break;
      case NotificationType.promotion:
        _promotionController.add(PromotionNotification.fromNotificationData(data));
        break;
      default:
        break;
    }
  }

  /// Handle notification tap
  // ignore: unused_element
  void _handleNotificationTap(NotificationData notificationData) {
    _notificationController.add(notificationData);
    _routeNotificationByType(notificationData);
  }

  /// Handle local notification tap
  void _onNotificationTapped(NotificationResponse response) {
    if (response.payload != null) {
      try {
        final data = NotificationData.fromJson(jsonDecode(response.payload!));
        _notificationController.add(data);
        _routeNotificationByType(data);
      } catch (e) {
        if (kDebugMode) print('Error parsing notification payload: $e');
      }
    }
  }

  /// Update notification preferences on backend
  Future<void> updateNotificationPreferences({
    required bool orderUpdates,
    required bool promotions,
    required bool generalNotifications,
    required bool driverUpdates,
  }) async {
    try {
      final apiClient = ApiClient();
      await apiClient.put(
        ApiConstants.notificationPreferences,
        data: {
          'orderUpdates': orderUpdates,
          'promotions': promotions,
          'generalNotifications': generalNotifications,
          'driverUpdates': driverUpdates,
        },
      );
    } catch (e) {
      if (kDebugMode) print('Error updating notification preferences: $e');
    }
  }

  /// Get notification history from backend
  Future<List<NotificationData>> getNotificationHistory({int limit = 50}) async {
    try {
      final apiClient = ApiClient();
      final response = await apiClient.get(
        ApiConstants.notificationHistory,
        queryParameters: {'limit': limit},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['notifications'] ?? [];
        return data.map((item) => NotificationData.fromJson(item)).toList();
      }
      return [];
    } catch (e) {
      if (kDebugMode) print('Error getting notification history: $e');
      return [];
    }
  }

  /// Mark notification as read
  Future<void> markAsRead(String notificationId) async {
    try {
      final apiClient = ApiClient();
      await apiClient.patch(
        ApiConstants.notificationMarkRead.replaceAll('{notificationId}', notificationId),
      );
    } catch (e) {
      if (kDebugMode) print('Error marking notification as read: $e');
    }
  }

  /// Clear notification badge
  Future<void> clearBadge() async {
    if (Platform.isIOS) {
      await _localNotifications?.cancelAll();
    }
  }

  /// Get current device token
  String? get deviceToken => _deviceToken;

  /// Generate device token
  Future<String> _generateDeviceToken() async {
    final deviceInfo = await _getDeviceInfo();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return 'device_${deviceInfo['platform']}_$timestamp';
  }

  /// Dispose resources
  void dispose() {
    _notificationController.close();
    _orderNotificationController.close();
    _promotionController.close();
  }
}

/// Notification types enum
enum NotificationType {
  orderUpdate,
  promotion,
  general,
  driverLocation,
  restaurantUpdate,
}

/// Base notification data model
class NotificationData {
  final String? id;
  final String title;
  final String body;
  final NotificationType type;
  final Map<String, dynamic>? data;
  final DateTime timestamp;
  final bool isRead;
  final String? orderId;
  final String? restaurantId;
  final String? driverId;

  NotificationData({
    this.id,
    required this.title,
    required this.body,
    required this.type,
    this.data,
    required this.timestamp,
    this.isRead = false,
    this.orderId,
    this.restaurantId,
    this.driverId,
  });

  factory NotificationData.fromBackendData(Map<String, dynamic> backendData) {
    return NotificationData(
      id: backendData['id']?.toString(),
      title: backendData['title'] ?? 'EatFast',
      body: backendData['message'] ?? backendData['body'] ?? '',
      type: _parseNotificationType(backendData['type']),
      data: backendData['data'] ?? {},
      timestamp: DateTime.tryParse(backendData['createdAt'] ?? '') ?? DateTime.now(),
      isRead: backendData['read'] ?? false,
      orderId: backendData['orderId'],
      restaurantId: backendData['restaurantId'],
      driverId: backendData['driverId'],
    );
  }

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      id: json['id'],
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      type: _parseNotificationType(json['type']),
      data: json['data'],
      timestamp: DateTime.parse(json['timestamp'] ?? DateTime.now().toIso8601String()),
      isRead: json['isRead'] ?? false,
      orderId: json['orderId'],
      restaurantId: json['restaurantId'],
      driverId: json['driverId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'type': type.toString().split('.').last,
      'data': data,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
      'orderId': orderId,
      'restaurantId': restaurantId,
      'driverId': driverId,
    };
  }

  static NotificationType _parseNotificationType(String? type) {
    switch (type) {
      case 'order_update':
        return NotificationType.orderUpdate;
      case 'promotion':
        return NotificationType.promotion;
      case 'driver_location':
        return NotificationType.driverLocation;
      case 'restaurant_update':
        return NotificationType.restaurantUpdate;
      default:
        return NotificationType.general;
    }
  }
}

/// Order-specific notification
class OrderNotification extends NotificationData {
  final String orderStatus;
  final String? estimatedDeliveryTime;

  OrderNotification({
    required super.id,
    required super.title,
    required super.body,
    required super.timestamp,
    required super.orderId,
    required this.orderStatus,
    this.estimatedDeliveryTime,
    super.data,
    super.isRead = false,
  }) : super(type: NotificationType.orderUpdate);

  factory OrderNotification.fromNotificationData(NotificationData data) {
    return OrderNotification(
      id: data.id,
      title: data.title,
      body: data.body,
      timestamp: data.timestamp,
      orderId: data.orderId!,
      orderStatus: data.data?['orderStatus'] ?? 'unknown',
      estimatedDeliveryTime: data.data?['estimatedDeliveryTime'],
      data: data.data,
      isRead: data.isRead,
    );
  }
}

/// Promotion-specific notification
class PromotionNotification extends NotificationData {
  final String? promoCode;
  final String? discountAmount;
  final DateTime? expiryDate;

  PromotionNotification({
    required super.id,
    required super.title,
    required super.body,
    required super.timestamp,
    this.promoCode,
    this.discountAmount,
    this.expiryDate,
    super.data,
    super.isRead = false,
  }) : super(type: NotificationType.promotion);

  factory PromotionNotification.fromNotificationData(NotificationData data) {
    return PromotionNotification(
      id: data.id,
      title: data.title,
      body: data.body,
      timestamp: data.timestamp,
      promoCode: data.data?['promoCode'],
      discountAmount: data.data?['discountAmount'],
      expiryDate: data.data?['expiryDate'] != null
          ? DateTime.parse(data.data!['expiryDate'])
          : null,
      data: data.data,
      isRead: data.isRead,
    );
  }
}