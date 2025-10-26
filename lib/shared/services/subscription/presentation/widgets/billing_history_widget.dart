import 'package:flutter/material.dart';
import 'package:eatfast_mobile/shared/services/subscription/domain/models/subscription.dart';

class BillingHistoryWidget extends StatelessWidget {
  final List<BillingHistory> billingHistory;

  const BillingHistoryWidget({super.key, required this.billingHistory});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Historique de facturation',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            if (billingHistory.isEmpty)
              const Center(child: Text('Aucun historique de facturation'))
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: billingHistory.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final billing = billingHistory[index];
                  return ListTile(
                    leading: Icon(
                      _getStatusIcon(billing.status),
                      color: _getStatusColor(billing.status),
                    ),
                    title: Text(
                      '${billing.amount.toStringAsFixed(2)} ${billing.currency}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_formatDate(billing.billingDate)),
                    trailing: Chip(
                      label: Text(_getStatusText(billing.status)),
                      backgroundColor: _getStatusColor(
                        billing.status,
                      ).withValues(alpha: 0.1),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  IconData _getStatusIcon(BillingStatus status) {
    switch (status) {
      case BillingStatus.paid:
        return Icons.check_circle;
      case BillingStatus.pending:
        return Icons.access_time;
      case BillingStatus.failed:
        return Icons.error;
      case BillingStatus.refunded:
        return Icons.refresh;
    }
  }

  Color _getStatusColor(BillingStatus status) {
    switch (status) {
      case BillingStatus.paid:
        return Colors.green;
      case BillingStatus.pending:
        return Colors.orange;
      case BillingStatus.failed:
        return Colors.red;
      case BillingStatus.refunded:
        return Colors.blue;
    }
  }

  String _getStatusText(BillingStatus status) {
    switch (status) {
      case BillingStatus.paid:
        return 'Payé';
      case BillingStatus.pending:
        return 'En attente';
      case BillingStatus.failed:
        return 'Échec';
      case BillingStatus.refunded:
        return 'Remboursé';
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
