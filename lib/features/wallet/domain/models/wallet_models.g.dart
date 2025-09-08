// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletImpl _$$WalletImplFromJson(Map<String, dynamic> json) => _$WalletImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      balance: (json['balance'] as num).toDouble(),
      currency: json['currency'] as String,
      isActive: json['isActive'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$WalletImplToJson(_$WalletImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'balance': instance.balance,
      'currency': instance.currency,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$WalletTransactionImpl _$$WalletTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletTransactionImpl(
      id: json['id'] as String,
      walletId: json['walletId'] as String,
      type: json['type'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      description: json['description'] as String,
      reference: json['reference'] as String?,
      status: json['status'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$WalletTransactionImplToJson(
        _$WalletTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'walletId': instance.walletId,
      'type': instance.type,
      'amount': instance.amount,
      'currency': instance.currency,
      'description': instance.description,
      'reference': instance.reference,
      'status': instance.status,
      'paymentMethod': instance.paymentMethod,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$WalletTopupRequestImpl _$$WalletTopupRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletTopupRequestImpl(
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String,
      reference: json['reference'] as String?,
      paymentMethod: json['paymentMethod'] as String? ?? 'campay',
    );

Map<String, dynamic> _$$WalletTopupRequestImplToJson(
        _$WalletTopupRequestImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'description': instance.description,
      'reference': instance.reference,
      'paymentMethod': instance.paymentMethod,
    };

_$WalletWithdrawRequestImpl _$$WalletWithdrawRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletWithdrawRequestImpl(
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String,
      reference: json['reference'] as String?,
      withdrawMethod: json['withdrawMethod'] as String? ?? 'bank_transfer',
      withdrawDetails: json['withdrawDetails'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$WalletWithdrawRequestImplToJson(
        _$WalletWithdrawRequestImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'description': instance.description,
      'reference': instance.reference,
      'withdrawMethod': instance.withdrawMethod,
      'withdrawDetails': instance.withdrawDetails,
    };

_$WalletResponseImpl _$$WalletResponseImplFromJson(Map<String, dynamic> json) =>
    _$WalletResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Wallet.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$WalletResponseImplToJson(
        _$WalletResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'error': instance.error,
    };

_$WalletTransactionsResponseImpl _$$WalletTransactionsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletTransactionsResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => WalletTransaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as String?,
      pagination: json['pagination'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$WalletTransactionsResponseImplToJson(
        _$WalletTransactionsResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'error': instance.error,
      'pagination': instance.pagination,
    };
