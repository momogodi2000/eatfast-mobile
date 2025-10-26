/// Centralized GoRouter Configuration with Role-Based Access Control
/// Production-ready router with auth guards and role enforcement
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eatfast_mobile/shared/services/auth/models/app_user.dart';
import 'package:eatfast_mobile/shared/services/auth/providers/unified_auth_provider.dart';
import './route_names.dart';
import './route_guard.dart';

// Import all screens
import 'package:eatfast_mobile/shared/splash/presentation/screens/splash_screen.dart';
import 'package:eatfast_mobile/shared/screens/legal/presentation/screens/terms_conditions_screen.dart';
import 'package:eatfast_mobile/shared/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:eatfast_mobile/shared/services/auth/presentation/screens/login_screen.dart';
import 'package:eatfast_mobile/shared/services/auth/presentation/screens/register_screen.dart';
import 'package:eatfast_mobile/shared/services/auth/presentation/screens/forgot_password_screen.dart';
import 'package:eatfast_mobile/shared/services/auth/presentation/screens/otp_verification_screen.dart';
import 'package:eatfast_mobile/shared/services/company/presentation/screens/about_us_screen.dart';
import 'package:eatfast_mobile/shared/services/company/presentation/screens/our_team_screen.dart';
import 'package:eatfast_mobile/shared/services/company/presentation/screens/contact_us_screen.dart';
import 'package:eatfast_mobile/modules/client_module/screens/home/home_screen.dart';
import 'package:eatfast_mobile/shared/services/restaurants/presentation/screens/restaurant_list_screen.dart';
import 'package:eatfast_mobile/shared/services/restaurants/presentation/screens/restaurant_detail_screen.dart';
import 'package:eatfast_mobile/shared/services/cart/presentation/screens/cart_screen.dart';
import 'package:eatfast_mobile/shared/services/cart/presentation/screens/checkout_screen.dart';
import 'package:eatfast_mobile/shared/services/orders/presentation/screens/order_tracking_screen.dart';
import 'package:eatfast_mobile/modules/client_module/screens/orders/order_history_screen.dart';
import 'package:eatfast_mobile/shared/screens/settings/presentation/screens/language_settings_screen.dart';
import 'package:eatfast_mobile/shared/screens/settings/presentation/screens/settings_screen.dart';
import 'package:eatfast_mobile/modules/client_module/screens/profile/profile_screen.dart';
import 'package:eatfast_mobile/modules/client_module/screens/profile/edit_profile_screen.dart';
import 'package:eatfast_mobile/modules/guest_module/screens/guest_landing_screen.dart';
import 'package:eatfast_mobile/modules/guest_module/screens/guest_checkout_screen.dart';
import 'package:eatfast_mobile/shared/services/promotions/presentation/screens/promotions_screen.dart';
import 'package:eatfast_mobile/modules/guest_module/screens/guest_restaurant_discovery_screen.dart';
// import 'package:eatfast_mobile/modules/admin_module/screens/admin_dashboard_screen.dart';
// import 'package:eatfast_mobile/modules/admin_module/screens/user_management_screen.dart';
// import 'package:eatfast_mobile/modules/admin_module/screens/restaurant_management_screen.dart';
// import 'package:eatfast_mobile/modules/admin_module/screens/order_management_screen.dart';
// import 'package:eatfast_mobile/modules/admin_module/screens/financial_reports_screen.dart';
// import 'package:eatfast_mobile/modules/admin_module/screens/live_delivery_tracking_screen.dart';
import 'package:eatfast_mobile/modules/restaurant_manager_module/screens/restaurant_dashboard_screen.dart';
import 'package:eatfast_mobile/modules/restaurant_manager_module/screens/live_orders_screen.dart';
import 'package:eatfast_mobile/modules/restaurant_manager_module/screens/menu_management_screen.dart';
import 'package:eatfast_mobile/modules/restaurant_manager_module/screens/analytics_reports_screen.dart';
import 'package:eatfast_mobile/modules/restaurant_manager_module/screens/restaurant_profile_screen.dart';
import 'package:eatfast_mobile/modules/restaurant_manager_module/screens/wallet_financials_screen.dart';
import 'package:eatfast_mobile/modules/restaurant_manager_module/screens/notifications_screen.dart';
import 'package:eatfast_mobile/modules/client_module/screens/client_dashboard_screen.dart';
import 'package:eatfast_mobile/modules/client_module/screens/favorites/favorites_screen.dart';
import 'package:eatfast_mobile/modules/client_module/screens/loyalty/loyalty_screen.dart';
import 'package:eatfast_mobile/modules/client_module/screens/wallet/wallet_screen.dart';
import 'package:eatfast_mobile/modules/client_module/screens/profile/payment_methods_screen.dart';
import 'package:eatfast_mobile/modules/client_module/screens/profile/address_management_screen.dart';
import 'package:eatfast_mobile/shared/screens/unauthorized_screen.dart' as unauthorized;

class AppRouter {
  /// Create GoRouter instance with auth state
  static GoRouter createRouter(AuthState authState) {
    return GoRouter(
      initialLocation: RouteNames.splash,
      debugLogDiagnostics: true,
      redirect: (context, state) => _handleRedirect(context, state, authState),
      routes: _buildRoutes(),
      errorBuilder: (context, state) => _buildErrorScreen(context, state),
    );
  }

  /// Global redirect handler with role-based access control
  static String? _handleRedirect(
    BuildContext context,
    GoRouterState state,
    AuthState authState,
  ) {
    final path = state.fullPath;

    // Public routes that don't require authentication
    final publicRoutes = [
      RouteNames.splash,
      RouteNames.terms,
      RouteNames.onboarding,
      RouteNames.login,
      RouteNames.register,
      RouteNames.forgotPassword,
      RouteNames.otpVerification,
      RouteNames.aboutUs,
      RouteNames.contactUs,
      RouteNames.ourTeam,
      RouteNames.guestLanding,
      RouteNames.guestRestaurants,
      RouteNames.guestCheckout,
      RouteNames.promotions,
      RouteNames.restaurants,
      '/unauthorized',
    ];

    // Allow access to public routes
    if (publicRoutes.any((route) => path?.startsWith(route) ?? false)) {
      return null;
    }

    // Handle admin routes access - Temporarily disabled
    // if (path?.startsWith('/admin') ?? false) {
    //   return RouteGuard.checkAuth(
    //     authState: authState,
    //     requiredRole: UserRole.admin,
    //   );
    // }

    // Handle restaurant dashboard access
    if (path?.startsWith('/restaurant-dashboard') ?? false) {
      return RouteGuard.checkAuth(
        authState: authState,
        requiredRole: UserRole.restaurantOwner,
      );
    }

    // Handle driver dashboard access
    if (path?.startsWith('/driver-dashboard') ?? false) {
      return RouteGuard.checkAuth(
        authState: authState,
        requiredRole: UserRole.deliveryAgent,
      );
    }

    // For all other routes, just check if user is authenticated
    if (!authState.isAuthenticated) {
      return RouteNames.login;
    }

    return null;
  }

  /// Build all app routes
  static List<RouteBase> _buildRoutes() {
    return [
      // ============================================
      // PUBLIC ROUTES (No Authentication Required)
      // ============================================

      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: RouteNames.terms,
        builder: (context, state) => const TermsConditionsScreen(),
      ),

      GoRoute(
        path: RouteNames.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),

      // ============================================
      // AUTHENTICATION ROUTES
      // ============================================

      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),

      GoRoute(
        path: RouteNames.register,
        builder: (context, state) => const RegisterScreen(),
      ),

      GoRoute(
        path: RouteNames.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),

      GoRoute(
        path: RouteNames.otpVerification,
        builder: (context, state) {
          final phone = state.uri.queryParameters['phone'] ?? '';
          return OtpVerificationScreen(phoneNumber: phone);
        },
      ),

      // ============================================
      // COMPANY PAGES
      // ============================================

      GoRoute(
        path: RouteNames.aboutUs,
        builder: (context, state) => const AboutUsScreen(),
      ),

      GoRoute(
        path: RouteNames.ourTeam,
        builder: (context, state) => const OurTeamScreen(),
      ),

      GoRoute(
        path: RouteNames.contactUs,
        builder: (context, state) => const ContactUsScreen(),
      ),

      // ============================================
      // GUEST ROUTES
      // ============================================

      GoRoute(
        path: RouteNames.guestLanding,
        builder: (context, state) => const GuestLandingScreen(),
      ),

      GoRoute(
        path: RouteNames.guestRestaurants,
        builder: (context, state) => const GuestRestaurantDiscoveryScreen(),
      ),

      GoRoute(
        path: RouteNames.guestCheckout,
        builder: (context, state) {
          final restaurantId = state.uri.queryParameters['restaurantId'] ?? 'demo_restaurant';
          final restaurantName = state.uri.queryParameters['restaurantName'] ?? 'Demo Restaurant';
          final subtotalStr = state.uri.queryParameters['subtotal'] ?? '0.0';
          final subtotal = double.tryParse(subtotalStr) ?? 0.0;

          return GuestCheckoutScreen(
            restaurantId: restaurantId,
            restaurantName: restaurantName,
            cartItems: const [],
            subtotal: subtotal,
          );
        },
      ),

      // ============================================
      // PROMOTIONS
      // ============================================

      GoRoute(
        path: RouteNames.promotions,
        builder: (context, state) => const PromotionsScreen(),
      ),

      // ============================================
      // AUTHENTICATED ROUTES (Customer & Above)
      // ============================================

      GoRoute(
        path: RouteNames.home,
        builder: (context, state) => const HomeScreen(),
      ),

      GoRoute(
        path: RouteNames.restaurants,
        builder: (context, state) => const RestaurantListScreen(),
      ),

      GoRoute(
        path: '/restaurants/:restaurantId',
        builder: (context, state) {
          final restaurantId = state.pathParameters['restaurantId']!;
          return RestaurantDetailScreen(restaurantId: restaurantId);
        },
      ),

      GoRoute(
        path: RouteNames.cart,
        builder: (context, state) => const CartScreen(),
      ),

      GoRoute(
        path: RouteNames.checkout,
        builder: (context, state) => const CheckoutScreen(),
      ),

      GoRoute(
        path: '/order-tracking/:orderId',
        builder: (context, state) {
          final orderId = state.pathParameters['orderId']!;
          return OrderTrackingScreen(orderId: orderId);
        },
      ),

      GoRoute(
        path: RouteNames.orderHistory,
        builder: (context, state) => const OrderHistoryScreen(),
      ),

      GoRoute(
        path: RouteNames.profile,
        builder: (context, state) => const ProfileScreen(),
      ),

      GoRoute(
        path: RouteNames.editProfile,
        builder: (context, state) => const EditProfileScreen(),
      ),

      GoRoute(
        path: RouteNames.settings,
        builder: (context, state) => const SettingsScreen(),
      ),

      GoRoute(
        path: RouteNames.languageSettings,
        builder: (context, state) => const LanguageSettingsScreen(),
      ),

      // ============================================
      // ROLE-SPECIFIC ROUTES
      // ============================================

      // ============================================
      // CLIENT/CUSTOMER DASHBOARD (Authenticated Customers)
      // ============================================

      GoRoute(
        path: '/client-dashboard',
        builder: (context, state) => const ClientDashboardScreen(),
      ),

      // Additional Client Routes
      GoRoute(
        path: '/favorites',
        builder: (context, state) => const FavoritesScreen(),
      ),

      GoRoute(
        path: '/loyalty',
        builder: (context, state) => const LoyaltyScreen(),
      ),

      GoRoute(
        path: '/wallet',
        builder: (context, state) => const WalletScreen(),
      ),

      GoRoute(
        path: '/payment-methods',
        builder: (context, state) => const PaymentMethodsScreen(),
      ),

      GoRoute(
        path: '/addresses',
        builder: (context, state) => const AddressManagementScreen(),
      ),

      // ============================================
      // ADMIN ROUTES (Admin Only) - Temporarily disabled
      // ============================================
      
      // // Admin Routes (Admin Only)
      // GoRoute(
      //   path: '/admin-dashboard',
      //   builder: (context, state) => const AdminDashboardScreen(),
      // ),

      // GoRoute(
      //   path: '/admin/users',
      //   builder: (context, state) => const UserManagementScreen(),
      // ),

      // GoRoute(
      //   path: '/admin/restaurants',
      //   builder: (context, state) => const RestaurantManagementScreen(),
      // ),

      // GoRoute(
      //   path: '/admin/orders',
      //   builder: (context, state) => const OrderManagementScreen(),
      // ),

      // GoRoute(
      //   path: '/admin/financial-reports',
      //   builder: (context, state) => const FinancialReportsScreen(),
      // ),

      // GoRoute(
      //   path: '/admin/live-tracking',
      //   builder: (context, state) => const LiveDeliveryTrackingScreen(),
      // ),

      // ============================================
      // RESTAURANT MANAGER ROUTES (Restaurant Owner Only)
      // ============================================

      // Restaurant Dashboard
      GoRoute(
        path: '/restaurant-dashboard/:restaurantId',
        builder: (context, state) {
          final restaurantId = state.pathParameters['restaurantId']!;
          return RestaurantDashboardScreen(restaurantId: restaurantId);
        },
      ),

      // Live Orders Management
      GoRoute(
        path: '/restaurant-owner/:restaurantId/orders',
        builder: (context, state) {
          final restaurantId = state.pathParameters['restaurantId']!;
          return LiveOrdersScreen(restaurantId: restaurantId);
        },
      ),

      // Menu Management
      GoRoute(
        path: '/restaurant-owner/:restaurantId/menu',
        builder: (context, state) {
          final restaurantId = state.pathParameters['restaurantId']!;
          return MenuManagementScreen(restaurantId: restaurantId);
        },
      ),

      // Analytics & Reports
      GoRoute(
        path: '/restaurant-owner/:restaurantId/analytics',
        builder: (context, state) {
          final restaurantId = state.pathParameters['restaurantId']!;
          return AnalyticsReportsScreen(restaurantId: restaurantId);
        },
      ),

      // Restaurant Profile/Settings
      GoRoute(
        path: '/restaurant-owner/:restaurantId/profile',
        builder: (context, state) {
          final restaurantId = state.pathParameters['restaurantId']!;
          return RestaurantProfileScreen(restaurantId: restaurantId);
        },
      ),

      // Wallet & Financials
      GoRoute(
        path: '/restaurant-owner/:restaurantId/wallet',
        builder: (context, state) {
          final restaurantId = state.pathParameters['restaurantId']!;
          return WalletFinancialsScreen(restaurantId: restaurantId);
        },
      ),

      // Notifications
      GoRoute(
        path: '/restaurant-owner/:restaurantId/notifications',
        builder: (context, state) {
          final restaurantId = state.pathParameters['restaurantId']!;
          return NotificationsScreen(restaurantId: restaurantId);
        },
      ),

      // Driver Dashboard (Delivery Agent Only)
      // TODO: Add when driver dashboard is implemented
      // GoRoute(
      //   path: '/driver-dashboard',
      //   builder: (context, state) => const DriverDashboardScreen(),
      // ),

      // ============================================
      // ERROR ROUTES
      // ============================================

      GoRoute(
        path: '/unauthorized',
        builder: (context, state) => const unauthorized.UnauthorizedScreen(),
      ),
    ];
  }

  /// Build error screen for 404 and other routing errors
  static Widget _buildErrorScreen(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Erreur'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            const Text(
              'Page non trouvée',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'La page "${state.uri}" n\'existe pas.',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => context.go(RouteNames.home),
              icon: const Icon(Icons.home),
              label: const Text('Retour à l\'accueil'),
            ),
          ],
        ),
      ),
    );
  }
}
