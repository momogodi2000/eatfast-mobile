import 'dart:io';
import '../../../core/result.dart';
import '../../../core/failure.dart' as core_failure;
import '../../auth/domain/user.dart';
import 'models.dart';

/// Repository interface for profile-related operations
abstract class ProfileRepository {
  /// Get user profile
  Future<Result<User, core_failure.Failure>> getUserProfile();
  
  /// Update user profile
  Future<Result<User, core_failure.Failure>> updateProfile({
    String? fullName,
    String? email,
    String? phoneNumber,
    File? avatar,
  });
  
  /// Upload profile image
  Future<Result<String, core_failure.Failure>> uploadProfileImage(File imageFile);
  
  /// Delete profile image
  Future<Result<void, core_failure.Failure>> deleteProfileImage();
  
  /// Get user addresses
  Future<Result<List<Address>, core_failure.Failure>> getAddresses();
  
  /// Add new address
  Future<Result<Address, core_failure.Failure>> addAddress(Address address);
  
  /// Update address
  Future<Result<Address, core_failure.Failure>> updateAddress(Address address);
  
  /// Delete address
  Future<Result<void, core_failure.Failure>> deleteAddress(String addressId);
  
  /// Set default address
  Future<Result<void, core_failure.Failure>> setDefaultAddress(String addressId);
  
  /// Get payment methods
  Future<Result<List<PaymentMethod>, core_failure.Failure>> getPaymentMethods();
  
  /// Add payment method
  Future<Result<PaymentMethod, core_failure.Failure>> addPaymentMethod(PaymentMethod method);
  
  /// Update payment method
  Future<Result<PaymentMethod, core_failure.Failure>> updatePaymentMethod(PaymentMethod method);
  
  /// Delete payment method
  Future<Result<void, core_failure.Failure>> deletePaymentMethod(String methodId);
  
  /// Set default payment method
  Future<Result<void, core_failure.Failure>> setDefaultPaymentMethod(String methodId);
  
  /// Get notification preferences
  Future<Result<NotificationPreferences, core_failure.Failure>> getNotificationPreferences();
  
  /// Update notification preferences
  Future<Result<NotificationPreferences, core_failure.Failure>> updateNotificationPreferences(
    NotificationPreferences preferences,
  );
  
  /// Change password
  Future<Result<void, core_failure.Failure>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
  
  /// Enable/disable two-factor authentication
  Future<Result<void, core_failure.Failure>> toggleTwoFactorAuth(bool enable);
  
  /// Delete user account
  Future<Result<void, core_failure.Failure>> deleteAccount({
    required String password,
    String? reason,
  });
}
