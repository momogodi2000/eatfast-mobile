import 'package:eatfast_mobile/shared/services/auth/models/app_user.dart';
import 'package:eatfast_mobile/shared/services/api/api_client.dart';
import '../domain/profile_repository.dart';

/// Profile Repository Implementation
/// TODO: Replace mock data with actual API calls when backend is ready
class ProfileRepositoryImpl implements ProfileRepository {
  // ignore: unused_field
  final ApiClient _apiClient;

  ProfileRepositoryImpl({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  @override
  Future<AppUser?> getProfile(String userId) async {
    try {
      // TODO: Implement actual API call
      // final response = await _apiClient.get('${ApiConstants.profile}/$userId');
      // return AppUser.fromJson(response.data);

      // Mock implementation
      await Future.delayed(const Duration(milliseconds: 500));
      return null; // Return null for now - implement when API is ready
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> updateProfile(AppUser profile) async {
    try {
      // TODO: Implement actual API call
      // await _apiClient.put(ApiConstants.updateProfile, data: profile.toJson());

      // Mock implementation
      await Future.delayed(const Duration(milliseconds: 500));
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String?> updateAvatar(String userId, String imagePath) async {
    try {
      // TODO: Implement actual API call with image upload
      // final response = await _apiClient.uploadFile(
      //   ApiConstants.uploadImage,
      //   imagePath,
      // );
      // return response.data['url'];

      // Mock implementation
      await Future.delayed(const Duration(milliseconds: 800));
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Address>> getAddresses(String userId) async {
    try {
      // TODO: Implement actual API call
      // final response = await _apiClient.get('${ApiConstants.addresses}?userId=$userId');
      // return (response.data as List).map((json) => Address.fromJson(json)).toList();

      // Mock implementation - return empty list for now
      await Future.delayed(const Duration(milliseconds: 500));
      return [];
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> addAddress(String userId, Address address) async {
    try {
      // TODO: Implement actual API call
      // await _apiClient.post(
      //   ApiConstants.addAddress,
      //   data: {'userId': userId, ...address.toJson()},
      // );

      // Mock implementation
      await Future.delayed(const Duration(milliseconds: 500));
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateAddress(String addressId, Address address) async {
    try {
      // TODO: Implement actual API call
      // await _apiClient.put(
      //   ApiConstants.updateAddress.replaceAll('{id}', addressId),
      //   data: address.toJson(),
      // );

      // Mock implementation
      await Future.delayed(const Duration(milliseconds: 500));
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteAddress(String addressId) async {
    try {
      // TODO: Implement actual API call
      // await _apiClient.delete(
      //   ApiConstants.deleteAddress.replaceAll('{id}', addressId),
      // );

      // Mock implementation
      await Future.delayed(const Duration(milliseconds: 500));
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> setDefaultAddress(String userId, String addressId) async {
    try {
      // TODO: Implement actual API call
      // await _apiClient.patch(
      //   '${ApiConstants.addresses}/$addressId/default',
      //   data: {'userId': userId},
      // );

      // Mock implementation
      await Future.delayed(const Duration(milliseconds: 500));
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<PaymentMethod>> getPaymentMethods(String userId) async {
    try {
      // TODO: Implement actual API call
      // final response = await _apiClient.get('${ApiConstants.paymentMethods}?userId=$userId');
      // return (response.data as List).map((json) => PaymentMethod.fromJson(json)).toList();

      // Mock implementation
      await Future.delayed(const Duration(milliseconds: 500));
      return [];
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> addPaymentMethod(String userId, PaymentMethod paymentMethod) async {
    try {
      // TODO: Implement actual API call
      // await _apiClient.post(
      //   ApiConstants.paymentMethods,
      //   data: {'userId': userId, ...paymentMethod.toJson()},
      // );

      // Mock implementation
      await Future.delayed(const Duration(milliseconds: 500));
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deletePaymentMethod(String paymentMethodId) async {
    try {
      // TODO: Implement actual API call
      // await _apiClient.delete('${ApiConstants.paymentMethods}/$paymentMethodId');

      // Mock implementation
      await Future.delayed(const Duration(milliseconds: 500));
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateNotificationPreferences(
    String userId,
    NotificationPreferences preferences,
  ) async {
    try {
      // TODO: Implement actual API call
      // await _apiClient.put(
      //   ApiConstants.notificationPreferences,
      //   data: {'userId': userId, ...preferences.toJson()},
      // );

      // Mock implementation
      await Future.delayed(const Duration(milliseconds: 500));
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> changePassword(
    String userId,
    String currentPassword,
    String newPassword,
  ) async {
    try {
      // TODO: Implement actual API call
      // await _apiClient.post(
      //   '${ApiConstants.profile}/$userId/change-password',
      //   data: {
      //     'currentPassword': currentPassword,
      //     'newPassword': newPassword,
      //   },
      // );

      // Mock implementation
      await Future.delayed(const Duration(milliseconds: 500));
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteAccount(String userId) async {
    try {
      // TODO: Implement actual API call
      // await _apiClient.delete('${ApiConstants.profile}/$userId');

      // Mock implementation
      await Future.delayed(const Duration(milliseconds: 500));
      return true;
    } catch (e) {
      return false;
    }
  }
}
