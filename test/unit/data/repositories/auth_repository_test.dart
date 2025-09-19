import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';
import 'package:eatfast_mobile/core/auth/models/app_user.dart';
import 'package:eatfast_mobile/core/services/api/api_client.dart';
import 'package:eatfast_mobile/core/services/storage/secure_storage_service.dart';

// Generate mocks
@GenerateMocks([ApiClient, SecureStorageService])
import 'auth_repository_test.mocks.dart';

// Mock AuthRepository implementation for testing
class AuthRepository {
  final ApiClient _apiClient;
  final SecureStorageService _storageService;

  AuthRepository(this._apiClient, this._storageService);

  Future<AppUser> login(String email, String password) async {
    try {
      final response = await _apiClient.post('/auth/login', data: {
        'email': email,
        'password': password,
      });

      final userData = response.data['user'];
      final token = response.data['token'];
      final refreshToken = response.data['refreshToken'];

      // Store tokens
      await _storageService.write('access_token', token);
      await _storageService.write('refresh_token', refreshToken);

      return AppUser.fromJson(userData);
    } catch (e) {
      throw _handleAuthError(e);
    }
  }

  Future<AppUser> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    String? phone,
  }) async {
    try {
      final response = await _apiClient.post('/auth/register', data: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        if (phone != null) 'phone': phone,
      });

      final userData = response.data['user'];
      return AppUser.fromJson(userData);
    } catch (e) {
      throw _handleAuthError(e);
    }
  }

  Future<void> logout() async {
    try {
      final token = await _storageService.read('access_token');
      if (token != null) {
        await _apiClient.post('/auth/logout');
      }
    } catch (e) {
      // Log error but don't throw - allow local logout
    } finally {
      await _storageService.delete('access_token');
      await _storageService.delete('refresh_token');
      await _storageService.delete('user_data');
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await _apiClient.post('/auth/forgot-password', data: {
        'email': email,
      });
    } catch (e) {
      throw _handleAuthError(e);
    }
  }

  Future<void> resetPassword({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    try {
      await _apiClient.post('/auth/reset-password', data: {
        'email': email,
        'code': code,
        'newPassword': newPassword,
      });
    } catch (e) {
      throw _handleAuthError(e);
    }
  }

  Future<void> verifyEmail(String code) async {
    try {
      await _apiClient.post('/auth/verify-email', data: {
        'code': code,
      });
    } catch (e) {
      throw _handleAuthError(e);
    }
  }

  Future<void> resendVerificationCode() async {
    try {
      await _apiClient.post('/auth/resend-verification');
    } catch (e) {
      throw _handleAuthError(e);
    }
  }

  Future<AppUser?> getCurrentUser() async {
    try {
      final userData = await _storageService.read('user_data');
      if (userData != null) {
        return AppUser.fromJson(userData as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<String?> getAccessToken() async {
    return await _storageService.read('access_token');
  }

  Future<String?> getRefreshToken() async {
    return await _storageService.read('refresh_token');
  }

  Future<bool> isLoggedIn() async {
    final token = await getAccessToken();
    return token != null;
  }

  Future<String> refreshAccessToken() async {
    try {
      final refreshToken = await getRefreshToken();
      if (refreshToken == null) {
        throw AuthException('No refresh token available');
      }

      final response = await _apiClient.post('/auth/refresh', data: {
        'refreshToken': refreshToken,
      });

      final newToken = response.data['token'];
      await _storageService.write('access_token', newToken);

      return newToken;
    } catch (e) {
      throw _handleAuthError(e);
    }
  }

  Future<void> updateProfile({
    String? firstName,
    String? lastName,
    String? phone,
    String? profileImageUrl,
  }) async {
    try {
      final data = <String, dynamic>{};
      if (firstName != null) data['firstName'] = firstName;
      if (lastName != null) data['lastName'] = lastName;
      if (phone != null) data['phone'] = phone;
      if (profileImageUrl != null) data['profileImageUrl'] = profileImageUrl;

      final response = await _apiClient.put('/auth/profile', data: data);
      final userData = response.data['user'];

      // Update stored user data
      await _storageService.write('user_data', userData);
    } catch (e) {
      throw _handleAuthError(e);
    }
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await _apiClient.post('/auth/change-password', data: {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      });
    } catch (e) {
      throw _handleAuthError(e);
    }
  }

  AuthException _handleAuthError(dynamic error) {
    if (error is DioException) {
      final statusCode = error.response?.statusCode;
      final message = error.response?.data['message'] ?? 'Authentication error';

      switch (statusCode) {
        case 400:
          return AuthException('Invalid request: $message');
        case 401:
          return AuthException('Invalid credentials');
        case 403:
          return AuthException('Access forbidden');
        case 409:
          return AuthException('Email already exists');
        case 422:
          return AuthException('Validation error: $message');
        case 429:
          return AuthException('Too many requests. Please try again later.');
        case 500:
          return AuthException('Server error. Please try again later.');
        default:
          return AuthException('Network error. Please check your connection.');
      }
    }

    return AuthException('Unexpected error occurred');
  }
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => 'AuthException: $message';
}

void main() {
  group('AuthRepository Tests', () {
    late AuthRepository authRepository;
    late MockApiClient mockApiClient;
    late MockSecureStorageService mockStorageService;

    setUp(() {
      mockApiClient = MockApiClient();
      mockStorageService = MockSecureStorageService();
      authRepository = AuthRepository(mockApiClient, mockStorageService);
    });

    group('Login', () {
      test('should login successfully with valid credentials', () async {
        // Arrange
        const email = 'test@example.com';
        const password = 'password123';
        final mockResponse = Response(
          requestOptions: RequestOptions(path: '/auth/login'),
          data: {
            'user': {
              'id': 'user-123',
              'email': email,
              'firstName': 'John',
              'lastName': 'Doe',
              'role': 'customer',
              'status': 'active',
              'emailVerified': true,
              'createdAt': '2024-01-01T00:00:00.000Z',
              'updatedAt': '2024-01-01T00:00:00.000Z',
            },
            'token': 'mock-jwt-token',
            'refreshToken': 'mock-refresh-token',
          },
          statusCode: 200,
        );

        when(mockApiClient.post('/auth/login', data: anyNamed('data')))
            .thenAnswer((_) async => mockResponse);
        when(mockStorageService.write('access_token', 'mock-jwt-token'))
            .thenAnswer((_) async {});
        when(mockStorageService.write('refresh_token', 'mock-refresh-token'))
            .thenAnswer((_) async {});

        // Act
        final user = await authRepository.login(email, password);

        // Assert
        expect(user.email, equals(email));
        expect(user.firstName, equals('John'));
        expect(user.lastName, equals('Doe'));
        verify(mockApiClient.post('/auth/login', data: {
          'email': email,
          'password': password,
        })).called(1);
        verify(mockStorageService.write('access_token', 'mock-jwt-token')).called(1);
        verify(mockStorageService.write('refresh_token', 'mock-refresh-token')).called(1);
      });

      test('should throw AuthException for invalid credentials', () async {
        // Arrange
        const email = 'test@example.com';
        const password = 'wrongpassword';
        final mockError = DioException(
          requestOptions: RequestOptions(path: '/auth/login'),
          response: Response(
            requestOptions: RequestOptions(path: '/auth/login'),
            statusCode: 401,
            data: {'message': 'Invalid credentials'},
          ),
        );

        when(mockApiClient.post('/auth/login', data: anyNamed('data')))
            .thenThrow(mockError);

        // Act & Assert
        expect(
          () => authRepository.login(email, password),
          throwsA(isA<AuthException>().having(
            (e) => e.message,
            'message',
            'Invalid credentials',
          )),
        );
      });
    });

    group('Registration', () {
      test('should register successfully with valid data', () async {
        // Arrange
        const firstName = 'John';
        const lastName = 'Doe';
        const email = 'john.doe@example.com';
        const password = 'password123';
        const phone = '+1234567890';

        final mockResponse = Response(
          requestOptions: RequestOptions(path: '/auth/register'),
          data: {
            'user': {
              'id': 'user-123',
              'email': email,
              'firstName': firstName,
              'lastName': lastName,
              'phone': phone,
              'role': 'customer',
              'status': 'pending',
              'emailVerified': false,
              'createdAt': '2024-01-01T00:00:00.000Z',
              'updatedAt': '2024-01-01T00:00:00.000Z',
            },
          },
          statusCode: 201,
        );

        when(mockApiClient.post('/auth/register', data: anyNamed('data')))
            .thenAnswer((_) async => mockResponse);

        // Act
        final user = await authRepository.register(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          phone: phone,
        );

        // Assert
        expect(user.email, equals(email));
        expect(user.firstName, equals(firstName));
        expect(user.lastName, equals(lastName));
        expect(user.phone, equals(phone));
        expect(user.status, equals(UserStatus.pending));
        verify(mockApiClient.post('/auth/register', data: {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
          'phone': phone,
        })).called(1);
      });

      test('should throw AuthException for existing email', () async {
        // Arrange
        final mockError = DioException(
          requestOptions: RequestOptions(path: '/auth/register'),
          response: Response(
            requestOptions: RequestOptions(path: '/auth/register'),
            statusCode: 409,
            data: {'message': 'Email already exists'},
          ),
        );

        when(mockApiClient.post('/auth/register', data: anyNamed('data')))
            .thenThrow(mockError);

        // Act & Assert
        expect(
          () => authRepository.register(
            firstName: 'John',
            lastName: 'Doe',
            email: 'existing@example.com',
            password: 'password123',
          ),
          throwsA(isA<AuthException>().having(
            (e) => e.message,
            'message',
            'Email already exists',
          )),
        );
      });
    });

    group('Logout', () {
      test('should logout successfully', () async {
        // Arrange
        when(mockStorageService.read('access_token'))
            .thenAnswer((_) async => 'mock-jwt-token');
        when(mockApiClient.post('/auth/logout'))
            .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: '/auth/logout'),
              statusCode: 200,
            ));
        when(mockStorageService.delete('access_token')).thenAnswer((_) async {});
        when(mockStorageService.delete('refresh_token')).thenAnswer((_) async {});
        when(mockStorageService.delete('user_data')).thenAnswer((_) async {});

        // Act
        await authRepository.logout();

        // Assert
        verify(mockApiClient.post('/auth/logout')).called(1);
        verify(mockStorageService.delete('access_token')).called(1);
        verify(mockStorageService.delete('refresh_token')).called(1);
        verify(mockStorageService.delete('user_data')).called(1);
      });

      test('should clear local storage even if API call fails', () async {
        // Arrange
        when(mockStorageService.read('access_token'))
            .thenAnswer((_) async => 'mock-jwt-token');
        when(mockApiClient.post('/auth/logout'))
            .thenThrow(DioException(requestOptions: RequestOptions(path: '/auth/logout')));
        when(mockStorageService.delete('access_token')).thenAnswer((_) async {});
        when(mockStorageService.delete('refresh_token')).thenAnswer((_) async {});
        when(mockStorageService.delete('user_data')).thenAnswer((_) async {});

        // Act
        await authRepository.logout();

        // Assert
        verify(mockStorageService.delete('access_token')).called(1);
        verify(mockStorageService.delete('refresh_token')).called(1);
        verify(mockStorageService.delete('user_data')).called(1);
      });
    });

    group('Password Management', () {
      test('should send forgot password email successfully', () async {
        // Arrange
        const email = 'test@example.com';
        when(mockApiClient.post('/auth/forgot-password', data: anyNamed('data')))
            .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: '/auth/forgot-password'),
              statusCode: 200,
            ));

        // Act
        await authRepository.forgotPassword(email);

        // Assert
        verify(mockApiClient.post('/auth/forgot-password', data: {
          'email': email,
        })).called(1);
      });

      test('should reset password successfully', () async {
        // Arrange
        const email = 'test@example.com';
        const code = '123456';
        const newPassword = 'newpassword123';

        when(mockApiClient.post('/auth/reset-password', data: anyNamed('data')))
            .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: '/auth/reset-password'),
              statusCode: 200,
            ));

        // Act
        await authRepository.resetPassword(
          email: email,
          code: code,
          newPassword: newPassword,
        );

        // Assert
        verify(mockApiClient.post('/auth/reset-password', data: {
          'email': email,
          'code': code,
          'newPassword': newPassword,
        })).called(1);
      });

      test('should change password successfully', () async {
        // Arrange
        const currentPassword = 'oldpassword';
        const newPassword = 'newpassword123';

        when(mockApiClient.post('/auth/change-password', data: anyNamed('data')))
            .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: '/auth/change-password'),
              statusCode: 200,
            ));

        // Act
        await authRepository.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );

        // Assert
        verify(mockApiClient.post('/auth/change-password', data: {
          'currentPassword': currentPassword,
          'newPassword': newPassword,
        })).called(1);
      });
    });

    group('Email Verification', () {
      test('should verify email successfully', () async {
        // Arrange
        const code = '123456';
        when(mockApiClient.post('/auth/verify-email', data: anyNamed('data')))
            .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: '/auth/verify-email'),
              statusCode: 200,
            ));

        // Act
        await authRepository.verifyEmail(code);

        // Assert
        verify(mockApiClient.post('/auth/verify-email', data: {
          'code': code,
        })).called(1);
      });

      test('should resend verification code successfully', () async {
        // Arrange
        when(mockApiClient.post('/auth/resend-verification'))
            .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: '/auth/resend-verification'),
              statusCode: 200,
            ));

        // Act
        await authRepository.resendVerificationCode();

        // Assert
        verify(mockApiClient.post('/auth/resend-verification')).called(1);
      });
    });

    group('Token Management', () {
      test('should get current user from storage', () async {
        // Arrange
        final userData = {
          'id': 'user-123',
          'email': 'test@example.com',
          'firstName': 'John',
          'lastName': 'Doe',
          'role': 'customer',
          'status': 'active',
          'isEmailVerified': true,
          'createdAt': '2024-01-01T00:00:00.000Z',
        };

        when(mockStorageService.read('user_data'))
            .thenAnswer((_) async => userData);

        // Act
        final user = await authRepository.getCurrentUser();

        // Assert
        expect(user, isNotNull);
        expect(user!.email, equals('test@example.com'));
        expect(user.firstName, equals('John'));
      });

      test('should return null when no user data in storage', () async {
        // Arrange
        when(mockStorageService.read('user_data'))
            .thenAnswer((_) async => null);

        // Act
        final user = await authRepository.getCurrentUser();

        // Assert
        expect(user, isNull);
      });

      test('should get access token', () async {
        // Arrange
        const token = 'mock-jwt-token';
        when(mockStorageService.read('access_token'))
            .thenAnswer((_) async => token);

        // Act
        final result = await authRepository.getAccessToken();

        // Assert
        expect(result, equals(token));
      });

      test('should check if user is logged in', () async {
        // Arrange
        when(mockStorageService.read('access_token'))
            .thenAnswer((_) async => 'mock-jwt-token');

        // Act
        final isLoggedIn = await authRepository.isLoggedIn();

        // Assert
        expect(isLoggedIn, isTrue);
      });

      test('should refresh access token successfully', () async {
        // Arrange
        const refreshToken = 'mock-refresh-token';
        const newToken = 'new-mock-jwt-token';

        when(mockStorageService.read('refresh_token'))
            .thenAnswer((_) async => refreshToken);
        when(mockApiClient.post('/auth/refresh', data: anyNamed('data')))
            .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: '/auth/refresh'),
              data: {'token': newToken},
              statusCode: 200,
            ));
        when(mockStorageService.write('access_token', newToken))
            .thenAnswer((_) async {});

        // Act
        final result = await authRepository.refreshAccessToken();

        // Assert
        expect(result, equals(newToken));
        verify(mockStorageService.write('access_token', newToken)).called(1);
      });
    });

    group('Profile Management', () {
      test('should update profile successfully', () async {
        // Arrange
        const firstName = 'Jane';
        const lastName = 'Smith';
        const phone = '+9876543210';

        final mockResponse = Response(
          requestOptions: RequestOptions(path: '/auth/profile'),
          data: {
            'user': {
              'id': 'user-123',
              'email': 'test@example.com',
              'firstName': firstName,
              'lastName': lastName,
              'phone': phone,
              'role': 'customer',
              'status': 'active',
              'emailVerified': true,
              'createdAt': '2024-01-01T00:00:00.000Z',
              'updatedAt': '2024-01-01T00:00:00.000Z',
            },
          },
          statusCode: 200,
        );

        when(mockApiClient.put('/auth/profile', data: anyNamed('data')))
            .thenAnswer((_) async => mockResponse);
        when(mockStorageService.write('user_data', any))
            .thenAnswer((_) async {});

        // Act
        await authRepository.updateProfile(
          firstName: firstName,
          lastName: lastName,
          phone: phone,
        );

        // Assert
        verify(mockApiClient.put('/auth/profile', data: {
          'firstName': firstName,
          'lastName': lastName,
          'phone': phone,
        })).called(1);
        verify(mockStorageService.write('user_data', any)).called(1);
      });
    });
  });
}