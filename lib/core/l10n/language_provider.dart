import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Language provider for managing app language with device detection
class LanguageNotifier extends StateNotifier<Locale> {
  LanguageNotifier() : super(const Locale('fr', '')) {
    _loadLanguage();
  }

  static const String _languageKey = 'selected_language';
  static const String _firstLaunchKey = 'is_first_launch_language';

  /// Load language from storage or detect device language on first launch
  Future<void> _loadLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Check if this is the first launch
      final isFirstLaunch = prefs.getBool(_firstLaunchKey) ?? true;

      if (isFirstLaunch) {
        // Get device language on first launch
        final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
        final deviceLanguageCode = deviceLocale.languageCode;

        // Check if device language is supported
        final supportedCodes = supportedLocales.map((l) => l.languageCode).toList();
        final languageCode = supportedCodes.contains(deviceLanguageCode)
            ? deviceLanguageCode
            : 'fr'; // Default to French if device language not supported

        // Save the detected language
        await prefs.setString(_languageKey, languageCode);
        await prefs.setBool(_firstLaunchKey, false);

        state = Locale(languageCode, '');
      } else {
        // Load saved language preference
        final languageCode = prefs.getString(_languageKey) ?? 'fr';
        state = Locale(languageCode, '');
      }
    } catch (e) {
      // Default to French if loading fails
      state = const Locale('fr', '');
    }
  }

  /// Change language
  Future<void> changeLanguage(Locale locale) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_languageKey, locale.languageCode);
      state = locale;
    } catch (e) {
      // Handle error if needed
    }
  }

  /// Get supported locales
  static const List<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('fr', ''),
  ];

  /// Get language display name
  String getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'fr':
        return 'Français';
      default:
        return 'Français';
    }
  }

  /// Toggle between English and French
  Future<void> toggleLanguage() async {
    final newLocale = state.languageCode == 'en' 
        ? const Locale('fr', '') 
        : const Locale('en', '');
    await changeLanguage(newLocale);
  }

  /// Check if current language is English
  bool get isEnglish => state.languageCode == 'en';

  /// Check if current language is French
  bool get isFrench => state.languageCode == 'fr';
}

/// Provider for language management
final languageProvider = StateNotifierProvider<LanguageNotifier, Locale>(
  (ref) => LanguageNotifier(),
);