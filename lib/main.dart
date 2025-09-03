import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'core/constants/app_constants.dart';
import 'core/router/route_names.dart';
import 'core/theme/app_theme.dart';
import 'core/l10n/app_localizations.dart';
import 'core/l10n/language_provider.dart';
import 'features/splash/presentation/screens/splash_screen.dart';
import 'features/legal/presentation/screens/terms_conditions_screen.dart';
import 'features/onboarding/presentation/screens/onboarding_screen.dart';
import 'features/onboarding/presentation/screens/welcome_screen.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/screens/register_screen.dart';
import 'features/auth/presentation/screens/forgot_password_screen.dart';
import 'features/auth/presentation/screens/otp_verification_screen.dart';
import 'features/company/presentation/screens/about_us_screen.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/restaurants/presentation/screens/restaurant_list_screen.dart';
import 'features/restaurants/presentation/screens/restaurant_detail_screen.dart';
import 'features/cart/presentation/screens/cart_screen.dart';
import 'features/cart/presentation/screens/checkout_screen.dart';
import 'features/orders/presentation/screens/order_tracking_screen.dart';
import 'features/orders/presentation/screens/order_history_screen.dart';
import 'features/settings/presentation/screens/language_settings_screen.dart';
import 'features/profile/presentation/screens/profile_screen.dart';

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
    final currentLocale = ref.watch(languageProvider);
    
    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      locale: currentLocale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _router,
    );
  }
}

// Router configuration
final _router = GoRouter(
  initialLocation: RouteNames.splash,
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
      builder: (context, state) => const Scaffold(
        body: Center(
          child: Text('Our Team Screen - Coming Soon'),
        ),
      ),
    ),
    
    GoRoute(
      path: RouteNames.contactUs,
      builder: (context, state) => const Scaffold(
        body: Center(
          child: Text('Contact Us Screen - Coming Soon'),
        ),
      ),
    ),
    
    // Home Screen
    GoRoute(
      path: RouteNames.home,
      builder: (context, state) => const HomeScreen(),
    ),
    
    // Restaurant Routes
    GoRoute(
      path: RouteNames.restaurants,
      builder: (context, state) {
        // Parse query parameters for filtering
        final queryParams = state.uri.queryParameters;
        return const RestaurantListScreen();
      },
    ),
    
    GoRoute(
      path: '/restaurants/:restaurantId',
      builder: (context, state) {
        final restaurantId = state.pathParameters['restaurantId']!;
        final highlightMenuItemId = state.uri.queryParameters['highlight'];
        return RestaurantDetailScreen(
          restaurantId: restaurantId,
          highlightMenuItemId: highlightMenuItemId,
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
    
    GoRoute(
      path: RouteNames.editProfile,
      builder: (context, state) => const Scaffold(
        body: Center(
          child: Text('Edit Profile Screen - Coming Soon'),
        ),
      ),
    ),
    
    GoRoute(
      path: RouteNames.settings,
      builder: (context, state) => const Scaffold(
        body: Center(
          child: Text('Settings Screen - Coming Soon'),
        ),
      ),
    ),
    
    // Language Settings
    GoRoute(
      path: RouteNames.languageSettings,
      builder: (context, state) => const LanguageSettingsScreen(),
    ),
  ],
);

