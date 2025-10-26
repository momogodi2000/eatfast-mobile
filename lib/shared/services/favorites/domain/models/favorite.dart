import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite.freezed.dart';
part 'favorite.g.dart';

/// Favorite item model
@freezed
class FavoriteItem with _$FavoriteItem {
  const factory FavoriteItem({
    required String id,
    required String userId,
    required String itemId,
    required FavoriteType type,
    required String name,
    String? description,
    String? imageUrl,
    Map<String, dynamic>? metadata,
    required DateTime createdAt,
    // Additional properties for restaurant/dish favorites
    String? restaurantName,
    String? restaurantId,
    double? rating,
    int? reviewCount,
    double? price,
  }) = _FavoriteItem;

  const FavoriteItem._();

  factory FavoriteItem.fromJson(Map<String, dynamic> json) =>
      _$FavoriteItemFromJson(json);

  /// Get formatted rating (e.g., "4.5")
  String get formattedRating => rating != null ? rating!.toStringAsFixed(1) : '0.0';

  /// Get formatted price (e.g., "5,000 FCFA")
  String get formattedPrice => price != null ? '${price!.toStringAsFixed(0)} FCFA' : '0 FCFA';

  /// Get time ago string (e.g., "Il y a 2 jours")
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return 'Il y a $years ${years == 1 ? 'an' : 'ans'}';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return 'Il y a $months mois';
    } else if (difference.inDays > 0) {
      return 'Il y a ${difference.inDays} ${difference.inDays == 1 ? 'jour' : 'jours'}';
    } else if (difference.inHours > 0) {
      return 'Il y a ${difference.inHours} ${difference.inHours == 1 ? 'heure' : 'heures'}';
    } else if (difference.inMinutes > 0) {
      return 'Il y a ${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'}';
    } else {
      return 'À l\'instant';
    }
  }
}

/// Type of favorite item
enum FavoriteType {
  @JsonValue('restaurant')
  restaurant,
  @JsonValue('dish')
  dish,
  @JsonValue('menu_item')
  menuItem,
}

/// Reorder item model for reorder history
@freezed
class ReorderItem with _$ReorderItem {
  const factory ReorderItem({
    required String orderId,
    required String restaurantName,
    required String restaurantImage,
    required String itemSummary,
    required String formattedTotal,
    required String orderDate,
  }) = _ReorderItem;

  factory ReorderItem.fromJson(Map<String, dynamic> json) =>
      _$ReorderItemFromJson(json);
}

extension FavoriteTypeExtension on FavoriteType {
  String get displayName {
    switch (this) {
      case FavoriteType.restaurant:
        return 'Restaurant';
      case FavoriteType.dish:
        return 'Plat';
      case FavoriteType.menuItem:
        return 'Menu';
    }
  }
}
