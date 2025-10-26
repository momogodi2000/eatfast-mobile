class RestaurantReview {
  final String id;
  final String userId;
  final String userName;
  final String userAvatar;
  final int rating;
  final String comment;
  final DateTime createdAt;
  final String orderId;
  final bool isVerified;
  final String? restaurantResponse;
  final DateTime? responseAt;

  const RestaurantReview({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userAvatar,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.orderId,
    this.isVerified = false,
    this.restaurantResponse,
    this.responseAt,
  });

  factory RestaurantReview.fromJson(Map<String, dynamic> json) {
    return RestaurantReview(
      id: json['id'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userAvatar: json['userAvatar'] as String? ?? '',
      rating: json['rating'] as int,
      comment: json['comment'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      orderId: json['orderId'] as String,
      isVerified: json['isVerified'] as bool? ?? false,
      restaurantResponse: json['restaurantResponse'] as String?,
      responseAt: json['responseAt'] != null 
          ? DateTime.parse(json['responseAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'userAvatar': userAvatar,
      'rating': rating,
      'comment': comment,
      'createdAt': createdAt.toIso8601String(),
      'orderId': orderId,
      'isVerified': isVerified,
      'restaurantResponse': restaurantResponse,
      'responseAt': responseAt?.toIso8601String(),
    };
  }
}

class RestaurantRating {
  final double averageRating;
  final int totalReviews;
  final Map<int, int> ratingDistribution;

  const RestaurantRating({
    required this.averageRating,
    required this.totalReviews,
    required this.ratingDistribution,
  });

  factory RestaurantRating.fromJson(Map<String, dynamic> json) {
    return RestaurantRating(
      averageRating: (json['averageRating'] as num).toDouble(),
      totalReviews: json['totalReviews'] as int,
      ratingDistribution: Map<int, int>.from(json['ratingDistribution'] as Map),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'averageRating': averageRating,
      'totalReviews': totalReviews,
      'ratingDistribution': ratingDistribution,
    };
  }
}
