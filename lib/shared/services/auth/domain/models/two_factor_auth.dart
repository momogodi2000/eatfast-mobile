import 'package:flutter/material.dart';

class TwoFactorConfig {
  final bool isEnabled;
  final bool totpEnabled;
  final bool smsEnabled;
  final bool emailEnabled;
  final List<TrustedDevice> trustedDevices;
  final List<String> backupCodes;
  final String? totpSecret;
  final String? qrCodeUrl;
  final DateTime? lastBackupCodesGenerated;
  final bool? requireForLogin;
  final bool? allowTrustedDevices;
  final bool? requireForSensitiveActions;

  const TwoFactorConfig({
    required this.isEnabled,
    required this.totpEnabled,
    required this.smsEnabled,
    required this.emailEnabled,
    required this.trustedDevices,
    required this.backupCodes,
    this.totpSecret,
    this.qrCodeUrl,
    this.lastBackupCodesGenerated,
    this.requireForLogin,
    this.allowTrustedDevices,
    this.requireForSensitiveActions,
  });

  factory TwoFactorConfig.fromJson(Map<String, dynamic> json) {
    return TwoFactorConfig(
      isEnabled: json['isEnabled'] as bool,
      totpEnabled: json['totpEnabled'] as bool,
      smsEnabled: json['smsEnabled'] as bool,
      emailEnabled: json['emailEnabled'] as bool,
      trustedDevices: (json['trustedDevices'] as List<dynamic>)
          .map((e) => TrustedDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
      backupCodes: (json['backupCodes'] as List<dynamic>).cast<String>(),
      totpSecret: json['totpSecret'] as String?,
      qrCodeUrl: json['qrCodeUrl'] as String?,
      lastBackupCodesGenerated: json['lastBackupCodesGenerated'] != null
          ? DateTime.parse(json['lastBackupCodesGenerated'] as String)
          : null,
      requireForLogin: json['requireForLogin'] as bool?,
      allowTrustedDevices: json['allowTrustedDevices'] as bool?,
      requireForSensitiveActions: json['requireForSensitiveActions'] as bool?,
    );
  }

  TwoFactorConfig copyWith({
    bool? isEnabled,
    bool? totpEnabled,
    bool? smsEnabled,
    bool? emailEnabled,
    List<TrustedDevice>? trustedDevices,
    List<String>? backupCodes,
    String? totpSecret,
    String? qrCodeUrl,
    DateTime? lastBackupCodesGenerated,
    bool? requireForLogin,
    bool? allowTrustedDevices,
    bool? requireForSensitiveActions,
  }) {
    return TwoFactorConfig(
      isEnabled: isEnabled ?? this.isEnabled,
      totpEnabled: totpEnabled ?? this.totpEnabled,
      smsEnabled: smsEnabled ?? this.smsEnabled,
      emailEnabled: emailEnabled ?? this.emailEnabled,
      trustedDevices: trustedDevices ?? this.trustedDevices,
      backupCodes: backupCodes ?? this.backupCodes,
      totpSecret: totpSecret ?? this.totpSecret,
      qrCodeUrl: qrCodeUrl ?? this.qrCodeUrl,
      lastBackupCodesGenerated: lastBackupCodesGenerated ?? this.lastBackupCodesGenerated,
      requireForLogin: requireForLogin ?? this.requireForLogin,
      allowTrustedDevices: allowTrustedDevices ?? this.allowTrustedDevices,
      requireForSensitiveActions: requireForSensitiveActions ?? this.requireForSensitiveActions,
    );
  }
}

class TrustedDevice {
  final String id;
  final String name;
  final String deviceType;
  final String userAgent;
  final DateTime addedAt;
  final DateTime lastUsed;
  final bool isActive;
  final String? ipAddress;
  final String? location;

  const TrustedDevice({
    required this.id,
    required this.name,
    required this.deviceType,
    required this.userAgent,
    required this.addedAt,
    required this.lastUsed,
    required this.isActive,
    this.ipAddress,
    this.location,
  });

  factory TrustedDevice.fromJson(Map<String, dynamic> json) {
    return TrustedDevice(
      id: json['id'] as String,
      name: json['name'] as String,
      deviceType: json['deviceType'] as String,
      userAgent: json['userAgent'] as String,
      addedAt: DateTime.parse(json['addedAt'] as String),
      lastUsed: DateTime.parse(json['lastUsed'] as String),
      isActive: json['isActive'] as bool,
      ipAddress: json['ipAddress'] as String?,
      location: json['location'] as String?,
    );
  }
}

class TwoFactorSetupResponse {
  final String secret;
  final String qrCodeUrl;
  final List<String> backupCodes;

  const TwoFactorSetupResponse({
    required this.secret,
    required this.qrCodeUrl,
    required this.backupCodes,
  });

  factory TwoFactorSetupResponse.fromJson(Map<String, dynamic> json) {
    return TwoFactorSetupResponse(
      secret: json['secret'] as String,
      qrCodeUrl: json['qrCodeUrl'] as String,
      backupCodes: (json['backupCodes'] as List<dynamic>).cast<String>(),
    );
  }
}

class TwoFactorVerificationRequest {
  final String code;
  final TwoFactorMethod method;
  final String? deviceId;
  final bool? trustDevice;

  const TwoFactorVerificationRequest({
    required this.code,
    required this.method,
    this.deviceId,
    this.trustDevice,
  });

  factory TwoFactorVerificationRequest.fromJson(Map<String, dynamic> json) {
    return TwoFactorVerificationRequest(
      code: json['code'] as String,
      method: TwoFactorMethod.values.firstWhere((e) => e.name == json['method']),
      deviceId: json['deviceId'] as String?,
      trustDevice: json['trustDevice'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'method': method.name,
      if (deviceId != null) 'deviceId': deviceId,
      if (trustDevice != null) 'trustDevice': trustDevice,
    };
  }
}

enum TwoFactorMethod {
  totp,
  sms,
  email,
  backupCode,
}

extension TwoFactorMethodExtension on TwoFactorMethod {
  String get displayName {
    switch (this) {
      case TwoFactorMethod.totp:
        return 'Application d\'authentification';
      case TwoFactorMethod.sms:
        return 'SMS';
      case TwoFactorMethod.email:
        return 'Email';
      case TwoFactorMethod.backupCode:
        return 'Code de récupération';
    }
  }

  String get description {
    switch (this) {
      case TwoFactorMethod.totp:
        return 'Utilisez une application comme Google Authenticator';
      case TwoFactorMethod.sms:
        return 'Recevez un code par SMS';
      case TwoFactorMethod.email:
        return 'Recevez un code par email';
      case TwoFactorMethod.backupCode:
        return 'Utilisez un code de récupération';
    }
  }

  IconData get icon {
    switch (this) {
      case TwoFactorMethod.totp:
        return Icons.phonelink_lock;
      case TwoFactorMethod.sms:
        return Icons.sms;
      case TwoFactorMethod.email:
        return Icons.email;
      case TwoFactorMethod.backupCode:
        return Icons.security;
    }
  }
}
