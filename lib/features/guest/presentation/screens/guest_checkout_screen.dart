/// Guest Checkout Screen
/// Allows guest users to place orders without registration

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/guest_service.dart';
import '../../domain/models/guest_models.dart';
import '../../../payments/presentation/widgets/enhanced_payment_selector.dart';
import '../../../payments/domain/models/payment.dart';
import '../../../../core/config/app_config.dart';

class GuestCheckoutScreen extends ConsumerStatefulWidget {
  final String restaurantId;
  final String restaurantName;
  final List<Map<String, dynamic>> cartItems;
  final double subtotal;

  const GuestCheckoutScreen({
    super.key,
    required this.restaurantId,
    required this.restaurantName,
    required this.cartItems,
    required this.subtotal,
  });

  @override
  ConsumerState<GuestCheckoutScreen> createState() => _GuestCheckoutScreenState();
}

class _GuestCheckoutScreenState extends ConsumerState<GuestCheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _instructionsController = TextEditingController();

  final GuestService _guestService = GuestService();

  PaymentMethod _selectedPaymentMethod = PaymentMethod.cash;
  double _deliveryFee = 0.0;
  bool _isLoading = false;
  bool _agreedToTerms = false;
  String? _currentSessionId;

  @override
  void initState() {
    super.initState();
    _initializeGuestSession();
    _phoneController.text = AppConfig.countryCode; // Pre-fill country code
  }

  Future<void> _initializeGuestSession() async {
    try {
      final sessionId = await _guestService.initializeGuestSession();
      setState(() {
        _currentSessionId = sessionId;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur d\'initialisation: $e')),
        );
      }
    }
  }

  Future<void> _calculateDeliveryFee(double lat, double lng) async {
    try {
      final fee = await _guestService.calculateDeliveryFee(
        restaurantId: widget.restaurantId,
        latitude: lat,
        longitude: lng,
      );
      setState(() {
        _deliveryFee = fee;
      });
    } catch (e) {
      setState(() {
        _deliveryFee = AppConfig.defaultDeliveryFee;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.subtotal + _deliveryFee;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finaliser la commande'),
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildOrderSummary(),
                    const SizedBox(height: 24),
                    _buildGuestInfoSection(),
                    const SizedBox(height: 24),
                    _buildDeliverySection(),
                    const SizedBox(height: 24),
                    _buildPaymentSection(),
                    const SizedBox(height: 24),
                    _buildTermsAndConditions(),
                    const SizedBox(height: 24),
                    _buildTotalSection(total),
                    const SizedBox(height: 24),
                    _buildPlaceOrderButton(total),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildOrderSummary() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Résumé de la commande',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Restaurant: ${widget.restaurantName}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Divider(),
            ...widget.cartItems.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text('${item['quantity']}x ${item['name']}'),
                  ),
                  Text('${item['total']} FCFA'),
                ],
              ),
            )),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Sous-total:'),
                Text('${widget.subtotal.toStringAsFixed(0)} FCFA'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Livraison:'),
                Text('${_deliveryFee.toStringAsFixed(0)} FCFA'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuestInfoSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informations personnelles',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nom complet *',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Le nom est requis';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Numéro de téléphone *',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
                helperText: 'Format: +237 6XX XXX XXX',
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Le numéro de téléphone est requis';
                }
                final phoneRegex = RegExp(r'^\+237[679]\d{8}$');
                if (!phoneRegex.hasMatch(value.replaceAll(' ', ''))) {
                  return 'Format de téléphone invalide';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email (optionnel)',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                helperText: 'Pour recevoir les mises à jour de commande',
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Format d\'email invalide';
                  }
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliverySection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adresse de livraison',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Adresse complète *',
                prefixIcon: Icon(Icons.location_on),
                border: OutlineInputBorder(),
                helperText: 'Incluez les détails pour faciliter la livraison',
              ),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'L\'adresse de livraison est requise';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _instructionsController,
              decoration: const InputDecoration(
                labelText: 'Instructions spéciales (optionnel)',
                prefixIcon: Icon(Icons.note),
                border: OutlineInputBorder(),
                helperText: 'Étage, digicode, indications particulières...',
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.my_location),
              label: const Text('Utiliser ma position actuelle'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EnhancedPaymentSelector(
              amount: widget.subtotal + _deliveryFee,
              currency: AppConfig.currency,
              selectedMethod: _selectedPaymentMethod,
              onMethodSelected: (method) {
                setState(() {
                  _selectedPaymentMethod = method;
                });
              },
              phoneNumber: _phoneController.text.replaceAll(' ', ''),
              onPhoneNumberChanged: (phone) {
                _phoneController.text = phone;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermsAndConditions() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Conditions générales',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            CheckboxListTile(
              value: _agreedToTerms,
              onChanged: (value) {
                setState(() {
                  _agreedToTerms = value ?? false;
                });
              },
              title: const Text('J\'accepte les conditions générales d\'utilisation'),
              subtitle: TextButton(
                onPressed: _showTermsAndConditions,
                child: const Text('Lire les conditions'),
              ),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.info, color: Colors.blue),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Commande en tant qu\'invité',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Vous pouvez créer un compte après votre commande pour suivre vos futures commandes et bénéficier de nos avantages.',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalSection(double total) {
    return Card(
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total à payer:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              '${total.toStringAsFixed(0)} FCFA',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceOrderButton(double total) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _agreedToTerms && !_isLoading ? () => _placeOrder(total) : null,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          textStyle: const TextStyle(fontSize: 18),
        ),
        child: _isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text('Commander ${total.toStringAsFixed(0)} FCFA'),
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    // Implementation for getting current location
    // This would use the location package to get GPS coordinates
    // and reverse geocoding to get address
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fonctionnalité de géolocalisation à implémenter')),
    );
  }

  void _showTermsAndConditions() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Conditions générales'),
        content: const SingleChildScrollView(
          child: Text(
            'Conditions générales d\'utilisation EatFast...\n\n'
            '1. Acceptance des conditions\n'
            '2. Utilisation du service\n'
            '3. Commandes et paiements\n'
            '4. Livraisons\n'
            '5. Politique d\'annulation\n'
            '...',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  Future<void> _placeOrder(double total) async {
    if (!_formKey.currentState!.validate()) return;
    if (_currentSessionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Session non initialisée. Veuillez réessayer.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final orderRequest = GuestOrderRequest(
        restaurantId: widget.restaurantId,
        items: widget.cartItems.map((item) => GuestOrderItem(
          menuId: item['menuId'],
          quantity: item['quantity'],
          customizations: item['customizations'],
        )).toList(),
        deliveryAddress: _addressController.text.trim(),
        deliveryCoordinates: const GuestOrderCoordinates(
          lat: 3.8480, // Default Yaoundé coordinates
          lng: 11.5021,
        ),
        guestName: _nameController.text.trim(),
        guestPhone: _phoneController.text.replaceAll(' ', ''),
        guestEmail: _emailController.text.isNotEmpty ? _emailController.text.trim() : null,
        paymentMethod: _selectedPaymentMethod.code,
        specialInstructions: _instructionsController.text.isNotEmpty
            ? _instructionsController.text.trim()
            : null,
      );

      final response = await _guestService.placeOrder(
        orderRequest: orderRequest,
        sessionId: _currentSessionId!,
      );

      if (response.success && response.data != null) {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => GuestOrderConfirmationScreen(
                orderData: response.data!,
                paymentMethod: _selectedPaymentMethod,
              ),
            ),
          );
        }
      } else {
        throw Exception(response.error ?? 'Erreur lors de la création de la commande');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }
}

/// Guest Order Confirmation Screen
class GuestOrderConfirmationScreen extends StatelessWidget {
  final GuestOrderData orderData;
  final PaymentMethod paymentMethod;

  const GuestOrderConfirmationScreen({
    super.key,
    required this.orderData,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Commande confirmée'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 80,
            ),
            const SizedBox(height: 16),
            Text(
              'Commande confirmée !',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Numéro de commande: ${orderData.orderNumber ?? orderData.orderId}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    if (orderData.estimatedDeliveryTime != null)
                      ListTile(
                        leading: const Icon(Icons.schedule),
                        title: const Text('Livraison estimée'),
                        subtitle: Text(orderData.estimatedDeliveryTime!),
                      ),
                    ListTile(
                      leading: const Icon(Icons.payment),
                      title: const Text('Mode de paiement'),
                      subtitle: Text(paymentMethod.displayName),
                    ),
                    if (orderData.totalAmount != null)
                      ListTile(
                        leading: const Icon(Icons.attach_money),
                        title: const Text('Montant total'),
                        subtitle: Text('${orderData.totalAmount!.toStringAsFixed(0)} ${orderData.currency ?? "FCFA"}'),
                      ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => GuestOrderTrackingScreen(
                      orderId: orderData.orderId,
                    ),
                  ),
                ),
                child: const Text('Suivre ma commande'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => _showAccountCreationDialog(context),
                child: const Text('Créer un compte pour mes futures commandes'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAccountCreationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Créer un compte'),
        content: const Text(
          'Créez un compte EatFast pour:\n'
          '• Suivre vos commandes\n'
          '• Sauvegarder vos adresses\n'
          '• Accéder aux programmes de fidélité\n'
          '• Commander plus rapidement',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Plus tard'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Navigate to registration with pre-filled order data
            },
            child: const Text('Créer un compte'),
          ),
        ],
      ),
    );
  }
}

/// Guest Order Tracking Screen - placeholder
class GuestOrderTrackingScreen extends StatelessWidget {
  final String orderId;

  const GuestOrderTrackingScreen({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suivi de commande'),
      ),
      body: const Center(
        child: Text('Écran de suivi de commande à implémenter'),
      ),
    );
  }
}