import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:logging/logging.dart';

/// Comprehensive cache manager for offline functionality
class CacheManager {
  static CacheManager? _instance;
  static CacheManager get instance => _instance ??= CacheManager._();
  
  CacheManager._();

  final Logger _logger = Logger('CacheManager');
  SharedPreferences? _prefs;

  /// Initialize cache manager
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    await _cleanExpiredCache();
    _logger.info('Cache manager initialized');
  }

  /// Cache data with TTL (Time To Live)
  Future<void> cacheWithTTL({
    required String key,
    required dynamic data,
    Duration ttl = const Duration(hours: 24),
  }) async {
    try {
      final cacheItem = CacheItem(
        data: data,
        timestamp: DateTime.now(),
        ttl: ttl,
      );

      await _prefs?.setString(key, jsonEncode(cacheItem.toJson()));
      _logger.info('Cached data for key: $key with TTL: ${ttl.inMinutes}min');
    } catch (e) {
      _logger.severe('Failed to cache data for key: $key', e);
    }
  }

  /// Get cached data
  Future<T?> getCached<T>(String key, T Function(dynamic) fromJson) async {
    try {
      final cachedString = _prefs?.getString(key);
      if (cachedString == null) return null;

      final cacheItem = CacheItem.fromJson(jsonDecode(cachedString));
      
      // Check if cache has expired
      if (cacheItem.isExpired) {
        await _prefs?.remove(key);
        return null;
      }

      return fromJson(cacheItem.data);
    } catch (e) {
      _logger.warning('Failed to get cached data for key: $key', e);
      return null;
    }
  }

  /// Cache restaurants data
  Future<void> cacheRestaurants(List<dynamic> restaurants) async {
    await cacheWithTTL(
      key: 'restaurants',
      data: restaurants,
      ttl: const Duration(hours: 2),
    );
  }

  /// Get cached restaurants
  Future<List<dynamic>?> getCachedRestaurants() async {
    return await getCached<List<dynamic>>('restaurants', (data) => data as List);
  }

  /// Cache restaurant menu
  Future<void> cacheRestaurantMenu(String restaurantId, List<dynamic> menu) async {
    await cacheWithTTL(
      key: 'menu_$restaurantId',
      data: menu,
      ttl: const Duration(hours: 6),
    );
  }

  /// Get cached restaurant menu
  Future<List<dynamic>?> getCachedMenu(String restaurantId) async {
    return await getCached<List<dynamic>>('menu_$restaurantId', (data) => data as List);
  }

  /// Cache user orders
  Future<void> cacheUserOrders(List<dynamic> orders) async {
    await cacheWithTTL(
      key: 'user_orders',
      data: orders,
      ttl: const Duration(minutes: 30),
    );
  }

  /// Get cached user orders
  Future<List<dynamic>?> getCachedUserOrders() async {
    return await getCached<List<dynamic>>('user_orders', (data) => data as List);
  }

  /// Cache user profile
  Future<void> cacheUserProfile(Map<String, dynamic> profile) async {
    await cacheWithTTL(
      key: 'user_profile',
      data: profile,
      ttl: const Duration(hours: 24),
    );
  }

  /// Get cached user profile
  Future<Map<String, dynamic>?> getCachedUserProfile() async {
    return await getCached<Map<String, dynamic>>('user_profile', (data) => data as Map<String, dynamic>);
  }

  /// Cache search results
  Future<void> cacheSearchResults(String query, List<dynamic> results) async {
    final key = 'search_${query.toLowerCase().replaceAll(' ', '_')}';
    await cacheWithTTL(
      key: key,
      data: results,
      ttl: const Duration(minutes: 15),
    );
  }

  /// Get cached search results
  Future<List<dynamic>?> getCachedSearchResults(String query) async {
    final key = 'search_${query.toLowerCase().replaceAll(' ', '_')}';
    return await getCached<List<dynamic>>(key, (data) => data as List);
  }

  /// Cache images locally
  Future<String?> cacheImage(String imageUrl) async {
    try {
      final uri = Uri.parse(imageUrl);
      final fileName = uri.pathSegments.last;
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/images/$fileName';
      
      final file = File(filePath);
      if (await file.exists()) {
        return filePath;
      }

      final httpClient = HttpClient();
      final request = await httpClient.getUrl(uri);
      final response = await request.close();
      
      await file.parent.create(recursive: true);
      await response.pipe(file.openWrite());
      
      httpClient.close();
      
      _logger.info('Cached image: $fileName');
      return filePath;
    } catch (e) {
      _logger.warning('Failed to cache image: $imageUrl', e);
      return null;
    }
  }

  /// Get cache size
  Future<double> getCacheSize() async {
    try {
      final directory = await getTemporaryDirectory();
      final cacheDir = Directory('${directory.path}/cache');
      
      if (!await cacheDir.exists()) return 0.0;

      double size = 0;
      await for (final entity in cacheDir.list(recursive: true)) {
        if (entity is File) {
          size += await entity.length();
        }
      }
      
      return size / (1024 * 1024); // Return size in MB
    } catch (e) {
      _logger.warning('Failed to calculate cache size', e);
      return 0.0;
    }
  }

  /// Clear all cache
  Future<void> clearAllCache() async {
    try {
      await _prefs?.clear();
      
      final directory = await getTemporaryDirectory();
      final cacheDir = Directory('${directory.path}/cache');
      
      if (await cacheDir.exists()) {
        await cacheDir.delete(recursive: true);
      }
      
      _logger.info('All cache cleared');
    } catch (e) {
      _logger.severe('Failed to clear cache', e);
    }
  }

  /// Clear expired cache
  Future<void> _cleanExpiredCache() async {
    try {
      if (_prefs == null) return;

      final keys = _prefs!.getKeys().where((key) => key.startsWith('cache_'));
      
      for (final key in keys) {
        final cachedString = _prefs!.getString(key);
        if (cachedString != null) {
          try {
            final cacheItem = CacheItem.fromJson(jsonDecode(cachedString));
            if (cacheItem.isExpired) {
              await _prefs!.remove(key);
            }
          } catch (e) {
            // Remove malformed cache items
            await _prefs!.remove(key);
          }
        }
      }
      
      _logger.info('Expired cache cleaned');
    } catch (e) {
      _logger.warning('Failed to clean expired cache', e);
    }
  }

  /// Invalidate cache by pattern
  Future<void> invalidatePattern(String pattern) async {
    try {
      if (_prefs == null) return;

      final keys = _prefs!.getKeys().where((key) => key.contains(pattern));
      
      for (final key in keys) {
        await _prefs!.remove(key);
      }
      
      _logger.info('Invalidated cache pattern: $pattern');
    } catch (e) {
      _logger.warning('Failed to invalidate cache pattern: $pattern', e);
    }
  }
}

/// Cache item wrapper with metadata
class CacheItem {
  final dynamic data;
  final DateTime timestamp;
  final Duration ttl;

  CacheItem({
    required this.data,
    required this.timestamp,
    required this.ttl,
  });

  bool get isExpired => DateTime.now().isAfter(timestamp.add(ttl));

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'timestamp': timestamp.toIso8601String(),
      'ttl': ttl.inMilliseconds,
    };
  }

  factory CacheItem.fromJson(Map<String, dynamic> json) {
    return CacheItem(
      data: json['data'],
      timestamp: DateTime.parse(json['timestamp']),
      ttl: Duration(milliseconds: json['ttl']),
    );
  }
}

/// Offline queue for actions that need to be synced when online
class OfflineQueue {
  static OfflineQueue? _instance;
  static OfflineQueue get instance => _instance ??= OfflineQueue._();
  
  OfflineQueue._();

  final Logger _logger = Logger('OfflineQueue');
  final List<QueuedAction> _queue = [];

  /// Add action to queue
  Future<void> queueAction(QueuedAction action) async {
    _queue.add(action);
    await _persistQueue();
    _logger.info('Queued action: ${action.type}');
  }

  /// Process all queued actions
  Future<void> processQueue() async {
    if (_queue.isEmpty) return;

    _logger.info('Processing ${_queue.length} queued actions');
    
    final actionsToProcess = List<QueuedAction>.from(_queue);
    _queue.clear();
    
    for (final action in actionsToProcess) {
      try {
        await action.execute();
        _logger.info('Processed action: ${action.type}');
      } catch (e) {
        _logger.warning('Failed to process action: ${action.type}', e);
        // Re-queue failed action
        _queue.add(action);
      }
    }
    
    await _persistQueue();
  }

  /// Persist queue to storage
  Future<void> _persistQueue() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final queueData = _queue.map((action) => action.toJson()).toList();
      await prefs.setString('offline_queue', jsonEncode(queueData));
    } catch (e) {
      _logger.warning('Failed to persist queue', e);
    }
  }

  /// Load queue from storage
  Future<void> loadQueue() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final queueString = prefs.getString('offline_queue');
      if (queueString != null) {
        final queueData = jsonDecode(queueString) as List;
        _queue.clear();
        _queue.addAll(queueData.map((data) => QueuedAction.fromJson(data)));
      }
    } catch (e) {
      _logger.warning('Failed to load queue', e);
    }
  }

  int get queueLength => _queue.length;
  bool get hasQueuedActions => _queue.isNotEmpty;
}

/// Queued action for offline processing
class QueuedAction {
  final String type;
  final Map<String, dynamic> data;
  final DateTime timestamp;

  QueuedAction({
    required this.type,
    required this.data,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Future<void> execute() async {
    // Implementation depends on action type
    switch (type) {
      case 'toggle_favorite':
        // Execute favorite toggle action
        break;
      case 'update_profile':
        // Execute profile update action
        break;
      case 'submit_review':
        // Execute review submission
        break;
      default:
        throw UnimplementedError('Action type not implemented: $type');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'data': data,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory QueuedAction.fromJson(Map<String, dynamic> json) {
    return QueuedAction(
      type: json['type'],
      data: json['data'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}