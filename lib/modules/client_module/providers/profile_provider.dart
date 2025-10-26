import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/services/auth/models/app_user.dart';
import 'package:eatfast_mobile/shared/models/user_address.dart';
import 'domain/profile_repository.dart' as repo;
import 'data/profile_repository_impl.dart';

// Repository provider
final profileRepositoryProvider = Provider<repo.ProfileRepository>((ref) {
  return ProfileRepositoryImpl();
});

// Profile provider
final profileProvider = StateNotifierProvider<ProfileNotifier, AsyncValue<ProfileState>>((ref) {
  return ProfileNotifier(ref.watch(profileRepositoryProvider));
});

/// Profile State
class ProfileState {
  final AppUser? user;
  final List<UserAddress> addresses;
  final List<repo.PaymentMethod> paymentMethods;
  final repo.NotificationPreferences? notificationPreferences;
  final bool isLoading;
  final String? error;

  const ProfileState({
    this.user,
    this.addresses = const [],
    this.paymentMethods = const [],
    this.notificationPreferences,
    this.isLoading = false,
    this.error,
  });

  ProfileState copyWith({
    AppUser? user,
    List<UserAddress>? addresses,
    List<repo.PaymentMethod>? paymentMethods,
    repo.NotificationPreferences? notificationPreferences,
    bool? isLoading,
    String? error,
  }) {
    return ProfileState(
      user: user ?? this.user,
      addresses: addresses ?? this.addresses,
      paymentMethods: paymentMethods ?? this.paymentMethods,
      notificationPreferences: notificationPreferences ?? this.notificationPreferences,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// Profile Notifier
class ProfileNotifier extends StateNotifier<AsyncValue<ProfileState>> {
  final repo.ProfileRepository _repository;

  ProfileNotifier(this._repository) : super(const AsyncValue.data(ProfileState()));

  /// Load user profile
  Future<void> loadProfile(String userId) async {
    state = const AsyncValue.loading();

    try {
      final user = await _repository.getProfile(userId);

      state = AsyncValue.data(ProfileState(user: user));
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Update user profile
  Future<void> updateProfile(AppUser user, {String? name, String? email, String? phone}) async {
    final currentState = state.valueOrNull ?? const ProfileState();

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    // If named parameters provided, update the user object
    AppUser userToUpdate = user;
    if (name != null || email != null || phone != null) {
      // Note: name is a computed property, so we can't set it directly
      // We would need to split it into firstName/lastName if provided
      userToUpdate = user.copyWith(
        email: email ?? user.email,
        phone: phone ?? user.phone,
      );
    }

    try {
      final success = await _repository.updateProfile(userToUpdate);

      if (success) {
        state = AsyncValue.data(currentState.copyWith(
          user: userToUpdate,
          isLoading: false,
        ));
      } else {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: 'Failed to update profile',
        ));
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Update avatar
  Future<void> updateAvatar(String userId, String imagePath) async {
    final currentState = state.valueOrNull ?? const ProfileState();

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    try {
      final avatarUrl = await _repository.updateAvatar(userId, imagePath);

      if (avatarUrl != null && currentState.user != null) {
        final updatedUser = currentState.user!.copyWith(avatar: avatarUrl);
        state = AsyncValue.data(currentState.copyWith(
          user: updatedUser,
          isLoading: false,
        ));
      } else {
        state = AsyncValue.data(currentState.copyWith(isLoading: false));
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Update profile picture (alias for updateAvatar for backward compatibility)
  Future<void> updateProfilePicture(String imagePath) async {
    final currentState = state.valueOrNull ?? const ProfileState();
    final userId = currentState.user?.id;

    if (userId == null) return;

    await updateAvatar(userId, imagePath);
  }

  /// Load addresses
  Future<void> loadAddresses() async {
    final currentState = state.valueOrNull ?? const ProfileState();
    final userId = currentState.user?.id ?? 'mock_user_id';

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    try {
      final addresses = await _repository.getAddresses(userId);

      // Convert Address to UserAddress
      final userAddresses = addresses.map((addr) {
        return UserAddress(
          id: addr.id ?? '',
          userId: userId,
          label: addr.type,
          streetAddress: addr.street,
          apartment: null,
          city: addr.city,
          state: addr.state,
          postalCode: addr.postalCode,
          country: addr.country ?? 'Cameroon',
          latitude: addr.latitude,
          longitude: addr.longitude,
          deliveryInstructions: addr.instructions,
          isDefault: addr.isDefault,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
      }).toList();

      state = AsyncValue.data(currentState.copyWith(
        addresses: userAddresses,
        isLoading: false,
      ));
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Add address
  Future<void> addAddress({
    required String label,
    required String address,
    required double latitude,
    required double longitude,
    String? instructions,
    bool isDefault = false,
  }) async {
    final currentState = state.valueOrNull ?? const ProfileState();
    final userId = currentState.user?.id;

    if (userId == null) return;

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    try {
      final newAddress = repo.Address(
        label: label,
        type: label, // Use same value for type and label
        street: address,
        city: '', // Will be parsed from address string
        country: 'Cameroon',
        latitude: latitude,
        longitude: longitude,
        isDefault: isDefault,
        instructions: instructions,
      );

      final success = await _repository.addAddress(userId, newAddress);

      if (success) {
        // Reload addresses
        await loadAddresses();
      } else {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: 'Failed to add address',
        ));
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Update address
  Future<void> updateAddress(
    String addressId, {
    required String label,
    required String address,
    required double latitude,
    required double longitude,
    String? instructions,
    bool isDefault = false,
  }) async {
    final currentState = state.valueOrNull ?? const ProfileState();

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    try {
      final updatedAddress = repo.Address(
        id: addressId,
        label: label,
        type: label, // Use same value for type and label
        street: address,
        city: '', // Will be parsed from address string
        country: 'Cameroon',
        latitude: latitude,
        longitude: longitude,
        isDefault: isDefault,
        instructions: instructions,
      );

      final success = await _repository.updateAddress(addressId, updatedAddress);

      if (success) {
        // Reload addresses
        await loadAddresses();
      } else {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: 'Failed to update address',
        ));
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Delete address
  Future<void> deleteAddress(String addressId) async {
    final currentState = state.valueOrNull ?? const ProfileState();

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    try {
      final success = await _repository.deleteAddress(addressId);

      if (success) {
        // Reload addresses
        await loadAddresses();
      } else {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: 'Failed to delete address',
        ));
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Set default address
  Future<void> setDefaultAddress(String addressId) async {
    final currentState = state.valueOrNull ?? const ProfileState();
    final userId = currentState.user?.id;

    if (userId == null) return;

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    try {
      final success = await _repository.setDefaultAddress(userId, addressId);

      if (success) {
        // Reload addresses
        await loadAddresses();
      } else {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: 'Failed to set default address',
        ));
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Load payment methods
  Future<void> loadPaymentMethods() async {
    final currentState = state.valueOrNull ?? const ProfileState();
    final userId = currentState.user?.id;

    if (userId == null) return;

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    try {
      final paymentMethods = await _repository.getPaymentMethods(userId);

      state = AsyncValue.data(currentState.copyWith(
        paymentMethods: paymentMethods,
        isLoading: false,
      ));
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Add payment method
  Future<void> addPaymentMethod(repo.PaymentMethod paymentMethod, {String? type, Map<String, dynamic>? details}) async {
    final currentState = state.valueOrNull ?? const ProfileState();
    final userId = currentState.user?.id;

    if (userId == null) return;

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    try {
      final success = await _repository.addPaymentMethod(userId, paymentMethod);

      if (success) {
        // Reload payment methods
        await loadPaymentMethods();
      } else {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: 'Failed to add payment method',
        ));
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Set default payment method
  Future<void> setDefaultPaymentMethod(String paymentMethodId) async {
    final currentState = state.valueOrNull ?? const ProfileState();
    final userId = currentState.user?.id;

    if (userId == null) return;

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    try {
      // Update the payment method to be default
      final methods = currentState.paymentMethods;
      final updatedMethods = methods.map((m) {
        return m.copyWith(isDefault: m.id == paymentMethodId);
      }).toList();

      state = AsyncValue.data(currentState.copyWith(
        paymentMethods: updatedMethods,
        isLoading: false,
      ));

      // TODO: Call backend to persist the change
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Update payment method
  Future<void> updatePaymentMethod(String paymentMethodId, repo.PaymentMethod updatedMethod) async {
    final currentState = state.valueOrNull ?? const ProfileState();

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    try {
      final methods = currentState.paymentMethods;
      final updatedMethods = methods.map((m) {
        return m.id == paymentMethodId ? updatedMethod : m;
      }).toList();

      state = AsyncValue.data(currentState.copyWith(
        paymentMethods: updatedMethods,
        isLoading: false,
      ));

      // TODO: Call backend to persist the change
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Delete payment method
  Future<void> deletePaymentMethod(String paymentMethodId) async {
    final currentState = state.valueOrNull ?? const ProfileState();

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    try {
      final success = await _repository.deletePaymentMethod(paymentMethodId);

      if (success) {
        // Reload payment methods
        await loadPaymentMethods();
      } else {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: 'Failed to delete payment method',
        ));
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Update notification preferences
  Future<void> updateNotificationPreferences(repo.NotificationPreferences preferences) async {
    final currentState = state.valueOrNull ?? const ProfileState();
    final userId = currentState.user?.id;

    if (userId == null) return;

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    try {
      final success = await _repository.updateNotificationPreferences(userId, preferences);

      if (success) {
        state = AsyncValue.data(currentState.copyWith(
          notificationPreferences: preferences,
          isLoading: false,
        ));
      } else {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: 'Failed to update preferences',
        ));
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Change password
  Future<bool> changePassword(String currentPassword, String newPassword) async {
    final currentState = state.valueOrNull ?? const ProfileState();
    final userId = currentState.user?.id;

    if (userId == null) return false;

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    try {
      final success = await _repository.changePassword(userId, currentPassword, newPassword);

      state = AsyncValue.data(currentState.copyWith(
        isLoading: false,
        error: success ? null : 'Failed to change password',
      ));

      return success;
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      return false;
    }
  }

  /// Delete account
  Future<bool> deleteAccount() async {
    final currentState = state.valueOrNull ?? const ProfileState();
    final userId = currentState.user?.id;

    if (userId == null) return false;

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    try {
      final success = await _repository.deleteAccount(userId);

      if (success) {
        state = const AsyncValue.data(ProfileState());
      } else {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: 'Failed to delete account',
        ));
      }

      return success;
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      return false;
    }
  }
}
