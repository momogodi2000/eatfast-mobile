import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Secure Storage Service - Wrapper around FlutterSecureStorage
/// Provides type-safe key-value storage for sensitive data
class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService([FlutterSecureStorage? storage])
    : _storage = storage ?? const FlutterSecureStorage();

  // Storage Keys
  static const String _authTokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userDataKey = 'user_data';
  static const String _guestSessionKey = 'guest_session_id';
  static const String _biometricEnabledKey = 'biometric_enabled';
  static const String _rememberMeKey = 'remember_me';
  static const String _savedEmailKey = 'saved_email';
  static const String _biometricCredentialsKey = 'biometric_credentials';
  static const String _deviceFingerprintKey = 'device_fingerprint';

  // ==================== Auth Token Management ====================

  /// Save authentication token
  Future<void> saveAuthToken(String token) async {
    await _storage.write(key: _authTokenKey, value: token);
  }

  /// Get authentication token
  Future<String?> getAuthToken() async {
    return await _storage.read(key: _authTokenKey);
  }

  /// Delete authentication token
  Future<void> deleteAuthToken() async {
    await _storage.delete(key: _authTokenKey);
  }

  // ==================== Refresh Token Management ====================

  /// Save refresh token
  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  /// Get refresh token
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  /// Delete refresh token
  Future<void> deleteRefreshToken() async {
    await _storage.delete(key: _refreshTokenKey);
  }

  // ==================== User Data Management ====================

  /// Save user data as JSON string
  Future<void> saveUserData(String userData) async {
    await _storage.write(key: _userDataKey, value: userData);
  }

  /// Get user data JSON string
  Future<String?> getUserData() async {
    return await _storage.read(key: _userDataKey);
  }

  /// Delete user data
  Future<void> deleteUserData() async {
    await _storage.delete(key: _userDataKey);
  }

  // ==================== Guest Session Management ====================

  /// Save guest session ID
  Future<void> saveGuestSession(String sessionId) async {
    await _storage.write(key: _guestSessionKey, value: sessionId);
  }

  /// Get guest session ID
  Future<String?> getGuestSession() async {
    return await _storage.read(key: _guestSessionKey);
  }

  /// Delete guest session
  Future<void> deleteGuestSession() async {
    await _storage.delete(key: _guestSessionKey);
  }

  // ==================== Biometric Settings ====================

  /// Save biometric enabled preference
  Future<void> setBiometricEnabled(bool enabled) async {
    await _storage.write(key: _biometricEnabledKey, value: enabled.toString());
  }

  /// Get biometric enabled preference
  Future<bool> isBiometricEnabled() async {
    final value = await _storage.read(key: _biometricEnabledKey);
    return value == 'true';
  }

  /// Set biometric login enabled (alias for setBiometricEnabled)
  Future<void> setBiometricLoginEnabled(bool enabled) async {
    await setBiometricEnabled(enabled);
  }

  /// Check if biometric login is enabled (alias for isBiometricEnabled)
  Future<bool> isBiometricLoginEnabled() async {
    return await isBiometricEnabled();
  }

  /// Store biometric credentials
  Future<void> storeBiometricCredentials(
    Map<String, dynamic> credentials,
  ) async {
    // Store as JSON string - actual implementation would encrypt this
    await _storage.write(
      key: _biometricCredentialsKey,
      value: credentials.toString(),
    );
  }

  /// Check if user has valid tokens (auth + refresh)
  Future<bool> hasValidTokens() async {
    final authToken = await getAuthToken();
    final refreshToken = await getRefreshToken();
    return authToken != null &&
        refreshToken != null &&
        authToken.isNotEmpty &&
        refreshToken.isNotEmpty;
  }

  /// Get device fingerprint
  Future<String?> getDeviceFingerprint() async {
    return await _storage.read(key: _deviceFingerprintKey);
  }

  /// Store device fingerprint
  Future<void> storeDeviceFingerprint(String fingerprint) async {
    await _storage.write(key: _deviceFingerprintKey, value: fingerprint);
  }

  // ==================== Remember Me ====================

  /// Save remember me preference
  Future<void> setRememberMe(bool remember) async {
    await _storage.write(key: _rememberMeKey, value: remember.toString());
  }

  /// Get remember me preference
  Future<bool> getRememberMe() async {
    final value = await _storage.read(key: _rememberMeKey);
    return value == 'true';
  }

  /// Save email for remember me
  Future<void> saveSavedEmail(String email) async {
    await _storage.write(key: _savedEmailKey, value: email);
  }

  /// Get saved email
  Future<String?> getSavedEmail() async {
    return await _storage.read(key: _savedEmailKey);
  }

  /// Delete saved email
  Future<void> deleteSavedEmail() async {
    await _storage.delete(key: _savedEmailKey);
  }

  // ==================== Utility Methods ====================

  /// Check if user is authenticated (has valid token)
  Future<bool> isAuthenticated() async {
    final token = await getAuthToken();
    return token != null && token.isNotEmpty;
  }

  /// Clear all authentication data
  Future<void> clearAllAuthData() async {
    await Future.wait([
      deleteAuthToken(),
      deleteRefreshToken(),
      deleteUserData(),
      deleteGuestSession(),
    ]);
  }

  /// Clear everything (including preferences)
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  /// Generic write
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Generic read
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  /// Generic delete
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }
}

/// Provider for SecureStorageService
final secureStorageServiceProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService();
});
