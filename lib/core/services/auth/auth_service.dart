import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../network/api_client.dart';
import '../../constants/api_constants.dart';
import '../../security/secure_storage_service.dart';
import '../../../core/auth/models/app_user.dart';

/// Authentication service that communicates with EatFast backend
class AuthService {
  final ApiClient _apiClient;
  final SecureStorageService _secureStorage;

  AuthService(this._apiClient, this._secureStorage);

  // Current user state
  AppUser? _currentUser;
  AppUser? get currentUser => _currentUser;
  
  // Check if user is authenticated
  Future<bool> get isAuthenticated async {
    final token = await _secureStorage.getToken();
    return token != null;
  }
  
  /// Login user with email and password
  Future<AuthResult> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.authLogin,
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        
        // Check if 2FA is required
        if (data['data'] != null && data['data']['requiresTwoFactor'] == true) {
          return AuthResult.success(
            user: null,
            token: null,
            refreshToken: null,
            requiresTwoFactor: true,
            userId: data['data']['userId'],
            twoFactorMethod: data['data']['method'],
          );
        }

        // Normal login success
        final user = AppUser.fromJson(data['data']['user']);
        final token = data['data']['token'];
        final refreshToken = data['data']['refreshToken'];

        // Store tokens securely
        await _secureStorage.storeToken(token);
        await _secureStorage.storeRefreshToken(refreshToken);
        await _secureStorage.storeUser(user);

        // Set auth token in API client
        _apiClient.setAuthToken(token);
        _currentUser = user;

        return AuthResult.success(
          user: user,
          token: token,
          refreshToken: refreshToken,
        );
      } else {
        return AuthResult.failure(response.data['error'] ?? 'Login failed');
      }
    } on DioException catch (e) {
      return AuthResult.failure(_handleDioError(e));
    } catch (e) {
      return AuthResult.failure('An unexpected error occurred');
    }
  }
  
  /// Login user with phone number
  Future<AuthResult> loginWithPhone({
    required String phone,
    required String password,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.authLogin,
        data: {
          'phone': phone,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        
        // Check if 2FA is required
        if (data['data'] != null && data['data']['requiresTwoFactor'] == true) {
          return AuthResult.success(
            user: null,
            token: null,
            refreshToken: null,
            requiresTwoFactor: true,
            userId: data['data']['userId'],
            twoFactorMethod: data['data']['method'],
          );
        }

        // Normal login success
        final user = AppUser.fromJson(data['data']['user']);
        final token = data['data']['token'];
        final refreshToken = data['data']['refreshToken'];

        // Store tokens securely
        await _secureStorage.storeToken(token);
        await _secureStorage.storeRefreshToken(refreshToken);
        await _secureStorage.storeUser(user);

        // Set auth token in API client
        _apiClient.setAuthToken(token);
        _currentUser = user;

        return AuthResult.success(
          user: user,
          token: token,
          refreshToken: refreshToken,
        );
      } else {
        return AuthResult.failure(response.data['error'] ?? 'Login failed');
      }
    } on DioException catch (e) {
      return AuthResult.failure(_handleDioError(e));
    } catch (e) {
      return AuthResult.failure('An unexpected error occurred');
    }
  }
  
  /// Register new user
  Future<AuthResult> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    String role = 'customer',
    required String city,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.authRegister,
        data: {
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
          'phone': phone,
          'role': role,
          'city': city,
        },
      );

      if (response.statusCode == 201) {
        return AuthResult.success(
          message: 'Registration successful. Please login.',
        );
      } else {
        return AuthResult.failure(response.data['error'] ?? 'Registration failed');
      }
    } on DioException catch (e) {
      return AuthResult.failure(_handleDioError(e));
    } catch (e) {
      return AuthResult.failure('An unexpected error occurred');
    }
  }
  
  /// Logout user
  Future<AuthResult> logout() async {
    try {
      final refreshToken = await _secureStorage.getRefreshToken();
      if (refreshToken != null) {
        await _apiClient.post(
          ApiConstants.authRevoke,
          data: {'refresh_token': refreshToken},
        );
      }
    } catch (e) {
      // Continue with logout even if backend call fails
    }

    // Clear local storage
    await _secureStorage.clearAll();
    _apiClient.clearAuthToken();
    _currentUser = null;

    return AuthResult.success(
      message: 'Logged out successfully',
    );
  }
  
  /// Send OTP to phone number
  Future<AuthResult> sendOtp({required String phone}) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.authSendOtp,
        data: {'phone': phone},
      );

      if (response.statusCode == 200) {
        return AuthResult.success(
          message: response.data['message'] ?? 'OTP sent successfully',
        );
      } else {
        return AuthResult.failure(response.data['error'] ?? 'Failed to send OTP');
      }
    } on DioException catch (e) {
      return AuthResult.failure(_handleDioError(e));
    } catch (e) {
      return AuthResult.failure('An unexpected error occurred');
    }
  }

  /// Verify OTP code
  Future<AuthResult> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.authVerifyOtp,
        data: {
          'phone': phone,
          'otp': otp,
        },
      );

      if (response.statusCode == 200) {
        return AuthResult.success(
          message: response.data['message'] ?? 'Phone verified successfully',
        );
      } else {
        return AuthResult.failure(response.data['error'] ?? 'Invalid OTP code');
      }
    } on DioException catch (e) {
      return AuthResult.failure(_handleDioError(e));
    } catch (e) {
      return AuthResult.failure('An unexpected error occurred');
    }
  }

  /// Resend OTP code
  Future<AuthResult> resendOtp({required String phone}) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.authResendOtp,
        data: {'phone': phone},
      );

      if (response.statusCode == 200) {
        return AuthResult.success(
          message: response.data['message'] ?? 'New OTP sent successfully',
        );
      } else {
        return AuthResult.failure(response.data['error'] ?? 'Failed to resend OTP');
      }
    } on DioException catch (e) {
      return AuthResult.failure(_handleDioError(e));
    } catch (e) {
      return AuthResult.failure('An unexpected error occurred');
    }
  }

  /// Request password reset
  Future<AuthResult> requestPasswordReset({required String email}) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.authForgotPassword,
        data: {'email': email},
      );

      if (response.statusCode == 200) {
        return AuthResult.success(
          message: response.data['message'] ?? 'Reset code sent to your email',
        );
      } else {
        return AuthResult.failure(response.data['error'] ?? 'Failed to send reset code');
      }
    } on DioException catch (e) {
      return AuthResult.failure(_handleDioError(e));
    } catch (e) {
      return AuthResult.failure('An unexpected error occurred');
    }
  }

  /// Verify password reset code
  Future<AuthResult> verifyResetCode({
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

      if (response.statusCode == 200) {
        final resetToken = response.data['resetToken'];
        return AuthResult.success(
          resetToken: resetToken,
          message: response.data['message'] ?? 'Code verified successfully',
        );
      } else {
        return AuthResult.failure(response.data['error'] ?? 'Invalid or expired code');
      }
    } on DioException catch (e) {
      return AuthResult.failure(_handleDioError(e));
    } catch (e) {
      return AuthResult.failure('An unexpected error occurred');
    }
  }

  /// Reset password with token
  Future<AuthResult> resetPassword({
    required String resetToken,
    required String newPassword,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.authResetPassword,
        data: {
          'resetToken': resetToken,
          'newPassword': newPassword,
        },
      );

      if (response.statusCode == 200) {
        return AuthResult.success(
          message: response.data['message'] ?? 'Password reset successfully',
        );
      } else {
        return AuthResult.failure(response.data['error'] ?? 'Failed to reset password');
      }
    } on DioException catch (e) {
      return AuthResult.failure(_handleDioError(e));
    } catch (e) {
      return AuthResult.failure('An unexpected error occurred');
    }
  }

  /// Verify two-factor authentication
  Future<AuthResult> verifyTwoFactor({
    required String userId,
    required String code,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.authVerifyTwoFactor,
        data: {
          'userId': userId,
          'code': code,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final user = AppUser.fromJson(data['data']['user']);
        final token = data['data']['token'];
        final refreshToken = data['data']['refreshToken'];

        // Store tokens securely
        await _secureStorage.storeToken(token);
        await _secureStorage.storeRefreshToken(refreshToken);
        await _secureStorage.storeUser(user);

        // Set auth token in API client
        _apiClient.setAuthToken(token);
        _currentUser = user;

        return AuthResult.success(
          user: user,
          token: token,
          refreshToken: refreshToken,
          message: 'Two-factor verification successful',
        );
      } else {
        return AuthResult.failure(response.data['error'] ?? 'Invalid verification code');
      }
    } on DioException catch (e) {
      return AuthResult.failure(_handleDioError(e));
    } catch (e) {
      return AuthResult.failure('An unexpected error occurred');
    }
  }

  /// Get current user profile
  Future<AuthResult> getCurrentUser() async {
    try {
      final response = await _apiClient.get(ApiConstants.authMe);

      if (response.statusCode == 200) {
        final user = AppUser.fromJson(response.data['data']);
        await _secureStorage.storeUser(user);
        _currentUser = user;
        
        return AuthResult.success(user: user);
      } else {
        return AuthResult.failure(response.data['error'] ?? 'Failed to get user profile');
      }
    } on DioException catch (e) {
      return AuthResult.failure(_handleDioError(e));
    } catch (e) {
      return AuthResult.failure('An unexpected error occurred');
    }
  }

  /// Update user profile
  Future<AuthResult> updateProfile(AppUser user) async {
    try {
      // Make sure to only send fields that are allowed to be updated.
      final updateData = {
        'firstName': user.firstName,
        'lastName': user.lastName,
        'phone': user.phone,
        'avatar': user.avatar,
      };

      final response = await _apiClient.put(
        ApiConstants.clientProfile, // Use the correct endpoint for updating user profile
        data: updateData,
      );

      if (response.statusCode == 200) {
        final updatedUser = AppUser.fromJson(response.data['data']);
        await _secureStorage.storeUser(updatedUser);
        _currentUser = updatedUser;
        
        return AuthResult.success(user: updatedUser);
      } else {
        return AuthResult.failure(response.data['error'] ?? 'Failed to update profile');
      }
    } on DioException catch (e) {
      return AuthResult.failure(_handleDioError(e));
    } catch (e) {
      return AuthResult.failure('An unexpected error occurred: $e');
    }
  }

  /// Initialize authentication state from stored tokens
  Future<AuthResult> initializeAuth() async {
    try {
      final token = await _secureStorage.getToken();
      final user = await _secureStorage.getUser();

      if (token != null && user != null) {
        _apiClient.setAuthToken(token);
        _currentUser = user;
        
        // Try to get fresh user data
        final userResult = await getCurrentUser();
        if (userResult.isSuccess) {
          return AuthResult.success(user: userResult.user);
        }
        
        // Fallback to stored user if API call fails
        return AuthResult.success(user: user);
      }

      return AuthResult.failure('No stored authentication');
    } catch (e) {
      return AuthResult.failure('Failed to initialize authentication');
    }
  }
  
  String _handleDioError(DioException e) {
    if (e.response?.data != null && e.response?.data['error'] != null) {
      return e.response!.data['error'];
    }
    
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.badResponse:
        return 'Server error. Please try again later.';
      case DioExceptionType.connectionError:
        return 'Network error. Please check your internet connection.';
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }
}

/// Authentication result class
class AuthResult {
  final bool isSuccess;
  final AppUser? user;
  final String? token;
  final String? refreshToken;
  final String? resetToken;
  final String? message;
  final String? error;
  final bool requiresTwoFactor;
  final String? userId;
  final String? twoFactorMethod;

  AuthResult.success({
    this.user,
    this.token,
    this.refreshToken,
    this.resetToken,
    this.message,
    this.requiresTwoFactor = false,
    this.userId,
    this.twoFactorMethod,
  })  : isSuccess = true,
        error = null;

  AuthResult.failure(this.error)
      : isSuccess = false,
        user = null,
        token = null,
        refreshToken = null,
        resetToken = null,
        message = null,
        requiresTwoFactor = false,
        userId = null,
        twoFactorMethod = null;
}

// Providers
final authServiceProvider = Provider<AuthService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final secureStorage = ref.watch(secureStorageServiceProvider);
  return AuthService(apiClient, secureStorage);
});
