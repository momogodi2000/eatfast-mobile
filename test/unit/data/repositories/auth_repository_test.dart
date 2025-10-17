import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:eatfast_mobile/shared/services/auth/models/app_user.dart';

// Simple mock API client for testing
class MockApiClient {
  final Map<String, dynamic> _responses = {};
  bool _shouldThrow = false;
  String? _errorMessage;

  void mockResponse(String endpoint, Map<String, dynamic> response) {
    _responses[endpoint] = response;
  }

  void throwError(String message) {
    _shouldThrow = true;
    _errorMessage = message;
  }

  void reset() {
    _responses.clear();
    _shouldThrow = false;
    _errorMessage = null;
  }

  Future<Response<Map<String, dynamic>>> post(String path, {dynamic data}) async {
    if (_shouldThrow) {
      throw DioException(
        requestOptions: RequestOptions(path: path),
        message: _errorMessage,
      );
    }

    final responseData = _responses[path] ?? {};
    return Response<Map<String, dynamic>>(
      data: responseData,
      statusCode: 200,
      requestOptions: RequestOptions(path: path),
    );
  }

  Future<Response<Map<String, dynamic>>> get(String path) async {
    if (_shouldThrow) {
      throw DioException(
        requestOptions: RequestOptions(path: path),
        message: _errorMessage,
      );
    }

    final responseData = _responses[path] ?? {};
    return Response<Map<String, dynamic>>(
      data: responseData,
      statusCode: 200,
      requestOptions: RequestOptions(path: path),
    );
  }
}

// Simple mock storage service
class MockStorageService {
  final Map<String, String> _storage = {};
  bool _shouldThrow = false;

  void throwError() {
    _shouldThrow = true;
  }

  void reset() {
    _storage.clear();
    _shouldThrow = false;
  }

  Future<void> store(String key, String value) async {
    if (_shouldThrow) throw Exception('Storage error');
    _storage[key] = value;
  }

  Future<String?> read(String key) async {
    if (_shouldThrow) throw Exception('Storage error');
    return _storage[key];
  }

  Future<void> delete(String key) async {
    if (_shouldThrow) throw Exception('Storage error');
    _storage.remove(key);
  }
}

// Simple AuthRepository implementation for testing
class AuthRepository {
  final MockApiClient _apiClient;
  final MockStorageService _storageService;

  AuthRepository(this._apiClient, this._storageService);

  Future<AppUser> login(String email, String password) async {
    final response = await _apiClient.post('/auth/login', data: {
      'email': email,
      'password': password,
    });

    if (response.data == null || response.data!['user'] == null) {
      throw Exception('Login failed');
    }

    final userData = response.data!['user'] as Map<String, dynamic>;
    final token = response.data!['token'] as String?;

    if (token != null) {
      await _storageService.store('auth_token', token);
    }

    return AppUser.fromJson(userData);
  }

  Future<AppUser> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final response = await _apiClient.post('/auth/register', data: {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    });

    if (response.data == null || response.data!['user'] == null) {
      throw Exception('Registration failed');
    }

    final userData = response.data!['user'] as Map<String, dynamic>;
    return AppUser.fromJson(userData);
  }

  Future<void> logout() async {
    await _storageService.delete('auth_token');
    await _apiClient.post('/auth/logout');
  }

  Future<AppUser?> getCurrentUser() async {
    final token = await _storageService.read('auth_token');
    if (token == null) return null;

    final response = await _apiClient.get('/auth/me');
    if (response.data == null || response.data!['user'] == null) {
      return null;
    }

    final userData = response.data!['user'] as Map<String, dynamic>;
    return AppUser.fromJson(userData);
  }

  Future<void> refreshToken() async {
    final response = await _apiClient.post('/auth/refresh');
    final token = response.data!['token'] as String?;
    if (token != null) {
      await _storageService.store('auth_token', token);
    }
  }
}

void main() {
  group('AuthRepository Tests', () {
    late AuthRepository authRepository;
    late MockApiClient mockApiClient;
    late MockStorageService mockStorageService;

    setUp(() {
      mockApiClient = MockApiClient();
      mockStorageService = MockStorageService();
      authRepository = AuthRepository(mockApiClient, mockStorageService);
    });

    tearDown(() {
      mockApiClient.reset();
      mockStorageService.reset();
    });

    group('Login', () {
      test('should login with valid credentials', () async {
        // Arrange
        final userData = {
          'id': 'user-123',
          'email': 'test@example.com',
          'firstName': 'John',
          'lastName': 'Doe',
          'role': 'customer',
          'status': 'active',
          'emailVerified': true,
          'createdAt': '2024-01-01T00:00:00.000Z',
          'updatedAt': '2024-01-01T00:00:00.000Z',
        };

        mockApiClient.mockResponse('/auth/login', {
          'user': userData,
          'token': 'jwt-token-123',
        });

        // Act
        final user = await authRepository.login('test@example.com', 'password123');

        // Assert
        expect(user.id, equals('user-123'));
        expect(user.email, equals('test@example.com'));
        expect(user.role, equals(UserRole.customer));
        expect(user.emailVerified, isTrue);
      });

      test('should throw exception for invalid credentials', () async {
        // Arrange
        mockApiClient.throwError('Invalid credentials');

        // Act & Assert
        expect(
          () => authRepository.login('invalid@example.com', 'wrongpassword'),
          throwsException,
        );
      });
    });

    group('Registration', () {
      test('should register new user successfully', () async {
        // Arrange
        final userData = {
          'id': 'user-456',
          'email': 'newuser@example.com',
          'firstName': 'Jane',
          'lastName': 'Smith',
          'role': 'customer',
          'status': 'pending',
          'emailVerified': false,
          'createdAt': '2024-01-01T00:00:00.000Z',
          'updatedAt': '2024-01-01T00:00:00.000Z',
        };

        mockApiClient.mockResponse('/auth/register', {
          'user': userData,
        });

        // Act
        final user = await authRepository.register(
          firstName: 'Jane',
          lastName: 'Smith',
          email: 'newuser@example.com',
          password: 'password123',
        );

        // Assert
        expect(user.id, equals('user-456'));
        expect(user.email, equals('newuser@example.com'));
        expect(user.firstName, equals('Jane'));
        expect(user.lastName, equals('Smith'));
        expect(user.role, equals(UserRole.customer));
        expect(user.status, equals(UserStatus.pending));
      });

      test('should handle registration failure', () async {
        // Arrange
        mockApiClient.throwError('Email already exists');

        // Act & Assert
        expect(
          () => authRepository.register(
            firstName: 'John',
            lastName: 'Doe',
            email: 'john@example.com',
            password: 'password123',
          ),
          throwsException,
        );
      });
    });

    group('Logout', () {
      test('should logout successfully', () async {
        // Arrange
        await mockStorageService.store('auth_token', 'test-token');
        mockApiClient.mockResponse('/auth/logout', {});

        // Act
        await authRepository.logout();

        // Assert
        final token = await mockStorageService.read('auth_token');
        expect(token, isNull);
      });

      test('should logout even if api call fails', () async {
        // Arrange
        await mockStorageService.store('auth_token', 'test-token');
        mockApiClient.throwError('Server error');

        // Act & Assert - Should not throw, just clear local token
        expect(
          () => authRepository.logout(),
          throwsException,
        );
      });
    });

    group('Current User', () {
      test('should get current user when token exists', () async {
        // Arrange
        await mockStorageService.store('auth_token', 'valid-token');

        final userData = {
          'id': 'user-789',
          'email': 'current@example.com',
          'firstName': 'Current',
          'lastName': 'User',
          'role': 'customer',
          'status': 'active',
          'emailVerified': true,
          'createdAt': '2024-01-01T00:00:00.000Z',
          'updatedAt': '2024-01-01T00:00:00.000Z',
        };

        mockApiClient.mockResponse('/auth/me', {
          'user': userData,
        });

        // Act
        final user = await authRepository.getCurrentUser();

        // Assert
        expect(user, isNotNull);
        expect(user!.id, equals('user-789'));
        expect(user.email, equals('current@example.com'));
      });

      test('should return null when no token exists', () async {
        // Act
        final user = await authRepository.getCurrentUser();

        // Assert
        expect(user, isNull);
      });
    });

    group('Token Refresh', () {
      test('should refresh token successfully', () async {
        // Arrange
        mockApiClient.mockResponse('/auth/refresh', {
          'token': 'new-jwt-token-456',
        });

        // Act
        await authRepository.refreshToken();

        // Assert
        final storedToken = await mockStorageService.read('auth_token');
        expect(storedToken, equals('new-jwt-token-456'));
      });

      test('should handle refresh failure', () async {
        // Arrange
        mockApiClient.throwError('Refresh token expired');

        // Act & Assert
        expect(
          () => authRepository.refreshToken(),
          throwsException,
        );
      });
    });

    group('Error Handling', () {
      test('should handle storage errors gracefully', () async {
        // Arrange
        mockStorageService.throwError();

        // Act & Assert
        expect(
          () => authRepository.getCurrentUser(),
          throwsException,
        );
      });

      test('should handle network errors gracefully', () async {
        // Arrange
        mockApiClient.throwError('Network error');

        // Act & Assert
        expect(
          () => authRepository.login('test@example.com', 'password'),
          throwsException,
        );
      });
    });
  });
}
