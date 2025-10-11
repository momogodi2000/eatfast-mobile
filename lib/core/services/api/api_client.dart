import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../constants/api_constants.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;
  
  late Dio dio;
  final _storage = const FlutterSecureStorage();
  
  ApiClient._internal() {
    dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));
    
    _setupInterceptors();
  }
  
  void _setupInterceptors() {
    // Request interceptor - Add auth token
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Add auth token if available
        final token = await _storage.read(key: 'auth_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        // Add guest session header if available and no auth token
        if (token == null) {
          final guestSessionId = await _storage.read(key: 'guest_session_id');
          if (guestSessionId != null) {
            options.headers['X-Guest-Session'] = guestSessionId;
          }
        }

        // Add mobile-specific headers
        options.headers['X-Device-Type'] = 'flutter_mobile';
        options.headers['X-App-Version'] = '1.0.0';
        options.headers['X-Platform'] = 'mobile';

        return handler.next(options);
      },
      
      onResponse: (response, handler) {
        return handler.next(response);
      },
      
      onError: (error, handler) async {
        // Handle token refresh on 401
        if (error.response?.statusCode == 401) {
          final refreshed = await _handleTokenRefresh();
          if (refreshed) {
            // Retry original request
            final opts = error.requestOptions;
            final token = await _storage.read(key: 'auth_token');
            opts.headers['Authorization'] = 'Bearer $token';
            
            try {
              final response = await dio.fetch(opts);
              return handler.resolve(response);
            } catch (e) {
              return handler.next(error);
            }
          } else {
            // Clear tokens on refresh failure
            await _storage.delete(key: 'auth_token');
            await _storage.delete(key: 'refresh_token');
            await _storage.delete(key: 'user_data');
          }
        }
        
        return handler.next(error);
      },
    ));
    
    // Logging interceptor for debug mode
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }
  
  Future<bool> _handleTokenRefresh() async {
    try {
      final refreshToken = await _storage.read(key: 'refresh_token');
      if (refreshToken == null) return false;
      
      final response = await dio.post(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
        options: Options(headers: {'Authorization': null}), // Remove auth for refresh
      );
      
      if (response.statusCode == 200) {
        final newToken = response.data['token'];
        final newRefreshToken = response.data['refreshToken'];
        
        await _storage.write(key: 'auth_token', value: newToken);
        await _storage.write(key: 'refresh_token', value: newRefreshToken);
        
        return true;
      }
      
      return false;
    } catch (e) {
      return false;
    }
  }
  
  // Generic API methods
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }
  
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
  
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
  
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
  
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await dio.patch<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  // Auth token management methods
  void setAuthToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void clearAuthToken() {
    dio.options.headers.remove('Authorization');
  }

  // Guest session management methods
  Future<void> setGuestSession(String sessionId) async {
    await _storage.write(key: 'guest_session_id', value: sessionId);
  }

  Future<String?> getGuestSession() async {
    return await _storage.read(key: 'guest_session_id');
  }

  Future<void> clearGuestSession() async {
    await _storage.delete(key: 'guest_session_id');
  }

  // Clear all authentication data (for logout)
  Future<void> clearAllAuth() async {
    await _storage.delete(key: 'auth_token');
    await _storage.delete(key: 'refresh_token');
    await _storage.delete(key: 'user_data');
    await _storage.delete(key: 'guest_session_id');
    clearAuthToken();
  }
}

/// Provider for ApiClient - use this instead of api_client_service.dart
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});
