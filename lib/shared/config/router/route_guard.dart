import 'package:flutter/material.dart';
import 'package:eatfast_mobile/shared/services/auth/providers/unified_auth_provider.dart';
import 'package:eatfast_mobile/shared/services/auth/models/app_user.dart';

/// Route guard that checks authentication and role permissions
class RouteGuard {
  static String? checkAuth({
    required AuthState authState,
    UserRole? requiredRole,
    List<UserRole>? allowedRoles,
  }) {
    // If not authenticated, redirect to login
    if (!authState.isAuthenticated) {
      return '/login';
    }

    // If loading, stay on current route
    if (authState.isLoading) {
      return null;
    }

    // If specific role is required
    if (requiredRole != null && authState.user != null && !authState.user!.hasRole(requiredRole)) {
      return _getUnauthorizedRoute(authState.user?.role);
    }

    // If any of the allowed roles is required
    if (allowedRoles != null && authState.user != null && !authState.user!.hasAnyRole(allowedRoles)) {
      return _getUnauthorizedRoute(authState.user?.role);
    }

    // All checks passed
    return null;
  }

  /// Get appropriate route based on user role when unauthorized
  static String _getUnauthorizedRoute(UserRole? userRole) {
    switch (userRole) {
      case UserRole.restaurantOwner:
        return '/restaurant-dashboard';
      case UserRole.deliveryAgent:
        return '/driver-dashboard';
      case UserRole.admin:
        return '/admin-dashboard';
      case UserRole.customer:
        return '/home';
      case UserRole.guest:
        return '/welcome';
      case null:
        return '/home';
    }
  }

  /// Get default route after successful login based on user role
  static String getDefaultRouteForRole(UserRole role) {
    switch (role) {
      case UserRole.restaurantOwner:
        return '/restaurant-dashboard';
      case UserRole.deliveryAgent:
        return '/driver-dashboard';
      case UserRole.admin:
        return '/admin-dashboard';
      case UserRole.customer:
        return '/home';
      case UserRole.guest:
        return '/welcome';
    }
  }
}

/// Auth guard widget that wraps protected routes
class AuthGuardWidget extends StatelessWidget {
  final Widget child;
  final UserRole? requiredRole;
  final List<UserRole>? allowedRoles;

  const AuthGuardWidget({
    super.key,
    required this.child,
    this.requiredRole,
    this.allowedRoles,
  });

  @override
  Widget build(BuildContext context) {
    return child; // The route guard logic is handled in GoRouter redirect
  }
}
