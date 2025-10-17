import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eatfast_mobile/shared/models/driver_earnings.dart';

part 'driver_profile.freezed.dart';
part 'driver_profile.g.dart';

@freezed
class DriverProfile with _$DriverProfile {
  const factory DriverProfile({
    required String id,
    required String name,
    required String email,
    required String phone,
    required DriverStatus status,
    required double rating,
    required int totalDeliveries,
    required double earnings,
    required bool isOnline,
    required DateTime createdAt,
    required DateTime updatedAt,
    // Additional fields for UI
    required bool isAvailable,
    required double totalEarnings,
    required List<DriverWeeklyStat> weeklyStats,
  }) = _DriverProfile;

  factory DriverProfile.fromJson(Map<String, dynamic> json) =>
      _$DriverProfileFromJson(json);
}

enum DriverStatus {
  @JsonValue('active')
  active,
  @JsonValue('inactive')
  inactive,
  @JsonValue('suspended')
  suspended,
  @JsonValue('pending_verification')
  pendingVerification,
  @JsonValue('documents_required')
  documentsRequired,
}

extension DriverStatusExtension on DriverStatus {
  String get displayName {
    switch (this) {
      case DriverStatus.active:
        return 'Active';
      case DriverStatus.inactive:
        return 'Inactive';
      case DriverStatus.suspended:
        return 'Suspended';
      case DriverStatus.pendingVerification:
        return 'Pending Verification';
      case DriverStatus.documentsRequired:
        return 'Documents Required';
    }
  }
}