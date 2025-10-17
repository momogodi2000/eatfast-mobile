import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:eatfast_mobile/shared/services/analytics/domain/models/analytics_data.dart';

class OrderTrendsChart extends StatelessWidget {
  final List<OrderTrendPoint> trendData;
  final Color primaryColor;

  const OrderTrendsChart({
    super.key,
    required this.trendData,
    this.primaryColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    if (trendData.isEmpty) {
      return const Center(child: Text('Aucune donnée de tendance disponible'));
    }

    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY:
              trendData
                  .map((e) => e.count.toDouble())
                  .reduce((a, b) => a > b ? a : b) *
              1.2,
          titlesData: FlTitlesData(
            show: true,
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(fontSize: 10),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index >= 0 && index < trendData.length) {
                    final date = trendData[index].date;
                    return Text(
                      '${date.day}/${date.month}',
                      style: const TextStyle(fontSize: 10),
                    );
                  }
                  return const Text('');
                },
              ),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey.shade300),
          ),
          gridData: const FlGridData(show: true),
          barGroups: trendData
              .asMap()
              .entries
              .map(
                (entry) => BarChartGroupData(
                  x: entry.key,
                  barRods: [
                    BarChartRodData(
                      toY: entry.value.count.toDouble(),
                      color: primaryColor,
                      width: 16,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
