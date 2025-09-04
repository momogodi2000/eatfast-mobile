class Rating {
  final String id;
  final String userId;
  final String userName;
  final String userAvatar;
  final String entityId; // restaurantId or itemId
  final RatingType type;
  final double score; // 1.0 to 5.0
  final String? comment;
  final List<String> photos;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isVerifiedPurchase;
  final String? orderId;
  
  const Rating({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userAvatar,
    required this.entityId,
    required this.type,
    required this.score,
    this.comment,
    this.photos = const [],
    required this.createdAt,
    this.updatedAt,
    this.isVerifiedPurchase = false,
    this.orderId,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['id'],
      userId: json['userId'],
      userName: json['userName'],
      userAvatar: json['userAvatar'],
      entityId: json['entityId'],
      type: RatingType.values.firstWhere(
        (t) => t.name == json['type'],
        orElse: () => RatingType.restaurant,
      ),
      score: (json['score'] as num).toDouble(),
      comment: json['comment'],
      photos: List<String>.from(json['photos'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null 
          ? DateTime.parse(json['updatedAt']) 
          : null,
      isVerifiedPurchase: json['isVerifiedPurchase'] ?? false,
      orderId: json['orderId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'userAvatar': userAvatar,
      'entityId': entityId,
      'type': type.name,
      'score': score,
      'comment': comment,
      'photos': photos,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'isVerifiedPurchase': isVerifiedPurchase,
      'orderId': orderId,
    };
  }

  Rating copyWith({
    String? id,
    String? userId,
    String? userName,
    String? userAvatar,
    String? entityId,
    RatingType? type,
    double? score,
    String? comment,
    List<String>? photos,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isVerifiedPurchase,
    String? orderId,
  }) {
    return Rating(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userAvatar: userAvatar ?? this.userAvatar,
      entityId: entityId ?? this.entityId,
      type: type ?? this.type,
      score: score ?? this.score,
      comment: comment ?? this.comment,
      photos: photos ?? this.photos,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isVerifiedPurchase: isVerifiedPurchase ?? this.isVerifiedPurchase,
      orderId: orderId ?? this.orderId,
    );
  }

  bool get hasPhotos => photos.isNotEmpty;
  bool get hasComment => comment != null && comment!.trim().isNotEmpty;
  
  String get formattedDate {
    final now = DateTime.now();
    final difference = now.difference(createdAt);
    
    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return '${difference.inMinutes}min';
      }
      return '${difference.inHours}h';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}j';
    } else if (difference.inDays < 30) {
      return '${(difference.inDays / 7).floor()}sem';
    } else {
      return '${(difference.inDays / 30).floor()}mois';
    }
  }
}

enum RatingType {
  restaurant,
  item,
  delivery;

  String get displayName {
    switch (this) {
      case RatingType.restaurant:
        return 'Restaurant';
      case RatingType.item:
        return 'Plat';
      case RatingType.delivery:
        return 'Livraison';
    }
  }
}

class RatingSummary {
  final double averageRating;
  final int totalRatings;
  final Map<int, int> ratingDistribution; // star -> count
  final List<Rating> recentRatings;
  
  const RatingSummary({
    required this.averageRating,
    required this.totalRatings,
    required this.ratingDistribution,
    required this.recentRatings,
  });

  factory RatingSummary.fromJson(Map<String, dynamic> json) {
    return RatingSummary(
      averageRating: (json['averageRating'] as num).toDouble(),
      totalRatings: json['totalRatings'],
      ratingDistribution: Map<int, int>.from(json['ratingDistribution']),
      recentRatings: (json['recentRatings'] as List)
          .map((r) => Rating.fromJson(r))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'averageRating': averageRating,
      'totalRatings': totalRatings,
      'ratingDistribution': ratingDistribution,
      'recentRatings': recentRatings.map((r) => r.toJson()).toList(),
    };
  }

  double get ratingPercentage => averageRating / 5.0;
  
  String get formattedRating {
    return averageRating.toStringAsFixed(1);
  }
  
  String get ratingText {
    if (averageRating >= 4.5) return 'Excellent';
    if (averageRating >= 4.0) return 'Très bon';
    if (averageRating >= 3.5) return 'Bon';
    if (averageRating >= 3.0) return 'Correct';
    if (averageRating >= 2.0) return 'Moyen';
    return 'Mauvais';
  }

  int getStarCount(int star) {
    return ratingDistribution[star] ?? 0;
  }

  double getStarPercentage(int star) {
    if (totalRatings == 0) return 0.0;
    return getStarCount(star) / totalRatings;
  }
}

class CreateRatingRequest {
  final String entityId;
  final RatingType type;
  final double score;
  final String? comment;
  final List<String> photos;
  final String? orderId;
  
  const CreateRatingRequest({
    required this.entityId,
    required this.type,
    required this.score,
    this.comment,
    this.photos = const [],
    this.orderId,
  });

  Map<String, dynamic> toJson() {
    return {
      'entityId': entityId,
      'type': type.name,
      'score': score,
      'comment': comment,
      'photos': photos,
      'orderId': orderId,
    };
  }

  bool get isValid {
    return entityId.isNotEmpty && 
           score >= 1.0 && 
           score <= 5.0;
  }
}
