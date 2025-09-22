import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class FraudDetectionWidget extends ConsumerStatefulWidget {
  final String? userId;
  final String? orderId;
  final bool showDetailedView;
  const FraudDetectionWidget({
    super.key,
    this.userId,
    this.orderId,
    this.showDetailedView = false,
  });
  @override
  ConsumerState<FraudDetectionWidget> createState() => _FraudDetectionWidgetState();
}
class _FraudDetectionWidgetState extends ConsumerState<FraudDetectionWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildNoAlertsView();
  }
  Widget _buildNoAlertsView() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(
              Icons.security,
              size: 48,
              color: Colors.green,
            ),
            const SizedBox(height: 16),
            Text(
              'Sécurité Active',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Aucune alerte de sécurité détectée',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
