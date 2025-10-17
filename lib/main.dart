import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'shared/constants/app_constants.dart';
import 'shared/config/router/app_router.dart';
import 'shared/themes/app_theme.dart';
import 'shared/themes/theme_provider.dart';
import 'shared/l10n/language_provider.dart';
import 'shared/l10n/arb/app_localizations.dart';
import 'shared/services/auth/providers/unified_auth_provider.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

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

