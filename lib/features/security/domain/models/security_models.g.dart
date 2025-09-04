// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SecuritySettingsImpl _$$SecuritySettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$SecuritySettingsImpl(
      userId: json['userId'] as String,
      biometricEnabled: json['biometricEnabled'] as bool? ?? false,
      pinLockEnabled: json['pinLockEnabled'] as bool? ?? false,
      autoLockEnabled: json['autoLockEnabled'] as bool? ?? false,
      autoLockTimeout: (json['autoLockTimeout'] as num?)?.toInt() ?? 300,
      locationTrackingEnabled:
          json['locationTrackingEnabled'] as bool? ?? false,
      dataEncryptionEnabled: json['dataEncryptionEnabled'] as bool? ?? true,
      fraudDetectionEnabled: json['fraudDetectionEnabled'] as bool? ?? false,
      securityAlertsEnabled: json['securityAlertsEnabled'] as bool? ?? true,
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$SecuritySettingsImplToJson(
        _$SecuritySettingsImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'biometricEnabled': instance.biometricEnabled,
      'pinLockEnabled': instance.pinLockEnabled,
      'autoLockEnabled': instance.autoLockEnabled,
      'autoLockTimeout': instance.autoLockTimeout,
      'locationTrackingEnabled': instance.locationTrackingEnabled,
      'dataEncryptionEnabled': instance.dataEncryptionEnabled,
      'fraudDetectionEnabled': instance.fraudDetectionEnabled,
      'securityAlertsEnabled': instance.securityAlertsEnabled,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };

_$SecurityAlertImpl _$$SecurityAlertImplFromJson(Map<String, dynamic> json) =>
    _$SecurityAlertImpl(
      id: json['id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      type: $enumDecode(_$SecurityAlertTypeEnumMap, json['type']),
      severity: $enumDecode(_$SecurityAlertSeverityEnumMap, json['severity']),
      title: json['title'] as String,
      description: json['description'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
      isAcknowledged: json['isAcknowledged'] as bool? ?? false,
      isResolved: json['isResolved'] as bool? ?? false,
    );

Map<String, dynamic> _$$SecurityAlertImplToJson(_$SecurityAlertImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'type': _$SecurityAlertTypeEnumMap[instance.type]!,
      'severity': _$SecurityAlertSeverityEnumMap[instance.severity]!,
      'title': instance.title,
      'description': instance.description,
      'metadata': instance.metadata,
      'isAcknowledged': instance.isAcknowledged,
      'isResolved': instance.isResolved,
    };

const _$SecurityAlertTypeEnumMap = {
  SecurityAlertType.suspiciousLogin: 'suspiciousLogin',
  SecurityAlertType.multipleFailedAttempts: 'multipleFailedAttempts',
  SecurityAlertType.newDeviceAccess: 'newDeviceAccess',
  SecurityAlertType.locationAnomalyDetected: 'locationAnomalyDetected',
  SecurityAlertType.dataAccessViolation: 'dataAccessViolation',
  SecurityAlertType.accountCompromiseAttempt: 'accountCompromiseAttempt',
  SecurityAlertType.fraudulentActivity: 'fraudulentActivity',
  SecurityAlertType.unauthorizedApiAccess: 'unauthorizedApiAccess',
};

const _$SecurityAlertSeverityEnumMap = {
  SecurityAlertSeverity.info: 'info',
  SecurityAlertSeverity.low: 'low',
  SecurityAlertSeverity.medium: 'medium',
  SecurityAlertSeverity.high: 'high',
  SecurityAlertSeverity.critical: 'critical',
};

_$BiometricSettingsImpl _$$BiometricSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$BiometricSettingsImpl(
      isAvailable: json['isAvailable'] as bool,
      availableTypes: (json['availableTypes'] as List<dynamic>)
          .map((e) => $enumDecode(_$BiometricTypeEnumMap, e))
          .toList(),
      enabledType:
          $enumDecodeNullable(_$BiometricTypeEnumMap, json['enabledType']),
      fallbackEnabled: json['fallbackEnabled'] as bool? ?? false,
      lastAuthentication: json['lastAuthentication'] == null
          ? null
          : DateTime.parse(json['lastAuthentication'] as String),
    );

Map<String, dynamic> _$$BiometricSettingsImplToJson(
        _$BiometricSettingsImpl instance) =>
    <String, dynamic>{
      'isAvailable': instance.isAvailable,
      'availableTypes': instance.availableTypes
          .map((e) => _$BiometricTypeEnumMap[e]!)
          .toList(),
      'enabledType': _$BiometricTypeEnumMap[instance.enabledType],
      'fallbackEnabled': instance.fallbackEnabled,
      'lastAuthentication': instance.lastAuthentication?.toIso8601String(),
    };

const _$BiometricTypeEnumMap = {
  BiometricType.fingerprint: 'fingerprint',
  BiometricType.faceId: 'faceId',
  BiometricType.voiceId: 'voiceId',
  BiometricType.irisId: 'irisId',
};

_$PrivacySettingsImpl _$$PrivacySettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$PrivacySettingsImpl(
      userId: json['userId'] as String,
      locationSharingEnabled: json['locationSharingEnabled'] as bool? ?? true,
      analyticsEnabled: json['analyticsEnabled'] as bool? ?? false,
      crashReportingEnabled: json['crashReportingEnabled'] as bool? ?? false,
      marketingEmailsEnabled: json['marketingEmailsEnabled'] as bool? ?? true,
      pushNotificationsEnabled:
          json['pushNotificationsEnabled'] as bool? ?? true,
      dataExportRequested: json['dataExportRequested'] as bool? ?? false,
      accountDeletionRequested:
          json['accountDeletionRequested'] as bool? ?? false,
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$PrivacySettingsImplToJson(
        _$PrivacySettingsImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'locationSharingEnabled': instance.locationSharingEnabled,
      'analyticsEnabled': instance.analyticsEnabled,
      'crashReportingEnabled': instance.crashReportingEnabled,
      'marketingEmailsEnabled': instance.marketingEmailsEnabled,
      'pushNotificationsEnabled': instance.pushNotificationsEnabled,
      'dataExportRequested': instance.dataExportRequested,
      'accountDeletionRequested': instance.accountDeletionRequested,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };

_$DataEncryptionImpl _$$DataEncryptionImplFromJson(Map<String, dynamic> json) =>
    _$DataEncryptionImpl(
      isEnabled: json['isEnabled'] as bool,
      method: $enumDecode(_$EncryptionMethodEnumMap, json['method']),
      keyId: json['keyId'] as String,
      lastRotation: DateTime.parse(json['lastRotation'] as String),
      encryptedFields: (json['encryptedFields'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$DataEncryptionImplToJson(
        _$DataEncryptionImpl instance) =>
    <String, dynamic>{
      'isEnabled': instance.isEnabled,
      'method': _$EncryptionMethodEnumMap[instance.method]!,
      'keyId': instance.keyId,
      'lastRotation': instance.lastRotation.toIso8601String(),
      'encryptedFields': instance.encryptedFields,
    };

const _$EncryptionMethodEnumMap = {
  EncryptionMethod.aes256: 'aes256',
  EncryptionMethod.rsa2048: 'rsa2048',
  EncryptionMethod.ellipticCurve: 'ellipticCurve',
};
