import 'package:flutter/material.dart';
import 'package:eatfast_mobile/shared/models/analytics_data.dart';

class CustomerInsightsWidget extends StatelessWidget {
  final CustomerInsights insights;

  const CustomerInsightsWidget({super.key, required this.insights});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Insights Clients',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildInsightCard(
                    context,
                    'Nouveaux clients',
                    insights.newCustomers.toString(),
                    Icons.person_add,
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildInsightCard(
                    context,
                    'Clients fidèles',
                    insights.returningCustomers.toString(),
                    Icons.repeat,
                    Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildInsightCard(
                    context,
                    'Taux de rétention',
                    '${insights.customerRetentionRate.toStringAsFixed(1)}%',
                    Icons.trending_up,
                    Colors.orange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildInsightCard(
                    context,
                    'LTV moyenne',
                    '${insights.averageCustomerLifetimeValue.toStringAsFixed(0)} XAF',
                    Icons.monetization_on,
                    Colors.purple,
                  ),
                ),
              ],
            ),
            if (insights.segments.isNotEmpty) ...[
              const SizedBox(height: 20),
              Text(
                'Segments clients',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ...insights.segments.map(
                (segment) => _buildSegmentItem(context, segment),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInsightCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentItem(BuildContext context, CustomerSegment segment) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              segment.name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Expanded(
            child: Text(
              '${segment.count} clients',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
            ),
          ),
          Expanded(
            child: Text(
              '${segment.percentage.toStringAsFixed(1)}%',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
            ),
          ),
          Expanded(
            child: Text(
              '${segment.averageSpending.toStringAsFixed(0)} XAF',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
