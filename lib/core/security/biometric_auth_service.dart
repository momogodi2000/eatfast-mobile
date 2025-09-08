import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:local_auth/local_auth.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'secure_storage_service.dart';

/// Biometric authentication service
/// Handles fingerprint, face recognition, and device security
class BiometricAuthService {
  final SecureStorageService _secureStorage;
  final LocalAuthentication _localAuth = LocalAuthentication();
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  BiometricAuthService(this._secureStorage);

  /// Check if biometric authentication is available
  Future<bool> isAvailable() async {
    try {
      final bool isAvailable = await _localAuth.isDeviceSupported();
      final bool canCheckBiometrics = await _localAuth.canCheckBiometrics;
      final List<BiometricType> availableBiometrics = 
          await _localAuth.getAvailableBiometrics();

      return isAvailable && 
             canCheckBiometrics && 
             availableBiometrics.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  /// Get available biometric types
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _localAuth.getAvailableBiometrics();
    } catch (e) {
      return [];
    }
  }

  /// Authenticate using biometrics
  Future<bool> authenticate({
    required String reason,
    bool useErrorDialogs = true,
    bool stickyAuth = true,
  }) async {
    try {
      final bool didAuthenticate = await _localAuth.authenticate(
        localizedReason: reason,
        options: AuthenticationOptions(
          useErrorDialogs: useErrorDialogs,
          stickyAuth: stickyAuth,
          biometricOnly: true,
        ),
      );

      return didAuthenticate;
    } catch (e) {
      return false;
    }
  }

  /// Setup biometric login
  Future<bool> setupBiometricLogin({
    required String email,
    required String password,
  }) async {
    try {
      // First authenticate with biometrics
      final authenticated = await authenticate(
        reason: 'Configure la connexion biométrique pour votre compte',
      );

      if (!authenticated) {
        return false;
      }

      // Hash the password for secure storage
      final hashedPassword = _hashPassword(password);

      // Store credentials securely
      await _secureStorage.storeUserCredentials(
        email: email,
        hashedPassword: hashedPassword,
      );

      // Enable biometric login
      await _secureStorage.setBiometricLoginEnabled(true);

      // Store biometric setup data
      final biometricData = {
        'setupDate': DateTime.now().toIso8601String(),
        'deviceFingerprint': await getDeviceFingerprint(),
      };
      
      await _secureStorage.storeBiometricCredentials(biometricData);

      return true;
    } catch (e) {
      return false;
    }
  }

  /// Authenticate with biometrics and get stored credentials
  Future<Map<String, String>?> authenticateAndGetCredentials() async {
    try {
      final isEnabled = await _secureStorage.isBiometricLoginEnabled();
      if (!isEnabled) {
        return null;
      }

      // Authenticate with biometrics
      final authenticated = await authenticate(
        reason: 'Utilisez votre biométrie pour vous connecter',
      );

      if (!authenticated) {
        return null;
      }

      // Get stored credentials
      final credentials = await _secureStorage.getUserCredentials();
      if (credentials == null) {
        return null;
      }

      return {
        'email': credentials['email'] as String,
        'hashedPassword': credentials['hashedPassword'] as String,
      };
    } catch (e) {
      return null;
    }
  }

  /// Disable biometric login
  Future<void> disableBiometricLogin() async {
    await _secureStorage.setBiometricLoginEnabled(false);
    // Note: We don't delete stored credentials in case user wants to re-enable
  }

  /// Generate device fingerprint
  Future<String> getDeviceFingerprint() async {
    try {
      String fingerprint = '';

      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        fingerprint = '${androidInfo.model}-${androidInfo.id}-${androidInfo.brand}';
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        fingerprint = '${iosInfo.model}-${iosInfo.identifierForVendor}-${iosInfo.systemVersion}';
      }

      // Add some randomness and hash the fingerprint
      final random = Random();
      final salt = random.nextInt(1000000).toString();
      final combined = '$fingerprint-$salt';
      
      final bytes = utf8.encode(combined);
      final digest = sha256.convert(bytes);
      
      return digest.toString();
    } catch (e) {
      // Fallback fingerprint
      final random = Random();
      return 'fallback-${random.nextInt(999999)}';
    }
  }

  /// Verify device fingerprint matches stored one
  Future<bool> verifyDeviceFingerprint() async {
    try {
      final storedFingerprint = await _secureStorage.getDeviceFingerprint();
      if (storedFingerprint == null) {
        // First time - store current fingerprint
        final currentFingerprint = await getDeviceFingerprint();
        await _secureStorage.storeDeviceFingerprint(currentFingerprint);
        return true;
      }

      final currentFingerprint = await getDeviceFingerprint();
      return storedFingerprint == currentFingerprint;
    } catch (e) {
      return false;
    }
  }

  /// Hash password for secure storage
  static String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Verify hashed password
  static bool verifyHashedPassword(String password, String hashedPassword) {
    final newHash = _hashPassword(password);
    return newHash == hashedPassword;
  }

  /// Check if biometric login is configured and available
  Future<bool> canUseBiometricLogin() async {
    final isAvailableResult = await isAvailable();
    final isEnabled = await _secureStorage.isBiometricLoginEnabled();
    final hasCredentials = await _secureStorage.getUserCredentials() != null;
    
    return isAvailableResult && isEnabled && hasCredentials;
  }

  /// Get user-friendly biometric type string
  static String getBiometricTypeString(List<BiometricType> types) {
    if (types.contains(BiometricType.face)) {
      return 'Face ID';
    } else if (types.contains(BiometricType.fingerprint)) {
      return 'Empreinte digitale';
    } else if (types.contains(BiometricType.iris)) {
      return 'Reconnaissance iris';
    } else if (types.contains(BiometricType.strong) || 
               types.contains(BiometricType.weak)) {
      return 'Biométrie';
    } else {
      return 'Authentification biométrique';
    }
  }
}

/// Provider for BiometricAuthService
final biometricAuthServiceProvider = Provider<BiometricAuthService>((ref) {
  final secureStorage = ref.watch(secureStorageServiceProvider);
  return BiometricAuthService(secureStorage);
});
