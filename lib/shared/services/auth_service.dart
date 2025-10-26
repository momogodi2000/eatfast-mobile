import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/services/api/api_client.dart';

/// Authentication service for managing user login, logout, and token handling.
class AuthService {
  final ApiClient _apiClient;

  AuthService(this._apiClient);

  /// Login with email and password
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _apiClient.post('/auth/login', data: {
      'email': email,
      'password': password,
    });
    return response.data;
  }

  /// Register new user
  Future<Map<String, dynamic>> register(Map<String, dynamic> userData) async {
    final response = await _apiClient.post('/auth/register', data: userData);
    return response.data;
  }

  /// Logout user
  Future<void> logout() async {
    await _apiClient.post('/auth/logout');
    // TODO: Clear local tokens
  }

  /// Refresh access token
  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    final response = await _apiClient.post('/auth/refresh', data: {
      'refreshToken': refreshToken,
    });
    return response.data;
  }

  /// Get current user profile
  Future<Map<String, dynamic>> getCurrentUser() async {
    final response = await _apiClient.get('/auth/me');
    return response.data;
  }

  /// Update user profile
  Future<Map<String, dynamic>> updateProfile(Map<String, dynamic> profileData) async {
    final response = await _apiClient.put('/auth/profile', data: profileData);
    return response.data;
  }

  /// Change password
  Future<void> changePassword(String oldPassword, String newPassword) async {
    await _apiClient.post('/auth/change-password', data: {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    });
  }

  /// Request password reset
  Future<void> requestPasswordReset(String email) async {
    await _apiClient.post('/auth/forgot-password', data: {'email': email});
  }

  /// Reset password with token
  Future<void> resetPassword(String token, String newPassword) async {
    await _apiClient.post('/auth/reset-password', data: {
      'token': token,
      'newPassword': newPassword,
    });
  }
}

// Provider
final authServiceProvider = Provider<AuthService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuthService(apiClient);
});

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());