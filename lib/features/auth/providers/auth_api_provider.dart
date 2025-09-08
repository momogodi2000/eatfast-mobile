import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/network/api_client.dart';
import '../../../core/security/secure_storage_service.dart';
import '../data/auth_api_repository.dart';
import '../data/auth_api_repository_impl.dart';
import '../domain/auth_user.dart';

/// Provider for ApiClient
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(
    baseUrl: 'https://eatfast-api.onrender.com', // Replace with actual backend URL
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
  );
});

/// Provider for AuthApiRepository
final authApiRepositoryProvider = Provider<AuthApiRepository>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return AuthApiRepositoryImpl(apiClient);
});

/// Provider for AuthApiNotifier
final authApiProvider = StateNotifierProvider<AuthApiNotifier, AuthApiState>((ref) {
  final repository = ref.read(authApiRepositoryProvider);
  return AuthApiNotifier(repository);
});

/// Auth API State Management with Riverpod
class AuthApiNotifier extends StateNotifier<AuthApiState> {
  final AuthApiRepository _repository;
  
  AuthApiNotifier(this._repository) : super(const AuthApiState.initial()) {
    _initializeAuth();
  }

  /// Initialize authentication state on app start
  Future<void> _initializeAuth() async {
    try {
      state = const AuthApiState.loading();
      
      // Check for stored tokens
      final secureStorage = SecureStorageService();
      final hasValidTokens = await secureStorage.hasValidTokens();
      
      if (hasValidTokens) {
        // Try to get current user
        final user = await _repository.getCurrentUser();
        state = AuthApiState.authenticated(user);
      } else {
        state = const AuthApiState.unauthenticated();
      }
    } catch (e) {
      // If token is invalid or expired, logout
      await _clearAuthData();
      state = const AuthApiState.unauthenticated();
    }
  }

  /// Login with email and password
  Future<void> login(String email, String password, {bool rememberMe = false}) async {
    try {
      state = const AuthApiState.loggingIn();
      
      final loginRequest = LoginRequest(
        email: email,
        password: password,
        rememberMe: rememberMe,
      );
      
      final authResponse = await _repository.login(loginRequest);
      
      // Store tokens securely
      await _storeAuthData(authResponse);
      
      state = AuthApiState.authenticated(authResponse.user);
    } catch (e) {
      state = AuthApiState.error(e.toString());
    }
  }

  /// Register new user account
  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    bool acceptTerms = true,
  }) async {
    try {
      state = const AuthApiState.registering();
      
      final registerRequest = RegisterRequest(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword,
        acceptTerms: acceptTerms,
      );
      
      final authResponse = await _repository.register(registerRequest);
      
      // Store tokens securely  
      await _storeAuthData(authResponse);
      
      state = AuthApiState.authenticated(authResponse.user);
    } catch (e) {
      state = AuthApiState.error(e.toString());
    }
  }

  /// Request password reset via email
  Future<void> requestPasswordReset(String email) async {
    try {
      state = const AuthApiState.resettingPassword();
      
      final request = PasswordResetRequest(email: email);
      await _repository.requestPasswordReset(request);
      
      state = const AuthApiState.unauthenticated();
    } catch (e) {
      state = AuthApiState.error(e.toString());
    }
  }

  /// Reset password with OTP
  Future<void> resetPasswordWithOtp(String phone, String otp, String newPassword) async {
    try {
      state = const AuthApiState.resettingPassword();
      
      await _repository.resetPasswordWithOtp(phone, otp, newPassword);
      
      state = const AuthApiState.unauthenticated();
    } catch (e) {
      state = AuthApiState.error(e.toString());
    }
  }

  /// Verify OTP (registration, password reset, etc.)
  Future<void> verifyOtp(String phone, String otp, String type) async {
    try {
      state = const AuthApiState.verifyingOtp();
      
      final request = OtpVerificationRequest(
        phone: phone,
        otp: otp,
        type: type,
      );
      
      final authResponse = await _repository.verifyOtp(request);
      
      // Store tokens if login successful
      await _storeAuthData(authResponse);
      
      state = AuthApiState.authenticated(authResponse.user);
    } catch (e) {
      state = AuthApiState.error(e.toString());
    }
  }

  /// Resend OTP
  Future<void> resendOtp(String phone, String type) async {
    try {
      await _repository.resendOtp(phone, type);
      // Stay in current state, just show success message
    } catch (e) {
      state = AuthApiState.error(e.toString());
    }
  }

  /// Change password (for authenticated users)
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      state = const AuthApiState.changingPassword();
      
      final request = ChangePasswordRequest(
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
      
      await _repository.changePassword(request);
      
      // Return to authenticated state with current user
      if (state is AuthAuthenticated) {
        final currentState = state as AuthAuthenticated;
        state = AuthApiState.authenticated(currentState.user);
      }
    } catch (e) {
      state = AuthApiState.error(e.toString());
    }
  }

  /// Refresh access token
  Future<void> refreshToken() async {
    try {
      final secureStorage = SecureStorageService();
      final refreshToken = await secureStorage.getRefreshToken();
      
      if (refreshToken != null) {
        final authResponse = await _repository.refreshToken(refreshToken);
        await _storeAuthData(authResponse);
        state = AuthApiState.authenticated(authResponse.user);
      } else {
        await logout();
      }
    } catch (e) {
      await logout();
    }
  }

  /// Logout user
  Future<void> logout() async {
    try {
      // Call backend logout endpoint
      await _repository.logout();
    } catch (e) {
      // Continue with logout even if API call fails
    } finally {
      // Clear local data regardless of API call result
      await _clearAuthData();
      state = const AuthApiState.unauthenticated();
    }
  }

  /// Social login (Google, Facebook, etc.)
  Future<void> socialLogin(String provider, String token) async {
    try {
      state = const AuthApiState.loggingIn();
      
      final authResponse = await _repository.socialLogin(provider, token);
      
      await _storeAuthData(authResponse);
      
      state = AuthApiState.authenticated(authResponse.user);
    } catch (e) {
      state = AuthApiState.error(e.toString());
    }
  }

  /// Store authentication data securely
  Future<void> _storeAuthData(AuthResponse authResponse) async {
    final secureStorage = SecureStorageService();
    await secureStorage.storeToken(authResponse.accessToken);
    await secureStorage.storeRefreshToken(authResponse.refreshToken);
    
    // Store user data
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', authResponse.user.id);
    await prefs.setString('user_email', authResponse.user.email);
    await prefs.setString('user_first_name', authResponse.user.firstName);
    await prefs.setString('user_last_name', authResponse.user.lastName);
    await prefs.setString('user_role', authResponse.user.role);
  }

  /// Clear all authentication data
  Future<void> _clearAuthData() async {
    final secureStorage = SecureStorageService();
    await secureStorage.clearTokens();
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');
    await prefs.remove('user_email');
    await prefs.remove('user_first_name');
    await prefs.remove('user_last_name');
    await prefs.remove('user_role');
  }

  /// Check if user is authenticated
  bool get isAuthenticated => state is AuthAuthenticated;

  /// Get current authenticated user
  AuthUser? get currentUser {
    final currentState = state;
    if (currentState is AuthAuthenticated) {
      return currentState.user;
    }
    return null;
  }

  /// Reset error state
  void clearError() {
    if (state is AuthErrorState) {
      state = const AuthApiState.unauthenticated();
    }
  }
}
