/// Menu Item Performance Analytics Model
class MenuItemPerformance {
  final String itemId;
  final String itemName;
  final int totalOrders;
  final double totalRevenue;
  final double averageRating;
  final int reviewCount;
  final double conversionRate;
  final Map<String, int>? ordersByDay;

  const MenuItemPerformance({
    required this.itemId,
    required this.itemName,
    this.totalOrders = 0,
    this.totalRevenue = 0.0,
    this.averageRating = 0.0,
    this.reviewCount = 0,
    this.conversionRate = 0.0,
    this.ordersByDay,
  });

  factory MenuItemPerformance.fromJson(Map<String, dynamic> json) {
    return MenuItemPerformance(
      itemId: json['itemId'] as String,
      itemName: json['itemName'] as String,
      totalOrders: json['totalOrders'] as int? ?? 0,
      totalRevenue: (json['totalRevenue'] as num?)?.toDouble() ?? 0.0,
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['reviewCount'] as int? ?? 0,
      conversionRate: (json['conversionRate'] as num?)?.toDouble() ?? 0.0,
      ordersByDay: (json['ordersByDay'] as Map<String, dynamic>?)
          ?.map((k, v) => MapEntry(k, v as int)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'itemId': itemId,
      'itemName': itemName,
      'totalOrders': totalOrders,
      'totalRevenue': totalRevenue,
      'averageRating': averageRating,
      'reviewCount': reviewCount,
      'conversionRate': conversionRate,
      if (ordersByDay != null) 'ordersByDay': ordersByDay,
    };
  }
}
