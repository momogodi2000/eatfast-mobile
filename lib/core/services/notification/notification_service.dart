/// Backend-Aligned Notification Service
/// Uses only services implemented in the Express.js backend:
/// - Email notifications (nodemailer)
/// - WhatsApp notifications
/// - Local notifications for in-app alerts
/// NO Firebase - backend doesn't use FCM

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../config/app_config.dart';
import '../api/api_client.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;

  final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();
  final ApiClient _apiClient = ApiClient();

  bool _isInitialized = false;

  NotificationService._internal();

  /// Initialize notification service (local notifications only)
  Future<bool> initialize() async {
    if (!AppConfig.enablePushNotifications) {
      debugPrint('Local notifications are disabled in config');
      return false;
    }

    try {
      // Request permissions
      final permissionGranted = await _requestPermissions();
      if (!permissionGranted) {
        debugPrint('Notification permissions not granted');
        return false;
      }

      // Initialize local notifications
      await _initializeLocalNotifications();

      _isInitialized = true;
      debugPrint('Notification service initialized successfully (local only)');
      return true;
    } catch (e) {
      debugPrint('Failed to initialize notification service: $e');
      return false;
    }
  }

  /// Request notification permissions
  Future<bool> _requestPermissions() async {
    try {
      final status = await Permission.notification.request();
      return status.isGranted;
    } catch (e) {
      debugPrint('Error requesting notification permissions: $e');
      return false;
    }
  }

  /// Initialize local notifications
  Future<void> _initializeLocalNotifications() async {
    const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

    const initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _handleLocalNotificationTap,
    );
  }

  /// Handle local notification tap
  void _handleLocalNotificationTap(NotificationResponse response) {
    final payload = response.payload;
    if (payload != null) {
      final data = _decodePayload(payload);
      _handleNotificationData(data);
    }
  }

  /// Handle notification data and routing
  void _handleNotificationData(Map<String, dynamic> data) {
    final type = data['type'] as String?;
    final orderId = data['orderId'] as String?;
    final restaurantId = data['restaurantId'] as String?;

    switch (type) {
      case 'order_update':
        if (orderId != null) {
          _navigateToOrderTracking(orderId);
        }
        break;
      case 'delivery_update':
        if (orderId != null) {
          _navigateToOrderTracking(orderId);
        }
        break;
      case 'promotion':
        if (restaurantId != null) {
          _navigateToRestaurant(restaurantId);
        }
        break;
      default:
        debugPrint('Unknown notification type: $type');
    }
  }

  /// Show local notification
  Future<void> _showLocalNotification({
    required int id,
    required String title,
    required String body,
    Map<String, dynamic>? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'eatfast_general',
      'EatFast General',
      channelDescription: 'General notifications from EatFast',
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

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      id,
      title,
      body,
      details,
      payload: payload != null ? _encodePayload(payload) : null,
    );
  }

  /// Request email notification from backend
  Future<void> requestEmailNotification({
    required String userEmail,
    required String type,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _apiClient.post(
        '/notifications/email',
        data: {
          'email': userEmail,
          'type': type,
          'data': data,
        },
      );
      debugPrint('Email notification requested from backend');
    } catch (e) {
      debugPrint('Failed to request email notification: $e');
    }
  }

  /// Request WhatsApp notification from backend (if user opted in)
  Future<void> requestWhatsAppNotification({
    required String phoneNumber,
    required String message,
    String? templateName,
  }) async {
    try {
      await _apiClient.post(
        '/notifications/whatsapp',
        data: {
          'phoneNumber': phoneNumber,
          'message': message,
          if (templateName != null) 'templateName': templateName,
        },
      );
      debugPrint('WhatsApp notification requested from backend');
    } catch (e) {
      debugPrint('Failed to request WhatsApp notification: $e');
    }
  }

  /// Show order update notification (local)
  Future<void> showOrderUpdateNotification({
    required String orderId,
    required String title,
    required String message,
    String? status,
  }) async {
    await _showLocalNotification(
      id: orderId.hashCode,
      title: title,
      body: message,
      payload: {
        'type': 'order_update',
        'orderId': orderId,
        'status': status,
      },
    );
  }

  /// Show delivery notification (local)
  Future<void> showDeliveryNotification({
    required String orderId,
    required String message,
  }) async {
    await _showLocalNotification(
      id: orderId.hashCode + 1000,
      title: 'Mise à jour livraison',
      body: message,
      payload: {
        'type': 'delivery_update',
        'orderId': orderId,
      },
    );
  }

  /// Show promotion notification (local)
  Future<void> showPromotionNotification({
    required String title,
    required String message,
    String? restaurantId,
  }) async {
    await _showLocalNotification(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      body: message,
      payload: {
        'type': 'promotion',
        'restaurantId': restaurantId,
      },
    );
  }

  /// Get notification preferences from backend
  Future<Map<String, bool>> getNotificationPreferences() async {
    try {
      final response = await _apiClient.get('/user/notification-preferences');
      return Map<String, bool>.from(response.data['preferences'] ?? {});
    } catch (e) {
      debugPrint('Failed to get notification preferences: $e');
      return _getDefaultPreferences();
    }
  }

  /// Update notification preferences on backend
  Future<void> updateNotificationPreferences(Map<String, bool> preferences) async {
    try {
      await _apiClient.put(
        '/user/notification-preferences',
        data: {'preferences': preferences},
      );
      debugPrint('Notification preferences updated on backend');
    } catch (e) {
      debugPrint('Failed to update notification preferences: $e');
    }
  }

  /// Clear all local notifications
  Future<void> clearAllNotifications() async {
    await _localNotifications.cancelAll();
  }

  /// Clear specific notification
  Future<void> clearNotification(int id) async {
    await _localNotifications.cancel(id);
  }

  /// Navigation helpers (to be implemented with router)
  void _navigateToOrderTracking(String orderId) {
    debugPrint('Navigate to order tracking: $orderId');
    // Implementation would use GoRouter to navigate
  }

  void _navigateToRestaurant(String restaurantId) {
    debugPrint('Navigate to restaurant: $restaurantId');
    // Implementation would use GoRouter to navigate
  }

  /// Payload encoding/decoding
  String _encodePayload(Map<String, dynamic> data) {
    return data.entries.map((e) => '${e.key}=${e.value}').join('&');
  }

  Map<String, dynamic> _decodePayload(String payload) {
    final data = <String, dynamic>{};
    for (final pair in payload.split('&')) {
      final parts = pair.split('=');
      if (parts.length == 2) {
        data[parts[0]] = parts[1];
      }
    }
    return data;
  }

  /// Default notification preferences
  Map<String, bool> _getDefaultPreferences() {
    return {
      'email_notifications': true,
      'whatsapp_notifications': false, // Opt-in only
      'order_updates': true,
      'delivery_updates': true,
      'promotions': true,
    };
  }

  /// Getters
  bool get isInitialized => _isInitialized;
}