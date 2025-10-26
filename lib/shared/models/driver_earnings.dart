import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_earnings.freezed.dart';
part 'driver_earnings.g.dart';

@freezed
class DriverEarnings with _$DriverEarnings {
  const factory DriverEarnings({
    required String driverId,
    required double totalEarnings,
    required double todayEarnings,
    required double thisWeekEarnings,
    required double thisMonthEarnings,
    required List<EarningTransaction> transactions,
    // Additional fields
    required int todayDeliveries,
    required double weekEarnings,
    required int weekDeliveries,
    required double monthEarnings,
    required int monthDeliveries,
    required int totalDeliveries,
    required double averageRating,
    required double completionRate,
    required double hourlyRate,
    required List<EarningTransaction> recentTransactions,
  }) = _DriverEarnings;

  factory DriverEarnings.fromJson(Map<String, dynamic> json) =>
      _$DriverEarningsFromJson(json);
}

@freezed
class EarningTransaction with _$EarningTransaction {
  const factory EarningTransaction({
    required String id,
    required double amount,
    required EarningType type,
    required DateTime date,
    required String description,
    String? orderId,
    String? restaurantName,
  }) = _EarningTransaction;

  factory EarningTransaction.fromJson(Map<String, dynamic> json) =>
      _$EarningTransactionFromJson(json);
}

enum EarningType {
  @JsonValue('delivery')
  delivery,
  @JsonValue('tip')
  tip,
  @JsonValue('bonus')
  bonus,
  @JsonValue('incentive')
  incentive,
  @JsonValue('penalty')
  penalty,
  @JsonValue('adjustment')
  adjustment,
}

extension EarningTypeExtension on EarningType {
  bool get isPositive {
    switch (this) {
      case EarningType.delivery:
      case EarningType.tip:
      case EarningType.bonus:
      case EarningType.incentive:
        return true;
      case EarningType.penalty:
      case EarningType.adjustment:
        return false;
    }
  }

  String get displayName {
    switch (this) {
      case EarningType.delivery:
        return 'Delivery';
      case EarningType.tip:
        return 'Tip';
      case EarningType.bonus:
        return 'Bonus';
      case EarningType.incentive:
        return 'Incentive';
      case EarningType.penalty:
        return 'Penalty';
      case EarningType.adjustment:
        return 'Adjustment';
    }
  }
}

/// Earnings Summary - simplified version for quick stats
class EarningsSummary {
  final double totalEarnings;
  final double todayEarnings;
  final double weekEarnings;
  final double monthEarnings;
  final int deliveries;
  final int todayDeliveries;
  final double onlineHours;
  final double rating;

  const EarningsSummary({
    this.totalEarnings = 0.0,
    this.todayEarnings = 0.0,
    this.weekEarnings = 0.0,
    this.monthEarnings = 0.0,
    this.deliveries = 0,
    this.todayDeliveries = 0,
    this.onlineHours = 0.0,
    this.rating = 0.0,
  });

  factory EarningsSummary.fromJson(Map<String, dynamic> json) {
    return EarningsSummary(
      totalEarnings: (json['totalEarnings'] as num?)?.toDouble() ?? 0.0,
      todayEarnings: (json['todayEarnings'] as num?)?.toDouble() ?? 0.0,
      weekEarnings: (json['weekEarnings'] as num?)?.toDouble() ?? 0.0,
      monthEarnings: (json['monthEarnings'] as num?)?.toDouble() ?? 0.0,
      deliveries: json['deliveries'] as int? ?? 0,
      todayDeliveries: json['todayDeliveries'] as int? ?? 0,
      onlineHours: (json['onlineHours'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalEarnings': totalEarnings,
      'todayEarnings': todayEarnings,
      'weekEarnings': weekEarnings,
      'monthEarnings': monthEarnings,
      'deliveries': deliveries,
      'todayDeliveries': todayDeliveries,
      'onlineHours': onlineHours,
      'rating': rating,
    };
  }
}

/// Driver Weekly Stat - for tracking daily/weekly performance
class DriverWeeklyStat {
  final int deliveries;
  final double earnings;
  final int onlineHours;
  final double rating;
  final DateTime? date;

  const DriverWeeklyStat({
    this.deliveries = 0,
    this.earnings = 0.0,
    this.onlineHours = 0,
    this.rating = 0.0,
    this.date,
  });

  factory DriverWeeklyStat.fromJson(Map<String, dynamic> json) {
    return DriverWeeklyStat(
      deliveries: json['deliveries'] as int? ?? 0,
      earnings: (json['earnings'] as num?)?.toDouble() ?? 0.0,
      onlineHours: json['onlineHours'] as int? ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      date: json['date'] != null ? DateTime.parse(json['date'] as String) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deliveries': deliveries,
      'earnings': earnings,
      'onlineHours': onlineHours,
      'rating': rating,
      if (date != null) 'date': date!.toIso8601String(),
    };
  }
}