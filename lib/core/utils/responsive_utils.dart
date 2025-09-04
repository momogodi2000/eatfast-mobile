import 'package:flutter/material.dart';

class ResponsiveUtils {
  // Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;

  // Screen type detection
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpoint;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  // Screen size helpers
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  // Responsive values
  static T responsiveValue<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context) && desktop != null) {
      return desktop;
    } else if (isTablet(context) && tablet != null) {
      return tablet;
    }
    return mobile;
  }

  // Responsive padding
  static EdgeInsets responsivePadding(
    BuildContext context, {
    EdgeInsets? mobile,
    EdgeInsets? tablet,
    EdgeInsets? desktop,
  }) {
    return responsiveValue(
      context,
      mobile: mobile ?? const EdgeInsets.all(16),
      tablet: tablet ?? const EdgeInsets.all(24),
      desktop: desktop ?? const EdgeInsets.all(32),
    );
  }

  // Responsive margin
  static EdgeInsets responsiveMargin(
    BuildContext context, {
    EdgeInsets? mobile,
    EdgeInsets? tablet,
    EdgeInsets? desktop,
  }) {
    return responsiveValue(
      context,
      mobile: mobile ?? const EdgeInsets.all(8),
      tablet: tablet ?? const EdgeInsets.all(12),
      desktop: desktop ?? const EdgeInsets.all(16),
    );
  }

  // Responsive font size
  static double responsiveFontSize(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    return responsiveValue(
      context,
      mobile: mobile,
      tablet: tablet ?? mobile * 1.1,
      desktop: desktop ?? mobile * 1.2,
    );
  }

  // Responsive grid columns
  static int responsiveGridColumns(
    BuildContext context, {
    int? mobile,
    int? tablet,
    int? desktop,
  }) {
    return responsiveValue(
      context,
      mobile: mobile ?? 1,
      tablet: tablet ?? 2,
      desktop: desktop ?? 3,
    );
  }

  // Responsive card width
  static double responsiveCardWidth(BuildContext context) {
    final screenWidth = getScreenWidth(context);
    
    if (isMobile(context)) {
      return screenWidth - 32; // Full width with margins
    } else if (isTablet(context)) {
      return (screenWidth - 64) / 2; // 2 columns
    } else {
      return (screenWidth - 96) / 3; // 3 columns
    }
  }

  // Responsive list view spacing
  static double responsiveListSpacing(BuildContext context) {
    return responsiveValue(
      context,
      mobile: 8.0,
      tablet: 12.0,
      desktop: 16.0,
    );
  }

  // Responsive icon size
  static double responsiveIconSize(
    BuildContext context, {
    double? mobile,
    double? tablet,
    double? desktop,
  }) {
    return responsiveValue(
      context,
      mobile: mobile ?? 24.0,
      tablet: tablet ?? 28.0,
      desktop: desktop ?? 32.0,
    );
  }

  // Safe area padding
  static EdgeInsets safeAreaPadding(BuildContext context) {
    return MediaQuery.of(context).padding;
  }

  // Device pixel ratio
  static double getPixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  // Text scale factor
  static double getTextScaleFactor(BuildContext context) {
    return MediaQuery.of(context).textScaler.scale(1.0);
  }

  // Accessibility text scale
  static double accessibleTextScale(BuildContext context, double fontSize) {
    final textScaleFactor = getTextScaleFactor(context);
    return fontSize * textScaleFactor.clamp(0.8, 1.3); // Limit scaling
  }
}

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceType deviceType) builder;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType;
    
    if (ResponsiveUtils.isMobile(context)) {
      deviceType = DeviceType.mobile;
    } else if (ResponsiveUtils.isTablet(context)) {
      deviceType = DeviceType.tablet;
    } else {
      deviceType = DeviceType.desktop;
    }

    return builder(context, deviceType);
  }
}

enum DeviceType {
  mobile,
  tablet,
  desktop,
}

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, deviceType) {
        switch (deviceType) {
          case DeviceType.mobile:
            return mobile;
          case DeviceType.tablet:
            return tablet ?? mobile;
          case DeviceType.desktop:
            return desktop ?? tablet ?? mobile;
        }
      },
    );
  }
}

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final int? mobileColumns;
  final int? tabletColumns;
  final int? desktopColumns;
  final double? spacing;
  final double? runSpacing;
  final double? childAspectRatio;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.mobileColumns,
    this.tabletColumns,
    this.desktopColumns,
    this.spacing,
    this.runSpacing,
    this.childAspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    final columns = ResponsiveUtils.responsiveGridColumns(
      context,
      mobile: mobileColumns,
      tablet: tabletColumns,
      desktop: desktopColumns,
    );

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: columns,
      crossAxisSpacing: spacing ?? ResponsiveUtils.responsiveListSpacing(context),
      mainAxisSpacing: runSpacing ?? ResponsiveUtils.responsiveListSpacing(context),
      childAspectRatio: childAspectRatio ?? 1.0,
      children: children,
    );
  }
}

class ResponsiveText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? mobileFontSize;
  final double? tabletFontSize;
  final double? desktopFontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const ResponsiveText(
    this.text, {
    super.key,
    this.style,
    this.mobileFontSize,
    this.tabletFontSize,
    this.desktopFontSize,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    double? fontSize;
    
    if (mobileFontSize != null) {
      fontSize = ResponsiveUtils.responsiveFontSize(
        context,
        mobile: mobileFontSize!,
        tablet: tabletFontSize,
        desktop: desktopFontSize,
      );
    }

    return Text(
      text,
      style: style?.copyWith(fontSize: fontSize) ?? TextStyle(fontSize: fontSize),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? mobilePadding;
  final EdgeInsets? tabletPadding;
  final EdgeInsets? desktopPadding;
  final EdgeInsets? mobileMargin;
  final EdgeInsets? tabletMargin;
  final EdgeInsets? desktopMargin;
  final BoxDecoration? decoration;
  final double? width;
  final double? height;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.mobilePadding,
    this.tabletPadding,
    this.desktopPadding,
    this.mobileMargin,
    this.tabletMargin,
    this.desktopMargin,
    this.decoration,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final padding = ResponsiveUtils.responsivePadding(
      context,
      mobile: mobilePadding,
      tablet: tabletPadding,
      desktop: desktopPadding,
    );

    final margin = ResponsiveUtils.responsiveMargin(
      context,
      mobile: mobileMargin,
      tablet: tabletMargin,
      desktop: desktopMargin,
    );

    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration,
      child: child,
    );
  }
}