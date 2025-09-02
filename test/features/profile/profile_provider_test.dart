import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import '../../lib/features/profile/domain/models.dart';
import '../../lib/features/profile/domain/profile_repository.dart';
import '../../lib/features/profile/providers/profile_provider.dart';
import '../../lib/core/result.dart';
import '../../lib/core/failure.dart';
import '../../lib/features/auth/domain/user.dart';

import 'profile_provider_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late ProfileNotifier profileNotifier;
  late MockProfileRepository mockRepository;

  setUp(() {
    mockRepository = MockProfileRepository();
    profileNotifier = ProfileNotifier(mockRepository);
  });

  group('ProfileNotifier', () {
    group('loadUserProfile', () {
      test('should update state with user data when successful', () async {
        // Arrange
        final user = User(
          id: '1',
          fullName: 'Test User',
          email: 'test@example.com',
          phoneNumber: '+237123456789',
          avatarUrl: null,
          isEmailVerified: true,
          isPhoneVerified: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        when(mockRepository.getUserProfile())
            .thenAnswer((_) async => Result.success(user));

        // Act
        await profileNotifier.loadUserProfile();

        // Assert
        final state = profileNotifier.state.value;
        expect(state?.user, equals(user));
        expect(state?.error, isNull);
      });

      test('should update state with error when failed', () async {
        // Arrange
        const failure = Failure.serverError('Server error');
        when(mockRepository.getUserProfile())
            .thenAnswer((_) async => const Result.failure(failure));

        // Act
        await profileNotifier.loadUserProfile();

        // Assert
        expect(profileNotifier.state.hasError, isTrue);
        expect(profileNotifier.state.error.toString(), contains('Server error'));
      });
    });

    group('updateProfile', () {
      test('should update user data when successful', () async {
        // Arrange
        final initialUser = User(
          id: '1',
          fullName: 'Old Name',
          email: 'old@example.com',
          phoneNumber: '+237123456789',
          avatarUrl: null,
          isEmailVerified: true,
          isPhoneVerified: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final updatedUser = initialUser.copyWith(
          fullName: 'New Name',
          email: 'new@example.com',
        );

        // Set initial state
        profileNotifier.state = AsyncValue.data(ProfileState(user: initialUser));

        when(mockRepository.updateProfile(
          fullName: 'New Name',
          email: 'new@example.com',
        )).thenAnswer((_) async => Result.success(updatedUser));

        // Act
        await profileNotifier.updateProfile(
          fullName: 'New Name',
          email: 'new@example.com',
        );

        // Assert
        final state = profileNotifier.state.value;
        expect(state?.user?.fullName, equals('New Name'));
        expect(state?.user?.email, equals('new@example.com'));
        expect(state?.successMessage, isNotNull);
        expect(state?.isUpdatingProfile, isFalse);
      });

      test('should update state with error when failed', () async {
        // Arrange
        final initialUser = User(
          id: '1',
          fullName: 'Test User',
          email: 'test@example.com',
          phoneNumber: '+237123456789',
          avatarUrl: null,
          isEmailVerified: true,
          isPhoneVerified: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        profileNotifier.state = AsyncValue.data(ProfileState(user: initialUser));

        const failure = Failure.validationError('Invalid email');
        when(mockRepository.updateProfile(email: 'invalid-email'))
            .thenAnswer((_) async => const Result.failure(failure));

        // Act
        await profileNotifier.updateProfile(email: 'invalid-email');

        // Assert
        final state = profileNotifier.state.value;
        expect(state?.error, contains('Invalid email'));
        expect(state?.isUpdatingProfile, isFalse);
      });
    });

    group('addAddress', () {
      test('should add address to list when successful', () async {
        // Arrange
        final address = Address(
          id: '1',
          label: 'Home',
          street: '123 Main St',
          city: 'Yaoundé',
          postalCode: '00237',
          country: 'Cameroun',
          latitude: 3.848,
          longitude: 11.502,
          isDefault: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        profileNotifier.state = const AsyncValue.data(ProfileState());

        when(mockRepository.addAddress(address))
            .thenAnswer((_) async => Result.success(address));

        // Act
        await profileNotifier.addAddress(address);

        // Assert
        final state = profileNotifier.state.value;
        expect(state?.addresses, contains(address));
        expect(state?.successMessage, isNotNull);
        expect(state?.isLoading, isFalse);
      });

      test('should update state with error when failed', () async {
        // Arrange
        final address = Address(
          id: '1',
          label: 'Home',
          street: '123 Main St',
          city: 'Yaoundé',
          postalCode: '00237',
          country: 'Cameroun',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        profileNotifier.state = const AsyncValue.data(ProfileState());

        const failure = Failure.networkError('Network error');
        when(mockRepository.addAddress(address))
            .thenAnswer((_) async => const Result.failure(failure));

        // Act
        await profileNotifier.addAddress(address);

        // Assert
        final state = profileNotifier.state.value;
        expect(state?.addresses, isEmpty);
        expect(state?.error, contains('Network error'));
        expect(state?.isLoading, isFalse);
      });
    });

    group('setDefaultAddress', () {
      test('should update default address when successful', () async {
        // Arrange
        final address1 = Address(
          id: '1',
          label: 'Home',
          street: '123 Main St',
          city: 'Yaoundé',
          postalCode: '00237',
          country: 'Cameroun',
          isDefault: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final address2 = Address(
          id: '2',
          label: 'Work',
          street: '456 Work St',
          city: 'Douala',
          postalCode: '00237',
          country: 'Cameroun',
          isDefault: false,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        profileNotifier.state = AsyncValue.data(
          ProfileState(addresses: [address1, address2]),
        );

        when(mockRepository.setDefaultAddress('2'))
            .thenAnswer((_) async => const Result.success(null));

        // Act
        await profileNotifier.setDefaultAddress('2');

        // Assert
        final state = profileNotifier.state.value;
        expect(state?.addresses[0].isDefault, isFalse); // address1
        expect(state?.addresses[1].isDefault, isTrue);  // address2
        expect(state?.successMessage, isNotNull);
      });
    });

    group('addPaymentMethod', () {
      test('should add payment method to list when successful', () async {
        // Arrange
        final paymentMethod = PaymentMethod(
          id: '1',
          type: 'momo_mtn',
          displayName: 'My MTN Money',
          accountNumber: '123456789',
          accountName: 'Test User',
          isDefault: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        profileNotifier.state = const AsyncValue.data(ProfileState());

        when(mockRepository.addPaymentMethod(paymentMethod))
            .thenAnswer((_) async => Result.success(paymentMethod));

        // Act
        await profileNotifier.addPaymentMethod(paymentMethod);

        // Assert
        final state = profileNotifier.state.value;
        expect(state?.paymentMethods, contains(paymentMethod));
        expect(state?.successMessage, isNotNull);
        expect(state?.isLoading, isFalse);
      });
    });

    group('updateNotificationPreferences', () {
      test('should update notification preferences when successful', () async {
        // Arrange
        const preferences = NotificationPreferences(
          pushNotifications: false,
          emailNotifications: false,
          smsNotifications: true,
          whatsappNotifications: true,
          orderUpdates: true,
          promotionalOffers: false,
          newRestaurants: false,
          recommendations: true,
        );

        profileNotifier.state = const AsyncValue.data(ProfileState());

        when(mockRepository.updateNotificationPreferences(preferences))
            .thenAnswer((_) async => const Result.success(preferences));

        // Act
        await profileNotifier.updateNotificationPreferences(preferences);

        // Assert
        final state = profileNotifier.state.value;
        expect(state?.notificationPreferences, equals(preferences));
        expect(state?.successMessage, isNotNull);
        expect(state?.isLoading, isFalse);
      });
    });

    group('changePassword', () {
      test('should show success message when password changed successfully', () async {
        // Arrange
        profileNotifier.state = const AsyncValue.data(ProfileState());

        when(mockRepository.changePassword(
          currentPassword: 'oldpass',
          newPassword: 'newpass',
        )).thenAnswer((_) async => const Result.success(null));

        // Act
        await profileNotifier.changePassword(
          currentPassword: 'oldpass',
          newPassword: 'newpass',
        );

        // Assert
        final state = profileNotifier.state.value;
        expect(state?.successMessage, contains('Mot de passe changé'));
        expect(state?.error, isNull);
        expect(state?.isLoading, isFalse);
      });

      test('should show error when current password is incorrect', () async {
        // Arrange
        profileNotifier.state = const AsyncValue.data(ProfileState());

        const failure = Failure.unauthorized('Incorrect current password');
        when(mockRepository.changePassword(
          currentPassword: 'wrongpass',
          newPassword: 'newpass',
        )).thenAnswer((_) async => const Result.failure(failure));

        // Act
        await profileNotifier.changePassword(
          currentPassword: 'wrongpass',
          newPassword: 'newpass',
        );

        // Assert
        final state = profileNotifier.state.value;
        expect(state?.error, contains('Incorrect current password'));
        expect(state?.successMessage, isNull);
        expect(state?.isLoading, isFalse);
      });
    });

    group('deleteAccount', () {
      test('should show success message when account deleted successfully', () async {
        // Arrange
        profileNotifier.state = const AsyncValue.data(ProfileState());

        when(mockRepository.deleteAccount(
          password: 'password',
          reason: 'Not satisfied with service',
        )).thenAnswer((_) async => const Result.success(null));

        // Act
        await profileNotifier.deleteAccount(
          password: 'password',
          reason: 'Not satisfied with service',
        );

        // Assert
        final state = profileNotifier.state.value;
        expect(state?.successMessage, contains('Compte supprimé'));
        expect(state?.error, isNull);
        expect(state?.isLoading, isFalse);
      });

      test('should show error when password is incorrect', () async {
        // Arrange
        profileNotifier.state = const AsyncValue.data(ProfileState());

        const failure = Failure.unauthorized('Incorrect password');
        when(mockRepository.deleteAccount(
          password: 'wrongpassword',
        )).thenAnswer((_) async => const Result.failure(failure));

        // Act
        await profileNotifier.deleteAccount(password: 'wrongpassword');

        // Assert
        final state = profileNotifier.state.value;
        expect(state?.error, contains('Incorrect password'));
        expect(state?.successMessage, isNull);
        expect(state?.isLoading, isFalse);
      });
    });

    group('clearError', () {
      test('should clear error message from state', () {
        // Arrange
        profileNotifier.state = const AsyncValue.data(
          ProfileState(error: 'Some error'),
        );

        // Act
        profileNotifier.clearError();

        // Assert
        final state = profileNotifier.state.value;
        expect(state?.error, isNull);
      });
    });

    group('clearSuccessMessage', () {
      test('should clear success message from state', () {
        // Arrange
        profileNotifier.state = const AsyncValue.data(
          ProfileState(successMessage: 'Success message'),
        );

        // Act
        profileNotifier.clearSuccessMessage();

        // Assert
        final state = profileNotifier.state.value;
        expect(state?.successMessage, isNull);
      });
    });
  });
}
