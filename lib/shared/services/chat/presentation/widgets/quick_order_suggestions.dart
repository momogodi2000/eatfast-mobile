import 'package:flutter/material.dart';

class QuickOrderSuggestions extends StatelessWidget {
  final Function(String)? onSuggestionTap;

  const QuickOrderSuggestions({
    super.key,
    this.onSuggestionTap,
  });

  @override
  Widget build(BuildContext context) {
    final suggestions = [
      'Recommander un restaurant',
      'Voir mes commandes récentes',
      'Suivre ma commande en cours',
      'Renouveler ma dernière commande',
      'Restaurants près de moi',
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Suggestions rapides',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...suggestions.map((suggestion) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: InkWell(
                onTap: () => onSuggestionTap?.call(suggestion),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(suggestion),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
