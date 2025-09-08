import 'dart:io';
import 'package:dio/dio.dart';

import '../../../core/result.dart';
import '../../../core/failure.dart' as core_failure;
import '../../../core/network/api_client.dart';
import '../domain/profile_api_repository.dart';
import '../domain/profile_user.dart';

/// Implementation of profile repository using real backend API
class ProfileApiRepositoryImpl implements ProfileApiRepository {
  final ApiClient _apiClient;

  ProfileApiRepositoryImpl(this._apiClient);

  @override
  Future<Result<ProfileUser, core_failure.Failure>> getUserProfile() async {
    try {
      final response = await _apiClient.get('/api/client/profile');
      
      // Parse response according to backend API schema
      final profileData = response.data['data'] ?? response.data;
      final user = ProfileUser.fromJson(profileData);
      
      return Result.success(user);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<ProfileUser, core_failure.Failure>> updateProfile(ProfileUpdateRequest request) async {
    try {
      final response = await _apiClient.put(
        '/api/client/profile',
        data: request.toJson(),
      );
      
      final profileData = response.data['data'] ?? response.data;
      final user = ProfileUser.fromJson(profileData);
      
      return Result.success(user);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<String, core_failure.Failure>> uploadProfileImage(File imageFile) async {
    try {
      // Validate file size (max 5MB)
      final fileSize = await imageFile.length();
      if (fileSize > 5 * 1024 * 1024) {
        return Result.failure(core_failure.Failure.validationError(
          'La taille de l\'image ne doit pas dépasser 5MB'
        ));
      }

      // Validate file type
      final fileName = imageFile.path.split('/').last;
      final extension = fileName.split('.').last.toLowerCase();
      if (!['jpg', 'jpeg', 'png', 'webp'].contains(extension)) {
        return Result.failure(core_failure.Failure.validationError(
          'Format d\'image non supporté. Utilisez JPG, PNG ou WebP'
        ));
      }

      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          imageFile.path,
          filename: 'profile_image.$extension',
        ),
      });

      final response = await _apiClient.post(
        '/api/client/profile/avatar',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      final imageUrl = response.data['data']['imageUrl'] as String;
      return Result.success(imageUrl);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<void, core_failure.Failure>> deleteProfileImage() async {
    try {
      await _apiClient.delete('/api/client/profile/avatar');
      return Result.success(null);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<void, core_failure.Failure>> changePassword(PasswordChangeRequest request) async {
    try {
      await _apiClient.post(
        '/api/client/profile/password',
        data: request.toJson(),
      );
      return Result.success(null);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<List<UserAddress>, core_failure.Failure>> getAddresses() async {
    try {
      final response = await _apiClient.get('/api/client/addresses');
      
      final addressesData = response.data['data'] as List;
      final addresses = addressesData
          .map((json) => UserAddress.fromJson(json as Map<String, dynamic>))
          .toList();
      
      return Result.success(addresses);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<UserAddress, core_failure.Failure>> addAddress(AddressCreateRequest request) async {
    try {
      final response = await _apiClient.post(
        '/api/client/addresses',
        data: request.toJson(),
      );
      
      final addressData = response.data['data'] ?? response.data;
      final address = UserAddress.fromJson(addressData);
      
      return Result.success(address);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<UserAddress, core_failure.Failure>> updateAddress(
    String addressId, 
    AddressUpdateRequest request
  ) async {
    try {
      final response = await _apiClient.put(
        '/api/client/addresses/$addressId',
        data: request.toJson(),
      );
      
      final addressData = response.data['data'] ?? response.data;
      final address = UserAddress.fromJson(addressData);
      
      return Result.success(address);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<void, core_failure.Failure>> deleteAddress(String addressId) async {
    try {
      await _apiClient.delete('/api/client/addresses/$addressId');
      return Result.success(null);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<UserPreferences, core_failure.Failure>> updatePreferences(UserPreferences preferences) async {
    try {
      final response = await _apiClient.put(
        '/api/client/profile/preferences',
        data: preferences.toJson(),
      );
      
      final preferencesData = response.data['data'] ?? response.data;
      final updatedPreferences = UserPreferences.fromJson(preferencesData);
      
      return Result.success(updatedPreferences);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }
}
