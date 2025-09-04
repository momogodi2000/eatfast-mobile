import 'package:flutter_test/flutter_test.dart';
import 'package:eatfast_mobile/features/tips/domain/models/tip.dart';

void main() {
  group('Tip Model Tests', () {
    late Tip testTip;

    setUp(() {
      testTip = Tip(
        id: 'tip_1',
        orderId: 'order_123',
        driverId: 'driver_1',
        driverName: 'Jean Mbeki',
        amount: 1500,
        type: TipType.percentage,
        createdAt: DateTime.parse('2024-01-15T14:30:00Z'),
        status: TipStatus.completed,
        message: 'Great delivery service!',
      );
    });

    test('should create Tip from JSON correctly', () {
      final json = {
        'id': 'tip_1',
        'orderId': 'order_123',
        'driverId': 'driver_1',
        'driverName': 'Jean Mbeki',
        'amount': 1500.0,
        'type': 'percentage',
        'createdAt': '2024-01-15T14:30:00Z',
        'status': 'completed',
        'message': 'Great delivery service!',
      };

      final tip = Tip.fromJson(json);

      expect(tip.id, 'tip_1');
      expect(tip.driverName, 'Jean Mbeki');
      expect(tip.amount, 1500);
      expect(tip.type, TipType.percentage);
      expect(tip.status, TipStatus.completed);
      expect(tip.message, 'Great delivery service!');
    });

    test('should convert Tip to JSON correctly', () {
      final json = testTip.toJson();

      expect(json['id'], 'tip_1');
      expect(json['driverName'], 'Jean Mbeki');
      expect(json['amount'], 1500);
      expect(json['type'], 'percentage');
      expect(json['status'], 'completed');
      expect(json['message'], 'Great delivery service!');
    });

    test('should format amount correctly', () {
      expect(testTip.formattedAmount, '1500 FCFA');
    });

    test('should create copy with updated values', () {
      final updatedTip = testTip.copyWith(
        amount: 2000,
        status: TipStatus.pending,
        message: 'Updated message',
      );

      expect(updatedTip.amount, 2000);
      expect(updatedTip.status, TipStatus.pending);
      expect(updatedTip.message, 'Updated message');
      // Other values should remain the same
      expect(updatedTip.id, testTip.id);
      expect(updatedTip.driverName, testTip.driverName);
      expect(updatedTip.createdAt, testTip.createdAt);
    });
  });

  group('TipType Enum Tests', () {
    test('should have correct display names', () {
      expect(TipType.percentage.displayName, 'Pourcentage');
      expect(TipType.fixed.displayName, 'Montant fixe');
    });
  });

  group('TipStatus Enum Tests', () {
    test('should have correct display names', () {
      expect(TipStatus.pending.displayName, 'En attente');
      expect(TipStatus.completed.displayName, 'Complété');
      expect(TipStatus.failed.displayName, 'Échec');
      expect(TipStatus.refunded.displayName, 'Remboursé');
    });
  });

  group('TipOption Model Tests', () {
    test('should calculate percentage amount correctly', () {
      const percentageOption = TipOption(
        label: '15%',
        type: TipType.percentage,
        value: 15,
      );

      const orderTotal = 5000.0;
      final amount = percentageOption.calculateAmount(orderTotal);

      expect(amount, 750.0); // 15% of 5000
    });

    test('should calculate fixed amount correctly', () {
      const fixedOption = TipOption(
        label: '1000 FCFA',
        type: TipType.fixed,
        value: 1000,
      );

      const orderTotal = 5000.0;
      final amount = fixedOption.calculateAmount(orderTotal);

      expect(amount, 1000.0);
    });

    test('should display text correctly for percentage', () {
      const percentageOption = TipOption(
        label: '20%',
        type: TipType.percentage,
        value: 20,
      );

      const orderTotal = 3000.0;
      final displayText = percentageOption.getDisplayText(orderTotal);

      expect(displayText, '20% (600 FCFA)');
    });

    test('should display text correctly for fixed amount', () {
      const fixedOption = TipOption(
        label: '500 FCFA',
        type: TipType.fixed,
        value: 500,
      );

      const orderTotal = 3000.0;
      final displayText = fixedOption.getDisplayText(orderTotal);

      expect(displayText, '500 FCFA (500 FCFA)');
    });

    test('should display text correctly for custom option', () {
      const customOption = TipOption(
        label: 'Custom',
        type: TipType.fixed,
        value: 0,
        isCustom: true,
      );

      const orderTotal = 3000.0;
      final displayText = customOption.getDisplayText(orderTotal);

      expect(displayText, 'Custom');
    });
  });

  group('TipCalculation Model Tests', () {
    late TipCalculation testCalculation;
    late TipOption percentageOption;

    setUp(() {
      percentageOption = const TipOption(
        label: '15%',
        type: TipType.percentage,
        value: 15,
      );

      testCalculation = TipCalculation(
        orderTotal: 4000,
        deliveryFee: 500,
        selectedOption: percentageOption,
        customAmount: 0,
      );
    });

    test('should calculate tip amount correctly for percentage', () {
      expect(testCalculation.tipAmount, 600.0); // 15% of 4000
    });

    test('should calculate tip amount correctly for fixed option', () {
      const fixedOption = TipOption(
        label: '1000 FCFA',
        type: TipType.fixed,
        value: 1000,
      );

      final fixedCalculation = TipCalculation(
        orderTotal: 4000,
        deliveryFee: 500,
        selectedOption: fixedOption,
        customAmount: 0,
      );

      expect(fixedCalculation.tipAmount, 1000.0);
    });

    test('should calculate tip amount correctly for custom amount', () {
      const customOption = TipOption(
        label: 'Custom',
        type: TipType.fixed,
        value: 0,
        isCustom: true,
      );

      final customCalculation = TipCalculation(
        orderTotal: 4000,
        deliveryFee: 500,
        selectedOption: customOption,
        customAmount: 750,
      );

      expect(customCalculation.tipAmount, 750.0);
    });

    test('should calculate total with tip correctly', () {
      expect(testCalculation.totalWithTip, 5100.0); // 4000 + 500 + 600
    });

    test('should validate correctly', () {
      expect(testCalculation.isValid, true);

      // Invalid: negative tip
      final invalidCalculation = TipCalculation(
        orderTotal: 4000,
        deliveryFee: 500,
        customAmount: -100,
      );
      expect(invalidCalculation.isValid, false);

      // Invalid: tip too high (> 50% of order)
      final tooHighCalculation = TipCalculation(
        orderTotal: 4000,
        deliveryFee: 500,
        customAmount: 2500, // > 50% of 4000
      );
      expect(tooHighCalculation.isValid, false);
    });

    test('should format tip correctly', () {
      expect(testCalculation.formattedTip, '600 FCFA');
    });

    test('should format total correctly', () {
      expect(testCalculation.formattedTotal, '5100 FCFA');
    });

    test('should handle no selected option', () {
      final noOptionCalculation = TipCalculation(
        orderTotal: 4000,
        deliveryFee: 500,
        customAmount: 0,
      );

      expect(noOptionCalculation.tipAmount, 0.0);
      expect(noOptionCalculation.totalWithTip, 4500.0); // 4000 + 500 + 0
      expect(noOptionCalculation.isValid, true);
    });
  });
}
