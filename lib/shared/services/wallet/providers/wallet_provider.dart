/// Wallet provider for state management
library;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/services/api/api_client.dart';
import 'package:eatfast_mobile/shared/services/wallet/data/wallet_service.dart';
import 'package:eatfast_mobile/shared/services/wallet/domain/models/wallet.dart';

/// Wallet service provider
final walletServiceProvider = Provider<WalletService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return WalletService(apiClient);
});

/// Wallet provider - manages wallet balance and transactions
final walletProvider =
    StateNotifierProvider<WalletNotifier, AsyncValue<Wallet?>>(
      (ref) => WalletNotifier(ref.read(walletServiceProvider)),
    );

/// Top-up provider - manages top-up state and operations
final topUpProvider = StateNotifierProvider<TopUpNotifier, TopUpState>(
  (ref) => TopUpNotifier(ref.read(walletServiceProvider)),
);

/// Wallet notifier
class WalletNotifier extends StateNotifier<AsyncValue<Wallet?>> {
  final WalletService _walletService;

  WalletNotifier(this._walletService) : super(const AsyncValue.loading()) {
    loadWallet();
  }

  Future<void> loadWallet() async {
    state = const AsyncValue.loading();
    try {
      final response = await _walletService.getWallet();
      if (response.success && response.wallet != null) {
        state = AsyncValue.data(response.wallet);
      } else {
        state = AsyncValue.error(
          response.error ?? 'Failed to load wallet',
          StackTrace.current,
        );
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Refresh wallet data
  Future<void> refresh() async {
    await loadWallet();
  }

  /// Load transaction history with pagination
  Future<void> loadTransactionHistory({
    bool loadMore = false,
    TransactionType? type,
  }) async {
    try {
      // TODO: Implement pagination logic from service
      await loadWallet();
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Clear error state
  void clearError() {
    state.whenData((wallet) {
      state = AsyncValue.data(wallet);
    });
  }

  Future<void> topUp(double amount, String paymentMethodId) async {
    try {
      final request = TopUpRequest(
        amount: amount,
        paymentMethod: paymentMethodId,
      );
      await _walletService.topUpWallet(request);
      await loadWallet();
    } catch (error) {
      rethrow;
    }
  }
}

/// Top-up state
class TopUpState {
  final double? amount;
  final PaymentMethod? paymentMethod;
  final String? phoneNumber;
  final bool isLoading;
  final String? error;

  const TopUpState({
    this.amount,
    this.paymentMethod,
    this.phoneNumber,
    this.isLoading = false,
    this.error,
  });

  /// Check if can submit top-up
  bool get canSubmit {
    if (amount == null || amount! <= 0) return false;
    if (paymentMethod == null) return false;

    // For mobile money, phone number is required
    if (paymentMethod == PaymentMethod.mtnMoney ||
        paymentMethod == PaymentMethod.orangeMoney) {
      return phoneNumber != null && phoneNumber!.isNotEmpty;
    }

    return true;
  }

  TopUpState copyWith({
    double? amount,
    PaymentMethod? paymentMethod,
    String? phoneNumber,
    bool? isLoading,
    String? error,
  }) {
    return TopUpState(
      amount: amount ?? this.amount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// Top-up notifier
class TopUpNotifier extends StateNotifier<TopUpState> {
  final WalletService _walletService;

  TopUpNotifier(this._walletService) : super(const TopUpState());

  /// Set selected amount
  void setAmount(double amount) {
    state = state.copyWith(amount: amount);
  }

  /// Set payment method
  void setPaymentMethod(PaymentMethod method) {
    state = state.copyWith(paymentMethod: method);
  }

  /// Set phone number for mobile money
  void setPhoneNumber(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }

  /// Submit top-up request
  Future<bool> submitTopUp() async {
    if (!state.canSubmit) {
      state = state.copyWith(error: 'Please fill all required fields');
      return false;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final request = TopUpRequest(
        amount: state.amount!,
        paymentMethod: state.paymentMethod!.value,
        phoneNumber: state.phoneNumber,
      );
      final response = await _walletService.topUpWallet(request);
      if (response.success) {
        state = const TopUpState(); // Reset state on success
        return true;
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.error ?? 'Top-up failed',
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  /// Reset state
  void reset() {
    state = const TopUpState();
  }

  /// Legacy method for backward compatibility
  void selectAmount(double amount) => setAmount(amount);

  /// Legacy method for backward compatibility
  void selectPaymentMethod(String paymentMethodId) {
    final method = PaymentMethod.fromString(paymentMethodId);
    setPaymentMethod(method);
  }

  /// Legacy method for backward compatibility
  Future<bool> processTopUp() => submitTopUp();
}
