import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/theme/design_tokens.dart';

/// Custom loading indicators with animations
/// Provides consistent loading states across the app
class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    super.key,
    this.size = AppLoadingSize.medium,
    this.color,
    this.message,
  });

  final AppLoadingSize size;
  final Color? color;
  final String? message;

  @override
  Widget build(BuildContext context) {
    final indicatorSize = _getSizeValue(size);
    final strokeWidth = _getStrokeWidth(size);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: indicatorSize,
          height: indicatorSize,
          child: CircularProgressIndicator(
            strokeWidth: strokeWidth,
            valueColor: AlwaysStoppedAnimation<Color>(
              color ?? DesignTokens.primaryColor,
            ),
          ),
        ),
        if (message != null) ...[
          const SizedBox(height: DesignTokens.spaceMD),
          Text(
            message!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: DesignTokens.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

  double _getSizeValue(AppLoadingSize size) {
    switch (size) {
      case AppLoadingSize.small:
        return 20;
      case AppLoadingSize.medium:
        return 32;
      case AppLoadingSize.large:
        return 48;
    }
  }

  double _getStrokeWidth(AppLoadingSize size) {
    switch (size) {
      case AppLoadingSize.small:
        return 2;
      case AppLoadingSize.medium:
        return 3;
      case AppLoadingSize.large:
        return 4;
    }
  }
}

/// Shimmer loading effect for content placeholders
class AppShimmerLoading extends StatelessWidget {
  const AppShimmerLoading({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
  });

  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? DesignTokens.lightGrey.withValues(alpha: 0.3),
      highlightColor: highlightColor ?? DesignTokens.white.withValues(alpha: 0.8),
      child: child,
    );
  }
}

/// Skeleton loading for cards
class AppSkeletonCard extends StatelessWidget {
  const AppSkeletonCard({
    super.key,
    this.height = 200,
    this.borderRadius,
  });

  final double height;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return AppShimmerLoading(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: DesignTokens.white,
          borderRadius: borderRadius ?? BorderRadius.circular(DesignTokens.radiusMD),
        ),
        child: Column(
          children: [
            // Image placeholder
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: DesignTokens.lightGrey,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                      borderRadius?.topLeft.x ?? DesignTokens.radiusMD,
                    ),
                  ),
                ),
              ),
            ),
            // Content placeholder
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(DesignTokens.spaceMD),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 16,
                      decoration: BoxDecoration(
                        color: DesignTokens.lightGrey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: DesignTokens.spaceXS),
                    Container(
                      height: 12,
                      width: double.infinity * 0.7,
                      decoration: BoxDecoration(
                        color: DesignTokens.lightGrey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: DesignTokens.spaceXS),
                    Container(
                      height: 12,
                      width: double.infinity * 0.5,
                      decoration: BoxDecoration(
                        color: DesignTokens.lightGrey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Skeleton loading for list items
class AppSkeletonListItem extends StatelessWidget {
  const AppSkeletonListItem({
    super.key,
    this.height = 80,
    this.showAvatar = true,
  });

  final double height;
  final bool showAvatar;

  @override
  Widget build(BuildContext context) {
    return AppShimmerLoading(
      child: Container(
        height: height,
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Row(
          children: [
            if (showAvatar) ...[
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: DesignTokens.lightGrey,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: DesignTokens.spaceMD),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 16,
                    decoration: BoxDecoration(
                      color: DesignTokens.lightGrey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: DesignTokens.spaceXS),
                  Container(
                    height: 12,
                    width: double.infinity * 0.6,
                    decoration: BoxDecoration(
                      color: DesignTokens.lightGrey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Loading overlay for full screen loading
class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.message,
    this.backgroundColor,
  });

  final bool isLoading;
  final Widget child;
  final String? message;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: backgroundColor ?? DesignTokens.black.withValues(alpha: 0.5),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(DesignTokens.spaceLG),
                decoration: BoxDecoration(
                  color: DesignTokens.white,
                  borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                ),
                child: AppLoadingIndicator(
                  message: message,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

enum AppLoadingSize {
  small,
  medium,
  large,
}
