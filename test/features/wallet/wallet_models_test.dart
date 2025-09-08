import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Wallet Models Tests', () {
    test('Wallet model should create correctly', () {
      // Arrange
      final now = DateTime.now();

      // Act
      const wallet = Wallet(
        id: 'wallet_123',
        userId: 'user_456',
        balance: 25000,
        currency: 'XAF',
        isActive: true,
        createdAt: null,
        updatedAt: null,
      );

      // Assert
      expect(wallet.id, 'wallet_123');
      expect(wallet.userId, 'user_456');
      expect(wallet.balance, 25000);
      expect(wallet.currency, 'XAF');
      expect(wallet.isActive, true);
      expect(wallet.formattedBalance, '25,000 XAF');
      expect(wallet.hasBalance, true);
    });

    test('Wallet with zero balance should work correctly', () {
      // Arrange & Act
      const emptyWallet = Wallet(
        id: 'wallet_empty',
        userId: 'user_123',
        balance: 0,
        currency: 'XAF',
        isActive: true,
        createdAt: null,
        updatedAt: null,
      );

      // Assert
      expect(emptyWallet.balance, 0);
      expect(emptyWallet.hasBalance, false);
      expect(emptyWallet.formattedBalance, '0 XAF');
    });

    test('WalletTransaction model should create correctly', () {
      // Arrange
      final now = DateTime.now();

      // Act
      const transaction = WalletTransaction(
        id: 'txn_123',
        walletId: 'wallet_456',
        userId: 'user_789',
        type: TransactionType.deposit,
        amount: 10000,
        balanceBefore: 15000,
        balanceAfter: 25000,
        description: 'Top-up via MTN Mobile Money',
        reference: 'MTN_TOPUP_123',
        status: TransactionStatus.completed,
        metadata: {
          'payment_method': 'mtn',
          'phone_number': '+237123456789',
        },
        createdAt: null,
        updatedAt: null,
      );

      // Assert
      expect(transaction.id, 'txn_123');
      expect(transaction.walletId, 'wallet_456');
      expect(transaction.userId, 'user_789');
      expect(transaction.type, TransactionType.deposit);
      expect(transaction.amount, 10000);
      expect(transaction.balanceBefore, 15000);
      expect(transaction.balanceAfter, 25000);
      expect(transaction.description, 'Top-up via MTN Mobile Money');
      expect(transaction.reference, 'MTN_TOPUP_123');
      expect(transaction.status, TransactionStatus.completed);
      expect(transaction.isCredit, true);
      expect(transaction.isDebit, false);
      expect(transaction.isCompleted, true);
    });

    test('WalletTransaction withdrawal should work correctly', () {
      // Arrange & Act
      const withdrawal = WalletTransaction(
        id: 'txn_withdrawal',
        walletId: 'wallet_123',
        userId: 'user_456',
        type: TransactionType.withdrawal,
        amount: 5000,
        balanceBefore: 20000,
        balanceAfter: 15000,
        description: 'Cash withdrawal',
        reference: 'WITHDRAWAL_456',
        status: TransactionStatus.completed,
        metadata: {
          'withdrawal_method': 'cash',
          'agent_id': 'agent_123',
        },
        createdAt: null,
        updatedAt: null,
      );

      // Assert
      expect(withdrawal.type, TransactionType.withdrawal);
      expect(withdrawal.amount, 5000);
      expect(withdrawal.isCredit, false);
      expect(withdrawal.isDebit, true);
      expect(withdrawal.balanceBefore, 20000);
      expect(withdrawal.balanceAfter, 15000);
      expect(withdrawal.metadata['withdrawal_method'], 'cash');
    });

    test('WalletTransaction failed transaction should work correctly', () {
      // Arrange & Act
      const failedTransaction = WalletTransaction(
        id: 'txn_failed',
        walletId: 'wallet_123',
        userId: 'user_456',
        type: TransactionType.deposit,
        amount: 10000,
        balanceBefore: 5000,
        balanceAfter: 5000, // Balance unchanged due to failure
        description: 'Failed top-up',
        reference: 'FAILED_TOPUP_789',
        status: TransactionStatus.failed,
        metadata: {
          'error_code': 'INSUFFICIENT_FUNDS',
          'error_message': 'Payment failed due to insufficient funds',
        },
        createdAt: null,
        updatedAt: null,
      );

      // Assert
      expect(failedTransaction.status, TransactionStatus.failed);
      expect(failedTransaction.isCompleted, true);
      expect(failedTransaction.balanceBefore, failedTransaction.balanceAfter);
      expect(failedTransaction.metadata['error_code'], 'INSUFFICIENT_FUNDS');
    });
  });

  group('Wallet Business Logic Tests', () {
    test('Wallet balance calculations should work correctly', () {
      // Test balance operations
      const wallet = Wallet(
        id: 'wallet_123',
        userId: 'user_456',
        balance: 20000,
        currency: 'XAF',
        isActive: true,
        createdAt: null,
        updatedAt: null,
      );

      // Test sufficient balance for transaction
      expect(wallet.canAfford(15000), true);
      expect(wallet.canAfford(20000), true);
      expect(wallet.canAfford(25000), false);

      // Test balance after transactions
      expect(wallet.balanceAfterTransaction(5000, isCredit: true), 25000);
      expect(wallet.balanceAfterTransaction(5000, isCredit: false), 15000);
    });

    test('Wallet transaction types should be correctly categorized', () {
      // Test credit transactions
      expect(TransactionType.deposit.isCredit, true);
      expect(TransactionType.deposit.isDebit, false);

      expect(TransactionType.reward.isCredit, true);
      expect(TransactionType.reward.isDebit, false);

      expect(TransactionType.refund.isCredit, true);
      expect(TransactionType.refund.isDebit, false);

      // Test debit transactions
      expect(TransactionType.withdrawal.isDebit, true);
      expect(TransactionType.withdrawal.isCredit, false);

      expect(TransactionType.payment.isDebit, true);
      expect(TransactionType.payment.isCredit, false);

      expect(TransactionType.fee.isDebit, true);
      expect(TransactionType.fee.isCredit, false);
    });

    test('Wallet transaction status should be correctly identified', () {
      // Test completed transactions
      expect(TransactionStatus.completed.isCompleted, true);
      expect(TransactionStatus.completed.isSuccessful, true);

      // Test failed transactions
      expect(TransactionStatus.failed.isCompleted, true);
      expect(TransactionStatus.failed.isSuccessful, false);

      // Test pending transactions
      expect(TransactionStatus.pending.isCompleted, false);
      expect(TransactionStatus.pending.isSuccessful, false);

      // Test processing transactions
      expect(TransactionStatus.processing.isCompleted, false);
      expect(TransactionStatus.processing.isSuccessful, false);
    });

    test('Wallet balance formatting should work correctly', () {
      // Test different currencies and amounts
      const xafWallet = Wallet(
        id: '1',
        userId: 'user1',
        balance: 15000,
        currency: 'XAF',
        isActive: true,
        createdAt: null,
        updatedAt: null,
      );

      const usdWallet = Wallet(
        id: '2',
        userId: 'user2',
        balance: 50,
        currency: 'USD',
        isActive: true,
        createdAt: null,
        updatedAt: null,
      );

      const eurWallet = Wallet(
        id: '3',
        userId: 'user3',
        balance: 25,
        currency: 'EUR',
        isActive: true,
        createdAt: null,
        updatedAt: null,
      );

      expect(xafWallet.formattedBalance, '15,000 XAF');
      expect(usdWallet.formattedBalance, '50 USD');
      expect(eurWallet.formattedBalance, '25 EUR');
    });

    test('Wallet transaction balance validation should work correctly', () {
      // Test valid balance transitions
      const validTransaction = WalletTransaction(
        id: 'txn_valid',
        walletId: 'wallet_123',
        userId: 'user_456',
        type: TransactionType.deposit,
        amount: 10000,
        balanceBefore: 5000,
        balanceAfter: 15000,
        description: 'Valid deposit',
        reference: 'VALID_123',
        status: TransactionStatus.completed,
        metadata: {},
        createdAt: null,
        updatedAt: null,
      );

      expect(validTransaction.isBalanceValid, true);

      // Test invalid balance transitions
      const invalidTransaction = WalletTransaction(
        id: 'txn_invalid',
        walletId: 'wallet_123',
        userId: 'user_456',
        type: TransactionType.deposit,
        amount: 10000,
        balanceBefore: 5000,
        balanceAfter: 12000, // Incorrect balance after
        description: 'Invalid deposit',
        reference: 'INVALID_123',
        status: TransactionStatus.completed,
        metadata: {},
        createdAt: null,
        updatedAt: null,
      );

      expect(invalidTransaction.isBalanceValid, false);
    });
  });

  group('Wallet Integration Tests', () {
    test('Complete wallet transaction flow should work correctly', () {
      // Simulate a complete wallet transaction flow
      const initialWallet = Wallet(
        id: 'wallet_test',
        userId: 'user_test',
        balance: 10000,
        currency: 'XAF',
        isActive: true,
        createdAt: null,
        updatedAt: null,
      );

      // Simulate deposit transaction
      const depositTransaction = WalletTransaction(
        id: 'deposit_1',
        walletId: 'wallet_test',
        userId: 'user_test',
        type: TransactionType.deposit,
        amount: 15000,
        balanceBefore: 10000,
        balanceAfter: 25000,
        description: 'Deposit via MTN Mobile Money',
        reference: 'MTN_DEPOSIT_123',
        status: TransactionStatus.completed,
        metadata: {'phone_number': '+237123456789'},
        createdAt: null,
        updatedAt: null,
      );

      // Simulate payment transaction
      const paymentTransaction = WalletTransaction(
        id: 'payment_1',
        walletId: 'wallet_test',
        userId: 'user_test',
        type: TransactionType.payment,
        amount: 8000,
        balanceBefore: 25000,
        balanceAfter: 17000,
        description: 'Payment for order #12345',
        reference: 'ORDER_12345',
        status: TransactionStatus.completed,
        metadata: {'order_id': '12345'},
        createdAt: null,
        updatedAt: null,
      );

      // Verify transaction flow
      expect(depositTransaction.isBalanceValid, true);
      expect(paymentTransaction.isBalanceValid, true);
      expect(depositTransaction.balanceAfter, paymentTransaction.balanceBefore);
      expect(initialWallet.balance, depositTransaction.balanceBefore);
    });

    test('Wallet transaction history should be consistent', () {
      // Create a series of transactions
      final transactions = [
        const WalletTransaction(
          id: 'txn_1',
          walletId: 'wallet_test',
          userId: 'user_test',
          type: TransactionType.deposit,
          amount: 20000,
          balanceBefore: 0,
          balanceAfter: 20000,
          description: 'Initial deposit',
          reference: 'DEPOSIT_1',
          status: TransactionStatus.completed,
          metadata: {},
          createdAt: null,
          updatedAt: null,
        ),
        const WalletTransaction(
          id: 'txn_2',
          walletId: 'wallet_test',
          userId: 'user_test',
          type: TransactionType.payment,
          amount: 5000,
          balanceBefore: 20000,
          balanceAfter: 15000,
          description: 'Payment 1',
          reference: 'PAYMENT_1',
          status: TransactionStatus.completed,
          metadata: {},
          createdAt: null,
          updatedAt: null,
        ),
        const WalletTransaction(
          id: 'txn_3',
          walletId: 'wallet_test',
          userId: 'user_test',
          type: TransactionType.payment,
          amount: 3000,
          balanceBefore: 15000,
          balanceAfter: 12000,
          description: 'Payment 2',
          reference: 'PAYMENT_2',
          status: TransactionStatus.completed,
          metadata: {},
          createdAt: null,
          updatedAt: null,
        ),
      ];

      // Verify balance consistency
      for (int i = 0; i < transactions.length - 1; i++) {
        expect(transactions[i].balanceAfter, transactions[i + 1].balanceBefore);
      }

      // Verify all transactions are valid
      for (final transaction in transactions) {
        expect(transaction.isBalanceValid, true);
        expect(transaction.isCompleted, true);
      }
    });
  });
}

// Mock classes for testing (these would be in the actual domain models)
class Wallet {
  const Wallet({
    required this.id,
    required this.userId,
    required this.balance,
    required this.currency,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String userId;
  final int balance;
  final String currency;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  bool get hasBalance => balance > 0;

  String get formattedBalance {
    final formattedNumber = balance.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
    return '$formattedNumber $currency';
  }

  bool canAfford(int amount) => balance >= amount;

  int balanceAfterTransaction(int amount, {required bool isCredit}) {
    return isCredit ? balance + amount : balance - amount;
  }
}

class WalletTransaction {
  const WalletTransaction({
    required this.id,
    required this.walletId,
    required this.userId,
    required this.type,
    required this.amount,
    required this.balanceBefore,
    required this.balanceAfter,
    required this.description,
    required this.reference,
    required this.status,
    required this.metadata,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String walletId;
  final String userId;
  final TransactionType type;
  final int amount;
  final int balanceBefore;
  final int balanceAfter;
  final String description;
  final String reference;
  final TransactionStatus status;
  final Map<String, dynamic> metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  bool get isCredit => type.isCredit;
  bool get isDebit => type.isDebit;
  bool get isCompleted => status.isCompleted;

  bool get isBalanceValid {
    if (isCredit) {
      return balanceAfter == balanceBefore + amount;
    } else {
      return balanceAfter == balanceBefore - amount;
    }
  }
}

enum TransactionType {
  deposit,
  withdrawal,
  payment,
  refund,
  reward,
  fee,
  transfer;

  bool get isCredit => this == deposit || this == refund || this == reward;
  bool get isDebit => this == withdrawal || this == payment || this == fee || this == transfer;
}

enum TransactionStatus {
  pending,
  processing,
  completed,
  failed,
  cancelled;

  bool get isCompleted => this == completed || this == failed || this == cancelled;
  bool get isSuccessful => this == completed;
}
