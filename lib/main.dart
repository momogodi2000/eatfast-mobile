import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'core/constants/app_constants.dart';
import 'core/router/route_names.dart';
import 'core/router/route_guard.dart';
import 'core/theme/app_theme.dart';
import 'core/services/localization/language_service.dart';
import 'core/l10n/app_localizations.dart';
import 'core/auth/models/app_user.dart';
import 'core/auth/providers/auth_provider.dart';
import 'features/splash/presentation/screens/splash_screen.dart';
import 'features/legal/presentation/screens/terms_conditions_screen.dart';
import 'features/onboarding/presentation/screens/onboarding_screen.dart';
import 'features/onboarding/presentation/screens/welcome_screen.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/screens/login_api_screen.dart';
import 'features/auth/presentation/screens/register_screen.dart';
import 'features/auth/presentation/screens/forgot_password_screen.dart';
import 'features/auth/presentation/screens/otp_verification_screen.dart';
import 'features/company/presentation/screens/about_us_screen.dart';
import 'features/company/presentation/screens/our_team_screen.dart';
import 'features/company/presentation/screens/contact_us_screen.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/restaurants/presentation/screens/restaurant_list_screen.dart';
import 'features/restaurants/presentation/screens/restaurant_detail_screen.dart';
import 'features/cart/presentation/screens/cart_screen.dart';
import 'features/cart/presentation/screens/checkout_screen.dart';
import 'features/orders/presentation/screens/order_tracking_screen.dart';
import 'features/orders/presentation/screens/order_history_screen.dart';
import 'features/settings/presentation/screens/language_settings_screen.dart';
import 'features/settings/presentation/screens/settings_screen.dart';
import 'features/profile/presentation/screens/profile_screen.dart';
import 'features/profile/presentation/screens/profile_api_screen.dart';
import 'features/profile/presentation/screens/edit_profile_screen.dart';
// Role-specific screens
import 'features/restaurant_owner/presentation/screens/restaurant_dashboard_screen.dart';
import 'features/driver/presentation/screens/driver_dashboard_screen.dart';
import 'features/admin/presentation/screens/admin_dashboard_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: EatFastApp(),
    ),
  );
}

class EatFastApp extends ConsumerWidget {
  const EatFastApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(languageProvider);
    final authState = ref.watch(authProvider);
    
    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      locale: currentLanguage.locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _createRouter(authState),
    );
  }
}

// Router configuration with auth guards
GoRouter _createRouter(AuthState authState) {
  return GoRouter(
    initialLocation: RouteNames.splash,
    redirect: (context, state) {
      // Handle auth redirects
      final path = state.fullPath;
      
      // Allow access to public routes
      final publicRoutes = [
        RouteNames.splash,
        RouteNames.terms,
        RouteNames.onboarding,
        RouteNames.welcome,
        RouteNames.login,
        RouteNames.register,
        RouteNames.forgotPassword,
        RouteNames.otpVerification,
        RouteNames.aboutUs,
      ];
      
      if (publicRoutes.contains(path)) return null;
      
      // Check auth for protected routes
      if (path == '/restaurant-dashboard') {
        return RouteGuard.checkAuth(
          authState: authState,
          requiredRole: UserRole.restaurantOwner,
        );
      }
      
      if (path == '/driver-dashboard') {
        return RouteGuard.checkAuth(
          authState: authState,
          requiredRole: UserRole.deliveryAgent,
        );
      }
      
      if (path == '/admin-dashboard') {
        return RouteGuard.checkAuth(
          authState: authState,
          requiredRole: UserRole.admin,
        );
      }
      
      // For other protected routes, just check authentication
      return RouteGuard.checkAuth(authState: authState);
    },
    routes: [
    // Splash Screen
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    
    // Terms & Conditions
    GoRoute(
      path: RouteNames.terms,
      builder: (context, state) => const TermsConditionsScreen(),
    ),
    
    // Onboarding
    GoRoute(
      path: RouteNames.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    
    // Welcome
    GoRoute(
      path: RouteNames.welcome,
      builder: (context, state) => const WelcomeScreen(),
    ),
    
    // Authentication
    GoRoute(
      path: RouteNames.login,
      builder: (context, state) => const LoginScreen(),
    ),
    
    // New API-based login (for testing/integration)
    GoRoute(
      path: '/login-api',
      builder: (context, state) => const LoginApiScreen(),
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
    
    // Company Pages
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
      ),    // Home Screen
    GoRoute(
      path: RouteNames.home,
      builder: (context, state) => const HomeScreen(),
    ),
    
    // Restaurant Routes
    GoRoute(
      path: RouteNames.restaurants,
      builder: (context, state) {
  // Parse query parameters for filtering (not used yet)
  return const RestaurantListScreen();
      },
    ),
    
    
    GoRoute(
      path: '/restaurants/:restaurantId',
      builder: (context, state) {
        final restaurantId = state.pathParameters['restaurantId']!;
        return RestaurantDetailScreen(
          restaurantId: restaurantId,
        );
      },
    ),
    
    
    // Cart Routes
    GoRoute(
      path: RouteNames.cart,
      builder: (context, state) => const CartScreen(),
    ),
    
    GoRoute(
      path: RouteNames.checkout,
      builder: (context, state) => const CheckoutScreen(),
    ),
    
    // Order Routes
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
    
    // Profile Routes
    GoRoute(
      path: RouteNames.profile,
      builder: (context, state) => const ProfileScreen(),
    ),
    
    // New API-based Profile (for testing/integration)
    GoRoute(
      path: '/profile-api',
      builder: (context, state) => const ProfileApiScreen(),
    ),
    
      GoRoute(
        path: RouteNames.editProfile,
        builder: (context, state) => const EditProfileScreen(),
      ),
      
      GoRoute(
        path: RouteNames.settings,
        builder: (context, state) => const SettingsScreen(),
      ),      // Role-specific Dashboard Routes (Protected)
      GoRoute(
        path: '/restaurant-dashboard',
        builder: (context, state) => RestaurantDashboardScreen(
          restaurantId: authState.user?.id ?? 'demo_restaurant',
        ),
      ),
      
      GoRoute(
        path: '/driver-dashboard',
        builder: (context, state) => DriverDashboardScreen(
          driverId: authState.user?.id ?? 'demo_driver',
        ),
      ),
      
      GoRoute(
        path: '/admin-dashboard',
        builder: (context, state) => const AdminDashboardScreen(),
      ),
      
      // Language Settings
      GoRoute(
        path: RouteNames.languageSettings,
        builder: (context, state) => const LanguageSettingsScreen(),
      ),
      
      // Unauthorized Access
      GoRoute(
        path: '/unauthorized',
        builder: (context, state) => const UnauthorizedScreen(),
      ),
    ],
  );
}

// Simple unauthorized access screen
class UnauthorizedScreen extends StatelessWidget {
  const UnauthorizedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unauthorized Access')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock_outline, size: 64, color: Colors.red),
            SizedBox(height: 16),
            Text(
              'Unauthorized Access',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('You do not have permission to access this page.'),
          ],
        ),
      ),
    );
  }
}

