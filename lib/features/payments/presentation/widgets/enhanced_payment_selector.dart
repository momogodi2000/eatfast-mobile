/// Enhanced Payment Selector with Failover Support
/// Shows all payment methods with gateway information and failover status

import 'package:flutter/material.dart';
import '../../domain/models/payment.dart' as domain;
import '../../../../core/services/payment/unified_payment_service.dart' as service;

class EnhancedPaymentSelector extends StatefulWidget {
  final double amount;
  final String currency;
  final domain.PaymentMethod? selectedMethod;
  final Function(domain.PaymentMethod) onMethodSelected;
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
  final service.UnifiedPaymentService _paymentService = service.UnifiedPaymentService();
  List<domain.PaymentMethod>? _paymentMethods;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPaymentMethods();
  }

  Future<void> _loadPaymentMethods() async {
    try {
      final serviceMethods = await _paymentService.getAvailablePaymentMethods();
      setState(() {
        _paymentMethods = serviceMethods.map((m) => _convertPaymentMethod(m)).whereType<domain.PaymentMethod>().toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _paymentMethods = domain.PaymentMethod.values; // Fallback to all methods
        _isLoading = false;
      });
    }
  }

  domain.PaymentMethod? _convertPaymentMethod(service.PaymentMethod serviceMethod) {
    switch (serviceMethod) {
      case service.PaymentMethod.cash:
        return domain.PaymentMethod.cash;
      case service.PaymentMethod.campay:
        return domain.PaymentMethod.campay;
      case service.PaymentMethod.noupay:
        return domain.PaymentMethod.noupay;
      case service.PaymentMethod.stripe:
        return domain.PaymentMethod.stripe;
      case service.PaymentMethod.wallet:
        return domain.PaymentMethod.wallet;
      case service.PaymentMethod.mtn:
        return domain.PaymentMethod.mtn;
      case service.PaymentMethod.orange:
        return domain.PaymentMethod.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_paymentMethods == null || _paymentMethods!.isEmpty) {
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
        ..._paymentMethods!
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

  Widget _buildPaymentMethodTile(domain.PaymentMethod method) {
    final isSelected = widget.selectedMethod == method;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(method.icon),
          backgroundColor: Colors.grey[200],
        ),
        title: Text(method.displayName),
        subtitle: Text(
          _getMethodDescription(method),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: isSelected
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.radio_button_unchecked),
        onTap: () => widget.onMethodSelected(method),
        selected: isSelected,
      ),
    );
  }

  String _getMethodDescription(domain.PaymentMethod method) {
    switch (method) {
      case domain.PaymentMethod.cash:
        return 'Paiement à la livraison';
      case domain.PaymentMethod.campay:
        return 'Mobile Money via CamPay';
      case domain.PaymentMethod.noupay:
        return 'Portefeuille digital NouPay';
      case domain.PaymentMethod.stripe:
        return 'Carte bancaire sécurisée';
      case domain.PaymentMethod.wallet:
        return 'Portefeuille EatFast';
      case domain.PaymentMethod.mtn:
        return 'MTN Mobile Money';
      case domain.PaymentMethod.orange:
        return 'Orange Money';
    }
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
  final domain.PaymentMethod method;
  final String? phoneNumber;
  final String? paymentMethodId;

  const PaymentProcessingWidget({
    super.key,
    required this.orderId,
    required this.amount,
    required this.method,
    this.phoneNumber,
    this.paymentMethodId,
  });

  @override
  State<PaymentProcessingWidget> createState() => _PaymentProcessingWidgetState();
}

class _PaymentProcessingWidgetState extends State<PaymentProcessingWidget> {
  final service.UnifiedPaymentService _paymentService = service.UnifiedPaymentService();
  String _currentStatus = 'Initialisation du paiement...';
  String? _currentGateway;
  bool _isProcessing = true;
  service.PaymentResponse? _result;
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

      final serviceMethod = _convertDomainToServiceMethod(widget.method);
      if (serviceMethod == null) {
        throw Exception('Méthode de paiement non supportée');
      }

      final result = await _paymentService.processPayment(
        orderId: widget.orderId,
        amount: widget.amount,
        method: serviceMethod,
        phoneNumber: widget.phoneNumber,
        paymentMethodId: widget.paymentMethodId,
      );

      setState(() {
        _result = result;
        _isProcessing = false;
        _currentStatus = 'Paiement traité avec succès';
        _currentGateway = result.gatewayUsed;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isProcessing = false;
        _currentStatus = 'Échec du paiement';
      });
    }
  }

  service.PaymentMethod? _convertDomainToServiceMethod(domain.PaymentMethod domainMethod) {
    switch (domainMethod) {
      case domain.PaymentMethod.cash:
        return service.PaymentMethod.cash;
      case domain.PaymentMethod.campay:
        return service.PaymentMethod.campay;
      case domain.PaymentMethod.noupay:
        return service.PaymentMethod.noupay;
      case domain.PaymentMethod.stripe:
        return service.PaymentMethod.stripe;
      case domain.PaymentMethod.wallet:
        return service.PaymentMethod.wallet;
      case domain.PaymentMethod.mtn:
        return service.PaymentMethod.mtn;
      case domain.PaymentMethod.orange:
        return service.PaymentMethod.orange;
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
    return FutureBuilder<List<service.PaymentMethod>>(
      future: service.UnifiedPaymentService().getAvailablePaymentMethods(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData) {
          return const Center(child: Text('Impossible de charger les méthodes de paiement'));
        }

        final methods = snapshot.data!;

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
                DataColumn(label: Text('Statut')),
              ],
              rows: methods.map((method) {
                return DataRow(cells: [
                  DataCell(Row(
                    children: [
                      const SizedBox(width: 8),
                      Text(method.displayName),
                    ],
                  )),
                  DataCell(const Icon(Icons.check_circle, color: Colors.green)),
                ]);
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}