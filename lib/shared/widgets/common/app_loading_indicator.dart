import 'package:flutter/material.dart';

/// Loading indicator size options
enum AppLoadingSize { small, medium, large }

/// Reusable loading indicator widget
class AppLoadingIndicator extends StatelessWidget {
  final String? message;
  final AppLoadingSize size;
  final Color? color;

  const AppLoadingIndicator({
    super.key,
    this.message,
    this.size = AppLoadingSize.medium,
    this.color,
  });

  double get _indicatorSize {
    switch (size) {
      case AppLoadingSize.small:
        return 24.0;
      case AppLoadingSize.medium:
        return 40.0;
      case AppLoadingSize.large:
        return 56.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: _indicatorSize,
          height: _indicatorSize,
          child: CircularProgressIndicator(
            strokeWidth: size == AppLoadingSize.small ? 2.0 : 3.0,
            valueColor: AlwaysStoppedAnimation<Color>(
              color ?? Theme.of(context).primaryColor,
            ),
          ),
        ),
        if (message != null) ...[
          const SizedBox(height: 16),
          Text(
            message!,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
