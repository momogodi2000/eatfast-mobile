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
  }) = _FavoriteItem;

  factory FavoriteItem.fromJson(Map<String, dynamic> json) =>
      _$FavoriteItemFromJson(json);
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
