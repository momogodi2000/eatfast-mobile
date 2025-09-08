import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/app_user.dart';
import '../../services/auth/auth_service.dart';

/// Auth state provider that manages user authentication and role
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthNotifier(authService);
});

/// Authentication state
class AuthState {
  final AuthStatus status;
  final AppUser? user;
  final String? error;
  final bool requiresTwoFactor;
  final String? twoFactorUserId;
  final String? twoFactorMethod;

  const AuthState({
    this.status = AuthStatus.unauthenticated,
    this.user,
    this.error,
    this.requiresTwoFactor = false,
    this.twoFactorUserId,
    this.twoFactorMethod,
  });

  AuthState copyWith({
    AuthStatus? status,
    AppUser? user,
    String? error,
    bool? requiresTwoFactor,
    String? twoFactorUserId,
    String? twoFactorMethod,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error,
      requiresTwoFactor: requiresTwoFactor ?? this.requiresTwoFactor,
      twoFactorUserId: twoFactorUserId ?? this.twoFactorUserId,
      twoFactorMethod: twoFactorMethod ?? this.twoFactorMethod,
    );
  }

  bool get isAuthenticated => status == AuthStatus.authenticated && user != null;
  bool get isLoading => status == AuthStatus.loading;
  bool get hasRole => user?.role != null;

  bool hasRequiredRole(UserRole requiredRole) {
    return user?.hasRole(requiredRole) ?? false;
  }

  bool hasAnyRole(List<UserRole> roles) {
    return user?.hasAnyRole(roles) ?? false;
  }
}

/// Auth state notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;

  AuthNotifier(this._authService) : super(const AuthState()) {
    _initialize();
  }

  /// Initialize authentication from stored tokens
  Future<void> _initialize() async {
    try {
      state = state.copyWith(status: AuthStatus.loading);
      
      final result = await _authService.initializeAuth();
      
      if (result.isSuccess && result.user != null) {
        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: result.user,
          error: null,
        );
      } else {
        state = state.copyWith(status: AuthStatus.unauthenticated);
      }
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        error: 'Failed to initialize auth: $e',
      );
    }
  }

  /// Login user with email and password
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      state = state.copyWith(status: AuthStatus.loading, error: null);
      
      final result = await _authService.login(email: email, password: password);
      
      if (result.isSuccess) {
        if (result.requiresTwoFactor) {
          // 2FA required
          state = state.copyWith(
            status: AuthStatus.unauthenticated,
            requiresTwoFactor: true,
            twoFactorUserId: result.userId,
            twoFactorMethod: result.twoFactorMethod,
            error: null,
          );
        } else if (result.user != null) {
          // Login successful
          state = state.copyWith(
            status: AuthStatus.authenticated,
            user: result.user,
            error: null,
            requiresTwoFactor: false,
          );
        }
      } else {
        state = state.copyWith(
          status: AuthStatus.unauthenticated,
          error: result.error ?? 'Login failed',
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        error: 'Login failed: $e',
      );
    }
  }

  /// Login user with phone number and password  
  Future<void> loginWithPhone({
    required String phone,
    required String password,
  }) async {
    try {
      state = state.copyWith(status: AuthStatus.loading, error: null);
      
      final result = await _authService.loginWithPhone(phone: phone, password: password);
      
      if (result.isSuccess) {
        if (result.requiresTwoFactor) {
          // 2FA required
          state = state.copyWith(
            status: AuthStatus.unauthenticated,
            requiresTwoFactor: true,
            twoFactorUserId: result.userId,
            twoFactorMethod: result.twoFactorMethod,
            error: null,
          );
        } else if (result.user != null) {
          // Login successful
          state = state.copyWith(
            status: AuthStatus.authenticated,
            user: result.user,
            error: null,
            requiresTwoFactor: false,
          );
        }
      } else {
        state = state.copyWith(
          status: AuthStatus.unauthenticated,
          error: result.error ?? 'Phone login failed',
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        error: 'Phone login failed: $e',
      );
    }
  }

  /// Register new user
  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String city,
    String role = 'customer',
  }) async {
    try {
      state = state.copyWith(status: AuthStatus.loading, error: null);
      
      final result = await _authService.register(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        city: city,
        role: role,
      );
      
      if (result.isSuccess) {
        state = state.copyWith(
          status: AuthStatus.unauthenticated,
          error: null,
        );
        // Registration successful, user needs to login
      } else {
        state = state.copyWith(
          status: AuthStatus.unauthenticated,
          error: result.error ?? 'Registration failed',
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        error: 'Registration failed: $e',
      );
    }
  }

  /// Verify two-factor authentication
  Future<void> verifyTwoFactor({
    required String code,
  }) async {
    if (!state.requiresTwoFactor || state.twoFactorUserId == null) {
      state = state.copyWith(error: 'Two-factor verification not required');
      return;
    }

    try {
      state = state.copyWith(status: AuthStatus.loading, error: null);
      
      final result = await _authService.verifyTwoFactor(
        userId: state.twoFactorUserId!,
        code: code,
      );
      
      if (result.isSuccess && result.user != null) {
        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: result.user,
          error: null,
          requiresTwoFactor: false,
          twoFactorUserId: null,
          twoFactorMethod: null,
        );
      } else {
        state = state.copyWith(
          status: AuthStatus.unauthenticated,
          error: result.error ?? '2FA verification failed',
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        error: '2FA verification failed: $e',
      );
    }
  }

  /// Send OTP to phone
  Future<bool> sendOtp({required String phone}) async {
    try {
      final result = await _authService.sendOtp(phone: phone);
      if (!result.isSuccess) {
        state = state.copyWith(error: result.error);
      }
      return result.isSuccess;
    } catch (e) {
      state = state.copyWith(error: 'Failed to send OTP: $e');
      return false;
    }
  }

  /// Verify OTP
  Future<bool> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final result = await _authService.verifyOtp(phone: phone, otp: otp);
      if (!result.isSuccess) {
        state = state.copyWith(error: result.error);
      }
      return result.isSuccess;
    } catch (e) {
      state = state.copyWith(error: 'OTP verification failed: $e');
      return false;
    }
  }

  /// Request password reset
  Future<bool> requestPasswordReset({required String email}) async {
    try {
      final result = await _authService.requestPasswordReset(email: email);
      if (!result.isSuccess) {
        state = state.copyWith(error: result.error);
      }
      return result.isSuccess;
    } catch (e) {
      state = state.copyWith(error: 'Password reset request failed: $e');
      return false;
    }
  }

  /// Refresh user data
  Future<void> refreshUser() async {
    if (!isAuthenticated) return;
    
    try {
      final result = await _authService.getCurrentUser();
      if (result.isSuccess && result.user != null) {
        state = state.copyWith(user: result.user);
      }
    } catch (e) {
      // Silently fail refresh, user is still authenticated
    }
  }

  /// Update user profile
  Future<void> updateProfile(AppUser updatedUser) async {
    if (!isAuthenticated) return;

    try {
      state = state.copyWith(status: AuthStatus.loading);
      final result = await _authService.updateProfile(updatedUser);

      if (result.isSuccess && result.user != null) {
        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: result.user,
          error: null,
        );
      } else {
        state = state.copyWith(
          status: AuthStatus.authenticated, // Keep user authenticated
          error: result.error ?? 'Profile update failed',
        );
        // Optionally re-fetch user to revert optimistic UI changes
        await refreshUser();
      }
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.authenticated,
        error: 'Profile update failed: $e',
      );
      await refreshUser();
    }
  }

  /// Logout user
  Future<void> logout() async {
    try {
      await _authService.logout();
    } catch (e) {
      // Continue with logout even if API call fails
    }
    
    state = const AuthState(status: AuthStatus.unauthenticated);
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Helper getters
  bool get isAuthenticated => state.isAuthenticated;
  bool get isLoading => state.isLoading;
  AppUser? get currentUser => state.user;
  String? get error => state.error;
}