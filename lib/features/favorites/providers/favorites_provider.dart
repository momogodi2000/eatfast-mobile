import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/favorite.dart';

class FavoritesState {
  final List<FavoriteItem> favorites;
  final List<ReorderItem> reorderHistory;
  final Map<String, bool> favoriteStatus; // itemId -> isFavorite
  final bool isLoading;
  final String? error;
  final bool isSubmitting;

  const FavoritesState({
    this.favorites = const [],
    this.reorderHistory = const [],
    this.favoriteStatus = const {},
    this.isLoading = false,
    this.error,
    this.isSubmitting = false,
  });

  FavoritesState copyWith({
    List<FavoriteItem>? favorites,
    List<ReorderItem>? reorderHistory,
    Map<String, bool>? favoriteStatus,
    bool? isLoading,
    String? error,
    bool? isSubmitting,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
      reorderHistory: reorderHistory ?? this.reorderHistory,
      favoriteStatus: favoriteStatus ?? this.favoriteStatus,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}

class FavoritesNotifier extends StateNotifier<FavoritesState> {
  FavoritesNotifier() : super(const FavoritesState());

  // Mock data
  final List<FavoriteItem> _mockFavorites = [
    FavoriteItem(
      favorite: Favorite(
        id: '1',
        userId: 'user1',
        itemId: 'restaurant1',
        type: FavoriteType.restaurant,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      name: 'Chez Tante Marie',
      description: 'Cuisine camerounaise authentique',
      imageUrl: 'assets/images/restaurant1.jpg',
      rating: 4.5,
      reviewCount: 125,
      isAvailable: true,
    ),
    FavoriteItem(
      favorite: Favorite(
        id: '2',
        userId: 'user1',
        itemId: 'item1',
        type: FavoriteType.item,
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      name: 'Poulet DG',
      description: 'Poulet aux légumes, plantain et riz',
      imageUrl: 'assets/images/poulet_dg.jpg',
      price: 2500,
      rating: 4.8,
      reviewCount: 89,
      isAvailable: true,
      restaurantName: 'Chez Tante Marie',
      restaurantId: 'restaurant1',
    ),
    FavoriteItem(
      favorite: Favorite(
        id: '3',
        userId: 'user1',
        itemId: 'item2',
        type: FavoriteType.item,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      name: 'Ndolé aux crevettes',
      description: 'Plat traditionnel aux épinards et crevettes',
      imageUrl: 'assets/images/ndole.jpg',
      price: 3000,
      rating: 4.7,
      reviewCount: 67,
      isAvailable: true,
      restaurantName: 'Restaurant du Centre',
      restaurantId: 'restaurant2',
    ),
  ];

  final List<ReorderItem> _mockReorderHistory = [
    ReorderItem(
      orderId: 'order123',
      orderDate: DateTime.now().subtract(const Duration(days: 3)).toIso8601String(),
      items: [
        const OrderItemData(
          id: 'item1',
          name: 'Poulet DG',
          image: 'assets/images/poulet_dg.jpg',
          price: 2500,
          quantity: 1,
          customizations: ['Sans piment', 'Riz supplément'],
        ),
        const OrderItemData(
          id: 'item3',
          name: 'Beignets haricots',
          image: 'assets/images/beignets_haricots.jpg',
          price: 500,
          quantity: 3,
        ),
      ],
      restaurantId: 'restaurant1',
      restaurantName: 'Chez Tante Marie',
      restaurantImage: 'assets/images/restaurant1.jpg',
      totalAmount: 4000,
      itemCount: 2,
    ),
    ReorderItem(
      orderId: 'order124',
      orderDate: DateTime.now().subtract(const Duration(days: 7)).toIso8601String(),
      items: [
        const OrderItemData(
          id: 'item2',
          name: 'Ndolé aux crevettes',
          image: 'assets/images/ndole.jpg',
          price: 3000,
          quantity: 2,
          customizations: ['Niveau piment: Moyen'],
        ),
      ],
      restaurantId: 'restaurant2',
      restaurantName: 'Restaurant du Centre',
      restaurantImage: 'assets/images/restaurant2.jpg',
      totalAmount: 6500,
      itemCount: 1,
    ),
  ];

  Future<void> loadFavorites() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await Future.delayed(const Duration(milliseconds: 800));

      // Update favorite status map
      final favoriteStatus = <String, bool>{};
      for (final favorite in _mockFavorites) {
        favoriteStatus[favorite.favorite.itemId] = true;
      }

      state = state.copyWith(
        favorites: _mockFavorites,
        favoriteStatus: favoriteStatus,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Erreur lors du chargement des favoris: $e',
      );
    }
  }

  Future<void> loadReorderHistory() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await Future.delayed(const Duration(milliseconds: 600));

      state = state.copyWith(
        reorderHistory: _mockReorderHistory,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Erreur lors du chargement de l\'historique: $e',
      );
    }
  }

  Future<bool> toggleFavorite({
    required String itemId,
    required FavoriteType type,
    required String name,
    required String description,
    required String imageUrl,
    double? price,
    double? rating,
    int? reviewCount,
    String? restaurantName,
    String? restaurantId,
  }) async {
    state = state.copyWith(isSubmitting: true, error: null);

    try {
      await Future.delayed(const Duration(milliseconds: 500));

      final isFavorite = state.favoriteStatus[itemId] ?? false;
      final updatedStatus = Map<String, bool>.from(state.favoriteStatus);
      
      if (isFavorite) {
        // Remove from favorites
        _mockFavorites.removeWhere((f) => f.favorite.itemId == itemId);
        updatedStatus[itemId] = false;
        
        state = state.copyWith(
          favorites: _mockFavorites,
          favoriteStatus: updatedStatus,
          isSubmitting: false,
        );
      } else {
        // Add to favorites
        final newFavorite = FavoriteItem(
          favorite: Favorite(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            userId: 'current_user', // Get from auth
            itemId: itemId,
            type: type,
            createdAt: DateTime.now(),
          ),
          name: name,
          description: description,
          imageUrl: imageUrl,
          price: price,
          rating: rating,
          reviewCount: reviewCount,
          isAvailable: true,
          restaurantName: restaurantName,
          restaurantId: restaurantId,
        );

        _mockFavorites.insert(0, newFavorite);
        updatedStatus[itemId] = true;
        
        state = state.copyWith(
          favorites: _mockFavorites,
          favoriteStatus: updatedStatus,
          isSubmitting: false,
        );
      }

      return true;
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: 'Erreur lors de la mise à jour des favoris: $e',
      );
      return false;
    }
  }

  Future<bool> removeFavorite(String favoriteId) async {
    state = state.copyWith(isSubmitting: true, error: null);

    try {
      await Future.delayed(const Duration(milliseconds: 300));

      final favoriteIndex = _mockFavorites.indexWhere((f) => f.favorite.id == favoriteId);
      if (favoriteIndex == -1) {
        throw Exception('Favori introuvable');
      }

      final removedFavorite = _mockFavorites[favoriteIndex];
      _mockFavorites.removeAt(favoriteIndex);

      final updatedStatus = Map<String, bool>.from(state.favoriteStatus);
      updatedStatus[removedFavorite.favorite.itemId] = false;

      state = state.copyWith(
        favorites: _mockFavorites,
        favoriteStatus: updatedStatus,
        isSubmitting: false,
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: 'Erreur lors de la suppression: $e',
      );
      return false;
    }
  }

  Future<bool> reorderItems(String orderId) async {
    state = state.copyWith(isSubmitting: true, error: null);

    try {
      await Future.delayed(const Duration(milliseconds: 1000));

      // Find the order in reorder history
      _mockReorderHistory.firstWhere(
        (item) => item.orderId == orderId,
        orElse: () => throw Exception('Commande introuvable'),
      );

      // In real app, this would add items to cart and navigate to checkout
      // For now, just simulate success
      
      state = state.copyWith(isSubmitting: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: 'Erreur lors de la nouvelle commande: $e',
      );
      return false;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void reset() {
    state = const FavoritesState();
  }

  // Helper methods
  bool isFavorite(String itemId) {
    return state.favoriteStatus[itemId] ?? false;
  }

  List<FavoriteItem> getFavoritesByType(FavoriteType type) {
    return state.favorites.where((f) => f.favorite.type == type).toList();
  }

  List<FavoriteItem> getRecentFavorites({int limit = 5}) {
    final sortedFavorites = List<FavoriteItem>.from(state.favorites);
    sortedFavorites.sort((a, b) => b.favorite.createdAt.compareTo(a.favorite.createdAt));
    return sortedFavorites.take(limit).toList();
  }

  List<ReorderItem> getRecentOrders({int limit = 10}) {
    final sortedOrders = List<ReorderItem>.from(state.reorderHistory);
    sortedOrders.sort((a, b) => DateTime.parse(b.orderDate).compareTo(DateTime.parse(a.orderDate)));
    return sortedOrders.take(limit).toList();
  }

  Map<String, int> getFavoritesStatistics() {
    final restaurantCount = state.favorites
        .where((f) => f.favorite.type == FavoriteType.restaurant)
        .length;
    
    final itemCount = state.favorites
        .where((f) => f.favorite.type == FavoriteType.item)
        .length;

    return {
      'restaurants': restaurantCount,
      'items': itemCount,
      'total': restaurantCount + itemCount,
    };
  }

  List<FavoriteItem> searchFavorites(String query) {
    if (query.trim().isEmpty) return state.favorites;
    
    final lowercaseQuery = query.toLowerCase();
    return state.favorites.where((favorite) {
      return favorite.name.toLowerCase().contains(lowercaseQuery) ||
             favorite.description.toLowerCase().contains(lowercaseQuery) ||
             (favorite.restaurantName?.toLowerCase().contains(lowercaseQuery) ?? false);
    }).toList();
  }
}

// Providers
final favoritesProvider = StateNotifierProvider<FavoritesNotifier, FavoritesState>((ref) {
  return FavoritesNotifier();
});

final favoriteStatusProvider = Provider.family<bool, String>((ref, itemId) {
  return ref.watch(favoritesProvider.select((state) => state.favoriteStatus[itemId] ?? false));
});

final favoriteRestaurantsProvider = Provider<List<FavoriteItem>>((ref) {
  return ref.watch(favoritesProvider.select((state) => 
      state.favorites.where((f) => f.favorite.type == FavoriteType.restaurant).toList()));
});

final favoriteItemsProvider = Provider<List<FavoriteItem>>((ref) {
  return ref.watch(favoritesProvider.select((state) => 
      state.favorites.where((f) => f.favorite.type == FavoriteType.item).toList()));
});

final reorderHistoryProvider = Provider<List<ReorderItem>>((ref) {
  return ref.watch(favoritesProvider.select((state) => state.reorderHistory));
});
