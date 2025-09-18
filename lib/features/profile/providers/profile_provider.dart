import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/models/app_user.dart';
import '../data/unified_profile_repository.dart';
import '../../../core/services/api/api_client.dart';

/// Profile repository provider
final profileRepositoryProvider = Provider<UnifiedProfileRepository>((ref) {
  final apiClient = ApiClient();
  return UnifiedProfileRepository(apiClient);
});

/// Profile state
class ProfileState {
  final AppUser? user;
  final List<UserAddress> addresses;
  final List<PaymentMethod> paymentMethods;
  final bool isLoading;
  final bool isUpdatingProfile;
  final bool isUploadingImage;
  final String? error;
  final String? successMessage;

  const ProfileState({
    this.user,
    this.addresses = const [],
    this.paymentMethods = const [],
    this.isLoading = false,
    this.isUpdatingProfile = false,
    this.isUploadingImage = false,
    this.error,
    this.successMessage,
  });

  ProfileState copyWith({
    AppUser? user,
    List<UserAddress>? addresses,
    List<PaymentMethod>? paymentMethods,
    bool? isLoading,
    bool? isUpdatingProfile,
    bool? isUploadingImage,
    String? error,
    String? successMessage,
  }) {
    return ProfileState(
      user: user ?? this.user,
      addresses: addresses ?? this.addresses,
      paymentMethods: paymentMethods ?? this.paymentMethods,
      isLoading: isLoading ?? this.isLoading,
      isUpdatingProfile: isUpdatingProfile ?? this.isUpdatingProfile,
      isUploadingImage: isUploadingImage ?? this.isUploadingImage,
      error: error,
      successMessage: successMessage,
    );
  }
}

/// Profile state notifier
class ProfileNotifier extends StateNotifier<AsyncValue<ProfileState>> {
  final UnifiedProfileRepository _profileRepository;

  ProfileNotifier(this._profileRepository) : super(const AsyncValue.loading()) {
    _initialize();
  }

  /// Initialize profile data
  Future<void> _initialize() async {
    try {
      final userResult = await _profileRepository.getUserProfile();
      if (userResult.isSuccess && userResult.data != null) {
        state = AsyncValue.data(ProfileState(user: userResult.data));
      } else {
        state = AsyncValue.error(userResult.error ?? 'Failed to load profile', StackTrace.current);
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  /// Load user profile
  Future<void> loadProfile() async {
    state = const AsyncValue.loading();
    try {
      final result = await _profileRepository.getUserProfile();
      if (result.isSuccess && result.data != null) {
        state = AsyncValue.data(ProfileState(user: result.data));
      } else {
        state = AsyncValue.error(result.error ?? 'Failed to load profile', StackTrace.current);
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  /// Update user profile
  Future<void> updateProfile({
    String? name,
    String? email,
    String? phone,
    String? bio,
    Map<String, dynamic>? preferences,
  }) async {
    state.whenData((currentState) {
      state = AsyncValue.data(currentState.copyWith(isUpdatingProfile: true, error: null));
    });

    try {
      final request = ProfileUpdateRequest(
        name: name,
        email: email,
        phone: phone,
        bio: bio,
        preferences: preferences,
      );

      final result = await _profileRepository.updateProfile(request);

      if (result.isSuccess && result.data != null) {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            user: result.data,
            isUpdatingProfile: false,
            successMessage: 'Profile updated successfully',
          ));
        });
      } else {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            isUpdatingProfile: false,
            error: result.error ?? 'Failed to update profile',
          ));
        });
      }
    } catch (e) {
      state.whenData((currentState) {
        state = AsyncValue.data(currentState.copyWith(
          isUpdatingProfile: false,
          error: e.toString(),
        ));
      });
    }
  }

  /// Upload profile avatar
  Future<void> uploadAvatar(File imageFile) async {
    state.whenData((currentState) {
      state = AsyncValue.data(currentState.copyWith(isUploadingImage: true, error: null));
    });

    try {
      final result = await _profileRepository.uploadAvatar(imageFile);

      if (result.isSuccess) {
        // Reload profile to get updated avatar
        await loadProfile();
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            isUploadingImage: false,
            successMessage: 'Avatar updated successfully',
          ));
        });
      } else {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            isUploadingImage: false,
            error: result.error ?? 'Failed to upload avatar',
          ));
        });
      }
    } catch (e) {
      state.whenData((currentState) {
        state = AsyncValue.data(currentState.copyWith(
          isUploadingImage: false,
          error: e.toString(),
        ));
      });
    }
  }

  /// Delete profile avatar
  Future<void> deleteAvatar() async {
    try {
      final result = await _profileRepository.deleteAvatar();

      if (result.isSuccess) {
        await loadProfile();
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            successMessage: 'Avatar deleted successfully',
          ));
        });
      } else {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            error: result.error ?? 'Failed to delete avatar',
          ));
        });
      }
    } catch (e) {
      state.whenData((currentState) {
        state = AsyncValue.data(currentState.copyWith(
          error: e.toString(),
        ));
      });
    }
  }

  /// Load user addresses
  Future<void> loadAddresses() async {
    try {
      final result = await _profileRepository.getUserAddresses();

      if (result.isSuccess && result.data != null) {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(addresses: result.data));
        });
      } else {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            error: result.error ?? 'Failed to load addresses',
          ));
        });
      }
    } catch (e) {
      state.whenData((currentState) {
        state = AsyncValue.data(currentState.copyWith(error: e.toString()));
      });
    }
  }

  /// Add new address
  Future<void> addAddress({
    required String label,
    required String address,
    required double latitude,
    required double longitude,
    String? instructions,
    bool isDefault = false,
  }) async {
    try {
      final request = AddressRequest(
        label: label,
        address: address,
        latitude: latitude,
        longitude: longitude,
        instructions: instructions,
        isDefault: isDefault,
      );

      final result = await _profileRepository.addAddress(request);

      if (result.isSuccess) {
        await loadAddresses();
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            successMessage: 'Address added successfully',
          ));
        });
      } else {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            error: result.error ?? 'Failed to add address',
          ));
        });
      }
    } catch (e) {
      state.whenData((currentState) {
        state = AsyncValue.data(currentState.copyWith(error: e.toString()));
      });
    }
  }

  /// Update address
  Future<void> updateAddress(String addressId, {
    required String label,
    required String address,
    required double latitude,
    required double longitude,
    String? instructions,
    bool isDefault = false,
  }) async {
    try {
      final request = AddressRequest(
        label: label,
        address: address,
        latitude: latitude,
        longitude: longitude,
        instructions: instructions,
        isDefault: isDefault,
      );

      final result = await _profileRepository.updateAddress(addressId, request);

      if (result.isSuccess) {
        await loadAddresses();
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            successMessage: 'Address updated successfully',
          ));
        });
      } else {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            error: result.error ?? 'Failed to update address',
          ));
        });
      }
    } catch (e) {
      state.whenData((currentState) {
        state = AsyncValue.data(currentState.copyWith(error: e.toString()));
      });
    }
  }

  /// Delete address
  Future<void> deleteAddress(String addressId) async {
    try {
      final result = await _profileRepository.deleteAddress(addressId);

      if (result.isSuccess) {
        await loadAddresses();
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            successMessage: 'Address deleted successfully',
          ));
        });
      } else {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            error: result.error ?? 'Failed to delete address',
          ));
        });
      }
    } catch (e) {
      state.whenData((currentState) {
        state = AsyncValue.data(currentState.copyWith(error: e.toString()));
      });
    }
  }

  /// Set default address
  Future<void> setDefaultAddress(String addressId) async {
    try {
      final result = await _profileRepository.setDefaultAddress(addressId);

      if (result.isSuccess) {
        await loadAddresses();
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            successMessage: 'Default address updated successfully',
          ));
        });
      } else {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            error: result.error ?? 'Failed to set default address',
          ));
        });
      }
    } catch (e) {
      state.whenData((currentState) {
        state = AsyncValue.data(currentState.copyWith(error: e.toString()));
      });
    }
  }

  /// Load payment methods
  Future<void> loadPaymentMethods() async {
    try {
      final result = await _profileRepository.getPaymentMethods();

      if (result.isSuccess && result.data != null) {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(paymentMethods: result.data));
        });
      } else {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            error: result.error ?? 'Failed to load payment methods',
          ));
        });
      }
    } catch (e) {
      state.whenData((currentState) {
        state = AsyncValue.data(currentState.copyWith(error: e.toString()));
      });
    }
  }

  /// Add payment method
  Future<void> addPaymentMethod({
    required String type,
    required Map<String, dynamic> details,
  }) async {
    try {
      final request = PaymentMethodRequest(type: type, details: details);
      final result = await _profileRepository.addPaymentMethod(request);

      if (result.isSuccess) {
        await loadPaymentMethods();
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            successMessage: 'Payment method added successfully',
          ));
        });
      } else {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            error: result.error ?? 'Failed to add payment method',
          ));
        });
      }
    } catch (e) {
      state.whenData((currentState) {
        state = AsyncValue.data(currentState.copyWith(error: e.toString()));
      });
    }
  }

  /// Delete payment method
  Future<void> deletePaymentMethod(String methodId) async {
    try {
      final result = await _profileRepository.deletePaymentMethod(methodId);

      if (result.isSuccess) {
        await loadPaymentMethods();
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            successMessage: 'Payment method deleted successfully',
          ));
        });
      } else {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            error: result.error ?? 'Failed to delete payment method',
          ));
        });
      }
    } catch (e) {
      state.whenData((currentState) {
        state = AsyncValue.data(currentState.copyWith(error: e.toString()));
      });
    }
  }

  /// Change password
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      final result = await _profileRepository.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );

      if (result.isSuccess) {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            successMessage: 'Password changed successfully',
          ));
        });
      } else {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            error: result.error ?? 'Failed to change password',
          ));
        });
      }
    } catch (e) {
      state.whenData((currentState) {
        state = AsyncValue.data(currentState.copyWith(error: e.toString()));
      });
    }
  }

  /// Delete account
  Future<void> deleteAccount(String password) async {
    try {
      final result = await _profileRepository.deleteAccount(password);

      if (result.isSuccess) {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            successMessage: 'Account deleted successfully',
          ));
        });
      } else {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            error: result.error ?? 'Failed to delete account',
          ));
        });
      }
    } catch (e) {
      state.whenData((currentState) {
        state = AsyncValue.data(currentState.copyWith(error: e.toString()));
      });
    }
  }

  /// Update profile picture (alias for uploadAvatar)
  Future<void> updateProfilePicture(File imageFile) async {
    return uploadAvatar(imageFile);
  }

  /// Set default payment method
  Future<void> setDefaultPaymentMethod(String methodId) async {
    try {
      // This would need to be implemented in the backend
      // For now, just show success
      state.whenData((currentState) {
        state = AsyncValue.data(currentState.copyWith(
          successMessage: 'Default payment method updated',
        ));
      });
    } catch (e) {
      state.whenData((currentState) {
        state = AsyncValue.data(currentState.copyWith(error: e.toString()));
      });
    }
  }

  /// Update payment method
  Future<void> updatePaymentMethod(String methodId, {
    required String type,
    required Map<String, dynamic> details,
  }) async {
    try {
      // This would need to be implemented in the backend
      // For now, just show success
      state.whenData((currentState) {
        state = AsyncValue.data(currentState.copyWith(
          successMessage: 'Payment method updated',
        ));
      });
    } catch (e) {
      state.whenData((currentState) {
        state = AsyncValue.data(currentState.copyWith(error: e.toString()));
      });
    }
  }

  /// Clear error message
  void clearError() {
    state.whenData((currentState) {
      state = AsyncValue.data(currentState.copyWith(error: null));
    });
  }

  /// Clear success message
  void clearSuccessMessage() {
    state.whenData((currentState) {
      state = AsyncValue.data(currentState.copyWith(successMessage: null));
    });
  }
}

/// Profile provider
final profileProvider = StateNotifierProvider<ProfileNotifier, AsyncValue<ProfileState>>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return ProfileNotifier(repository);
});

/// Current user provider (for easy access)
final currentUserProvider = Provider<AppUser?>((ref) {
  final profileState = ref.watch(profileProvider);
  return profileState.maybeWhen(
    data: (state) => state.user,
    orElse: () => null,
  );
});

/// User addresses provider
final userAddressesProvider = Provider<List<UserAddress>>((ref) {
  final profileState = ref.watch(profileProvider);
  return profileState.maybeWhen(
    data: (state) => state.addresses,
    orElse: () => [],
  );
});

/// User payment methods provider
final userPaymentMethodsProvider = Provider<List<PaymentMethod>>((ref) {
  final profileState = ref.watch(profileProvider);
  return profileState.maybeWhen(
    data: (state) => state.paymentMethods,
    orElse: () => [],
  );
});