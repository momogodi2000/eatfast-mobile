import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

/// API-aligned user model for authentication
@freezed
class AuthUser with _$AuthUser {
  const factory AuthUser({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    String? profileImage,
    @Default(false) bool isEmailVerified,
    @Default(false) bool isPhoneVerified,
    @Default('client') String role,
    @Default(0) int loyaltyPoints,
    @Default('Bronze') String loyaltyLevel,
    DateTime? lastLoginAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AuthUser;

  const AuthUser._();

  factory AuthUser.fromJson(Map<String, dynamic> json) => _$AuthUserFromJson(json);

  /// Helper getter for full name
  String get fullName => '$firstName $lastName';

  /// Helper getter for display name
  String get displayName => fullName.isNotEmpty ? fullName : email;
}

/// Login request model
@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
    @Default(false) bool rememberMe,
    String? deviceToken,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
}

/// Register request model
@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    @Default(true) bool acceptTerms,
    String? deviceToken,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);
}

/// Password reset request model
@freezed
class PasswordResetRequest with _$PasswordResetRequest {
  const factory PasswordResetRequest({
    required String email,
  }) = _PasswordResetRequest;

  factory PasswordResetRequest.fromJson(Map<String, dynamic> json) => _$PasswordResetRequestFromJson(json);
}

/// OTP verification request model
@freezed
class OtpVerificationRequest with _$OtpVerificationRequest {
  const factory OtpVerificationRequest({
    required String phone,
    required String otp,
    required String type, // 'registration', 'password_reset', 'phone_verification'
  }) = _OtpVerificationRequest;

  factory OtpVerificationRequest.fromJson(Map<String, dynamic> json) => _$OtpVerificationRequestFromJson(json);
}

/// Change password request model
@freezed
class ChangePasswordRequest with _$ChangePasswordRequest {
  const factory ChangePasswordRequest({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) = _ChangePasswordRequest;

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) => _$ChangePasswordRequestFromJson(json);
}

/// Authentication response model
@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required AuthUser user,
    required String accessToken,
    required String refreshToken,
    required int expiresIn,
    String? message,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
}

/// Authentication error model
@freezed
class AuthError with _$AuthError {
  const factory AuthError({
    required String code,
    required String message,
    String? field,
    Map<String, dynamic>? details,
  }) = _AuthError;

  factory AuthError.fromJson(Map<String, dynamic> json) => _$AuthErrorFromJson(json);
}

/// Authentication state
@freezed
class AuthApiState with _$AuthApiState {
  const factory AuthApiState.initial() = AuthInitial;
  const factory AuthApiState.loading() = AuthLoading;
  const factory AuthApiState.authenticated(AuthUser user) = AuthAuthenticated;
  const factory AuthApiState.unauthenticated() = AuthUnauthenticated;
  const factory AuthApiState.error(String message, {String? code}) = AuthErrorState;
  
  // Specific loading states
  const factory AuthApiState.loggingIn() = AuthLoggingIn;
  const factory AuthApiState.registering() = AuthRegistering;
  const factory AuthApiState.resettingPassword() = AuthResettingPassword;
  const factory AuthApiState.verifyingOtp() = AuthVerifyingOtp;
  const factory AuthApiState.changingPassword() = AuthChangingPassword;
}
