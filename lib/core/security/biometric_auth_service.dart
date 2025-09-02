import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:local_auth/local_auth.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'dart:math';
import 'secure_storage_service.dart';

/// Biometric authentication service
/// Handles fingerprint, face recognition, and device security
class BiometricAuthService {
  static final LocalAuthentication _localAuth = LocalAuthentication();
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  /// Check if biometric authentication is available
  static Future<bool> isAvailable() async {
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
  static Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _localAuth.getAvailableBiometrics();
    } catch (e) {
      return [];
    }
  }

  /// Authenticate using biometrics
  static Future<bool> authenticate({
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
  static Future<bool> setupBiometricLogin({
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
      await SecureStorageService.storeUserCredentials(
        email: email,
        hashedPassword: hashedPassword,
      );

      // Enable biometric login
      await SecureStorageService.setBiometricLoginEnabled(true);

      // Store biometric setup data
      final biometricData = {
        'setupDate': DateTime.now().toIso8601String(),
        'deviceFingerprint': await getDeviceFingerprint(),
      };
      
      await SecureStorageService.storeBiometricCredentials(biometricData);

      return true;
    } catch (e) {
      return false;
    }
  }

  /// Authenticate with biometrics and get stored credentials
  static Future<Map<String, String>?> authenticateAndGetCredentials() async {
    try {
      final isEnabled = await SecureStorageService.isBiometricLoginEnabled();
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
      final credentials = await SecureStorageService.getUserCredentials();
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
  static Future<void> disableBiometricLogin() async {
    await SecureStorageService.setBiometricLoginEnabled(false);
    // Note: We don't delete stored credentials in case user wants to re-enable
  }

  /// Generate device fingerprint
  static Future<String> getDeviceFingerprint() async {
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
  static Future<bool> verifyDeviceFingerprint() async {
    try {
      final storedFingerprint = await SecureStorageService.getDeviceFingerprint();
      if (storedFingerprint == null) {
        // First time - store current fingerprint
        final currentFingerprint = await getDeviceFingerprint();
        await SecureStorageService.storeDeviceFingerprint(currentFingerprint);
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
  static Future<bool> canUseBiometricLogin() async {
    final isAvailable = await BiometricAuthService.isAvailable();
    final isEnabled = await SecureStorageService.isBiometricLoginEnabled();
    final hasCredentials = await SecureStorageService.getUserCredentials() != null;
    
    return isAvailable && isEnabled && hasCredentials;
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
