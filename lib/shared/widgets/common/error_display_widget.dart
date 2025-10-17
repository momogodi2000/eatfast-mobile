import 'package:flutter/material.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';

class ErrorDisplayWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final IconData? icon;

  const ErrorDisplayWidget({
    super.key,
    required this.message,
    this.onRetry,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(DesignTokens.spaceLG),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.error_outline,
              size: DesignTokens.iconXL,
              color: DesignTokens.errorColor,
            ),
            SizedBox(height: DesignTokens.spaceMD),
            Text(
              message,
              style: TextStyle(
                fontSize: DesignTokens.fontSizeMD,
                color: DesignTokens.textPrimary,
                fontWeight: DesignTokens.fontWeightMedium,
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              SizedBox(height: DesignTokens.spaceLG),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: Icon(Icons.refresh),
                label: Text('Try Again'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: DesignTokens.primaryColor,
                  foregroundColor: DesignTokens.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: DesignTokens.spaceLG,
                    vertical: DesignTokens.spaceMD,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
