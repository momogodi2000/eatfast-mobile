import 'package:flutter/material.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../domain/models/restaurant_stats.dart';

class PerformanceChart extends StatelessWidget {
  final List<DailyStats> dailyStats;
  final double height;

  const PerformanceChart({
    super.key,
    required this.dailyStats,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    if (dailyStats.isEmpty) {
      return _buildEmptyState(context);
    }

    return Container(
      height: height,
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
              Text(
                'Performance cette semaine',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: DesignTokens.fontWeightSemiBold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignTokens.spaceXS,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: DesignTokens.successColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusXS),
                ),
                child: const Text(
                  '+15%',
                  style: TextStyle(
                    color: DesignTokens.successColor,
                    fontSize: 12,
                    fontWeight: DesignTokens.fontWeightMedium,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          Expanded(
            child: Row(
              children: [
                // Y-axis labels
                SizedBox(
                  width: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: _buildYAxisLabels(),
                  ),
                ),
                const SizedBox(width: DesignTokens.spaceSM),
                // Chart area
                Expanded(
                  child: CustomPaint(
                    painter: ChartPainter(dailyStats),
                    child: Container(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: DesignTokens.spaceSM),
          // X-axis labels
          Padding(
            padding: const EdgeInsets.only(left: 52),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildXAxisLabels(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      height: height,
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.bar_chart,
              size: 48,
              color: DesignTokens.textTertiary,
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            Text(
              'Données insuffisantes',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: DesignTokens.textSecondary,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceXS),
            Text(
              'Les statistiques apparaîtront ici',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: DesignTokens.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildYAxisLabels() {
    final maxRevenue = dailyStats.isNotEmpty 
        ? dailyStats.map((stat) => stat.revenue).reduce((a, b) => a > b ? a : b)
        : 100.0;
    
    return [
      Text(
        '${(maxRevenue).toStringAsFixed(0)}k',
        style: const TextStyle(
          fontSize: 10,
          color: DesignTokens.textTertiary,
        ),
      ),
      Text(
        '${(maxRevenue * 0.75).toStringAsFixed(0)}k',
        style: const TextStyle(
          fontSize: 10,
          color: DesignTokens.textTertiary,
        ),
      ),
      Text(
        '${(maxRevenue * 0.5).toStringAsFixed(0)}k',
        style: const TextStyle(
          fontSize: 10,
          color: DesignTokens.textTertiary,
        ),
      ),
      Text(
        '${(maxRevenue * 0.25).toStringAsFixed(0)}k',
        style: const TextStyle(
          fontSize: 10,
          color: DesignTokens.textTertiary,
        ),
      ),
      const Text(
        '0',
        style: TextStyle(
          fontSize: 10,
          color: DesignTokens.textTertiary,
        ),
      ),
    ];
  }

  List<Widget> _buildXAxisLabels() {
    final days = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];
    
    return days.map((day) => Text(
      day,
      style: const TextStyle(
        fontSize: 10,
        color: DesignTokens.textTertiary,
      ),
    )).toList();
  }
}

class ChartPainter extends CustomPainter {
  final List<DailyStats> data;

  ChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final gradientPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          DesignTokens.primaryColor.withValues(alpha: 0.3),
          DesignTokens.primaryColor.withValues(alpha: 0.1),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final strokePaint = Paint()
      ..color = DesignTokens.primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Calculate max values for scaling
    final maxRevenue = data.map((stat) => stat.revenue).reduce((a, b) => a > b ? a : b);
    final barWidth = size.width / data.length;

    // Draw bars and line
    final path = Path();
    final fillPath = Path();
    bool isFirstPoint = true;

    for (int i = 0; i < data.length; i++) {
      final stat = data[i];
      final barHeight = (stat.revenue / maxRevenue) * size.height;
      final x = i * barWidth + barWidth / 2;
      final y = size.height - barHeight;

      // Draw bar
      final barRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(
          x - barWidth * 0.3,
          y,
          barWidth * 0.6,
          barHeight,
        ),
        const Radius.circular(4),
      );
      
      canvas.drawRRect(barRect, gradientPaint);

      // Add point to line path
      if (isFirstPoint) {
        path.moveTo(x, y);
        fillPath.moveTo(x, size.height);
        fillPath.lineTo(x, y);
        isFirstPoint = false;
      } else {
        path.lineTo(x, y);
        fillPath.lineTo(x, y);
      }
    }

    // Complete fill path
    if (!isFirstPoint) {
      fillPath.lineTo(size.width, size.height);
      fillPath.close();
    }

    // Draw line
    canvas.drawPath(path, strokePaint);

    // Draw points
    for (int i = 0; i < data.length; i++) {
      final stat = data[i];
      final barHeight = (stat.revenue / maxRevenue) * size.height;
      final x = i * barWidth + barWidth / 2;
      final y = size.height - barHeight;

      canvas.drawCircle(
        Offset(x, y),
        4,
        Paint()..color = DesignTokens.primaryColor,
      );
      canvas.drawCircle(
        Offset(x, y),
        2,
        Paint()..color = DesignTokens.white,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}