import 'package:flutter/material.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../data/mock/mock_restaurant_data.dart';
import '../../domain/models/restaurant.dart';

class RestaurantFilterBottomSheet extends StatefulWidget {
  final RestaurantFilter? currentFilter;
  final Function(RestaurantFilter?) onApplyFilter;

  const RestaurantFilterBottomSheet({
    super.key,
    this.currentFilter,
    required this.onApplyFilter,
  });

  @override
  State<RestaurantFilterBottomSheet> createState() => _RestaurantFilterBottomSheetState();
}

class _RestaurantFilterBottomSheetState extends State<RestaurantFilterBottomSheet> {
  late RestaurantFilter _filter;

  @override
  void initState() {
    super.initState();
    _filter = widget.currentFilter ?? const RestaurantFilter();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: DesignTokens.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(DesignTokens.radiusXL),
          topRight: Radius.circular(DesignTokens.radiusXL),
        ),
      ),
      child: Column(
        children: [
          // Handle
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(top: DesignTokens.spaceMD),
            decoration: BoxDecoration(
              color: DesignTokens.lightGrey,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          // Header
          Padding(
            padding: const EdgeInsets.all(DesignTokens.spaceLG),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filtres',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: DesignTokens.fontWeightBold,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          
          // Filters content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: DesignTokens.spaceLG),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cuisine types
                  _buildCuisineTypeFilter(),
                  
                  const SizedBox(height: DesignTokens.spaceXL),
                  
                  // Price range
                  _buildPriceRangeFilter(),
                  
                  const SizedBox(height: DesignTokens.spaceXL),
                  
                  // Rating
                  _buildRatingFilter(),
                  
                  const SizedBox(height: DesignTokens.spaceXL),
                  
                  // Delivery time
                  _buildDeliveryTimeFilter(),
                  
                  const SizedBox(height: DesignTokens.spaceXL),
                  
                  // Delivery fee
                  _buildDeliveryFeeFilter(),
                  
                  const SizedBox(height: DesignTokens.spaceXL),
                  
                  // Open now
                  _buildOpenNowFilter(),
                  
                  const SizedBox(height: DesignTokens.spaceXL),
                  
                  // Sort by
                  _buildSortByFilter(),
                ],
              ),
            ),
          ),
          
          // Bottom actions
          Container(
            padding: const EdgeInsets.all(DesignTokens.spaceLG),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: DesignTokens.borderColor),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _clearFilters,
                    child: const Text('Effacer'),
                  ),
                ),
                const SizedBox(width: DesignTokens.spaceMD),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: _applyFilters,
                    child: const Text('Appliquer'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCuisineTypeFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Type de cuisine',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: DesignTokens.fontWeightSemiBold,
          ),
        ),
        const SizedBox(height: DesignTokens.spaceSM),
        Wrap(
          spacing: DesignTokens.spaceSM,
          runSpacing: DesignTokens.spaceSM,
          children: MockRestaurantData.cuisineTypes.map((cuisineType) {
            final isSelected = _filter.cuisineTypes?.contains(cuisineType) ?? false;
            
            return FilterChip(
              label: Text(cuisineType),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  final currentCuisines = List<String>.from(_filter.cuisineTypes ?? []);
                  
                  if (selected) {
                    currentCuisines.add(cuisineType);
                  } else {
                    currentCuisines.remove(cuisineType);
                  }
                  
                  _filter = _filter.copyWith(
                    cuisineTypes: currentCuisines.isEmpty ? null : currentCuisines,
                  );
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPriceRangeFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gamme de prix',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: DesignTokens.fontWeightSemiBold,
          ),
        ),
        const SizedBox(height: DesignTokens.spaceSM),
        Wrap(
          spacing: DesignTokens.spaceSM,
          runSpacing: DesignTokens.spaceSM,
          children: MockRestaurantData.priceRanges.map((priceRange) {
            final isSelected = _filter.priceRange == priceRange;
            
            return ChoiceChip(
              label: Text(priceRange),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _filter = _filter.copyWith(
                    priceRange: selected ? priceRange : null,
                  );
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildRatingFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Note minimum',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: DesignTokens.fontWeightSemiBold,
          ),
        ),
        const SizedBox(height: DesignTokens.spaceSM),
        Slider(
          value: _filter.minRating ?? 0.0,
          min: 0.0,
          max: 5.0,
          divisions: 10,
          label: _filter.minRating?.toStringAsFixed(1) ?? '0.0',
          onChanged: (value) {
            setState(() {
              _filter = _filter.copyWith(minRating: value == 0.0 ? null : value);
            });
          },
        ),
      ],
    );
  }

  Widget _buildDeliveryTimeFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Temps de livraison maximum (minutes)',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: DesignTokens.fontWeightSemiBold,
          ),
        ),
        const SizedBox(height: DesignTokens.spaceSM),
        Slider(
          value: (_filter.maxDeliveryTime ?? 60).toDouble(),
          min: 15.0,
          max: 60.0,
          divisions: 9,
          label: '${_filter.maxDeliveryTime ?? 60} min',
          onChanged: (value) {
            setState(() {
              _filter = _filter.copyWith(maxDeliveryTime: value.toInt());
            });
          },
        ),
      ],
    );
  }

  Widget _buildDeliveryFeeFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Frais de livraison maximum (FCFA)',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: DesignTokens.fontWeightSemiBold,
          ),
        ),
        const SizedBox(height: DesignTokens.spaceSM),
        Slider(
          value: (_filter.maxDeliveryFee ?? 1000).toDouble(),
          min: 0.0,
          max: 1000.0,
          divisions: 10,
          label: '${(_filter.maxDeliveryFee ?? 1000).toInt()} FCFA',
          onChanged: (value) {
            setState(() {
              _filter = _filter.copyWith(maxDeliveryFee: value);
            });
          },
        ),
      ],
    );
  }

  Widget _buildOpenNowFilter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Ouvert maintenant',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: DesignTokens.fontWeightSemiBold,
          ),
        ),
        Switch(
          value: _filter.isOpen ?? false,
          onChanged: (value) {
            setState(() {
              _filter = _filter.copyWith(isOpen: value ? true : null);
            });
          },
        ),
      ],
    );
  }

  Widget _buildSortByFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trier par',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: DesignTokens.fontWeightSemiBold,
          ),
        ),
        const SizedBox(height: DesignTokens.spaceSM),
        ...RestaurantSortBy.values.map((sortBy) {
          return RadioListTile<RestaurantSortBy>(
            title: Text(_getSortByDisplayName(sortBy)),
            value: sortBy,
            groupValue: _filter.sortBy,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _filter = _filter.copyWith(sortBy: value);
                });
              }
            },
            contentPadding: EdgeInsets.zero,
          );
        }),
      ],
    );
  }

  String _getSortByDisplayName(RestaurantSortBy sortBy) {
    switch (sortBy) {
      case RestaurantSortBy.name:
        return 'Nom';
      case RestaurantSortBy.rating:
        return 'Note';
      case RestaurantSortBy.deliveryTime:
        return 'Temps de livraison';
      case RestaurantSortBy.deliveryFee:
        return 'Frais de livraison';
      case RestaurantSortBy.distance:
        return 'Distance';
    }
  }

  void _clearFilters() {
    setState(() {
      _filter = const RestaurantFilter();
    });
  }

  void _applyFilters() {
    widget.onApplyFilter(_hasActiveFilters() ? _filter : null);
    Navigator.pop(context);
  }

  bool _hasActiveFilters() {
    return _filter.cuisineTypes?.isNotEmpty == true ||
           _filter.priceRange != null ||
           _filter.minRating != null ||
           _filter.maxDeliveryTime != 60 ||
           _filter.maxDeliveryFee != 1000.0 ||
           _filter.isOpen == true ||
           _filter.sortBy != RestaurantSortBy.rating;
  }
}