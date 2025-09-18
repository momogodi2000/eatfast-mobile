import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/models/app_user.dart';
import '../domain/models.dart';
import '../domain/profile_repository.dart';
import '../data/profile_repository_impl.dart';
import '../../../core/services/api/api_client.dart';

/// Profile repository provider
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final apiClient = ApiClient(); // Use ApiClient directly
  return ProfileRepositoryImpl(apiClient);
});

/// Profile state
class ProfileState {
  final AppUser? user;
  final List<Address> addresses;
  final List<PaymentMethod> paymentMethods;
  final NotificationPreferences? notificationPreferences;
  final bool isLoading;
  final bool isUpdatingProfile;
  final bool isUploadingImage;
  final String? error;
  final String? successMessage;

  const ProfileState({
    this.user,
    this.addresses = const [],
    this.paymentMethods = const [],
    this.notificationPreferences,
    this.isLoading = false,
    this.isUpdatingProfile = false,
    this.isUploadingImage = false,
    this.error,
    this.successMessage,
  });

  ProfileState copyWith({
    AppUser? user,
    List<Address>? addresses,
    List<PaymentMethod>? paymentMethods,
    NotificationPreferences? notificationPreferences,
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
      notificationPreferences: notificationPreferences ?? this.notificationPreferences,
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
  final ProfileRepository _profileRepository;

  ProfileNotifier(this._profileRepository) : super(const AsyncValue.loading()) {
    _initialize();
  }

  /// Initialize profile data
  Future<void> _initialize() async {
    try {
      await loadUserProfile();
      await loadAddresses();
      await loadPaymentMethods();
      await loadNotificationPreferences();
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  /// Load user profile
  Future<void> loadUserProfile() async {
    state = const AsyncValue.loading();

    try {
      final user = await _profileRepository.getProfile('current_user_id');
      state = AsyncValue.data(ProfileState(user: user));
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  /// Update profile
  Future<void> updateProfile({
    String? fullName,
    String? email,
    String? phoneNumber,
    File? avatar,
  }) async {
    if (state.value == null) return;

    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(isUpdatingProfile: true));

    try {
      // Create updated user object
      final currentUser = currentState.user;
      if (currentUser == null) return;

      final updatedUser = currentUser.copyWith(
        firstName: fullName?.split(' ').first,
        lastName: fullName?.split(' ').skip(1).join(' '),
        email: email ?? currentUser.email,
        phone: phoneNumber,
      );

      final success = await _profileRepository.updateProfile(updatedUser);

      if (success) {
        state = AsyncValue.data(currentState.copyWith(
          user: updatedUser,
          isUpdatingProfile: false,
          successMessage: 'Profil mis à jour avec succès',
          error: null,
        ));
      } else {
        throw Exception('Failed to update profile');
      }
    } catch (e) {
      state = AsyncValue.data(currentState.copyWith(
        isUpdatingProfile: false,
        error: e.toString(),
      ));
    }
  }

  /// Upload profile image
  Future<void> uploadProfileImage(File imageFile) async {
    if (state.value == null) return;

    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(isUploadingImage: true));

    try {
      final imageUrl = await _profileRepository.updateAvatar(
        currentState.user?.id ?? 'current_user_id',
        imageFile.path,
      );

      if (imageUrl != null && currentState.user != null) {
        final updatedUser = currentState.user!.copyWith(avatar: imageUrl);
        state = AsyncValue.data(currentState.copyWith(
          user: updatedUser,
          isUploadingImage: false,
          successMessage: 'Photo de profil mise à jour',
          error: null,
        ));
      } else {
        throw Exception('Failed to upload image');
      }
    } catch (e) {
      state = AsyncValue.data(currentState.copyWith(
        isUploadingImage: false,
        error: e.toString(),
      ));
    }
  }

  /// Update profile picture (alias for uploadProfileImage)
  Future<void> updateProfilePicture(String imagePath) async {
    final imageFile = File(imagePath);
    await uploadProfileImage(imageFile);
  }

  /// Delete profile image
  Future<void> deleteProfileImage() async {
    if (state.value == null) return;

    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(isUploadingImage: true));

    try {
      // TODO: Implement actual delete functionality when repository method is available
      if (currentState.user != null) {
        final updatedUser = currentState.user!.copyWith(avatar: null);
        state = AsyncValue.data(currentState.copyWith(
          user: updatedUser,
          isUploadingImage: false,
          successMessage: 'Photo de profil supprimée',
          error: null,
        ));
      }
    } catch (e) {
      state = AsyncValue.data(currentState.copyWith(
        isUploadingImage: false,
        error: e.toString(),
      ));
    }
  }

  /// Load addresses
  Future<void> loadAddresses() async {
    if (state.value == null) return;

    try {
      final addresses = await _profileRepository.getAddresses(
        state.value!.user?.id ?? 'current_user_id',
      );

      if (state.value != null) {
        state = AsyncValue.data(state.value!.copyWith(
          addresses: addresses,
          error: null,
        ));
      }
    } catch (e) {
      if (state.value != null) {
        state = AsyncValue.data(state.value!.copyWith(
          error: e.toString(),
        ));
      }
    }
  }

  /// Add address
  Future<void> addAddress(Address address) async {
    if (state.value == null) return;
    
    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(isLoading: true));
    
    try {
      final success = await _profileRepository.addAddress(
        currentState.user?.id ?? 'current_user_id',
        address,
      );

      if (success) {
        final updatedAddresses = [...currentState.addresses, address];
        state = AsyncValue.data(currentState.copyWith(
          addresses: updatedAddresses,
          isLoading: false,
          successMessage: 'Adresse ajoutée avec succès',
          error: null,
        ));
      } else {
        throw Exception('Failed to add address');
      }
    } catch (e) {
      state = AsyncValue.data(currentState.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  /// Update address
  Future<void> updateAddress(Address address) async {
    if (state.value == null) return;
    
    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(isLoading: true));
    
    final result = await _profileRepository.updateAddress(address);
    
    result.when(
      success: (updatedAddress) {
        final updatedAddresses = currentState.addresses
            .map((a) => a.id == updatedAddress.id ? updatedAddress : a)
            .toList();
        
        state = AsyncValue.data(currentState.copyWith(
          addresses: updatedAddresses,
          isLoading: false,
          successMessage: 'Adresse mise à jour avec succès',
          error: null,
        ));
      },
      failure: (failure) {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: failure.message,
        ));
      },
    );
  }

  /// Delete address
  Future<void> deleteAddress(String addressId) async {
    if (state.value == null) return;
    
    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(isLoading: true));
    
    final result = await _profileRepository.deleteAddress(addressId);
    
    result.when(
      success: (_) {
        final updatedAddresses = currentState.addresses
            .where((a) => a.id != addressId)
            .toList();
        
        state = AsyncValue.data(currentState.copyWith(
          addresses: updatedAddresses,
          isLoading: false,
          successMessage: 'Adresse supprimée avec succès',
          error: null,
        ));
      },
      failure: (failure) {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: failure.message,
        ));
      },
    );
  }

  /// Set default address
  Future<void> setDefaultAddress(String addressId) async {
    if (state.value == null) return;
    
    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(isLoading: true));
    
    final result = await _profileRepository.setDefaultAddress(addressId);
    
    result.when(
      success: (_) {
        final updatedAddresses = currentState.addresses
            .map((a) => a.copyWith(isDefault: a.id == addressId))
            .toList();
        
        state = AsyncValue.data(currentState.copyWith(
          addresses: updatedAddresses,
          isLoading: false,
          successMessage: 'Adresse par défaut mise à jour',
          error: null,
        ));
      },
      failure: (failure) {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: failure.message,
        ));
      },
    );
  }

  /// Load payment methods
  Future<void> loadPaymentMethods() async {
    if (state.value == null) return;
    
    final result = await _profileRepository.getPaymentMethods();
    
    result.when(
      success: (methods) {
        if (state.value != null) {
          state = AsyncValue.data(state.value!.copyWith(
            paymentMethods: methods,
            error: null,
          ));
        }
      },
      failure: (failure) {
        if (state.value != null) {
          state = AsyncValue.data(state.value!.copyWith(
            error: failure.message,
          ));
        }
      },
    );
  }

  /// Add payment method
  Future<void> addPaymentMethod(PaymentMethod method) async {
    if (state.value == null) return;
    
    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(isLoading: true));
    
    final result = await _profileRepository.addPaymentMethod(method);
    
    result.when(
      success: (newMethod) {
        final updatedMethods = [...currentState.paymentMethods, newMethod];
        state = AsyncValue.data(currentState.copyWith(
          paymentMethods: updatedMethods,
          isLoading: false,
          successMessage: 'Moyen de paiement ajouté avec succès',
          error: null,
        ));
      },
      failure: (failure) {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: failure.message,
        ));
      },
    );
  }

  /// Update payment method
  Future<void> updatePaymentMethod(PaymentMethod method) async {
    if (state.value == null) return;
    
    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(isLoading: true));
    
    final result = await _profileRepository.updatePaymentMethod(method);
    
    result.when(
      success: (updatedMethod) {
        final updatedMethods = currentState.paymentMethods
            .map((m) => m.id == updatedMethod.id ? updatedMethod : m)
            .toList();
        
        state = AsyncValue.data(currentState.copyWith(
          paymentMethods: updatedMethods,
          isLoading: false,
          successMessage: 'Moyen de paiement mis à jour avec succès',
          error: null,
        ));
      },
      failure: (failure) {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: failure.message,
        ));
      },
    );
  }

  /// Delete payment method
  Future<void> deletePaymentMethod(String methodId) async {
    if (state.value == null) return;
    
    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(isLoading: true));
    
    final result = await _profileRepository.deletePaymentMethod(methodId);
    
    result.when(
      success: (_) {
        final updatedMethods = currentState.paymentMethods
            .where((m) => m.id != methodId)
            .toList();
        
        state = AsyncValue.data(currentState.copyWith(
          paymentMethods: updatedMethods,
          isLoading: false,
          successMessage: 'Moyen de paiement supprimé avec succès',
          error: null,
        ));
      },
      failure: (failure) {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: failure.message,
        ));
      },
    );
  }

  /// Set default payment method
  Future<void> setDefaultPaymentMethod(String methodId) async {
    if (state.value == null) return;
    
    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(isLoading: true));
    
    final result = await _profileRepository.setDefaultPaymentMethod(methodId);
    
    result.when(
      success: (_) {
        final updatedMethods = currentState.paymentMethods
            .map((m) => m.copyWith(isDefault: m.id == methodId))
            .toList();
        
        state = AsyncValue.data(currentState.copyWith(
          paymentMethods: updatedMethods,
          isLoading: false,
          successMessage: 'Moyen de paiement par défaut mis à jour',
          error: null,
        ));
      },
      failure: (failure) {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: failure.message,
        ));
      },
    );
  }

  /// Load notification preferences
  Future<void> loadNotificationPreferences() async {
    if (state.value == null) return;
    
    final result = await _profileRepository.getNotificationPreferences();
    
    result.when(
      success: (preferences) {
        if (state.value != null) {
          state = AsyncValue.data(state.value!.copyWith(
            notificationPreferences: preferences,
            error: null,
          ));
        }
      },
      failure: (failure) {
        if (state.value != null) {
          state = AsyncValue.data(state.value!.copyWith(
            error: failure.message,
          ));
        }
      },
    );
  }

  /// Update notification preferences
  Future<void> updateNotificationPreferences(
    NotificationPreferences preferences,
  ) async {
    if (state.value == null) return;
    
    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(isLoading: true));
    
    final result = await _profileRepository.updateNotificationPreferences(preferences);
    
    result.when(
      success: (updatedPreferences) {
        state = AsyncValue.data(currentState.copyWith(
          notificationPreferences: updatedPreferences,
          isLoading: false,
          successMessage: 'Préférences de notification mises à jour',
          error: null,
        ));
      },
      failure: (failure) {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
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
    state = AsyncValue.data(currentState.copyWith(isLoading: true));
    
    final result = await _profileRepository.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    
    result.when(
      success: (_) {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          successMessage: 'Mot de passe changé avec succès',
          error: null,
        ));
      },
      failure: (failure) {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: failure.message,
        ));
      },
    );
  }

  /// Toggle two-factor authentication
  Future<void> toggleTwoFactorAuth(bool enable) async {
    if (state.value == null) return;
    
    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(isLoading: true));
    
    final result = await _profileRepository.toggleTwoFactorAuth(enable);
    
    result.when(
      success: (_) {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          successMessage: enable 
              ? 'Authentification à deux facteurs activée'
              : 'Authentification à deux facteurs désactivée',
          error: null,
        ));
      },
      failure: (failure) {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: failure.message,
        ));
      },
    );
  }

  /// Delete account
  Future<void> deleteAccount({
    required String password,
    String? reason,
  }) async {
    if (state.value == null) return;
    
    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(isLoading: true));
    
    final result = await _profileRepository.deleteAccount(
      password: password,
      reason: reason,
    );
    
    result.when(
      success: (_) {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          successMessage: 'Compte supprimé avec succès',
          error: null,
        ));
      },
      failure: (failure) {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
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

/// Provider for profile state
final profileProvider = StateNotifierProvider<ProfileNotifier, AsyncValue<ProfileState>>((ref) {
  final profileRepository = ref.read(profileRepositoryProvider);
  return ProfileNotifier(profileRepository);
});
