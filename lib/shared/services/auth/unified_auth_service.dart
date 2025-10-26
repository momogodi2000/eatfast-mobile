import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:eatfast_mobile/shared/services/auth/models/app_user.dart';
import 'package:eatfast_mobile/shared/services/auth/domain/models/auth_response.dart';
import 'package:eatfast_mobile/shared/services/api/api_client.dart';
import 'package:eatfast_mobile/shared/services/storage/secure_storage_service.dart';
import 'package:eatfast_mobile/shared/constants/api_constants.dart';
import 'package:eatfast_mobile/shared/services/auth/google_sign_in_service.dart';

/// Unified Authentication Service - Backend Aligned
/// Single source of truth for all authentication operations
/// Integrates with real backend API endpoints
class UnifiedAuthService {
  final ApiClient _apiClient;
  final SecureStorageService _storage;
  final LocalAuthentication _localAuth;
  final GoogleSignInService _googleSignInService;

  AppUser? _currentUser;
  AppUser? get currentUser => _currentUser;

  UnifiedAuthService({
    required ApiClient apiClient,
    required SecureStorageService storage,
    LocalAuthentication? localAuth,
    GoogleSignInService? googleSignInService,
  })  : _apiClient = apiClient,
        _storage = storage,
        _localAuth = localAuth ?? LocalAuthentication(),
        _googleSignInService = googleSignInService ?? GoogleSignInService();

  // ==================== Initialization ====================

  /// Initialize authentication state from secure storage
  /// Returns true if user is authenticated
  Future<bool> initialize() async {
    try {
      // Check if we have a stored token
      final token = await _storage.getAuthToken();
      if (token == null || token.isEmpty) {
        return false;
      }

      // Try to get current user from backend
      final user = await getCurrentUser();
      if (user != null) {
        _currentUser = user;
        return true;
      }

      return false;
    } catch (e) {
      debugPrint('Auth initialization error: $e');
      return false;
    }
  }

  // ==================== Login ====================

  /// Login with email and password
  Future<AuthResult> login({
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.login,
        data: {
          'email': email.trim(),
          'password': password,
          'rememberMe': rememberMe,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final loginResponse = LoginResponse.fromJson(response.data);

        // Check for 2FA requirement
        if (loginResponse.requiresTwoFactor == true) {
          return AuthResult.twoFactorRequired(
            userId: loginResponse.userId ?? '',
            methods: loginResponse.twoFactorMethods ?? [],
            message: loginResponse.message,
          );
        }

        // Success - save tokens and user data
        if (loginResponse.token != null && loginResponse.user != null) {
          await _saveAuthData(
            token: loginResponse.token!,
            refreshToken: loginResponse.refreshToken,
            user: loginResponse.user!,
          );

          _currentUser = loginResponse.user;

          return AuthResult.success(
            user: loginResponse.user!,
            token: loginResponse.token!,
            refreshToken: loginResponse.refreshToken,
            message: loginResponse.message,
          );
        }
      }

      return AuthResult.failure(
        message: response.data?['message'] ?? 'Login failed',
      );
    } on DioException catch (e) {
      return AuthResult.failure(
        message: _handleDioError(e),
      );
    } catch (e) {
      return AuthResult.failure(
        message: 'Login error: ${e.toString()}',
      );
    }
  }

  // ==================== Register ====================

  /// Register new user
  Future<AuthResult> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required UserRole role,
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      // Split name into first and last name
      final nameParts = name.trim().split(' ');
      final firstName = nameParts.first;
      final lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

      final response = await _apiClient.post(
        ApiConstants.register,
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'email': email.trim(),
          'password': password,
          'confirmPassword': confirmPassword,
          'phone': phone.trim(),
          'role': role.value,
          if (additionalData != null) ...additionalData,
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final registerResponse = RegisterResponse.fromJson(response.data);

        // Check if email verification is required
        if (registerResponse.requiresEmailVerification == true) {
          return AuthResult.emailVerificationRequired(
            message: registerResponse.message,
          );
        }

        // Auto-login after registration
        if (registerResponse.token != null && registerResponse.user != null) {
          await _saveAuthData(
            token: registerResponse.token!,
            refreshToken: registerResponse.refreshToken,
            user: registerResponse.user!,
          );

          _currentUser = registerResponse.user;

          return AuthResult.success(
            user: registerResponse.user!,
            token: registerResponse.token!,
            refreshToken: registerResponse.refreshToken,
            message: registerResponse.message,
          );
        }

        return AuthResult.success(
          user: registerResponse.user!,
          token: registerResponse.token ?? '',
          message: registerResponse.message,
        );
      }

      return AuthResult.failure(
        message: response.data?['message'] ?? 'Registration failed',
      );
    } on DioException catch (e) {
      return AuthResult.failure(
        message: _handleDioError(e),
      );
    } catch (e) {
      return AuthResult.failure(
        message: 'Registration error: ${e.toString()}',
      );
    }
  }

  // ==================== Two-Factor Authentication ====================

  /// Verify two-factor authentication code
  Future<AuthResult> verifyTwoFactor({
    required String userId,
    required String code,
    required String method,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.twoFactorVerify,
        data: {
          'userId': userId,
          'code': code,
          'method': method,
        },
      );

      if (response.statusCode == 200) {
        final authResponse = AuthResult.fromJson(response.data);

        if (authResponse.isSuccess &&
            authResponse.token != null &&
            authResponse.user != null) {
          await _saveAuthData(
            token: authResponse.token!,
            refreshToken: authResponse.refreshToken,
            user: authResponse.user!,
          );

          _currentUser = authResponse.user;
        }

        return authResponse;
      }

      return AuthResult.failure(
        message: response.data?['message'] ?? '2FA verification failed',
      );
    } on DioException catch (e) {
      return AuthResult.failure(message: _handleDioError(e));
    } catch (e) {
      return AuthResult.failure(
          message: '2FA verification error: ${e.toString()}');
    }
  }

  // ==================== OTP ====================

  /// Send OTP to phone or email
  Future<bool> sendOtp({
    required String phoneOrEmail,
    required OtpType type,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.sendOtp,
        data: {
          'destination': phoneOrEmail.trim(),
          'type': type.name,
          'method': phoneOrEmail.contains('@') ? 'email' : 'sms',
        },
      );

      if (response.statusCode == 200) {
        final otpResponse = OtpResponse.fromJson(response.data);
        return otpResponse.success;
      }

      return false;
    } on DioException catch (e) {
      debugPrint('Send OTP error: ${_handleDioError(e)}');
      return false;
    } catch (e) {
      debugPrint('Send OTP error: $e');
      return false;
    }
  }

  /// Verify OTP code
  Future<AuthResult> verifyOtp({
    required String phoneOrEmail,
    required String code,
    required OtpType type,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.verifyOtp,
        data: {
          'destination': phoneOrEmail.trim(),
          'code': code.trim(),
          'type': type.name,
        },
      );

      if (response.statusCode == 200) {
        final authResponse = AuthResult.fromJson(response.data);

        if (authResponse.isSuccess &&
            authResponse.token != null &&
            authResponse.user != null) {
          await _saveAuthData(
            token: authResponse.token!,
            refreshToken: authResponse.refreshToken,
            user: authResponse.user!,
          );

          _currentUser = authResponse.user;
        }

        return authResponse;
      }

      return AuthResult.failure(
        message: response.data?['message'] ?? 'OTP verification failed',
      );
    } on DioException catch (e) {
      return AuthResult.failure(message: _handleDioError(e));
    } catch (e) {
      return AuthResult.failure(
          message: 'OTP verification error: ${e.toString()}');
    }
  }

  // ==================== Password Reset ====================

  /// Send forgot password email
  Future<bool> forgotPassword(String email) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.forgotPassword,
        data: {'email': email.trim()},
      );

      return response.statusCode == 200 &&
          (response.data?['success'] == true);
    } on DioException catch (e) {
      debugPrint('Forgot password error: ${_handleDioError(e)}');
      return false;
    } catch (e) {
      debugPrint('Forgot password error: $e');
      return false;
    }
  }

  /// Reset password with code
  Future<bool> resetPassword({
    required String email,
    required String code,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.resetPassword,
        data: {
          'email': email.trim(),
          'code': code.trim(),
          'newPassword': newPassword,
          'confirmPassword': confirmPassword,
        },
      );

      return response.statusCode == 200 &&
          (response.data?['success'] == true);
    } on DioException catch (e) {
      debugPrint('Reset password error: ${_handleDioError(e)}');
      return false;
    } catch (e) {
      debugPrint('Reset password error: $e');
      return false;
    }
  }

  // ==================== Google Sign-In ====================

  /// Sign in with Google
  Future<AuthResult> signInWithGoogle() async {
    try {
      // Step 1: Get Google ID token
      final String? idToken = await _googleSignInService.signIn();

      if (idToken == null) {
        return AuthResult.failure(
          message: 'Google Sign-In was cancelled or failed',
        );
      }

      // Step 2: Send ID token to backend for verification
      final response = await _apiClient.post(
        ApiConstants.googleSignIn,
        data: {
          'idToken': idToken,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final authResponse = AuthResult.fromJson(response.data);

        if (authResponse.isSuccess &&
            authResponse.token != null &&
            authResponse.user != null) {
          // Save auth data
          await _saveAuthData(
            token: authResponse.token!,
            refreshToken: authResponse.refreshToken,
            user: authResponse.user!,
          );

          _currentUser = authResponse.user;

          return AuthResult.success(
            user: authResponse.user!,
            token: authResponse.token!,
            refreshToken: authResponse.refreshToken,
            message: authResponse.message ?? 'Google Sign-In successful',
          );
        }

        return authResponse;
      }

      return AuthResult.failure(
        message: response.data?['message'] ?? 'Google Sign-In failed',
      );
    } on DioException catch (e) {
      return AuthResult.failure(
        message: _handleDioError(e),
      );
    } catch (e) {
      return AuthResult.failure(
        message: 'Google Sign-In error: ${e.toString()}',
      );
    }
  }

  // ==================== User Management ====================

  /// Get current user from backend
  Future<AppUser?> getCurrentUser() async {
    try {
      final response = await _apiClient.get(ApiConstants.authMe);

      if (response.statusCode == 200 && response.data?['user'] != null) {
        final user = AppUser.fromJson(response.data['user']);
        _currentUser = user;

        // Update stored user data
        await _storage.saveUserData(jsonEncode(user.toJson()));

        return user;
      }

      return null;
    } on DioException catch (e) {
      debugPrint('Get current user error: ${_handleDioError(e)}');
      return null;
    } catch (e) {
      debugPrint('Get current user error: $e');
      return null;
    }
  }

  // ==================== Logout ====================

  /// Logout user
  Future<void> logout() async {
    try {
      // Call backend logout endpoint
      await _apiClient.post(ApiConstants.logout);
    } catch (e) {
      debugPrint('Logout backend error: $e');
    } finally {
      // Always clear local data, even if backend call fails
      await _clearAuthData();
      _currentUser = null;
    }
  }

  // ==================== Biometric Authentication ====================

  /// Check if biometric authentication is available
  Future<bool> isBiometricAvailable() async {
    try {
      return await _localAuth.canCheckBiometrics;
    } catch (e) {
      debugPrint('Biometric availability check error: $e');
      return false;
    }
  }

  /// Get available biometric types
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _localAuth.getAvailableBiometrics();
    } catch (e) {
      debugPrint('Get available biometrics error: $e');
      return [];
    }
  }

  /// Enable biometric authentication
  Future<bool> enableBiometric() async {
    try {
      final available = await isBiometricAvailable();
      if (!available) return false;

      final authenticated = await _localAuth.authenticate(
        localizedReason: 'Enable biometric authentication for quick login',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      if (authenticated) {
        await _storage.setBiometricEnabled(true);
        return true;
      }

      return false;
    } catch (e) {
      debugPrint('Enable biometric error: $e');
      return false;
    }
  }

  /// Disable biometric authentication
  Future<void> disableBiometric() async {
    await _storage.setBiometricEnabled(false);
  }

  /// Check if biometric is enabled
  Future<bool> isBiometricEnabled() async {
    return await _storage.isBiometricEnabled();
  }

  /// Authenticate with biometric
  Future<bool> authenticateWithBiometric({
    String reason = 'Authenticate to continue',
  }) async {
    try {
      final enabled = await isBiometricEnabled();
      if (!enabled) return false;

      final available = await isBiometricAvailable();
      if (!available) return false;

      return await _localAuth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      debugPrint('Biometric authentication error: $e');
      return false;
    }
  }

  /// Login with biometric (if enabled and token exists)
  Future<AuthResult> biometricLogin() async {
    try {
      // Check if biometric is enabled
      final enabled = await isBiometricEnabled();
      if (!enabled) {
        return AuthResult.failure(message: 'Biometric login not enabled');
      }

      // Authenticate with biometric
      final authenticated = await authenticateWithBiometric(
        reason: 'Login with biometric authentication',
      );

      if (!authenticated) {
        return AuthResult.failure(message: 'Biometric authentication failed');
      }

      // Get stored token
      final token = await _storage.getAuthToken();
      if (token == null || token.isEmpty) {
        return AuthResult.failure(message: 'No stored credentials found');
      }

      // Try to get current user (token should still be valid)
      final user = await getCurrentUser();
      if (user != null) {
        _currentUser = user;
        return AuthResult.success(
          user: user,
          token: token,
          message: 'Biometric login successful',
        );
      }

      return AuthResult.failure(message: 'Session expired, please login again');
    } catch (e) {
      return AuthResult.failure(message: 'Biometric login error: ${e.toString()}');
    }
  }

  // ==================== Helper Methods ====================

  /// Save authentication data to secure storage
  Future<void> _saveAuthData({
    required String token,
    String? refreshToken,
    required AppUser user,
  }) async {
    await Future.wait([
      _storage.saveAuthToken(token),
      if (refreshToken != null) _storage.saveRefreshToken(refreshToken),
      _storage.saveUserData(jsonEncode(user.toJson())),
    ]);
  }

  /// Clear all authentication data
  Future<void> _clearAuthData() async {
    await _storage.clearAllAuthData();
    await _apiClient.clearAllAuth();
  }

  /// Handle Dio errors and return user-friendly messages
  String _handleDioError(DioException error) {
    if (error.response?.data != null) {
      final data = error.response!.data;
      if (data is Map<String, dynamic> && data['message'] != null) {
        return data['message'] as String;
      }
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.badResponse:
        return 'Server error. Please try again later.';
      case DioExceptionType.cancel:
        return 'Request cancelled.';
      default:
        return 'Network error. Please check your connection.';
    }
  }
}

/// OTP Types
enum OtpType {
  login,
  register,
  resetPassword,
  verification,
}

/// Service provider
final unifiedAuthServiceProvider = Provider<UnifiedAuthService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final storage = ref.watch(secureStorageServiceProvider);
  return UnifiedAuthService(apiClient: apiClient, storage: storage);
});
