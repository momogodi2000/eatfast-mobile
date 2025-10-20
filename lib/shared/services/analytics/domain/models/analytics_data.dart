/// Analytics data response model
class AnalyticsData {
  final List<Map<String, dynamic>> cards;
  final List<Map<String, dynamic>> revenueData;
  final List<Map<String, dynamic>> orderTrendData;
  final Map<String, dynamic> performanceMetrics;
  final Map<String, dynamic> customerInsights;
  final DateTime generatedAt;
  final String? error;

  // Additional metrics for advanced analytics
  final Map<String, dynamic> customerMetrics;
  final Map<String, dynamic> restaurantMetrics;
  final Map<String, dynamic> driverMetrics;
  final Map<String, dynamic> adminMetrics;
  final List<Map<String, dynamic>> orderTrends;
  final Map<String, dynamic> activeUsers;

  const AnalyticsData({
    this.cards = const [],
    this.revenueData = const [],
    this.orderTrendData = const [],
    required this.performanceMetrics,
    required this.customerInsights,
    required this.generatedAt,
    this.error,
    this.customerMetrics = const {},
    this.restaurantMetrics = const {},
    this.driverMetrics = const {},
    this.adminMetrics = const {},
    this.orderTrends = const [],
    this.activeUsers = const {},
  });

  factory AnalyticsData.fromJson(Map<String, dynamic> json) {
    return AnalyticsData(
      cards:
          (json['cards'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
      revenueData:
          (json['revenueData'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
      orderTrendData:
          (json['orderTrendData'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
      performanceMetrics:
          json['performanceMetrics'] as Map<String, dynamic>? ?? {},
      customerInsights: json['customerInsights'] as Map<String, dynamic>? ?? {},
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      error: json['error'] as String?,
      customerMetrics: json['customerMetrics'] as Map<String, dynamic>? ?? {},
      restaurantMetrics:
          json['restaurantMetrics'] as Map<String, dynamic>? ?? {},
      driverMetrics: json['driverMetrics'] as Map<String, dynamic>? ?? {},
      adminMetrics: json['adminMetrics'] as Map<String, dynamic>? ?? {},
      orderTrends:
          (json['orderTrends'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
      activeUsers: json['activeUsers'] as Map<String, dynamic>? ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cards': cards,
      'revenueData': revenueData,
      'orderTrendData': orderTrendData,
      'performanceMetrics': performanceMetrics,
      'customerInsights': customerInsights,
      'generatedAt': generatedAt.toIso8601String(),
      'error': error,
      'customerMetrics': customerMetrics,
      'restaurantMetrics': restaurantMetrics,
      'driverMetrics': driverMetrics,
      'adminMetrics': adminMetrics,
      'orderTrends': orderTrends,
      'activeUsers': activeUsers,
    };
  }
}

/// Analytics request model
class AnalyticsRequest {
  final AnalyticsTimeRange timeRange;
  final AnalyticsUserType userType;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<String>? metrics;
  final Map<String, dynamic>? filters;

  const AnalyticsRequest({
    required this.timeRange,
    required this.userType,
    this.startDate,
    this.endDate,
    this.metrics,
    this.filters,
  });

  factory AnalyticsRequest.fromJson(Map<String, dynamic> json) {
    return AnalyticsRequest(
      timeRange: AnalyticsTimeRange.values.firstWhere(
        (e) =>
            e.name == json['timeRange'] ||
            e.toString().split('.').last == json['timeRange'],
        orElse: () => AnalyticsTimeRange.month,
      ),
      userType: AnalyticsUserType.values.firstWhere(
        (e) =>
            e.name == json['userType'] ||
            e.toString().split('.').last == json['userType'],
        orElse: () => AnalyticsUserType.all,
      ),
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'] as String)
          : null,
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'] as String)
          : null,
      metrics: (json['metrics'] as List<dynamic>?)?.cast<String>(),
      filters: json['filters'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timeRange': timeRange.name,
      'userType': userType.name,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'metrics': metrics,
      'filters': filters,
    };
  }
}

/// Analytics time range enum
enum AnalyticsTimeRange {
  today,
  yesterday,
  last7Days,
  last30Days,
  week,
  month,
  lastMonth,
  year,
  custom,
}

extension AnalyticsTimeRangeExtension on AnalyticsTimeRange {
  String get displayName {
    switch (this) {
      case AnalyticsTimeRange.today:
        return 'Aujourd\'hui';
      case AnalyticsTimeRange.yesterday:
        return 'Hier';
      case AnalyticsTimeRange.last7Days:
        return '7 derniers jours';
      case AnalyticsTimeRange.last30Days:
        return '30 derniers jours';
      case AnalyticsTimeRange.week:
        return 'Cette semaine';
      case AnalyticsTimeRange.month:
        return 'Ce mois';
      case AnalyticsTimeRange.lastMonth:
        return 'Mois dernier';
      case AnalyticsTimeRange.year:
        return 'Cette année';
      case AnalyticsTimeRange.custom:
        return 'Personnalisé';
    }
  }
}

/// Analytics user type enum
enum AnalyticsUserType { all, customer, restaurant, driver, admin }

extension AnalyticsUserTypeExtension on AnalyticsUserType {
  String get displayName {
    switch (this) {
      case AnalyticsUserType.all:
        return 'Tous';
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
