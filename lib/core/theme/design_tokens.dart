import 'package:flutter/material.dart';

/// Design tokens for the EatFast app
/// Contains all design constants including colors, spacing, typography, etc.
class DesignTokens {
  DesignTokens._();

  // Color Palette
  static const Color primaryColor = Color(0xFFFF6B35); // Orange
  static const Color primaryColorLight = Color(0xFFFF8A5C);
  static const Color primaryColorDark = Color(0xFFE55A2B);
  
  static const Color secondaryColor = Color(0xFF4CAF50); // Green
  static const Color secondaryColorLight = Color(0xFF7CB342);
  static const Color secondaryColorDark = Color(0xFF2E7D32);
  
  static const Color accentColor = Color(0xFFFFC107); // Amber
  static const Color errorColor = Color(0xFFE53935);
  static const Color warningColor = Color(0xFFFF9800);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color infoColor = Color(0xFF2196F3);
  
  // Neutral Colors
  static const Color black = Color(0xFF1A1A1A);
  static const Color darkGrey = Color(0xFF4A4A4A);
  static const Color mediumGrey = Color(0xFF9E9E9E);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color white = Color(0xFFFFFFFF);
  
  // Background Colors
  static const Color backgroundPrimary = Color(0xFFFFFFFF);
  static const Color backgroundSecondary = Color(0xFFF8F9FA);
  static const Color backgroundTertiary = Color(0xFFF1F3F4);
  static const Color backgroundGrey = Color(0xFFF5F5F5);
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  
  // Shadow Colors
  static const Color shadowColor = Color(0x1A000000);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textTertiary = Color(0xFF9E9E9E);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  
  // Border Colors
  static const Color borderColor = Color(0xFFE0E0E0);
  
  // Spacing System (8dp grid)
  static const double spaceXXS = 4.0;
  static const double spaceXS = 8.0;
  static const double spaceSM = 12.0;
  static const double spaceMD = 16.0;
  static const double spaceLG = 24.0;
  static const double spaceXL = 32.0;
  static const double spaceXXL = 48.0;
  static const double spaceXXXL = 64.0;
  
  // Border Radius
  static const double radiusXS = 4.0;
  static const double radiusSM = 8.0;
  static const double radiusMD = 12.0;
  static const double radiusLG = 16.0;
  static const double radiusXL = 24.0;
  static const double radiusXXL = 32.0;
  static const double radiusCircular = 50.0;
  
  // Elevation Levels
  static const double elevation0 = 0.0;
  static const double elevation1 = 1.0;
  static const double elevation2 = 2.0;
  static const double elevation3 = 4.0;
  static const double elevation4 = 6.0;
  static const double elevation5 = 8.0;
  static const double elevation6 = 12.0;
  
  // Animation Durations
  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);
  static const Duration animationVerySlow = Duration(milliseconds: 800);
  
  // Typography Sizes
  static const double fontSizeXXS = 10.0;
  static const double fontSizeXS = 12.0;
  static const double fontSizeSM = 14.0;
  static const double fontSizeMD = 16.0;
  static const double fontSizeLG = 18.0;
  static const double fontSizeXL = 20.0;
  static const double fontSizeXXL = 24.0;
  static const double fontSizeXXXL = 32.0;
  
  // Font Weights
  static const FontWeight fontWeightNormal = FontWeight.w400;
  static const FontWeight fontWeightRegular = FontWeight.w400;
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightSemiBold = FontWeight.w600;
  static const FontWeight fontWeightBold = FontWeight.w700;
  
  // Icon Sizes
  static const double iconXS = 16.0;
  static const double iconSM = 20.0;
  static const double iconMD = 24.0;
  static const double iconLG = 32.0;
  static const double iconXL = 48.0;
  
  // Layout Constants
  static const double appBarHeight = 56.0;
  static const double bottomNavHeight = 60.0;
  static const double fabSize = 56.0;
  static const double minTouchTargetSize = 44.0;
  
  // Screen Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;
}
