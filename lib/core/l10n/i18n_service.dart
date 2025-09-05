import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'language_provider.dart';

/// Small i18n service to expose language utilities across the app.
class I18nService {
  I18nService._();

  /// Returns the supported locales used by the app
  static List<Locale> supportedLocales() => LanguageNotifier.supportedLocales;

  /// Programmatically change the app language using a provider reference
  static Future<void> changeLanguage(WidgetRef ref, Locale locale) async {
    await ref.read(languageProvider.notifier).changeLanguage(locale);
  }

  /// Toggle between English and French
  static Future<void> toggle(WidgetRef ref) async {
    await ref.read(languageProvider.notifier).toggleLanguage();
  }
}
