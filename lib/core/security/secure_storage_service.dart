import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../auth/models/app_user.dart';

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
  static const String _tokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userKey = 'user_data';
  static const String _biometricCredentialsKey = 'biometric_credentials';
  static const String _deviceFingerprintKey = 'device_fingerprint';

  /// Store JWT access token securely
  Future<void> storeToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  /// Retrieve JWT access token
  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  /// Store JWT refresh token securely
  Future<void> storeRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  /// Retrieve JWT refresh token
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  /// Store user data
  Future<void> storeUser(AppUser user) async {
    await _storage.write(key: _userKey, value: jsonEncode(user.toJson()));
  }

  /// Retrieve user data
  Future<AppUser?> getUser() async {
    final userJson = await _storage.read(key: _userKey);
    if (userJson != null) {
      try {
        final userMap = jsonDecode(userJson) as Map<String, dynamic>;
        return AppUser.fromJson(userMap);
      } catch (e) {
        // If user data is corrupted, remove it
        await _storage.delete(key: _userKey);
        return null;
      }
    }
    return null;
  }

  /// Store biometric authentication data
  Future<void> storeBiometricCredentials(Map<String, dynamic> data) async {
    await _storage.write(
      key: _biometricCredentialsKey,
      value: jsonEncode(data),
    );
  }

  /// Retrieve biometric authentication data
  Future<Map<String, dynamic>?> getBiometricCredentials() async {
    final dataJson = await _storage.read(key: _biometricCredentialsKey);
    if (dataJson != null) {
      try {
        return jsonDecode(dataJson) as Map<String, dynamic>;
      } catch (e) {
        await _storage.delete(key: _biometricCredentialsKey);
        return null;
      }
    }
    return null;
  }

  /// Store device fingerprint
  Future<void> storeDeviceFingerprint(String fingerprint) async {
    await _storage.write(key: _deviceFingerprintKey, value: fingerprint);
  }

  /// Retrieve device fingerprint
  Future<String?> getDeviceFingerprint() async {
    return await _storage.read(key: _deviceFingerprintKey);
  }

  /// Check if user has valid tokens
  Future<bool> hasValidTokens() async {
    final token = await getToken();
    final refreshToken = await getRefreshToken();
    return token != null && refreshToken != null;
  }

  /// Check if user data exists
  Future<bool> hasUserData() async {
    final user = await getUser();
    return user != null;
  }

  /// Clear all stored authentication data
  Future<void> clearAll() async {
    await Future.wait([
      _storage.delete(key: _tokenKey),
      _storage.delete(key: _refreshTokenKey),
      _storage.delete(key: _userKey),
      _storage.delete(key: _biometricCredentialsKey),
      _storage.delete(key: _deviceFingerprintKey),
    ]);
  }

  /// Clear only auth tokens (keep user data)
  Future<void> clearTokens() async {
    await Future.wait([
      _storage.delete(key: _tokenKey),
      _storage.delete(key: _refreshTokenKey),
    ]);
  }

  /// Check if biometric authentication is available and enabled
  Future<bool> isBiometricEnabled() async {
    final credentials = await getBiometricCredentials();
    return credentials != null && credentials['enabled'] == true;
  }

  /// Enable/disable biometric authentication
  Future<void> setBiometricEnabled(bool enabled) async {
    if (enabled) {
      final credentials = await getBiometricCredentials() ?? {};
      credentials['enabled'] = true;
      await storeBiometricCredentials(credentials);
    } else {
      await _storage.delete(key: _biometricCredentialsKey);
    }
  }

  /// Get all stored keys (for debugging)
  Future<Map<String, String>> getAllStoredData() async {
    return await _storage.readAll();
  }

  /// DEPRECATED: Do not store credentials - use token-based biometric auth instead
  /// This method is kept for migration purposes only
  @Deprecated('Use token-based biometric authentication instead')
  Future<void> storeUserCredentials({
    required String email,
    required String hashedPassword,
  }) async {
    // SECURITY: Do not store password hashes locally
    // Instead, use biometric to unlock stored auth tokens
    throw UnimplementedError(
      'Password storage is disabled for security. Use token-based biometric auth.',
    );
  }

  /// DEPRECATED: Do not retrieve stored credentials
  @Deprecated('Use token-based biometric authentication instead')
  Future<Map<String, dynamic>?> getUserCredentials() async {
    // Clean up any legacy stored credentials
    await _storage.delete(key: 'user_credentials');
    return null;
  }

  /// Check if biometric login is enabled
  Future<bool> isBiometricLoginEnabled() async {
    final enabled = await _storage.read(key: 'biometric_login_enabled');
    return enabled == 'true';
  }

  /// Set biometric login enabled status
  Future<void> setBiometricLoginEnabled(bool enabled) async {
    await _storage.write(
      key: 'biometric_login_enabled',
      value: enabled.toString(),
    );
  }
}

/// Provider for SecureStorageService
final secureStorageServiceProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService();
});