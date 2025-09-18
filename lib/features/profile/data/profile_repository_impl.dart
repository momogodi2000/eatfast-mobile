/// Profile Repository Implementation
/// Concrete implementation of profile data operations using API

import '../../../core/auth/models/app_user.dart';
import '../../../core/services/api/api_client.dart';
import '../../../core/constants/api_constants.dart';
import '../domain/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ApiClient _apiClient;

  ProfileRepositoryImpl(this._apiClient);

  @override
  Future<AppUser?> getProfile(String userId) async {
    try {
      final response = await _apiClient.get('${ApiConstants.clientProfile}/$userId');

      if (response.statusCode == 200) {
        return AppUser.fromJson(response.data);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get profile: $e');
    }
  }

  @override
  Future<bool> updateProfile(AppUser profile) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.clientProfile}/${profile.id}',
        data: profile.toJson(),
      );

      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Failed to update profile: $e');
    }
  }

  @override
  Future<String?> updateAvatar(String userId, String imagePath) async {
    try {
      // This would typically involve file upload
      // For now, return a placeholder implementation
      await Future.delayed(const Duration(milliseconds: 500));
      return 'https://example.com/avatar.jpg';
    } catch (e) {
      throw Exception('Failed to update avatar: $e');
    }
  }

  @override
  Future<List<Address>> getAddresses(String userId) async {
    try {
      final response = await _apiClient.get('${ApiConstants.addresses}?userId=$userId');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['addresses'] ?? [];
        return data.map((json) => Address.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to get addresses: $e');
    }
  }

  @override
  Future<bool> addAddress(String userId, Address address) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.addresses,
        data: {
          'userId': userId,
          ...address.toJson(),
        },
      );

      return response.statusCode == 201;
    } catch (e) {
      throw Exception('Failed to add address: $e');
    }
  }

  @override
  Future<bool> updateAddress(String addressId, Address address) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.addresses}/$addressId',
        data: address.toJson(),
      );

      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Failed to update address: $e');
    }
  }

  @override
  Future<bool> deleteAddress(String addressId) async {
    try {
      final response = await _apiClient.delete('${ApiConstants.addresses}/$addressId');
      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Failed to delete address: $e');
    }
  }

  @override
  Future<bool> setDefaultAddress(String userId, String addressId) async {
    try {
      final response = await _apiClient.patch(
        '${ApiConstants.defaultAddress}',
        data: {
          'userId': userId,
          'addressId': addressId,
        },
      );

      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Failed to set default address: $e');
    }
  }

  @override
  Future<List<PaymentMethod>> getPaymentMethods(String userId) async {
    try {
      final response = await _apiClient.get('${ApiConstants.paymentMethods}?userId=$userId');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['paymentMethods'] ?? [];
        return data.map((json) => PaymentMethod.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to get payment methods: $e');
    }
  }

  @override
  Future<bool> addPaymentMethod(String userId, PaymentMethod paymentMethod) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.paymentMethods,
        data: {
          'userId': userId,
          ...paymentMethod.toJson(),
        },
      );

      return response.statusCode == 201;
    } catch (e) {
      throw Exception('Failed to add payment method: $e');
    }
  }

  @override
  Future<bool> deletePaymentMethod(String paymentMethodId) async {
    try {
      final response = await _apiClient.delete('${ApiConstants.paymentMethods}/$paymentMethodId');
      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Failed to delete payment method: $e');
    }
  }

  @override
  Future<bool> updateNotificationPreferences(
    String userId,
    NotificationPreferences preferences,
  ) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.notificationSettings}/$userId',
        data: preferences.toJson(),
      );

      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Failed to update notification preferences: $e');
    }
  }

  @override
  Future<bool> changePassword(
    String userId,
    String currentPassword,
    String newPassword,
  ) async {
    try {
      final response = await _apiClient.put(
        '${ApiConstants.changePassword}/$userId',
        data: {
          'currentPassword': currentPassword,
          'newPassword': newPassword,
        },
      );

      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Failed to change password: $e');
    }
  }

  @override
  Future<bool> deleteAccount(String userId) async {
    try {
      final response = await _apiClient.delete('${ApiConstants.deleteAccount}/$userId');
      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Failed to delete account: $e');
    }
  }
}