import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Theme Mode State
enum AppThemeMode {
  light,
  dark,
  system, // Follow system theme
}

/// Theme State
class ThemeState {
  final AppThemeMode themeMode;
  final ThemeMode effectiveThemeMode;

  const ThemeState({
    required this.themeMode,
    required this.effectiveThemeMode,
  });

  ThemeState copyWith({
    AppThemeMode? themeMode,
    ThemeMode? effectiveThemeMode,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      effectiveThemeMode: effectiveThemeMode ?? this.effectiveThemeMode,
    );
  }
}

/// Theme Notifier
class ThemeNotifier extends StateNotifier<ThemeState> {
  static const String _themeKey = 'app_theme_mode';

  ThemeNotifier()
      : super(const ThemeState(
          themeMode: AppThemeMode.system,
          effectiveThemeMode: ThemeMode.system,
        )) {
    _loadTheme();
  }

  /// Load saved theme preference
  Future<void> _loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeModeString = prefs.getString(_themeKey);

      if (themeModeString != null) {
        final themeMode = AppThemeMode.values.firstWhere(
          (mode) => mode.toString() == themeModeString,
          orElse: () => AppThemeMode.system,
        );
        _updateThemeMode(themeMode);
      }
    } catch (e) {
      debugPrint('Error loading theme: $e');
    }
  }

  /// Save theme preference
  Future<void> _saveTheme(AppThemeMode themeMode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_themeKey, themeMode.toString());
    } catch (e) {
      debugPrint('Error saving theme: $e');
    }
  }

  /// Update theme mode
  void _updateThemeMode(AppThemeMode themeMode) {
    ThemeMode effectiveThemeMode;

    switch (themeMode) {
      case AppThemeMode.light:
        effectiveThemeMode = ThemeMode.light;
        break;
      case AppThemeMode.dark:
        effectiveThemeMode = ThemeMode.dark;
        break;
      case AppThemeMode.system:
        effectiveThemeMode = ThemeMode.system;
        break;
    }

    state = ThemeState(
      themeMode: themeMode,
      effectiveThemeMode: effectiveThemeMode,
    );
  }

  /// Set theme to light mode
  Future<void> setLightTheme() async {
    _updateThemeMode(AppThemeMode.light);
    await _saveTheme(AppThemeMode.light);
  }

  /// Set theme to dark mode
  Future<void> setDarkTheme() async {
    _updateThemeMode(AppThemeMode.dark);
    await _saveTheme(AppThemeMode.dark);
  }

  /// Set theme to system mode (auto-detect)
  Future<void> setSystemTheme() async {
    _updateThemeMode(AppThemeMode.system);
    await _saveTheme(AppThemeMode.system);
  }

  /// Toggle between light and dark (ignores system mode)
  Future<void> toggleTheme() async {
    if (state.themeMode == AppThemeMode.dark) {
      await setLightTheme();
    } else {
      await setDarkTheme();
    }
  }
}

/// Theme Provider
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>((ref) {
  return ThemeNotifier();
});
