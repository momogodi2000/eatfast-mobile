import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_models.freezed.dart';
part 'security_models.g.dart';

@freezed
class SecuritySettings with _$SecuritySettings {
  const factory SecuritySettings({
    required String userId,
    @Default(false) bool biometricEnabled,
    @Default(false) bool pinLockEnabled,
    @Default(false) bool autoLockEnabled,
    @Default(300) int autoLockTimeout, // seconds
    @Default(false) bool locationTrackingEnabled,
    @Default(true) bool dataEncryptionEnabled,
    @Default(false) bool fraudDetectionEnabled,
    @Default(true) bool securityAlertsEnabled,
    required DateTime lastUpdated,
  }) = _SecuritySettings;

  factory SecuritySettings.fromJson(Map<String, dynamic> json) =>
      _$SecuritySettingsFromJson(json);
}

@freezed
class SecurityAlert with _$SecurityAlert {
  const factory SecurityAlert({
    required String id,
    required DateTime timestamp,
    required SecurityAlertType type,
    required SecurityAlertSeverity severity,
    required String title,
    required String description,
    required Map<String, dynamic> metadata,
    @Default(false) bool isAcknowledged,
    @Default(false) bool isResolved,
  }) = _SecurityAlert;

  factory SecurityAlert.fromJson(Map<String, dynamic> json) =>
      _$SecurityAlertFromJson(json);
}

enum SecurityAlertType {
  suspiciousLogin,
  multipleFailedAttempts,
  newDeviceAccess,
  locationAnomalyDetected,
  dataAccessViolation,
  accountCompromiseAttempt,
  fraudulentActivity,
  unauthorizedApiAccess,
}

enum SecurityAlertSeverity {
  info,
  low,
  medium,
  high,
  critical,
}

@freezed
class BiometricSettings with _$BiometricSettings {
  const factory BiometricSettings({
    required bool isAvailable,
    required List<BiometricType> availableTypes,
    required BiometricType? enabledType,
    @Default(false) bool fallbackEnabled,
    required DateTime? lastAuthentication,
  }) = _BiometricSettings;

  factory BiometricSettings.fromJson(Map<String, dynamic> json) =>
      _$BiometricSettingsFromJson(json);
}

enum BiometricType {
  fingerprint,
  faceId,
  voiceId,
  irisId,
}

@freezed
class PrivacySettings with _$PrivacySettings {
  const factory PrivacySettings({
    required String userId,
    @Default(true) bool locationSharingEnabled,
    @Default(false) bool analyticsEnabled,
    @Default(false) bool crashReportingEnabled,
    @Default(true) bool marketingEmailsEnabled,
    @Default(true) bool pushNotificationsEnabled,
    @Default(false) bool dataExportRequested,
    @Default(false) bool accountDeletionRequested,
    required DateTime lastUpdated,
  }) = _PrivacySettings;

  factory PrivacySettings.fromJson(Map<String, dynamic> json) =>
      _$PrivacySettingsFromJson(json);
}

@freezed
class DataEncryption with _$DataEncryption {
  const factory DataEncryption({
    required bool isEnabled,
    required EncryptionMethod method,
    required String keyId,
    required DateTime lastRotation,
    required List<String> encryptedFields,
  }) = _DataEncryption;

  factory DataEncryption.fromJson(Map<String, dynamic> json) =>
      _$DataEncryptionFromJson(json);
}

enum EncryptionMethod {
  aes256,
  rsa2048,
  ellipticCurve,
}
