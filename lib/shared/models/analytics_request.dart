import 'package:json_annotation/json_annotation.dart';

part 'analytics_request.g.dart';

@JsonSerializable()
class AnalyticsRequest {
  final AnalyticsUserType userType;
  final AnalyticsTimeRange timeRange;
  final DateTime? startDate;
  final DateTime? endDate;
  final Map<String, dynamic>? filters;

  const AnalyticsRequest({
    required this.userType,
    required this.timeRange,
    this.startDate,
    this.endDate,
    this.filters,
  });

  factory AnalyticsRequest.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AnalyticsRequestToJson(this);

  AnalyticsRequest copyWith({
    AnalyticsUserType? userType,
    AnalyticsTimeRange? timeRange,
    DateTime? startDate,
    DateTime? endDate,
    Map<String, dynamic>? filters,
  }) {
    return AnalyticsRequest(
      userType: userType ?? this.userType,
      timeRange: timeRange ?? this.timeRange,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      filters: filters ?? this.filters,
    );
  }
}

enum AnalyticsUserType {
  @JsonValue('all')
  all,
  @JsonValue('customer')
  customer,
  @JsonValue('restaurant')
  restaurant,
  @JsonValue('driver')
  driver,
  @JsonValue('admin')
  admin,
}

enum AnalyticsTimeRange {
  @JsonValue('today')
  today,
  @JsonValue('week')
  week,
  @JsonValue('month')
  month,
  @JsonValue('quarter')
  quarter,
  @JsonValue('year')
  year,
  @JsonValue('custom')
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
