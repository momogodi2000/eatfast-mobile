import 'dart:io';
import 'package:dio/dio.dart';

import '../../../core/result.dart';
import '../../../core/failure.dart' as core_failure;
import '../../../core/network/api_client.dart';
import '../../auth/domain/user.dart';
import '../domain/profile_repository.dart';
import '../domain/models.dart';

/// Implementation of profile repository using API
class ProfileRepositoryImpl implements ProfileRepository {
  final ApiClient _apiClient;

  ProfileRepositoryImpl(this._apiClient);

  @override
  Future<Result<User, core_failure.Failure>> getUserProfile() async {
    try {
      final response = await _apiClient.get('/user/profile');
      final user = User.fromJson(response.data['user']);
      return Result.success(user);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<User, core_failure.Failure>> updateProfile({
    String? fullName,
    String? email,
    String? phoneNumber,
    File? avatar,
  }) async {
    try {
      final data = <String, dynamic>{};
      
      if (fullName != null) data['fullName'] = fullName;
      if (email != null) data['email'] = email;
      if (phoneNumber != null) data['phoneNumber'] = phoneNumber;
      
      FormData formData;
      
      if (avatar != null) {
        formData = FormData.fromMap({
          ...data,
          'avatar': await MultipartFile.fromFile(
            avatar.path,
            filename: 'avatar.jpg',
          ),
        });
      } else {
        formData = FormData.fromMap(data);
      }

      final response = await _apiClient.put(
        '/user/profile',
        data: formData,
      );
      
      final user = User.fromJson(response.data['user']);
      return Result.success(user);
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<String, core_failure.Failure>> uploadProfileImage(File imageFile) async {
    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          imageFile.path,
          filename: 'profile_image.jpg',
        ),
      });

      final response = await _apiClient.post(
        '/user/avatar',
        data: formData,
      );

      final imageUrl = response.data['imageUrl'] as String;
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
      await _apiClient.delete('/user/avatar');
      return const Result.success(null);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<List<Address>, core_failure.Failure>> getAddresses() async {
    try {
      final response = await _apiClient.get('/user/addresses');
      final addresses = (response.data['addresses'] as List)
          .map((json) => Address.fromJson(json))
          .toList();
      return Result.success(addresses);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<Address, core_failure.Failure>> addAddress(Address address) async {
    try {
      final response = await _apiClient.post(
        '/user/addresses',
        data: address.toJson(),
      );
      final newAddress = Address.fromJson(response.data['address']);
      return Result.success(newAddress);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<Address, core_failure.Failure>> updateAddress(Address address) async {
    try {
      final response = await _apiClient.put(
        '/user/addresses/${address.id}',
        data: address.toJson(),
      );
      final updatedAddress = Address.fromJson(response.data['address']);
      return Result.success(updatedAddress);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<void, core_failure.Failure>> deleteAddress(String addressId) async {
    try {
      await _apiClient.delete('/user/addresses/$addressId');
      return const Result.success(null);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<void, core_failure.Failure>> setDefaultAddress(String addressId) async {
    try {
      await _apiClient.put(
        '/user/addresses/$addressId/default',
      );
      return const Result.success(null);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<List<PaymentMethod>, core_failure.Failure>> getPaymentMethods() async {
    try {
      final response = await _apiClient.get('/user/payment-methods');
      final methods = (response.data['paymentMethods'] as List)
          .map((json) => PaymentMethod.fromJson(json))
          .toList();
      return Result.success(methods);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<PaymentMethod, core_failure.Failure>> addPaymentMethod(
    PaymentMethod method,
  ) async {
    try {
      final response = await _apiClient.post(
        '/user/payment-methods',
        data: method.toJson(),
      );
      final newMethod = PaymentMethod.fromJson(response.data['paymentMethod']);
      return Result.success(newMethod);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<PaymentMethod, core_failure.Failure>> updatePaymentMethod(
    PaymentMethod method,
  ) async {
    try {
      final response = await _apiClient.put(
        '/user/payment-methods/${method.id}',
        data: method.toJson(),
      );
      final updatedMethod = PaymentMethod.fromJson(response.data['paymentMethod']);
      return Result.success(updatedMethod);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<void, core_failure.Failure>> deletePaymentMethod(String methodId) async {
    try {
      await _apiClient.delete('/user/payment-methods/$methodId');
      return const Result.success(null);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<void, core_failure.Failure>> setDefaultPaymentMethod(String methodId) async {
    try {
      await _apiClient.put(
        '/user/payment-methods/$methodId/default',
      );
      return const Result.success(null);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<NotificationPreferences, core_failure.Failure>>
      getNotificationPreferences() async {
    try {
      final response = await _apiClient.get('/user/notification-preferences');
      final preferences = NotificationPreferences.fromJson(
        response.data['preferences'],
      );
      return Result.success(preferences);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<NotificationPreferences, core_failure.Failure>>
      updateNotificationPreferences(NotificationPreferences preferences) async {
    try {
      final response = await _apiClient.put(
        '/user/notification-preferences',
        data: preferences.toJson(),
      );
      final updatedPreferences = NotificationPreferences.fromJson(
        response.data['preferences'],
      );
      return Result.success(updatedPreferences);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<void, core_failure.Failure>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await _apiClient.put(
        '/user/change-password',
        data: {
          'currentPassword': currentPassword,
          'newPassword': newPassword,
        },
      );
      return const Result.success(null);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<void, core_failure.Failure>> toggleTwoFactorAuth(bool enable) async {
    try {
      await _apiClient.put(
        '/user/two-factor-auth',
        data: {'enabled': enable},
      );
      return const Result.success(null);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<void, core_failure.Failure>> deleteAccount({
    required String password,
    String? reason,
  }) async {
    try {
      await _apiClient.delete(
        '/user/account',
        data: {
          'password': password,
          if (reason != null) 'reason': reason,
        },
      );
      return const Result.success(null);
    } on DioException catch (e) {
      return Result.failure(core_failure.Failure.fromDioError(e));
    } catch (e) {
      return Result.failure(core_failure.Failure.unknown(e.toString()));
    }
  }
}
