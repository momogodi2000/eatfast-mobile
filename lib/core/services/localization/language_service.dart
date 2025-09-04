import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Supported languages in the app
enum AppLanguage {
  english('en', 'English', 'English'),
  french('fr', 'Français', 'French');

  const AppLanguage(this.code, this.name, this.englishName);
  
  final String code;
  final String name;
  final String englishName;
  
  Locale get locale => Locale(code);
  
  static AppLanguage fromCode(String code) {
    return AppLanguage.values.firstWhere(
      (lang) => lang.code == code,
      orElse: () => AppLanguage.english,
    );
  }
}

/// Language service for managing app locale
class LanguageService {
  static const String _languageKey = 'app_language';
  
  /// Get the saved language from SharedPreferences
  static Future<AppLanguage> getSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_languageKey);
    
    if (languageCode != null) {
      return AppLanguage.fromCode(languageCode);
    }
    
    // Default to device language if available, otherwise English
    final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
    if (deviceLocale.languageCode == 'fr') {
      return AppLanguage.french;
    }
    
    return AppLanguage.english;
  }
  
  /// Save the selected language to SharedPreferences
  static Future<void> saveLanguage(AppLanguage language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, language.code);
  }
  
  /// Get system locale for fallback
  static Locale getSystemLocale() {
    return WidgetsBinding.instance.platformDispatcher.locale;
  }
  
  /// Check if the given locale is supported
  static bool isLocaleSupported(Locale locale) {
    return AppLanguage.values.any((lang) => lang.code == locale.languageCode);
  }
}

/// Language state notifier
class LanguageNotifier extends StateNotifier<AppLanguage> {
  LanguageNotifier() : super(AppLanguage.english) {
    _loadSavedLanguage();
  }
  
  /// Load saved language on initialization
  Future<void> _loadSavedLanguage() async {
    final savedLanguage = await LanguageService.getSavedLanguage();
    state = savedLanguage;
  }
  
  /// Change the app language
  Future<void> changeLanguage(AppLanguage language) async {
    if (state == language) return;
    
    state = language;
    await LanguageService.saveLanguage(language);
  }
  
  /// Toggle between English and French
  Future<void> toggleLanguage() async {
    final newLanguage = state == AppLanguage.english 
        ? AppLanguage.french 
        : AppLanguage.english;
    await changeLanguage(newLanguage);
  }
}

/// Provider for language state
final languageProvider = StateNotifierProvider<LanguageNotifier, AppLanguage>(
  (ref) => LanguageNotifier(),
);

/// Provider for the current locale
final localeProvider = Provider<Locale>((ref) {
  final language = ref.watch(languageProvider);
  return language.locale;
});

/// Provider for checking if current language is French
final isFrenchProvider = Provider<bool>((ref) {
  final language = ref.watch(languageProvider);
  return language == AppLanguage.french;
});

/// Provider for checking if current language is English  
final isEnglishProvider = Provider<bool>((ref) {
  final language = ref.watch(languageProvider);
  return language == AppLanguage.english;
});
