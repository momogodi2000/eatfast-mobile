import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../auth/models/app_user.dart';
import '../auth/providers/auth_provider.dart';

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
    if (requiredRole != null && !authState.hasRequiredRole(requiredRole)) {
      return _getUnauthorizedRoute(authState.user?.role);
    }

    // If any of the allowed roles is required
    if (allowedRoles != null && !authState.hasAnyRole(allowedRoles)) {
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
      case UserRole.driver:
        return '/driver-dashboard';
      case UserRole.admin:
        return '/admin-dashboard';
      case UserRole.customer:
        return '/home';
      case null:
        return '/home';
    }
  }

  /// Get default route after successful login based on user role
  static String getDefaultRouteForRole(UserRole role) {
    switch (role) {
      case UserRole.restaurantOwner:
        return '/restaurant-dashboard';
      case UserRole.driver:
        return '/driver-dashboard';
      case UserRole.admin:
        return '/admin-dashboard';
      case UserRole.customer:
        return '/home';
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

/// Unauthorized access screen
class UnauthorizedScreen extends StatelessWidget {
  final UserRole? userRole;

  const UnauthorizedScreen({
    super.key,
    this.userRole,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accès non autorisé'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.block,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            const Text(
              'Accès non autorisé',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Vous n\'avez pas les permissions nécessaires pour accéder à cette page.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                final defaultRoute = RouteGuard.getDefaultRouteForRole(
                  userRole ?? UserRole.customer,
                );
                context.go(defaultRoute);
              },
              child: const Text('Retourner à l\'accueil'),
            ),
          ],
        ),
      ),
    );
  }
}
