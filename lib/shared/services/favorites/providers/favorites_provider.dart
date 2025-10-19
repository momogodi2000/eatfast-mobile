import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/services/favorites/domain/models/favorite.dart';

/// Favorites state
class FavoritesState {
  final List<FavoriteItem> favorites;
  final List<ReorderItem> reorderHistory;
  final bool isLoading;
  final bool isSubmitting;
  final String? error;

  const FavoritesState({
    this.favorites = const [],
    this.reorderHistory = const [],
    this.isLoading = false,
    this.isSubmitting = false,
    this.error,
  });

  FavoritesState copyWith({
    List<FavoriteItem>? favorites,
    List<ReorderItem>? reorderHistory,
    bool? isLoading,
    bool? isSubmitting,
    String? error,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
      reorderHistory: reorderHistory ?? this.reorderHistory,
      isLoading: isLoading ?? this.isLoading,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: error,
    );
  }

  List<FavoriteItem> get restaurants =>
      favorites.where((item) => item.type == FavoriteType.restaurant).toList();

  List<FavoriteItem> get items => favorites
      .where(
        (item) =>
            item.type == FavoriteType.dish ||
            item.type == FavoriteType.menuItem,
      )
      .toList();
}

/// Favorites notifier
class FavoritesNotifier extends StateNotifier<FavoritesState> {
  FavoritesNotifier() : super(const FavoritesState());

  Future<void> loadFavorites() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      // TODO: Implement API call to load favorites
      // For now, return empty list
      await Future.delayed(const Duration(seconds: 1));
      state = state.copyWith(isLoading: false, favorites: []);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load favorites: $e',
      );
    }
  }

  Future<void> loadReorderHistory() async {
    try {
      // TODO: Implement API call to load reorder history
      // For now, return empty list
      await Future.delayed(const Duration(milliseconds: 500));
      state = state.copyWith(reorderHistory: []);
    } catch (e) {
      state = state.copyWith(error: 'Failed to load reorder history: $e');
    }
  }

  List<FavoriteItem> searchFavorites(String query) {
    final lowerQuery = query.toLowerCase();
    return state.favorites
        .where(
          (item) =>
              item.name.toLowerCase().contains(lowerQuery) ||
              (item.description?.toLowerCase().contains(lowerQuery) ?? false),
        )
        .toList();
  }

  Future<void> addFavorite(FavoriteItem item) async {
    try {
      // TODO: Implement API call to add favorite
      final updatedItems = [...state.favorites, item];
      state = state.copyWith(favorites: updatedItems);
    } catch (e) {
      state = state.copyWith(error: 'Failed to add favorite: $e');
    }
  }

  Future<bool> removeFavorite(String favoriteId) async {
    try {
      // TODO: Implement API call to remove favorite
      final updatedItems = state.favorites
          .where((item) => item.id != favoriteId)
          .toList();
      state = state.copyWith(favorites: updatedItems);
      return true;
    } catch (e) {
      state = state.copyWith(error: 'Failed to remove favorite: $e');
      return false;
    }
  }

  Future<void> toggleFavorite({
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
    state = state.copyWith(isSubmitting: true);
    try {
      // TODO: Implement API call to toggle favorite
      await Future.delayed(const Duration(milliseconds: 500));

      final existingIndex = state.favorites.indexWhere(
        (item) => item.itemId == itemId,
      );

      if (existingIndex >= 0) {
        // Remove from favorites
        final updatedFavorites = [...state.favorites];
        updatedFavorites.removeAt(existingIndex);
        state = state.copyWith(
          favorites: updatedFavorites,
          isSubmitting: false,
        );
      } else {
        // Add to favorites
        final metadata = <String, dynamic>{
          if (price != null) 'price': price,
          if (rating != null) 'rating': rating,
          if (reviewCount != null) 'reviewCount': reviewCount,
          if (restaurantName != null) 'restaurantName': restaurantName,
          if (restaurantId != null) 'restaurantId': restaurantId,
        };

        final newFavorite = FavoriteItem(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          userId: 'current_user_id', // TODO: Get from auth
          itemId: itemId,
          type: type,
          name: name,
          description: description,
          imageUrl: imageUrl,
          metadata: metadata.isNotEmpty ? metadata : null,
          createdAt: DateTime.now(),
        );

        final updatedFavorites = [...state.favorites, newFavorite];
        state = state.copyWith(
          favorites: updatedFavorites,
          isSubmitting: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to toggle favorite: $e',
        isSubmitting: false,
      );
    }
  }

  Future<bool> reorderItems(String orderId) async {
    state = state.copyWith(isSubmitting: true);
    try {
      // TODO: Implement API call to reorder items
      await Future.delayed(const Duration(milliseconds: 500));
      state = state.copyWith(isSubmitting: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to reorder items: $e',
        isSubmitting: false,
      );
      return false;
    }
  }

  bool isFavorite(String itemId) {
    return state.favorites.any((item) => item.itemId == itemId);
  }
}

/// Favorites provider
final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, FavoritesState>((ref) {
      final notifier = FavoritesNotifier();
      notifier.loadFavorites();
      return notifier;
    });
