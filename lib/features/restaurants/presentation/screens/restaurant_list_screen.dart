import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/design_tokens.dart' as app_design_tokens;
import '../../../../shared/widgets/loading/app_loading_indicator.dart';
import '../../domain/models/restaurant.dart';
import '../../providers/restaurant_provider.dart';
import '../widgets/restaurant_card.dart';
import '../widgets/restaurant_filter_bottom_sheet.dart';
import 'restaurant_search_screen.dart';

class RestaurantListScreen extends ConsumerStatefulWidget {
  final RestaurantFilter? filter;

  const RestaurantListScreen({
    super.key,
    this.filter,
  });

  @override
  ConsumerState<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends ConsumerState<RestaurantListScreen> {
  final ScrollController _scrollController = ScrollController();
  RestaurantFilter? _currentFilter;

  @override
  void initState() {
    super.initState();
    _currentFilter = widget.filter;
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      // Load more restaurants when near bottom
      ref.read(restaurantListProvider(_currentFilter).notifier).loadMoreRestaurants();
    }
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => RestaurantFilterBottomSheet(
        currentFilter: _currentFilter,
        onApplyFilter: (filter) {
          setState(() {
            _currentFilter = filter;
          });
        },
      ),
    );
  }

  void _navigateToSearch() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RestaurantSearchScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final restaurantListState = ref.watch(restaurantListProvider(_currentFilter));
    final favoriteRestaurants = ref.watch(favoriteRestaurantsProvider);

    return Scaffold(
      backgroundColor: app_design_tokens.DesignTokens.backgroundPrimary,
      appBar: AppBar(
        title: const Text('Restaurants'),
        backgroundColor: app_design_tokens.DesignTokens.primaryColor,
        foregroundColor: app_design_tokens.DesignTokens.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _navigateToSearch,
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              color: _currentFilter != null ? app_design_tokens.DesignTokens.accentColor : app_design_tokens.DesignTokens.white,
            ),
            onPressed: _showFilterBottomSheet,
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter chips
          if (_currentFilter != null) _buildActiveFilters(),
          
          // Restaurant list
          Expanded(
            child: _buildRestaurantList(restaurantListState, favoriteRestaurants),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveFilters() {
    final activeFilters = <Widget>[];

    if (_currentFilter?.cuisineTypes?.isNotEmpty == true) {
      activeFilters.add(
        Chip(
          label: Text('${_currentFilter!.cuisineTypes!.length} cuisine(s)'),
          onDeleted: () {
            setState(() {
              _currentFilter = _currentFilter?.copyWith(cuisineTypes: []);
            });
          },
        ),
      );
    }

    if (_currentFilter?.priceRange != null) {
      activeFilters.add(
        Chip(
          label: Text(_currentFilter!.priceRange!),
          onDeleted: () {
            setState(() {
              _currentFilter = _currentFilter?.copyWith(priceRange: null);
            });
          },
        ),
      );
    }

    if (_currentFilter?.isOpen == true) {
      activeFilters.add(
        Chip(
          label: const Text('Ouvert maintenant'),
          onDeleted: () {
            setState(() {
              _currentFilter = _currentFilter?.copyWith(isOpen: null);
            });
          },
        ),
      );
    }

    if (activeFilters.isEmpty) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(app_design_tokens.DesignTokens.spaceMD),
      color: app_design_tokens.DesignTokens.backgroundSecondary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filtres actifs',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: app_design_tokens.DesignTokens.textSecondary,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _currentFilter = null;
                  });
                },
                child: const Text('Effacer tout'),
              ),
            ],
          ),
          SizedBox(height: app_design_tokens.DesignTokens.spaceSM),
          Wrap(
            spacing: app_design_tokens.DesignTokens.spaceSM,
            runSpacing: app_design_tokens.DesignTokens.spaceSM,
            children: activeFilters,
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantList(RestaurantListState state, Set<String> favoriteRestaurants) {
    return switch (state) {
      RestaurantListInitial() || RestaurantListLoading() => const AppLoadingIndicator(),
      
      RestaurantListError(:final message) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: app_design_tokens.DesignTokens.errorColor.withValues(alpha: 0.5),
            ),
            SizedBox(height: app_design_tokens.DesignTokens.spaceMD),
            Text(
              'Erreur de chargement',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: app_design_tokens.DesignTokens.spaceSM),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: app_design_tokens.DesignTokens.textSecondary,
              ),
            ),
            SizedBox(height: app_design_tokens.DesignTokens.spaceLG),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(restaurantListProvider(_currentFilter).notifier).loadRestaurants(refresh: true);
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Réessayer'),
            ),
          ],
        ),
      ),
      
      RestaurantListLoaded(:final restaurants) => restaurants.isEmpty
          ? _buildEmptyState()
          : RefreshIndicator(
              onRefresh: () async {
                await ref.read(restaurantListProvider(_currentFilter).notifier).loadRestaurants(refresh: true);
              },
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.all(app_design_tokens.DesignTokens.spaceMD),
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: app_design_tokens.DesignTokens.spaceMD),
                    child: RestaurantCard(
                      restaurant: restaurant,
                      isFavorite: favoriteRestaurants.contains(restaurant.id),
                      onTap: () => _navigateToRestaurantDetail(restaurant.id),
                      onFavoriteToggle: () => _toggleFavorite(restaurant.id),
                    ),
                  );
                },
              ),
            ),
    };
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.restaurant_outlined,
            size: 80,
            color: app_design_tokens.DesignTokens.textTertiary,
          ),
          SizedBox(height: app_design_tokens.DesignTokens.spaceLG),
          Text(
            'Aucun restaurant trouvé',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: app_design_tokens.DesignTokens.textSecondary,
            ),
          ),
          SizedBox(height: app_design_tokens.DesignTokens.spaceSM),
          Text(
            'Essayez d\'ajuster vos filtres ou recherchez dans une autre zone',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: app_design_tokens.DesignTokens.textTertiary,
            ),
          ),
          SizedBox(height: app_design_tokens.DesignTokens.spaceLG),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _currentFilter = null;
              });
            },
            child: const Text('Effacer les filtres'),
          ),
        ],
      ),
    );
  }

  void _navigateToRestaurantDetail(String restaurantId) {
    context.go('${RouteNames.restaurantDetail}/$restaurantId');
  }

  void _toggleFavorite(String restaurantId) {
    ref.read(favoriteRestaurantsProvider.notifier).toggleFavorite(restaurantId);
    
    // Show feedback
    final isFavorite = ref.read(favoriteRestaurantsProvider).contains(restaurantId);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavorite 
            ? 'Restaurant ajouté aux favoris'
            : 'Restaurant retiré des favoris',
        ),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Annuler',
          onPressed: () {
            ref.read(favoriteRestaurantsProvider.notifier).toggleFavorite(restaurantId);
          },
        ),
      ),
    );
  }
}
