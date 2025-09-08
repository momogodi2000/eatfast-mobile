import 'package:flutter/material.dart';
import '../../domain/models/wallet.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final bool showSeeMore;
  final VoidCallback? onSeeMore;

  const TransactionList({
    super.key,
    required this.transactions,
    this.showSeeMore = false,
    this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...transactions.map((transaction) => TransactionTile(
          transaction: transaction,
        )),
        
        if (showSeeMore && onSeeMore != null)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: TextButton(
              onPressed: onSeeMore,
              child: const Text('Voir toutes les transactions'),
            ),
          ),
      ],
    );
  }
}

class TransactionTile extends StatelessWidget {
  final Transaction transaction;

  const TransactionTile({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          // Transaction icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: _getTransactionColor(transaction.type).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _getTransactionIcon(transaction.type),
              size: 24,
              color: _getTransactionColor(transaction.type),
            ),
          ),
          
          const SizedBox(width: 16),
          
          // Transaction details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.type.displayName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                if (transaction.description != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    transaction.description!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
                
                const SizedBox(height: 8),
                
                Row(
                  children: [
                    // Status badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor(transaction.status).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        transaction.status.displayName,
                        style: TextStyle(
                          color: _getStatusColor(transaction.status),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 8),
                    
                    // Date
                    Text(
                      _formatDate(transaction.createdAt),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Amount
          Text(
            '${_getAmountSign(transaction.type)}${transaction.amount.toStringAsFixed(0)} ${transaction.currency}',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: _getAmountColor(transaction.type),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getTransactionIcon(TransactionType type) {
    switch (type) {
      case TransactionType.topup:
        return Icons.add_circle;
      case TransactionType.payment:
        return Icons.shopping_cart;
      case TransactionType.refund:
        return Icons.undo;
      case TransactionType.transfer:
        return Icons.swap_horiz;
      case TransactionType.bonus:
        return Icons.card_giftcard;
      case TransactionType.withdrawal:
        return Icons.remove_circle;
    }
  }

  Color _getTransactionColor(TransactionType type) {
    switch (type) {
      case TransactionType.topup:
        return Colors.green;
      case TransactionType.payment:
        return Colors.blue;
      case TransactionType.refund:
        return Colors.orange;
      case TransactionType.transfer:
        return Colors.purple;
      case TransactionType.bonus:
        return Colors.amber;
      case TransactionType.withdrawal:
        return Colors.red;
    }
  }

  Color _getStatusColor(TransactionStatus status) {
    switch (status) {
      case TransactionStatus.pending:
        return Colors.orange;
      case TransactionStatus.completed:
        return Colors.green;
      case TransactionStatus.failed:
        return Colors.red;
      case TransactionStatus.cancelled:
        return Colors.grey;
    }
  }

  Color _getAmountColor(TransactionType type) {
    switch (type) {
      case TransactionType.topup:
      case TransactionType.refund:
      case TransactionType.bonus:
        return Colors.green;
      case TransactionType.payment:
      case TransactionType.withdrawal:
        return Colors.red;
      case TransactionType.transfer:
        return Colors.blue;
    }
  }

  String _getAmountSign(TransactionType type) {
    switch (type) {
      case TransactionType.topup:
      case TransactionType.refund:
      case TransactionType.bonus:
        return '+';
      case TransactionType.payment:
      case TransactionType.withdrawal:
        return '-';
      case TransactionType.transfer:
        return '';
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return '${difference.inMinutes}m';
      }
      return '${difference.inHours}h';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}j';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}