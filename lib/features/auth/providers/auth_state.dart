import 'package:eatfast_mobile/core/auth/providers/auth_provider.dart';
import 'package:eatfast_mobile/core/auth/models/app_user.dart';

/// Auth state classes for UI handling
class AuthAuthenticated extends AuthState {
  const AuthAuthenticated({
    required AppUser user,
  }) : super(
          status: AuthStatus.authenticated, 
          user: user,
        );
}

class AuthLoading extends AuthState {
  const AuthLoading() : super(status: AuthStatus.loading);
}

class AuthError extends AuthState {
  final String message;
  
  const AuthError(this.message) : super(
    status: AuthStatus.unauthenticated,
    error: message,
  );
}

class AuthOtpSent extends AuthState {
  final String phoneNumber;
  
  const AuthOtpSent(this.phoneNumber) : super(
    status: AuthStatus.unauthenticated,
  );
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated() : super(
    status: AuthStatus.unauthenticated,
  );
}
