import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_user.freezed.dart';
part 'profile_user.g.dart';

/// User model aligned with backend API schema
/// Based on GET /api/client/profile response
@freezed
class ProfileUser with _$ProfileUser {
  const factory ProfileUser({
    required String id,
    required String firstName,
    required String lastName, 
    required String email,
    required String phone,
    String? profileImage,
    required bool isEmailVerified,
    required bool isPhoneVerified,
    @Default([]) List<UserAddress> addresses,
    UserPreferences? preferences,
    @Default(0) int loyaltyPoints,
    @Default('Bronze') String loyaltyLevel,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _ProfileUser;

  factory ProfileUser.fromJson(Map<String, dynamic> json) => 
      _$ProfileUserFromJson(json);

  const ProfileUser._();

  /// Get full name by combining first and last name
  String get fullName => '$firstName $lastName'.trim();

  /// Get initials from first and last name
  String get initials {
    final firstInitial = firstName.isNotEmpty ? firstName[0].toUpperCase() : '';
    final lastInitial = lastName.isNotEmpty ? lastName[0].toUpperCase() : '';
    return '$firstInitial$lastInitial';
  }

  /// Check if user profile is complete
  bool get isProfileComplete {
    return firstName.isNotEmpty && 
           lastName.isNotEmpty &&
           email.isNotEmpty && 
           phone.isNotEmpty &&
           isEmailVerified &&
           isPhoneVerified;
  }

  /// Get default delivery address
  UserAddress? get defaultAddress {
    try {
      return addresses.firstWhere((address) => address.isDefault);
    } catch (_) {
      return addresses.isNotEmpty ? addresses.first : null;
    }
  }

  /// Check if user has any addresses
  bool get hasAddresses => addresses.isNotEmpty;

  /// Get loyalty level color
  String get loyaltyLevelColor {
    switch (loyaltyLevel.toLowerCase()) {
      case 'bronze':
        return '#CD7F32';
      case 'silver':
        return '#C0C0C0';
      case 'gold':
        return '#FFD700';
      case 'platinum':
        return '#E5E4E2';
      default:
        return '#CD7F32';
    }
  }
}

/// User address model aligned with backend API
@freezed
class UserAddress with _$UserAddress {
  const factory UserAddress({
    required String id,
    required String label,
    required String street,
    required String city,
    required String country,
    required bool isDefault,
    Coordinates? coordinates,
  }) = _UserAddress;

  factory UserAddress.fromJson(Map<String, dynamic> json) => 
      _$UserAddressFromJson(json);

  const UserAddress._();

  /// Get full address string
  String get fullAddress => '$street, $city, $country';
}

/// Coordinates model
@freezed
class Coordinates with _$Coordinates {
  const factory Coordinates({
    required double latitude,
    required double longitude,
  }) = _Coordinates;

  factory Coordinates.fromJson(Map<String, dynamic> json) => 
      _$CoordinatesFromJson(json);
}

/// User preferences model aligned with backend API
@freezed
class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    NotificationPreferences? notifications,
    @Default('fr') String language,
    @Default('XAF') String currency,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) => 
      _$UserPreferencesFromJson(json);
}

/// Notification preferences
@freezed
class NotificationPreferences with _$NotificationPreferences {
  const factory NotificationPreferences({
    @Default(true) bool email,
    @Default(false) bool sms,
    @Default(true) bool push,
  }) = _NotificationPreferences;

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) => 
      _$NotificationPreferencesFromJson(json);
}

/// Profile update request model
@freezed
class ProfileUpdateRequest with _$ProfileUpdateRequest {
  const factory ProfileUpdateRequest({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    UserPreferences? preferences,
  }) = _ProfileUpdateRequest;

  factory ProfileUpdateRequest.fromJson(Map<String, dynamic> json) => 
      _$ProfileUpdateRequestFromJson(json);
}

/// Password change request model  
@freezed
class PasswordChangeRequest with _$PasswordChangeRequest {
  const factory PasswordChangeRequest({
    required String currentPassword,
    required String newPassword,
  }) = _PasswordChangeRequest;

  factory PasswordChangeRequest.fromJson(Map<String, dynamic> json) => 
      _$PasswordChangeRequestFromJson(json);
}
