import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class FraudAlert {
  final String id;
  final String title;
  final String description;
  final FraudAlertSeverity severity;
  final FraudAlertType type;
  final FraudAlertStatus status;
  final DateTime timestamp;
  final Map<String, dynamic> metadata;
  final String? orderId;
  final String? userId;
  final String? restaurantId;
  final String? driverId;
  final List<String>? affectedEntities;
  final String? riskScore;
  final Map<String, dynamic>? riskFactors;

  const FraudAlert({
    required this.id,
    required this.title,
    required this.description,
    required this.severity,
    required this.type,
    required this.status,
    required this.timestamp,
    required this.metadata,
    this.orderId,
    this.userId,
    this.restaurantId,
    this.driverId,
    this.affectedEntities,
    this.riskScore,
    this.riskFactors,
  });

  factory FraudAlert.fromJson(Map<String, dynamic> json) {
    return FraudAlert(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      severity: FraudAlertSeverity.values.firstWhere((e) => e.name == json['severity']),
      type: FraudAlertType.values.firstWhere((e) => e.name == json['type']),
      status: FraudAlertStatus.values.firstWhere((e) => e.name == json['status']),
      timestamp: DateTime.parse(json['timestamp'] as String),
      metadata: json['metadata'] as Map<String, dynamic>,
      orderId: json['orderId'] as String?,
      userId: json['userId'] as String?,
      restaurantId: json['restaurantId'] as String?,
      driverId: json['driverId'] as String?,
      affectedEntities: json['affectedEntities'] != null
          ? (json['affectedEntities'] as List<dynamic>).cast<String>()
          : null,
      riskScore: json['riskScore'] as String?,
      riskFactors: json['riskFactors'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'severity': severity.name,
      'type': type.name,
      'status': status.name,
      'timestamp': timestamp.toIso8601String(),
      'metadata': metadata,
      if (orderId != null) 'orderId': orderId,
      if (userId != null) 'userId': userId,
      if (restaurantId != null) 'restaurantId': restaurantId,
      if (driverId != null) 'driverId': driverId,
      if (affectedEntities != null) 'affectedEntities': affectedEntities,
      if (riskScore != null) 'riskScore': riskScore,
      if (riskFactors != null) 'riskFactors': riskFactors,
    };
  }

  double get riskLevel {
    if (riskScore == null) return 0.0;
    try {
      return double.parse(riskScore!);
    } catch (e) {
      return 0.0;
    }
  }

  DateTime get detectedAt => timestamp;

  FraudAlert copyWith({
    String? id,
    String? title,
    String? description,
    FraudAlertSeverity? severity,
    FraudAlertType? type,
    FraudAlertStatus? status,
    DateTime? timestamp,
    Map<String, dynamic>? metadata,
    String? orderId,
    String? userId,
    String? restaurantId,
    String? driverId,
    List<String>? affectedEntities,
    String? riskScore,
    Map<String, dynamic>? riskFactors,
  }) {
    return FraudAlert(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      severity: severity ?? this.severity,
      type: type ?? this.type,
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp,
      metadata: metadata ?? this.metadata,
      orderId: orderId ?? this.orderId,
      userId: userId ?? this.userId,
      restaurantId: restaurantId ?? this.restaurantId,
      driverId: driverId ?? this.driverId,
      affectedEntities: affectedEntities ?? this.affectedEntities,
      riskScore: riskScore ?? this.riskScore,
      riskFactors: riskFactors ?? this.riskFactors,
    );
  }
}

class FraudPattern {
  final String id;
  final String name;
  final String description;
  final FraudPatternType type;
  final List<String> indicators;
  final double riskWeight;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Map<String, dynamic>? configuration;

  const FraudPattern({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.indicators,
    required this.riskWeight,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.configuration,
  });

  factory FraudPattern.fromJson(Map<String, dynamic> json) {
    return FraudPattern(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      type: FraudPatternType.values.firstWhere((e) => e.name == json['type']),
      indicators: (json['indicators'] as List<dynamic>).cast<String>(),
      riskWeight: (json['riskWeight'] as num).toDouble(),
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      configuration: json['configuration'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type.name,
      'indicators': indicators,
      'riskWeight': riskWeight,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      if (configuration != null) 'configuration': configuration,
    };
  }

  FraudPattern copyWith({
    String? id,
    String? name,
    String? description,
    FraudPatternType? type,
    List<String>? indicators,
    double? riskWeight,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, dynamic>? configuration,
  }) {
    return FraudPattern(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      indicators: indicators ?? this.indicators,
      riskWeight: riskWeight ?? this.riskWeight,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      configuration: configuration ?? this.configuration,
    );
  }
}

class RiskAssessment {
  final String id;
  final String entityId;
  final RiskEntityType entityType;
  final double riskScore;
  final RiskLevel riskLevel;
  final List<RiskFactor> riskFactors;
  final DateTime assessedAt;
  final String? recommendation;
  final Map<String, dynamic>? metadata;

  const RiskAssessment({
    required this.id,
    required this.entityId,
    required this.entityType,
    required this.riskScore,
    required this.riskLevel,
    required this.riskFactors,
    required this.assessedAt,
    this.recommendation,
    this.metadata,
  });

  factory RiskAssessment.fromJson(Map<String, dynamic> json) {
    return RiskAssessment(
      id: json['id'] as String,
      entityId: json['entityId'] as String,
      entityType: RiskEntityType.values.firstWhere((e) => e.name == json['entityType']),
      riskScore: (json['riskScore'] as num).toDouble(),
      riskLevel: RiskLevel.values.firstWhere((e) => e.name == json['riskLevel']),
      riskFactors: (json['riskFactors'] as List<dynamic>)
          .map((e) => RiskFactor.fromJson(e as Map<String, dynamic>))
          .toList(),
      assessedAt: DateTime.parse(json['assessedAt'] as String),
      recommendation: json['recommendation'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'entityId': entityId,
      'entityType': entityType.name,
      'riskScore': riskScore,
      'riskLevel': riskLevel.name,
      'riskFactors': riskFactors.map((e) => e.toJson()).toList(),
      'assessedAt': assessedAt.toIso8601String(),
      if (recommendation != null) 'recommendation': recommendation,
      if (metadata != null) 'metadata': metadata,
    };
  }

  RiskAssessment copyWith({
    String? id,
    String? entityId,
    RiskEntityType? entityType,
    double? riskScore,
    RiskLevel? riskLevel,
    List<RiskFactor>? riskFactors,
    DateTime? assessedAt,
    String? recommendation,
    Map<String, dynamic>? metadata,
  }) {
    return RiskAssessment(
      id: id ?? this.id,
      entityId: entityId ?? this.entityId,
      entityType: entityType ?? this.entityType,
      riskScore: riskScore ?? this.riskScore,
      riskLevel: riskLevel ?? this.riskLevel,
      riskFactors: riskFactors ?? this.riskFactors,
      assessedAt: assessedAt ?? this.assessedAt,
      recommendation: recommendation ?? this.recommendation,
      metadata: metadata ?? this.metadata,
    );
  }
}

class RiskFactor {
  final String name;
  final String description;
  final double weight;
  final double score;
  final RiskFactorType type;
  final Map<String, dynamic>? details;

  const RiskFactor({
    required this.name,
    required this.description,
    required this.weight,
    required this.score,
    required this.type,
    this.details,
  });

  factory RiskFactor.fromJson(Map<String, dynamic> json) {
    return RiskFactor(
      name: json['name'] as String,
      description: json['description'] as String,
      weight: (json['weight'] as num).toDouble(),
      score: (json['score'] as num).toDouble(),
      type: RiskFactorType.values.firstWhere((e) => e.name == json['type']),
      details: json['details'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'weight': weight,
      'score': score,
      'type': type.name,
      if (details != null) 'details': details,
    };
  }

  RiskFactor copyWith({
    String? name,
    String? description,
    double? weight,
    double? score,
    RiskFactorType? type,
    Map<String, dynamic>? details,
  }) {
    return RiskFactor(
      name: name ?? this.name,
      description: description ?? this.description,
      weight: weight ?? this.weight,
      score: score ?? this.score,
      type: type ?? this.type,
      details: details ?? this.details,
    );
  }
}

enum FraudAlertSeverity {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('critical')
  critical,
}

enum FraudAlertType {
  @JsonValue('payment_fraud')
  paymentFraud,
  @JsonValue('account_takeover')
  accountTakeover,
  @JsonValue('fake_order')
  fakeOrder,
  @JsonValue('delivery_manipulation')
  deliveryManipulation,
  @JsonValue('rating_manipulation')
  ratingManipulation,
  @JsonValue('refund_abuse')
  refundAbuse,
  @JsonValue('promo_abuse')
  promoAbuse,
  @JsonValue('suspicious_activity')
  suspiciousActivity,
}

enum FraudAlertStatus {
  @JsonValue('new')
  newAlert,
  @JsonValue('pending')
  pending,
  @JsonValue('investigating')
  investigating,
  @JsonValue('resolved')
  resolved,
  @JsonValue('false_positive')
  falsePositive,
  @JsonValue('escalated')
  escalated,
}

enum FraudPatternType {
  @JsonValue('behavioral')
  behavioral,
  @JsonValue('transactional')
  transactional,
  @JsonValue('device_fingerprint')
  deviceFingerprint,
  @JsonValue('geolocation')
  geolocation,
  @JsonValue('velocity')
  velocity,
}

enum RiskEntityType {
  @JsonValue('user')
  user,
  @JsonValue('order')
  order,
  @JsonValue('payment')
  payment,
  @JsonValue('restaurant')
  restaurant,
  @JsonValue('driver')
  driver,
}

enum RiskLevel {
  @JsonValue('very_low')
  veryLow,
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('very_high')
  veryHigh,
}

enum RiskFactorType {
  @JsonValue('behavioral')
  behavioral,
  @JsonValue('transaction')
  transaction,
  @JsonValue('device')
  device,
  @JsonValue('location')
  location,
  @JsonValue('temporal')
  temporal,
}

enum FraudRiskLevel {
  @JsonValue('very_low')
  veryLow,
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('critical')
  critical,
}

extension FraudAlertSeverityExtension on FraudAlertSeverity {
  String get displayName {
    switch (this) {
      case FraudAlertSeverity.low:
        return 'Faible';
      case FraudAlertSeverity.medium:
        return 'Moyen';
      case FraudAlertSeverity.high:
        return 'Élevé';
      case FraudAlertSeverity.critical:
        return 'Critique';
    }
  }

  Color get color {
    switch (this) {
      case FraudAlertSeverity.low:
        return Colors.green;
      case FraudAlertSeverity.medium:
        return Colors.orange;
      case FraudAlertSeverity.high:
        return Colors.red;
      case FraudAlertSeverity.critical:
        return Colors.purple;
    }
  }

  IconData get icon {
    switch (this) {
      case FraudAlertSeverity.low:
        return Icons.info;
      case FraudAlertSeverity.medium:
        return Icons.warning;
      case FraudAlertSeverity.high:
        return Icons.error;
      case FraudAlertSeverity.critical:
        return Icons.dangerous;
    }
  }
}

extension FraudAlertTypeExtension on FraudAlertType {
  String get displayName {
    switch (this) {
      case FraudAlertType.paymentFraud:
        return 'Fraude de paiement';
      case FraudAlertType.accountTakeover:
        return 'Piratage de compte';
      case FraudAlertType.fakeOrder:
        return 'Commande fictive';
      case FraudAlertType.deliveryManipulation:
        return 'Manipulation de livraison';
      case FraudAlertType.ratingManipulation:
        return 'Manipulation de notes';
      case FraudAlertType.refundAbuse:
        return 'Abus de remboursement';
      case FraudAlertType.promoAbuse:
        return 'Abus de promotion';
      case FraudAlertType.suspiciousActivity:
        return 'Activité suspecte';
    }
  }

  IconData get icon {
    switch (this) {
      case FraudAlertType.paymentFraud:
        return Icons.payment;
      case FraudAlertType.accountTakeover:
        return Icons.security;
      case FraudAlertType.fakeOrder:
        return Icons.receipt;
      case FraudAlertType.deliveryManipulation:
        return Icons.local_shipping;
      case FraudAlertType.ratingManipulation:
        return Icons.star;
      case FraudAlertType.refundAbuse:
        return Icons.money_off;
      case FraudAlertType.promoAbuse:
        return Icons.local_offer;
      case FraudAlertType.suspiciousActivity:
        return Icons.warning;
    }
  }
}

extension RiskLevelExtension on RiskLevel {
  String get displayName {
    switch (this) {
      case RiskLevel.veryLow:
        return 'Très faible';
      case RiskLevel.low:
        return 'Faible';
      case RiskLevel.medium:
        return 'Moyen';
      case RiskLevel.high:
        return 'Élevé';
      case RiskLevel.veryHigh:
        return 'Très élevé';
    }
  }

  Color get color {
    switch (this) {
      case RiskLevel.veryLow:
        return Colors.green.shade700;
      case RiskLevel.low:
        return Colors.green;
      case RiskLevel.medium:
        return Colors.orange;
      case RiskLevel.high:
        return Colors.red;
      case RiskLevel.veryHigh:
        return Colors.red.shade900;
    }
  }
}

extension FraudRiskLevelExtension on FraudRiskLevel {
  String get displayName {
    switch (this) {
      case FraudRiskLevel.veryLow:
        return 'Très faible';
      case FraudRiskLevel.low:
        return 'Faible';
      case FraudRiskLevel.medium:
        return 'Moyen';
      case FraudRiskLevel.high:
        return 'Élevé';
      case FraudRiskLevel.critical:
        return 'Critique';
    }
  }

  Color get color {
    switch (this) {
      case FraudRiskLevel.veryLow:
        return Colors.green.shade700;
      case FraudRiskLevel.low:
        return Colors.green;
      case FraudRiskLevel.medium:
        return Colors.orange;
      case FraudRiskLevel.high:
        return Colors.red;
      case FraudRiskLevel.critical:
        return Colors.red.shade900;
    }
  }
}