/// Native Crash Reporting Service for EatFast
/// Sends crash reports to Express.js backend (No Firebase)
library;

import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:eatfast_mobile/shared/services/api/api_client.dart';
import 'package:eatfast_mobile/shared/constants/api_constants.dart';

class CrashReportingService {
  static final CrashReportingService _instance =
      CrashReportingService._internal();
  factory CrashReportingService() => _instance;

  final ApiClient _apiClient = ApiClient();
  bool _isInitialized = false;
  Map<String, dynamic>? _deviceInfo;
  Map<String, dynamic>? _appInfo;

  CrashReportingService._internal();

  /// Initialize crash reporting
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      // Collect device and app info
      await _collectDeviceInfo();
      await _collectAppInfo();

      // Setup Flutter error handler
      FlutterError.onError = (FlutterErrorDetails details) {
        _handleFlutterError(details);
      };

      // Setup platform error handler
      PlatformDispatcher.instance.onError = (error, stack) {
        _handlePlatformError(error, stack);
        return true;
      };

      _isInitialized = true;
      if (kDebugMode) print('Crash reporting initialized');
    } catch (e) {
      if (kDebugMode) print('Error initializing crash reporting: $e');
    }
  }

  /// Collect device information
  Future<void> _collectDeviceInfo() async {
    try {
      final deviceInfo = DeviceInfoPlugin();

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        _deviceInfo = {
          'platform': 'android',
          'model': androidInfo.model,
          'manufacturer': androidInfo.manufacturer,
          'osVersion': androidInfo.version.release,
          'sdkVersion': androidInfo.version.sdkInt,
          'brand': androidInfo.brand,
          'device': androidInfo.device,
          'isPhysicalDevice': androidInfo.isPhysicalDevice,
        };
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        _deviceInfo = {
          'platform': 'ios',
          'model': iosInfo.model,
          'name': iosInfo.name,
          'osVersion': iosInfo.systemVersion,
          'isPhysicalDevice': iosInfo.isPhysicalDevice,
          'systemName': iosInfo.systemName,
        };
      }
    } catch (e) {
      if (kDebugMode) print('Error collecting device info: $e');
      _deviceInfo = {
        'platform': Platform.operatingSystem,
        'osVersion': Platform.operatingSystemVersion,
      };
    }
  }

  /// Collect app information
  Future<void> _collectAppInfo() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      _appInfo = {
        'appName': packageInfo.appName,
        'packageName': packageInfo.packageName,
        'version': packageInfo.version,
        'buildNumber': packageInfo.buildNumber,
      };
    } catch (e) {
      if (kDebugMode) print('Error collecting app info: $e');
      _appInfo = {'appName': 'EatFast', 'version': 'unknown'};
    }
  }

  /// Handle Flutter framework errors
  void _handleFlutterError(FlutterErrorDetails details) {
    // Log to console in debug mode
    if (kDebugMode) {
      FlutterError.presentError(details);
    }

    // Send to backend in production
    if (kReleaseMode) {
      _sendCrashReport(
        error: details.exception.toString(),
        stackTrace: details.stack?.toString() ?? '',
        errorType: 'FlutterError',
        isFatal: true,
        context: {
          'library': details.library ?? 'unknown',
          'informationCollector': details.informationCollector?.toString(),
        },
      );
    }
  }

  /// Handle platform/async errors
  void _handlePlatformError(Object error, StackTrace stack) {
    // Log to console in debug mode
    if (kDebugMode) {
      print('Platform Error: $error');
      print('Stack trace:\n$stack');
    }

    // Send to backend in production
    if (kReleaseMode) {
      _sendCrashReport(
        error: error.toString(),
        stackTrace: stack.toString(),
        errorType: 'PlatformError',
        isFatal: true,
      );
    }
  }

  /// Manually log error (non-fatal)
  Future<void> logError({
    required dynamic error,
    StackTrace? stackTrace,
    String? reason,
    Map<String, dynamic>? context,
    bool isFatal = false,
  }) async {
    // Log to console in debug mode
    if (kDebugMode) {
      print('Error: $error');
      if (stackTrace != null) print('Stack trace:\n$stackTrace');
      if (reason != null) print('Reason: $reason');
    }

    // Send to backend
    await _sendCrashReport(
      error: error.toString(),
      stackTrace: stackTrace?.toString() ?? '',
      errorType: 'LoggedError',
      isFatal: isFatal,
      reason: reason,
      context: context,
    );
  }

  /// Send crash report to Express.js backend
  Future<void> _sendCrashReport({
    required String error,
    required String stackTrace,
    required String errorType,
    required bool isFatal,
    String? reason,
    Map<String, dynamic>? context,
  }) async {
    try {
      final crashData = {
        'error': error,
        'stackTrace': stackTrace,
        'errorType': errorType,
        'isFatal': isFatal,
        'timestamp': DateTime.now().toIso8601String(),
        'deviceInfo': _deviceInfo,
        'appInfo': _appInfo,
        'reason': reason,
        'context': context,
      };

      // Send to backend (fire and forget)
      _apiClient
          .post(
            '${ApiConstants.baseUrl}/shared/mvp/crash-reports',
            data: crashData,
          )
          .then((_) {
            // Success - crash report sent
          })
          .catchError((e) {
            if (kDebugMode) print('Error sending crash report: $e');
          });
    } catch (e) {
      if (kDebugMode) print('Error preparing crash report: $e');
    }
  }

  /// Log message (for tracking app flow)
  Future<void> log(String message, {Map<String, dynamic>? data}) async {
    if (kDebugMode) {
      print('Log: $message');
      if (data != null) print('Data: $data');
    }

    // Optionally send important logs to backend
    if (kReleaseMode && data != null && data.containsKey('important')) {
      try {
        await _apiClient.post(
          '${ApiConstants.baseUrl}/shared/mvp/logs',
          data: {
            'message': message,
            'data': data,
            'timestamp': DateTime.now().toIso8601String(),
            'deviceInfo': _deviceInfo,
            'appInfo': _appInfo,
          },
        );
      } catch (e) {
        if (kDebugMode) print('Error sending log: $e');
      }
    }
  }

  /// Set user identifier for crash reports
  void setUserIdentifier(String userId, {String? email, String? name}) {
    _deviceInfo ??= {};
    _deviceInfo!['userId'] = userId;
    _deviceInfo!['userEmail'] = email;
    _deviceInfo!['userName'] = name;
  }

  /// Clear user identifier (on logout)
  void clearUserIdentifier() {
    _deviceInfo?.remove('userId');
    _deviceInfo?.remove('userEmail');
    _deviceInfo?.remove('userName');
  }

  /// Set custom key-value pair
  void setCustomKey(String key, dynamic value) {
    _deviceInfo ??= {};
    _deviceInfo!['custom_$key'] = value;
  }

  /// Record breadcrumb (user action trail)
  Future<void> recordBreadcrumb(
    String message, {
    Map<String, dynamic>? data,
  }) async {
    if (kDebugMode) print('Breadcrumb: $message');

    // In production, you might want to maintain a local queue of breadcrumbs
    // and send them with crash reports
  }

  /// Test crash reporting (development only)
  void testCrash() {
    if (kDebugMode) {
      throw Exception('Test crash from CrashReportingService');
    }
  }
}
