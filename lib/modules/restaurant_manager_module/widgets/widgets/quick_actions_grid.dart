import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';

class QuickActionsGrid extends StatelessWidget {
  final String restaurantId;

  const QuickActionsGrid({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        _QuickActionItem(
          icon: Icons.restaurant_menu,
          title: 'Gérer Menu',
          subtitle: 'Ajouter/Modifier items',
          color: DesignTokens.primaryColor,
          onTap: () => context.push('/restaurant-owner/$restaurantId/menu'),
        ),
        _QuickActionItem(
          icon: Icons.shopping_cart,
          title: 'Commandes',
          subtitle: 'Voir les commandes',
          color: Colors.orange,
          onTap: () => context.push('/restaurant-owner/$restaurantId/orders'),
        ),
        _QuickActionItem(
          icon: Icons.analytics,
          title: 'Rapports',
          subtitle: 'Voir les statistiques',
          color: Colors.green,
          onTap: () =>
              context.push('/restaurant-owner/$restaurantId/analytics'),
        ),
        _QuickActionItem(
          icon: Icons.settings,
          title: 'Paramètres',
          subtitle: 'Configurer restaurant',
          color: Colors.blue,
          onTap: () => context.push('/restaurant-owner/$restaurantId/settings'),
        ),
      ],
    );
  }
}

class _QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 32, color: color),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: DesignTokens.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
