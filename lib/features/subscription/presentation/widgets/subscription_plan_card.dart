import 'package:flutter/material.dart';
import '../../domain/models/subscription.dart';

class SubscriptionPlanCard extends StatelessWidget {
  final SubscriptionPlan plan;
  final bool isCurrentPlan;
  final bool? isUpgrade;
  final VoidCallback? onSelect;
  final VoidCallback? onSelectPlan;

  const SubscriptionPlanCard({
    super.key,
    required this.plan,
    this.isCurrentPlan = false,
    this.isUpgrade = false,
    this.onSelect,
    this.onSelectPlan,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: plan.isPopular ? 8 : 2,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: plan.isPopular
              ? Border.all(color: Theme.of(context).primaryColor, width: 2)
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (plan.isPopular)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Populaire',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            const SizedBox(height: 8),
            Text(
              plan.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              plan.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  '${plan.price.toStringAsFixed(0)} ${plan.currency}',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('/${plan.billingCycle}'),
              ],
            ),
            const SizedBox(height: 16),
            ...plan.features.map((feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  const Icon(Icons.check, color: Colors.green, size: 16),
                  const SizedBox(width: 8),
                  Expanded(child: Text(feature)),
                ],
              ),
            )),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isCurrentPlan ? null : (onSelect ?? onSelectPlan),
                child: Text(isCurrentPlan ? 'Plan actuel' : 'Sélectionner'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}