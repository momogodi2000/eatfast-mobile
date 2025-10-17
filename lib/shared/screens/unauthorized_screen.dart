import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eatfast_mobile/shared/config/router/route_names.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';

/// Screen displayed when user tries to access a route they don't have permission for
class UnauthorizedScreen extends StatelessWidget {
  const UnauthorizedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accès non autorisé'),
        backgroundColor: DesignTokens.errorColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(RouteNames.home);
            }
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(DesignTokens.spaceLG),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Error Icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: DesignTokens.errorColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lock_outline,
                  size: 64,
                  color: DesignTokens.errorColor,
                ),
              ),

              const SizedBox(height: DesignTokens.spaceXL),

              // Title
              Text(
                'Accès non autorisé',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: DesignTokens.fontWeightBold,
                  color: DesignTokens.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: DesignTokens.spaceMD),

              // Description
              Text(
                'Vous n\'avez pas les permissions nécessaires pour accéder à cette page. Veuillez contacter l\'administrateur si vous pensez que c\'est une erreur.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: DesignTokens.textSecondary,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: DesignTokens.spaceXXL),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Go Back Button
                  ElevatedButton.icon(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go(RouteNames.home);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DesignTokens.primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: DesignTokens.spaceLG,
                        vertical: DesignTokens.spaceMD,
                      ),
                    ),
                    icon: const Icon(Icons.arrow_back, color: DesignTokens.white),
                    label: const Text(
                      'Retour',
                      style: TextStyle(
                        color: DesignTokens.white,
                        fontWeight: DesignTokens.fontWeightSemiBold,
                      ),
                    ),
                  ),

                  const SizedBox(width: DesignTokens.spaceMD),

                  // Home Button
                  OutlinedButton.icon(
                    onPressed: () => context.go(RouteNames.home),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: DesignTokens.primaryColor),
                      padding: const EdgeInsets.symmetric(
                        horizontal: DesignTokens.spaceLG,
                        vertical: DesignTokens.spaceMD,
                      ),
                    ),
                    icon: const Icon(Icons.home, color: DesignTokens.primaryColor),
                    label: const Text(
                      'Accueil',
                      style: TextStyle(
                        color: DesignTokens.primaryColor,
                        fontWeight: DesignTokens.fontWeightSemiBold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: DesignTokens.spaceXL),

              // Contact Support
              TextButton.icon(
                onPressed: () {
                  // Navigate to contact support
                  context.go(RouteNames.contactUs);
                },
                icon: const Icon(Icons.support_agent, size: DesignTokens.iconSM),
                label: const Text('Contacter le support'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
