import 'package:flutter/material.dart';
import 'package:eatfast_mobile/shared/constants/app_constants.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';

/// Custom app bar for guest users with EatFast branding
class GuestAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onLoginPressed;

  const GuestAppBar({
    super.key,
    this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: DesignTokens.primaryColor,
      elevation: 0,
      title: Row(
        children: [
          // App Logo
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: DesignTokens.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                AppConstants.logoAsset,
                width: 20,
                height: 20,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.restaurant,
                    size: 16,
                    color: DesignTokens.primaryColor,
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: DesignTokens.spaceSM),
          // App Name
          Text(
            AppConstants.appName,
            style: const TextStyle(
              color: DesignTokens.white,
              fontSize: DesignTokens.fontSizeLG,
              fontWeight: DesignTokens.fontWeightBold,
            ),
          ),
        ],
      ),
      actions: [
        if (onLoginPressed != null)
          Padding(
            padding: const EdgeInsets.only(right: DesignTokens.spaceMD),
            child: TextButton(
              onPressed: onLoginPressed,
              style: TextButton.styleFrom(
                foregroundColor: DesignTokens.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignTokens.spaceMD,
                  vertical: DesignTokens.spaceSM,
                ),
              ),
              child: const Text(
                'Se connecter',
                style: TextStyle(
                  fontWeight: DesignTokens.fontWeightSemiBold,
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
