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