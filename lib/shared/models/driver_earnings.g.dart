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
      thisWeekEarnings: (json['thisWeekEarnings'] as num).toDouble(),
      thisMonthEarnings: (json['thisMonthEarnings'] as num).toDouble(),
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => EarningTransaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      todayDeliveries: (json['todayDeliveries'] as num).toInt(),
      weekEarnings: (json['weekEarnings'] as num).toDouble(),
      weekDeliveries: (json['weekDeliveries'] as num).toInt(),
      monthEarnings: (json['monthEarnings'] as num).toDouble(),
      monthDeliveries: (json['monthDeliveries'] as num).toInt(),
      totalDeliveries: (json['totalDeliveries'] as num).toInt(),
      averageRating: (json['averageRating'] as num).toDouble(),
      completionRate: (json['completionRate'] as num).toDouble(),
      hourlyRate: (json['hourlyRate'] as num).toDouble(),
      recentTransactions: (json['recentTransactions'] as List<dynamic>)
          .map((e) => EarningTransaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DriverEarningsImplToJson(
        _$DriverEarningsImpl instance) =>
    <String, dynamic>{
      'driverId': instance.driverId,
      'totalEarnings': instance.totalEarnings,
      'todayEarnings': instance.todayEarnings,
      'thisWeekEarnings': instance.thisWeekEarnings,
      'thisMonthEarnings': instance.thisMonthEarnings,
      'transactions': instance.transactions,
      'todayDeliveries': instance.todayDeliveries,
      'weekEarnings': instance.weekEarnings,
      'weekDeliveries': instance.weekDeliveries,
      'monthEarnings': instance.monthEarnings,
      'monthDeliveries': instance.monthDeliveries,
      'totalDeliveries': instance.totalDeliveries,
      'averageRating': instance.averageRating,
      'completionRate': instance.completionRate,
      'hourlyRate': instance.hourlyRate,
      'recentTransactions': instance.recentTransactions,
    };

_$EarningTransactionImpl _$$EarningTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$EarningTransactionImpl(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      type: $enumDecode(_$EarningTypeEnumMap, json['type']),
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String,
      orderId: json['orderId'] as String?,
      restaurantName: json['restaurantName'] as String?,
    );

Map<String, dynamic> _$$EarningTransactionImplToJson(
        _$EarningTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'type': _$EarningTypeEnumMap[instance.type]!,
      'date': instance.date.toIso8601String(),
      'description': instance.description,
      'orderId': instance.orderId,
      'restaurantName': instance.restaurantName,
    };

const _$EarningTypeEnumMap = {
  EarningType.delivery: 'delivery',
  EarningType.tip: 'tip',
  EarningType.bonus: 'bonus',
  EarningType.incentive: 'incentive',
  EarningType.penalty: 'penalty',
  EarningType.adjustment: 'adjustment',
};
