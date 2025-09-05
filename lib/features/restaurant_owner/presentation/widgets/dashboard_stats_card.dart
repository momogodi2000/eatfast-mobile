import 'package:flutter/material.dart';
import '../../../../core/theme/design_tokens.dart';

class DashboardStatsCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String? trend;
  final VoidCallback? onTap;

  const DashboardStatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
    this.trend,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(DesignTokens.spaceSM),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 24,
                  ),
                ),
                if (trend != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: DesignTokens.spaceXS,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: trend!.startsWith('+') 
                          ? DesignTokens.successColor.withValues(alpha: 0.1)
                          : DesignTokens.errorColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(DesignTokens.radiusXS),
                    ),
                    child: Text(
                      trend!,
                      style: TextStyle(
                        color: trend!.startsWith('+') 
                            ? DesignTokens.successColor
                            : DesignTokens.errorColor,
                        fontSize: 12,
                        fontWeight: DesignTokens.fontWeightMedium,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: DesignTokens.fontWeightBold,
                color: DesignTokens.textPrimary,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceXS),
            Text(
              title,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: DesignTokens.textSecondary,
                fontWeight: DesignTokens.fontWeightMedium,
              ),
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: DesignTokens.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}