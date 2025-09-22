import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'driver_profile.freezed.dart';
part 'driver_profile.g.dart';

@freezed
class DriverProfile with _$DriverProfile {
  const factory DriverProfile({
    required String driverId,
    required String name,
    required String email,
    required String phoneNumber,
    required String licenseNumber,
    required String vehicleType,
    required String vehicleModel,
    required String vehiclePlateNumber,
    required DriverStatus status,
    required double rating,
    required int totalDeliveries,
    required double totalEarnings,
    required bool isOnline,
    required bool isAvailable,
    String? profileImageUrl,
    String? currentLocation,
    double? latitude,
    double? longitude,
    DateTime? lastActiveAt,
    @Default([]) List<String> serviceAreas,
    @Default([]) List<DeliveryStatistics> weeklyStats,
  }) = _DriverProfile;

  factory DriverProfile.fromJson(Map<String, dynamic> json) =>
      _$DriverProfileFromJson(json);
}

@freezed
class DeliveryStatistics with _$DeliveryStatistics {
  const factory DeliveryStatistics({
    required DateTime date,
    required int deliveries,
    required double earnings,
    required double rating,
    required int onlineHours,
  }) = _DeliveryStatistics;

  factory DeliveryStatistics.fromJson(Map<String, dynamic> json) =>
      _$DeliveryStatisticsFromJson(json);
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
        return 'Actif';
      case DriverStatus.inactive:
        return 'Inactif';
      case DriverStatus.suspended:
        return 'Suspendu';
      case DriverStatus.pendingVerification:
        return 'En attente de vérification';
      case DriverStatus.documentsRequired:
        return 'Documents requis';
    }
  }

  bool get canTakeOrders {
    return this == DriverStatus.active;
  }
}