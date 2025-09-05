import 'package:flutter/material.dart';
import 'design_tokens.dart';

/// App theme configuration for EatFast app
/// Provides light and dark themes with consistent styling
class AppTheme {
  AppTheme._();

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: DesignTokens.primaryColor,
    scaffoldBackgroundColor: DesignTokens.backgroundPrimary,
    
    // Color Scheme
    colorScheme: const ColorScheme.light(
      primary: DesignTokens.primaryColor,
      primaryContainer: DesignTokens.primaryColorLight,
      secondary: DesignTokens.secondaryColor,
      secondaryContainer: DesignTokens.secondaryColorLight,
      tertiary: DesignTokens.accentColor,
      error: DesignTokens.errorColor,
      surface: DesignTokens.surfaceColor,
      surfaceContainerHighest: DesignTokens.backgroundSecondary,
      onPrimary: DesignTokens.textOnPrimary,
      onSecondary: DesignTokens.textOnPrimary,
      onSurface: DesignTokens.textPrimary,
      onError: DesignTokens.textOnPrimary,
      outline: DesignTokens.mediumGrey,
    ),
    
    // App Bar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: DesignTokens.white,
      foregroundColor: DesignTokens.textPrimary,
      elevation: DesignTokens.elevation1,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: DesignTokens.textPrimary,
        fontSize: DesignTokens.fontSizeLG,
        fontWeight: DesignTokens.fontWeightSemiBold,
      ),
    ),
    
    // Button Themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DesignTokens.primaryColor,
        foregroundColor: DesignTokens.textOnPrimary,
        elevation: DesignTokens.elevation2,
        padding: const EdgeInsets.symmetric(
          horizontal: DesignTokens.spaceLG,
          vertical: DesignTokens.spaceMD,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        ),
        textStyle: const TextStyle(
          fontSize: DesignTokens.fontSizeMD,
          fontWeight: DesignTokens.fontWeightSemiBold,
        ),
      ),
    ),
    
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: DesignTokens.primaryColor,
        side: const BorderSide(
          color: DesignTokens.primaryColor,
          width: 1.5,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: DesignTokens.spaceLG,
          vertical: DesignTokens.spaceMD,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        ),
        textStyle: const TextStyle(
          fontSize: DesignTokens.fontSizeMD,
          fontWeight: DesignTokens.fontWeightSemiBold,
        ),
      ),
    ),
    
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: DesignTokens.primaryColor,
        padding: const EdgeInsets.symmetric(
          horizontal: DesignTokens.spaceMD,
          vertical: DesignTokens.spaceSM,
        ),
        textStyle: const TextStyle(
          fontSize: DesignTokens.fontSizeMD,
          fontWeight: DesignTokens.fontWeightMedium,
        ),
      ),
    ),
    
    // Card Theme
    cardTheme: CardThemeData(
      color: DesignTokens.surfaceColor,
      elevation: DesignTokens.elevation2,
      shadowColor: DesignTokens.black.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      margin: const EdgeInsets.all(DesignTokens.spaceXS),
    ),
    
    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: DesignTokens.backgroundSecondary,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: DesignTokens.spaceMD,
        vertical: DesignTokens.spaceMD,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        borderSide: const BorderSide(color: DesignTokens.mediumGrey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        borderSide: const BorderSide(color: DesignTokens.lightGrey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        borderSide: const BorderSide(
          color: DesignTokens.primaryColor,
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        borderSide: const BorderSide(color: DesignTokens.errorColor),
      ),
      hintStyle: const TextStyle(
        color: DesignTokens.textTertiary,
        fontSize: DesignTokens.fontSizeMD,
      ),
      labelStyle: const TextStyle(
        color: DesignTokens.textSecondary,
        fontSize: DesignTokens.fontSizeMD,
      ),
    ),
    
    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: DesignTokens.white,
      selectedItemColor: DesignTokens.primaryColor,
      unselectedItemColor: DesignTokens.mediumGrey,
      type: BottomNavigationBarType.fixed,
      elevation: DesignTokens.elevation3,
    ),
    
    // Typography Theme
    textTheme: _buildTextTheme(),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: DesignTokens.primaryColor,
    scaffoldBackgroundColor: const Color(0xFF121212),
    
    // Color Scheme for Dark Theme
    colorScheme: const ColorScheme.dark(
      primary: DesignTokens.primaryColor,
      primaryContainer: DesignTokens.primaryColorDark,
      secondary: DesignTokens.secondaryColor,
      secondaryContainer: DesignTokens.secondaryColorDark,
      tertiary: DesignTokens.accentColor,
      error: DesignTokens.errorColor,
      surface: Color(0xFF1E1E1E),
      surfaceContainerHighest: Color(0xFF2C2C2C),
      onPrimary: DesignTokens.textOnPrimary,
      onSecondary: DesignTokens.textOnPrimary,
      onSurface: DesignTokens.white,
      onError: DesignTokens.textOnPrimary,
      outline: DesignTokens.mediumGrey,
    ),
    
    // Typography Theme for Dark
    textTheme: _buildTextTheme(isDark: true),
  );

  // Text Theme Builder
  static TextTheme _buildTextTheme({bool isDark = false}) {
    final Color textColor = isDark ? DesignTokens.white : DesignTokens.textPrimary;
    final Color secondaryTextColor = isDark 
        ? DesignTokens.lightGrey 
        : DesignTokens.textSecondary;

    return TextTheme(
      displayLarge: TextStyle(
        fontSize: DesignTokens.fontSizeXXXL,
        fontWeight: DesignTokens.fontWeightBold,
        color: textColor,
        letterSpacing: -0.5,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: DesignTokens.fontWeightBold,
        color: textColor,
        letterSpacing: -0.25,
      ),
      displaySmall: TextStyle(
        fontSize: DesignTokens.fontSizeXXL,
        fontWeight: DesignTokens.fontWeightSemiBold,
        color: textColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: DesignTokens.fontWeightSemiBold,
        color: textColor,
      ),
      headlineMedium: TextStyle(
        fontSize: DesignTokens.fontSizeXL,
        fontWeight: DesignTokens.fontWeightSemiBold,
        color: textColor,
      ),
      headlineSmall: TextStyle(
        fontSize: DesignTokens.fontSizeLG,
        fontWeight: DesignTokens.fontWeightMedium,
        color: textColor,
      ),
      titleLarge: TextStyle(
        fontSize: DesignTokens.fontSizeLG,
        fontWeight: DesignTokens.fontWeightSemiBold,
        color: textColor,
      ),
      titleMedium: TextStyle(
        fontSize: DesignTokens.fontSizeMD,
        fontWeight: DesignTokens.fontWeightMedium,
        color: textColor,
      ),
      titleSmall: TextStyle(
        fontSize: DesignTokens.fontSizeSM,
        fontWeight: DesignTokens.fontWeightMedium,
        color: secondaryTextColor,
      ),
      bodyLarge: TextStyle(
        fontSize: DesignTokens.fontSizeMD,
        fontWeight: DesignTokens.fontWeightRegular,
        color: textColor,
      ),
      bodyMedium: TextStyle(
        fontSize: DesignTokens.fontSizeSM,
        fontWeight: DesignTokens.fontWeightRegular,
        color: textColor,
      ),
      bodySmall: TextStyle(
        fontSize: DesignTokens.fontSizeXS,
        fontWeight: DesignTokens.fontWeightRegular,
        color: secondaryTextColor,
      ),
      labelLarge: TextStyle(
        fontSize: DesignTokens.fontSizeSM,
        fontWeight: DesignTokens.fontWeightSemiBold,
        color: textColor,
      ),
      labelMedium: TextStyle(
        fontSize: DesignTokens.fontSizeXS,
        fontWeight: DesignTokens.fontWeightMedium,
        color: secondaryTextColor,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: DesignTokens.fontWeightRegular,
        color: secondaryTextColor,
      ),
    );
  }
}
