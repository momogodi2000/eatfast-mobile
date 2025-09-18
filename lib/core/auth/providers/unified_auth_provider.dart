/// Unified Authentication Provider - Backend Aligned
/// Replaces all duplicate auth providers with single source of truth

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../services/auth/unified_auth_service.dart';

/// Main auth state provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authService = ref.watch(unifiedAuthServiceProvider);
  return AuthNotifier(authService);
});

/// Auth state notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final UnifiedAuthService _authService;

  AuthNotifier(this._authService) : super(const AuthState()) {
    _initialize();
  }

  Future<void> _initialize() async {
    state = state.copyWith(status: AuthStatus.loading);

    try {
      final isAuthenticated = await _authService.initialize();

      if (isAuthenticated && _authService.currentUser != null) {
        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: _authService.currentUser,
        );
      } else {
        state = state.copyWith(status: AuthStatus.unauthenticated);
      }
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        error: 'Initialization failed: $e',
      );
    }
  }

  /// Login with email and password
  Future<void> login({
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    state = state.copyWith(
      status: AuthStatus.loading,
      error: null,
    );

    try {
      final result = await _authService.login(
        email: email,
        password: password,
        rememberMe: rememberMe,
      );

      if (result.isSuccess) {
        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: result.user,
        );
      } else if (result.requiresTwoFactor) {
        state = state.copyWith(
          status: AuthStatus.twoFactorRequired,
          twoFactorUserId: result.userId,
          twoFactorMethods: result.twoFactorMethods ?? [],
        );
      } else {
        state = state.copyWith(
          status: AuthStatus.unauthenticated,
          error: result.message ?? 'Login failed',
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        error: 'Login error: $e',
      );
    }
  }

  /// Verify two-factor authentication
  Future<void> verifyTwoFactor({
    required String code,
    required String method,
  }) async {
    if (state.twoFactorUserId == null) return;

    state = state.copyWith(status: AuthStatus.loading);

    try {
      final result = await _authService.verifyTwoFactor(
        userId: state.twoFactorUserId!,
        code: code,
        method: method,
      );

      if (result.isSuccess) {
        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: result.user,
          twoFactorUserId: null,
          twoFactorMethods: [],
        );
      } else {
        state = state.copyWith(
          status: AuthStatus.twoFactorRequired,
          error: result.message ?? 'Two-factor verification failed',
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.twoFactorRequired,
        error: 'Two-factor verification error: $e',
      );
    }
  }

  /// Register new user
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required UserRole role,
    Map<String, dynamic>? additionalData,
  }) async {
    state = state.copyWith(
      status: AuthStatus.loading,
      error: null,
    );

    try {
      final result = await _authService.register(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phone: phone,
        role: role,
        additionalData: additionalData,
      );

      if (result.isSuccess) {
        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: result.user,
        );
      } else if (result.requiresEmailVerification) {
        state = state.copyWith(
          status: AuthStatus.emailVerificationRequired,
          error: result.message,
        );
      } else {
        state = state.copyWith(
          status: AuthStatus.unauthenticated,
          error: result.message ?? 'Registration failed',
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        error: 'Registration error: $e',
      );
    }
  }

  /// Send OTP
  Future<bool> sendOtp({
    required String phoneOrEmail,
    required OtpType type,
  }) async {
    try {
      return await _authService.sendOtp(
        phoneOrEmail: phoneOrEmail,
        type: type,
      );
    } catch (e) {
      state = state.copyWith(error: 'Failed to send OTP: $e');
      return false;
    }
  }

  /// Verify OTP
  Future<void> verifyOtp({
    required String phoneOrEmail,
    required String code,
    required OtpType type,
  }) async {
    state = state.copyWith(status: AuthStatus.loading);

    try {
      final result = await _authService.verifyOtp(
        phoneOrEmail: phoneOrEmail,
        code: code,
        type: type,
      );

      if (result.isSuccess) {
        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: result.user,
        );
      } else {
        state = state.copyWith(
          status: AuthStatus.unauthenticated,
          error: result.message ?? 'OTP verification failed',
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        error: 'OTP verification error: $e',
      );
    }
  }

  /// Forgot password
  Future<bool> forgotPassword(String email) async {
    try {
      return await _authService.forgotPassword(email);
    } catch (e) {
      state = state.copyWith(error: 'Failed to send reset email: $e');
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
      return await _authService.resetPassword(
        email: email,
        code: code,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
    } catch (e) {
      state = state.copyWith(error: 'Password reset failed: $e');
      return false;
    }
  }

  /// Logout
  Future<void> logout() async {
    state = state.copyWith(status: AuthStatus.loading);

    try {
      await _authService.logout();
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        user: null,
        error: null,
      );
    } catch (e) {
      // Even if backend logout fails, clear local state
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        user: null,
        error: null,
      );
    }
  }

  /// Refresh user data
  Future<void> refreshUser() async {
    try {
      final user = await _authService.getCurrentUser();
      if (user != null) {
        state = state.copyWith(user: user);
      }
    } catch (e) {
      state = state.copyWith(error: 'Failed to refresh user data: $e');
    }
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// Authentication state
class AuthState {
  final AuthStatus status;
  final AuthUser? user;
  final String? error;
  final String? twoFactorUserId;
  final List<String> twoFactorMethods;

  const AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.error,
    this.twoFactorUserId,
    this.twoFactorMethods = const [],
  });

  AuthState copyWith({
    AuthStatus? status,
    AuthUser? user,
    String? error,
    String? twoFactorUserId,
    List<String>? twoFactorMethods,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error ?? this.error,
      twoFactorUserId: twoFactorUserId ?? this.twoFactorUserId,
      twoFactorMethods: twoFactorMethods ?? this.twoFactorMethods,
    );
  }

  bool get isAuthenticated => status == AuthStatus.authenticated && user != null;
  bool get isLoading => status == AuthStatus.loading;
  bool get requiresTwoFactor => status == AuthStatus.twoFactorRequired;
  bool get requiresEmailVerification => status == AuthStatus.emailVerificationRequired;
}

/// Authentication status enumeration
enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  twoFactorRequired,
  emailVerificationRequired,
}

/// Convenience providers for common auth checks
final isAuthenticatedProvider = Provider<bool>((ref) {
  final authState = ref.watch(authProvider);
  return authState.isAuthenticated;
});

final currentUserProvider = Provider<AuthUser?>((ref) {
  final authState = ref.watch(authProvider);
  return authState.user;
});

final currentUserRoleProvider = Provider<UserRole?>((ref) {
  final user = ref.watch(currentUserProvider);
  return user?.role;
});

final isAdminProvider = Provider<bool>((ref) {
  final role = ref.watch(currentUserRoleProvider);
  return role == UserRole.admin;
});

final isRestaurantProvider = Provider<bool>((ref) {
  final role = ref.watch(currentUserRoleProvider);
  return role == UserRole.restaurant;
});

final isDriverProvider = Provider<bool>((ref) {
  final role = ref.watch(currentUserRoleProvider);
  return role == UserRole.driver;
});

final isCustomerProvider = Provider<bool>((ref) {
  final role = ref.watch(currentUserRoleProvider);
  return role == UserRole.customer;
});

final isGuestProvider = Provider<bool>((ref) {
  final role = ref.watch(currentUserRoleProvider);
  return role == UserRole.guest || role == null;
});