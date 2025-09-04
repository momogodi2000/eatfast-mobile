import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/rating.dart';

class RatingState {
  final List<Rating> ratings;
  final RatingSummary? summary;
  final bool isLoading;
  final String? error;
  final bool isSubmitting;

  const RatingState({
    this.ratings = const [],
    this.summary,
    this.isLoading = false,
    this.error,
    this.isSubmitting = false,
  });

  RatingState copyWith({
    List<Rating>? ratings,
    RatingSummary? summary,
    bool? isLoading,
    String? error,
    bool? isSubmitting,
  }) {
    return RatingState(
      ratings: ratings ?? this.ratings,
      summary: summary ?? this.summary,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}

class RatingNotifier extends StateNotifier<RatingState> {
  RatingNotifier() : super(const RatingState());

  // Mock data - replace with actual API calls
  final List<Rating> _mockRatings = [
    Rating(
      id: '1',
      userId: 'user1',
      userName: 'Marie Dubois',
      userAvatar: 'assets/avatar/avatar1.jpg',
      entityId: 'restaurant1',
      type: RatingType.restaurant,
      score: 4.5,
      comment: 'Excellent service et nourriture délicieuse! Je recommande vivement ce restaurant.',
      photos: ['assets/images/review1.jpg'],
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      isVerifiedPurchase: true,
      orderId: 'order123',
    ),
    Rating(
      id: '2',
      userId: 'user2',
      userName: 'Jean Martin',
      userAvatar: 'assets/avatar/avatar2.jpg',
      entityId: 'restaurant1',
      type: RatingType.restaurant,
      score: 5.0,
      comment: 'Livraison rapide et plats chauds. Parfait!',
      photos: [],
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      isVerifiedPurchase: true,
      orderId: 'order124',
    ),
    Rating(
      id: '3',
      userId: 'user3',
      userName: 'Sophie Bernard',
      userAvatar: 'assets/avatar/avatar3.png',
      entityId: 'item1',
      type: RatingType.item,
      score: 4.0,
      comment: 'Très bon plat, portion généreuse.',
      photos: ['assets/images/review2.jpg', 'assets/images/review3.jpg'],
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      isVerifiedPurchase: true,
      orderId: 'order125',
    ),
  ];

  final Map<String, RatingSummary> _mockSummaries = {
    'restaurant1': RatingSummary(
      averageRating: 4.5,
      totalRatings: 125,
      ratingDistribution: {
        5: 75,
        4: 35,
        3: 10,
        2: 3,
        1: 2,
      },
      recentRatings: [],
    ),
    'item1': RatingSummary(
      averageRating: 4.2,
      totalRatings: 45,
      ratingDistribution: {
        5: 20,
        4: 18,
        3: 5,
        2: 2,
        1: 0,
      },
      recentRatings: [],
    ),
  };

  Future<void> loadRatings({
    required String entityId,
    required RatingType type,
    int page = 1,
    int limit = 20,
  }) async {
    if (page == 1) {
      state = state.copyWith(isLoading: true, error: null);
    }

    try {
      // Simulate API delay
      await Future.delayed(const Duration(milliseconds: 800));

      // Filter mock ratings by entity and type
      final filteredRatings = _mockRatings
          .where((r) => r.entityId == entityId && r.type == type)
          .toList();

      filteredRatings.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      final summary = _mockSummaries[entityId];
      if (summary != null) {
        final updatedSummary = summary.copyWith(
          recentRatings: filteredRatings.take(3).toList(),
        );
        state = state.copyWith(
          ratings: filteredRatings,
          summary: updatedSummary,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          ratings: filteredRatings,
          isLoading: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Erreur lors du chargement des évaluations: $e',
      );
    }
  }

  Future<bool> submitRating(CreateRatingRequest request) async {
    if (!request.isValid) {
      state = state.copyWith(error: 'Données de l\'évaluation invalides');
      return false;
    }

    state = state.copyWith(isSubmitting: true, error: null);

    try {
      // Simulate API delay
      await Future.delayed(const Duration(milliseconds: 1500));

      // Create new rating
      final newRating = Rating(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: 'current_user', // Get from auth
        userName: 'Utilisateur Actuel', // Get from auth
        userAvatar: 'assets/avatar/avatar1.jpg', // Get from auth
        entityId: request.entityId,
        type: request.type,
        score: request.score,
        comment: request.comment,
        photos: request.photos,
        createdAt: DateTime.now(),
        isVerifiedPurchase: request.orderId != null,
        orderId: request.orderId,
      );

      // Add to mock data
      _mockRatings.insert(0, newRating);

      // Update summary
      final currentSummary = _mockSummaries[request.entityId];
      if (currentSummary != null) {
        final newDistribution = Map<int, int>.from(currentSummary.ratingDistribution);
        final starRating = request.score.round();
        newDistribution[starRating] = (newDistribution[starRating] ?? 0) + 1;

        final newTotal = currentSummary.totalRatings + 1;
        final newAverage = ((currentSummary.averageRating * currentSummary.totalRatings) + request.score) / newTotal;

        final updatedSummary = RatingSummary(
          averageRating: newAverage,
          totalRatings: newTotal,
          ratingDistribution: newDistribution,
          recentRatings: [newRating, ...currentSummary.recentRatings.take(2)].toList(),
        );

        _mockSummaries[request.entityId] = updatedSummary;

        state = state.copyWith(
          ratings: [newRating, ...state.ratings],
          summary: updatedSummary,
          isSubmitting: false,
        );
      } else {
        state = state.copyWith(
          ratings: [newRating, ...state.ratings],
          isSubmitting: false,
        );
      }

      return true;
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: 'Erreur lors de la soumission de l\'évaluation: $e',
      );
      return false;
    }
  }

  Future<bool> updateRating(String ratingId, CreateRatingRequest request) async {
    state = state.copyWith(isSubmitting: true, error: null);

    try {
      await Future.delayed(const Duration(milliseconds: 1000));

      final ratingIndex = _mockRatings.indexWhere((r) => r.id == ratingId);
      if (ratingIndex == -1) {
        throw Exception('Évaluation introuvable');
      }

      final oldRating = _mockRatings[ratingIndex];
      final updatedRating = oldRating.copyWith(
        score: request.score,
        comment: request.comment,
        photos: request.photos,
        updatedAt: DateTime.now(),
      );

      _mockRatings[ratingIndex] = updatedRating;

      // Update state
      final updatedRatings = state.ratings.map((r) => 
          r.id == ratingId ? updatedRating : r).toList();

      state = state.copyWith(
        ratings: updatedRatings,
        isSubmitting: false,
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: 'Erreur lors de la mise à jour: $e',
      );
      return false;
    }
  }

  Future<bool> deleteRating(String ratingId) async {
    state = state.copyWith(isSubmitting: true, error: null);

    try {
      await Future.delayed(const Duration(milliseconds: 500));

      _mockRatings.removeWhere((r) => r.id == ratingId);

      state = state.copyWith(
        ratings: state.ratings.where((r) => r.id != ratingId).toList(),
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

  void clearError() {
    state = state.copyWith(error: null);
  }

  void reset() {
    state = const RatingState();
  }

  // Helper methods
  List<Rating> getRatingsByUser(String userId) {
    return _mockRatings.where((r) => r.userId == userId).toList();
  }

  List<Rating> getRatingsByOrder(String orderId) {
    return _mockRatings.where((r) => r.orderId == orderId).toList();
  }

  double getAverageRatingForEntity(String entityId) {
    final ratings = _mockRatings.where((r) => r.entityId == entityId).toList();
    if (ratings.isEmpty) return 0.0;
    
    final sum = ratings.fold(0.0, (sum, rating) => sum + rating.score);
    return sum / ratings.length;
  }

  RatingSummary? getSummaryForEntity(String entityId) {
    return _mockSummaries[entityId];
  }
}

// Providers
final ratingProvider = StateNotifierProvider<RatingNotifier, RatingState>((ref) {
  return RatingNotifier();
});

// Specific providers for different entities
final restaurantRatingProvider = StateNotifierProvider.family<RatingNotifier, RatingState, String>((ref, restaurantId) {
  return RatingNotifier();
});

final itemRatingProvider = StateNotifierProvider.family<RatingNotifier, RatingState, String>((ref, itemId) {
  return RatingNotifier();
});

extension RatingSummaryExtension on RatingSummary {
  RatingSummary copyWith({
    double? averageRating,
    int? totalRatings,
    Map<int, int>? ratingDistribution,
    List<Rating>? recentRatings,
  }) {
    return RatingSummary(
      averageRating: averageRating ?? this.averageRating,
      totalRatings: totalRatings ?? this.totalRatings,
      ratingDistribution: ratingDistribution ?? this.ratingDistribution,
      recentRatings: recentRatings ?? this.recentRatings,
    );
  }
}
