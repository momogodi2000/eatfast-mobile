/// Unified Profile Repository - Backend Aligned
/// Consolidates all profile functionality and aligns with backend API

import 'dart:io';
import 'package:dio/dio.dart';
import '../../../core/services/api/api_client.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/auth/models/app_user.dart';

class UnifiedProfileRepository {
  final ApiClient _apiClient;

  UnifiedProfileRepository(this._apiClient);

  /// Get user profile from backend
  Future<ProfileResult<AppUser>> getUserProfile() async {
    try {
      final response = await _apiClient.get(ApiConstants.clientProfile);

      if (response.statusCode == 200) {
        final profileData = response.data['data'] ?? response.data;
        final user = AppUser.fromJson(profileData);
        return ProfileResult.success(user);
      } else {
        return ProfileResult.failure(
          response.data['message'] ?? 'Failed to load profile',
        );
      }
    } on DioException catch (e) {
      return ProfileResult.failure(_handleDioError(e));
    } catch (e) {
      return ProfileResult.failure('Unexpected error: $e');
    }
  }

  /// Update user profile
  Future<ProfileResult<AppUser>> updateProfile(ProfileUpdateRequest request) async {
    try {
      final response = await _apiClient.put(
        ApiConstants.clientProfile,
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        final profileData = response.data['data'] ?? response.data;
        final user = AppUser.fromJson(profileData);
        return ProfileResult.success(user);
      } else {
        return ProfileResult.failure(
          response.data['message'] ?? 'Failed to update profile',
        );
      }
    } on DioException catch (e) {
      return ProfileResult.failure(_handleDioError(e));
    } catch (e) {
      return ProfileResult.failure('Unexpected error: $e');
    }
  }

  /// Upload profile avatar
  Future<ProfileResult<String>> uploadAvatar(File imageFile) async {
    try {
      final formData = FormData.fromMap({
        'avatar': await MultipartFile.fromFile(
          imageFile.path,
          filename: 'avatar.jpg',
        ),
      });

      final response = await _apiClient.post(
        '${ApiConstants.clientProfile}/avatar',
        data: formData,
      );

      if (response.statusCode == 200) {
        final avatarUrl = response.data['avatarUrl'] ?? response.data['data']['avatarUrl'];
        return ProfileResult.success(avatarUrl);
      } else {
        return ProfileResult.failure(
          response.data['message'] ?? 'Failed to upload avatar',
        );
      }
    } on DioException catch (e) {
      return ProfileResult.failure(_handleDioError(e));
    } catch (e) {
      return ProfileResult.failure('Unexpected error: $e');
    }
  }

  /// Delete profile avatar
  Future<ProfileResult<void>> deleteAvatar() async {
    try {
      final response = await _apiClient.delete('${ApiConstants.clientProfile}/avatar');

      if (response.statusCode == 200) {
        return ProfileResult.success(null);
      } else {
        return ProfileResult.failure(
          response.data['message'] ?? 'Failed to delete avatar',
        );
      }
    } on DioException catch (e) {
      return ProfileResult.failure(_handleDioError(e));
    } catch (e) {
      return ProfileResult.failure('Unexpected error: $e');
    }
  }

  /// Get user addresses
  Future<ProfileResult<List<UserAddress>>> getUserAddresses() async {
    try {
      final response = await _apiClient.get('${ApiConstants.clientProfile}/addresses');

      if (response.statusCode == 200) {
        final addressesData = response.data['data'] ?? response.data['addresses'] ?? [];
        final addresses = (addressesData as List)
            .map((json) => UserAddress.fromJson(json))
            .toList();
        return ProfileResult.success(addresses);
      } else {
        return ProfileResult.failure(
          response.data['message'] ?? 'Failed to load addresses',
        );
      }
    } on DioException catch (e) {
      return ProfileResult.failure(_handleDioError(e));
    } catch (e) {
      return ProfileResult.failure('Unexpected error: $e');
    }
  }

  /// Add new address
  Future<ProfileResult<UserAddress>> addAddress(AddressRequest request) async {
    try {
      final response = await _apiClient.post(
        '${ApiConstants.clientProfile}/addresses',
        data: request.toJson(),
      );

      if (response.statusCode == 201) {
        final addressData = response.data['data'] ?? response.data;
        final address = UserAddress.fromJson(addressData);
        return ProfileResult.success(address);
      } else {
        return ProfileResult.failure(
          response.data['message'] ?? 'Failed to add address',
        );
      }
    } on DioException catch (e) {
      return ProfileResult.failure(_handleDioError(e));
    } catch (e) {
      return ProfileResult.failure('Unexpected error: $e');
    }
  }

  /// Update address
  Future<ProfileResult<UserAddress>> updateAddress(
    String addressId,
    AddressRequest request,
  ) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.clientProfile}/addresses/$addressId',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        final addressData = response.data['data'] ?? response.data;
        final address = UserAddress.fromJson(addressData);
        return ProfileResult.success(address);
      } else {
        return ProfileResult.failure(
          response.data['message'] ?? 'Failed to update address',
        );
      }
    } on DioException catch (e) {
      return ProfileResult.failure(_handleDioError(e));
    } catch (e) {
      return ProfileResult.failure('Unexpected error: $e');
    }
  }

  /// Delete address
  Future<ProfileResult<void>> deleteAddress(String addressId) async {
    try {
      final response = await _apiClient.delete(
        '${ApiConstants.clientProfile}/addresses/$addressId',
      );

      if (response.statusCode == 200) {
        return ProfileResult.success(null);
      } else {
        return ProfileResult.failure(
          response.data['message'] ?? 'Failed to delete address',
        );
      }
    } on DioException catch (e) {
      return ProfileResult.failure(_handleDioError(e));
    } catch (e) {
      return ProfileResult.failure('Unexpected error: $e');
    }
  }

  /// Set default address
  Future<ProfileResult<void>> setDefaultAddress(String addressId) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.clientProfile}/addresses/$addressId/default',
      );

      if (response.statusCode == 200) {
        return ProfileResult.success(null);
      } else {
        return ProfileResult.failure(
          response.data['message'] ?? 'Failed to set default address',
        );
      }
    } on DioException catch (e) {
      return ProfileResult.failure(_handleDioError(e));
    } catch (e) {
      return ProfileResult.failure('Unexpected error: $e');
    }
  }

  /// Get payment methods
  Future<ProfileResult<List<PaymentMethod>>> getPaymentMethods() async {
    try {
      final response = await _apiClient.get(ApiConstants.clientPaymentMethods);

      if (response.statusCode == 200) {
        final methodsData = response.data['data'] ?? response.data['methods'] ?? [];
        final methods = (methodsData as List)
            .map((json) => PaymentMethod.fromJson(json))
            .toList();
        return ProfileResult.success(methods);
      } else {
        return ProfileResult.failure(
          response.data['message'] ?? 'Failed to load payment methods',
        );
      }
    } on DioException catch (e) {
      return ProfileResult.failure(_handleDioError(e));
    } catch (e) {
      return ProfileResult.failure('Unexpected error: $e');
    }
  }

  /// Add payment method
  Future<ProfileResult<PaymentMethod>> addPaymentMethod(
    PaymentMethodRequest request,
  ) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.clientPaymentMethods,
        data: request.toJson(),
      );

      if (response.statusCode == 201) {
        final methodData = response.data['data'] ?? response.data;
        final method = PaymentMethod.fromJson(methodData);
        return ProfileResult.success(method);
      } else {
        return ProfileResult.failure(
          response.data['message'] ?? 'Failed to add payment method',
        );
      }
    } on DioException catch (e) {
      return ProfileResult.failure(_handleDioError(e));
    } catch (e) {
      return ProfileResult.failure('Unexpected error: $e');
    }
  }

  /// Delete payment method
  Future<ProfileResult<void>> deletePaymentMethod(String methodId) async {
    try {
      final response = await _apiClient.delete(
        '${ApiConstants.clientPaymentMethods}/$methodId',
      );

      if (response.statusCode == 200) {
        return ProfileResult.success(null);
      } else {
        return ProfileResult.failure(
          response.data['message'] ?? 'Failed to delete payment method',
        );
      }
    } on DioException catch (e) {
      return ProfileResult.failure(_handleDioError(e));
    } catch (e) {
      return ProfileResult.failure('Unexpected error: $e');
    }
  }

  /// Change password
  Future<ProfileResult<void>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.clientProfile}/password',
        data: {
          'currentPassword': currentPassword,
          'newPassword': newPassword,
          'confirmPassword': confirmPassword,
        },
      );

      if (response.statusCode == 200) {
        return ProfileResult.success(null);
      } else {
        return ProfileResult.failure(
          response.data['message'] ?? 'Failed to change password',
        );
      }
    } on DioException catch (e) {
      return ProfileResult.failure(_handleDioError(e));
    } catch (e) {
      return ProfileResult.failure('Unexpected error: $e');
    }
  }

  /// Delete account
  Future<ProfileResult<void>> deleteAccount(String password) async {
    try {
      final response = await _apiClient.delete(
        ApiConstants.clientProfile,
        data: {'password': password},
      );

      if (response.statusCode == 200) {
        return ProfileResult.success(null);
      } else {
        return ProfileResult.failure(
          response.data['message'] ?? 'Failed to delete account',
        );
      }
    } on DioException catch (e) {
      return ProfileResult.failure(_handleDioError(e));
    } catch (e) {
      return ProfileResult.failure('Unexpected error: $e');
    }
  }

  String _handleDioError(DioException error) {
    if (error.response != null) {
      final data = error.response!.data;
      if (data is Map<String, dynamic> && data.containsKey('message')) {
        return data['message'];
      }
      return 'Server error: ${error.response!.statusCode}';
    }
    return 'Network error occurred';
  }
}

// Result wrapper
class ProfileResult<T> {
  final bool isSuccess;
  final T? data;
  final String? error;

  ProfileResult._({
    required this.isSuccess,
    this.data,
    this.error,
  });

  factory ProfileResult.success(T data) {
    return ProfileResult._(isSuccess: true, data: data);
  }

  factory ProfileResult.failure(String error) {
    return ProfileResult._(isSuccess: false, error: error);
  }
}

// Request models

class ProfileUpdateRequest {
  final String? name;
  final String? email;
  final String? phone;
  final String? bio;
  final Map<String, dynamic>? preferences;

  ProfileUpdateRequest({
    this.name,
    this.email,
    this.phone,
    this.bio,
    this.preferences,
  });

  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (bio != null) 'bio': bio,
      if (preferences != null) 'preferences': preferences,
    };
  }
}

class AddressRequest {
  final String label;
  final String address;
  final double latitude;
  final double longitude;
  final String? instructions;
  final bool isDefault;

  AddressRequest({
    required this.label,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.instructions,
    this.isDefault = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'instructions': instructions,
      'isDefault': isDefault,
    };
  }
}

class PaymentMethodRequest {
  final String type;
  final Map<String, dynamic> details;

  PaymentMethodRequest({
    required this.type,
    required this.details,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'details': details,
    };
  }
}

// Data models

class UserAddress {
  final String id;
  final String label;
  final String address;
  final double latitude;
  final double longitude;
  final String? instructions;
  final bool isDefault;

  UserAddress({
    required this.id,
    required this.label,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.instructions,
    this.isDefault = false,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) {
    return UserAddress(
      id: json['id'] ?? json['_id'] ?? '',
      label: json['label'] ?? '',
      address: json['address'] ?? '',
      latitude: (json['latitude'] ?? 0).toDouble(),
      longitude: (json['longitude'] ?? 0).toDouble(),
      instructions: json['instructions'],
      isDefault: json['isDefault'] ?? false,
    );
  }
}

class PaymentMethod {
  final String id;
  final String type;
  final String label;
  final Map<String, dynamic> details;
  final bool isDefault;

  PaymentMethod({
    required this.id,
    required this.type,
    required this.label,
    required this.details,
    this.isDefault = false,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'] ?? json['_id'] ?? '',
      type: json['type'] ?? '',
      label: json['label'] ?? '',
      details: Map<String, dynamic>.from(json['details'] ?? {}),
      isDefault: json['isDefault'] ?? false,
    );
  }
}