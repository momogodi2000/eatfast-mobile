import 'package:flutter/material.dart';
import '../../domain/models/ai_message.dart';

class SuggestedActionsWidget extends StatelessWidget {
  final List<AiSuggestion> suggestions;
  final Function(AiSuggestion)? onSuggestionTap;

  const SuggestedActionsWidget({
    super.key,
    required this.suggestions,
    this.onSuggestionTap,
  });

  @override
  Widget build(BuildContext context) {
    if (suggestions.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Actions suggérées',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: suggestions.map((suggestion) {
              return ActionChip(
                label: Text(suggestion.text),
                onPressed: () => onSuggestionTap?.call(suggestion),
                backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}