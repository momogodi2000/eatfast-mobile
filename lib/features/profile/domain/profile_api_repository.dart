import 'dart:io';
import '../../../core/result.dart';
import '../../../core/failure.dart' as core_failure;
import 'profile_user.dart';

/// Repository interface for profile operations aligned with backend API
abstract class ProfileApiRepository {
  /// Get user profile - GET /api/client/profile
  Future<Result<ProfileUser, core_failure.Failure>> getUserProfile();

  /// Update user profile - PUT /api/client/profile  
  Future<Result<ProfileUser, core_failure.Failure>> updateProfile(ProfileUpdateRequest request);

  /// Upload profile image - POST /api/client/profile/avatar
  Future<Result<String, core_failure.Failure>> uploadProfileImage(File imageFile);

  /// Delete profile image - DELETE /api/client/profile/avatar
  Future<Result<void, core_failure.Failure>> deleteProfileImage();

  /// Change password - POST /api/client/profile/password
  Future<Result<void, core_failure.Failure>> changePassword(PasswordChangeRequest request);

  /// Add address - POST /api/client/addresses
  Future<Result<UserAddress, core_failure.Failure>> addAddress(AddressCreateRequest request);

  /// Update address - PUT /api/client/addresses/:id
  Future<Result<UserAddress, core_failure.Failure>> updateAddress(String addressId, AddressUpdateRequest request);

  /// Delete address - DELETE /api/client/addresses/:id  
  Future<Result<void, core_failure.Failure>> deleteAddress(String addressId);

  /// Get all addresses - GET /api/client/addresses
  Future<Result<List<UserAddress>, core_failure.Failure>> getAddresses();

  /// Update notification preferences - PUT /api/client/profile/preferences
  Future<Result<UserPreferences, core_failure.Failure>> updatePreferences(UserPreferences preferences);
}

/// Address creation request
class AddressCreateRequest {
  final String label;
  final String street;
  final String city;
  final String country;
  final bool isDefault;
  final Coordinates? coordinates;

  const AddressCreateRequest({
    required this.label,
    required this.street,
    required this.city,
    required this.country,
    this.isDefault = false,
    this.coordinates,
  });

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'street': street,
      'city': city,
      'country': country,
      'isDefault': isDefault,
      if (coordinates != null) 'coordinates': coordinates!.toJson(),
    };
  }
}

/// Address update request
class AddressUpdateRequest {
  final String? label;
  final String? street;
  final String? city;
  final String? country;
  final bool? isDefault;
  final Coordinates? coordinates;

  const AddressUpdateRequest({
    this.label,
    this.street,
    this.city,
    this.country,
    this.isDefault,
    this.coordinates,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (label != null) json['label'] = label;
    if (street != null) json['street'] = street;
    if (city != null) json['city'] = city;
    if (country != null) json['country'] = country;
    if (isDefault != null) json['isDefault'] = isDefault;
    if (coordinates != null) json['coordinates'] = coordinates!.toJson();
    return json;
  }
}
