/// Fraud Detection Models
library;

/// Fraud alert model
class FraudAlert {
  final String id;
  final String userId;
  final String? orderId;
  final FraudAlertType type;
  final FraudAlertSeverity severity;
  final FraudAlertStatus status;
  final String description;
  final Map<String, dynamic> details;
  final double riskScore;
  final DateTime createdAt;
  final DateTime? resolvedAt;

  const FraudAlert({
    required this.id,
    required this.userId,
    this.orderId,
    required this.type,
    required this.severity,
    required this.status,
    required this.description,
    required this.details,
    required this.riskScore,
    required this.createdAt,
    this.resolvedAt,
  });

  factory FraudAlert.fromJson(Map<String, dynamic> json) {
    return FraudAlert(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      orderId: json['orderId'],
      type: FraudAlertType.fromString(json['type'] ?? 'suspicious_activity'),
      severity: FraudAlertSeverity.fromString(json['severity'] ?? 'low'),
      status: FraudAlertStatus.fromString(json['status'] ?? 'pending'),
      description: json['description'] ?? '',
      details: json['details'] ?? {},
      riskScore: (json['riskScore'] ?? 0).toDouble(),
      createdAt: DateTime.parse(
        json['createdAt'] ?? DateTime.now().toIso8601String(),
      ),
      resolvedAt: json['resolvedAt'] != null
          ? DateTime.parse(json['resolvedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      if (orderId != null) 'orderId': orderId,
      'type': type.value,
      'severity': severity.value,
      'status': status.value,
      'description': description,
      'details': details,
      'riskScore': riskScore,
      'createdAt': createdAt.toIso8601String(),
      if (resolvedAt != null) 'resolvedAt': resolvedAt!.toIso8601String(),
    };
  }
}

/// Fraud pattern model
class FraudPattern {
  final String id;
  final String name;
  final String description;
  final FraudPatternType type;
  final Map<String, dynamic> rules;
  final int matchCount;
  final bool isActive;
  final DateTime createdAt;

  const FraudPattern({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.rules,
    this.matchCount = 0,
    this.isActive = true,
    required this.createdAt,
  });

  factory FraudPattern.fromJson(Map<String, dynamic> json) {
    return FraudPattern(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      type: FraudPatternType.fromString(json['type'] ?? 'behavioral'),
      rules: json['rules'] ?? {},
      matchCount: json['matchCount'] ?? 0,
      isActive: json['isActive'] ?? true,
      createdAt: DateTime.parse(
        json['createdAt'] ?? DateTime.now().toIso8601String(),
      ),
    );
  }
}

/// Risk assessment model
class RiskAssessment {
  final String id;
  final String entityId;
  final RiskEntityType entityType;
  final double riskScore;
  final RiskLevel riskLevel;
  final List<String> riskFactors;
  final Map<String, dynamic> analysis;
  final DateTime assessedAt;

  const RiskAssessment({
    required this.id,
    required this.entityId,
    required this.entityType,
    required this.riskScore,
    required this.riskLevel,
    required this.riskFactors,
    required this.analysis,
    required this.assessedAt,
  });

  factory RiskAssessment.fromJson(Map<String, dynamic> json) {
    return RiskAssessment(
      id: json['id'] ?? '',
      entityId: json['entityId'] ?? '',
      entityType: RiskEntityType.fromString(json['entityType'] ?? 'user'),
      riskScore: (json['riskScore'] ?? 0).toDouble(),
      riskLevel: RiskLevel.fromString(json['riskLevel'] ?? 'low'),
      riskFactors:
          (json['riskFactors'] as List<dynamic>?)
              ?.map((f) => f.toString())
              .toList() ??
          [],
      analysis: json['analysis'] ?? {},
      assessedAt: DateTime.parse(
        json['assessedAt'] ?? DateTime.now().toIso8601String(),
      ),
    );
  }
}

/// Fraud alert type enum
enum FraudAlertType {
  suspiciousActivity('suspicious_activity'),
  multipleFailedPayments('multiple_failed_payments'),
  unusualOrderPattern('unusual_order_pattern'),
  accountTakeover('account_takeover'),
  paymentMismatch('payment_mismatch');

  const FraudAlertType(this.value);
  final String value;

  static FraudAlertType fromString(String value) {
    return FraudAlertType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => FraudAlertType.suspiciousActivity,
    );
  }
}

/// Fraud alert severity enum
enum FraudAlertSeverity {
  low('low'),
  medium('medium'),
  high('high'),
  critical('critical');

  const FraudAlertSeverity(this.value);
  final String value;

  static FraudAlertSeverity fromString(String value) {
    return FraudAlertSeverity.values.firstWhere(
      (severity) => severity.value == value,
      orElse: () => FraudAlertSeverity.low,
    );
  }
}

/// Fraud alert status enum
enum FraudAlertStatus {
  pending('pending'),
  investigating('investigating'),
  resolved('resolved'),
  falsePositive('false_positive');

  const FraudAlertStatus(this.value);
  final String value;

  static FraudAlertStatus fromString(String value) {
    return FraudAlertStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => FraudAlertStatus.pending,
    );
  }
}

/// Fraud pattern type enum
enum FraudPatternType {
  behavioral('behavioral'),
  transactional('transactional'),
  geographical('geographical'),
  temporal('temporal');

  const FraudPatternType(this.value);
  final String value;

  static FraudPatternType fromString(String value) {
    return FraudPatternType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => FraudPatternType.behavioral,
    );
  }
}

/// Risk entity type enum
enum RiskEntityType {
  user('user'),
  order('order'),
  payment('payment'),
  transaction('transaction');

  const RiskEntityType(this.value);
  final String value;

  static RiskEntityType fromString(String value) {
    return RiskEntityType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => RiskEntityType.user,
    );
  }
}

/// Risk level enum
enum RiskLevel {
  low('low'),
  medium('medium'),
  high('high'),
  critical('critical');

  const RiskLevel(this.value);
  final String value;

  static RiskLevel fromString(String value) {
    return RiskLevel.values.firstWhere(
      (level) => level.value == value,
      orElse: () => RiskLevel.low,
    );
  }
}
