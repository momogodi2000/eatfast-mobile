import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/models/wallet_models.dart';

/// Wallet provider for client module
final walletProvider = StateNotifierProvider<WalletNotifier, WalletState>((ref) {
  return WalletNotifier();
});

/// Top-up provider
final topUpProvider = StateNotifierProvider<TopUpNotifier, TopUpState>((ref) {
  return TopUpNotifier();
});

class WalletNotifier extends StateNotifier<WalletState> {
  WalletNotifier()
      : super(const WalletState(
          balance: 0.0,
          transactions: [],
        ));

  Future<void> loadTransactionHistory({TransactionType? type}) async {
    state = state.copyWith(isLoading: true);
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
      state = state.copyWith(
        isLoading: false,
        transactions: [
          WalletTransaction(
            id: '1',
            type: TransactionType.topup,
            amount: 1000.0,
            description: 'Top-up via MTN Money',
            timestamp: DateTime.now(),
          ),
        ],
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> refresh() async {
    // TODO: Implement balance refresh
  }

  Future<void> fetchWallet() async {
    // TODO: Implement wallet fetch
    await refresh();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

class TopUpNotifier extends StateNotifier<TopUpState> {
  TopUpNotifier() : super(const TopUpState());

  void setAmount(double amount) {
    state = state.copyWith(amount: amount);
  }

  void setPaymentMethod(PaymentMethod method) {
    state = state.copyWith(paymentMethod: method);
  }

  void setPhoneNumber(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }

  Future<bool> submitTopUp() async {
    state = state.copyWith(isProcessing: true);
    try {
      // TODO: Implement top-up
      await Future.delayed(const Duration(seconds: 2));
      state = state.copyWith(isProcessing: false);
      return true;
    } catch (e) {
      state = state.copyWith(isProcessing: false, error: e.toString());
      return false;
    }
  }

  void reset() {
    state = const TopUpState();
  }
}
