import 'package:flutter_test/flutter_test.dart';
import 'package:eatfast_mobile/features/promotions/domain/models/promo_code.dart';

void main() {
  group('PromoCode Model Tests', () {
    late PromoCode testPromoCode;

    setUp(() {
      testPromoCode = PromoCode(
        id: 'test_id',
        code: 'WELCOME20',
        title: 'Code de bienvenue',
        description: 'Réduction de 20% pour les nouveaux clients',
        type: PromoCodeType.percentage,
        value: 20,
        minimumOrderAmount: 1000,
        startDate: DateTime.parse('2024-01-01T00:00:00Z'),
        endDate: DateTime.parse('2024-12-31T23:59:59Z'),
        usageLimit: 100,
        usageCount: 0,
        isActive: true,
        isFirstTimeOnly: true,
        applicableRestaurants: const ['restaurant1', 'restaurant2'],
        applicableCategories: const ['fast_food', 'traditional'],
      );
    });

    test('should create PromoCode from JSON correctly', () {
      final json = {
        'id': 'test_id',
        'code': 'WELCOME20',
        'title': 'Code de bienvenue',
        'description': 'Réduction de 20% pour les nouveaux clients',
        'type': 'percentage',
        'value': 20.0,
        'minimumOrderAmount': 1000.0,
        'startDate': '2024-01-01T00:00:00Z',
        'endDate': '2024-12-31T23:59:59Z',
        'usageLimit': 100,
        'usageCount': 0,
        'isActive': true,
        'isFirstTimeOnly': true,
        'applicableRestaurants': ['restaurant1', 'restaurant2'],
        'applicableCategories': ['fast_food', 'traditional'],
      };

      final promoCode = PromoCode.fromJson(json);

      expect(promoCode.id, 'test_id');
      expect(promoCode.code, 'WELCOME20');
      expect(promoCode.type, PromoCodeType.percentage);
      expect(promoCode.value, 20);
      expect(promoCode.isFirstTimeOnly, true);
    });

    test('should convert PromoCode to JSON correctly', () {
      final json = testPromoCode.toJson();

      expect(json['id'], 'test_id');
      expect(json['code'], 'WELCOME20');
      expect(json['type'], 'percentage');
      expect(json['value'], 20);
      expect(json['isFirstTimeOnly'], true);
    });

    test('should calculate percentage discount correctly', () {
      const orderAmount = 5000.0;
      const deliveryFee = 500.0;
      final discount = testPromoCode.calculateDiscount(orderAmount, deliveryFee);

      expect(discount, 1000.0); // 20% of 5000
    });

    test('should calculate fixed discount correctly', () {
      final fixedPromo = PromoCode(
        id: testPromoCode.id,
        code: testPromoCode.code,
        title: testPromoCode.title,
        description: testPromoCode.description,
        type: PromoCodeType.fixed,
        value: 500,
        startDate: testPromoCode.startDate,
        endDate: testPromoCode.endDate,
      );

      const orderAmount = 3000.0;
      const deliveryFee = 500.0;
      final discount = fixedPromo.calculateDiscount(orderAmount, deliveryFee);

      expect(discount, 500.0);
    });

    test('should validate promo code correctly for valid conditions', () {
      final canApply = testPromoCode.canApplyToOrder(
        orderAmount: 2000,
        restaurantIds: ['restaurant1'],
        categoryIds: ['fast_food'],
        isFirstOrder: true,
      );

      expect(canApply, true);
    });

    test('should reject promo code for insufficient order amount', () {
      final canApply = testPromoCode.canApplyToOrder(
        orderAmount: 500, // Less than minimum 1000
        restaurantIds: ['restaurant1'],
        categoryIds: ['fast_food'],
        isFirstOrder: true,
      );

      expect(canApply, false);
    });

    test('should reject promo code for non-first-time user', () {
      final canApply = testPromoCode.canApplyToOrder(
        orderAmount: 2000,
        restaurantIds: ['restaurant1'],
        categoryIds: ['fast_food'],
        isFirstOrder: false, // Not first order
      );

      expect(canApply, false);
    });

    test('should reject promo code for invalid restaurant', () {
      final canApply = testPromoCode.canApplyToOrder(
        orderAmount: 2000,
        restaurantIds: ['restaurant3'], // Not in applicable list
        categoryIds: ['fast_food'],
        isFirstOrder: true,
      );

      expect(canApply, false);
    });

    test('should check if promo code is valid (not expired)', () {
      // Current promo should be valid (expires 2024-12-31)
      expect(testPromoCode.isValid, true);
    });

    test('should format discount value correctly for percentage', () {
      final formatted = testPromoCode.type.formatValue(testPromoCode.value);
      expect(formatted, '20%');
    });

    test('should format discount value correctly for fixed amount', () {
      final fixedPromo = PromoCode(
        id: testPromoCode.id,
        code: testPromoCode.code,
        title: testPromoCode.title,
        description: testPromoCode.description,
        type: PromoCodeType.fixed,
        value: 1500,
        startDate: testPromoCode.startDate,
        endDate: testPromoCode.endDate,
      );
      
      final formatted = fixedPromo.type.formatValue(fixedPromo.value);
      expect(formatted, '1500 FCFA');
    });
  });

  group('AppliedPromo Model Tests', () {
    late PromoCode testPromoCode;
    late AppliedPromo appliedPromo;

    setUp(() {
      testPromoCode = PromoCode(
        id: 'test_id',
        code: 'SAVE500',
        title: 'Économisez 500 FCFA',
        description: 'Réduction fixe de 500 FCFA',
        type: PromoCodeType.fixed,
        value: 500,
        minimumOrderAmount: 0,
        startDate: DateTime.parse('2024-01-01T00:00:00Z'),
        endDate: DateTime.parse('2024-12-31T23:59:59Z'),
        usageLimit: 0,
        usageCount: 0,
        isActive: true,
        isFirstTimeOnly: false,
        applicableRestaurants: const [],
        applicableCategories: const [],
      );

      appliedPromo = AppliedPromo(
        promoCode: testPromoCode,
        discountAmount: 500,
        appliedAt: DateTime.now(),
      );
    });

    test('should have correct discount amount', () {
      expect(appliedPromo.discountAmount, 500);
    });

    test('should create AppliedPromo from JSON correctly', () {
      final json = {
        'promoCode': testPromoCode.toJson(),
        'discountAmount': 500.0,
        'appliedAt': DateTime.now().toIso8601String(),
      };

      final applied = AppliedPromo.fromJson(json);

      expect(applied.promoCode.code, 'SAVE500');
      expect(applied.discountAmount, 500);
    });

    test('should convert AppliedPromo to JSON correctly', () {
      final json = appliedPromo.toJson();

      expect(json['discountAmount'], 500);
      expect(json['promoCode']['code'], 'SAVE500');
      expect(json['appliedAt'], isA<String>());
    });
  });
}
