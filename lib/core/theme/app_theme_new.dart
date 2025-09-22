/// EatFast App Theme System - Completely Regenerated
/// Comprehensive theme system with modern Material 3 design
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemeNew {
  AppThemeNew._();

  // Color Palette - EatFast Brand Colors
  static const Color primaryColor = Color(0xFFFF6B35); // Orange/Red
  static const Color primaryVariant = Color(0xFFE55A2B); // Darker orange
  static const Color secondaryColor = Color(0xFF2E7D32); // Green
  static const Color secondaryVariant = Color(0xFF1B5E20); // Darker green

  // Neutral Colors
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color backgroundColor = Color(0xFFF8F9FA);
  static const Color cardColor = Color(0xFFFFFFFF);
  static const Color dividerColor = Color(0xFFE0E0E0);

  // Text Colors
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF212121);
  static const Color onBackground = Color(0xFF212121);

  // Status Colors
  static const Color successColor = Color(0xFF4CAF50);
  static const Color warningColor = Color(0xFFFF9800);
  static const Color errorColor = Color(0xFFF44336);
  static const Color infoColor = Color(0xFF2196F3);

  // Dark Theme Colors
  static const Color darkSurface = Color(0xFF121212);
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkCard = Color(0xFF1E1E1E);
  static const Color darkOnSurface = Color(0xFFE0E0E0);
  static const Color darkOnBackground = Color(0xFFE0E0E0);

  // Text Styles
  static const String primaryFontFamily = 'Roboto';

  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: primaryFontFamily,
    letterSpacing: -1.2,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    fontFamily: primaryFontFamily,
    letterSpacing: -1.0,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: primaryFontFamily,
    letterSpacing: -0.8,
  );

  static const TextStyle heading4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: primaryFontFamily,
    letterSpacing: -0.6,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: primaryFontFamily,
    letterSpacing: 0.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: primaryFontFamily,
    letterSpacing: 0.25,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: primaryFontFamily,
    letterSpacing: 0.4,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: primaryFontFamily,
    letterSpacing: 0.4,
  );

  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: primaryFontFamily,
    letterSpacing: 1.25,
  );

  // Spacing System
  static const double spacing2xs = 4.0;
  static const double spacingXs = 8.0;
  static const double spacingSm = 12.0;
  static const double spacingMd = 16.0;
  static const double spacingLg = 24.0;
  static const double spacingXl = 32.0;
  static const double spacing2xl = 48.0;
  static const double spacing3xl = 64.0;

  // Border Radius
  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  static const double radiusFull = 9999.0;

  // Elevation
  static const double elevation1 = 1.0;
  static const double elevation2 = 2.0;
  static const double elevation4 = 4.0;
  static const double elevation8 = 8.0;
  static const double elevation16 = 16.0;

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        primaryContainer: Color(0xFFFFE8E0),
        secondary: secondaryColor,
        secondaryContainer: Color(0xFFE8F8E8),
        surface: surfaceColor,
        surfaceContainerHighest: backgroundColor,
        error: errorColor,
        onPrimary: onPrimary,
        onSecondary: onSecondary,
        onSurface: onSurface,
        onError: onPrimary,
      ),

      // App Bar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: surfaceColor,
        foregroundColor: onSurface,
        elevation: 0,
        scrolledUnderElevation: elevation1,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: onSurface,
          fontFamily: primaryFontFamily,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),

      // Card Theme - TODO: Fix CardTheme configuration
      // cardTheme: CardTheme(
      //   color: cardColor,
      //   elevation: elevation2,
      //   shadowColor: Colors.black.withValues(alpha: 0.1),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(radiusMd),
      //   ),
      // ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: onPrimary,
          elevation: elevation2,
          padding: const EdgeInsets.symmetric(
            horizontal: spacingLg,
            vertical: spacingMd,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusSm),
          ),
          textStyle: button,
        ),
      ),

      // Text Theme
      textTheme: const TextTheme(
        displayLarge: heading1,
        displayMedium: heading2,
        displaySmall: heading3,
        headlineLarge: heading3,
        headlineMedium: heading4,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
        labelLarge: button,
        labelSmall: caption,
      ),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Color Scheme
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        primaryContainer: Color(0xFF8B2500),
        secondary: secondaryColor,
        secondaryContainer: Color(0xFF0F3F14),
        surface: darkSurface,
        surfaceContainerHighest: darkBackground,
        error: errorColor,
        onPrimary: onPrimary,
        onSecondary: onSecondary,
        onSurface: darkOnSurface,
        onError: onPrimary,
      ),

      // Text Theme
      textTheme: TextTheme(
        displayLarge: heading1.copyWith(color: darkOnSurface),
        displayMedium: heading2.copyWith(color: darkOnSurface),
        displaySmall: heading3.copyWith(color: darkOnSurface),
        headlineLarge: heading3.copyWith(color: darkOnSurface),
        headlineMedium: heading4.copyWith(color: darkOnSurface),
        bodyLarge: bodyLarge.copyWith(color: darkOnSurface),
        bodyMedium: bodyMedium.copyWith(color: darkOnSurface),
        bodySmall: bodySmall.copyWith(color: darkOnSurface),
      ),
    );
  }

  // Utility Methods
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'success':
      case 'completed':
      case 'delivered':
        return successColor;
      case 'warning':
      case 'pending':
      case 'processing':
        return warningColor;
      case 'error':
      case 'failed':
      case 'cancelled':
        return errorColor;
      case 'info':
      case 'preparing':
        return infoColor;
      default:
        return primaryColor;
    }
  }

  static EdgeInsets getScreenPadding() {
    return const EdgeInsets.all(spacingMd);
  }

  static BorderRadius getCardBorderRadius() {
    return BorderRadius.circular(radiusMd);
  }
}