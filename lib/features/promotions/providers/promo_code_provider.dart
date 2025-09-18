import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/promo_code.dart';

/// Provider for managing promo codes
final promoCodeProvider = StateNotifierProvider<PromoCodeNotifier, PromoCodeState>((ref) {
  return PromoCodeNotifier();
});

/// Promo code state
class PromoCodeState {
  final List<PromoCode> availablePromoCodes;
  final AppliedPromo? appliedPromo;
  final bool isLoading;
  final String? error;

  const PromoCodeState({
    this.availablePromoCodes = const [],
    this.appliedPromo,
    this.isLoading = false,
    this.error,
  });

  PromoCodeState copyWith({
    List<PromoCode>? availablePromoCodes,
    AppliedPromo? appliedPromo,
    bool? isLoading,
    String? error,
    bool clearAppliedPromo = false,
    bool clearError = false,
  }) {
    return PromoCodeState(
      availablePromoCodes: availablePromoCodes ?? this.availablePromoCodes,
      appliedPromo: clearAppliedPromo ? null : (appliedPromo ?? this.appliedPromo),
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

/// Promo code state notifier
class PromoCodeNotifier extends StateNotifier<PromoCodeState> {
  PromoCodeNotifier() : super(const PromoCodeState()) {
    _loadAvailablePromoCodes();
  }

  /// Load available promo codes
  Future<void> _loadAvailablePromoCodes() async {
    state = state.copyWith(isLoading: true);
    
    try {
      // TODO: Replace with actual API call to backend promotions endpoint
      final promoCodes = [
        PromoCode(
          id: 'welcome20',
          code: 'WELCOME20',
          title: 'Bienvenue chez EatFast!',
          description: '20% de réduction sur votre première commande',
          type: PromoCodeType.percentage,
          value: 20,
          minimumOrderAmount: 2000,
          maximumDiscountAmount: 3000,
          startDate: DateTime.now().subtract(const Duration(days: 30)),
          endDate: DateTime.now().add(const Duration(days: 90)),
          isFirstTimeOnly: true,
        ),
        PromoCode(
          id: 'free_delivery',
          code: 'FREEDELIVERY',
          title: 'Livraison offerte',
          description: 'Frais de livraison gratuits pour toute commande',
          type: PromoCodeType.freeDelivery,
          value: 0,
          minimumOrderAmount: 1500,
          startDate: DateTime.now().subtract(const Duration(days: 7)),
          endDate: DateTime.now().add(const Duration(days: 30)),
        ),
        PromoCode(
          id: 'save1000',
          code: 'SAVE1000',
          title: '1000 FCFA de réduction',
          description: 'Économisez 1000 FCFA sur votre commande',
          type: PromoCodeType.fixed,
          value: 1000,
          minimumOrderAmount: 5000,
          startDate: DateTime.now().subtract(const Duration(days: 3)),
          endDate: DateTime.now().add(const Duration(days: 14)),
        ),
        PromoCode(
          id: 'weekend15',
          code: 'WEEKEND15',
          title: 'Weekend spécial',
          description: '15% de réduction le weekend',
          type: PromoCodeType.percentage,
          value: 15,
          minimumOrderAmount: 3000,
          maximumDiscountAmount: 2500,
          startDate: DateTime.now().subtract(const Duration(days: 1)),
          endDate: DateTime.now().add(const Duration(days: 60)),
          usageLimit: 100,
          usageCount: 23,
        ),
      ];

      state = state.copyWith(
        availablePromoCodes: promoCodes,
        isLoading: false,
        clearError: true,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Erreur lors du chargement des codes promo: $e',
      );
    }
  }

  /// Apply promo code
  Future<bool> applyPromoCode({
    required String code,
    required double orderAmount,
    required double deliveryFee,
    required List<String> restaurantIds,
    required List<String> categoryIds,
    required bool isFirstOrder,
  }) async {
    state = state.copyWith(isLoading: true);
    
    try {
      // Find the promo code
      final promoCode = state.availablePromoCodes
          .where((promo) => promo.code.toUpperCase() == code.toUpperCase())
          .firstOrNull;

      if (promoCode == null) {
        state = state.copyWith(
          isLoading: false,
          error: 'Code promo introuvable',
        );
        return false;
      }

      // Check if promo code can be applied
      if (!promoCode.canApplyToOrder(
        orderAmount: orderAmount,
        restaurantIds: restaurantIds,
        categoryIds: categoryIds,
        isFirstOrder: isFirstOrder,
      )) {
        String errorMessage = 'Ce code promo ne peut pas être appliqué';
        
        if (!promoCode.isValid) {
          errorMessage = 'Ce code promo a expiré ou n\'est plus valide';
        } else if (orderAmount < promoCode.minimumOrderAmount) {
          errorMessage = 'Commande minimum de ${promoCode.minimumOrderAmount.toInt()} FCFA requis';
        } else if (promoCode.isFirstTimeOnly && !isFirstOrder) {
          errorMessage = 'Ce code est réservé aux nouveaux clients';
        }

        state = state.copyWith(
          isLoading: false,
          error: errorMessage,
        );
        return false;
      }

      // Calculate discount
      final discountAmount = promoCode.calculateDiscount(orderAmount, deliveryFee);

      // Apply the promo code
      final appliedPromo = AppliedPromo(
        promoCode: promoCode,
        discountAmount: discountAmount,
        appliedAt: DateTime.now(),
      );

      state = state.copyWith(
        appliedPromo: appliedPromo,
        isLoading: false,
        clearError: true,
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Erreur lors de l\'application du code: $e',
      );
      return false;
    }
  }

  /// Remove applied promo code
  void removePromoCode() {
    state = state.copyWith(
      clearAppliedPromo: true,
      clearError: true,
    );
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(clearError: true);
  }

  /// Get valid promo codes for current order
  List<PromoCode> getValidPromoCodes({
    required double orderAmount,
    required List<String> restaurantIds,
    required List<String> categoryIds,
    required bool isFirstOrder,
  }) {
    return state.availablePromoCodes
        .where((promo) => promo.canApplyToOrder(
              orderAmount: orderAmount,
              restaurantIds: restaurantIds,
              categoryIds: categoryIds,
              isFirstOrder: isFirstOrder,
            ))
        .toList();
  }

  /// Refresh promo codes
  Future<void> refresh() async {
    await _loadAvailablePromoCodes();
  }
}
