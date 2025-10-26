class RestaurantReview {
  final String id;
  final String userId;
  final String userName;
  final String? userAvatar;
  final int rating;
  final String? comment;
  final DateTime createdAt;
  final String? orderId;
  final bool isVerified;
  final String? restaurantResponse;
  final DateTime? responseAt;
  final List<String>? images;

  const RestaurantReview({
    required this.id,
    required this.userId,
    required this.userName,
    this.userAvatar,
    required this.rating,
    this.comment,
    required this.createdAt,
    this.orderId,
    this.isVerified = false,
    this.restaurantResponse,
    this.responseAt,
    this.images,
  });

  factory RestaurantReview.fromJson(Map<String, dynamic> json) {
    return RestaurantReview(
      id: json['id'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userAvatar: json['userAvatar'] as String?,
      rating: json['rating'] as int,
      comment: json['comment'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      orderId: json['orderId'] as String?,
      isVerified: json['isVerified'] as bool? ?? false,
      restaurantResponse: json['restaurantResponse'] as String?,
      responseAt: json['responseAt'] != null 
          ? DateTime.parse(json['responseAt'] as String)
          : null,
      images: json['images'] != null 
          ? List<String>.from(json['images'] as List)
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
      'images': images,
    };
  }

  RestaurantReview copyWith({
    String? id,
    String? userId,
    String? userName,
    String? userAvatar,
    int? rating,
    String? comment,
    DateTime? createdAt,
    String? orderId,
    bool? isVerified,
    String? restaurantResponse,
    DateTime? responseAt,
    List<String>? images,
  }) {
    return RestaurantReview(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userAvatar: userAvatar ?? this.userAvatar,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      createdAt: createdAt ?? this.createdAt,
      orderId: orderId ?? this.orderId,
      isVerified: isVerified ?? this.isVerified,
      restaurantResponse: restaurantResponse ?? this.restaurantResponse,
      responseAt: responseAt ?? this.responseAt,
      images: images ?? this.images,
    );
  }
}
