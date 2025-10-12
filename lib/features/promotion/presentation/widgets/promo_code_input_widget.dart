/// Promo Code Input Widget
/// Allows users to enter and apply promo codes to their orders
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/promo_code_service.dart';

class PromoCodeInputWidget extends StatefulWidget {
  final String orderId;
  final double orderAmount;
  final Function(PromoCodeAppliedData) onPromoApplied;
  final Function()? onPromoRemoved;

  const PromoCodeInputWidget({
    super.key,
    required this.orderId,
    required this.orderAmount,
    required this.onPromoApplied,
    this.onPromoRemoved,
  });

  @override
  State<PromoCodeInputWidget> createState() => _PromoCodeInputWidgetState();
}

class _PromoCodeInputWidgetState extends State<PromoCodeInputWidget> {
  final _controller = TextEditingController();
  final _service = PromoCodeService();

  bool _isValidating = false;
  bool _isApplied = false;
  String? _errorMessage;
  PromoCodeAppliedData? _appliedPromo;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _applyPromoCode() async {
    final code = _controller.text.trim().toUpperCase();
    if (code.isEmpty) return;

    setState(() {
      _isValidating = true;
      _errorMessage = null;
    });

    try {
      final result = await _service.validatePromoCode(
        code: code,
        orderId: widget.orderId,
        orderAmount: widget.orderAmount,
      );

      if (result.isValid) {
        setState(() {
          _isApplied = true;
          _appliedPromo = result;
        });
        widget.onPromoApplied(result);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Code promo appliqué! ${result.discountDescription}'),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      } else {
        setState(() {
          _errorMessage = result.errorMessage ?? 'Code promo invalide';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Erreur lors de la validation du code';
      });
    } finally {
      setState(() {
        _isValidating = false;
      });
    }
  }

  void _removePromoCode() {
    setState(() {
      _isApplied = false;
      _appliedPromo = null;
      _controller.clear();
      _errorMessage = null;
    });
    widget.onPromoRemoved?.call();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Code promo retiré'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.local_offer,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Code Promo',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            if (!_isApplied) ...[
              // Input Field
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Entrez votre code',
                        errorText: _errorMessage,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                      ),
                      textCapitalization: TextCapitalization.characters,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]')),
                        LengthLimitingTextInputFormatter(20),
                      ],
                      onChanged: (value) {
                        if (_errorMessage != null) {
                          setState(() => _errorMessage = null);
                        }
                      },
                      onSubmitted: (_) => _applyPromoCode(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _isValidating ? null : _applyPromoCode,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: _isValidating
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text('Appliquer'),
                  ),
                ],
              ),
            ] else ...[
              // Applied Promo Display
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green, width: 1),
                ),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _controller.text.toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _appliedPromo?.discountDescription ?? '',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.green[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.red),
                      onPressed: _removePromoCode,
                      tooltip: 'Retirer le code',
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
