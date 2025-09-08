import '../domain/auth_user.dart';

/// Abstract repository interface for authentication operations
abstract class AuthApiRepository {
  /// Login with email and password
  Future<AuthResponse> login(LoginRequest request);
  
  /// Register new user account
  Future<AuthResponse> register(RegisterRequest request);
  
  /// Request password reset
  Future<void> requestPasswordReset(PasswordResetRequest request);
  
  /// Reset password with OTP
  Future<void> resetPasswordWithOtp(String phone, String otp, String newPassword);
  
  /// Verify OTP (for registration, password reset, etc.)
  Future<AuthResponse> verifyOtp(OtpVerificationRequest request);
  
  /// Resend OTP
  Future<void> resendOtp(String phone, String type);
  
  /// Change password (authenticated users)
  Future<void> changePassword(ChangePasswordRequest request);
  
  /// Refresh access token
  Future<AuthResponse> refreshToken(String refreshToken);
  
  /// Logout (invalidate tokens)
  Future<void> logout();
  
  /// Get current user profile
  Future<AuthUser> getCurrentUser();
  
  /// Verify email
  Future<void> verifyEmail(String token);
  
  /// Verify phone
  Future<void> verifyPhone(String phone, String otp);
  
  /// Social login (Google, Facebook, etc.)
  Future<AuthResponse> socialLogin(String provider, String token);
}
