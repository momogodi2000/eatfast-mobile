import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/analytics.dart';

class AnalyticsDashboardCard extends ConsumerWidget {
  final AnalyticsCard card;
  final VoidCallback? onTap;

  const AnalyticsDashboardCard({
    super.key,
    required this.card,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          card.title,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                          ),
                        ),
                        if (card.subtitle != null) ...[
                          const SizedBox(height: 2),
                          Text(
                            card.subtitle!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (card.trend != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getTrendColor(card.trend!).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _getTrendIcon(card.trend!),
                            size: 12,
                            color: _getTrendColor(card.trend!),
                          ),
                          if (card.changePercent != null) ...[
                            const SizedBox(width: 4),
                            Text(
                              '${card.changePercent!.abs().toStringAsFixed(1)}%',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: _getTrendColor(card.trend!),
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            _formatValue(card.value, card.unit),
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: _getCardColor(card.type),
                            ),
                          ),
                        ),
                        if (card.period != null) ...[
                          const SizedBox(height: 2),
                          Text(
                            card.period!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (card.historicalData.isNotEmpty)
                    SizedBox(
                      width: 60,
                      height: 30,
                      child: _MiniChart(
                        data: card.historicalData,
                        color: _getCardColor(card.type),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getTrendColor(TrendDirection trend) {
    switch (trend) {
      case TrendDirection.up:
        return Colors.green;
      case TrendDirection.down:
        return Colors.red;
      case TrendDirection.stable:
        return Colors.grey;
    }
  }

  IconData _getTrendIcon(TrendDirection trend) {
    switch (trend) {
      case TrendDirection.up:
        return Icons.trending_up;
      case TrendDirection.down:
        return Icons.trending_down;
      case TrendDirection.stable:
        return Icons.trending_flat;
    }
  }

  Color _getCardColor(CardType type) {
    switch (type) {
      case CardType.metric:
        return Colors.blue;
      case CardType.trend:
        return Colors.green;
      case CardType.comparison:
        return Colors.orange;
      case CardType.gauge:
        return Colors.purple;
    }
  }

  String _formatValue(String value, String? unit) {
    if (unit != null) {
      return '$value $unit';
    }
    return value;
  }
}

class _MiniChart extends StatelessWidget {
  final List<DataPoint> data;
  final Color color;

  const _MiniChart({
    required this.data,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const SizedBox.shrink();
    }

    return CustomPaint(
      painter: _MiniChartPainter(data, color),
      size: const Size(60, 30),
    );
  }
}

class _MiniChartPainter extends CustomPainter {
  final List<DataPoint> data;
  final Color color;

  _MiniChartPainter(this.data, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    if (data.length < 2) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path();
    
    // Find min and max values for scaling
    final values = data.map((point) => point.value).toList();
    final minValue = values.reduce((a, b) => a < b ? a : b);
    final maxValue = values.reduce((a, b) => a > b ? a : b);
    final range = maxValue - minValue;
    
    if (range == 0) return; // All values are the same

    // Create path points
    for (int i = 0; i < data.length; i++) {
      final x = (i / (data.length - 1)) * size.width;
      final normalizedValue = (data[i].value - minValue) / range;
      final y = size.height - (normalizedValue * size.height);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class AnalyticsKPICard extends ConsumerWidget {
  final KPIMetric kpi;
  final VoidCallback? onTap;

  const AnalyticsKPICard({
    super.key,
    required this.kpi,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final targetValue = kpi.targetValue;
    final currentValue = kpi.currentValue;
    final progress = targetValue > 0 ? (currentValue / targetValue) : 0.0;
    final progressClamped = progress.clamp(0.0, 1.0);

    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      kpi.name,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(kpi.status).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _getStatusText(kpi.status),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: _getStatusColor(kpi.status),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    '${currentValue.toStringAsFixed(1)} ${kpi.unit}',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: _getStatusColor(kpi.status),
                    ),
                  ),
                  Text(
                    ' / ${targetValue.toStringAsFixed(1)} ${kpi.unit}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: progressClamped,
                  backgroundColor: Colors.grey.withValues(alpha: 0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _getStatusColor(kpi.status),
                  ),
                  minHeight: 6,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '${(progressClamped * 100).toStringAsFixed(1)}% de l\'objectif',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                  const Spacer(),
                  if (kpi.changePercent != null && kpi.trend != null)
                    Row(
                      children: [
                        Icon(
                          _getTrendIcon(kpi.trend!),
                          size: 12,
                          color: _getTrendColor(kpi.trend!),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '${kpi.changePercent!.abs().toStringAsFixed(1)}%',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: _getTrendColor(kpi.trend!),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(PerformanceStatus? status) {
    switch (status) {
      case PerformanceStatus.excellent:
        return Colors.green;
      case PerformanceStatus.good:
        return Colors.blue;
      case PerformanceStatus.warning:
        return Colors.orange;
      case PerformanceStatus.critical:
        return Colors.red;
      case null:
        return Colors.grey;
    }
  }

  String _getStatusText(PerformanceStatus? status) {
    switch (status) {
      case PerformanceStatus.excellent:
        return 'Excellent';
      case PerformanceStatus.good:
        return 'Bon';
      case PerformanceStatus.warning:
        return 'Attention';
      case PerformanceStatus.critical:
        return 'Critique';
      case null:
        return 'N/A';
    }
  }

  Color _getTrendColor(TrendDirection trend) {
    switch (trend) {
      case TrendDirection.up:
        return Colors.green;
      case TrendDirection.down:
        return Colors.red;
      case TrendDirection.stable:
        return Colors.grey;
    }
  }

  IconData _getTrendIcon(TrendDirection trend) {
    switch (trend) {
      case TrendDirection.up:
        return Icons.trending_up;
      case TrendDirection.down:
        return Icons.trending_down;
      case TrendDirection.stable:
        return Icons.trending_flat;
    }
  }
}