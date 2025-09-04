import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:eatfast_mobile/core/theme/design_tokens.dart';

void main() {
  group('DesignTokens Tests', () {
    test('Color constants are properly defined', () {
      // Primary colors
      expect(DesignTokens.primaryColor, isA<Color>());
      expect(DesignTokens.primaryColorLight, isA<Color>());
      expect(DesignTokens.primaryColorDark, isA<Color>());
      
      // Background colors
      expect(DesignTokens.backgroundPrimary, isA<Color>());
      expect(DesignTokens.backgroundSecondary, isA<Color>());
      expect(DesignTokens.backgroundTertiary, isA<Color>());
      expect(DesignTokens.backgroundGrey, isA<Color>());
      
      // Text colors
      expect(DesignTokens.textPrimary, isA<Color>());
      expect(DesignTokens.textSecondary, isA<Color>());
      expect(DesignTokens.textTertiary, isA<Color>());
      
      // Status colors
      expect(DesignTokens.successColor, isA<Color>());
      expect(DesignTokens.errorColor, isA<Color>());
      expect(DesignTokens.warningColor, isA<Color>());
      expect(DesignTokens.infoColor, isA<Color>());
      
      // Utility colors
      expect(DesignTokens.borderColor, isA<Color>());
      expect(DesignTokens.shadowColor, isA<Color>());
    });

    test('Spacing constants are properly defined', () {
      expect(DesignTokens.spaceXXS, equals(4.0));
      expect(DesignTokens.spaceXS, equals(8.0));
      expect(DesignTokens.spaceSM, equals(12.0));
      expect(DesignTokens.spaceMD, equals(16.0));
      expect(DesignTokens.spaceLG, equals(24.0));
      expect(DesignTokens.spaceXL, equals(32.0));
      expect(DesignTokens.spaceXXL, equals(48.0));
    });

    test('Border radius constants are properly defined', () {
      expect(DesignTokens.radiusXS, equals(4.0));
      expect(DesignTokens.radiusSM, equals(8.0));
      expect(DesignTokens.radiusMD, equals(12.0));
      expect(DesignTokens.radiusLG, equals(16.0));
      expect(DesignTokens.radiusXL, equals(24.0));
      expect(DesignTokens.radiusCircular, equals(50.0));
    });

    test('Typography constants are properly defined', () {
      expect(DesignTokens.fontWeightNormal, equals(FontWeight.w400));
      expect(DesignTokens.fontWeightRegular, equals(FontWeight.w400));
      expect(DesignTokens.fontWeightMedium, equals(FontWeight.w500));
      expect(DesignTokens.fontWeightSemiBold, equals(FontWeight.w600));
      expect(DesignTokens.fontWeightBold, equals(FontWeight.w700));
    });

    test('Icon size constants are properly defined', () {
      expect(DesignTokens.iconXS, equals(16.0));
      expect(DesignTokens.iconSM, equals(20.0));
      expect(DesignTokens.iconMD, equals(24.0));
      expect(DesignTokens.iconLG, equals(32.0));
      expect(DesignTokens.iconXL, equals(48.0));
    });

    test('Animation duration constants are properly defined', () {
      expect(DesignTokens.animationFast, equals(const Duration(milliseconds: 150)));
      expect(DesignTokens.animationNormal, equals(const Duration(milliseconds: 300)));
      expect(DesignTokens.animationSlow, equals(const Duration(milliseconds: 500)));
    });

    test('Color values are valid hex colors', () {
      // Test that primary color is not default black/white
      expect(DesignTokens.primaryColor.value, isNot(equals(Colors.black.value)));
      expect(DesignTokens.primaryColor.value, isNot(equals(Colors.white.value)));
      
      // Test that colors have proper alpha channel (opaque)
      expect(DesignTokens.primaryColor.alpha, equals(255));
      expect(DesignTokens.successColor.alpha, equals(255));
      expect(DesignTokens.errorColor.alpha, equals(255));
    });

    test('Spacing values create proper hierarchy', () {
      expect(DesignTokens.spaceXXS, lessThan(DesignTokens.spaceXS));
      expect(DesignTokens.spaceXS, lessThan(DesignTokens.spaceSM));
      expect(DesignTokens.spaceSM, lessThan(DesignTokens.spaceMD));
      expect(DesignTokens.spaceMD, lessThan(DesignTokens.spaceLG));
      expect(DesignTokens.spaceLG, lessThan(DesignTokens.spaceXL));
      expect(DesignTokens.spaceXL, lessThan(DesignTokens.spaceXXL));
    });

    test('Border radius values create proper hierarchy', () {
      expect(DesignTokens.radiusXS, lessThan(DesignTokens.radiusSM));
      expect(DesignTokens.radiusSM, lessThan(DesignTokens.radiusMD));
      expect(DesignTokens.radiusMD, lessThan(DesignTokens.radiusLG));
      expect(DesignTokens.radiusLG, lessThan(DesignTokens.radiusXL));
    });

    test('Icon size values create proper hierarchy', () {
      expect(DesignTokens.iconXS, lessThan(DesignTokens.iconSM));
      expect(DesignTokens.iconSM, lessThan(DesignTokens.iconMD));
      expect(DesignTokens.iconMD, lessThan(DesignTokens.iconLG));
      expect(DesignTokens.iconLG, lessThan(DesignTokens.iconXL));
    });

    test('Layout constants are reasonable', () {
      expect(DesignTokens.appBarHeight, equals(56.0));
      expect(DesignTokens.bottomNavHeight, equals(60.0));
      expect(DesignTokens.minTouchTargetSize, equals(44.0));
    });

    test('Screen breakpoints are properly ordered', () {
      expect(DesignTokens.mobileBreakpoint, lessThan(DesignTokens.tabletBreakpoint));
      expect(DesignTokens.tabletBreakpoint, lessThan(DesignTokens.desktopBreakpoint));
    });
  });
}
