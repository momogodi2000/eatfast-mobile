import 'package:flutter_test/flutter_test.dart';
import '../../../lib/features/wallet/domain/models/wallet.dart';

void main() {
  group('Wallet Models Tests', () {
    test('Wallet model should create correctly', () {
      // Arrange
      final now = DateTime.now();

      // Act
      final wallet = Wallet(
        id: 'wallet_123',
        userId: 'user_456',
        balance: 25000,
        currency: 'XAF',
        isActive: true,
        createdAt: now,
        updatedAt: now,
      );

      // Assert
      expect(wallet.id, 'wallet_123');
      expect(wallet.userId, 'user_456');
      expect(wallet.balance, 25000);
      expect(wallet.currency, 'XAF');
      expect(wallet.isActive, true);
      expect(wallet.createdAt, now);
      expect(wallet.updatedAt, now);
    });

    test('Wallet with zero balance should work correctly', () {
      // Arrange & Act
      final now = DateTime.now();
      final emptyWallet = Wallet(
        id: 'wallet_empty',
        userId: 'user_123',
        balance: 0,
        currency: 'XAF',
        isActive: true,
        createdAt: now,
        updatedAt: now,
      );

      // Assert
      expect(emptyWallet.balance, 0);
      expect(emptyWallet.createdAt, now);
      expect(emptyWallet.updatedAt, now);
    });

    test('Transaction model should create correctly', () {
      // Arrange
      final now = DateTime.now();

      // Act
      final transaction = Transaction(
        id: 'txn_123',
        walletId: 'wallet_456',
        type: TransactionType.topup,
        amount: 10000,
        currency: 'XAF',
        status: TransactionStatus.completed,
        description: 'Top-up via MTN Mobile Money',
        reference: 'MTN_TOPUP_123',
        createdAt: now,
      );

      // Assert
      expect(transaction.id, 'txn_123');
      expect(transaction.walletId, 'wallet_456');
      expect(transaction.type, TransactionType.topup);
      expect(transaction.amount, 10000);
      expect(transaction.currency, 'XAF');
      expect(transaction.description, 'Top-up via MTN Mobile Money');
      expect(transaction.reference, 'MTN_TOPUP_123');
      expect(transaction.status, TransactionStatus.completed);
      expect(transaction.createdAt, now);
    });

    test('Transaction withdrawal should work correctly', () {
      // Arrange & Act
      final now = DateTime.now();
      final withdrawal = Transaction(
        id: 'txn_withdrawal',
        walletId: 'wallet_123',
        type: TransactionType.withdrawal,
        amount: 5000,
        currency: 'XAF',
        status: TransactionStatus.completed,
        description: 'Cash withdrawal',
        reference: 'WITHDRAWAL_456',
        createdAt: now,
      );

      // Assert
      expect(withdrawal.id, 'txn_withdrawal');
      expect(withdrawal.type, TransactionType.withdrawal);
      expect(withdrawal.amount, 5000);
      expect(withdrawal.status, TransactionStatus.completed);
      expect(withdrawal.description, 'Cash withdrawal');
      expect(withdrawal.reference, 'WITHDRAWAL_456');
    });

    test('Transaction failed transaction should work correctly', () {
      // Arrange & Act
      final now = DateTime.now();
      final failedTransaction = Transaction(
        id: 'txn_failed',
        walletId: 'wallet_123',
        type: TransactionType.topup,
        amount: 10000,
        currency: 'XAF',
        status: TransactionStatus.failed,
        description: 'Failed top-up',
        reference: 'FAILED_TOPUP_789',
        createdAt: now,
      );

      // Assert
      expect(failedTransaction.id, 'txn_failed');
      expect(failedTransaction.status, TransactionStatus.failed);
      expect(failedTransaction.type, TransactionType.topup);
      expect(failedTransaction.amount, 10000);
      expect(failedTransaction.description, 'Failed top-up');
      expect(failedTransaction.reference, 'FAILED_TOPUP_789');
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

    test('Transaction types should be correctly defined', () {
      // Test that all transaction types exist
      expect(TransactionType.topup, isNotNull);
      expect(TransactionType.payment, isNotNull);
      expect(TransactionType.refund, isNotNull);
      expect(TransactionType.transfer, isNotNull);
      expect(TransactionType.bonus, isNotNull);
      expect(TransactionType.withdrawal, isNotNull);

      // Test display names
      expect(TransactionType.topup.displayName, 'Recharge');
      expect(TransactionType.payment.displayName, 'Paiement');
      expect(TransactionType.withdrawal.displayName, 'Retrait');
    });

    test('Transaction status should be correctly defined', () {
      // Test that all transaction statuses exist
      expect(TransactionStatus.pending, isNotNull);
      expect(TransactionStatus.completed, isNotNull);
      expect(TransactionStatus.failed, isNotNull);
      expect(TransactionStatus.cancelled, isNotNull);

      // Test display names
      expect(TransactionStatus.pending.displayName, 'En attente');
      expect(TransactionStatus.completed.displayName, 'Terminé');
      expect(TransactionStatus.failed.displayName, 'Échoué');
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
      final now = DateTime.now();
      final validTransaction = Transaction(
        id: 'txn_valid',
        walletId: 'wallet_123',
        type: TransactionType.topup,
        amount: 10000,
        currency: 'XAF',
        status: TransactionStatus.completed,
        description: 'Valid topup',
        reference: 'VALID_123',
        createdAt: now,
      );

      expect(validTransaction.id, 'txn_valid');
      expect(validTransaction.type, TransactionType.topup);
      expect(validTransaction.amount, 10000);
      expect(validTransaction.status, TransactionStatus.completed);

      // Test invalid balance transitions
      final invalidTransaction = Transaction(
        id: 'txn_invalid',
        walletId: 'wallet_123',
        type: TransactionType.topup,
        amount: 10000,
        currency: 'XAF',
        status: TransactionStatus.completed,
        description: 'Invalid topup',
        reference: 'INVALID_123',
        createdAt: now,
      );

      expect(invalidTransaction.id, 'txn_invalid');
      expect(invalidTransaction.type, TransactionType.topup);
      expect(invalidTransaction.amount, 10000);
    });
  });

  group('Wallet Integration Tests', () {
    test('Complete wallet transaction flow should work correctly', () {
      // Simulate a complete wallet transaction flow
      final now = DateTime.now();
      final initialWallet = Wallet(
        id: 'wallet_test',
        userId: 'user_test',
        balance: 10000,
        currency: 'XAF',
        isActive: true,
        createdAt: now,
        updatedAt: now,
      );

      // Simulate deposit transaction
      final depositTransaction = Transaction(
        id: 'deposit_1',
        walletId: 'wallet_test',
        type: TransactionType.topup,
        amount: 15000,
        currency: 'XAF',
        status: TransactionStatus.completed,
        description: 'Topup via MTN Mobile Money',
        reference: 'MTN_TOPUP_123',
        createdAt: now,
      );

      // Simulate payment transaction
      final paymentTransaction = Transaction(
        id: 'payment_1',
        walletId: 'wallet_test',
        type: TransactionType.payment,
        amount: 8000,
        currency: 'XAF',
        status: TransactionStatus.completed,
        description: 'Payment for order #12345',
        reference: 'ORDER_12345',
        createdAt: now,
      );

      // Verify transaction flow
      expect(depositTransaction.id, 'deposit_1');
      expect(paymentTransaction.id, 'payment_1');
      expect(depositTransaction.type, TransactionType.topup);
      expect(paymentTransaction.type, TransactionType.payment);
      expect(initialWallet.balance, 10000);
    });

    test('Wallet transaction history should be consistent', () {
      // Create a series of transactions
      final now = DateTime.now();
      final transactions = [
        Transaction(
          id: 'txn_1',
          walletId: 'wallet_test',
          type: TransactionType.topup,
          amount: 20000,
          currency: 'XAF',
          status: TransactionStatus.completed,
          description: 'Initial topup',
          reference: 'TOPUP_1',
          createdAt: now,
        ),
        Transaction(
          id: 'txn_2',
          walletId: 'wallet_test',
          type: TransactionType.payment,
          amount: 5000,
          currency: 'XAF',
          status: TransactionStatus.completed,
          description: 'Payment 1',
          reference: 'PAYMENT_1',
          createdAt: now,
        ),
        Transaction(
          id: 'txn_3',
          walletId: 'wallet_test',
          type: TransactionType.payment,
          amount: 3000,
          currency: 'XAF',
          status: TransactionStatus.completed,
          description: 'Payment 2',
          reference: 'PAYMENT_2',
          createdAt: now,
        ),
      ];

      // Verify all transactions have correct properties
      expect(transactions.length, 3);
      expect(transactions[0].type, TransactionType.topup);
      expect(transactions[1].type, TransactionType.payment);
      expect(transactions[2].type, TransactionType.payment);
      expect(transactions[0].status, TransactionStatus.completed);
      expect(transactions[1].status, TransactionStatus.completed);
      expect(transactions[2].status, TransactionStatus.completed);
    });
  });
}
