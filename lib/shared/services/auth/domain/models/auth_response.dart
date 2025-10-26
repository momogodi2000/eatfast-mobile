import 'package:eatfast_mobile/shared/services/auth/models/app_user.dart';

/// Authentication Result - returned by auth service methods
class AuthResult {
  final bool isSuccess;
  final AppUser? user;
  final String? token;
  final String? refreshToken;
  final String? message;
  final bool requiresTwoFactor;
  final bool requiresEmailVerification;
  final String? userId;
  final List<String>? twoFactorMethods;
  final Map<String, dynamic>? additionalData;

  const AuthResult({
    required this.isSuccess,
    this.user,
    this.token,
    this.refreshToken,
    this.message,
    this.requiresTwoFactor = false,
    this.requiresEmailVerification = false,
    this.userId,
    this.twoFactorMethods,
    this.additionalData,
  });

  /// Success with user data
  factory AuthResult.success({
    required AppUser user,
    required String token,
    String? refreshToken,
    String? message,
  }) {
    return AuthResult(
      isSuccess: true,
      user: user,
      token: token,
      refreshToken: refreshToken,
      message: message ?? 'Authentication successful',
    );
  }

  /// Failure with error message
  factory AuthResult.failure({required String message}) {
    return AuthResult(
      isSuccess: false,
      message: message,
    );
  }

  /// Two-factor authentication required
  factory AuthResult.twoFactorRequired({
    required String userId,
    required List<String> methods,
    String? message,
  }) {
    return AuthResult(
      isSuccess: false,
      requiresTwoFactor: true,
      userId: userId,
      twoFactorMethods: methods,
      message: message ?? 'Two-factor authentication required',
    );
  }

  /// Email verification required
  factory AuthResult.emailVerificationRequired({
    String? message,
  }) {
    return AuthResult(
      isSuccess: false,
      requiresEmailVerification: true,
      message: message ?? 'Please verify your email address',
    );
  }

  /// From backend API response
  factory AuthResult.fromJson(Map<String, dynamic> json) {
    final success = json['success'] as bool? ?? false;

    if (!success) {
      // Check for 2FA requirement
      if (json['requires2FA'] == true || json['requiresTwoFactor'] == true) {
        return AuthResult.twoFactorRequired(
          userId: json['userId'] as String? ?? '',
          methods: (json['twoFactorMethods'] as List<dynamic>?)
                  ?.map((e) => e.toString())
                  .toList() ??
              [],
          message: json['message'] as String?,
        );
      }

      // Check for email verification requirement
      if (json['requiresEmailVerification'] == true) {
        return AuthResult.emailVerificationRequired(
          message: json['message'] as String?,
        );
      }

      // General failure
      return AuthResult.failure(
        message: json['message'] as String? ?? 'Authentication failed',
      );
    }

    // Success case
    return AuthResult.success(
      user: AppUser.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String? ?? json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': isSuccess,
      'user': user?.toJson(),
      'token': token,
      'refreshToken': refreshToken,
      'message': message,
      'requiresTwoFactor': requiresTwoFactor,
      'requiresEmailVerification': requiresEmailVerification,
      'userId': userId,
      'twoFactorMethods': twoFactorMethods,
      'additionalData': additionalData,
    };
  }

  @override
  String toString() {
    return 'AuthResult(isSuccess: $isSuccess, message: $message, requiresTwoFactor: $requiresTwoFactor)';
  }
}

/// Login Response from API
class LoginResponse {
  final bool success;
  final String? message;
  final String? token;
  final String? refreshToken;
  final AppUser? user;
  final bool? requiresTwoFactor;
  final String? userId;
  final List<String>? twoFactorMethods;

  const LoginResponse({
    required this.success,
    this.message,
    this.token,
    this.refreshToken,
    this.user,
    this.requiresTwoFactor,
    this.userId,
    this.twoFactorMethods,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String?,
      token: json['token'] as String? ?? json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      user: json['user'] != null
          ? AppUser.fromJson(json['user'] as Map<String, dynamic>)
          : null,
      requiresTwoFactor:
          json['requires2FA'] as bool? ?? json['requiresTwoFactor'] as bool?,
      userId: json['userId'] as String?,
      twoFactorMethods: (json['twoFactorMethods'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'token': token,
      'refreshToken': refreshToken,
      'user': user?.toJson(),
      'requiresTwoFactor': requiresTwoFactor,
      'userId': userId,
      'twoFactorMethods': twoFactorMethods,
    };
  }
}

/// Register Response from API
class RegisterResponse {
  final bool success;
  final String? message;
  final String? token;
  final String? refreshToken;
  final AppUser? user;
  final bool? requiresEmailVerification;

  const RegisterResponse({
    required this.success,
    this.message,
    this.token,
    this.refreshToken,
    this.user,
    this.requiresEmailVerification,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String?,
      token: json['token'] as String? ?? json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      user: json['user'] != null
          ? AppUser.fromJson(json['user'] as Map<String, dynamic>)
          : null,
      requiresEmailVerification:
          json['requiresEmailVerification'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'token': token,
      'refreshToken': refreshToken,
      'user': user?.toJson(),
      'requiresEmailVerification': requiresEmailVerification,
    };
  }
}

/// OTP Response from API
class OtpResponse {
  final bool success;
  final String? message;
  final String? otpId;
  final int? expiresIn;

  const OtpResponse({
    required this.success,
    this.message,
    this.otpId,
    this.expiresIn,
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String?,
      otpId: json['otpId'] as String?,
      expiresIn: json['expiresIn'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'otpId': otpId,
      'expiresIn': expiresIn,
    };
  }
}
