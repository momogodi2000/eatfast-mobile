import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../shared/widgets/loading/app_loading_indicator.dart';
import '../../providers/guest_restaurant_provider.dart';
import '../widgets/guest_restaurant_card.dart';

/// Guest Restaurant Discovery Screen
/// Shows nearby restaurants with location-based search for guest users
class GuestRestaurantDiscoveryScreen extends ConsumerStatefulWidget {
  const GuestRestaurantDiscoveryScreen({super.key});

  @override
  ConsumerState<GuestRestaurantDiscoveryScreen> createState() => _GuestRestaurantDiscoveryScreenState();
}

class _GuestRestaurantDiscoveryScreenState extends ConsumerState<GuestRestaurantDiscoveryScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      // Load more restaurants when near bottom
      ref.read(guestRestaurantProvider.notifier).loadMore();
    }
  }

  void _onSearchChanged(String query) {
    // Debounce search
    if (_isSearching) return;
    _isSearching = true;

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted && _searchController.text == query) {
        ref.read(guestRestaurantProvider.notifier).searchRestaurants(query);
      }
      _isSearching = false;
    });
  }

  void _showLocationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Localisation'),
        content: const Text(
          'Activez la localisation pour découvrir les restaurants près de vous et obtenir des recommandations personnalisées.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Plus tard'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(guestRestaurantProvider.notifier).requestLocationAndRefresh();
            },
            child: const Text('Activer'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final restaurantState = ref.watch(guestRestaurantProvider);

    return Scaffold(
      backgroundColor: DesignTokens.backgroundLight,
      appBar: AppBar(
        title: const Text(
          'Découvrir les restaurants',
          style: TextStyle(
            color: DesignTokens.white,
            fontWeight: DesignTokens.fontWeightBold,
          ),
        ),
        backgroundColor: DesignTokens.primaryColor,
        iconTheme: const IconThemeData(color: DesignTokens.white),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => context.go(RouteNames.guestLanding),
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search and Location Section
          Container(
            color: DesignTokens.primaryColor,
            child: Column(
              children: [
                // Search Bar
                Padding(
                  padding: const EdgeInsets.all(DesignTokens.spaceMD),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                    decoration: InputDecoration(
                      hintText: 'Rechercher un restaurant ou un plat...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: DesignTokens.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: DesignTokens.spaceMD,
                        vertical: DesignTokens.spaceSM,
                      ),
                    ),
                  ),
                ),

                // Location Status
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(
                    DesignTokens.spaceMD,
                    0,
                    DesignTokens.spaceMD,
                    DesignTokens.spaceMD,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        restaurantState.hasLocation
                            ? Icons.location_on
                            : Icons.location_off,
                        color: DesignTokens.white,
                        size: DesignTokens.iconSM,
                      ),
                      const SizedBox(width: DesignTokens.spaceSM),
                      Expanded(
                        child: Text(
                          restaurantState.hasLocation
                              ? 'Restaurants près de vous'
                              : 'Tous les restaurants',
                          style: const TextStyle(
                            color: DesignTokens.white,
                            fontSize: DesignTokens.fontSizeSM,
                          ),
                        ),
                      ),
                      if (!restaurantState.hasLocation)
                        TextButton(
                          onPressed: _showLocationDialog,
                          style: TextButton.styleFrom(
                            foregroundColor: DesignTokens.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: DesignTokens.spaceSM,
                            ),
                          ),
                          child: const Text(
                            'Activer',
                            style: TextStyle(
                              fontWeight: DesignTokens.fontWeightSemiBold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Restaurant List
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await ref.read(guestRestaurantProvider.notifier).refresh();
              },
              child: _buildRestaurantList(restaurantState),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantList(GuestRestaurantState state) {
    if (state.isLoading && state.restaurants.isEmpty) {
      return const Center(
        child: AppLoadingIndicator(
          message: 'Recherche des restaurants...',
        ),
      );
    }

    if (state.error != null && state.restaurants.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(DesignTokens.spaceLG),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: DesignTokens.iconXL,
                color: DesignTokens.errorColor,
              ),
              const SizedBox(height: DesignTokens.spaceMD),
              Text(
                'Erreur de chargement',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: DesignTokens.fontWeightBold,
                  color: DesignTokens.textPrimary,
                ),
              ),
              const SizedBox(height: DesignTokens.spaceSM),
              Text(
                state.error!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: DesignTokens.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: DesignTokens.spaceLG),
              ElevatedButton(
                onPressed: () {
                  ref.read(guestRestaurantProvider.notifier).refresh();
                },
                child: const Text('Réessayer'),
              ),
            ],
          ),
        ),
      );
    }

    if (state.restaurants.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(DesignTokens.spaceLG),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.restaurant_outlined,
                size: DesignTokens.iconXL,
                color: DesignTokens.textSecondary,
              ),
              const SizedBox(height: DesignTokens.spaceMD),
              Text(
                'Aucun restaurant trouvé',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: DesignTokens.fontWeightBold,
                  color: DesignTokens.textPrimary,
                ),
              ),
              const SizedBox(height: DesignTokens.spaceSM),
              Text(
                'Essayez de modifier votre recherche ou votre localisation.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: DesignTokens.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      itemCount: state.restaurants.length + (state.hasMoreData ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= state.restaurants.length) {
          // Loading indicator for pagination
          return const Padding(
            padding: EdgeInsets.all(DesignTokens.spaceMD),
            child: Center(
              child: AppLoadingIndicator(
                size: AppLoadingSize.small,
              ),
            ),
          );
        }

        final restaurant = state.restaurants[index];
        final distance = ref.read(guestRestaurantProvider.notifier).getDistanceText(restaurant);

        return Padding(
          padding: const EdgeInsets.only(bottom: DesignTokens.spaceMD),
          child: GuestRestaurantCard(
            restaurant: restaurant,
            distance: distance,
            onTap: () {
              context.go('/restaurants/\${restaurant.id}');
            },
          ),
        );
      },
    );
  }
}