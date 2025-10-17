import 'package:flutter/material.dart';

/// Order filter chips widget for filtering orders by status
class OrderFilterChips extends StatelessWidget {
  final List<String> selectedFilters;
  final Function(List<String>) onFiltersChanged;

  const OrderFilterChips({
    super.key,
    required this.selectedFilters,
    required this.onFiltersChanged,
  });

  static const List<String> availableFilters = [
    'Nouveau',
    'Confirmé',
    'En préparation',
    'Prêt',
    'En livraison',
    'Livré',
    'Annulé',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: availableFilters.map((filter) {
          final isSelected = selectedFilters.contains(filter);
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(filter),
              selected: isSelected,
              onSelected: (selected) {
                final newFilters = List<String>.from(selectedFilters);
                if (selected) {
                  newFilters.add(filter);
                } else {
                  newFilters.remove(filter);
                }
                onFiltersChanged(newFilters);
              },
              backgroundColor: Theme.of(context).colorScheme.surface,
              selectedColor: Theme.of(context).colorScheme.primaryContainer,
              checkmarkColor: Theme.of(context).colorScheme.primary,
              labelStyle: TextStyle(
                color: isSelected
                    ? Theme.of(context).colorScheme.onPrimaryContainer
                    : Theme.of(context).colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
