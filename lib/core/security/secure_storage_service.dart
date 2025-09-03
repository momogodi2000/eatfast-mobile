import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Secure storage service for sensitive data
/// Handles JWT tokens, user credentials, and other sensitive information
class SecureStorageService {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_PKCS1Padding,
      storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  // Keys for secure storage
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userCredentialsKey = 'user_credentials';
  static const String _biometricCredentialsKey = 'biometric_credentials';
  static const String _deviceFingerprintKey = 'device_fingerprint';

  /// Store JWT access token securely
  static Future<void> storeAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  /// Retrieve JWT access token
  static Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  /// Store JWT refresh token securely
  static Future<void> storeRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  /// Retrieve JWT refresh token
  static Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  /// Store user credentials for biometric login
  static Future<void> storeUserCredentials({
    required String email,
    required String hashedPassword,
  }) async {
    final credentials = {
      'email': email,
      'hashedPassword': hashedPassword,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
    
    await _storage.write(
      key: _userCredentialsKey,
      value: jsonEncode(credentials),
    );
  }

  /// Retrieve user credentials for biometric login
  static Future<Map<String, dynamic>?> getUserCredentials() async {
    final credentialsJson = await _storage.read(key: _userCredentialsKey);
    if (credentialsJson != null) {
      return jsonDecode(credentialsJson);
    }
    return null;
  }

  /// Store biometric authentication data
  static Future<void> storeBiometricCredentials(Map<String, dynamic> data) async {
    await _storage.write(
      key: _biometricCredentialsKey,
      value: jsonEncode(data),
    );
  }

  /// Retrieve biometric authentication data
  static Future<Map<String, dynamic>?> getBiometricCredentials() async {
    final dataJson = await _storage.read(key: _biometricCredentialsKey);
    if (dataJson != null) {
      return jsonDecode(dataJson);
    }
    return null;
  }

  /// Store device fingerprint
  static Future<void> storeDeviceFingerprint(String fingerprint) async {
    await _storage.write(key: _deviceFingerprintKey, value: fingerprint);
  }

  /// Retrieve device fingerprint
  static Future<String?> getDeviceFingerprint() async {
    return await _storage.read(key: _deviceFingerprintKey);
  }

  /// Check if user has biometric login enabled
  static Future<bool> isBiometricLoginEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('biometric_login_enabled') ?? false;
  }

  /// Enable/disable biometric login
  static Future<void> setBiometricLoginEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('biometric_login_enabled', enabled);
  }

  /// Check if remember me is enabled
  static Future<bool> isRememberMeEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('remember_me_enabled') ?? false;
  }

  /// Enable/disable remember me
  static Future<void> setRememberMeEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('remember_me_enabled', enabled);
  }

  /// Clear all stored tokens and credentials
  static Future<void> clearAll() async {
    await _storage.deleteAll();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('biometric_login_enabled');
    await prefs.remove('remember_me_enabled');
  }

  /// Clear only authentication tokens (for logout)
  static Future<void> clearTokens() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }

  /// Check if tokens exist
  static Future<bool> hasValidTokens() async {
    final accessToken = await getAccessToken();
    final refreshToken = await getRefreshToken();
    return accessToken != null && refreshToken != null;
  }

  /// Get last login attempt timestamp
  static Future<int?> getLastLoginAttempt() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('last_login_attempt');
  }

  /// Store login attempt timestamp
  static Future<void> storeLoginAttempt() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(
      'last_login_attempt',
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  /// Get failed login attempts count
  static Future<int> getFailedLoginAttempts() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('failed_login_attempts') ?? 0;
  }

  /// Increment failed login attempts
  static Future<void> incrementFailedLoginAttempts() async {
    final prefs = await SharedPreferences.getInstance();
    final current = await getFailedLoginAttempts();
    await prefs.setInt('failed_login_attempts', current + 1);
  }

  /// Reset failed login attempts
  static Future<void> resetFailedLoginAttempts() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('failed_login_attempts');
  }

  /// Check if account is locked due to failed attempts
  static Future<bool> isAccountLocked() async {
    final failedAttempts = await getFailedLoginAttempts();
    final lastAttempt = await getLastLoginAttempt();
    
    if (failedAttempts >= 5 && lastAttempt != null) {
      final lockDuration = Duration(minutes: 15);
      final unlockTime = DateTime.fromMillisecondsSinceEpoch(lastAttempt)
          .add(lockDuration);
      
      return DateTime.now().isBefore(unlockTime);
    }
    
    return false;
  }

  /// Get remaining lock time
  static Future<Duration?> getRemainingLockTime() async {
    if (await isAccountLocked()) {
      final lastAttempt = await getLastLoginAttempt();
      if (lastAttempt != null) {
        final lockDuration = Duration(minutes: 15);
        final unlockTime = DateTime.fromMillisecondsSinceEpoch(lastAttempt)
            .add(lockDuration);
        
        return unlockTime.difference(DateTime.now());
      }
    }
    return null;
  }
}
