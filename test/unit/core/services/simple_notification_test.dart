import 'package:flutter_test/flutter_test.dart';

// Simple notification models for testing
class NotificationMessage {
  final String id;
  final String title;
  final String body;
  final Map<String, dynamic>? data;
  final DateTime timestamp;

  const NotificationMessage({
    required this.id,
    required this.title,
    required this.body,
    this.data,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
    'data': data,
    'timestamp': timestamp.toIso8601String(),
  };

  factory NotificationMessage.fromJson(Map<String, dynamic> json) {
    return NotificationMessage(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      data: json['data'] as Map<String, dynamic>?,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
}

class SimpleNotificationService {
  final List<NotificationMessage> _notifications = [];
  bool _isInitialized = false;

  Future<void> initialize() async {
    _isInitialized = true;
  }

  bool get isInitialized => _isInitialized;

  Future<void> showNotification(NotificationMessage notification) async {
    if (!_isInitialized) {
      throw StateError('Service not initialized');
    }
    _notifications.add(notification);
  }

  List<NotificationMessage> get notifications => List.unmodifiable(_notifications);

  Future<void> clearNotifications() async {
    _notifications.clear();
  }

  Future<void> removeNotification(String id) async {
    _notifications.removeWhere((notification) => notification.id == id);
  }

  int get notificationCount => _notifications.length;
}

void main() {
  group('Simple Notification Service Tests', () {
    late SimpleNotificationService notificationService;

    setUp(() {
      notificationService = SimpleNotificationService();
    });

    test('should initialize service correctly', () async {
      // Act
      await notificationService.initialize();

      // Assert
      expect(notificationService.isInitialized, isTrue);
    });

    test('should throw error when showing notification before initialization', () async {
      // Arrange
      final notification = NotificationMessage(
        id: '1',
        title: 'Test',
        body: 'Test body',
        timestamp: DateTime.now(),
      );

      // Act & Assert
      expect(
        () => notificationService.showNotification(notification),
        throwsStateError,
      );
    });

    test('should show notification after initialization', () async {
      // Arrange
      await notificationService.initialize();
      final notification = NotificationMessage(
        id: '1',
        title: 'Test Notification',
        body: 'This is a test notification',
        timestamp: DateTime.now(),
      );

      // Act
      await notificationService.showNotification(notification);

      // Assert
      expect(notificationService.notificationCount, equals(1));
      expect(notificationService.notifications.first.title, equals('Test Notification'));
      expect(notificationService.notifications.first.body, equals('This is a test notification'));
    });

    test('should handle multiple notifications', () async {
      // Arrange
      await notificationService.initialize();
      final notifications = [
        NotificationMessage(
          id: '1',
          title: 'First',
          body: 'First notification',
          timestamp: DateTime.now(),
        ),
        NotificationMessage(
          id: '2',
          title: 'Second',
          body: 'Second notification',
          timestamp: DateTime.now(),
        ),
        NotificationMessage(
          id: '3',
          title: 'Third',
          body: 'Third notification',
          timestamp: DateTime.now(),
        ),
      ];

      // Act
      for (final notification in notifications) {
        await notificationService.showNotification(notification);
      }

      // Assert
      expect(notificationService.notificationCount, equals(3));
      expect(notificationService.notifications[0].title, equals('First'));
      expect(notificationService.notifications[1].title, equals('Second'));
      expect(notificationService.notifications[2].title, equals('Third'));
    });

    test('should clear all notifications', () async {
      // Arrange
      await notificationService.initialize();
      final notification = NotificationMessage(
        id: '1',
        title: 'Test',
        body: 'Test body',
        timestamp: DateTime.now(),
      );
      await notificationService.showNotification(notification);

      // Act
      await notificationService.clearNotifications();

      // Assert
      expect(notificationService.notificationCount, equals(0));
      expect(notificationService.notifications, isEmpty);
    });

    test('should remove specific notification', () async {
      // Arrange
      await notificationService.initialize();
      final notifications = [
        NotificationMessage(
          id: '1',
          title: 'First',
          body: 'First notification',
          timestamp: DateTime.now(),
        ),
        NotificationMessage(
          id: '2',
          title: 'Second',
          body: 'Second notification',
          timestamp: DateTime.now(),
        ),
      ];

      for (final notification in notifications) {
        await notificationService.showNotification(notification);
      }

      // Act
      await notificationService.removeNotification('1');

      // Assert
      expect(notificationService.notificationCount, equals(1));
      expect(notificationService.notifications.first.id, equals('2'));
      expect(notificationService.notifications.first.title, equals('Second'));
    });

    test('should handle notification with data', () async {
      // Arrange
      await notificationService.initialize();
      final data = {
        'orderId': '12345',
        'type': 'order_update',
        'priority': 'high',
      };
      final notification = NotificationMessage(
        id: '1',
        title: 'Order Update',
        body: 'Your order is ready for pickup',
        data: data,
        timestamp: DateTime.now(),
      );

      // Act
      await notificationService.showNotification(notification);

      // Assert
      expect(notificationService.notifications.first.data, equals(data));
      expect(notificationService.notifications.first.data!['orderId'], equals('12345'));
      expect(notificationService.notifications.first.data!['type'], equals('order_update'));
      expect(notificationService.notifications.first.data!['priority'], equals('high'));
    });

    group('NotificationMessage', () {
      test('should serialize to JSON correctly', () {
        // Arrange
        final timestamp = DateTime.now();
        final data = {'key': 'value', 'number': 42};
        final notification = NotificationMessage(
          id: 'test-id',
          title: 'Test Title',
          body: 'Test Body',
          data: data,
          timestamp: timestamp,
        );

        // Act
        final json = notification.toJson();

        // Assert
        expect(json['id'], equals('test-id'));
        expect(json['title'], equals('Test Title'));
        expect(json['body'], equals('Test Body'));
        expect(json['data'], equals(data));
        expect(json['timestamp'], equals(timestamp.toIso8601String()));
      });

      test('should deserialize from JSON correctly', () {
        // Arrange
        final timestamp = DateTime.now();
        final data = {'key': 'value', 'number': 42};
        final json = {
          'id': 'test-id',
          'title': 'Test Title',
          'body': 'Test Body',
          'data': data,
          'timestamp': timestamp.toIso8601String(),
        };

        // Act
        final notification = NotificationMessage.fromJson(json);

        // Assert
        expect(notification.id, equals('test-id'));
        expect(notification.title, equals('Test Title'));
        expect(notification.body, equals('Test Body'));
        expect(notification.data, equals(data));
        expect(notification.timestamp, equals(timestamp));
      });

      test('should handle notification without data', () {
        // Arrange
        final timestamp = DateTime.now();
        final notification = NotificationMessage(
          id: 'test-id',
          title: 'Test Title',
          body: 'Test Body',
          timestamp: timestamp,
        );

        // Act
        final json = notification.toJson();

        // Assert
        expect(json['data'], isNull);
        expect(notification.data, isNull);
      });
    });
  });
}
