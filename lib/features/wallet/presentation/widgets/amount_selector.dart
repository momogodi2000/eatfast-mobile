import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmountSelector extends StatefulWidget {
  final double? selectedAmount;
  final Function(double) onAmountSelected;

  const AmountSelector({
    super.key,
    this.selectedAmount,
    required this.onAmountSelected,
  });

  @override
  State<AmountSelector> createState() => _AmountSelectorState();
}

class _AmountSelectorState extends State<AmountSelector> {
  final TextEditingController _customAmountController = TextEditingController();
  final List<double> _quickAmounts = [1000, 2500, 5000, 10000, 25000, 50000];
  bool _useCustomAmount = false;

  @override
  void initState() {
    super.initState();
    if (widget.selectedAmount != null && 
        !_quickAmounts.contains(widget.selectedAmount)) {
      _useCustomAmount = true;
      _customAmountController.text = widget.selectedAmount!.toStringAsFixed(0);
    }
  }

  @override
  void dispose() {
    _customAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Quick Amount Selection
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _quickAmounts.map((amount) {
            final isSelected = !_useCustomAmount && widget.selectedAmount == amount;
            return _AmountChip(
              amount: amount,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  _useCustomAmount = false;
                  _customAmountController.clear();
                });
                widget.onAmountSelected(amount);
              },
            );
          }).toList(),
        ),
        
        const SizedBox(height: 16),
        
        // Custom Amount Toggle
        GestureDetector(
          onTap: () {
            setState(() {
              _useCustomAmount = !_useCustomAmount;
              if (!_useCustomAmount) {
                _customAmountController.clear();
              }
            });
          },
          child: Row(
            children: [
              Checkbox(
                value: _useCustomAmount,
                onChanged: (value) {
                  setState(() {
                    _useCustomAmount = value ?? false;
                    if (!_useCustomAmount) {
                      _customAmountController.clear();
                    }
                  });
                },
                activeColor: Theme.of(context).primaryColor,
              ),
              const Text('Montant personnalisé'),
            ],
          ),
        ),
        
        // Custom Amount Input
        if (_useCustomAmount) ...[
          const SizedBox(height: 16),
          TextFormField(
            controller: _customAmountController,
            decoration: InputDecoration(
              hintText: 'Entrez le montant',
              prefixIcon: const Icon(Icons.attach_money),
              suffixText: 'XAF',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(8),
            ],
            onChanged: (value) {
              if (value.isNotEmpty) {
                final amount = double.tryParse(value);
                if (amount != null && amount > 0) {
                  widget.onAmountSelected(amount);
                }
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un montant';
              }
              final amount = double.tryParse(value);
              if (amount == null || amount <= 0) {
                return 'Montant invalide';
              }
              if (amount < 500) {
                return 'Le montant minimum est de 500 XAF';
              }
              if (amount > 100000) {
                return 'Le montant maximum est de 100,000 XAF';
              }
              return null;
            },
          ),
        ],
      ],
    );
  }
}

class _AmountChip extends StatelessWidget {
  final double amount;
  final bool isSelected;
  final VoidCallback onTap;

  const _AmountChip({
    required this.amount,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : Colors.white,
          border: Border.all(
            color: isSelected 
                ? Theme.of(context).primaryColor 
                : Colors.grey[300]!,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          '${amount.toStringAsFixed(0)} XAF',
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}