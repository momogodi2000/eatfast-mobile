import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../shared/widgets/buttons/app_button.dart';
import '../../providers/tip_provider.dart';
import '../../domain/models/tip.dart';

class TipScreen extends ConsumerStatefulWidget {
  final String orderId;
  final String driverId;
  final String driverName;
  final String? driverPhoto;
  final double orderTotal;
  final double deliveryFee;
  final Function(double tipAmount)? onTipAdded;

  const TipScreen({
    super.key,
    required this.orderId,
    required this.driverId,
    required this.driverName,
    this.driverPhoto,
    required this.orderTotal,
    required this.deliveryFee,
    this.onTipAdded,
  });

  @override
  ConsumerState<TipScreen> createState() => _TipScreenState();
}

class _TipScreenState extends ConsumerState<TipScreen> {
  final _customAmountController = TextEditingController();
  final _messageController = TextEditingController();
  
  TipOption? _selectedOption;
  bool _showCustomInput = false;

  @override
  void dispose() {
    _customAmountController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tipState = ref.watch(tipProvider);
    final calculation = ref.watch(tipCalculationProvider);
    final recommendedTips = ref.watch(recommendedTipsProvider(widget.orderTotal));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pourboire'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Driver info
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: widget.driverPhoto != null
                              ? AssetImage(widget.driverPhoto!)
                              : null,
                          child: widget.driverPhoto == null
                              ? const Icon(Icons.person, size: 30)
                              : null,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.driverName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Votre livreur',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '4.9',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Icon(
                                    Icons.delivery_dining,
                                    color: Colors.green,
                                    size: 16,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '250+ livraisons',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Tip options title
                  const Text(
                    'Montrez votre appréciation',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Le pourboire va directement à votre livreur',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Quick tip options
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 2.5,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: recommendedTips.length,
                    itemBuilder: (context, index) {
                      final option = recommendedTips[index];
                      final isSelected = _selectedOption == option && !_showCustomInput;
                      
                      return GestureDetector(
                        onTap: () => _selectTipOption(option),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected 
                                ? DesignTokens.primaryColor 
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected 
                                  ? DesignTokens.primaryColor 
                                  : Colors.grey[300]!,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                option.label,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected ? Colors.white : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${option.calculateAmount(widget.orderTotal).toInt()} FCFA',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isSelected 
                                      ? Colors.white.withOpacity(0.8)
                                      : Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  // Custom amount button
                  GestureDetector(
                    onTap: _showCustomTipInput,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _showCustomInput 
                            ? DesignTokens.primaryColor 
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _showCustomInput 
                              ? DesignTokens.primaryColor 
                              : Colors.grey[300]!,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            color: _showCustomInput ? Colors.white : Colors.grey[600],
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Montant personnalisé',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _showCustomInput ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Custom amount input
                  if (_showCustomInput) ...[
                    const SizedBox(height: 16),
                    TextField(
                      controller: _customAmountController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Montant du pourboire (FCFA)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: const Icon(Icons.payments),
                        suffixText: 'FCFA',
                      ),
                      onChanged: _onCustomAmountChanged,
                      autofocus: true,
                    ),
                  ],

                  const SizedBox(height: 24),

                  // Optional message
                  const Text(
                    'Message pour le livreur (optionnel)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  TextField(
                    controller: _messageController,
                    maxLines: 3,
                    maxLength: 200,
                    decoration: InputDecoration(
                      hintText: 'Merci pour la livraison rapide!',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Order summary with tip
                  if (calculation != null && calculation.tipAmount > 0) ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Sous-total commande'),
                              Text('${widget.orderTotal.toInt()} FCFA'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Frais de livraison'),
                              Text('${widget.deliveryFee.toInt()} FCFA'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Pourboire',
                                style: TextStyle(
                                  color: DesignTokens.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                calculation.formattedTip,
                                style: const TextStyle(
                                  color: DesignTokens.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Divider(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                calculation.formattedTotal,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],

                  if (tipState.error != null) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red[200]!),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.error_outline, color: Colors.red[600]),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              tipState.error!,
                              style: TextStyle(color: Colors.red[600]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          // Bottom action buttons
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Skip tip button
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: _skipTip,
                      child: const Text(
                        'Passer le pourboire',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Add tip button
                  SizedBox(
                    width: double.infinity,
                    child: AppButton(
                      onPressed: calculation != null && 
                                 calculation.isValid && 
                                 calculation.tipAmount > 0 &&
                                 !tipState.isSubmitting
                          ? _submitTip
                          : null,
                      text: calculation != null && calculation.tipAmount > 0
                          ? 'Ajouter ${calculation.formattedTip}'
                          : 'Sélectionner un montant',
                      isLoading: tipState.isSubmitting,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _selectTipOption(TipOption option) {
    setState(() {
      _selectedOption = option;
      _showCustomInput = false;
      _customAmountController.clear();
    });
    
    ref.read(tipProvider.notifier).selectTipOption(
      option,
      widget.orderTotal,
      widget.deliveryFee,
    );
  }

  void _showCustomTipInput() {
    setState(() {
      _showCustomInput = true;
      _selectedOption = null;
    });
    
    ref.read(tipProvider.notifier).clearTip();
  }

  void _onCustomAmountChanged(String value) {
    if (value.isNotEmpty) {
      final amount = double.tryParse(value) ?? 0.0;
      ref.read(tipProvider.notifier).setCustomTipAmount(
        amount,
        widget.orderTotal,
        widget.deliveryFee,
      );
    } else {
      ref.read(tipProvider.notifier).clearTip();
    }
  }

  void _skipTip() {
    widget.onTipAdded?.call(0.0);
    context.pop();
  }

  Future<void> _submitTip() async {
    final calculation = ref.read(tipCalculationProvider);
    if (calculation == null || !calculation.isValid) return;

    final success = await ref.read(tipProvider.notifier).submitTip(
      orderId: widget.orderId,
      driverId: widget.driverId,
      driverName: widget.driverName,
      message: _messageController.text.trim().isEmpty 
          ? null 
          : _messageController.text.trim(),
    );

    if (success && mounted) {
      widget.onTipAdded?.call(calculation.tipAmount);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Pourboire de ${calculation.formattedTip} envoyé à ${widget.driverName}!'),
          backgroundColor: Colors.green,
        ),
      );
      
      context.pop();
    }
  }
}
