import 'package:flutter/material.dart';

/// Application color scheme for EatFast
class AppColors {
  // Primary colors
  static const Color primary = Color(0xFFFF6B35);
  static const Color primaryLight = Color(0xFFFF8B6B);
  static const Color primaryDark = Color(0xFFE55A2B);

  // Secondary colors
  static const Color secondary = Color(0xFF2D3748);
  static const Color secondaryLight = Color(0xFF4A5568);
  static const Color secondaryDark = Color(0xFF1A202C);

  // Accent colors
  static const Color accent = Color(0xFF38B2AC);
  static const Color accentLight = Color(0xFF68D391);
  static const Color accentDark = Color(0xFF2C7A7B);

  // Background colors
  static const Color background = Color(0xFFF7FAFC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Text colors
  static const Color textPrimary = Color(0xFF1A202C);
  static const Color textSecondary = Color(0xFF718096);
  static const Color textHint = Color(0xFFA0AEC0);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Status colors
  static const Color success = Color(0xFF38A169);
  static const Color warning = Color(0xFFD69E2E);
  static const Color error = Color(0xFFE53E3E);
  static const Color info = Color(0xFF3182CE);

  // Border colors
  static const Color border = Color(0xFFE2E8F0);
  static const Color borderLight = Color(0xFFF7FAFC);
  static const Color divider = Color(0xFFE2E8F0);

  // Shadow colors
  static const Color shadow = Color(0x1A000000);

  // Cameroon specific colors
  static const Color cameroonGreen = Color(0xFF007A33);
  static const Color cameroonRed = Color(0xFFD21034);
  static const Color cameroonYellow = Color(0xFFFFD100);

  // Mobile money colors
  static const Color mtnOrange = Color(0xFFFF6600);
  static const Color orangeMoney = Color(0xFFFF8C00);
  static const Color euMobile = Color(0xFF00AEEF);

  /// Get color from hex string
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Get material color swatch from color
  static MaterialColor getMaterialColor(Color color) {
    final Map<int, Color> shades = {
      50: color.withValues(alpha: 0.1),
      100: color.withValues(alpha: 0.2),
      200: color.withValues(alpha: 0.3),
      300: color.withValues(alpha: 0.4),
      400: color.withValues(alpha: 0.5),
      500: color,
      600: color.withValues(alpha: 0.7),
      700: color.withValues(alpha: 0.8),
      800: color.withValues(alpha: 0.9),
      900: color.withValues(alpha: 1.0),
    };
    return MaterialColor(color.toARGB32(), shades);
  }

  /// Primary material color swatch
  static const MaterialColor primarySwatch = MaterialColor(
    0xFFFF6B35,
    <int, Color>{
      50: Color(0xFFFFF3F0),
      100: Color(0xFFFFE0DA),
      200: Color(0xFFFFCBB8),
      300: Color(0xFFFFB096),
      400: Color(0xFFFF9B7D),
      500: Color(0xFFFF6B35),
      600: Color(0xFFE55A2B),
      700: Color(0xFFCC4921),
      800: Color(0xFFB23817),
      900: Color(0xFF99270D),
    },
  );

  // Convenience getters for common usage
  static Color get onPrimary => textOnPrimary;
  static Color get onBackground => textPrimary;
  static Color get gray => textSecondary;
}
