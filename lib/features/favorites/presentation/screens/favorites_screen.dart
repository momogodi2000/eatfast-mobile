import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../shared/widgets/buttons/app_button.dart';
import '../../providers/favorites_provider.dart';
import '../../domain/models/favorite.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    
    // Load data when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(favoritesProvider.notifier).loadFavorites();
      ref.read(favoritesProvider.notifier).loadReorderHistory();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesState = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes favoris'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.favorite),
              text: 'Tous',
            ),
            Tab(
              icon: Icon(Icons.restaurant),
              text: 'Restaurants',
            ),
            Tab(
              icon: Icon(Icons.refresh),
              text: 'Recommander',
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher dans vos favoris...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
              onChanged: (value) {
                setState(() => _searchQuery = value);
              },
            ),
          ),

          // Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildAllFavoritesTab(favoritesState),
                _buildRestaurantsTab(favoritesState),
                _buildReorderTab(favoritesState),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllFavoritesTab(FavoritesState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return _buildErrorWidget(state.error!);
    }

    final List<FavoriteItem> displayFavorites = _searchQuery.isEmpty
        ? state.favorites
        : ref.read(favoritesProvider.notifier).searchFavorites(_searchQuery);

    if (displayFavorites.isEmpty) {
      return _searchQuery.isEmpty
          ? _buildEmptyFavoritesWidget()
          : _buildNoSearchResultsWidget();
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: displayFavorites.length,
      itemBuilder: (context, index) {
        return _buildFavoriteCard(displayFavorites[index]);
      },
    );
  }

  Widget _buildRestaurantsTab(FavoritesState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return _buildErrorWidget(state.error!);
    }

    final restaurants = state.favorites
        .where((f) => f.favorite.type == FavoriteType.restaurant)
        .toList();

    final List<FavoriteItem> displayRestaurants = _searchQuery.isEmpty
        ? restaurants
        : restaurants.where((r) => 
            r.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            r.description.toLowerCase().contains(_searchQuery.toLowerCase())
          ).toList();

    if (displayRestaurants.isEmpty) {
      return _searchQuery.isEmpty
          ? _buildEmptyRestaurantsWidget()
          : _buildNoSearchResultsWidget();
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: displayRestaurants.length,
      itemBuilder: (context, index) {
        return _buildRestaurantCard(displayRestaurants[index]);
      },
    );
  }

  Widget _buildReorderTab(FavoritesState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return _buildErrorWidget(state.error!);
    }

    if (state.reorderHistory.isEmpty) {
      return _buildEmptyReorderWidget();
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: state.reorderHistory.length,
      itemBuilder: (context, index) {
        return _buildReorderCard(state.reorderHistory[index]);
      },
    );
  }

  Widget _buildFavoriteCard(FavoriteItem favorite) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _navigateToItem(favorite),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Image
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(favorite.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: favorite.favorite.type == FavoriteType.restaurant
                                ? Colors.blue.withValues(alpha: 0.1)
                                : Colors.orange.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            favorite.favorite.type.displayName,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: favorite.favorite.type == FavoriteType.restaurant
                                  ? Colors.blue
                                  : Colors.orange,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          favorite.timeAgo,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 8),
                    
                    Text(
                      favorite.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 4),
                    
                    Text(
                      favorite.description,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    if (favorite.restaurantName != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        'Chez ${favorite.restaurantName}',
                        style: const TextStyle(
                          color: DesignTokens.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                    
                    const SizedBox(height: 8),
                    
                    Row(
                      children: [
                        if (favorite.rating != null) ...[
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            favorite.formattedRating,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          if (favorite.reviewCount != null)
                            Text(
                              '(${favorite.reviewCount})',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 12,
                              ),
                            ),
                        ],
                        
                        const Spacer(),
                        
                        if (favorite.price != null)
                          Text(
                            favorite.formattedPrice,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(width: 8),
              
              // Actions
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () => _removeFavorite(favorite),
                  ),
                  if (favorite.favorite.type == FavoriteType.item)
                    IconButton(
                      icon: const Icon(
                        Icons.add_shopping_cart,
                        color: DesignTokens.primaryColor,
                      ),
                      onPressed: () => _addToCart(favorite),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurantCard(FavoriteItem restaurant) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _navigateToRestaurant(restaurant),
        borderRadius: BorderRadius.circular(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Restaurant image
            Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                image: DecorationImage(
                  image: AssetImage(restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      onPressed: () => _removeFavorite(restaurant),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(height: 4),
                  
                  Text(
                    restaurant.description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  Row(
                    children: [
                      if (restaurant.rating != null) ...[
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          restaurant.formattedRating,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        if (restaurant.reviewCount != null)
                          Text(
                            '(${restaurant.reviewCount})',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 14,
                            ),
                          ),
                      ],
                      
                      const Spacer(),
                      
                      Text(
                        restaurant.timeAgo,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReorderCard(ReorderItem reorder) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Restaurant image
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(reorder.restaurantImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                
                const SizedBox(width: 16),
                
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reorder.restaurantName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        reorder.itemSummary,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                
                Text(
                  reorder.formattedTotal,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            Row(
              children: [
                Text(
                  'Commandé le ${DateTime.parse(reorder.orderDate).day}/${DateTime.parse(reorder.orderDate).month}/${DateTime.parse(reorder.orderDate).year}',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
                
                const Spacer(),
                
                AppButton(
                  onPressed: ref.watch(favoritesProvider).isSubmitting
                      ? null
                      : () => _reorderItems(reorder),
                  text: 'Recommander',
                  size: AppButtonSize.small,
                  isLoading: ref.watch(favoritesProvider).isSubmitting,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyFavoritesWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Aucun favori pour le moment',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Explorez nos restaurants et plats,\najoutez vos préférés ici!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 24),
          AppButton(
            onPressed: () => context.go('/home'),
            text: 'Découvrir',
            size: AppButtonSize.small,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyRestaurantsWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.restaurant_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Aucun restaurant favori',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Ajoutez vos restaurants préférés\npour les retrouver facilement',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyReorderWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.refresh_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Aucune commande à recommander',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Vos commandes précédentes apparaîtront ici\npour une nouvelle commande rapide',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoSearchResultsWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Aucun résultat trouvé',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Essayez avec d\'autres mots-clés',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red[300],
          ),
          const SizedBox(height: 16),
          Text(
            error,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          AppButton(
            onPressed: () {
              ref.read(favoritesProvider.notifier).loadFavorites();
              ref.read(favoritesProvider.notifier).loadReorderHistory();
            },
            text: 'Réessayer',
            size: AppButtonSize.small,
          ),
        ],
      ),
    );
  }

  void _navigateToItem(FavoriteItem favorite) {
    if (favorite.favorite.type == FavoriteType.restaurant) {
      _navigateToRestaurant(favorite);
    } else {
      // Navigate to item details
      context.push('/items/${favorite.favorite.itemId}');
    }
  }

  void _navigateToRestaurant(FavoriteItem restaurant) {
    context.push('/restaurants/${restaurant.favorite.itemId}');
  }

  Future<void> _removeFavorite(FavoriteItem favorite) async {
    final success = await ref.read(favoritesProvider.notifier)
        .removeFavorite(favorite.favorite.id);
        
    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${favorite.name} retiré des favoris'),
          action: SnackBarAction(
            label: 'Annuler',
            onPressed: () {
              // Re-add to favorites
              ref.read(favoritesProvider.notifier).toggleFavorite(
                itemId: favorite.favorite.itemId,
                type: favorite.favorite.type,
                name: favorite.name,
                description: favorite.description,
                imageUrl: favorite.imageUrl,
                price: favorite.price,
                rating: favorite.rating,
                reviewCount: favorite.reviewCount,
                restaurantName: favorite.restaurantName,
                restaurantId: favorite.restaurantId,
              );
            },
          ),
        ),
      );
    }
  }

  void _addToCart(FavoriteItem favorite) {
    // Add item to cart logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${favorite.name} ajouté au panier'),
        backgroundColor: Colors.green,
      ),
    );
  }

  Future<void> _reorderItems(ReorderItem reorder) async {
    final success = await ref.read(favoritesProvider.notifier)
        .reorderItems(reorder.orderId);
        
    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Articles ajoutés au panier!'),
          backgroundColor: Colors.green,
          action: SnackBarAction(
            label: 'Voir panier',
            onPressed: () => context.push('/cart'),
          ),
        ),
      );
    }
  }
}
