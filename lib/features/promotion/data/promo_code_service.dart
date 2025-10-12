/// Promo Code Service
/// Handles promo code validation and application with Express.js backend
library;

import 'package:flutter/foundation.dart';
import '../../../core/services/api/api_client.dart';

class PromoCodeService {
  static final PromoCodeService _instance = PromoCodeService._internal();
  factory PromoCodeService() => _instance;

  final ApiClient _apiClient = ApiClient();

  PromoCodeService._internal();

  /// Validate and apply promo code
  Future<PromoCodeAppliedData> validatePromoCode({
    required String code,
    required String orderId,
    required double orderAmount,
  }) async {
    try {
      final response = await _apiClient.post(
        '/shared/mvp/promo-codes/validate',
        data: {
          'code': code.toUpperCase(),
          'orderId': orderId,
          'orderAmount': orderAmount,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        return PromoCodeAppliedData(
          isValid: true,
          code: code,
          discountAmount: (data['discountAmount'] ?? 0).toDouble(),
          discountType: data['discountType'] ?? 'fixed',
          discountDescription: data['description'] ?? '',
          minimumOrderAmount: (data['minimumOrderAmount'] ?? 0).toDouble(),
          expiryDate: data['expiryDate'] != null
              ? DateTime.parse(data['expiryDate'])
              : null,
        );
      } else {
        return PromoCodeAppliedData(
          isValid: false,
          code: code,
          errorMessage: response.data['message'] ?? 'Code invalide',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error validating promo code: $e');
      return PromoCodeAppliedData(
        isValid: false,
        code: code,
        errorMessage: 'Erreur de validation',
      );
    }
  }

  /// Get available promo codes for user
  Future<List<PromoCodeData>> getAvailablePromoCodes() async {
    try {
      final response = await _apiClient.get(
        '/shared/mvp/promo-codes/available',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['promoCodes'] ?? [];
        return data.map((item) => PromoCodeData.fromJson(item)).toList();
      }
      return [];
    } catch (e) {
      if (kDebugMode) print('Error getting promo codes: $e');
      return [];
    }
  }

  /// Get user's promo code history
  Future<List<PromoCodeUsage>> getPromoCodeHistory() async {
    try {
      final response = await _apiClient.get(
        '/shared/mvp/promo-codes/history',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['history'] ?? [];
        return data.map((item) => PromoCodeUsage.fromJson(item)).toList();
      }
      return [];
    } catch (e) {
      if (kDebugMode) print('Error getting promo code history: $e');
      return [];
    }
  }
}

/// Promo Code Applied Data
class PromoCodeAppliedData {
  final bool isValid;
  final String code;
  final double discountAmount;
  final String discountType;
  final String discountDescription;
  final double minimumOrderAmount;
  final DateTime? expiryDate;
  final String? errorMessage;

  PromoCodeAppliedData({
    required this.isValid,
    required this.code,
    this.discountAmount = 0,
    this.discountType = 'fixed',
    this.discountDescription = '',
    this.minimumOrderAmount = 0,
    this.expiryDate,
    this.errorMessage,
  });
}

/// Promo Code Data Model
class PromoCodeData {
  final String id;
  final String code;
  final String title;
  final String description;
  final String discountType;
  final double discountValue;
  final double minimumOrderAmount;
  final DateTime? expiryDate;
  final int usageLimit;
  final int usedCount;
  final bool isActive;

  PromoCodeData({
    required this.id,
    required this.code,
    required this.title,
    required this.description,
    required this.discountType,
    required this.discountValue,
    required this.minimumOrderAmount,
    this.expiryDate,
    required this.usageLimit,
    required this.usedCount,
    required this.isActive,
  });

  factory PromoCodeData.fromJson(Map<String, dynamic> json) {
    return PromoCodeData(
      id: json['id'] ?? '',
      code: json['code'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      discountType: json['discountType'] ?? 'fixed',
      discountValue: (json['discountValue'] ?? 0).toDouble(),
      minimumOrderAmount: (json['minimumOrderAmount'] ?? 0).toDouble(),
      expiryDate: json['expiryDate'] != null
          ? DateTime.parse(json['expiryDate'])
          : null,
      usageLimit: json['usageLimit'] ?? 0,
      usedCount: json['usedCount'] ?? 0,
      isActive: json['isActive'] ?? true,
    );
  }

  bool get isExpired =>
      expiryDate != null && expiryDate!.isBefore(DateTime.now());
  bool get isAvailable => isActive && !isExpired && usedCount < usageLimit;
}

/// Promo Code Usage Model
class PromoCodeUsage {
  final String id;
  final String code;
  final String orderId;
  final double discountAmount;
  final DateTime usedAt;

  PromoCodeUsage({
    required this.id,
    required this.code,
    required this.orderId,
    required this.discountAmount,
    required this.usedAt,
  });

  factory PromoCodeUsage.fromJson(Map<String, dynamic> json) {
    return PromoCodeUsage(
      id: json['id'] ?? '',
      code: json['code'] ?? '',
      orderId: json['orderId'] ?? '',
      discountAmount: (json['discountAmount'] ?? 0).toDouble(),
      usedAt: DateTime.parse(json['usedAt'] ?? DateTime.now().toIso8601String()),
    );
  }
}
