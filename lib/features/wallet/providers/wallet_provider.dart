import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/wallet_service.dart';
import '../domain/models/wallet.dart';

/// Wallet state
class WalletState {
  final Wallet? wallet;
  final List<Transaction> transactions;
  final bool isLoading;
  final bool isLoadingTransactions;
  final String? error;
  final PaginationInfo? transactionsPagination;

  const WalletState({
    this.wallet,
    this.transactions = const [],
    this.isLoading = false,
    this.isLoadingTransactions = false,
    this.error,
    this.transactionsPagination,
  });

  WalletState copyWith({
    Wallet? wallet,
    List<Transaction>? transactions,
    bool? isLoading,
    bool? isLoadingTransactions,
    String? error,
    PaginationInfo? transactionsPagination,
  }) {
    return WalletState(
      wallet: wallet ?? this.wallet,
      transactions: transactions ?? this.transactions,
      isLoading: isLoading ?? this.isLoading,
      isLoadingTransactions: isLoadingTransactions ?? this.isLoadingTransactions,
      error: error,
      transactionsPagination: transactionsPagination ?? this.transactionsPagination,
    );
  }

  bool get hasWallet => wallet != null;
  double get balance => wallet?.balance ?? 0.0;
  String get currency => wallet?.currency ?? 'XAF';
}

/// Wallet notifier
class WalletNotifier extends StateNotifier<WalletState> {
  final WalletService _walletService;

  WalletNotifier(this._walletService) : super(const WalletState()) {
    loadWallet();
  }

  /// Load wallet information
  Future<void> loadWallet() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _walletService.getWallet();

      if (response.success && response.wallet != null) {
        state = state.copyWith(
          wallet: response.wallet,
          isLoading: false,
          error: null,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.error ?? 'Failed to load wallet',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  /// Top up wallet
  Future<bool> topUpWallet(TopUpRequest request) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _walletService.topUpWallet(request);

      if (response.success) {
        // Reload wallet to get updated balance
        await loadWallet();
        return true;
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.error ?? 'Failed to top up wallet',
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred',
      );
      return false;
    }
  }

  /// Load transaction history
  Future<void> loadTransactionHistory({
    bool loadMore = false,
    TransactionType? type,
    TransactionStatus? status,
  }) async {
    if (!loadMore) {
      state = state.copyWith(
        isLoadingTransactions: true,
        transactions: [],
        error: null,
      );
    }

    try {
      final page = loadMore ? (state.transactionsPagination?.page ?? 0) + 1 : 1;
      
      final response = await _walletService.getTransactionHistory(
        page: page,
        type: type,
        status: status,
      );

      if (response.success) {
        final newTransactions = loadMore 
            ? [...state.transactions, ...response.transactions]
            : response.transactions;

        state = state.copyWith(
          transactions: newTransactions,
          transactionsPagination: response.pagination,
          isLoadingTransactions: false,
          error: null,
        );
      } else {
        state = state.copyWith(
          isLoadingTransactions: false,
          error: response.error ?? 'Failed to load transactions',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoadingTransactions: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  /// Refresh wallet data
  Future<void> refresh() async {
    await Future.wait([
      loadWallet(),
      loadTransactionHistory(),
    ]);
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// Wallet provider
final walletProvider = StateNotifierProvider<WalletNotifier, WalletState>((ref) {
  final walletService = ref.watch(walletServiceProvider);
  return WalletNotifier(walletService);
});

/// Top up state for managing top up flow
class TopUpState {
  final double? amount;
  final PaymentMethod? paymentMethod;
  final String? phoneNumber;
  final bool isLoading;
  final String? error;
  final String? transactionId;
  final String? paymentUrl;

  const TopUpState({
    this.amount,
    this.paymentMethod,
    this.phoneNumber,
    this.isLoading = false,
    this.error,
    this.transactionId,
    this.paymentUrl,
  });

  TopUpState copyWith({
    double? amount,
    PaymentMethod? paymentMethod,
    String? phoneNumber,
    bool? isLoading,
    String? error,
    String? transactionId,
    String? paymentUrl,
  }) {
    return TopUpState(
      amount: amount ?? this.amount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      transactionId: transactionId ?? this.transactionId,
      paymentUrl: paymentUrl ?? this.paymentUrl,
    );
  }

  bool get canSubmit => 
      amount != null && 
      amount! > 0 && 
      paymentMethod != null &&
      (paymentMethod == PaymentMethod.card || phoneNumber?.isNotEmpty == true);
}

/// Top up notifier
class TopUpNotifier extends StateNotifier<TopUpState> {
  final WalletService _walletService;

  TopUpNotifier(this._walletService) : super(const TopUpState());

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
    if (!state.canSubmit) return false;

    state = state.copyWith(isLoading: true, error: null);

    try {
      final request = TopUpRequest(
        amount: state.amount!,
        paymentMethod: state.paymentMethod!.value,
        phoneNumber: state.phoneNumber,
      );

      final response = await _walletService.topUpWallet(request);

      if (response.success) {
        state = state.copyWith(
          isLoading: false,
          transactionId: response.transactionId,
          paymentUrl: response.paymentUrl,
          error: null,
        );
        return true;
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.error ?? 'Failed to initiate top up',
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred',
      );
      return false;
    }
  }

  void reset() {
    state = const TopUpState();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// Top up provider
final topUpProvider = StateNotifierProvider<TopUpNotifier, TopUpState>((ref) {
  final walletService = ref.watch(walletServiceProvider);
  return TopUpNotifier(walletService);
});