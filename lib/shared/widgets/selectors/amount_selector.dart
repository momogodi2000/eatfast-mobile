import 'package:flutter/material.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';

class AmountSelector extends StatefulWidget {
  final Function(double) onAmountSelected;
  final double? initialAmount;

  const AmountSelector({
    super.key,
    required this.onAmountSelected,
    this.initialAmount,
  });

  @override
  State<AmountSelector> createState() => _AmountSelectorState();
}

class _AmountSelectorState extends State<AmountSelector> {
  final TextEditingController _controller = TextEditingController();
  final List<double> _presetAmounts = [500, 1000, 2000, 5000, 10000];

  @override
  void initState() {
    super.initState();
    if (widget.initialAmount != null) {
      _controller.text = widget.initialAmount.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Amount',
          style: TextStyle(
            fontSize: DesignTokens.fontSizeLG,
            fontWeight: DesignTokens.fontWeightSemiBold,
            color: DesignTokens.textPrimary,
          ),
        ),
        const SizedBox(height: DesignTokens.spaceMD),
        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Enter amount',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
            ),
          ),
          onChanged: (value) {
            final amount = double.tryParse(value);
            if (amount != null) {
              widget.onAmountSelected(amount);
            }
          },
        ),
        const SizedBox(height: DesignTokens.spaceMD),
        Wrap(
          spacing: DesignTokens.spaceSM,
          runSpacing: DesignTokens.spaceSM,
          children: _presetAmounts.map((amount) {
            return OutlinedButton(
              onPressed: () {
                _controller.text = amount.toString();
                widget.onAmountSelected(amount);
              },
              child: Text('${amount.toInt()}'),
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
