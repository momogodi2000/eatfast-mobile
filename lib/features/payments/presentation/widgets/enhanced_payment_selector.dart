/// Enhanced Payment Selector with Failover Support
/// Shows all payment methods with gateway information and failover status

import 'package:flutter/material.dart';
import '../../domain/models/payment.dart';
import '../../../../core/services/payment/unified_payment_service.dart';

class EnhancedPaymentSelector extends StatefulWidget {
  final double amount;
  final String currency;
  final PaymentMethod? selectedMethod;
  final Function(PaymentMethod) onMethodSelected;
  final String? phoneNumber;
  final Function(String)? onPhoneNumberChanged;

  const EnhancedPaymentSelector({
    super.key,
    required this.amount,
    this.currency = 'XAF',
    this.selectedMethod,
    required this.onMethodSelected,
    this.phoneNumber,
    this.onPhoneNumberChanged,
  });

  @override
  State<EnhancedPaymentSelector> createState() => _EnhancedPaymentSelectorState();
}

class _EnhancedPaymentSelectorState extends State<EnhancedPaymentSelector> {
  final UnifiedPaymentService _paymentService = UnifiedPaymentService();
  Map<PaymentMethod, PaymentMethodInfo>? _paymentMethodInfo;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPaymentMethods();
  }

  Future<void> _loadPaymentMethods() async {
    try {
      final info = await _paymentService.getPaymentMethodFees(
        amount: widget.amount,
        currency: widget.currency,
      );
      setState(() {
        _paymentMethodInfo = info;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_paymentMethodInfo == null) {
      return const Center(
        child: Text('Failed to load payment methods'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Méthodes de paiement',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        ...PaymentMethod.values
            .where((method) => _paymentMethodInfo![method]?.isEnabled == true)
            .map((method) => _buildPaymentMethodTile(method))
            .toList(),

        // Show phone number input for methods that require it
        if (widget.selectedMethod?.requiresPhoneNumber == true) ...[
          const SizedBox(height: 16),
          _buildPhoneNumberInput(),
        ],
      ],
    );
  }

  Widget _buildPaymentMethodTile(PaymentMethod method) {
    final info = _paymentMethodInfo![method]!;
    final isSelected = widget.selectedMethod == method;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(method.icon),
          backgroundColor: Colors.grey[200],
        ),
        title: Row(
          children: [
            Text(method.displayName),
            if (info.hasFailover) ...[
              const SizedBox(width: 8),
              Chip(
                label: const Text('Failover'),
                backgroundColor: Colors.blue[100],
                labelStyle: const TextStyle(fontSize: 10),
              ),
            ],
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (info.fee > 0)
              Text('Frais: ${info.fee.toStringAsFixed(0)} ${widget.currency}'),
            if (info.hasFailover)
              Text(
                'Principal: ${info.primaryGateway}, Secours: ${info.fallbackGateways.join(", ")}',
                style: Theme.of(context).textTheme.bodySmall,
              )
            else
              Text(
                'Passerelle: ${info.primaryGateway}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ],
        ),
        trailing: isSelected
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.radio_button_unchecked),
        onTap: () => widget.onMethodSelected(method),
        selected: isSelected,
      ),
    );
  }

  Widget _buildPhoneNumberInput() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Numéro de téléphone',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                hintText: '+237 6XX XXX XXX',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
              onChanged: widget.onPhoneNumberChanged,
              controller: TextEditingController(text: widget.phoneNumber),
            ),
            const SizedBox(height: 8),
            Text(
              'Requis pour ${widget.selectedMethod?.displayName}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

/// Payment Processing Widget with Failover Status
class PaymentProcessingWidget extends StatefulWidget {
  final String orderId;
  final double amount;
  final PaymentMethod method;
  final String? phoneNumber;
  final String? paymentMethodId;
  final Map<String, dynamic>? billingDetails;

  const PaymentProcessingWidget({
    super.key,
    required this.orderId,
    required this.amount,
    required this.method,
    this.phoneNumber,
    this.paymentMethodId,
    this.billingDetails,
  });

  @override
  State<PaymentProcessingWidget> createState() => _PaymentProcessingWidgetState();
}

class _PaymentProcessingWidgetState extends State<PaymentProcessingWidget> {
  final UnifiedPaymentService _paymentService = UnifiedPaymentService();
  String _currentStatus = 'Initialisation du paiement...';
  String? _currentGateway;
  bool _isProcessing = true;
  PaymentResponse? _result;
  String? _error;

  @override
  void initState() {
    super.initState();
    _processPayment();
  }

  Future<void> _processPayment() async {
    try {
      setState(() {
        _currentStatus = 'Traitement du paiement...';
      });

      final result = await _paymentService.processPaymentWithFailover(
        orderId: widget.orderId,
        amount: widget.amount,
        method: widget.method,
        phoneNumber: widget.phoneNumber,
        paymentMethodId: widget.paymentMethodId,
        billingDetails: widget.billingDetails,
      );

      setState(() {
        _result = result;
        _isProcessing = false;
        _currentStatus = 'Paiement traité avec succès';
        _currentGateway = result.additionalData?['gateway'];
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isProcessing = false;
        _currentStatus = 'Échec du paiement';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (_isProcessing)
              const CircularProgressIndicator()
            else if (_error != null)
              const Icon(Icons.error, color: Colors.red, size: 48)
            else
              const Icon(Icons.check_circle, color: Colors.green, size: 48),

            const SizedBox(height: 16),

            Text(
              _currentStatus,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 8),

            if (_currentGateway != null)
              Text(
                'Passerelle utilisée: $_currentGateway',
                style: Theme.of(context).textTheme.bodySmall,
              ),

            if (_error != null) ...[
              const SizedBox(height: 8),
              Text(
                _error!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
            ],

            if (_result != null) ...[
              const SizedBox(height: 16),
              Text(
                'ID de paiement: ${_result!.paymentId}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              if (_result!.instructions != null) ...[
                const SizedBox(height: 8),
                Text(
                  _result!.instructions!,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}

/// Payment Method Comparison Widget
class PaymentMethodComparisonWidget extends StatelessWidget {
  final double amount;
  final String currency;

  const PaymentMethodComparisonWidget({
    super.key,
    required this.amount,
    this.currency = 'XAF',
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<PaymentMethod, PaymentMethodInfo>>(
      future: UnifiedPaymentService().getPaymentMethodFees(
        amount: amount,
        currency: currency,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData) {
          return const Center(child: Text('Impossible de charger les méthodes de paiement'));
        }

        final methods = snapshot.data!;
        final enabledMethods = methods.entries
            .where((entry) => entry.value.isEnabled)
            .toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Comparaison des méthodes de paiement',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            DataTable(
              columns: const [
                DataColumn(label: Text('Méthode')),
                DataColumn(label: Text('Frais')),
                DataColumn(label: Text('Failover')),
                DataColumn(label: Text('Statut')),
              ],
              rows: enabledMethods.map((entry) {
                final method = entry.key;
                final info = entry.value;

                return DataRow(cells: [
                  DataCell(Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(method.icon),
                        radius: 12,
                      ),
                      const SizedBox(width: 8),
                      Text(method.displayName),
                    ],
                  )),
                  DataCell(Text('${info.fee.toStringAsFixed(0)} $currency')),
                  DataCell(info.hasFailover
                      ? const Icon(Icons.check, color: Colors.green)
                      : const Icon(Icons.close, color: Colors.red)),
                  DataCell(info.isEnabled
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : const Icon(Icons.cancel, color: Colors.red)),
                ]);
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}