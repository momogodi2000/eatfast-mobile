// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_management.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAccountImpl _$$UserAccountImplFromJson(Map<String, dynamic> json) =>
    _$UserAccountImpl(
      userId: json['userId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      status: $enumDecode(_$UserStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastLoginAt: DateTime.parse(json['lastLoginAt'] as String),
      profileImageUrl: json['profileImageUrl'] as String?,
      address: json['address'] as String?,
      suspendedAt: json['suspendedAt'] == null
          ? null
          : DateTime.parse(json['suspendedAt'] as String),
      suspensionReason: json['suspensionReason'] as String?,
      recentActivity: (json['recentActivity'] as List<dynamic>?)
              ?.map((e) => UserActivity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalOrders: (json['totalOrders'] as num?)?.toInt() ?? 0,
      totalSpent: (json['totalSpent'] as num?)?.toDouble() ?? 0.0,
      averageOrderValue: (json['averageOrderValue'] as num?)?.toDouble() ?? 0.0,
      customerRating: (json['customerRating'] as num?)?.toDouble() ?? 5.0,
    );

Map<String, dynamic> _$$UserAccountImplToJson(_$UserAccountImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'role': _$UserRoleEnumMap[instance.role]!,
      'status': _$UserStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastLoginAt': instance.lastLoginAt.toIso8601String(),
      'profileImageUrl': instance.profileImageUrl,
      'address': instance.address,
      'suspendedAt': instance.suspendedAt?.toIso8601String(),
      'suspensionReason': instance.suspensionReason,
      'recentActivity': instance.recentActivity,
      'totalOrders': instance.totalOrders,
      'totalSpent': instance.totalSpent,
      'averageOrderValue': instance.averageOrderValue,
      'customerRating': instance.customerRating,
    };

const _$UserRoleEnumMap = {
  UserRole.customer: 'customer',
  UserRole.restaurantOwner: 'restaurant_owner',
  UserRole.driver: 'driver',
  UserRole.admin: 'admin',
  UserRole.support: 'support',
};

const _$UserStatusEnumMap = {
  UserStatus.active: 'active',
  UserStatus.inactive: 'inactive',
  UserStatus.suspended: 'suspended',
  UserStatus.banned: 'banned',
  UserStatus.pendingVerification: 'pending_verification',
};

_$RestaurantAccountImpl _$$RestaurantAccountImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantAccountImpl(
      restaurantId: json['restaurantId'] as String,
      ownerId: json['ownerId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      status: $enumDecode(_$RestaurantStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastActiveAt: DateTime.parse(json['lastActiveAt'] as String),
      logoUrl: json['logoUrl'] as String?,
      description: json['description'] as String?,
      cuisineType: json['cuisineType'] as String?,
      verifiedAt: json['verifiedAt'] == null
          ? null
          : DateTime.parse(json['verifiedAt'] as String),
      suspendedAt: json['suspendedAt'] == null
          ? null
          : DateTime.parse(json['suspendedAt'] as String),
      suspensionReason: json['suspensionReason'] as String?,
      serviceAreas: (json['serviceAreas'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      documents: (json['documents'] as List<dynamic>?)
              ?.map(
                  (e) => RestaurantDocument.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalOrders: (json['totalOrders'] as num?)?.toInt() ?? 0,
      totalRevenue: (json['totalRevenue'] as num?)?.toDouble() ?? 0.0,
      averageOrderValue: (json['averageOrderValue'] as num?)?.toDouble() ?? 0.0,
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 5.0,
      commissionRate: (json['commissionRate'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$RestaurantAccountImplToJson(
        _$RestaurantAccountImpl instance) =>
    <String, dynamic>{
      'restaurantId': instance.restaurantId,
      'ownerId': instance.ownerId,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'status': _$RestaurantStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastActiveAt': instance.lastActiveAt.toIso8601String(),
      'logoUrl': instance.logoUrl,
      'description': instance.description,
      'cuisineType': instance.cuisineType,
      'verifiedAt': instance.verifiedAt?.toIso8601String(),
      'suspendedAt': instance.suspendedAt?.toIso8601String(),
      'suspensionReason': instance.suspensionReason,
      'serviceAreas': instance.serviceAreas,
      'documents': instance.documents,
      'totalOrders': instance.totalOrders,
      'totalRevenue': instance.totalRevenue,
      'averageOrderValue': instance.averageOrderValue,
      'averageRating': instance.averageRating,
      'commissionRate': instance.commissionRate,
    };

const _$RestaurantStatusEnumMap = {
  RestaurantStatus.active: 'active',
  RestaurantStatus.inactive: 'inactive',
  RestaurantStatus.pendingVerification: 'pending_verification',
  RestaurantStatus.rejected: 'rejected',
  RestaurantStatus.suspended: 'suspended',
  RestaurantStatus.closedTemporarily: 'closed_temporarily',
  RestaurantStatus.closedPermanently: 'closed_permanently',
};

_$DriverAccountImpl _$$DriverAccountImplFromJson(Map<String, dynamic> json) =>
    _$DriverAccountImpl(
      driverId: json['driverId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      licenseNumber: json['licenseNumber'] as String,
      vehicleType: json['vehicleType'] as String,
      vehicleModel: json['vehicleModel'] as String,
      vehiclePlateNumber: json['vehiclePlateNumber'] as String,
      status: $enumDecode(_$DriverAccountStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastActiveAt: DateTime.parse(json['lastActiveAt'] as String),
      profileImageUrl: json['profileImageUrl'] as String?,
      currentLocation: json['currentLocation'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      verifiedAt: json['verifiedAt'] == null
          ? null
          : DateTime.parse(json['verifiedAt'] as String),
      suspendedAt: json['suspendedAt'] == null
          ? null
          : DateTime.parse(json['suspendedAt'] as String),
      suspensionReason: json['suspensionReason'] as String?,
      documents: (json['documents'] as List<dynamic>?)
              ?.map((e) => DriverDocument.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      serviceAreas: (json['serviceAreas'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      totalDeliveries: (json['totalDeliveries'] as num?)?.toInt() ?? 0,
      totalEarnings: (json['totalEarnings'] as num?)?.toDouble() ?? 0.0,
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 5.0,
      completionRate: (json['completionRate'] as num?)?.toDouble() ?? 0.0,
      onlineHours: (json['onlineHours'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$DriverAccountImplToJson(_$DriverAccountImpl instance) =>
    <String, dynamic>{
      'driverId': instance.driverId,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'licenseNumber': instance.licenseNumber,
      'vehicleType': instance.vehicleType,
      'vehicleModel': instance.vehicleModel,
      'vehiclePlateNumber': instance.vehiclePlateNumber,
      'status': _$DriverAccountStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastActiveAt': instance.lastActiveAt.toIso8601String(),
      'profileImageUrl': instance.profileImageUrl,
      'currentLocation': instance.currentLocation,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'verifiedAt': instance.verifiedAt?.toIso8601String(),
      'suspendedAt': instance.suspendedAt?.toIso8601String(),
      'suspensionReason': instance.suspensionReason,
      'documents': instance.documents,
      'serviceAreas': instance.serviceAreas,
      'totalDeliveries': instance.totalDeliveries,
      'totalEarnings': instance.totalEarnings,
      'averageRating': instance.averageRating,
      'completionRate': instance.completionRate,
      'onlineHours': instance.onlineHours,
    };

const _$DriverAccountStatusEnumMap = {
  DriverAccountStatus.active: 'active',
  DriverAccountStatus.inactive: 'inactive',
  DriverAccountStatus.pendingVerification: 'pending_verification',
  DriverAccountStatus.rejected: 'rejected',
  DriverAccountStatus.suspended: 'suspended',
  DriverAccountStatus.documentsRequired: 'documents_required',
};

_$UserActivityImpl _$$UserActivityImplFromJson(Map<String, dynamic> json) =>
    _$UserActivityImpl(
      activityId: json['activityId'] as String,
      type: $enumDecode(_$UserActivityTypeEnumMap, json['type']),
      timestamp: DateTime.parse(json['timestamp'] as String),
      description: json['description'] as String,
      relatedOrderId: json['relatedOrderId'] as String?,
      relatedRestaurantId: json['relatedRestaurantId'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$UserActivityImplToJson(_$UserActivityImpl instance) =>
    <String, dynamic>{
      'activityId': instance.activityId,
      'type': _$UserActivityTypeEnumMap[instance.type]!,
      'timestamp': instance.timestamp.toIso8601String(),
      'description': instance.description,
      'relatedOrderId': instance.relatedOrderId,
      'relatedRestaurantId': instance.relatedRestaurantId,
      'metadata': instance.metadata,
    };

const _$UserActivityTypeEnumMap = {
  UserActivityType.login: 'login',
  UserActivityType.logout: 'logout',
  UserActivityType.orderPlaced: 'order_placed',
  UserActivityType.orderCancelled: 'order_cancelled',
  UserActivityType.paymentMade: 'payment_made',
  UserActivityType.profileUpdated: 'profile_updated',
  UserActivityType.passwordChanged: 'password_changed',
};

_$RestaurantDocumentImpl _$$RestaurantDocumentImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantDocumentImpl(
      documentId: json['documentId'] as String,
      type: $enumDecode(_$DocumentTypeEnumMap, json['type']),
      fileName: json['fileName'] as String,
      fileUrl: json['fileUrl'] as String,
      status: $enumDecode(_$DocumentStatusEnumMap, json['status']),
      uploadedAt: DateTime.parse(json['uploadedAt'] as String),
      verifiedAt: json['verifiedAt'] == null
          ? null
          : DateTime.parse(json['verifiedAt'] as String),
      rejectionReason: json['rejectionReason'] as String?,
    );

Map<String, dynamic> _$$RestaurantDocumentImplToJson(
        _$RestaurantDocumentImpl instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'type': _$DocumentTypeEnumMap[instance.type]!,
      'fileName': instance.fileName,
      'fileUrl': instance.fileUrl,
      'status': _$DocumentStatusEnumMap[instance.status]!,
      'uploadedAt': instance.uploadedAt.toIso8601String(),
      'verifiedAt': instance.verifiedAt?.toIso8601String(),
      'rejectionReason': instance.rejectionReason,
    };

const _$DocumentTypeEnumMap = {
  DocumentType.businessLicense: 'business_license',
  DocumentType.foodHandlerPermit: 'food_handler_permit',
  DocumentType.identityCard: 'identity_card',
  DocumentType.driversLicense: 'drivers_license',
  DocumentType.vehicleRegistration: 'vehicle_registration',
  DocumentType.insuranceCertificate: 'insurance_certificate',
  DocumentType.bankStatement: 'bank_statement',
};

const _$DocumentStatusEnumMap = {
  DocumentStatus.pending: 'pending',
  DocumentStatus.verified: 'verified',
  DocumentStatus.rejected: 'rejected',
  DocumentStatus.expired: 'expired',
};

_$DriverDocumentImpl _$$DriverDocumentImplFromJson(Map<String, dynamic> json) =>
    _$DriverDocumentImpl(
      documentId: json['documentId'] as String,
      type: $enumDecode(_$DocumentTypeEnumMap, json['type']),
      fileName: json['fileName'] as String,
      fileUrl: json['fileUrl'] as String,
      status: $enumDecode(_$DocumentStatusEnumMap, json['status']),
      uploadedAt: DateTime.parse(json['uploadedAt'] as String),
      verifiedAt: json['verifiedAt'] == null
          ? null
          : DateTime.parse(json['verifiedAt'] as String),
      rejectionReason: json['rejectionReason'] as String?,
    );

Map<String, dynamic> _$$DriverDocumentImplToJson(
        _$DriverDocumentImpl instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'type': _$DocumentTypeEnumMap[instance.type]!,
      'fileName': instance.fileName,
      'fileUrl': instance.fileUrl,
      'status': _$DocumentStatusEnumMap[instance.status]!,
      'uploadedAt': instance.uploadedAt.toIso8601String(),
      'verifiedAt': instance.verifiedAt?.toIso8601String(),
      'rejectionReason': instance.rejectionReason,
    };
