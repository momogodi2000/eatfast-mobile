
class AnalyticsData {
  final String id;
  final double revenue;
  final int totalOrders;
  final int activeUsers;
  final double averageOrderValue;
  final List<RevenuePoint> revenueData;
  final List<OrderTrendPoint> orderTrends;
  final CustomerInsights customerInsights;
  final PerformanceMetrics performanceMetrics;
  final DateTime generatedAt;

  const AnalyticsData({
    required this.id,
    required this.revenue,
    required this.totalOrders,
    required this.activeUsers,
    required this.averageOrderValue,
    required this.revenueData,
    required this.orderTrends,
    required this.customerInsights,
    required this.performanceMetrics,
    required this.generatedAt,
  });

  factory AnalyticsData.fromJson(Map<String, dynamic> json) {
    return AnalyticsData(
      id: json['id'] as String,
      revenue: (json['revenue'] as num).toDouble(),
      totalOrders: json['totalOrders'] as int,
      activeUsers: json['activeUsers'] as int,
      averageOrderValue: (json['averageOrderValue'] as num).toDouble(),
      revenueData: (json['revenueData'] as List)
          .map((e) => RevenuePoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderTrends: (json['orderTrends'] as List)
          .map((e) => OrderTrendPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      customerInsights: CustomerInsights.fromJson(json['customerInsights'] as Map<String, dynamic>),
      performanceMetrics: PerformanceMetrics.fromJson(json['performanceMetrics'] as Map<String, dynamic>),
      generatedAt: DateTime.parse(json['generatedAt'] as String),
    );
  }
}

class RevenuePoint {
  final DateTime date;
  final double amount;
  final String currency;

  const RevenuePoint({
    required this.date,
    required this.amount,
    required this.currency,
  });

  factory RevenuePoint.fromJson(Map<String, dynamic> json) {
    return RevenuePoint(
      date: DateTime.parse(json['date'] as String),
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
    );
  }
}

class OrderTrendPoint {
  final DateTime date;
  final int count;
  final double value;

  const OrderTrendPoint({
    required this.date,
    required this.count,
    required this.value,
  });

  factory OrderTrendPoint.fromJson(Map<String, dynamic> json) {
    return OrderTrendPoint(
      date: DateTime.parse(json['date'] as String),
      count: json['count'] as int,
      value: (json['value'] as num).toDouble(),
    );
  }
}

class CustomerInsights {
  final int newCustomers;
  final int returningCustomers;
  final double customerRetentionRate;
  final double averageCustomerLifetimeValue;
  final List<CustomerSegment> segments;

  const CustomerInsights({
    required this.newCustomers,
    required this.returningCustomers,
    required this.customerRetentionRate,
    required this.averageCustomerLifetimeValue,
    required this.segments,
  });

  factory CustomerInsights.fromJson(Map<String, dynamic> json) {
    return CustomerInsights(
      newCustomers: json['newCustomers'] as int,
      returningCustomers: json['returningCustomers'] as int,
      customerRetentionRate: (json['customerRetentionRate'] as num).toDouble(),
      averageCustomerLifetimeValue: (json['averageCustomerLifetimeValue'] as num).toDouble(),
      segments: (json['segments'] as List)
          .map((e) => CustomerSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class CustomerSegment {
  final String name;
  final int count;
  final double percentage;
  final double averageSpending;

  const CustomerSegment({
    required this.name,
    required this.count,
    required this.percentage,
    required this.averageSpending,
  });

  factory CustomerSegment.fromJson(Map<String, dynamic> json) {
    return CustomerSegment(
      name: json['name'] as String,
      count: json['count'] as int,
      percentage: (json['percentage'] as num).toDouble(),
      averageSpending: (json['averageSpending'] as num).toDouble(),
    );
  }
}

class PerformanceMetrics {
  final double orderFulfillmentRate;
  final double averageDeliveryTime;
  final double customerSatisfactionScore;
  final int totalDeliveries;
  final int cancelledOrders;
  final double refundRate;

  const PerformanceMetrics({
    required this.orderFulfillmentRate,
    required this.averageDeliveryTime,
    required this.customerSatisfactionScore,
    required this.totalDeliveries,
    required this.cancelledOrders,
    required this.refundRate,
  });

  factory PerformanceMetrics.fromJson(Map<String, dynamic> json) {
    return PerformanceMetrics(
      orderFulfillmentRate: (json['orderFulfillmentRate'] as num).toDouble(),
      averageDeliveryTime: (json['averageDeliveryTime'] as num).toDouble(),
      customerSatisfactionScore: (json['customerSatisfactionScore'] as num).toDouble(),
      totalDeliveries: json['totalDeliveries'] as int,
      cancelledOrders: json['cancelledOrders'] as int,
      refundRate: (json['refundRate'] as num).toDouble(),
    );
  }
}

enum AnalyticsUserType {
  all,
  customer,
  restaurant,
  driver,
  admin,
}

enum AnalyticsTimeRange {
  today,
  week,
  month,
  quarter,
  year,
  custom,
}

extension AnalyticsUserTypeExtension on AnalyticsUserType {
  String get displayName {
    switch (this) {
      case AnalyticsUserType.all:
        return 'Tous les utilisateurs';
      case AnalyticsUserType.customer:
        return 'Clients';
      case AnalyticsUserType.restaurant:
        return 'Restaurants';
      case AnalyticsUserType.driver:
        return 'Livreurs';
      case AnalyticsUserType.admin:
        return 'Administrateurs';
    }
  }
}

extension AnalyticsTimeRangeExtension on AnalyticsTimeRange {
  String get displayName {
    switch (this) {
      case AnalyticsTimeRange.today:
        return 'Aujourd\'hui';
      case AnalyticsTimeRange.week:
        return 'Cette semaine';
      case AnalyticsTimeRange.month:
        return 'Ce mois';
      case AnalyticsTimeRange.quarter:
        return 'Ce trimestre';
      case AnalyticsTimeRange.year:
        return 'Cette année';
      case AnalyticsTimeRange.custom:
        return 'Période personnalisée';
    }
  }

  int get days {
    switch (this) {
      case AnalyticsTimeRange.today:
        return 1;
      case AnalyticsTimeRange.week:
        return 7;
      case AnalyticsTimeRange.month:
        return 30;
      case AnalyticsTimeRange.quarter:
        return 90;
      case AnalyticsTimeRange.year:
        return 365;
      case AnalyticsTimeRange.custom:
        return 30;
    }
  }
}