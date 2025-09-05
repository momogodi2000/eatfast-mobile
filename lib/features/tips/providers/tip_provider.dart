import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/tip.dart';

class TipState {
  final List<Tip> tips;
  final List<TipOption> tipOptions;
  final TipCalculation? currentCalculation;
  final bool isLoading;
  final String? error;
  final bool isSubmitting;

  const TipState({
    this.tips = const [],
    this.tipOptions = const [],
    this.currentCalculation,
    this.isLoading = false,
    this.error,
    this.isSubmitting = false,
  });

  TipState copyWith({
    List<Tip>? tips,
    List<TipOption>? tipOptions,
    TipCalculation? currentCalculation,
    bool? isLoading,
    String? error,
    bool? isSubmitting,
  }) {
    return TipState(
      tips: tips ?? this.tips,
      tipOptions: tipOptions ?? this.tipOptions,
      currentCalculation: currentCalculation ?? this.currentCalculation,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}

class TipNotifier extends StateNotifier<TipState> {
  TipNotifier() : super(const TipState()) {
    _initializeTipOptions();
  }

  // Mock data
  final List<Tip> _mockTips = [
    Tip(
      id: '1',
      orderId: 'order123',
      driverId: 'driver1',
      driverName: 'Jean Mbeki',
      amount: 500,
      type: TipType.fixed,
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      status: TipStatus.completed,
      message: 'Merci pour la livraison rapide!',
    ),
    Tip(
      id: '2',
      orderId: 'order124',
      driverId: 'driver2',
      driverName: 'Marie Fouda',
      amount: 750,
      type: TipType.percentage,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      status: TipStatus.completed,
    ),
  ];

  final List<TipOption> _defaultTipOptions = [
    const TipOption(label: '10%', type: TipType.percentage, value: 10),
    const TipOption(label: '15%', type: TipType.percentage, value: 15),
    const TipOption(label: '20%', type: TipType.percentage, value: 20),
    const TipOption(label: '500 FCFA', type: TipType.fixed, value: 500),
    const TipOption(label: '1000 FCFA', type: TipType.fixed, value: 1000),
    const TipOption(label: 'Personnalisé', type: TipType.fixed, value: 0, isCustom: true),
  ];

  void _initializeTipOptions() {
    state = state.copyWith(tipOptions: _defaultTipOptions);
  }

  void calculateTip({
    required double orderTotal,
    required double deliveryFee,
    TipOption? selectedOption,
    double customAmount = 0.0,
  }) {
    final calculation = TipCalculation(
      orderTotal: orderTotal,
      deliveryFee: deliveryFee,
      selectedOption: selectedOption,
      customAmount: customAmount,
    );

    state = state.copyWith(currentCalculation: calculation);
  }

  void selectTipOption(TipOption option, double orderTotal, double deliveryFee) {
    calculateTip(
      orderTotal: orderTotal,
      deliveryFee: deliveryFee,
      selectedOption: option,
    );
  }

  void setCustomTipAmount(double amount, double orderTotal, double deliveryFee) {
    final customOption = _defaultTipOptions.firstWhere((opt) => opt.isCustom);
    calculateTip(
      orderTotal: orderTotal,
      deliveryFee: deliveryFee,
      selectedOption: customOption,
      customAmount: amount,
    );
  }

  void clearTip() {
    state = state.copyWith(currentCalculation: null);
  }

  Future<bool> submitTip({
    required String orderId,
    required String driverId,
    required String driverName,
    String? message,
  }) async {
    final calculation = state.currentCalculation;
    if (calculation == null || !calculation.isValid) {
      state = state.copyWith(error: 'Calcul de pourboire invalide');
      return false;
    }

    state = state.copyWith(isSubmitting: true, error: null);

    try {
      // Simulate API delay
      await Future.delayed(const Duration(milliseconds: 1500));

      final newTip = Tip(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        orderId: orderId,
        driverId: driverId,
        driverName: driverName,
        amount: calculation.tipAmount,
        type: calculation.selectedOption?.type ?? TipType.fixed,
        createdAt: DateTime.now(),
        status: TipStatus.completed,
        message: message,
      );

      _mockTips.insert(0, newTip);

      state = state.copyWith(
        tips: [newTip, ...state.tips],
        isSubmitting: false,
        currentCalculation: null,
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: 'Erreur lors de l\'envoi du pourboire: $e',
      );
      return false;
    }
  }

  Future<void> loadTips({String? orderId, String? driverId}) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await Future.delayed(const Duration(milliseconds: 500));

      var filteredTips = _mockTips;

      if (orderId != null) {
        filteredTips = filteredTips.where((tip) => tip.orderId == orderId).toList();
      }

      if (driverId != null) {
        filteredTips = filteredTips.where((tip) => tip.driverId == driverId).toList();
      }

      filteredTips.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      state = state.copyWith(
        tips: filteredTips,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Erreur lors du chargement des pourboires: $e',
      );
    }
  }

  Future<bool> updateTipStatus(String tipId, TipStatus newStatus) async {
    state = state.copyWith(isSubmitting: true, error: null);

    try {
      await Future.delayed(const Duration(milliseconds: 500));

      final tipIndex = _mockTips.indexWhere((tip) => tip.id == tipId);
      if (tipIndex == -1) {
        throw Exception('Pourboire introuvable');
      }

      final updatedTip = _mockTips[tipIndex].copyWith(status: newStatus);
      _mockTips[tipIndex] = updatedTip;

      final updatedTips = state.tips.map((tip) => 
          tip.id == tipId ? updatedTip : tip).toList();

      state = state.copyWith(
        tips: updatedTips,
        isSubmitting: false,
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: 'Erreur lors de la mise à jour: $e',
      );
      return false;
    }
  }

  Future<bool> refundTip(String tipId) async {
    return await updateTipStatus(tipId, TipStatus.refunded);
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void reset() {
    state = const TipState();
    _initializeTipOptions();
  }

  // Helper methods
  double getTotalTipsForDriver(String driverId) {
    return _mockTips
        .where((tip) => tip.driverId == driverId && tip.status == TipStatus.completed)
        .fold(0.0, (sum, tip) => sum + tip.amount);
  }

  double getTotalTipsForOrder(String orderId) {
    return _mockTips
        .where((tip) => tip.orderId == orderId && tip.status == TipStatus.completed)
        .fold(0.0, (sum, tip) => sum + tip.amount);
  }

  List<Tip> getRecentTips({int limit = 10}) {
    final sortedTips = List<Tip>.from(_mockTips);
    sortedTips.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return sortedTips.take(limit).toList();
  }

  Map<String, double> getTipStatistics() {
    final completedTips = _mockTips.where((tip) => tip.status == TipStatus.completed).toList();
    
    if (completedTips.isEmpty) {
      return {
        'total': 0.0,
        'average': 0.0,
        'count': 0.0,
      };
    }

    final total = completedTips.fold(0.0, (sum, tip) => sum + tip.amount);
    final average = total / completedTips.length;

    return {
      'total': total,
      'average': average,
      'count': completedTips.length.toDouble(),
    };
  }

  List<TipOption> getRecommendedTips(double orderTotal) {
    // Return suggested tips based on order total
    if (orderTotal < 3000) {
      return [
        const TipOption(label: '10%', type: TipType.percentage, value: 10),
        const TipOption(label: '15%', type: TipType.percentage, value: 15),
        const TipOption(label: '500 FCFA', type: TipType.fixed, value: 500),
      ];
    } else if (orderTotal < 10000) {
      return [
        const TipOption(label: '10%', type: TipType.percentage, value: 10),
        const TipOption(label: '15%', type: TipType.percentage, value: 15),
        const TipOption(label: '20%', type: TipType.percentage, value: 20),
        const TipOption(label: '1000 FCFA', type: TipType.fixed, value: 1000),
      ];
    } else {
      return [
        const TipOption(label: '15%', type: TipType.percentage, value: 15),
        const TipOption(label: '20%', type: TipType.percentage, value: 20),
        const TipOption(label: '25%', type: TipType.percentage, value: 25),
        const TipOption(label: '2000 FCFA', type: TipType.fixed, value: 2000),
      ];
    }
  }
}

// Providers
final tipProvider = StateNotifierProvider<TipNotifier, TipState>((ref) {
  return TipNotifier();
});

final tipCalculationProvider = Provider<TipCalculation?>((ref) {
  return ref.watch(tipProvider.select((state) => state.currentCalculation));
});

final recommendedTipsProvider = Provider.family<List<TipOption>, double>((ref, orderTotal) {
  return ref.read(tipProvider.notifier).getRecommendedTips(orderTotal);
});
