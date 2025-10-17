import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_management.freezed.dart';
part 'user_management.g.dart';

@freezed
class UserAccount with _$UserAccount {
  const factory UserAccount({
    required String userId,
    required String name,
    required String email,
    required String phoneNumber,
    required UserRole role,
    required UserStatus status,
    required DateTime createdAt,
    required DateTime lastLoginAt,
    String? profileImageUrl,
    String? address,
    DateTime? suspendedAt,
    String? suspensionReason,
    @Default([]) List<UserActivity> recentActivity,
    @Default(0) int totalOrders,
    @Default(0.0) double totalSpent,
    @Default(0.0) double averageOrderValue,
    @Default(5.0) double customerRating,
  }) = _UserAccount;

  factory UserAccount.fromJson(Map<String, dynamic> json) =>
      _$UserAccountFromJson(json);
}

@freezed
class RestaurantAccount with _$RestaurantAccount {
  const factory RestaurantAccount({
    required String restaurantId,
    required String ownerId,
    required String name,
    required String email,
    required String phoneNumber,
    required String address,
    required double latitude,
    required double longitude,
    required RestaurantStatus status,
    required DateTime createdAt,
    required DateTime lastActiveAt,
    String? logoUrl,
    String? description,
    String? cuisineType,
    DateTime? verifiedAt,
    DateTime? suspendedAt,
    String? suspensionReason,
    @Default([]) List<String> serviceAreas,
    @Default([]) List<RestaurantDocument> documents,
    @Default(0) int totalOrders,
    @Default(0.0) double totalRevenue,
    @Default(0.0) double averageOrderValue,
    @Default(5.0) double averageRating,
    @Default(0.0) double commissionRate,
  }) = _RestaurantAccount;

  factory RestaurantAccount.fromJson(Map<String, dynamic> json) =>
      _$RestaurantAccountFromJson(json);
}

@freezed
class DriverAccount with _$DriverAccount {
  const factory DriverAccount({
    required String driverId,
    required String name,
    required String email,
    required String phoneNumber,
    required String licenseNumber,
    required String vehicleType,
    required String vehicleModel,
    required String vehiclePlateNumber,
    required DriverAccountStatus status,
    required DateTime createdAt,
    required DateTime lastActiveAt,
    String? profileImageUrl,
    String? currentLocation,
    double? latitude,
    double? longitude,
    DateTime? verifiedAt,
    DateTime? suspendedAt,
    String? suspensionReason,
    @Default([]) List<DriverDocument> documents,
    @Default([]) List<String> serviceAreas,
    @Default(0) int totalDeliveries,
    @Default(0.0) double totalEarnings,
    @Default(5.0) double averageRating,
    @Default(0.0) double completionRate,
    @Default(0) int onlineHours,
  }) = _DriverAccount;

  factory DriverAccount.fromJson(Map<String, dynamic> json) =>
      _$DriverAccountFromJson(json);
}

@freezed
class UserActivity with _$UserActivity {
  const factory UserActivity({
    required String activityId,
    required UserActivityType type,
    required DateTime timestamp,
    required String description,
    String? relatedOrderId,
    String? relatedRestaurantId,
    Map<String, dynamic>? metadata,
  }) = _UserActivity;

  factory UserActivity.fromJson(Map<String, dynamic> json) =>
      _$UserActivityFromJson(json);
}

@freezed
class RestaurantDocument with _$RestaurantDocument {
  const factory RestaurantDocument({
    required String documentId,
    required DocumentType type,
    required String fileName,
    required String fileUrl,
    required DocumentStatus status,
    required DateTime uploadedAt,
    DateTime? verifiedAt,
    String? rejectionReason,
  }) = _RestaurantDocument;

  factory RestaurantDocument.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDocumentFromJson(json);
}

@freezed
class DriverDocument with _$DriverDocument {
  const factory DriverDocument({
    required String documentId,
    required DocumentType type,
    required String fileName,
    required String fileUrl,
    required DocumentStatus status,
    required DateTime uploadedAt,
    DateTime? verifiedAt,
    String? rejectionReason,
  }) = _DriverDocument;

  factory DriverDocument.fromJson(Map<String, dynamic> json) =>
      _$DriverDocumentFromJson(json);
}

enum UserRole {
  @JsonValue('customer')
  customer,
  @JsonValue('restaurant_owner')
  restaurantOwner,
  @JsonValue('driver')
  driver,
  @JsonValue('admin')
  admin,
  @JsonValue('support')
  support,
}

enum UserStatus {
  @JsonValue('active')
  active,
  @JsonValue('inactive')
  inactive,
  @JsonValue('suspended')
  suspended,
  @JsonValue('banned')
  banned,
  @JsonValue('pending_verification')
  pendingVerification,
}

enum RestaurantStatus {
  @JsonValue('active')
  active,
  @JsonValue('inactive')
  inactive,
  @JsonValue('pending_verification')
  pendingVerification,
  @JsonValue('rejected')
  rejected,
  @JsonValue('suspended')
  suspended,
  @JsonValue('closed_temporarily')
  closedTemporarily,
  @JsonValue('closed_permanently')
  closedPermanently,
}

enum DriverAccountStatus {
  @JsonValue('active')
  active,
  @JsonValue('inactive')
  inactive,
  @JsonValue('pending_verification')
  pendingVerification,
  @JsonValue('rejected')
  rejected,
  @JsonValue('suspended')
  suspended,
  @JsonValue('documents_required')
  documentsRequired,
}

enum UserActivityType {
  @JsonValue('login')
  login,
  @JsonValue('logout')
  logout,
  @JsonValue('order_placed')
  orderPlaced,
  @JsonValue('order_cancelled')
  orderCancelled,
  @JsonValue('payment_made')
  paymentMade,
  @JsonValue('profile_updated')
  profileUpdated,
  @JsonValue('password_changed')
  passwordChanged,
}

enum DocumentType {
  @JsonValue('business_license')
  businessLicense,
  @JsonValue('food_handler_permit')
  foodHandlerPermit,
  @JsonValue('identity_card')
  identityCard,
  @JsonValue('drivers_license')
  driversLicense,
  @JsonValue('vehicle_registration')
  vehicleRegistration,
  @JsonValue('insurance_certificate')
  insuranceCertificate,
  @JsonValue('bank_statement')
  bankStatement,
}

enum DocumentStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('verified')
  verified,
  @JsonValue('rejected')
  rejected,
  @JsonValue('expired')
  expired,
}

extension UserRoleExtension on UserRole {
  String get displayName {
    switch (this) {
      case UserRole.customer:
        return 'Client';
      case UserRole.restaurantOwner:
        return 'Propriétaire de restaurant';
      case UserRole.driver:
        return 'Livreur';
      case UserRole.admin:
        return 'Administrateur';
      case UserRole.support:
        return 'Support client';
    }
  }
}

extension UserStatusExtension on UserStatus {
  String get displayName {
    switch (this) {
      case UserStatus.active:
        return 'Actif';
      case UserStatus.inactive:
        return 'Inactif';
      case UserStatus.suspended:
        return 'Suspendu';
      case UserStatus.banned:
        return 'Banni';
      case UserStatus.pendingVerification:
        return 'En attente de vérification';
    }
  }

  bool get canTakeActions {
    return this == UserStatus.active;
  }
}

extension RestaurantStatusExtension on RestaurantStatus {
  String get displayName {
    switch (this) {
      case RestaurantStatus.active:
        return 'Actif';
      case RestaurantStatus.inactive:
        return 'Inactif';
      case RestaurantStatus.pendingVerification:
        return 'En attente de vérification';
      case RestaurantStatus.rejected:
        return 'Rejeté';
      case RestaurantStatus.suspended:
        return 'Suspendu';
      case RestaurantStatus.closedTemporarily:
        return 'Fermé temporairement';
      case RestaurantStatus.closedPermanently:
        return 'Fermé définitivement';
    }
  }

  bool get canReceiveOrders {
    return this == RestaurantStatus.active;
  }
}

extension DriverAccountStatusExtension on DriverAccountStatus {
  String get displayName {
    switch (this) {
      case DriverAccountStatus.active:
        return 'Actif';
      case DriverAccountStatus.inactive:
        return 'Inactif';
      case DriverAccountStatus.pendingVerification:
        return 'En attente de vérification';
      case DriverAccountStatus.rejected:
        return 'Rejeté';
      case DriverAccountStatus.suspended:
        return 'Suspendu';
      case DriverAccountStatus.documentsRequired:
        return 'Documents requis';
    }
  }

  bool get canTakeDeliveries {
    return this == DriverAccountStatus.active;
  }
}
