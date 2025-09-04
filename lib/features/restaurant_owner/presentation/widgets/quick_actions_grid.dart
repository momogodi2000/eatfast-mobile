import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/design_tokens.dart';

class QuickActionsGrid extends StatelessWidget {
  final String restaurantId;
  
  const QuickActionsGrid({
    super.key,
    required this.restaurantId,
  });

  @override
  Widget build(BuildContext context) {
    final actions = [
      QuickAction(
        title: 'Commandes',
        subtitle: 'Gérer les commandes',
        icon: Icons.receipt_long,
        color: DesignTokens.primaryColor,
        onTap: () => context.push('/restaurant-owner/$restaurantId/orders'),
      ),
      QuickAction(
        title: 'Menu',
        subtitle: 'Modifier le menu',
        icon: Icons.restaurant_menu,
        color: DesignTokens.successColor,
        onTap: () => context.push('/restaurant-owner/$restaurantId/menu'),
      ),
      QuickAction(
        title: 'Analytiques',
        subtitle: 'Voir les stats',
        icon: Icons.analytics,
        color: DesignTokens.infoColor,
        onTap: () => context.push('/restaurant-owner/$restaurantId/analytics'),
      ),
      QuickAction(
        title: 'Paramètres',
        subtitle: 'Configuration',
        icon: Icons.settings,
        color: DesignTokens.warningColor,
        onTap: () => context.push('/restaurant-owner/$restaurantId/settings'),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.2,
        crossAxisSpacing: DesignTokens.spaceMD,
        mainAxisSpacing: DesignTokens.spaceMD,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];
        return QuickActionCard(action: action);
      },
    );
  }
}

class QuickAction {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const QuickAction({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });
}

class QuickActionCard extends StatefulWidget {
  final QuickAction action;

  const QuickActionCard({
    super.key,
    required this.action,
  });

  @override
  State<QuickActionCard> createState() => _QuickActionCardState();
}

class _QuickActionCardState extends State<QuickActionCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _animationController.forward(),
      onTapUp: (_) => _animationController.reverse(),
      onTapCancel: () => _animationController.reverse(),
      onTap: widget.action.onTap,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            padding: const EdgeInsets.all(DesignTokens.spaceMD),
            decoration: BoxDecoration(
              color: DesignTokens.white,
              borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
              boxShadow: [
                BoxShadow(
                  color: DesignTokens.shadowColor.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(DesignTokens.spaceSM),
                  decoration: BoxDecoration(
                    color: widget.action.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                  ),
                  child: Icon(
                    widget.action.icon,
                    color: widget.action.color,
                    size: 24,
                  ),
                ),
                const SizedBox(width: DesignTokens.spaceMD),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.action.title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: DesignTokens.fontWeightSemiBold,
                          color: DesignTokens.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.action.subtitle,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: DesignTokens.textSecondary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: DesignTokens.textTertiary,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}