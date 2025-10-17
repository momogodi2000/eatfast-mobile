import 'package:flutter/material.dart';
import 'package:eatfast_mobile/shared/models/wallet_models.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';

class TransactionTile extends StatelessWidget {
  final WalletTransaction transaction;

  const TransactionTile({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = transaction.type == TransactionType.topup ||
                      transaction.type == TransactionType.refund ||
                      transaction.type == TransactionType.bonus;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: _getTypeColor(transaction.type).withValues(alpha: 0.1),
        child: Icon(
          _getTypeIcon(transaction.type),
          color: _getTypeColor(transaction.type),
        ),
      ),
      title: Text(
        transaction.description,
        style: TextStyle(
          fontWeight: DesignTokens.fontWeightMedium,
          color: DesignTokens.textPrimary,
        ),
      ),
      subtitle: Text(
        _formatDate(transaction.timestamp),
        style: TextStyle(
          fontSize: DesignTokens.fontSizeSM,
          color: DesignTokens.textSecondary,
        ),
      ),
      trailing: Text(
        '${isPositive ? '+' : '-'}\$${transaction.amount.toStringAsFixed(2)}',
        style: TextStyle(
          fontWeight: DesignTokens.fontWeightSemiBold,
          color: isPositive ? DesignTokens.successColor : DesignTokens.errorColor,
          fontSize: DesignTokens.fontSizeLG,
        ),
      ),
    );
  }

  Color _getTypeColor(TransactionType type) {
    switch (type) {
      case TransactionType.topup:
        return DesignTokens.successColor;
      case TransactionType.payment:
        return DesignTokens.primaryColor;
      case TransactionType.refund:
        return DesignTokens.infoColor;
      case TransactionType.bonus:
        return DesignTokens.warningColor;
      case TransactionType.transfer:
        return DesignTokens.secondaryColor;
      case TransactionType.withdrawal:
        return DesignTokens.errorColor;
    }
  }

  IconData _getTypeIcon(TransactionType type) {
    switch (type) {
      case TransactionType.topup:
        return Icons.add_circle;
      case TransactionType.payment:
        return Icons.payment;
      case TransactionType.refund:
        return Icons.undo;
      case TransactionType.bonus:
        return Icons.star;
      case TransactionType.transfer:
        return Icons.swap_horiz;
      case TransactionType.withdrawal:
        return Icons.remove_circle;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
