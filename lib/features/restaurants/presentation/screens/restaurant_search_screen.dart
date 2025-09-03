import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../shared/widgets/loading/app_loading_indicator.dart';
import '../../providers/restaurant_provider.dart';
import '../widgets/restaurant_card.dart';

class RestaurantSearchScreen extends ConsumerStatefulWidget {
  const RestaurantSearchScreen({super.key});

  @override
  ConsumerState<RestaurantSearchScreen> createState() => _RestaurantSearchScreenState();
}

class _RestaurantSearchScreenState extends ConsumerState<RestaurantSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    // Debounce search to avoid too many API calls
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_searchController.text == query && query.isNotEmpty) {
        ref.read(restaurantSearchProvider.notifier).searchRestaurants(query);
      }
    });
  }

  void _clearSearch() {
    _searchController.clear();
    ref.read(restaurantSearchProvider.notifier).clearSearch();
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(restaurantSearchProvider);
    final favoriteRestaurants = ref.watch(favoriteRestaurantsProvider);

    return Scaffold(
      backgroundColor: DesignTokens.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: DesignTokens.white,
        foregroundColor: DesignTokens.textPrimary,
        elevation: 1,
        title: _buildSearchField(),
      ),
      body: Column(
        children: [
          // Search suggestions/recent searches
          if (searchState is RestaurantSearchInitial) _buildSearchSuggestions(),
          
          // Search results
          if (searchState is! RestaurantSearchInitial) 
            Expanded(child: _buildSearchResults(searchState, favoriteRestaurants)),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      focusNode: _searchFocusNode,
      decoration: InputDecoration(
        hintText: 'Rechercher restaurants, plats...',
        border: InputBorder.none,
        suffixIcon: _searchController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: _clearSearch,
              )
            : const Icon(Icons.search),
      ),
      onChanged: _onSearchChanged,
      onSubmitted: (query) {
        if (query.isNotEmpty) {
          ref.read(restaurantSearchProvider.notifier).searchRestaurants(query);
        }
      },
    );
  }

  Widget _buildSearchSuggestions() {
    final popularSearches = [
      'Ndolé',
      'Pizza',
      'Burger',
      'Poisson braisé',
      'Fast food',
      'Cuisine traditionnelle',
      'Plats camerounais',
      'Livraison rapide',
    ];

    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(DesignTokens.spaceLG),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Popular searches
            Text(
              'Recherches populaires',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: DesignTokens.fontWeightSemiBold,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            Wrap(
              spacing: DesignTokens.spaceSM,
              runSpacing: DesignTokens.spaceSM,
              children: popularSearches.map((search) {
                return ActionChip(
                  label: Text(search),
                  onPressed: () {
                    _searchController.text = search;
                    ref.read(restaurantSearchProvider.notifier).searchRestaurants(search);
                  },
                );
              }).toList(),
            ),
            
            const SizedBox(height: DesignTokens.spaceXL),
            
            // Search tips
            _buildSearchTips(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchTips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Conseils de recherche',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: DesignTokens.fontWeightSemiBold,
          ),
        ),
        const SizedBox(height: DesignTokens.spaceMD),
        ...{
          'Cherchez par nom de restaurant': 'Ex: "Chez Tante Marie"',
          'Cherchez par type de cuisine': 'Ex: "Italienne", "Camerounaise"',
          'Cherchez par plat': 'Ex: "Pizza", "Ndolé", "Burger"',
          'Utilisez des mots-clés': 'Ex: "Rapide", "Pas cher", "Traditionnel"',
        }.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(bottom: DesignTokens.spaceSM),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  margin: const EdgeInsets.only(top: 8, right: DesignTokens.spaceSM),
                  decoration: const BoxDecoration(
                    color: DesignTokens.primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.key,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: DesignTokens.fontWeightMedium,
                        ),
                      ),
                      Text(
                        entry.value,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: DesignTokens.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildSearchResults(RestaurantSearchState state, Set<String> favoriteRestaurants) {
    return switch (state) {
      RestaurantSearchLoading() => const AppLoadingIndicator(),
      
      RestaurantSearchError(:final message) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: DesignTokens.errorColor.withOpacity(0.5),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            Text(
              'Erreur de recherche',
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
                final query = _searchController.text;
                if (query.isNotEmpty) {
                  ref.read(restaurantSearchProvider.notifier).searchRestaurants(query);
                }
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Réessayer'),
            ),
          ],
        ),
      ),
      
      RestaurantSearchLoaded(:final restaurants) => restaurants.isEmpty
          ? _buildNoResultsState()
          : ListView.builder(
              padding: const EdgeInsets.all(DesignTokens.spaceMD),
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: DesignTokens.spaceMD),
                  child: RestaurantCard(
                    restaurant: restaurant,
                    isFavorite: favoriteRestaurants.contains(restaurant.id),
                    onTap: () => Navigator.pop(context), // Navigate to restaurant detail
                    onFavoriteToggle: () => _toggleFavorite(restaurant.id),
                  ),
                );
              },
            ),
            
      RestaurantSearchInitial() => const SizedBox.shrink(),
    };
  }

  Widget _buildNoResultsState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceLG),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.search_off,
              size: 80,
              color: DesignTokens.textTertiary,
            ),
            const SizedBox(height: DesignTokens.spaceLG),
            Text(
              'Aucun résultat trouvé',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: DesignTokens.textSecondary,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceSM),
            Text(
              'Essayez d\'autres mots-clés ou vérifiez l\'orthographe',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: DesignTokens.textTertiary,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceLG),
            OutlinedButton(
              onPressed: _clearSearch,
              child: const Text('Nouvelle recherche'),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleFavorite(String restaurantId) {
    ref.read(favoriteRestaurantsProvider.notifier).toggleFavorite(restaurantId);
    
    final isFavorite = ref.read(favoriteRestaurantsProvider).contains(restaurantId);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavorite 
            ? 'Restaurant ajouté aux favoris'
            : 'Restaurant retiré des favoris',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}