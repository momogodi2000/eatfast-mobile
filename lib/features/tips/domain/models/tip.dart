class Tip {
  final String id;
  final String orderId;
  final String driverId;
  final String driverName;
  final double amount;
  final TipType type;
  final DateTime createdAt;
  final TipStatus status;
  final String? message;

  const Tip({
    required this.id,
    required this.orderId,
    required this.driverId,
    required this.driverName,
    required this.amount,
    required this.type,
    required this.createdAt,
    this.status = TipStatus.pending,
    this.message,
  });

  factory Tip.fromJson(Map<String, dynamic> json) {
    return Tip(
      id: json['id'],
      orderId: json['orderId'],
      driverId: json['driverId'],
      driverName: json['driverName'],
      amount: (json['amount'] as num).toDouble(),
      type: TipType.values.firstWhere(
        (t) => t.name == json['type'],
        orElse: () => TipType.percentage,
      ),
      createdAt: DateTime.parse(json['createdAt']),
      status: TipStatus.values.firstWhere(
        (s) => s.name == json['status'],
        orElse: () => TipStatus.pending,
      ),
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderId': orderId,
      'driverId': driverId,
      'driverName': driverName,
      'amount': amount,
      'type': type.name,
      'createdAt': createdAt.toIso8601String(),
      'status': status.name,
      'message': message,
    };
  }

  Tip copyWith({
    String? id,
    String? orderId,
    String? driverId,
    String? driverName,
    double? amount,
    TipType? type,
    DateTime? createdAt,
    TipStatus? status,
    String? message,
  }) {
    return Tip(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      driverId: driverId ?? this.driverId,
      driverName: driverName ?? this.driverName,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  String get formattedAmount {
    return '${amount.toInt()} FCFA';
  }
}

enum TipType {
  percentage,
  fixed;

  String get displayName {
    switch (this) {
      case TipType.percentage:
        return 'Pourcentage';
      case TipType.fixed:
        return 'Montant fixe';
    }
  }
}

enum TipStatus {
  pending,
  completed,
  failed,
  refunded;

  String get displayName {
    switch (this) {
      case TipStatus.pending:
        return 'En attente';
      case TipStatus.completed:
        return 'Complété';
      case TipStatus.failed:
        return 'Échec';
      case TipStatus.refunded:
        return 'Remboursé';
    }
  }
}

class TipOption {
  final String label;
  final TipType type;
  final double value;
  final bool isCustom;

  const TipOption({
    required this.label,
    required this.type,
    required this.value,
    this.isCustom = false,
  });

  double calculateAmount(double orderTotal) {
    switch (type) {
      case TipType.percentage:
        return orderTotal * (value / 100);
      case TipType.fixed:
        return value;
    }
  }

  String getDisplayText(double orderTotal) {
    if (isCustom) return label;
    
    switch (type) {
      case TipType.percentage:
        final amount = calculateAmount(orderTotal);
        return '$label (${amount.toInt()} FCFA)';
      case TipType.fixed:
        return '$label (${value.toInt()} FCFA)';
    }
  }
}

class TipCalculation {
  final double orderTotal;
  final double deliveryFee;
  final TipOption? selectedOption;
  final double customAmount;
  
  const TipCalculation({
    required this.orderTotal,
    required this.deliveryFee,
    this.selectedOption,
    this.customAmount = 0.0,
  });

  double get tipAmount {
    if (selectedOption != null && !selectedOption!.isCustom) {
      return selectedOption!.calculateAmount(orderTotal);
    }
    return customAmount;
  }

  double get totalWithTip {
    return orderTotal + deliveryFee + tipAmount;
  }

  bool get isValid {
    return tipAmount >= 0 && tipAmount <= (orderTotal * 0.5); // Max 50% tip
  }

  String get formattedTip {
    return '${tipAmount.toInt()} FCFA';
  }

  String get formattedTotal {
    return '${totalWithTip.toInt()} FCFA';
  }
}
