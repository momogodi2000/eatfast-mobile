import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import '../domain/profile_api_repository.dart';
import '../domain/profile_user.dart';
import '../data/profile_api_repository_impl.dart';

/// Profile API repository provider
final profileApiRepositoryProvider = Provider<ProfileApiRepository>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return ProfileApiRepositoryImpl(apiClient);
});

/// Profile state for the new API-aligned version
class ProfileApiState {
  final ProfileUser? user;
  final List<UserAddress> addresses;
  final bool isLoading;
  final bool isUpdatingProfile;
  final bool isUploadingImage;
  final bool isManagingAddresses;
  final String? error;
  final String? successMessage;

  const ProfileApiState({
    this.user,
    this.addresses = const [],
    this.isLoading = false,
    this.isUpdatingProfile = false,
    this.isUploadingImage = false,
    this.isManagingAddresses = false,
    this.error,
    this.successMessage,
  });

  ProfileApiState copyWith({
    ProfileUser? user,
    List<UserAddress>? addresses,
    bool? isLoading,
    bool? isUpdatingProfile,
    bool? isUploadingImage,
    bool? isManagingAddresses,
    String? error,
    String? successMessage,
  }) {
    return ProfileApiState(
      user: user ?? this.user,
      addresses: addresses ?? this.addresses,
      isLoading: isLoading ?? this.isLoading,
      isUpdatingProfile: isUpdatingProfile ?? this.isUpdatingProfile,
      isUploadingImage: isUploadingImage ?? this.isUploadingImage,
      isManagingAddresses: isManagingAddresses ?? this.isManagingAddresses,
      error: error,
      successMessage: successMessage,
    );
  }

  bool get hasError => error != null;
  bool get hasSuccessMessage => successMessage != null;
  bool get isProfileComplete => user?.isProfileComplete ?? false;
}

/// Profile state notifier for API operations
class ProfileApiNotifier extends StateNotifier<AsyncValue<ProfileApiState>> {
  final ProfileApiRepository _repository;

  ProfileApiNotifier(this._repository) : super(const AsyncValue.loading()) {
    _initialize();
  }

  /// Initialize profile data from API
  Future<void> _initialize() async {
    try {
      final userResult = await _repository.getUserProfile();
      final addressResult = await _repository.getAddresses();

      userResult.when(
        success: (user) {
          addressResult.when(
            success: (addresses) {
              state = AsyncValue.data(ProfileApiState(
                user: user,
                addresses: addresses,
              ));
            },
            failure: (failure) {
              // Still show user data even if addresses fail to load
              state = AsyncValue.data(ProfileApiState(
                user: user,
                error: 'Impossible de charger les adresses: ${failure.message}',
              ));
            },
          );
        },
        failure: (failure) {
          state = AsyncValue.error(failure.message, StackTrace.current);
        },
      );
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  /// Reload profile data
  Future<void> refresh() async {
    if (state.value != null) {
      final currentState = state.value!;
      state = AsyncValue.data(currentState.copyWith(isLoading: true));
    }
    await _initialize();
  }

  /// Update profile information
  Future<void> updateProfile({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    UserPreferences? preferences,
  }) async {
    if (state.value == null) return;
    
    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(
      isUpdatingProfile: true,
      error: null,
      successMessage: null,
    ));

    final request = ProfileUpdateRequest(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      preferences: preferences,
    );
    
    final result = await _repository.updateProfile(request);
    
    result.when(
      success: (user) {
        state = AsyncValue.data(currentState.copyWith(
          user: user,
          isUpdatingProfile: false,
          successMessage: 'Profil mis à jour avec succès',
        ));
      },
      failure: (failure) {
        state = AsyncValue.data(currentState.copyWith(
          isUpdatingProfile: false,
          error: failure.message,
        ));
      },
    );
  }

  /// Upload profile image
  Future<void> uploadProfileImage(File imageFile) async {
    if (state.value == null) return;
    
    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(
      isUploadingImage: true,
      error: null,
      successMessage: null,
    ));
    
    final result = await _repository.uploadProfileImage(imageFile);
    
    result.when(
      success: (imageUrl) {
        // Refresh user data to get the updated profile image URL
        if (currentState.user != null) {
          final updatedUser = currentState.user!.copyWith(profileImage: imageUrl);
          state = AsyncValue.data(currentState.copyWith(
            user: updatedUser,
            isUploadingImage: false,
            successMessage: 'Photo de profil mise à jour',
          ));
        }
      },
      failure: (failure) {
        state = AsyncValue.data(currentState.copyWith(
          isUploadingImage: false,
          error: failure.message,
        ));
      },
    );
  }

  /// Delete profile image
  Future<void> deleteProfileImage() async {
    if (state.value == null) return;
    
    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(
      isUploadingImage: true,
      error: null,
      successMessage: null,
    ));
    
    final result = await _repository.deleteProfileImage();
    
    result.when(
      success: (_) {
        if (currentState.user != null) {
          final updatedUser = currentState.user!.copyWith(profileImage: null);
          state = AsyncValue.data(currentState.copyWith(
            user: updatedUser,
            isUploadingImage: false,
            successMessage: 'Photo de profil supprimée',
          ));
        }
      },
      failure: (failure) {
        state = AsyncValue.data(currentState.copyWith(
          isUploadingImage: false,
          error: failure.message,
        ));
      },
    );
  }

  /// Change password
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    if (state.value == null) return;
    
    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(
      isUpdatingProfile: true,
      error: null,
      successMessage: null,
    ));

    final request = PasswordChangeRequest(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    
    final result = await _repository.changePassword(request);
    
    result.when(
      success: (_) {
        state = AsyncValue.data(currentState.copyWith(
          isUpdatingProfile: false,
          successMessage: 'Mot de passe modifié avec succès',
        ));
      },
      failure: (failure) {
        state = AsyncValue.data(currentState.copyWith(
          isUpdatingProfile: false,
          error: failure.message,
        ));
      },
    );
  }

  /// Add new address
  Future<void> addAddress(AddressCreateRequest request) async {
    if (state.value == null) return;
    
    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(
      isManagingAddresses: true,
      error: null,
      successMessage: null,
    ));
    
    final result = await _repository.addAddress(request);
    
    result.when(
      success: (address) {
        final updatedAddresses = [...currentState.addresses, address];
        state = AsyncValue.data(currentState.copyWith(
          addresses: updatedAddresses,
          isManagingAddresses: false,
          successMessage: 'Adresse ajoutée avec succès',
        ));
      },
      failure: (failure) {
        state = AsyncValue.data(currentState.copyWith(
          isManagingAddresses: false,
          error: failure.message,
        ));
      },
    );
  }

  /// Update existing address
  Future<void> updateAddress(String addressId, AddressUpdateRequest request) async {
    if (state.value == null) return;
    
    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(
      isManagingAddresses: true,
      error: null,
      successMessage: null,
    ));
    
    final result = await _repository.updateAddress(addressId, request);
    
    result.when(
      success: (updatedAddress) {
        final updatedAddresses = currentState.addresses.map((address) {
          return address.id == addressId ? updatedAddress : address;
        }).toList();
        
        state = AsyncValue.data(currentState.copyWith(
          addresses: updatedAddresses,
          isManagingAddresses: false,
          successMessage: 'Adresse mise à jour',
        ));
      },
      failure: (failure) {
        state = AsyncValue.data(currentState.copyWith(
          isManagingAddresses: false,
          error: failure.message,
        ));
      },
    );
  }

  /// Delete address
  Future<void> deleteAddress(String addressId) async {
    if (state.value == null) return;
    
    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(
      isManagingAddresses: true,
      error: null,
      successMessage: null,
    ));
    
    final result = await _repository.deleteAddress(addressId);
    
    result.when(
      success: (_) {
        final updatedAddresses = currentState.addresses
            .where((address) => address.id != addressId)
            .toList();
        
        state = AsyncValue.data(currentState.copyWith(
          addresses: updatedAddresses,
          isManagingAddresses: false,
          successMessage: 'Adresse supprimée',
        ));
      },
      failure: (failure) {
        state = AsyncValue.data(currentState.copyWith(
          isManagingAddresses: false,
          error: failure.message,
        ));
      },
    );
  }

  /// Update preferences
  Future<void> updatePreferences(UserPreferences preferences) async {
    if (state.value == null) return;
    
    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(
      isUpdatingProfile: true,
      error: null,
      successMessage: null,
    ));
    
    final result = await _repository.updatePreferences(preferences);
    
    result.when(
      success: (updatedPreferences) {
        if (currentState.user != null) {
          final updatedUser = currentState.user!.copyWith(
            preferences: updatedPreferences,
          );
          state = AsyncValue.data(currentState.copyWith(
            user: updatedUser,
            isUpdatingProfile: false,
            successMessage: 'Préférences mises à jour',
          ));
        }
      },
      failure: (failure) {
        state = AsyncValue.data(currentState.copyWith(
          isUpdatingProfile: false,
          error: failure.message,
        ));
      },
    );
  }

  /// Clear error message
  void clearError() {
    if (state.value != null) {
      state = AsyncValue.data(state.value!.copyWith(error: null));
    }
  }

  /// Clear success message
  void clearSuccessMessage() {
    if (state.value != null) {
      state = AsyncValue.data(state.value!.copyWith(successMessage: null));
    }
  }
}

/// Profile provider - New API version
final profileApiProvider = StateNotifierProvider<ProfileApiNotifier, AsyncValue<ProfileApiState>>((ref) {
  final repository = ref.read(profileApiRepositoryProvider);
  return ProfileApiNotifier(repository);
});
