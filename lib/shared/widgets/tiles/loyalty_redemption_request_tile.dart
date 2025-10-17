import 'package:flutter/material.dart';
import 'package:eatfast_mobile/shared/models/loyalty_models.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';

class LoyaltyRedemptionRequestTile extends StatelessWidget {
  final LoyaltyRedemptionRequest request;

  const LoyaltyRedemptionRequestTile({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: DesignTokens.spaceMD,
        vertical: DesignTokens.spaceXS,
      ),
      child: Padding(
        padding: EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: _getStatusColor(request.status).withValues(alpha: 0.1),
                  child: Icon(
                    _getStatusIcon(request.status),
                    color: _getStatusColor(request.status),
                  ),
                ),
                SizedBox(width: DesignTokens.spaceMD),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request.reward.title,
                        style: TextStyle(
                          fontWeight: DesignTokens.fontWeightMedium,
                          color: DesignTokens.textPrimary,
                        ),
                      ),
                      Text(
                        'Points: ${request.pointsRequired}',
                        style: TextStyle(
                          fontSize: DesignTokens.fontSizeSM,
                          color: DesignTokens.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  _getStatusText(request.status),
                  style: TextStyle(
                    fontSize: DesignTokens.fontSizeSM,
                    color: _getStatusColor(request.status),
                    fontWeight: DesignTokens.fontWeightMedium,
                  ),
                ),
              ],
            ),
            if (request.status == RedemptionStatus.pending)
              Padding(
                padding: EdgeInsets.only(top: DesignTokens.spaceSM),
                child: Text(
                  'Processing your redemption request...',
                  style: TextStyle(
                    fontSize: DesignTokens.fontSizeSM,
                    color: DesignTokens.textSecondary,
                  ),
                ),
              ),
            if (request.status == RedemptionStatus.completed)
              Padding(
                padding: EdgeInsets.only(top: DesignTokens.spaceSM),
                child: Text(
                  'Redeemed on ${_formatDate(request.redeemedAt!)}',
                  style: TextStyle(
                    fontSize: DesignTokens.fontSizeSM,
                    color: DesignTokens.textSecondary,
                  ),
                ),
              ),
            if (request.status == RedemptionStatus.rejected && request.rejectionReason != null)
              Padding(
                padding: EdgeInsets.only(top: DesignTokens.spacingSM),
                child: Text(
                  'Rejected: ${request.rejectionReason}',
                  style: TextStyle(
                    fontSize: DesignTokens.fontSizeSM,
                    color: DesignTokens.errorColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(RedemptionStatus status) {
    switch (status) {
      case RedemptionStatus.pending:
        return DesignTokens.warningColor;
      case RedemptionStatus.completed:
        return DesignTokens.successColor;
      case RedemptionStatus.rejected:
        return DesignTokens.errorColor;
    }
  }

  IconData _getStatusIcon(RedemptionStatus status) {
    switch (status) {
      case RedemptionStatus.pending:
        return Icons.hourglass_empty;
      case RedemptionStatus.completed:
        return Icons.check_circle;
      case RedemptionStatus.rejected:
        return Icons.cancel;
    }
  }

  String _getStatusText(RedemptionStatus status) {
    switch (status) {
      case RedemptionStatus.pending:
        return 'Pending';
      case RedemptionStatus.completed:
        return 'Completed';
      case RedemptionStatus.rejected:
        return 'Rejected';
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
