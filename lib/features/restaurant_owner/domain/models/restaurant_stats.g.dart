// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantStatsImpl _$$RestaurantStatsImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantStatsImpl(
      totalOrders: (json['totalOrders'] as num).toInt(),
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      averageRating: (json['averageRating'] as num).toDouble(),
      activeOrders: (json['activeOrders'] as num).toInt(),
      completedToday: (json['completedToday'] as num).toInt(),
      todayRevenue: (json['todayRevenue'] as num).toDouble(),
      totalCustomers: (json['totalCustomers'] as num).toInt(),
      averageOrderValue: (json['averageOrderValue'] as num).toDouble(),
      pendingOrders: (json['pendingOrders'] as num).toInt(),
      rejectedOrders: (json['rejectedOrders'] as num).toInt(),
      hourlyStats: (json['hourlyStats'] as List<dynamic>?)
              ?.map((e) => HourlyStats.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      weeklyStats: (json['weeklyStats'] as List<dynamic>?)
              ?.map((e) => DailyStats.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      popularItems: (json['popularItems'] as List<dynamic>?)
              ?.map((e) => PopularItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RestaurantStatsImplToJson(
        _$RestaurantStatsImpl instance) =>
    <String, dynamic>{
      'totalOrders': instance.totalOrders,
      'totalRevenue': instance.totalRevenue,
      'averageRating': instance.averageRating,
      'activeOrders': instance.activeOrders,
      'completedToday': instance.completedToday,
      'todayRevenue': instance.todayRevenue,
      'totalCustomers': instance.totalCustomers,
      'averageOrderValue': instance.averageOrderValue,
      'pendingOrders': instance.pendingOrders,
      'rejectedOrders': instance.rejectedOrders,
      'hourlyStats': instance.hourlyStats,
      'weeklyStats': instance.weeklyStats,
      'popularItems': instance.popularItems,
    };

_$HourlyStatsImpl _$$HourlyStatsImplFromJson(Map<String, dynamic> json) =>
    _$HourlyStatsImpl(
      hour: (json['hour'] as num).toInt(),
      orders: (json['orders'] as num).toInt(),
      revenue: (json['revenue'] as num).toDouble(),
    );

Map<String, dynamic> _$$HourlyStatsImplToJson(_$HourlyStatsImpl instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'orders': instance.orders,
      'revenue': instance.revenue,
    };

_$DailyStatsImpl _$$DailyStatsImplFromJson(Map<String, dynamic> json) =>
    _$DailyStatsImpl(
      date: DateTime.parse(json['date'] as String),
      orders: (json['orders'] as num).toInt(),
      revenue: (json['revenue'] as num).toDouble(),
    );

Map<String, dynamic> _$$DailyStatsImplToJson(_$DailyStatsImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'orders': instance.orders,
      'revenue': instance.revenue,
    };

_$PopularItemImpl _$$PopularItemImplFromJson(Map<String, dynamic> json) =>
    _$PopularItemImpl(
      itemId: json['itemId'] as String,
      itemName: json['itemName'] as String,
      imageUrl: json['imageUrl'] as String,
      orderCount: (json['orderCount'] as num).toInt(),
      revenue: (json['revenue'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$$PopularItemImplToJson(_$PopularItemImpl instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'imageUrl': instance.imageUrl,
      'orderCount': instance.orderCount,
      'revenue': instance.revenue,
      'rating': instance.rating,
    };
