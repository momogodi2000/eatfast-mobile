import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/buttons/app_button.dart';
import '../domain/models/restaurant.dart';

class RestaurantFilterSheet extends StatefulWidget {
  final RestaurantFilter? initialFilter;
  final Function(RestaurantFilter) onFilterApplied;

  const RestaurantFilterSheet({
    super.key,
    this.initialFilter,
    required this.onFilterApplied,
  });

  @override
  State<RestaurantFilterSheet> createState() => _RestaurantFilterSheetState();
}

class _RestaurantFilterSheetState extends State<RestaurantFilterSheet> {
  late RestaurantFilter _currentFilter;

  // Filter options
  final List<String> _cuisineTypes = [
    'Cameroonian',
    'African',
    'Fast Food',
    'International',
    'Asian',
    'European',
    'Grilled',
    'Beverages',
    'Desserts',
  ];

  final List<String> _priceRanges = ['\$', '\$\$', '\$\$\$', '\$\$\$\$'];

  final List<int> _deliveryTimes = [15, 30, 45, 60, 90];

  @override
  void initState() {
    super.initState();
    _currentFilter = widget.initialFilter ?? const RestaurantFilter();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.textSecondary.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filter Restaurants',
                  style: AppTextStyles.headlineMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _currentFilter = const RestaurantFilter();
                    });
                  },
                  child: Text(
                    'Clear All',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const Divider(height: 1),
          
          // Filter content
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cuisine Type
                  _buildSectionTitle('Cuisine Type'),
                  const SizedBox(height: 12),
                  _buildCuisineSelector(),
                  
                  const SizedBox(height: 24),
                  
                  // Price Range
                  _buildSectionTitle('Price Range'),
                  const SizedBox(height: 12),
                  _buildPriceRangeSelector(),
                  
                  const SizedBox(height: 24),
                  
                  // Rating
                  _buildSectionTitle('Minimum Rating'),
                  const SizedBox(height: 12),
                  _buildRatingSelector(),
                  
                  const SizedBox(height: 24),
                  
                  // Delivery Time
                  _buildSectionTitle('Maximum Delivery Time'),
                  const SizedBox(height: 12),
                  _buildDeliveryTimeSelector(),
                  
                  const SizedBox(height: 24),
                  
                  // Options
                  _buildSectionTitle('Options'),
                  const SizedBox(height: 12),
                  _buildOptions(),
                  
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          
          // Apply button
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: 'Apply Filters',
                    onPressed: () {
                      widget.onFilterApplied(_currentFilter);
                      Navigator.of(context).pop();
                    },
                    style: AppButtonStyle.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.bodyLarge.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildCuisineSelector() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _cuisineTypes.map((cuisine) {
        final isSelected = _currentFilter.cuisineTypes?.contains(cuisine) ?? false;
        return ChoiceChip(
          label: Text(cuisine),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              final currentCuisines = _currentFilter.cuisineTypes?.toList() ?? [];
              if (selected) {
                currentCuisines.add(cuisine);
              } else {
                currentCuisines.remove(cuisine);
              }
              _currentFilter = _currentFilter.copyWith(cuisineTypes: currentCuisines);
            });
          },
          selectedColor: AppColors.primary.withValues(alpha: 0.2),
          labelStyle: AppTextStyles.bodyMedium.copyWith(
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPriceRangeSelector() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _priceRanges.map((price) {
        final isSelected = _currentFilter.priceRange == price;
        return ChoiceChip(
          label: Text(price),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              _currentFilter = _currentFilter.copyWith(
                priceRange: selected ? price : null,
              );
            });
          },
          selectedColor: AppColors.primary.withValues(alpha: 0.2),
          labelStyle: AppTextStyles.bodyMedium.copyWith(
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildRatingSelector() {
    return Row(
      children: [
        Expanded(
          child: Slider(
            value: _currentFilter.minRating ?? 0.0,
            min: 0.0,
            max: 5.0,
            divisions: 10,
            activeColor: AppColors.primary,
            inactiveColor: AppColors.primary.withValues(alpha: 0.3),
            onChanged: (value) {
              setState(() {
                _currentFilter = _currentFilter.copyWith(
                  minRating: value > 0 ? value : null,
                );
              });
            },
          ),
        ),
        Container(
          width: 60,
          alignment: Alignment.center,
          child: Text(
            _currentFilter.minRating != null 
                ? '${_currentFilter.minRating!.toStringAsFixed(1)}⭐'
                : 'Any',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryTimeSelector() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _deliveryTimes.map((time) {
        final isSelected = _currentFilter.maxDeliveryTime == time;
        return ChoiceChip(
          label: Text('${time}min'),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              _currentFilter = _currentFilter.copyWith(
                maxDeliveryTime: selected ? time : null,
              );
            });
          },
          selectedColor: AppColors.primary.withValues(alpha: 0.2),
          labelStyle: AppTextStyles.bodyMedium.copyWith(
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildOptions() {
    return Column(
      children: [
        // Open Now
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Checkbox(
            value: _currentFilter.isOpen ?? false,
            onChanged: (value) {
              setState(() {
                _currentFilter = _currentFilter.copyWith(
                  isOpen: value,
                );
              });
            },
            activeColor: AppColors.primary,
          ),
          title: Text(
            'Open Now',
            style: AppTextStyles.bodyMedium,
          ),
          subtitle: Text(
            'Show only restaurants that are currently open',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          onTap: () {
            setState(() {
              _currentFilter = _currentFilter.copyWith(
                isOpen: !(_currentFilter.isOpen ?? false),
              );
            });
          },
        ),
        
        // Has Promotion
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Checkbox(
            value: _currentFilter.hasPromotion ?? false,
            onChanged: (value) {
              setState(() {
                _currentFilter = _currentFilter.copyWith(
                  hasPromotion: value,
                );
              });
            },
            activeColor: AppColors.primary,
          ),
          title: Text(
            'Has Promotions',
            style: AppTextStyles.bodyMedium,
          ),
          subtitle: Text(
            'Show only restaurants with active promotions',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          onTap: () {
            setState(() {
              _currentFilter = _currentFilter.copyWith(
                hasPromotion: !(_currentFilter.hasPromotion ?? false),
              );
            });
          },
        ),
      ],
    );
  }
}
