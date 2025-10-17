import 'package:flutter/material.dart';
import 'package:eatfast_mobile/shared/models/wallet_models.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';

class PaymentMethodSelector extends StatefulWidget {
  final Function(PaymentMethod) onMethodSelected;
  final PaymentMethod? initialMethod;

  const PaymentMethodSelector({
    super.key,
    required this.onMethodSelected,
    this.initialMethod,
  });

  @override
  State<PaymentMethodSelector> createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<PaymentMethodSelector> {
  PaymentMethod? _selectedMethod;

  @override
  void initState() {
    super.initState();
    _selectedMethod = widget.initialMethod;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Method',
          style: TextStyle(
            fontSize: DesignTokens.fontSizeLG,
            fontWeight: DesignTokens.fontWeightSemiBold,
            color: DesignTokens.textPrimary,
          ),
        ),
        const SizedBox(height: DesignTokens.spaceMD),
        ...PaymentMethod.values.map((method) {
          return RadioListTile<PaymentMethod>(
            title: Text(_getMethodName(method)),
            value: method,
            groupValue: _selectedMethod,
            onChanged: (value) {
              if (value != null) {
                setState(() => _selectedMethod = value);
                widget.onMethodSelected(value);
              }
            },
          );
        }),
      ],
    );
  }

  String _getMethodName(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.mtnMoney:
        return 'MTN Money';
      case PaymentMethod.orangeMoney:
        return 'Orange Money';
      case PaymentMethod.card:
        return 'Credit/Debit Card';
      case PaymentMethod.bankTransfer:
        return 'Bank Transfer';
    }
  }
}
