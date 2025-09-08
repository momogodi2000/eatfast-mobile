import 'package:flutter/material.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../domain/models/restaurant.dart';

/// A bottom sheet for filtering restaurants by various criteria
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
  
  // Filter options
  final List<String> _cuisineTypes = [
    'Cameroonian',
    'African',
    'Fast Food',
    'International',
    'Italian',
    'Asian',
    'Vegetarian',
    'Desserts',
    'Drinks'
  ];

  final List<String> _priceRanges = [r'$', r'$$', r'$$$', r'$$$$'];
  
  @override
  void initState() {
    super.initState();
    _filter = widget.currentFilter ?? const RestaurantFilter();
  }
  
  void _resetFilters() {
    setState(() {
      _filter = const RestaurantFilter();
    });
  }

  void _applyFilters() {
    widget.onApplyFilter(_filter);
    Navigator.pop(context);
  }
  
  // Update filter methods
  void _updateRatingFilter(double value) {
    setState(() {
      _filter = _filter.copyWith(minRating: value);
    });
  }
  
  void _updateDeliveryTimeFilter(double value) {
    setState(() {
      _filter = _filter.copyWith(maxDeliveryTime: value.toInt());
    });
  }
  
  void _updateDeliveryFeeFilter(double value) {
    setState(() {
      _filter = _filter.copyWith(maxDeliveryFee: value);
    });
  }
  
  void _toggleCuisineType(String cuisineType, bool selected) {
    setState(() {
      final currentCuisines = _filter.cuisineTypes?.toList() ?? [];
      
      if (selected && !currentCuisines.contains(cuisineType)) {
        currentCuisines.add(cuisineType);
      } else if (!selected && currentCuisines.contains(cuisineType)) {
        currentCuisines.remove(cuisineType);
      }
      
      _filter = _filter.copyWith(cuisineTypes: currentCuisines.isEmpty ? null : currentCuisines);
    });
  }
  
  void _togglePriceRange(String priceRange, bool selected) {
    setState(() {
      if (selected) {
        _filter = _filter.copyWith(priceRange: priceRange);
      } else if (_filter.priceRange == priceRange) {
        _filter = _filter.copyWith(priceRange: null);
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(DesignTokens.spaceLG),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Filter Restaurants',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          
          const Divider(),
          
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rating Filter
                  _buildSectionHeader('Minimum Rating'),
                  _buildRatingSlider(),
                  
                  SizedBox(height: DesignTokens.spaceLG),
                  
                  // Cuisine Types
                  _buildSectionHeader('Cuisine Types'),
                  _buildCuisineTypesFilter(),
                  
                  SizedBox(height: DesignTokens.spaceLG),
                  
                  // Price Range
                  _buildSectionHeader('Price Range'),
                  _buildPriceRangeFilter(),
                  
                  SizedBox(height: DesignTokens.spaceLG),
                  
                  // Delivery Time
                  _buildSectionHeader('Max Delivery Time (minutes)'),
                  _buildDeliveryTimeSlider(),
                  
                  SizedBox(height: DesignTokens.spaceLG),
                  
                  // Delivery Fee
                  _buildSectionHeader('Max Delivery Fee (FCFA)'),
                  _buildDeliveryFeeSlider(),
                ],
              ),
            ),
          ),
          
          const Divider(),
          
          // Action buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _resetFilters,
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: DesignTokens.spaceMD),
                  ),
                  child: const Text('Reset'),
                ),
              ),
              SizedBox(width: DesignTokens.spaceMD),
              Expanded(
                child: ElevatedButton(
                  onPressed: _applyFilters,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: DesignTokens.spaceMD),
                  ),
                  child: const Text('Apply'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  // UI Builder Methods
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: DesignTokens.spaceSM),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
  
  Widget _buildRatingSlider() {
    return Slider(
      value: _filter.minRating ?? 0,
      min: 0,
      max: 5,
      divisions: 10,
      label: '${_filter.minRating?.toStringAsFixed(1) ?? '0.0'}',
      onChanged: _updateRatingFilter,
    );
  }
  
  Widget _buildDeliveryTimeSlider() {
    return Slider(
      value: _filter.maxDeliveryTime?.toDouble() ?? 60,
      min: 10,
      max: 60,
      divisions: 10,
      label: '${_filter.maxDeliveryTime ?? 60} min',
      onChanged: _updateDeliveryTimeFilter,
    );
  }
  
  Widget _buildDeliveryFeeSlider() {
    return Slider(
      value: _filter.maxDeliveryFee ?? 2000,
      min: 0,
      max: 2000,
      divisions: 10,
      label: '${_filter.maxDeliveryFee?.toInt() ?? 2000} FCFA',
      onChanged: _updateDeliveryFeeFilter,
    );
  }
  
  Widget _buildCuisineTypesFilter() {
    return Wrap(
      spacing: DesignTokens.spaceSM,
      runSpacing: DesignTokens.spaceSM,
      children: _cuisineTypes.map((cuisine) {
        final isSelected = _filter.cuisineTypes?.contains(cuisine) ?? false;
        
        return FilterChip(
          label: Text(cuisine),
          selected: isSelected,
          onSelected: (selected) => _toggleCuisineType(cuisine, selected),
        );
      }).toList(),
    );
  }
  
  Widget _buildPriceRangeFilter() {
    return Wrap(
      spacing: DesignTokens.spaceSM,
      runSpacing: DesignTokens.spaceSM,
      children: _priceRanges.map((priceRange) {
        final isSelected = _filter.priceRange == priceRange;
        
        return FilterChip(
          label: Text(priceRange),
          selected: isSelected,
          onSelected: (selected) => _togglePriceRange(priceRange, selected),
        );
      }).toList(),
    );
  }
}
