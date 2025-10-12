/// Offline Storage Service for EatFast
/// Manages offline data persistence and synchronization with backend
library;

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

class OfflineStorageService {
  static final OfflineStorageService _instance = OfflineStorageService._internal();
  factory OfflineStorageService() => _instance;

  late Box _offlineBox;
  late Box _pendingActionsBox;
  bool _isInitialized = false;
  bool _isOnline = true;

  final StreamController<bool> _connectionStreamController =
      StreamController<bool>.broadcast();

  Stream<bool> get connectionStream => _connectionStreamController.stream;
  bool get isOnline => _isOnline;

  OfflineStorageService._internal();

  /// Initialize offline storage
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      // Initialize Hive
      await Hive.initFlutter();

      // Open boxes
      _offlineBox = await Hive.openBox('offline_data');
      _pendingActionsBox = await Hive.openBox('pending_actions');

      // Monitor connectivity
      _monitorConnectivity();

      _isInitialized = true;
      if (kDebugMode) print('Offline storage initialized');
    } catch (e) {
      if (kDebugMode) print('Error initializing offline storage: $e');
    }
  }

  /// Monitor network connectivity
  void _monitorConnectivity() {
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
      final wasOnline = _isOnline;
      _isOnline = !results.contains(ConnectivityResult.none);
      _connectionStreamController.add(_isOnline);

      if (kDebugMode) print('Connection status: ${_isOnline ? "Online" : "Offline"}');

      // Sync pending actions when coming back online
      if (!wasOnline && _isOnline) {
        _syncPendingActions();
      }
    });

    // Check initial connectivity
    _checkInitialConnectivity();
  }

  Future<void> _checkInitialConnectivity() async {
    final results = await Connectivity().checkConnectivity();
    _isOnline = !results.contains(ConnectivityResult.none);
    _connectionStreamController.add(_isOnline);
  }

  /// Save data for offline access
  Future<void> saveOfflineData(String key, dynamic data) async {
    try {
      await _offlineBox.put(key, data);
      if (kDebugMode) print('Saved offline data: $key');
    } catch (e) {
      if (kDebugMode) print('Error saving offline data: $e');
    }
  }

  /// Get offline data
  dynamic getOfflineData(String key, {dynamic defaultValue}) {
    try {
      return _offlineBox.get(key, defaultValue: defaultValue);
    } catch (e) {
      if (kDebugMode) print('Error getting offline data: $e');
      return defaultValue;
    }
  }

  /// Delete offline data
  Future<void> deleteOfflineData(String key) async {
    try {
      await _offlineBox.delete(key);
    } catch (e) {
      if (kDebugMode) print('Error deleting offline data: $e');
    }
  }

  /// Clear all offline data
  Future<void> clearOfflineData() async {
    try {
      await _offlineBox.clear();
    } catch (e) {
      if (kDebugMode) print('Error clearing offline data: $e');
    }
  }

  /// Add pending action to sync when online
  Future<void> addPendingAction(PendingAction action) async {
    try {
      final actions = getPendingActions();
      actions.add(action.toJson());
      await _pendingActionsBox.put('actions', actions);
      if (kDebugMode) print('Added pending action: ${action.type}');

      // Try to sync immediately if online
      if (_isOnline) {
        _syncPendingActions();
      }
    } catch (e) {
      if (kDebugMode) print('Error adding pending action: $e');
    }
  }

  /// Get all pending actions
  List<Map<String, dynamic>> getPendingActions() {
    try {
      final data = _pendingActionsBox.get('actions', defaultValue: <dynamic>[]);
      return List<Map<String, dynamic>>.from(
        data.map((item) => Map<String, dynamic>.from(item)),
      );
    } catch (e) {
      if (kDebugMode) print('Error getting pending actions: $e');
      return [];
    }
  }

  /// Sync pending actions with backend
  Future<void> _syncPendingActions() async {
    if (!_isOnline) return;

    try {
      final actions = getPendingActions();
      if (actions.isEmpty) return;

      if (kDebugMode) print('Syncing ${actions.length} pending actions...');

      // Process each action
      final failedActions = <Map<String, dynamic>>[];
      for (final actionData in actions) {
        final action = PendingAction.fromJson(actionData);
        final success = await _processPendingAction(action);

        if (!success) {
          failedActions.add(actionData);
        }
      }

      // Keep only failed actions
      await _pendingActionsBox.put('actions', failedActions);

      if (kDebugMode) {
        print('Sync complete. ${failedActions.length} actions failed.');
      }
    } catch (e) {
      if (kDebugMode) print('Error syncing pending actions: $e');
    }
  }

  /// Process a single pending action
  Future<bool> _processPendingAction(PendingAction action) async {
    try {
      // This would call the appropriate service based on action type
      // For now, we'll just log it
      if (kDebugMode) print('Processing action: ${action.type}');

      // TODO: Implement actual processing based on action.type
      // Example:
      // switch (action.type) {
      //   case 'ADD_TO_CART':
      //     await CartService().addItem(action.data);
      //     break;
      //   case 'UPDATE_PROFILE':
      //     await ProfileService().update(action.data);
      //     break;
      // }

      return true;
    } catch (e) {
      if (kDebugMode) print('Error processing action ${action.type}: $e');
      return false;
    }
  }

  /// Save cart for offline access
  Future<void> saveOfflineCart(Map<String, dynamic> cart) async {
    await saveOfflineData('offline_cart', cart);
  }

  /// Get offline cart
  Map<String, dynamic>? getOfflineCart() {
    final data = getOfflineData('offline_cart');
    if (data != null) {
      return Map<String, dynamic>.from(data);
    }
    return null;
  }

  /// Cache restaurant data for offline browsing
  Future<void> cacheRestaurantData(List<Map<String, dynamic>> restaurants) async {
    await saveOfflineData('cached_restaurants', restaurants);
    await saveOfflineData('cache_timestamp', DateTime.now().toIso8601String());
  }

  /// Get cached restaurants
  List<Map<String, dynamic>>? getCachedRestaurants() {
    final data = getOfflineData('cached_restaurants');
    if (data != null) {
      // Check cache age (24 hours)
      final timestamp = getOfflineData('cache_timestamp');
      if (timestamp != null) {
        final cacheTime = DateTime.parse(timestamp);
        if (DateTime.now().difference(cacheTime).inHours < 24) {
          return List<Map<String, dynamic>>.from(data);
        }
      }
    }
    return null;
  }

  /// Dispose resources
  void dispose() {
    _connectionStreamController.close();
  }
}

/// Pending Action Model
class PendingAction {
  final String id;
  final String type;
  final Map<String, dynamic> data;
  final DateTime timestamp;

  PendingAction({
    required this.id,
    required this.type,
    required this.data,
    required this.timestamp,
  });

  factory PendingAction.fromJson(Map<String, dynamic> json) {
    return PendingAction(
      id: json['id'] ?? '',
      type: json['type'] ?? '',
      data: Map<String, dynamic>.from(json['data'] ?? {}),
      timestamp: DateTime.parse(json['timestamp'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'data': data,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
