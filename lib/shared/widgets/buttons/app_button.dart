import 'package:flutter/material.dart';
import '../../../core/theme/design_tokens.dart';

/// Custom AppButton with loading and disabled states
/// Follows Material Design 3 principles with consistent styling
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.style = AppButtonStyle.primary,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
    this.width,
    this.height,
  });

  final VoidCallback? onPressed;
  final String text;
  final AppButtonStyle style;
  final AppButtonSize size;
  final bool isLoading;
  final bool isEnabled;
  final IconData? icon;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final buttonHeight = height ?? _getHeightForSize(size);
    final fontSize = _getFontSizeForSize(size);
    final padding = _getPaddingForSize(size);

    return SizedBox(
      width: width,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: (isEnabled && !isLoading) ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: _getBackgroundColor(style, context),
          foregroundColor: _getForegroundColor(style, context),
          disabledBackgroundColor: DesignTokens.mediumGrey,
          disabledForegroundColor: DesignTokens.darkGrey,
          elevation: _getElevation(style),
          shadowColor: _getShadowColor(style),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
            side: _getBorderSide(style, context),
          ),
          padding: padding,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isLoading
              ? SizedBox(
                  height: fontSize,
                  width: fontSize,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _getForegroundColor(style, context),
                    ),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      Icon(
                        icon,
                        size: fontSize * 1.2,
                      ),
                      const SizedBox(width: DesignTokens.spaceXS),
                    ],
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: _getFontWeight(style),
                        letterSpacing: 0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  double _getHeightForSize(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.small:
        return 36;
      case AppButtonSize.medium:
        return 48;
      case AppButtonSize.large:
        return 56;
    }
  }

  double _getFontSizeForSize(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.small:
        return DesignTokens.fontSizeSM;
      case AppButtonSize.medium:
        return DesignTokens.fontSizeMD;
      case AppButtonSize.large:
        return DesignTokens.fontSizeLG;
    }
  }

  EdgeInsets _getPaddingForSize(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.small:
        return const EdgeInsets.symmetric(
          horizontal: DesignTokens.spaceMD,
          vertical: DesignTokens.spaceXS,
        );
      case AppButtonSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: DesignTokens.spaceLG,
          vertical: DesignTokens.spaceMD,
        );
      case AppButtonSize.large:
        return const EdgeInsets.symmetric(
          horizontal: DesignTokens.spaceXL,
          vertical: DesignTokens.spaceLG,
        );
    }
  }

  Color _getBackgroundColor(AppButtonStyle style, BuildContext context) {
    switch (style) {
      case AppButtonStyle.primary:
        return DesignTokens.primaryColor;
      case AppButtonStyle.secondary:
        return DesignTokens.secondaryColor;
      case AppButtonStyle.outline:
        return Colors.transparent;
      case AppButtonStyle.text:
        return Colors.transparent;
      case AppButtonStyle.danger:
        return DesignTokens.errorColor;
      case AppButtonStyle.success:
        return DesignTokens.successColor;
    }
  }

  Color _getForegroundColor(AppButtonStyle style, BuildContext context) {
    switch (style) {
      case AppButtonStyle.primary:
      case AppButtonStyle.secondary:
      case AppButtonStyle.danger:
      case AppButtonStyle.success:
        return DesignTokens.white;
      case AppButtonStyle.outline:
      case AppButtonStyle.text:
        return DesignTokens.primaryColor;
    }
  }

  double _getElevation(AppButtonStyle style) {
    switch (style) {
      case AppButtonStyle.primary:
      case AppButtonStyle.secondary:
      case AppButtonStyle.danger:
      case AppButtonStyle.success:
        return DesignTokens.elevation2;
      case AppButtonStyle.outline:
      case AppButtonStyle.text:
        return 0;
    }
  }

  Color _getShadowColor(AppButtonStyle style) {
    switch (style) {
      case AppButtonStyle.primary:
        return DesignTokens.primaryColor.withValues(alpha: 0.3);
      case AppButtonStyle.secondary:
        return DesignTokens.secondaryColor.withValues(alpha: 0.3);
      case AppButtonStyle.danger:
        return DesignTokens.errorColor.withValues(alpha: 0.3);
      case AppButtonStyle.success:
        return DesignTokens.successColor.withValues(alpha: 0.3);
      case AppButtonStyle.outline:
      case AppButtonStyle.text:
        return Colors.transparent;
    }
  }

  BorderSide _getBorderSide(AppButtonStyle style, BuildContext context) {
    switch (style) {
      case AppButtonStyle.outline:
        return const BorderSide(
          color: DesignTokens.primaryColor,
          width: 1.5,
        );
      default:
        return BorderSide.none;
    }
  }

  FontWeight _getFontWeight(AppButtonStyle style) {
    switch (style) {
      case AppButtonStyle.primary:
      case AppButtonStyle.secondary:
      case AppButtonStyle.danger:
      case AppButtonStyle.success:
        return DesignTokens.fontWeightSemiBold;
      case AppButtonStyle.outline:
      case AppButtonStyle.text:
        return DesignTokens.fontWeightMedium;
    }
  }
}

/// Button styles
enum AppButtonStyle {
  primary,
  secondary,
  outline,
  text,
  danger,
  success,
}

/// Button sizes
enum AppButtonSize {
  small,
  medium,
  large,
}
