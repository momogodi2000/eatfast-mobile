import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:eatfast_mobile/shared/services/auth/models/app_user.dart';

// Mock classes for testing
class MockAuthRepository extends Mock {
  Future<AppUser> login(String email, String password) async {
    return super.noSuchMethod(
      Invocation.method(#login, [email, password]),
      returnValue: Future.value(AppUser(
        id: 'user-123',
        email: email,
        firstName: 'Test',
        lastName: 'User',
        role: UserRole.customer,
        status: UserStatus.active,
        emailVerified: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      )),
    );
  }

  Future<AppUser> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    String? phone,
  }) async {
    return super.noSuchMethod(
      Invocation.method(#register, [], {
        #firstName: firstName,
        #lastName: lastName,
        #email: email,
        #password: password,
        #phone: phone,
      }),
      returnValue: Future.value(AppUser(
        id: 'user-456',
        email: email,
        firstName: firstName,
        lastName: lastName,
        role: UserRole.customer,
        status: UserStatus.pending,
        emailVerified: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      )),
    );
  }

  Future<void> logout() async {
    return super.noSuchMethod(
      Invocation.method(#logout, []),
      returnValue: Future.value(),
    );
  }

  Future<AppUser?> getCurrentUser() async {
    return super.noSuchMethod(
      Invocation.method(#getCurrentUser, []),
      returnValue: Future.value(null),
    );
  }

  Future<bool> isLoggedIn() async {
    return super.noSuchMethod(
      Invocation.method(#isLoggedIn, []),
      returnValue: Future.value(false),
    );
  }
}

// Mock AuthState and AuthNotifier for testing
enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthState {
  final AuthStatus status;
  final AppUser? user;
  final String? error;

  const AuthState({
    this.status = AuthStatus.initial,
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

  bool get isLoading => status == AuthStatus.loading;
  bool get isAuthenticated => status == AuthStatus.authenticated && user != null;
  bool get isUnauthenticated => status == AuthStatus.unauthenticated;
  bool get hasError => status == AuthStatus.error && error != null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthState &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          user == other.user &&
          error == other.error;

  @override
  int get hashCode => status.hashCode ^ user.hashCode ^ error.hashCode;
}

class AuthNotifier extends StateNotifier<AuthState> {
  final MockAuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(const AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(status: AuthStatus.loading, error: null);

    try {
      final user = await _authRepository.login(email, password);
      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        error: e.toString(),
      );
    }
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    String? phone,
  }) async {
    state = state.copyWith(status: AuthStatus.loading, error: null);

    try {
      final user = await _authRepository.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phone: phone,
      );
      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        error: e.toString(),
      );
    }
  }

  Future<void> logout() async {
    state = state.copyWith(status: AuthStatus.loading);

    try {
      await _authRepository.logout();
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        user: null,
      );
    } catch (e) {
      // Even if logout fails, clear local state
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        user: null,
      );
    }
  }

  Future<void> checkAuthStatus() async {
    try {
      final isLoggedIn = await _authRepository.isLoggedIn();
      if (isLoggedIn) {
        final user = await _authRepository.getCurrentUser();
        if (user != null) {
          state = state.copyWith(
            status: AuthStatus.authenticated,
            user: user,
          );
        } else {
          state = state.copyWith(status: AuthStatus.unauthenticated);
        }
      } else {
        state = state.copyWith(status: AuthStatus.unauthenticated);
      }
    } catch (e) {
      state = state.copyWith(status: AuthStatus.unauthenticated);
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

void main() {
  group('AuthProvider Tests', () {
    late MockAuthRepository mockAuthRepository;
    late AuthNotifier authNotifier;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      authNotifier = AuthNotifier(mockAuthRepository);
    });

    group('AuthState', () {
      test('should create initial state correctly', () {
        // Arrange & Act
        const state = AuthState();

        // Assert
        expect(state.status, equals(AuthStatus.initial));
        expect(state.user, isNull);
        expect(state.error, isNull);
        expect(state.isLoading, isFalse);
        expect(state.isAuthenticated, isFalse);
        expect(state.isUnauthenticated, isFalse);
        expect(state.hasError, isFalse);
      });

      test('should create loading state correctly', () {
        // Arrange & Act
        const state = AuthState(status: AuthStatus.loading);

        // Assert
        expect(state.status, equals(AuthStatus.loading));
        expect(state.isLoading, isTrue);
        expect(state.isAuthenticated, isFalse);
        expect(state.isUnauthenticated, isFalse);
        expect(state.hasError, isFalse);
      });

      test('should create authenticated state correctly', () {
        // Arrange
        final user = AppUser(
          id: 'user-123',
          email: 'test@example.com',
          firstName: 'Test',
          lastName: 'User',
          role: UserRole.customer,
          status: UserStatus.active,
          emailVerified: true,
          createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        );

        // Act
        final state = AuthState(status: AuthStatus.authenticated, user: user);

        // Assert
        expect(state.status, equals(AuthStatus.authenticated));
        expect(state.user, equals(user));
        expect(state.isLoading, isFalse);
        expect(state.isAuthenticated, isTrue);
        expect(state.isUnauthenticated, isFalse);
        expect(state.hasError, isFalse);
      });

      test('should create error state correctly', () {
        // Arrange & Act
        const state = AuthState(
          status: AuthStatus.error,
          error: 'Authentication failed',
        );

        // Assert
        expect(state.status, equals(AuthStatus.error));
        expect(state.error, equals('Authentication failed'));
        expect(state.isLoading, isFalse);
        expect(state.isAuthenticated, isFalse);
        expect(state.isUnauthenticated, isFalse);
        expect(state.hasError, isTrue);
      });

      test('should copy state with new values', () {
        // Arrange
        const originalState = AuthState(status: AuthStatus.initial);

        // Act
        final newState = originalState.copyWith(
          status: AuthStatus.loading,
          error: 'Some error',
        );

        // Assert
        expect(newState.status, equals(AuthStatus.loading));
        expect(newState.error, equals('Some error'));
        expect(newState.user, isNull); // Should remain unchanged
      });

      test('should compare states correctly', () {
        // Arrange
        const state1 = AuthState(status: AuthStatus.loading);
        const state2 = AuthState(status: AuthStatus.loading);
        const state3 = AuthState(status: AuthStatus.error);

        // Assert
        expect(state1, equals(state2));
        expect(state1, isNot(equals(state3)));
        expect(state1.hashCode, equals(state2.hashCode));
      });
    });

    group('AuthNotifier', () {
      test('should have initial state', () {
        // Assert
        expect(authNotifier.state.status, equals(AuthStatus.initial));
        expect(authNotifier.state.user, isNull);
        expect(authNotifier.state.error, isNull);
      });

      test('should login successfully', () async {
        // Arrange
        const email = 'test@example.com';
        const password = 'password123';
        final expectedUser = AppUser(
          id: 'user-123',
          email: email,
          firstName: 'Test',
          lastName: 'User',
          role: UserRole.customer,
          status: UserStatus.active,
          emailVerified: true,
          createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        );

        when(mockAuthRepository.login(email, password))
            .thenAnswer((_) async => expectedUser);

        // Act
        await authNotifier.login(email, password);

        // Assert
        expect(authNotifier.state.status, equals(AuthStatus.authenticated));
        expect(authNotifier.state.user?.email, equals(email));
        expect(authNotifier.state.error, isNull);
        verify(mockAuthRepository.login(email, password)).called(1);
      });

      test('should handle login failure', () async {
        // Arrange
        const email = 'test@example.com';
        const password = 'wrongpassword';
        const errorMessage = 'Invalid credentials';

        when(mockAuthRepository.login(email, password))
            .thenThrow(Exception(errorMessage));

        // Act
        await authNotifier.login(email, password);

        // Assert
        expect(authNotifier.state.status, equals(AuthStatus.error));
        expect(authNotifier.state.user, isNull);
        expect(authNotifier.state.error, contains(errorMessage));
        verify(mockAuthRepository.login(email, password)).called(1);
      });

      test('should set loading state during login', () async {
        // Arrange
        const email = 'test@example.com';
        const password = 'password123';

        when(mockAuthRepository.login(email, password))
            .thenAnswer((_) async {
          // Verify loading state is set
          expect(authNotifier.state.status, equals(AuthStatus.loading));
          return AppUser(
            id: 'user-123',
            email: email,
            firstName: 'Test',
            lastName: 'User',
            role: UserRole.customer,
            status: UserStatus.active,
            emailVerified: true,
            createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
          );
        });

        // Act
        await authNotifier.login(email, password);

        // Assert - Final state should be authenticated
        expect(authNotifier.state.status, equals(AuthStatus.authenticated));
      });

      test('should register successfully', () async {
        // Arrange
        const firstName = 'John';
        const lastName = 'Doe';
        const email = 'john.doe@example.com';
        const password = 'password123';
        const phone = '+1234567890';

        final expectedUser = AppUser(
          id: 'user-456',
          email: email,
          firstName: firstName,
          lastName: lastName,
          role: UserRole.customer,
          status: UserStatus.pending,
          emailVerified: false,
          createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        );

        when(mockAuthRepository.register(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          phone: phone,
        )).thenAnswer((_) async => expectedUser);

        // Act
        await authNotifier.register(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          phone: phone,
        );

        // Assert
        expect(authNotifier.state.status, equals(AuthStatus.authenticated));
        expect(authNotifier.state.user?.email, equals(email));
        expect(authNotifier.state.user?.firstName, equals(firstName));
        expect(authNotifier.state.error, isNull);
        verify(mockAuthRepository.register(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          phone: phone,
        )).called(1);
      });

      test('should handle registration failure', () async {
        // Arrange
        const errorMessage = 'Email already exists';

        when(mockAuthRepository.register(
          firstName: 'John',
          lastName: 'Doe',
          email: 'john@example.com',
          password: 'password123',
        )).thenThrow(Exception(errorMessage));

        // Act
        await authNotifier.register(
          firstName: 'John',
          lastName: 'Doe',
          email: 'existing@example.com',
          password: 'password123',
        );

        // Assert
        expect(authNotifier.state.status, equals(AuthStatus.error));
        expect(authNotifier.state.user, isNull);
        expect(authNotifier.state.error, contains(errorMessage));
      });

      test('should logout successfully', () async {
        // Arrange
        // Set initial authenticated state
        authNotifier.state = authNotifier.state.copyWith(
          status: AuthStatus.authenticated,
          user: AppUser(
            id: 'user-123',
            email: 'test@example.com',
            firstName: 'Test',
            lastName: 'User',
            role: UserRole.customer,
            status: UserStatus.active,
            emailVerified: true,
            createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
          ),
        );

        when(mockAuthRepository.logout()).thenAnswer((_) async {});

        // Act
        await authNotifier.logout();

        // Assert
        expect(authNotifier.state.status, equals(AuthStatus.unauthenticated));
        expect(authNotifier.state.user, isNull);
        verify(mockAuthRepository.logout()).called(1);
      });

      test('should logout even if repository logout fails', () async {
        // Arrange
        authNotifier.state = authNotifier.state.copyWith(
          status: AuthStatus.authenticated,
          user: AppUser(
            id: 'user-123',
            email: 'test@example.com',
            firstName: 'Test',
            lastName: 'User',
            role: UserRole.customer,
            status: UserStatus.active,
            emailVerified: true,
            createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
          ),
        );

        when(mockAuthRepository.logout()).thenThrow(Exception('Network error'));

        // Act
        await authNotifier.logout();

        // Assert
        expect(authNotifier.state.status, equals(AuthStatus.unauthenticated));
        expect(authNotifier.state.user, isNull);
        verify(mockAuthRepository.logout()).called(1);
      });

      test('should check auth status for logged in user', () async {
        // Arrange
        final expectedUser = AppUser(
          id: 'user-123',
          email: 'test@example.com',
          firstName: 'Test',
          lastName: 'User',
          role: UserRole.customer,
          status: UserStatus.active,
          emailVerified: true,
          createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        );

        when(mockAuthRepository.isLoggedIn()).thenAnswer((_) async => true);
        when(mockAuthRepository.getCurrentUser()).thenAnswer((_) async => expectedUser);

        // Act
        await authNotifier.checkAuthStatus();

        // Assert
        expect(authNotifier.state.status, equals(AuthStatus.authenticated));
        expect(authNotifier.state.user, equals(expectedUser));
        verify(mockAuthRepository.isLoggedIn()).called(1);
        verify(mockAuthRepository.getCurrentUser()).called(1);
      });

      test('should check auth status for not logged in user', () async {
        // Arrange
        when(mockAuthRepository.isLoggedIn()).thenAnswer((_) async => false);

        // Act
        await authNotifier.checkAuthStatus();

        // Assert
        expect(authNotifier.state.status, equals(AuthStatus.unauthenticated));
        expect(authNotifier.state.user, isNull);
        verify(mockAuthRepository.isLoggedIn()).called(1);
        verifyNever(mockAuthRepository.getCurrentUser());
      });

      test('should handle auth status check failure', () async {
        // Arrange
        when(mockAuthRepository.isLoggedIn()).thenThrow(Exception('Storage error'));

        // Act
        await authNotifier.checkAuthStatus();

        // Assert
        expect(authNotifier.state.status, equals(AuthStatus.unauthenticated));
        expect(authNotifier.state.user, isNull);
        verify(mockAuthRepository.isLoggedIn()).called(1);
      });

      test('should clear error', () async {
        // Arrange
        authNotifier.state = authNotifier.state.copyWith(
          status: AuthStatus.error,
          error: 'Some error',
        );

        // Act
        authNotifier.clearError();

        // Assert
        expect(authNotifier.state.error, isNull);
        expect(authNotifier.state.status, equals(AuthStatus.error)); // Status should remain the same
      });
    });

    group('Provider Integration', () {
      test('should work with Riverpod provider', () {
        // Arrange
        final container = ProviderContainer();
        final authRepositoryProvider = Provider<MockAuthRepository>((ref) => mockAuthRepository);
        final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
          (ref) => AuthNotifier(ref.watch(authRepositoryProvider)),
        );

        // Act
        final authState = container.read(authNotifierProvider);
        final authNotifier = container.read(authNotifierProvider.notifier);

        // Assert
        expect(authState.status, equals(AuthStatus.initial));
        expect(authNotifier, isA<AuthNotifier>());

        // Cleanup
        container.dispose();
      });

      test('should notify listeners on state changes', () {
        // Arrange
        final container = ProviderContainer();
        final authRepositoryProvider = Provider<MockAuthRepository>((ref) => mockAuthRepository);
        final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
          (ref) => AuthNotifier(ref.watch(authRepositoryProvider)),
        );

        final states = <AuthState>[];
        container.listen<AuthState>(
          authNotifierProvider,
          (previous, next) {
            states.add(next);
          },
        );

        when(mockAuthRepository.login('test@example.com', 'password'))
            .thenAnswer((_) async => AppUser(
              id: 'user-123',
              email: 'test@example.com',
              firstName: 'Test',
              lastName: 'User',
              role: UserRole.customer,
              status: UserStatus.active,
              emailVerified: true,
              createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
            ));

        // Act
        container.read(authNotifierProvider.notifier).login('test@example.com', 'password');

        // Assert
        expect(states.length, greaterThan(0));
        expect(states.last.status, equals(AuthStatus.loading));

        // Cleanup
        container.dispose();
      });
    });
  });
}
