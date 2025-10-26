/// Mobile Money Payment Widget
/// Supports MTN Mobile Money, Orange Money, and EU Mobile for Cameroon
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eatfast_mobile/shared/services/payment/data/unified_payment_service.dart';
import 'package:eatfast_mobile/shared/config/app_config.dart';

class MobileMoneyPaymentWidget extends StatefulWidget {
  final String orderId;
  final double amount;
  final Function(PaymentResponse) onPaymentSuccess;
  final Function(String) onPaymentError;

  const MobileMoneyPaymentWidget({
    super.key,
    required this.orderId,
    required this.amount,
    required this.onPaymentSuccess,
    required this.onPaymentError,
  });

  @override
  State<MobileMoneyPaymentWidget> createState() => _MobileMoneyPaymentWidgetState();
}

class _MobileMoneyPaymentWidgetState extends State<MobileMoneyPaymentWidget> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _paymentService = UnifiedPaymentService();

  PaymentMethod _selectedMethod = PaymentMethod.mtn;
  bool _isProcessing = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _processPayment() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isProcessing = true);

    try {
      final response = await _paymentService.processPayment(
        orderId: widget.orderId,
        amount: widget.amount,
        method: _selectedMethod,
        phoneNumber: '${AppConfig.countryCode}${_phoneController.text}',
        currency: AppConfig.currency,
      );

      if (response.status == PaymentStatus.completed ||
          response.status == PaymentStatus.processing) {
        widget.onPaymentSuccess(response);
      } else {
        widget.onPaymentError(response.instructions ?? 'Payment failed');
      }
    } on PaymentException catch (e) {
      widget.onPaymentError(e.message);
    } catch (e) {
      widget.onPaymentError('Une erreur inattendue s\'est produite');
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mobile Money',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Payez avec MTN, Orange ou EU Mobile',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 24),

              // Payment Method Selection
              _buildPaymentMethodSelector(),

              const SizedBox(height: 24),

              // Phone Number Input
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Num�ro de t�l�phone',
                  hintText: '6XXXXXXXX',
                  prefixText: '${AppConfig.countryCode} ',
                  prefixIcon: Icon(Icons.phone, color: _getProviderColor()),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: _getProviderColor(), width: 2),
                  ),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(9),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre num�ro';
                  }
                  if (value.length != 9) {
                    return 'Le num�ro doit contenir 9 chiffres';
                  }
                  // Validate operator prefix
                  if (_selectedMethod == PaymentMethod.mtn) {
                    if (!value.startsWith('67') && !value.startsWith('65') &&
                        !value.startsWith('68')) {
                      return 'Num�ro MTN invalide (doit commencer par 67, 65 ou 68)';
                    }
                  } else if (_selectedMethod == PaymentMethod.orange) {
                    if (!value.startsWith('69') && !value.startsWith('65')) {
                      return 'Num�ro Orange invalide (doit commencer par 69 ou 65)';
                    }
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              // Amount Display
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _getProviderColor().withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Montant � payer',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '${widget.amount.toStringAsFixed(0)} ${AppConfig.currencySymbol}',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: _getProviderColor(),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Instructions
              _buildInstructions(),

              const SizedBox(height: 24),

              // Pay Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isProcessing ? null : _processPayment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _getProviderColor(),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isProcessing
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Text(
                          'Payer ${widget.amount.toStringAsFixed(0)} ${AppConfig.currencySymbol}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choisissez votre op�rateur',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildProviderCard(
              PaymentMethod.mtn,
              'MTN MoMo',
              Colors.yellow[700]!,
              Icons.phone_android,
            ),
            const SizedBox(width: 12),
            _buildProviderCard(
              PaymentMethod.orange,
              'Orange Money',
              Colors.orange[700]!,
              Icons.phone_android,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProviderCard(PaymentMethod method, String name, Color color, IconData icon) {
    final isSelected = _selectedMethod == method;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _selectedMethod = method),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            color: isSelected ? color.withValues(alpha: 0.1) : Colors.grey[100],
            border: Border.all(
              color: isSelected ? color : Colors.grey[300]!,
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 32,
                color: isSelected ? color : Colors.grey[600],
              ),
              const SizedBox(height: 8),
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? color : Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInstructions() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, size: 20, color: Colors.blue[700]),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _getInstructionText(),
              style: TextStyle(
                fontSize: 12,
                color: Colors.blue[900],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getInstructionText() {
    switch (_selectedMethod) {
      case PaymentMethod.mtn:
        return 'Vous recevrez une notification sur votre t�l�phone MTN MoMo. Composez *126# pour confirmer le paiement.';
      case PaymentMethod.orange:
        return 'Vous recevrez une notification sur votre t�l�phone Orange Money. Composez #150# pour confirmer le paiement.';
      default:
        return 'Suivez les instructions sur votre t�l�phone pour confirmer le paiement.';
    }
  }

  Color _getProviderColor() {
    switch (_selectedMethod) {
      case PaymentMethod.mtn:
        return Colors.yellow[700]!;
      case PaymentMethod.orange:
        return Colors.orange[700]!;
      default:
        return Theme.of(context).primaryColor;
    }
  }
}
