// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_earnings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriverEarningsImpl _$$DriverEarningsImplFromJson(Map<String, dynamic> json) =>
    _$DriverEarningsImpl(
      driverId: json['driverId'] as String,
      totalEarnings: (json['totalEarnings'] as num).toDouble(),
      todayEarnings: (json['todayEarnings'] as num).toDouble(),
      weekEarnings: (json['weekEarnings'] as num).toDouble(),
      monthEarnings: (json['monthEarnings'] as num).toDouble(),
      totalDeliveries: (json['totalDeliveries'] as num).toInt(),
      todayDeliveries: (json['todayDeliveries'] as num).toInt(),
      weekDeliveries: (json['weekDeliveries'] as num).toInt(),
      monthDeliveries: (json['monthDeliveries'] as num).toInt(),
      averageRating: (json['averageRating'] as num).toDouble(),
      completionRate: (json['completionRate'] as num).toDouble(),
      onlineHours: (json['onlineHours'] as num).toInt(),
      hourlyRate: (json['hourlyRate'] as num).toDouble(),
      recentTransactions: (json['recentTransactions'] as List<dynamic>?)
              ?.map(
                  (e) => EarningTransaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      dailyBreakdown: (json['dailyBreakdown'] as List<dynamic>?)
              ?.map((e) => DailyEarning.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      weeklyBreakdown: (json['weeklyBreakdown'] as List<dynamic>?)
              ?.map((e) => WeeklyEarning.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      currentWeekSummary: json['currentWeekSummary'] == null
          ? null
          : EarningsSummary.fromJson(
              json['currentWeekSummary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DriverEarningsImplToJson(
        _$DriverEarningsImpl instance) =>
    <String, dynamic>{
      'driverId': instance.driverId,
      'totalEarnings': instance.totalEarnings,
      'todayEarnings': instance.todayEarnings,
      'weekEarnings': instance.weekEarnings,
      'monthEarnings': instance.monthEarnings,
      'totalDeliveries': instance.totalDeliveries,
      'todayDeliveries': instance.todayDeliveries,
      'weekDeliveries': instance.weekDeliveries,
      'monthDeliveries': instance.monthDeliveries,
      'averageRating': instance.averageRating,
      'completionRate': instance.completionRate,
      'onlineHours': instance.onlineHours,
      'hourlyRate': instance.hourlyRate,
      'recentTransactions': instance.recentTransactions,
      'dailyBreakdown': instance.dailyBreakdown,
      'weeklyBreakdown': instance.weeklyBreakdown,
      'currentWeekSummary': instance.currentWeekSummary,
    };

_$EarningTransactionImpl _$$EarningTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$EarningTransactionImpl(
      transactionId: json['transactionId'] as String,
      orderId: json['orderId'] as String,
      date: DateTime.parse(json['date'] as String),
      amount: (json['amount'] as num).toDouble(),
      type: $enumDecode(_$EarningTypeEnumMap, json['type']),
      description: json['description'] as String,
      restaurantName: json['restaurantName'] as String?,
      customerName: json['customerName'] as String?,
      tip: (json['tip'] as num?)?.toDouble(),
      bonus: (json['bonus'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$EarningTransactionImplToJson(
        _$EarningTransactionImpl instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'orderId': instance.orderId,
      'date': instance.date.toIso8601String(),
      'amount': instance.amount,
      'type': _$EarningTypeEnumMap[instance.type]!,
      'description': instance.description,
      'restaurantName': instance.restaurantName,
      'customerName': instance.customerName,
      'tip': instance.tip,
      'bonus': instance.bonus,
    };

const _$EarningTypeEnumMap = {
  EarningType.delivery: 'delivery',
  EarningType.tip: 'tip',
  EarningType.bonus: 'bonus',
  EarningType.incentive: 'incentive',
  EarningType.penalty: 'penalty',
  EarningType.adjustment: 'adjustment',
};

_$DailyEarningImpl _$$DailyEarningImplFromJson(Map<String, dynamic> json) =>
    _$DailyEarningImpl(
      date: DateTime.parse(json['date'] as String),
      earnings: (json['earnings'] as num).toDouble(),
      deliveries: (json['deliveries'] as num).toInt(),
      onlineHours: (json['onlineHours'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$$DailyEarningImplToJson(_$DailyEarningImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'earnings': instance.earnings,
      'deliveries': instance.deliveries,
      'onlineHours': instance.onlineHours,
      'rating': instance.rating,
    };

_$WeeklyEarningImpl _$$WeeklyEarningImplFromJson(Map<String, dynamic> json) =>
    _$WeeklyEarningImpl(
      weekStartDate: DateTime.parse(json['weekStartDate'] as String),
      earnings: (json['earnings'] as num).toDouble(),
      deliveries: (json['deliveries'] as num).toInt(),
      onlineHours: (json['onlineHours'] as num).toInt(),
      averageRating: (json['averageRating'] as num).toDouble(),
      dailyBreakdown: (json['dailyBreakdown'] as List<dynamic>?)
              ?.map((e) => DailyEarning.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$WeeklyEarningImplToJson(_$WeeklyEarningImpl instance) =>
    <String, dynamic>{
      'weekStartDate': instance.weekStartDate.toIso8601String(),
      'earnings': instance.earnings,
      'deliveries': instance.deliveries,
      'onlineHours': instance.onlineHours,
      'averageRating': instance.averageRating,
      'dailyBreakdown': instance.dailyBreakdown,
    };

_$EarningsSummaryImpl _$$EarningsSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$EarningsSummaryImpl(
      baseEarnings: (json['baseEarnings'] as num).toDouble(),
      tips: (json['tips'] as num).toDouble(),
      bonuses: (json['bonuses'] as num).toDouble(),
      incentives: (json['incentives'] as num).toDouble(),
      penalties: (json['penalties'] as num).toDouble(),
      totalGross: (json['totalGross'] as num).toDouble(),
      totalNet: (json['totalNet'] as num).toDouble(),
      totalDeliveries: (json['totalDeliveries'] as num).toInt(),
      averagePerDelivery: (json['averagePerDelivery'] as num).toDouble(),
    );

Map<String, dynamic> _$$EarningsSummaryImplToJson(
        _$EarningsSummaryImpl instance) =>
    <String, dynamic>{
      'baseEarnings': instance.baseEarnings,
      'tips': instance.tips,
      'bonuses': instance.bonuses,
      'incentives': instance.incentives,
      'penalties': instance.penalties,
      'totalGross': instance.totalGross,
      'totalNet': instance.totalNet,
      'totalDeliveries': instance.totalDeliveries,
      'averagePerDelivery': instance.averagePerDelivery,
    };
