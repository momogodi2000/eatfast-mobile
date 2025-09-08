import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../data/auth_api_repository.dart';
import '../domain/auth_user.dart';

/// Implementation of AuthApiRepository using HTTP API calls
class AuthApiRepositoryImpl implements AuthApiRepository {
  final ApiClient _apiClient;

  AuthApiRepositoryImpl(this._apiClient);

  @override
  Future<AuthResponse> login(LoginRequest request) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.login,
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return AuthResponse.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['message'] ?? 'Login failed',
        );
      }
    } on DioException catch (e) {
      throw _handleAuthError(e);
    } catch (e) {
      throw Exception('Unexpected error during login: $e');
    }
  }

  @override
  Future<AuthResponse> register(RegisterRequest request) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.register,
        data: request.toJson(),
      );

      if (response.statusCode == 201) {
        return AuthResponse.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['message'] ?? 'Registration failed',
        );
      }
    } on DioException catch (e) {
      throw _handleAuthError(e);
    } catch (e) {
      throw Exception('Unexpected error during registration: $e');
    }
  }

  @override
  Future<void> requestPasswordReset(PasswordResetRequest request) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.requestPasswordReset,
        data: request.toJson(),
      );

      if (response.statusCode != 200) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['message'] ?? 'Password reset request failed',
        );
      }
    } on DioException catch (e) {
      throw _handleAuthError(e);
    } catch (e) {
      throw Exception('Unexpected error during password reset request: $e');
    }
  }

  @override
  Future<void> resetPasswordWithOtp(String phone, String otp, String newPassword) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.resetPassword,
        data: {
          'phone': phone,
          'otp': otp,
          'newPassword': newPassword,
        },
      );

      if (response.statusCode != 200) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['message'] ?? 'Password reset failed',
        );
      }
    } on DioException catch (e) {
      throw _handleAuthError(e);
    } catch (e) {
      throw Exception('Unexpected error during password reset: $e');
    }
  }

  @override
  Future<AuthResponse> verifyOtp(OtpVerificationRequest request) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.verifyOtp,
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return AuthResponse.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['message'] ?? 'OTP verification failed',
        );
      }
    } on DioException catch (e) {
      throw _handleAuthError(e);
    } catch (e) {
      throw Exception('Unexpected error during OTP verification: $e');
    }
  }

  @override
  Future<void> resendOtp(String phone, String type) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.resendOtp,
        data: {
          'phone': phone,
          'type': type,
        },
      );

      if (response.statusCode != 200) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['message'] ?? 'Failed to resend OTP',
        );
      }
    } on DioException catch (e) {
      throw _handleAuthError(e);
    } catch (e) {
      throw Exception('Unexpected error during OTP resend: $e');
    }
  }

  @override
  Future<void> changePassword(ChangePasswordRequest request) async {
    try {
      final response = await _apiClient.put(
        ApiEndpoints.changePassword,
        data: request.toJson(),
      );

      if (response.statusCode != 200) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['message'] ?? 'Password change failed',
        );
      }
    } on DioException catch (e) {
      throw _handleAuthError(e);
    } catch (e) {
      throw Exception('Unexpected error during password change: $e');
    }
  }

  @override
  Future<AuthResponse> refreshToken(String refreshToken) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.refreshToken,
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        return AuthResponse.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['message'] ?? 'Token refresh failed',
        );
      }
    } on DioException catch (e) {
      throw _handleAuthError(e);
    } catch (e) {
      throw Exception('Unexpected error during token refresh: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      final response = await _apiClient.post(ApiEndpoints.logout);

      if (response.statusCode != 200) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['message'] ?? 'Logout failed',
        );
      }
    } on DioException catch (e) {
      throw _handleAuthError(e);
    } catch (e) {
      throw Exception('Unexpected error during logout: $e');
    }
  }

  @override
  Future<AuthUser> getCurrentUser() async {
    try {
      final response = await _apiClient.get(ApiEndpoints.currentUser);

      if (response.statusCode == 200) {
        return AuthUser.fromJson(response.data['user']);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['message'] ?? 'Failed to get user info',
        );
      }
    } on DioException catch (e) {
      throw _handleAuthError(e);
    } catch (e) {
      throw Exception('Unexpected error getting user info: $e');
    }
  }

  @override
  Future<void> verifyEmail(String token) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.verifyEmail,
        data: {'token': token},
      );

      if (response.statusCode != 200) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['message'] ?? 'Email verification failed',
        );
      }
    } on DioException catch (e) {
      throw _handleAuthError(e);
    } catch (e) {
      throw Exception('Unexpected error during email verification: $e');
    }
  }

  @override
  Future<void> verifyPhone(String phone, String otp) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.verifyPhone,
        data: {
          'phone': phone,
          'otp': otp,
        },
      );

      if (response.statusCode != 200) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['message'] ?? 'Phone verification failed',
        );
      }
    } on DioException catch (e) {
      throw _handleAuthError(e);
    } catch (e) {
      throw Exception('Unexpected error during phone verification: $e');
    }
  }

  @override
  Future<AuthResponse> socialLogin(String provider, String token) async {
    try {
      final response = await _apiClient.post(
        '${ApiEndpoints.socialLogin}/$provider',
        data: {'token': token},
      );

      if (response.statusCode == 200) {
        return AuthResponse.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.data['message'] ?? 'Social login failed',
        );
      }
    } on DioException catch (e) {
      throw _handleAuthError(e);
    } catch (e) {
      throw Exception('Unexpected error during social login: $e');
    }
  }

  /// Helper method to handle and transform DioException into AuthError
  Exception _handleAuthError(DioException e) {
    final response = e.response;
    
    if (response != null) {
      final data = response.data;
      
      if (data is Map<String, dynamic>) {
        // Check for validation errors
        if (data.containsKey('errors') && data['errors'] is Map) {
          final errors = data['errors'] as Map<String, dynamic>;
          final field = errors.keys.first;
          final message = errors[field] is List 
            ? errors[field][0] 
            : errors[field].toString();
            
          return Exception('$field: $message');
        }
        
        // Standard error message
        final message = data['message'] ?? data['error'] ?? 'Authentication failed';
        return Exception(message);
      }
    }
    
    // Network or other errors
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Connection timeout. Please check your internet connection.');
      case DioExceptionType.connectionError:
        return Exception('Unable to connect to server. Please try again.');
      default:
        return Exception(e.message ?? 'Authentication failed');
    }
  }
}
