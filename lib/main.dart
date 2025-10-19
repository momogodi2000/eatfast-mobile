import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'shared/constants/app_constants.dart';
import 'shared/config/router/app_router.dart';
import 'shared/themes/app_theme.dart';
import 'shared/themes/theme_provider.dart';
import 'shared/l10n/language_provider.dart';
import 'shared/l10n/arb/app_localizations.dart';
import 'shared/services/auth/providers/unified_auth_provider.dart';
import 'core/monitoring/firebase_monitoring_service.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize monitoring services
  await _initializeMonitoring();

  runApp(
    const ProviderScope(
      child: EatFastApp(),
    ),
  );
}

/// Initialize Firebase monitoring services
Future<void> _initializeMonitoring() async {
  try {
    final monitoring = FirebaseMonitoringService();
    await monitoring.initialize();

    // Log app open event
    await monitoring.logAppOpen();

    debugPrint('[Main] Firebase monitoring initialized successfully');
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

