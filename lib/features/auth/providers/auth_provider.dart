import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:local_auth/local_auth.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/security/secure_storage_service.dart';
import '../../../core/security/biometric_auth_service.dart';
import '../domain/models.dart';

/// Authentication state management with Riverpod
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState.initial()) {
    _initialize();
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );

  /// Initialize authentication state
  Future<void> _initialize() async {
    try {
      // Check if user has valid tokens
      final hasTokens = await SecureStorageService.hasValidTokens();
      
      if (hasTokens) {
        // Load user data and validate
        await checkAuthStatus();
      } else {
        state = const AuthState.unauthenticated();
      }
    } catch (e) {
      state = const AuthState.unauthenticated();
    }
  }

  /// Login with email and password
  Future<void> loginWithEmail(String email, String password) async {
    state = const AuthState.loading();

    try {
      // Check if account is locked
      if (await SecureStorageService.isAccountLocked()) {
        final remainingTime = await SecureStorageService.getRemainingLockTime();
        final minutes = remainingTime?.inMinutes ?? 0;
        state = AuthState.error(
          message: 'Compte temporairement verrouillé. Réessayez dans $minutes minutes.',
        );
        return;
      }

      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      // For demo purposes, accept any valid email format with password >= 6 chars
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
      if (emailRegex.hasMatch(email) && password.length >= 6) {
        // Reset failed attempts on successful login
        await SecureStorageService.resetFailedLoginAttempts();

        final user = User(
          id: 'user_${DateTime.now().millisecondsSinceEpoch}',
          name: 'Demo User',
          email: email,
          phone: '+237698765432',
          profilePicture: null,
          addresses: const [],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final authResponse = AuthResponse(
          user: user,
          token: 'demo_token_${DateTime.now().millisecondsSinceEpoch}',
          refreshToken: 'demo_refresh_token_${DateTime.now().millisecondsSinceEpoch}',
          expiresAt: DateTime.now().add(const Duration(hours: 24)),
        );

        await _saveAuthData(authResponse);
        state = AuthState.authenticated(user: user);
      } else {
        await SecureStorageService.incrementFailedLoginAttempts();
        await SecureStorageService.storeLoginAttempt();
        state = const AuthState.error(message: 'Email ou mot de passe incorrect');
      }
    } catch (e) {
      await SecureStorageService.incrementFailedLoginAttempts();
      await SecureStorageService.storeLoginAttempt();
      state = AuthState.error(message: 'Erreur de connexion: ${e.toString()}');
    }
  }

  /// Register new user
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    state = const AuthState.loading();
    
    try {
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      
      // Mock registration - replace with real API call
      final user = User(
        id: 'user_${DateTime.now().millisecondsSinceEpoch}',
        name: name,
        email: email,
        phone: phone,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      
      final authResponse = AuthResponse(
        user: user,
        token: 'mock_token_${DateTime.now().millisecondsSinceEpoch}',
        refreshToken: 'mock_refresh_token_${DateTime.now().millisecondsSinceEpoch}',
        expiresAt: DateTime.now().add(const Duration(hours: 24)),
      );
      
      await _saveAuthData(authResponse);
      state = AuthState.authenticated(user: user);
    } catch (e) {
      state = AuthState.error(message: 'Erreur d\'inscription: ${e.toString()}');
    }
  }

  /// Login with phone number
  Future<void> loginWithPhone(String phoneNumber) async {
    state = const AuthState.loading();
    
    try {
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
      
      // Mock phone login - replace with real API call
      state = AuthState.otpSent(phoneNumber: phoneNumber);
    } catch (e) {
      state = AuthState.error(message: 'Erreur d\'envoi du code: ${e.toString()}');
    }
  }

  /// Verify OTP
  Future<void> verifyOtp(String phoneNumber, String otp) async {
    state = const AuthState.loading();
    
    try {
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      
      // Mock OTP verification - replace with real API call
      if (otp == '123456') {
        final user = User(
          id: 'user_phone_${DateTime.now().millisecondsSinceEpoch}',
          name: 'Utilisateur',
          email: '',
          phone: phoneNumber,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        
        final authResponse = AuthResponse(
          user: user,
          token: 'mock_token_otp_${DateTime.now().millisecondsSinceEpoch}',
          refreshToken: 'mock_refresh_token_otp_${DateTime.now().millisecondsSinceEpoch}',
          expiresAt: DateTime.now().add(const Duration(hours: 24)),
        );
        
        await _saveAuthData(authResponse);
        state = AuthState.authenticated(user: user);
      } else {
        state = const AuthState.error(message: 'Code de vérification incorrect');
      }
    } catch (e) {
      state = AuthState.error(message: 'Erreur de vérification: ${e.toString()}');
    }
  }

  /// Logout user
  Future<void> logout() async {
    try {
      // Sign out from Google if signed in
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(AppConstants.keyUserToken);
      await prefs.remove(AppConstants.keyUserData);
      
      // Clear tokens but keep biometric credentials
      await SecureStorageService.clearTokens();
      
      state = const AuthState.unauthenticated();
    } catch (e) {
      state = AuthState.error(message: 'Erreur de déconnexion: ${e.toString()}');
    }
  }

  /// Google Sign In
  Future<void> signInWithGoogle() async {
    state = const AuthState.loading();
    
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      
      if (googleUser == null) {
        state = const AuthState.unauthenticated();
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create user from Google data
      final user = User(
        id: googleUser.id,
        email: googleUser.email,
        name: googleUser.displayName ?? 'Google User',
        phone: '',
        profilePicture: googleUser.photoUrl,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final authResponse = AuthResponse(
        user: user,
        token: googleAuth.accessToken ?? '',
        refreshToken: googleAuth.idToken ?? '',
        expiresAt: DateTime.now().add(const Duration(hours: 24)),
      );

      await _saveAuthData(authResponse);
      state = AuthState.authenticated(user: user);
    } catch (e) {
      state = AuthState.error(message: 'Erreur de connexion Google: ${e.toString()}');
    }
  }

  /// Biometric authentication
  Future<void> authenticateWithBiometrics() async {
    state = const AuthState.loading();
    
    try {
      final canUse = await BiometricAuthService.canUseBiometricLogin();
      if (!canUse) {
        state = const AuthState.error(
          message: 'Authentification biométrique non disponible',
        );
        return;
      }

      final credentials = await BiometricAuthService.authenticateAndGetCredentials();
      if (credentials == null) {
        state = const AuthState.error(
          message: 'Échec de l\'authentification biométrique',
        );
        return;
      }

      // Use stored credentials to authenticate
      await loginWithEmail(
        credentials['email']!,
        credentials['hashedPassword']!,
      );
    } catch (e) {
      state = AuthState.error(
        message: 'Erreur biométrique: ${e.toString()}',
      );
    }
  }

  /// Setup biometric login
  Future<bool> setupBiometricLogin({
    required String email,
    required String password,
  }) async {
    try {
      return await BiometricAuthService.setupBiometricLogin(
        email: email,
        password: password,
      );
    } catch (e) {
      return false;
    }
  }

  /// Check if biometric authentication is available
  Future<bool> isBiometricAvailable() async {
    return await BiometricAuthService.isAvailable();
  }

  /// Get available biometric types
  Future<List<BiometricType>> getAvailableBiometrics() async {
    return await BiometricAuthService.getAvailableBiometrics();
  }

  /// Check if biometric login can be used
  Future<bool> canUseBiometricLogin() async {
    return await BiometricAuthService.canUseBiometricLogin();
  }

  /// Check if user is authenticated
  Future<void> checkAuthStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(AppConstants.keyUserToken);
      final userData = prefs.getString(AppConstants.keyUserData);
      
      if (token != null && userData != null) {
        // In real app, verify token with server
        final userMap = Map<String, dynamic>.from(
          Uri.splitQueryString(userData),
        );
        final user = User.fromJson(userMap);
        state = AuthState.authenticated(user: user);
      } else {
        state = const AuthState.unauthenticated();
      }
    } catch (e) {
      state = const AuthState.unauthenticated();
    }
  }

  /// Forgot password
  Future<void> forgotPassword(String email) async {
    state = const AuthState.loading();
    
    try {
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      
      // Mock forgot password - replace with real API call
      state = const AuthState.passwordResetSent();
    } catch (e) {
      state = AuthState.error(message: 'Erreur d\'envoi du mail: ${e.toString()}');
    }
  }

  /// Save authentication data locally
  Future<void> _saveAuthData(AuthResponse authResponse) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.keyUserToken, authResponse.token);
    await prefs.setString(AppConstants.keyUserData, authResponse.user.toString());
    
    // Store tokens securely
    await SecureStorageService.storeAccessToken(authResponse.token);
    await SecureStorageService.storeRefreshToken(authResponse.refreshToken);
  }

  /// Update user profile
  Future<void> updateProfile({
    String? fullName,
    String? phoneNumber,
    String? avatarUrl,
  }) async {
    if (state is AuthAuthenticated) {
      final currentState = state as AuthAuthenticated;
      final updatedUser = currentState.user.copyWith(
        name: fullName,
        phone: phoneNumber,
        profilePicture: avatarUrl,
        updatedAt: DateTime.now(),
      );
      
      // Save updated user data
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstants.keyUserData, updatedUser.toString());
      
      state = AuthState.authenticated(user: updatedUser);
    }
  }

  /// Clear error state
  void clearError() {
    if (state is AuthError) {
      state = const AuthState.unauthenticated();
    }
  }
}

/// Authentication states
sealed class AuthState {
  const AuthState();
  
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.authenticated({required User user}) = AuthAuthenticated;
  const factory AuthState.unauthenticated() = AuthUnauthenticated;
  const factory AuthState.error({required String message}) = AuthError;
  const factory AuthState.otpSent({required String phoneNumber}) = AuthOtpSent;
  const factory AuthState.passwordResetSent() = AuthPasswordResetSent;
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthAuthenticated extends AuthState {
  final User user;
  const AuthAuthenticated({required this.user});
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class AuthError extends AuthState {
  final String message;
  const AuthError({required this.message});
}

class AuthOtpSent extends AuthState {
  final String phoneNumber;
  const AuthOtpSent({required this.phoneNumber});
}

class AuthPasswordResetSent extends AuthState {
  const AuthPasswordResetSent();
}

/// Provider for authentication state
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

/// Provider for current user
final currentUserProvider = Provider<User?>((ref) {
  final authState = ref.watch(authProvider);
  return authState is AuthAuthenticated ? authState.user : null;
});

/// Provider to check if user is authenticated
final isAuthenticatedProvider = Provider<bool>((ref) {
  final authState = ref.watch(authProvider);
  return authState is AuthAuthenticated;
});
