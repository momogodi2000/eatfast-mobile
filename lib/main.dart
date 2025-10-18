import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'shared/constants/app_constants.dart';
import 'shared/config/router/app_router.dart';
import 'shared/themes/app_theme.dart';
import 'shared/themes/theme_provider.dart';
import 'shared/l10n/language_provider.dart';
import 'shared/l10n/arb/app_localizations.dart';
import 'shared/services/auth/providers/unified_auth_provider.dart';
import 'core/monitoring/sentry_service.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize monitoring services
  await _initializeMonitoring();

  runApp(
    const ProviderScope(
      child: EatFastApp(),
    ),
  );
}

/// Initialize monitoring and error tracking services
Future<void> _initializeMonitoring() async {
  try {
    // Initialize Sentry
    final sentryService = SentryService();
    await sentryService.initialize(
      dsn: const String.fromEnvironment(
        'SENTRY_DSN',
        defaultValue: '', // Add your Sentry DSN in flutter run --dart-define
      ),
      environment: kReleaseMode ? 'production' : 'development',
      tracesSampleRate: kReleaseMode ? 0.2 : 1.0, // 20% in production, 100% in dev
      profilesSampleRate: kReleaseMode ? 0.2 : 1.0,
    );

    debugPrint('[Main] Monitoring services initialized successfully');
  } catch (e, stackTrace) {
    debugPrint('[Main] Failed to initialize monitoring: $e');
    debugPrint('[Main] Stack trace: $stackTrace');
  }
}

class EatFastApp extends ConsumerWidget {
  const EatFastApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(languageProvider);
    final authState = ref.watch(authProvider);
    final themeState = ref.watch(themeProvider);

    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeState.effectiveThemeMode,
      locale: currentLanguage,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: AppRouter.createRouter(authState),
    );
  }
}

