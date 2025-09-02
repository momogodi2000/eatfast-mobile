import 'package:flutter/material.dart';

/// Responsive utilities for different screen sizes
class ResponsiveUtils {
  ResponsiveUtils._();

  // Screen breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  /// Check if device is mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  /// Check if device is tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < desktopBreakpoint;
  }

  /// Check if device is desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktopBreakpoint;
  }

  /// Get responsive value based on screen size
  static T getResponsiveValue<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context) && desktop != null) {
      return desktop;
    } else if (isTablet(context) && tablet != null) {
      return tablet;
    } else {
      return mobile;
    }
  }

  /// Get responsive padding
  static EdgeInsets getResponsivePadding(BuildContext context) {
    return EdgeInsets.all(
      getResponsiveValue(
        context,
        mobile: 16.0,
        tablet: 24.0,
        desktop: 32.0,
      ),
    );
  }

  /// Get responsive margin
  static EdgeInsets getResponsiveMargin(BuildContext context) {
    return EdgeInsets.all(
      getResponsiveValue(
        context,
        mobile: 8.0,
        tablet: 12.0,
        desktop: 16.0,
      ),
    );
  }

  /// Get responsive font size
  static double getResponsiveFontSize(
    BuildContext context,
    double baseFontSize,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > desktopBreakpoint) {
      return baseFontSize * 1.2;
    } else if (screenWidth > tabletBreakpoint) {
      return baseFontSize * 1.1;
    }
    return baseFontSize;
  }

  /// Get number of grid columns based on screen size
  static int getGridCrossAxisCount(BuildContext context) {
    return getResponsiveValue(
      context,
      mobile: 2,
      tablet: 3,
      desktop: 4,
    );
  }

  /// Get responsive height
  static double getResponsiveHeight(
    BuildContext context,
    double percentage,
  ) {
    return MediaQuery.of(context).size.height * percentage;
  }

  /// Get responsive width
  static double getResponsiveWidth(
    BuildContext context,
    double percentage,
  ) {
    return MediaQuery.of(context).size.width * percentage;
  }
}

/// Screen type enum
enum ScreenType { mobile, tablet, desktop }

/// Get current screen type
ScreenType getScreenType(BuildContext context) {
  if (ResponsiveUtils.isDesktop(context)) {
    return ScreenType.desktop;
  } else if (ResponsiveUtils.isTablet(context)) {
    return ScreenType.tablet;
  } else {
    return ScreenType.mobile;
  }
}
