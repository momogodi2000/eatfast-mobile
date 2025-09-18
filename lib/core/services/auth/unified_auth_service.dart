/// Unified Authentication Service - Backend Aligned
/// Consolidates all authentication functionality from duplicated services
/// Mirrors the backend authentication endpoints exactly

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../api/api_client.dart';
import '../../constants/api_constants.dart';
import '../../models/user.dart';

class UnifiedAuthService {
  static final UnifiedAuthService _instance = UnifiedAuthService._internal();
  factory UnifiedAuthService() => _instance;

  final ApiClient _apiClient = ApiClient();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  UnifiedAuthService._internal();

  // Current authentication state
  AuthUser? _currentUser;
  String? _accessToken;
  String? _refreshToken;

  /// Get current authenticated user
  AuthUser? get currentUser => _currentUser;

  /// Check if user is authenticated
  bool get isAuthenticated => _currentUser != null && _accessToken != null;

  /// Login with email and password
  Future<AuthResult> login({
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.authLogin,
        data: {
          'email': email,
          'password': password,
          'rememberMe': rememberMe,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;

        // Check if 2FA is required
        if (data['requiresTwoFactor'] == true) {
          return AuthResult.twoFactorRequired(
            userId: data['userId'],
            methods: List<String>.from(data['twoFactorMethods'] ?? []),
          );
        }

        // Normal login success
        await _handleLoginSuccess(data);
        return AuthResult.success(_currentUser!);
      } else {
        return AuthResult.failure(
          response.data['message'] ?? 'Login failed',
        );
      }
    } on DioException catch (e) {
      return AuthResult.failure(_handleDioError(e));
    }
  }

  /// Verify two-factor authentication
  Future<AuthResult> verifyTwoFactor({
    required String userId,
    required String code,
    required String method,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.authVerifyTwoFactor,
        data: {
          'userId': userId,
          'code': code,
          'method': method,
        },
      );

      if (response.statusCode == 200) {
        await _handleLoginSuccess(response.data);
        return AuthResult.success(_currentUser!);
      } else {
        return AuthResult.failure(
          response.data['message'] ?? 'Two-factor verification failed',
        );
      }
    } on DioException catch (e) {
      return AuthResult.failure(_handleDioError(e));
    }
  }

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
      final response = await _apiClient.post(
        ApiConstants.authRegister,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'phone': phone,
          'role': role.backendValue,
          if (additionalData != null) ...additionalData,
        },
      );

      if (response.statusCode == 201) {
        // Some backends require email verification before login
        if (response.data['requiresVerification'] == true) {
          return AuthResult.emailVerificationRequired(
            response.data['message'] ?? 'Please verify your email',
          );
        }

        // Auto-login after successful registration
        await _handleLoginSuccess(response.data);
        return AuthResult.success(_currentUser!);
      } else {
        return AuthResult.failure(
          response.data['message'] ?? 'Registration failed',
        );
      }
    } on DioException catch (e) {
      return AuthResult.failure(_handleDioError(e));
    }
  }

  /// Send OTP for verification
  Future<bool> sendOtp({
    required String phoneOrEmail,
    required OtpType type,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.authSendOtp,
        data: {
          'recipient': phoneOrEmail,
          'type': type.backendValue,
        },
      );
      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Send OTP failed: $e');
      return false;
    }
  }

  /// Verify OTP
  Future<AuthResult> verifyOtp({
    required String phoneOrEmail,
    required String code,
    required OtpType type,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.authVerifyOtp,
        data: {
          'recipient': phoneOrEmail,
          'code': code,
          'type': type.backendValue,
        },
      );

      if (response.statusCode == 200) {
        // If this is login OTP, handle login success
        if (type == OtpType.login && response.data['user'] != null) {
          await _handleLoginSuccess(response.data);
          return AuthResult.success(_currentUser!);
        }

        return AuthResult.otpVerified();
      } else {
        return AuthResult.failure(
          response.data['message'] ?? 'OTP verification failed',
        );
      }
    } on DioException catch (e) {
      return AuthResult.failure(_handleDioError(e));
    }
  }

  /// Forgot password
  Future<bool> forgotPassword(String email) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.authForgotPassword,
        data: {'email': email},
      );
      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Forgot password failed: $e');
      return false;
    }
  }

  /// Verify reset code
  Future<bool> verifyResetCode({
    required String email,
    required String code,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.authVerifyResetCode,
        data: {
          'email': email,
          'code': code,
        },
      );
      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Verify reset code failed: $e');
      return false;
    }
  }

  /// Reset password
  Future<bool> resetPassword({
    required String email,
    required String code,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.authResetPassword,
        data: {
          'email': email,
          'code': code,
          'newPassword': newPassword,
          'confirmPassword': confirmPassword,
        },
      );
      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Reset password failed: $e');
      return false;
    }
  }

  /// Refresh authentication token
  Future<bool> refreshToken() async {
    if (_refreshToken == null) return false;

    try {
      final response = await _apiClient.post(
        ApiConstants.authRefresh,
        data: {'refreshToken': _refreshToken},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        _accessToken = data['accessToken'];

        // Update refresh token if provided
        if (data['refreshToken'] != null) {
          _refreshToken = data['refreshToken'];
          await _secureStorage.write(
            key: 'refresh_token',
            value: _refreshToken!,
          );
        }

        // Update token in secure storage
        await _secureStorage.write(
          key: 'access_token',
          value: _accessToken!,
        );

        // Update API client token
        _apiClient.setAuthToken(_accessToken!);

        return true;
      }
    } catch (e) {
      debugPrint('Token refresh failed: $e');
    }

    return false;
  }

  /// Logout user
  Future<void> logout() async {
    try {
      // Call backend logout endpoint
      await _apiClient.post(ApiConstants.authLogout);
    } catch (e) {
      debugPrint('Backend logout failed: $e');
    }

    // Clear local data regardless of backend response
    await _clearAuthData();
  }

  /// Revoke all tokens (sign out from all devices)
  Future<bool> revokeAllTokens() async {
    try {
      final response = await _apiClient.post(ApiConstants.authRevoke);
      await _clearAuthData();
      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Revoke tokens failed: $e');
      await _clearAuthData();
      return false;
    }
  }

  /// Get current user info from backend
  Future<AuthUser?> getCurrentUser() async {
    try {
      final response = await _apiClient.get(ApiConstants.authMe);

      if (response.statusCode == 200) {
        _currentUser = AuthUser.fromJson(response.data);
        return _currentUser;
      }
    } catch (e) {
      debugPrint('Get current user failed: $e');
    }
    return null;
  }

  /// Initialize auth service (check stored tokens)
  Future<bool> initialize() async {
    try {
      // Get stored tokens
      _accessToken = await _secureStorage.read(key: 'access_token');
      _refreshToken = await _secureStorage.read(key: 'refresh_token');

      if (_accessToken != null) {
        // Set token in API client
        _apiClient.setAuthToken(_accessToken!);

        // Try to get current user
        final user = await getCurrentUser();
        if (user != null) {
          return true;
        } else {
          // Token might be expired, try refresh
          final refreshed = await refreshToken();
          if (refreshed) {
            final user = await getCurrentUser();
            return user != null;
          }
        }
      }

      // Clear invalid tokens
      await _clearAuthData();
      return false;
    } catch (e) {
      debugPrint('Auth initialization failed: $e');
      await _clearAuthData();
      return false;
    }
  }

  /// Private helper methods

  Future<void> _handleLoginSuccess(Map<String, dynamic> data) async {
    // Extract tokens
    _accessToken = data['accessToken'] ?? data['token'];
    _refreshToken = data['refreshToken'];

    // Extract user data
    _currentUser = AuthUser.fromJson(data['user'] ?? data);

    // Store tokens securely
    if (_accessToken != null) {
      await _secureStorage.write(key: 'access_token', value: _accessToken!);
      _apiClient.setAuthToken(_accessToken!);
    }

    if (_refreshToken != null) {
      await _secureStorage.write(key: 'refresh_token', value: _refreshToken!);
    }

    // Store user data in preferences for quick access
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', _currentUser!.id);
    await prefs.setString('user_role', _currentUser!.role.backendValue);
  }

  Future<void> _clearAuthData() async {
    _currentUser = null;
    _accessToken = null;
    _refreshToken = null;

    // Clear secure storage
    await _secureStorage.delete(key: 'access_token');
    await _secureStorage.delete(key: 'refresh_token');

    // Clear shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');
    await prefs.remove('user_role');

    // Clear API client token
    _apiClient.clearAuthToken();
  }

  String _handleDioError(DioException error) {
    if (error.response != null) {
      final data = error.response!.data;
      if (data is Map<String, dynamic> && data.containsKey('message')) {
        return data['message'];
      }
      return 'Server error: ${error.response!.statusCode}';
    }
    return 'Network error occurred';
  }
}

// Enums and Data Models

enum UserRole {
  guest('guest'),
  customer('customer'),
  restaurant('restaurant'),
  driver('driver'),
  admin('admin');

  const UserRole(this.backendValue);
  final String backendValue;

  static UserRole fromBackendValue(String value) {
    for (final role in UserRole.values) {
      if (role.backendValue == value) return role;
    }
    return UserRole.guest;
  }

  String get displayName {
    switch (this) {
      case UserRole.guest:
        return 'Invité';
      case UserRole.customer:
        return 'Client';
      case UserRole.restaurant:
        return 'Restaurant';
      case UserRole.driver:
        return 'Livreur';
      case UserRole.admin:
        return 'Administrateur';
    }
  }
}

enum OtpType {
  login('login'),
  registration('registration'),
  passwordReset('password_reset'),
  phoneVerification('phone_verification'),
  emailVerification('email_verification');

  const OtpType(this.backendValue);
  final String backendValue;
}

class AuthUser {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final UserRole role;
  final bool isVerified;
  final bool twoFactorEnabled;
  final Map<String, dynamic>? profile;

  AuthUser({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.role,
    this.isVerified = false,
    this.twoFactorEnabled = false,
    this.profile,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      id: json['id'] ?? json['_id'] ?? '',
      name: json['name'] ?? json['firstName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      role: UserRole.fromBackendValue(json['role'] ?? 'guest'),
      isVerified: json['isVerified'] ?? false,
      twoFactorEnabled: json['twoFactorEnabled'] ?? false,
      profile: json['profile'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role.backendValue,
      'isVerified': isVerified,
      'twoFactorEnabled': twoFactorEnabled,
      'profile': profile,
    };
  }
}

class AuthResult {
  final AuthResultType type;
  final AuthUser? user;
  final String? message;
  final String? userId;
  final List<String>? twoFactorMethods;

  AuthResult._({
    required this.type,
    this.user,
    this.message,
    this.userId,
    this.twoFactorMethods,
  });

  factory AuthResult.success(AuthUser user) {
    return AuthResult._(type: AuthResultType.success, user: user);
  }

  factory AuthResult.failure(String message) {
    return AuthResult._(type: AuthResultType.failure, message: message);
  }

  factory AuthResult.twoFactorRequired({
    required String userId,
    required List<String> methods,
  }) {
    return AuthResult._(
      type: AuthResultType.twoFactorRequired,
      userId: userId,
      twoFactorMethods: methods,
    );
  }

  factory AuthResult.emailVerificationRequired(String message) {
    return AuthResult._(
      type: AuthResultType.emailVerificationRequired,
      message: message,
    );
  }

  factory AuthResult.otpVerified() {
    return AuthResult._(type: AuthResultType.otpVerified);
  }

  bool get isSuccess => type == AuthResultType.success;
  bool get isFailure => type == AuthResultType.failure;
  bool get requiresTwoFactor => type == AuthResultType.twoFactorRequired;
  bool get requiresEmailVerification => type == AuthResultType.emailVerificationRequired;
}

enum AuthResultType {
  success,
  failure,
  twoFactorRequired,
  emailVerificationRequired,
  otpVerified,
}

// Provider
final unifiedAuthServiceProvider = Provider<UnifiedAuthService>((ref) => UnifiedAuthService());