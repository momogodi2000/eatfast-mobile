import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_earnings.freezed.dart';
part 'driver_earnings.g.dart';

@freezed
class DriverEarnings with _$DriverEarnings {
  const factory DriverEarnings({
    required String driverId,
    required double totalEarnings,
    required double todayEarnings,
    required double weekEarnings,
    required double monthEarnings,
    required int totalDeliveries,
    required int todayDeliveries,
    required int weekDeliveries,
    required int monthDeliveries,
    required double averageRating,
    required double completionRate,
    required int onlineHours,
    required double hourlyRate,
    @Default([]) List<EarningTransaction> recentTransactions,
    @Default([]) List<DailyEarning> dailyBreakdown,
    @Default([]) List<WeeklyEarning> weeklyBreakdown,
    EarningsSummary? currentWeekSummary,
  }) = _DriverEarnings;

  factory DriverEarnings.fromJson(Map<String, dynamic> json) =>
      _$DriverEarningsFromJson(json);
}

@freezed
class EarningTransaction with _$EarningTransaction {
  const factory EarningTransaction({
    required String transactionId,
    required String orderId,
    required DateTime date,
    required double amount,
    required EarningType type,
    required String description,
    String? restaurantName,
    String? customerName,
    double? tip,
    double? bonus,
  }) = _EarningTransaction;

  factory EarningTransaction.fromJson(Map<String, dynamic> json) =>
      _$EarningTransactionFromJson(json);
}

@freezed
class DailyEarning with _$DailyEarning {
  const factory DailyEarning({
    required DateTime date,
    required double earnings,
    required int deliveries,
    required int onlineHours,
    required double rating,
  }) = _DailyEarning;

  factory DailyEarning.fromJson(Map<String, dynamic> json) =>
      _$DailyEarningFromJson(json);
}

@freezed
class WeeklyEarning with _$WeeklyEarning {
  const factory WeeklyEarning({
    required DateTime weekStartDate,
    required double earnings,
    required int deliveries,
    required int onlineHours,
    required double averageRating,
    @Default([]) List<DailyEarning> dailyBreakdown,
  }) = _WeeklyEarning;

  factory WeeklyEarning.fromJson(Map<String, dynamic> json) =>
      _$WeeklyEarningFromJson(json);
}

@freezed
class EarningsSummary with _$EarningsSummary {
  const factory EarningsSummary({
    required double baseEarnings,
    required double tips,
    required double bonuses,
    required double incentives,
    required double penalties,
    required double totalGross,
    required double totalNet,
    required int totalDeliveries,
    required double averagePerDelivery,
  }) = _EarningsSummary;

  factory EarningsSummary.fromJson(Map<String, dynamic> json) =>
      _$EarningsSummaryFromJson(json);
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
  String get displayName {
    switch (this) {
      case EarningType.delivery:
        return 'Livraison';
      case EarningType.tip:
        return 'Pourboire';
      case EarningType.bonus:
        return 'Bonus';
      case EarningType.incentive:
        return 'Incentive';
      case EarningType.penalty:
        return 'Pénalité';
      case EarningType.adjustment:
        return 'Ajustement';
    }
  }

  bool get isPositive {
    return this != EarningType.penalty;
  }
}