import 'package:flutter_test/flutter_test.dart';
import 'package:eatfast_mobile/features/ratings/domain/models/rating.dart';

void main() {
  group('Rating Model Tests', () {
    late Rating testRating;

    setUp(() {
      testRating = Rating(
        id: 'rating_1',
        userId: 'user_1',
        userName: 'John Doe',
        userAvatar: 'avatar.jpg',
        entityId: 'restaurant_1',
        type: RatingType.restaurant,
        score: 4.5,
        comment: 'Great food and service!',
        photos: ['photo1.jpg', 'photo2.jpg'],
        createdAt: DateTime.parse('2024-01-15T10:30:00Z'),
        isVerifiedPurchase: true,
        orderId: 'order_123',
      );
    });

    test('should create Rating from JSON correctly', () {
      final json = {
        'id': 'rating_1',
        'userId': 'user_1',
        'userName': 'John Doe',
        'userAvatar': 'avatar.jpg',
        'entityId': 'restaurant_1',
        'type': 'restaurant',
        'score': 4.5,
        'comment': 'Great food and service!',
        'photos': ['photo1.jpg', 'photo2.jpg'],
        'createdAt': '2024-01-15T10:30:00Z',
        'isVerifiedPurchase': true,
        'orderId': 'order_123',
      };

      final rating = Rating.fromJson(json);

      expect(rating.id, 'rating_1');
      expect(rating.userName, 'John Doe');
      expect(rating.type, RatingType.restaurant);
      expect(rating.score, 4.5);
      expect(rating.comment, 'Great food and service!');
      expect(rating.photos.length, 2);
      expect(rating.isVerifiedPurchase, true);
    });

    test('should convert Rating to JSON correctly', () {
      final json = testRating.toJson();

      expect(json['id'], 'rating_1');
      expect(json['userName'], 'John Doe');
      expect(json['type'], 'restaurant');
      expect(json['score'], 4.5);
      expect(json['comment'], 'Great food and service!');
      expect(json['photos'], ['photo1.jpg', 'photo2.jpg']);
      expect(json['isVerifiedPurchase'], true);
    });

    test('should check if rating has photos correctly', () {
      expect(testRating.hasPhotos, true);

      final ratingWithoutPhotos = testRating.copyWith(photos: []);
      expect(ratingWithoutPhotos.hasPhotos, false);
    });

    test('should check if rating has comment correctly', () {
      expect(testRating.hasComment, true);

      final ratingWithoutComment = testRating.copyWith(comment: null);
      expect(ratingWithoutComment.hasComment, false);

      final ratingWithEmptyComment = testRating.copyWith(comment: '   ');
      expect(ratingWithEmptyComment.hasComment, false);
    });

    test('should format date correctly', () {
      final now = DateTime.now();
      
      // Recent rating (minutes ago)
      final recentRating = testRating.copyWith(
        createdAt: now.subtract(const Duration(minutes: 30)),
      );
      expect(recentRating.formattedDate, '30min');

      // Hours ago
      final hoursAgoRating = testRating.copyWith(
        createdAt: now.subtract(const Duration(hours: 3)),
      );
      expect(hoursAgoRating.formattedDate, '3h');

      // Days ago
      final daysAgoRating = testRating.copyWith(
        createdAt: now.subtract(const Duration(days: 2)),
      );
      expect(daysAgoRating.formattedDate, '2j');
    });

    test('should create copy with updated values', () {
      final updatedRating = testRating.copyWith(
        score: 5.0,
        comment: 'Updated comment',
        photos: ['new_photo.jpg'],
      );

      expect(updatedRating.score, 5.0);
      expect(updatedRating.comment, 'Updated comment');
      expect(updatedRating.photos, ['new_photo.jpg']);
      // Other values should remain the same
      expect(updatedRating.id, testRating.id);
      expect(updatedRating.userName, testRating.userName);
      expect(updatedRating.createdAt, testRating.createdAt);
    });
  });

  group('RatingType Enum Tests', () {
    test('should have correct display names', () {
      expect(RatingType.restaurant.displayName, 'Restaurant');
      expect(RatingType.item.displayName, 'Plat');
      expect(RatingType.delivery.displayName, 'Livraison');
    });
  });

  group('RatingSummary Model Tests', () {
    late RatingSummary testSummary;

    setUp(() {
      testSummary = const RatingSummary(
        averageRating: 4.3,
        totalRatings: 150,
        ratingDistribution: {
          5: 75,
          4: 45,
          3: 20,
          2: 8,
          1: 2,
        },
        recentRatings: [],
      );
    });

    test('should create RatingSummary from JSON correctly', () {
      final json = {
        'averageRating': 4.3,
        'totalRatings': 150,
        'ratingDistribution': {
          '5': 75,
          '4': 45,
          '3': 20,
          '2': 8,
          '1': 2,
        },
        'recentRatings': [],
      };

      final summary = RatingSummary.fromJson(json);

      expect(summary.averageRating, 4.3);
      expect(summary.totalRatings, 150);
      expect(summary.ratingDistribution[5], 75);
      expect(summary.ratingDistribution[1], 2);
    });

    test('should calculate rating percentage correctly', () {
      expect(testSummary.ratingPercentage, closeTo(0.86, 0.01)); // 4.3/5.0 ≈ 0.86
    });

    test('should format rating correctly', () {
      expect(testSummary.formattedRating, '4.3');
    });

    test('should provide correct rating text', () {
      const excellentSummary = RatingSummary(
        averageRating: 4.7,
        totalRatings: 100,
        ratingDistribution: {},
        recentRatings: [],
      );
      expect(excellentSummary.ratingText, 'Excellent');

      const goodSummary = RatingSummary(
        averageRating: 3.8,
        totalRatings: 100,
        ratingDistribution: {},
        recentRatings: [],
      );
      expect(goodSummary.ratingText, 'Bon');

      const poorSummary = RatingSummary(
        averageRating: 1.5,
        totalRatings: 100,
        ratingDistribution: {},
        recentRatings: [],
      );
      expect(poorSummary.ratingText, 'Mauvais');
    });

    test('should get star count correctly', () {
      expect(testSummary.getStarCount(5), 75);
      expect(testSummary.getStarCount(4), 45);
      expect(testSummary.getStarCount(1), 2);
      expect(testSummary.getStarCount(6), 0); // Non-existent star rating
    });

    test('should calculate star percentage correctly', () {
      expect(testSummary.getStarPercentage(5), 0.5); // 75/150 = 0.5
      expect(testSummary.getStarPercentage(4), 0.3); // 45/150 = 0.3
      expect(testSummary.getStarPercentage(1), closeTo(0.013, 0.001)); // 2/150 ≈ 0.013
    });

    test('should handle zero total ratings', () {
      const emptySummary = RatingSummary(
        averageRating: 0.0,
        totalRatings: 0,
        ratingDistribution: {},
        recentRatings: [],
      );

      expect(emptySummary.getStarPercentage(5), 0.0);
      expect(emptySummary.getStarPercentage(1), 0.0);
    });
  });

  group('CreateRatingRequest Model Tests', () {
    late CreateRatingRequest testRequest;

    setUp(() {
      testRequest = const CreateRatingRequest(
        entityId: 'restaurant_1',
        type: RatingType.restaurant,
        score: 4.5,
        comment: 'Great experience!',
        photos: ['photo1.jpg', 'photo2.jpg'],
        orderId: 'order_123',
      );
    });

    test('should convert to JSON correctly', () {
      final json = testRequest.toJson();

      expect(json['entityId'], 'restaurant_1');
      expect(json['type'], 'restaurant');
      expect(json['score'], 4.5);
      expect(json['comment'], 'Great experience!');
      expect(json['photos'], ['photo1.jpg', 'photo2.jpg']);
      expect(json['orderId'], 'order_123');
    });

    test('should validate correctly', () {
      expect(testRequest.isValid, true);

      // Invalid score (too low)
      const invalidLowScore = CreateRatingRequest(
        entityId: 'restaurant_1',
        type: RatingType.restaurant,
        score: 0.5,
      );
      expect(invalidLowScore.isValid, false);

      // Invalid score (too high)
      const invalidHighScore = CreateRatingRequest(
        entityId: 'restaurant_1',
        type: RatingType.restaurant,
        score: 5.5,
      );
      expect(invalidHighScore.isValid, false);

      // Empty entity ID
      const invalidEntityId = CreateRatingRequest(
        entityId: '',
        type: RatingType.restaurant,
        score: 4.0,
      );
      expect(invalidEntityId.isValid, false);
    });

    test('should handle optional fields correctly', () {
      const minimalRequest = CreateRatingRequest(
        entityId: 'restaurant_1',
        type: RatingType.restaurant,
        score: 4.0,
      );

      expect(minimalRequest.isValid, true);
      expect(minimalRequest.comment, null);
      expect(minimalRequest.photos, []);
      expect(minimalRequest.orderId, null);

      final json = minimalRequest.toJson();
      expect(json['comment'], null);
      expect(json['photos'], []);
      expect(json['orderId'], null);
    });
  });
}
