import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Comprehensive Firebase Monitoring Service
/// Handles Crashlytics, Performance Monitoring, and Analytics
class FirebaseMonitoringService {
  static final FirebaseMonitoringService _instance =
      FirebaseMonitoringService._internal();

  factory FirebaseMonitoringService() => _instance;

  FirebaseMonitoringService._internal();

  FirebaseCrashlytics? _crashlytics;
  FirebasePerformance? _performance;
  FirebaseAnalytics? _analytics;
  bool _isInitialized = false;

  FirebaseAnalytics? get analytics => _analytics;
  FirebaseCrashlytics? get crashlytics => _crashlytics;
  FirebasePerformance? get performance => _performance;

  /// Initialize all Firebase monitoring services
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      _crashlytics = FirebaseCrashlytics.instance;
      _performance = FirebasePerformance.instance;
      _analytics = FirebaseAnalytics.instance;

      // Configure Crashlytics
      if (kReleaseMode) {
        await _crashlytics!.setCrashlyticsCollectionEnabled(true);
      } else {
        // Disable in debug mode to avoid noise
        await _crashlytics!.setCrashlyticsCollectionEnabled(false);
      }

      // Pass all uncaught Flutter errors to Crashlytics
      FlutterError.onError = (FlutterErrorDetails details) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(details);
      };

      // Pass all uncaught asynchronous errors to Crashlytics
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };

      // Configure Performance Monitoring
      await _performance!.setPerformanceCollectionEnabled(kReleaseMode);

      // Configure Analytics
      await _analytics!.setAnalyticsCollectionEnabled(kReleaseMode);

      _isInitialized = true;
      debugPrint('[FirebaseMonitoring] All services initialized successfully');
    } catch (e, stackTrace) {
      debugPrint('[FirebaseMonitoring] Failed to initialize: $e');
      debugPrint('[FirebaseMonitoring] Stack trace: $stackTrace');
    }
  }

  // ==================== CRASHLYTICS METHODS ====================

  /// Log a non-fatal error
  Future<void> logError(
    dynamic exception,
    StackTrace? stackTrace, {
    String? reason,
    Map<String, dynamic>? additionalInfo,
    bool fatal = false,
  }) async {
    if (!_isInitialized) return;

    try {
      await _crashlytics?.recordError(
        exception,
        stackTrace,
        reason: reason,
        fatal: fatal,
        information: additionalInfo?.entries
            .map((e) => '${e.key}: ${e.value}')
            .toList() ??
            [],
      );

      debugPrint('[FirebaseMonitoring] Error logged: $exception');
    } catch (e) {
      debugPrint('[FirebaseMonitoring] Failed to log error: $e');
    }
  }

  /// Log a custom message to Crashlytics
  Future<void> log(String message) async {
    if (!_isInitialized) return;

    try {
      await _crashlytics?.log(message);
    } catch (e) {
      debugPrint('[FirebaseMonitoring] Failed to log message: $e');
    }
  }

  /// Set user identifier for crash reports
  Future<void> setUserIdentifier(String userId) async {
    if (!_isInitialized) return;

    try {
      await _crashlytics?.setUserIdentifier(userId);
      debugPrint('[FirebaseMonitoring] User identifier set: $userId');
    } catch (e) {
      debugPrint('[FirebaseMonitoring] Failed to set user identifier: $e');
    }
  }

  /// Set custom key-value pair for crash reports
  Future<void> setCustomKey(String key, dynamic value) async {
    if (!_isInitialized) return;

    try {
      await _crashlytics?.setCustomKey(key, value);
    } catch (e) {
      debugPrint('[FirebaseMonitoring] Failed to set custom key: $e');
    }
  }

  /// Test crash reporting (for development only)
  Future<void> testCrash() async {
    if (!_isInitialized) return;
    if (kReleaseMode) return; // Don't allow test crashes in production

    try {
      _crashlytics?.crash();
    } catch (e) {
      debugPrint('[FirebaseMonitoring] Test crash failed: $e');
    }
  }

  // ==================== PERFORMANCE METHODS ====================

  /// Start a custom trace for performance monitoring
  Future<Trace?> startTrace(String traceName) async {
    if (!_isInitialized || !kReleaseMode) return null;

    try {
      final trace = _performance!.newTrace(traceName);
      await trace.start();
      return trace;
    } catch (e) {
      debugPrint('[FirebaseMonitoring] Failed to start trace: $e');
      return null;
    }
  }

  /// Stop a custom trace
  Future<void> stopTrace(Trace? trace) async {
    if (!_isInitialized || trace == null) return;

    try {
      await trace.stop();
    } catch (e) {
      debugPrint('[FirebaseMonitoring] Failed to stop trace: $e');
    }
  }

  /// Monitor HTTP request performance
  Future<HttpMetric?> startHttpMetric(
      String url,
      HttpMethod method,
      ) async {
    if (!_isInitialized || !kReleaseMode) return null;

    try {
      final metric = _performance!.newHttpMetric(url, method);
      await metric.start();
      return metric;
    } catch (e) {
      debugPrint('[FirebaseMonitoring] Failed to start HTTP metric: $e');
      return null;
    }
  }

  /// Stop HTTP metric tracking
  Future<void> stopHttpMetric(
      HttpMetric? metric, {
        int? responseCode,
        int? requestPayloadSize,
        int? responsePayloadSize,
      }) async {
    if (!_isInitialized || metric == null) return;

    try {
      if (responseCode != null) {
        metric.httpResponseCode = responseCode;
      }
      if (requestPayloadSize != null) {
        metric.requestPayloadSize = requestPayloadSize;
      }
      if (responsePayloadSize != null) {
        metric.responsePayloadSize = responsePayloadSize;
      }
      await metric.stop();
    } catch (e) {
      debugPrint('[FirebaseMonitoring] Failed to stop HTTP metric: $e');
    }
  }

  // ==================== ANALYTICS METHODS ====================

  /// Log a custom analytics event
  Future<void> logEvent({
    required String name,
    Map<String, Object?>? parameters,
  }) async {
    if (!_isInitialized || !kReleaseMode) return;

    try {
      await _analytics?.logEvent(
        name: name,
        parameters: parameters?.cast<String, Object>(),
      );
    } catch (e) {
      debugPrint('[FirebaseMonitoring] Failed to log event: $e');
    }
  }

  /// Log screen view
  Future<void> logScreenView({
    required String screenName,
    String? screenClass,
  }) async {
    if (!_isInitialized || !kReleaseMode) return;

    try {
      await _analytics?.logScreenView(
        screenName: screenName,
        screenClass: screenClass,
      );
    } catch (e) {
      debugPrint('[FirebaseMonitoring] Failed to log screen view: $e');
    }
  }

  /// Set user properties for analytics
  Future<void> setUserProperty({
    required String name,
    required String? value,
  }) async {
    if (!_isInitialized || !kReleaseMode) return;

    try {
      await _analytics?.setUserProperty(
        name: name,
        value: value,
      );
    } catch (e) {
      debugPrint('[FirebaseMonitoring] Failed to set user property: $e');
    }
  }

  /// Log app open event
  Future<void> logAppOpen() async {
    await logEvent(name: 'app_open');
  }

  /// Log login event
  Future<void> logLogin(String method) async {
    await logEvent(
      name: 'login',
      parameters: {'method': method},
    );
  }

  /// Log sign up event
  Future<void> logSignUp(String method) async {
    await logEvent(
      name: 'sign_up',
      parameters: {'method': method},
    );
  }

  /// Log purchase event
  Future<void> logPurchase({
    required double value,
    required String currency,
    String? transactionId,
    Map<String, Object?>? items,
  }) async {
    await logEvent(
      name: 'purchase',
      parameters: {
        'value': value,
        'currency': currency,
        if (transactionId != null) 'transaction_id': transactionId,
        if (items != null) ...items,
      },
    );
  }

  /// Log add to cart event
  Future<void> logAddToCart({
    required String itemId,
    required String itemName,
    required double price,
    int quantity = 1,
  }) async {
    await logEvent(
      name: 'add_to_cart',
      parameters: {
        'item_id': itemId,
        'item_name': itemName,
        'price': price,
        'quantity': quantity,
      },
    );
  }

  /// Check if monitoring is enabled
  Future<bool> isCrashlyticsEnabled() async {
    if (!_isInitialized) return false;

    try {
      return _crashlytics!.isCrashlyticsCollectionEnabled;
    } catch (e) {
      debugPrint('[FirebaseMonitoring] Failed to check status: $e');
      return false;
    }
  }
}
