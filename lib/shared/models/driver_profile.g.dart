// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriverProfileImpl _$$DriverProfileImplFromJson(Map<String, dynamic> json) =>
    _$DriverProfileImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      status: $enumDecode(_$DriverStatusEnumMap, json['status']),
      rating: (json['rating'] as num).toDouble(),
      totalDeliveries: (json['totalDeliveries'] as num).toInt(),
      earnings: (json['earnings'] as num).toDouble(),
      isOnline: json['isOnline'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isAvailable: json['isAvailable'] as bool,
      totalEarnings: (json['totalEarnings'] as num).toDouble(),
      weeklyStats: (json['weeklyStats'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$DriverProfileImplToJson(_$DriverProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'status': _$DriverStatusEnumMap[instance.status]!,
      'rating': instance.rating,
      'totalDeliveries': instance.totalDeliveries,
      'earnings': instance.earnings,
      'isOnline': instance.isOnline,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isAvailable': instance.isAvailable,
      'totalEarnings': instance.totalEarnings,
      'weeklyStats': instance.weeklyStats,
    };

const _$DriverStatusEnumMap = {
  DriverStatus.active: 'active',
  DriverStatus.inactive: 'inactive',
  DriverStatus.suspended: 'suspended',
  DriverStatus.pendingVerification: 'pending_verification',
  DriverStatus.documentsRequired: 'documents_required',
};
