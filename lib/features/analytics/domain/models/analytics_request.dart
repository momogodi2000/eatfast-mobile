import 'analytics_data.dart';

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

  Map<String, dynamic> toJson() {
    return {
      'userType': userType.name,
      'timeRange': timeRange.name,
      if (startDate != null) 'startDate': startDate!.toIso8601String(),
      if (endDate != null) 'endDate': endDate!.toIso8601String(),
      if (filters != null) 'filters': filters,
    };
  }

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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AnalyticsRequest &&
        other.userType == userType &&
        other.timeRange == timeRange &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    return Object.hash(userType, timeRange, startDate, endDate);
  }
}