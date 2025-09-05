// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriverProfileImpl _$$DriverProfileImplFromJson(Map<String, dynamic> json) =>
    _$DriverProfileImpl(
      driverId: json['driverId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      licenseNumber: json['licenseNumber'] as String,
      vehicleType: json['vehicleType'] as String,
      vehicleModel: json['vehicleModel'] as String,
      vehiclePlateNumber: json['vehiclePlateNumber'] as String,
      status: $enumDecode(_$DriverStatusEnumMap, json['status']),
      rating: (json['rating'] as num).toDouble(),
      totalDeliveries: (json['totalDeliveries'] as num).toInt(),
      totalEarnings: (json['totalEarnings'] as num).toDouble(),
      isOnline: json['isOnline'] as bool,
      isAvailable: json['isAvailable'] as bool,
      profileImageUrl: json['profileImageUrl'] as String?,
      currentLocation: json['currentLocation'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      lastActiveAt: json['lastActiveAt'] == null
          ? null
          : DateTime.parse(json['lastActiveAt'] as String),
      serviceAreas: (json['serviceAreas'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      weeklyStats: (json['weeklyStats'] as List<dynamic>?)
              ?.map(
                  (e) => DeliveryStatistics.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DriverProfileImplToJson(_$DriverProfileImpl instance) =>
    <String, dynamic>{
      'driverId': instance.driverId,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'licenseNumber': instance.licenseNumber,
      'vehicleType': instance.vehicleType,
      'vehicleModel': instance.vehicleModel,
      'vehiclePlateNumber': instance.vehiclePlateNumber,
      'status': _$DriverStatusEnumMap[instance.status]!,
      'rating': instance.rating,
      'totalDeliveries': instance.totalDeliveries,
      'totalEarnings': instance.totalEarnings,
      'isOnline': instance.isOnline,
      'isAvailable': instance.isAvailable,
      'profileImageUrl': instance.profileImageUrl,
      'currentLocation': instance.currentLocation,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'lastActiveAt': instance.lastActiveAt?.toIso8601String(),
      'serviceAreas': instance.serviceAreas,
      'weeklyStats': instance.weeklyStats,
    };

const _$DriverStatusEnumMap = {
  DriverStatus.active: 'active',
  DriverStatus.inactive: 'inactive',
  DriverStatus.suspended: 'suspended',
  DriverStatus.pendingVerification: 'pending_verification',
  DriverStatus.documentsRequired: 'documents_required',
};

_$DeliveryStatisticsImpl _$$DeliveryStatisticsImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryStatisticsImpl(
      date: DateTime.parse(json['date'] as String),
      deliveries: (json['deliveries'] as num).toInt(),
      earnings: (json['earnings'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      onlineHours: (json['onlineHours'] as num).toInt(),
    );

Map<String, dynamic> _$$DeliveryStatisticsImplToJson(
        _$DeliveryStatisticsImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'deliveries': instance.deliveries,
      'earnings': instance.earnings,
      'rating': instance.rating,
      'onlineHours': instance.onlineHours,
    };
