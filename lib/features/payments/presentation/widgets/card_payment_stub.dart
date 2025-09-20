import 'package:flutter/material.dart';
import '../../domain/models/payment.dart';

/// Card Payment Stub for Testing
/// Provides a simple test interface for card payments before gateway integration
class CardPaymentStub extends StatefulWidget {
  final double amount;
  final String currency;
  final Function(bool success, String? error) onPaymentComplete;

  const CardPaymentStub({
    super.key,
    required this.amount,
    this.currency = 'XAF',
    required this.onPaymentComplete,
  });

  @override
  State<CardPaymentStub> createState() => _CardPaymentStubState();
}

class _CardPaymentStubState extends State<CardPaymentStub> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();
  final _nameController = TextEditingController();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Card Payment - Test Mode',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.orange),
                ),
                child: const Text(
                  'STUB MODE: Use test card 4242424242424242 for testing',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),

              // Card Number
              TextFormField(
                controller: _cardNumberController,
                decoration: const InputDecoration(
                  labelText: 'Card Number',
                  hintText: '4242 4242 4242 4242',
                  prefixIcon: Icon(Icons.credit_card),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Required';
                  final cleaned = value!.replaceAll(' ', '');
                  if (cleaned.length != 16) return 'Invalid card number';
                  return null;
                },
                onChanged: (value) {
                  // Format card number with spaces
                  final cleaned = value.replaceAll(' ', '');
                  final formatted = cleaned.replaceAllMapped(
                    RegExp(r'.{4}'),
                    (match) => '${match.group(0)} ',
                  ).trim();
                  if (formatted != value) {
                    _cardNumberController.value = TextEditingValue(
                      text: formatted,
                      selection: TextSelection.collapsed(offset: formatted.length),
                    );
                  }
                },
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  // Expiry Date
                  Expanded(
                    child: TextFormField(
                      controller: _expiryController,
                      decoration: const InputDecoration(
                        labelText: 'MM/YY',
                        prefixIcon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value?.isEmpty ?? true) return 'Required';
                        final regex = RegExp(r'^\d{2}/\d{2}$');
                        if (!regex.hasMatch(value!)) return 'Invalid format';
                        return null;
                      },
                      onChanged: (value) {
                        // Auto-format MM/YY
                        final cleaned = value.replaceAll('/', '');
                        if (cleaned.length >= 2) {
                          final formatted = '${cleaned.substring(0, 2)}/${cleaned.substring(2, cleaned.length > 4 ? 4 : cleaned.length)}';
                          if (formatted != value) {
                            _expiryController.value = TextEditingValue(
                              text: formatted,
                              selection: TextSelection.collapsed(offset: formatted.length),
                            );
                          }
                        }
                      },
                    ),
                  ),

                  const SizedBox(width: 16),

                  // CVV
                  Expanded(
                    child: TextFormField(
                      controller: _cvvController,
                      decoration: const InputDecoration(
                        labelText: 'CVV',
                        prefixIcon: Icon(Icons.security),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      validator: (value) {
                        if (value?.isEmpty ?? true) return 'Required';
                        if (value!.length < 3) return 'Invalid CVV';
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Cardholder Name
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Cardholder Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Required';
                  return null;
                },
              ),

              const SizedBox(height: 24),

              // Payment Amount Display
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      'Amount to Pay',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${widget.amount.toStringAsFixed(0)} ${widget.currency}',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Pay Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isProcessing ? null : _processPayment,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: _isProcessing
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Text(
                          'Pay ${widget.amount.toStringAsFixed(0)} ${widget.currency}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 16),

              // Test Instructions
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Test Cards:',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text('• Success: 4242424242424242'),
                    const Text('• Decline: 4000000000000002'),
                    const Text('• Use any future MM/YY and any CVV'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _processPayment() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isProcessing = true);

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));

      // Simple stub logic based on card number
      final cardNumber = _cardNumberController.text.replaceAll(' ', '');

      if (cardNumber == '4242424242424242') {
        // Success case
        widget.onPaymentComplete(true, null);
      } else if (cardNumber == '4000000000000002') {
        // Decline case
        widget.onPaymentComplete(false, 'Card declined by issuer');
      } else {
        // Generic success for other test cards
        widget.onPaymentComplete(true, null);
      }
    } catch (e) {
      widget.onPaymentComplete(false, 'Payment processing error: $e');
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}