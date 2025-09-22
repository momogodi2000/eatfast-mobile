import 'package:flutter/material.dart';
import '../../domain/models/subscription.dart';

class SubscriptionBenefitsList extends StatelessWidget {
  final SubscriptionPlan plan;

  const SubscriptionBenefitsList({
    super.key,
    required this.plan,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Avantages de votre plan',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildBenefitItem(
              icon: Icons.shopping_bag,
              title: 'Commandes mensuelles',
              value: '${plan.maxOrders} commandes',
            ),
            _buildBenefitItem(
              icon: Icons.restaurant,
              title: 'Restaurants partenaires',
              value: '${plan.maxRestaurants} restaurants',
            ),
            if (plan.hasAnalytics)
              _buildBenefitItem(
                icon: Icons.analytics,
                title: 'Analytics avancées',
                value: 'Inclus',
              ),
            if (plan.hasPrioritySupport)
              _buildBenefitItem(
                icon: Icons.support_agent,
                title: 'Support prioritaire',
                value: 'Inclus',
              ),
            ...plan.features.map((feature) => _buildBenefitItem(
              icon: Icons.check_circle,
              title: feature,
              value: 'Inclus',
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 12),
          Expanded(
            child: Text(title),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}