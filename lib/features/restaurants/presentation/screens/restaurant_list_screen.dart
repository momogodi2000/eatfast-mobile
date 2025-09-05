import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/design_tokens.dart';
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
      backgroundColor: DesignTokens.backgroundPrimary,
      appBar: AppBar(
        title: const Text('Restaurants'),
        backgroundColor: DesignTokens.primaryColor,
        foregroundColor: DesignTokens.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _navigateToSearch,
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              color: _currentFilter != null ? DesignTokens.accentColor : DesignTokens.white,
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
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      color: DesignTokens.backgroundSecondary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filtres actifs',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: DesignTokens.textSecondary,
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
          const SizedBox(height: DesignTokens.spaceSM),
          Wrap(
            spacing: DesignTokens.spaceSM,
            runSpacing: DesignTokens.spaceSM,
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
              color: DesignTokens.errorColor.withValues(alpha: 0.5),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            Text(
              'Erreur de chargement',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: DesignTokens.spaceSM),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: DesignTokens.textSecondary,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceLG),
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
                padding: const EdgeInsets.all(DesignTokens.spaceMD),
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: DesignTokens.spaceMD),
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
          const Icon(
            Icons.restaurant_outlined,
            size: 80,
            color: DesignTokens.textTertiary,
          ),
          const SizedBox(height: DesignTokens.spaceLG),
          Text(
            'Aucun restaurant trouvé',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: DesignTokens.textSecondary,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceSM),
          Text(
            'Essayez d\'ajuster vos filtres ou recherchez dans une autre zone',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: DesignTokens.textTertiary,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceLG),
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