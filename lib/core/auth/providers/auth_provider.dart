import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import '../models/app_user.dart';

/// Auth state provider that manages user authentication and role
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

/// Authentication state
class AuthState {
  final AuthStatus status;
  final AppUser? user;
  final String? error;

  const AuthState({
    this.status = AuthStatus.unauthenticated,
    this.user,
    this.error,
  });

  AuthState copyWith({
    AuthStatus? status,
    AppUser? user,
    String? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error,
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
  static const _storage = FlutterSecureStorage();
  static const _userKey = 'app_user';
  static const _tokenKey = 'auth_token';

  AuthNotifier() : super(const AuthState()) {
    _loadUserFromStorage();
  }

  /// Load user from secure storage
  Future<void> _loadUserFromStorage() async {
    try {
      state = state.copyWith(status: AuthStatus.loading);
      
      final userJson = await _storage.read(key: _userKey);
      final token = await _storage.read(key: _tokenKey);
      
      if (userJson != null && token != null) {
        final userMap = jsonDecode(userJson) as Map<String, dynamic>;
        final user = AppUser.fromJson(userMap);
        
        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: user,
        );
      } else {
        state = state.copyWith(status: AuthStatus.unauthenticated);
      }
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        error: 'Failed to load user: $e',
      );
    }
  }

  /// Login user
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      state = state.copyWith(status: AuthStatus.loading);
      
      // TODO: Replace with actual API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Mock user data - replace with actual API response
      final user = AppUser(
        id: 'user_123',
        email: email,
        name: 'John Doe',
        role: UserRole.customer,
        isVerified: true,
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
        lastLoginAt: DateTime.now(),
      );
      
      await _saveUserToStorage(user, 'mock_token_123');
      
      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        error: 'Login failed: $e',
      );
    }
  }

  /// Login as restaurant owner
  Future<void> loginAsRestaurantOwner({
    required String email,
    required String password,
  }) async {
    try {
      state = state.copyWith(status: AuthStatus.loading);
      
      await Future.delayed(const Duration(seconds: 2));
      
      final user = AppUser(
        id: 'owner_123',
        email: email,
        name: 'Restaurant Owner',
        role: UserRole.restaurantOwner,
        isVerified: true,
        createdAt: DateTime.now().subtract(const Duration(days: 60)),
        lastLoginAt: DateTime.now(),
      );
      
      await _saveUserToStorage(user, 'owner_token_123');
      
      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        error: 'Login failed: $e',
      );
    }
  }

  /// Login as driver
  Future<void> loginAsDriver({
    required String email,
    required String password,
  }) async {
    try {
      state = state.copyWith(status: AuthStatus.loading);
      
      await Future.delayed(const Duration(seconds: 2));
      
      final user = AppUser(
        id: 'driver_123',
        email: email,
        name: 'Driver User',
        role: UserRole.driver,
        isVerified: true,
        createdAt: DateTime.now().subtract(const Duration(days: 45)),
        lastLoginAt: DateTime.now(),
      );
      
      await _saveUserToStorage(user, 'driver_token_123');
      
      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        error: 'Login failed: $e',
      );
    }
  }

  /// Login as admin
  Future<void> loginAsAdmin({
    required String email,
    required String password,
  }) async {
    try {
      state = state.copyWith(status: AuthStatus.loading);
      
      await Future.delayed(const Duration(seconds: 2));
      
      final user = AppUser(
        id: 'admin_123',
        email: email,
        name: 'Admin User',
        role: UserRole.admin,
        isVerified: true,
        createdAt: DateTime.now().subtract(const Duration(days: 90)),
        lastLoginAt: DateTime.now(),
      );
      
      await _saveUserToStorage(user, 'admin_token_123');
      
      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        error: 'Login failed: $e',
      );
    }
  }

  /// Register user
  Future<void> register({
    required String email,
    required String password,
    required String name,
    String? phone,
    UserRole role = UserRole.customer,
  }) async {
    try {
      state = state.copyWith(status: AuthStatus.loading);
      
      await Future.delayed(const Duration(seconds: 2));
      
      final user = AppUser(
        id: 'user_${DateTime.now().millisecondsSinceEpoch}',
        email: email,
        name: name,
        phone: phone,
        role: role,
        isVerified: false,
        createdAt: DateTime.now(),
        lastLoginAt: DateTime.now(),
      );
      
      await _saveUserToStorage(user, 'token_${user.id}');
      
      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        error: 'Registration failed: $e',
      );
    }
  }

  /// Logout user
  Future<void> logout() async {
    try {
      await _storage.delete(key: _userKey);
      await _storage.delete(key: _tokenKey);
      
      state = const AuthState(status: AuthStatus.unauthenticated);
    } catch (e) {
      state = state.copyWith(
        error: 'Logout failed: $e',
      );
    }
  }

  /// Update user profile
  Future<void> updateUser(AppUser updatedUser) async {
    try {
      final token = await _storage.read(key: _tokenKey);
      if (token != null) {
        await _saveUserToStorage(updatedUser, token);
        state = state.copyWith(user: updatedUser);
      }
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to update user: $e',
      );
    }
  }

  /// Save user to secure storage
  Future<void> _saveUserToStorage(AppUser user, String token) async {
    await _storage.write(key: _userKey, value: jsonEncode(user.toJson()));
    await _storage.write(key: _tokenKey, value: token);
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }
}
