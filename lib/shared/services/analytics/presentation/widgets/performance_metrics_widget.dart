import 'package:flutter/material.dart';
import 'package:eatfast_mobile/shared/models/analytics_data.dart';

class PerformanceMetricsWidget extends StatelessWidget {
  final PerformanceMetrics metrics;

  const PerformanceMetricsWidget({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Métriques de Performance',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildMetricRow(
              context,
              'Taux de livraison',
              '${metrics.orderFulfillmentRate.toStringAsFixed(1)}%',
              Icons.check_circle,
              _getColorForPercentage(metrics.orderFulfillmentRate),
              metrics.orderFulfillmentRate,
            ),
            const SizedBox(height: 12),
            _buildMetricRow(
              context,
              'Temps de livraison moyen',
              '${metrics.averageDeliveryTime.toStringAsFixed(0)} min',
              Icons.schedule,
              _getColorForDeliveryTime(metrics.averageDeliveryTime),
              null,
            ),
            const SizedBox(height: 12),
            _buildMetricRow(
              context,
              'Satisfaction client',
              '${metrics.customerSatisfactionScore.toStringAsFixed(1)}/5',
              Icons.star,
              _getColorForSatisfaction(metrics.customerSatisfactionScore),
              metrics.customerSatisfactionScore * 20,
            ),
            const SizedBox(height: 12),
            _buildMetricRow(
              context,
              'Total livraisons',
              metrics.totalDeliveries.toString(),
              Icons.delivery_dining,
              Colors.blue,
              null,
            ),
            const SizedBox(height: 12),
            _buildMetricRow(
              context,
              'Commandes annulées',
              metrics.cancelledOrders.toString(),
              Icons.cancel,
              Colors.red,
              null,
            ),
            const SizedBox(height: 12),
            _buildMetricRow(
              context,
              'Taux de remboursement',
              '${metrics.refundRate.toStringAsFixed(1)}%',
              Icons.money_off,
              _getColorForPercentage(100 - metrics.refundRate),
              100 - metrics.refundRate,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricRow(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
    double? percentage,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (percentage != null) ...[
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percentage / 100,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 6,
            ),
          ),
        ],
      ],
    );
  }

  Color _getColorForPercentage(double percentage) {
    if (percentage >= 80) return Colors.green;
    if (percentage >= 60) return Colors.orange;
    return Colors.red;
  }

  Color _getColorForDeliveryTime(double minutes) {
    if (minutes <= 30) return Colors.green;
    if (minutes <= 45) return Colors.orange;
    return Colors.red;
  }

  Color _getColorForSatisfaction(double score) {
    if (score >= 4.0) return Colors.green;
    if (score >= 3.0) return Colors.orange;
    return Colors.red;
  }
}
