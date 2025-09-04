// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminStatsImpl _$$AdminStatsImplFromJson(Map<String, dynamic> json) =>
    _$AdminStatsImpl(
      totalUsers: (json['totalUsers'] as num).toInt(),
      activeUsers: (json['activeUsers'] as num).toInt(),
      totalRestaurants: (json['totalRestaurants'] as num).toInt(),
      activeRestaurants: (json['activeRestaurants'] as num).toInt(),
      totalDrivers: (json['totalDrivers'] as num).toInt(),
      activeDrivers: (json['activeDrivers'] as num).toInt(),
      onlineDrivers: (json['onlineDrivers'] as num).toInt(),
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      todayRevenue: (json['todayRevenue'] as num).toDouble(),
      weekRevenue: (json['weekRevenue'] as num).toDouble(),
      monthRevenue: (json['monthRevenue'] as num).toDouble(),
      totalOrders: (json['totalOrders'] as num).toInt(),
      todayOrders: (json['todayOrders'] as num).toInt(),
      weekOrders: (json['weekOrders'] as num).toInt(),
      monthOrders: (json['monthOrders'] as num).toInt(),
      pendingOrders: (json['pendingOrders'] as num).toInt(),
      completedOrders: (json['completedOrders'] as num).toInt(),
      cancelledOrders: (json['cancelledOrders'] as num).toInt(),
      averageOrderValue: (json['averageOrderValue'] as num).toDouble(),
      averageDeliveryTime: (json['averageDeliveryTime'] as num).toDouble(),
      customerSatisfaction: (json['customerSatisfaction'] as num).toDouble(),
      platformCommission: (json['platformCommission'] as num).toDouble(),
      hourlyStats: (json['hourlyStats'] as List<dynamic>?)
              ?.map((e) => HourlyStats.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      dailyStats: (json['dailyStats'] as List<dynamic>?)
              ?.map((e) => DailyStats.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      weeklyStats: (json['weeklyStats'] as List<dynamic>?)
              ?.map((e) => WeeklyStats.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      monthlyStats: (json['monthlyStats'] as List<dynamic>?)
              ?.map((e) => MonthlyStats.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      topRestaurants: (json['topRestaurants'] as List<dynamic>?)
              ?.map((e) => TopRestaurant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      topDrivers: (json['topDrivers'] as List<dynamic>?)
              ?.map((e) => TopDriver.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AdminStatsImplToJson(_$AdminStatsImpl instance) =>
    <String, dynamic>{
      'totalUsers': instance.totalUsers,
      'activeUsers': instance.activeUsers,
      'totalRestaurants': instance.totalRestaurants,
      'activeRestaurants': instance.activeRestaurants,
      'totalDrivers': instance.totalDrivers,
      'activeDrivers': instance.activeDrivers,
      'onlineDrivers': instance.onlineDrivers,
      'totalRevenue': instance.totalRevenue,
      'todayRevenue': instance.todayRevenue,
      'weekRevenue': instance.weekRevenue,
      'monthRevenue': instance.monthRevenue,
      'totalOrders': instance.totalOrders,
      'todayOrders': instance.todayOrders,
      'weekOrders': instance.weekOrders,
      'monthOrders': instance.monthOrders,
      'pendingOrders': instance.pendingOrders,
      'completedOrders': instance.completedOrders,
      'cancelledOrders': instance.cancelledOrders,
      'averageOrderValue': instance.averageOrderValue,
      'averageDeliveryTime': instance.averageDeliveryTime,
      'customerSatisfaction': instance.customerSatisfaction,
      'platformCommission': instance.platformCommission,
      'hourlyStats': instance.hourlyStats,
      'dailyStats': instance.dailyStats,
      'weeklyStats': instance.weeklyStats,
      'monthlyStats': instance.monthlyStats,
      'topRestaurants': instance.topRestaurants,
      'topDrivers': instance.topDrivers,
    };

_$HourlyStatsImpl _$$HourlyStatsImplFromJson(Map<String, dynamic> json) =>
    _$HourlyStatsImpl(
      hour: DateTime.parse(json['hour'] as String),
      orders: (json['orders'] as num).toInt(),
      revenue: (json['revenue'] as num).toDouble(),
      activeDrivers: (json['activeDrivers'] as num).toInt(),
      activeRestaurants: (json['activeRestaurants'] as num).toInt(),
    );

Map<String, dynamic> _$$HourlyStatsImplToJson(_$HourlyStatsImpl instance) =>
    <String, dynamic>{
      'hour': instance.hour.toIso8601String(),
      'orders': instance.orders,
      'revenue': instance.revenue,
      'activeDrivers': instance.activeDrivers,
      'activeRestaurants': instance.activeRestaurants,
    };

_$DailyStatsImpl _$$DailyStatsImplFromJson(Map<String, dynamic> json) =>
    _$DailyStatsImpl(
      date: DateTime.parse(json['date'] as String),
      orders: (json['orders'] as num).toInt(),
      revenue: (json['revenue'] as num).toDouble(),
      newUsers: (json['newUsers'] as num).toInt(),
      newRestaurants: (json['newRestaurants'] as num).toInt(),
      newDrivers: (json['newDrivers'] as num).toInt(),
      averageOrderValue: (json['averageOrderValue'] as num).toDouble(),
      customerSatisfaction: (json['customerSatisfaction'] as num).toDouble(),
    );

Map<String, dynamic> _$$DailyStatsImplToJson(_$DailyStatsImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'orders': instance.orders,
      'revenue': instance.revenue,
      'newUsers': instance.newUsers,
      'newRestaurants': instance.newRestaurants,
      'newDrivers': instance.newDrivers,
      'averageOrderValue': instance.averageOrderValue,
      'customerSatisfaction': instance.customerSatisfaction,
    };

_$WeeklyStatsImpl _$$WeeklyStatsImplFromJson(Map<String, dynamic> json) =>
    _$WeeklyStatsImpl(
      weekStartDate: DateTime.parse(json['weekStartDate'] as String),
      orders: (json['orders'] as num).toInt(),
      revenue: (json['revenue'] as num).toDouble(),
      newUsers: (json['newUsers'] as num).toInt(),
      activeUsers: (json['activeUsers'] as num).toInt(),
      customerRetention: (json['customerRetention'] as num).toDouble(),
      platformGrowth: (json['platformGrowth'] as num).toDouble(),
    );

Map<String, dynamic> _$$WeeklyStatsImplToJson(_$WeeklyStatsImpl instance) =>
    <String, dynamic>{
      'weekStartDate': instance.weekStartDate.toIso8601String(),
      'orders': instance.orders,
      'revenue': instance.revenue,
      'newUsers': instance.newUsers,
      'activeUsers': instance.activeUsers,
      'customerRetention': instance.customerRetention,
      'platformGrowth': instance.platformGrowth,
    };

_$MonthlyStatsImpl _$$MonthlyStatsImplFromJson(Map<String, dynamic> json) =>
    _$MonthlyStatsImpl(
      month: DateTime.parse(json['month'] as String),
      orders: (json['orders'] as num).toInt(),
      revenue: (json['revenue'] as num).toDouble(),
      newUsers: (json['newUsers'] as num).toInt(),
      churnedUsers: (json['churnedUsers'] as num).toInt(),
      monthlyRecurringRevenue:
          (json['monthlyRecurringRevenue'] as num).toDouble(),
      customerLifetimeValue: (json['customerLifetimeValue'] as num).toDouble(),
    );

Map<String, dynamic> _$$MonthlyStatsImplToJson(_$MonthlyStatsImpl instance) =>
    <String, dynamic>{
      'month': instance.month.toIso8601String(),
      'orders': instance.orders,
      'revenue': instance.revenue,
      'newUsers': instance.newUsers,
      'churnedUsers': instance.churnedUsers,
      'monthlyRecurringRevenue': instance.monthlyRecurringRevenue,
      'customerLifetimeValue': instance.customerLifetimeValue,
    };

_$TopRestaurantImpl _$$TopRestaurantImplFromJson(Map<String, dynamic> json) =>
    _$TopRestaurantImpl(
      restaurantId: json['restaurantId'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      totalOrders: (json['totalOrders'] as num).toInt(),
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      averageRating: (json['averageRating'] as num).toDouble(),
      averageOrderValue: (json['averageOrderValue'] as num).toDouble(),
      completedOrders: (json['completedOrders'] as num).toInt(),
      completionRate: (json['completionRate'] as num).toDouble(),
    );

Map<String, dynamic> _$$TopRestaurantImplToJson(_$TopRestaurantImpl instance) =>
    <String, dynamic>{
      'restaurantId': instance.restaurantId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'totalOrders': instance.totalOrders,
      'totalRevenue': instance.totalRevenue,
      'averageRating': instance.averageRating,
      'averageOrderValue': instance.averageOrderValue,
      'completedOrders': instance.completedOrders,
      'completionRate': instance.completionRate,
    };

_$TopDriverImpl _$$TopDriverImplFromJson(Map<String, dynamic> json) =>
    _$TopDriverImpl(
      driverId: json['driverId'] as String,
      name: json['name'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      totalDeliveries: (json['totalDeliveries'] as num).toInt(),
      totalEarnings: (json['totalEarnings'] as num).toDouble(),
      averageRating: (json['averageRating'] as num).toDouble(),
      completionRate: (json['completionRate'] as num).toDouble(),
      onlineHours: (json['onlineHours'] as num).toInt(),
      averageDeliveryTime: (json['averageDeliveryTime'] as num).toDouble(),
    );

Map<String, dynamic> _$$TopDriverImplToJson(_$TopDriverImpl instance) =>
    <String, dynamic>{
      'driverId': instance.driverId,
      'name': instance.name,
      'profileImageUrl': instance.profileImageUrl,
      'totalDeliveries': instance.totalDeliveries,
      'totalEarnings': instance.totalEarnings,
      'averageRating': instance.averageRating,
      'completionRate': instance.completionRate,
      'onlineHours': instance.onlineHours,
      'averageDeliveryTime': instance.averageDeliveryTime,
    };

_$PlatformMetricsImpl _$$PlatformMetricsImplFromJson(
        Map<String, dynamic> json) =>
    _$PlatformMetricsImpl(
      orderFulfillmentRate: (json['orderFulfillmentRate'] as num).toDouble(),
      averageDeliveryTime: (json['averageDeliveryTime'] as num).toDouble(),
      customerSatisfactionScore:
          (json['customerSatisfactionScore'] as num).toDouble(),
      driverUtilizationRate: (json['driverUtilizationRate'] as num).toDouble(),
      restaurantActiveRate: (json['restaurantActiveRate'] as num).toDouble(),
      peakHourEfficiency: (json['peakHourEfficiency'] as num).toDouble(),
      supportTicketsOpen: (json['supportTicketsOpen'] as num).toInt(),
      supportTicketsResolved: (json['supportTicketsResolved'] as num).toInt(),
      systemUptime: (json['systemUptime'] as num).toDouble(),
      apiResponseTime: (json['apiResponseTime'] as num).toDouble(),
    );

Map<String, dynamic> _$$PlatformMetricsImplToJson(
        _$PlatformMetricsImpl instance) =>
    <String, dynamic>{
      'orderFulfillmentRate': instance.orderFulfillmentRate,
      'averageDeliveryTime': instance.averageDeliveryTime,
      'customerSatisfactionScore': instance.customerSatisfactionScore,
      'driverUtilizationRate': instance.driverUtilizationRate,
      'restaurantActiveRate': instance.restaurantActiveRate,
      'peakHourEfficiency': instance.peakHourEfficiency,
      'supportTicketsOpen': instance.supportTicketsOpen,
      'supportTicketsResolved': instance.supportTicketsResolved,
      'systemUptime': instance.systemUptime,
      'apiResponseTime': instance.apiResponseTime,
    };
