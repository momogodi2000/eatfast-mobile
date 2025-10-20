import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:eatfast_mobile/shared/themes/app_colors.dart';
import 'package:eatfast_mobile/shared/themes/app_text_styles.dart';
import 'package:eatfast_mobile/shared/widgets/widgets.dart';
import 'package:eatfast_mobile/modules/client_module/providers/domain/models.dart'
    as domain;
import 'package:eatfast_mobile/modules/client_module/providers/profile_provider.dart';

class PaymentMethodsScreen extends ConsumerStatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  ConsumerState<PaymentMethodsScreen> createState() =>
      _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends ConsumerState<PaymentMethodsScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();

    // Load payment methods when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileProvider.notifier).loadPaymentMethods();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Moyens de paiement',
          style: AppTextStyles.h2.copyWith(color: AppColors.onPrimary),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => _showAddPaymentMethodSheet(context),
            icon: const Icon(Icons.add_card_outlined),
            tooltip: 'Ajouter un moyen de paiement',
          ),
        ],
      ),
      body: FadeTransition(
        opacity: _fadeInAnimation,
        child: profileState.when(
          data: (state) =>
              _buildPaymentMethodsList(context, state.paymentMethods),
          loading: () => const Center(child: AppLoadingIndicator()),
          error: (error, stack) => _buildErrorState(context, error.toString()),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'payment_methods_fab',
        onPressed: () => _showAddPaymentMethodSheet(context),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        icon: const Icon(Icons.add_card_outlined),
        label: const Text('Ajouter'),
      ),
    );
  }

  Widget _buildPaymentMethodsList(
    BuildContext context,
    List<domain.PaymentMethod> methods,
  ) {
    if (methods.isEmpty) {
      return _buildEmptyState(context);
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(profileProvider.notifier).loadPaymentMethods();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: methods.length,
        itemBuilder: (context, index) {
          final method = methods[index];
          return _buildPaymentMethodCard(context, method);
        },
      ),
    );
  }

  Widget _buildPaymentMethodCard(
    BuildContext context,
    domain.PaymentMethod method,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showEditPaymentMethodSheet(context, method),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _getPaymentMethodColor(
                    method.type,
                  ).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _getPaymentMethodIcon(method.type),
                  color: _getPaymentMethodColor(method.type),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(method.displayName, style: AppTextStyles.h3),
                        if (method.isDefault) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Par défaut',
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.onPrimary,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      method.type,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                    if (method.accountNumber != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        _formatAccountNumber(method.accountNumber!),
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.gray,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (value) =>
                    _handlePaymentMethodAction(context, value, method),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      children: [
                        Icon(Icons.edit_outlined),
                        SizedBox(width: 8),
                        Text('Modifier'),
                      ],
                    ),
                  ),
                  if (!method.isDefault)
                    const PopupMenuItem(
                      value: 'default',
                      child: Row(
                        children: [
                          Icon(Icons.star_outline),
                          SizedBox(width: 8),
                          Text('Définir par défaut'),
                        ],
                      ),
                    ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Supprimer', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.payment_outlined,
            size: 120,
            color: AppColors.gray.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 24),
          Text(
            'Aucun moyen de paiement',
            style: AppTextStyles.h2.copyWith(color: AppColors.gray),
          ),
          const SizedBox(height: 8),
          Text(
            'Ajoutez votre premier moyen de paiement\npour faciliter vos commandes',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.gray),
          ),
          const SizedBox(height: 32),
          AppButton(
            onPressed: () => _showAddPaymentMethodSheet(context),
            text: 'Ajouter un moyen de paiement',
            style: AppButtonStyle.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: AppColors.error),
          const SizedBox(height: 16),
          Text(
            'Erreur de chargement',
            style: AppTextStyles.h2.copyWith(color: AppColors.error),
          ),
          const SizedBox(height: 8),
          Text(
            error,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.gray),
          ),
          const SizedBox(height: 24),
          AppButton(
            onPressed: () {
              ref.read(profileProvider.notifier).loadPaymentMethods();
            },
            text: 'Réessayer',
            style: AppButtonStyle.primary,
          ),
        ],
      ),
    );
  }

  void _showAddPaymentMethodSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddPaymentMethodSheet(),
    );
  }

  void _showEditPaymentMethodSheet(
    BuildContext context,
    domain.PaymentMethod method,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddPaymentMethodSheet(paymentMethod: method),
    );
  }

  void _handlePaymentMethodAction(
    BuildContext context,
    String action,
    domain.PaymentMethod method,
  ) {
    switch (action) {
      case 'edit':
        _showEditPaymentMethodSheet(context, method);
        break;
      case 'default':
        if (method.id != null) {
          ref
              .read(profileProvider.notifier)
              .setDefaultPaymentMethod(method.id!);
        }
        break;
      case 'delete':
        _showDeleteConfirmation(context, method);
        break;
    }
  }

  void _showDeleteConfirmation(
    BuildContext context,
    domain.PaymentMethod method,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Supprimer le moyen de paiement'),
        content: Text(
          'Êtes-vous sûr de vouloir supprimer "${method.displayName}" ?\n\n'
          'Cette action est irréversible.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              if (method.id != null) {
                ref
                    .read(profileProvider.notifier)
                    .deletePaymentMethod(method.id!);
              }
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }

  IconData _getPaymentMethodIcon(String type) {
    switch (type) {
      case 'momo_mtn':
        return Icons.phone_android_outlined;
      case 'momo_orange':
        return Icons.phone_android_outlined;
      case 'eu_mobile':
        return Icons.phone_android_outlined;
      case 'cash':
        return Icons.payments_outlined;
      default:
        return Icons.payment_outlined;
    }
  }

  Color _getPaymentMethodColor(String type) {
    switch (type) {
      case 'momo_mtn':
        return const Color(0xFFFFD700); // MTN Yellow
      case 'momo_orange':
        return const Color(0xFFFF8C00); // Orange
      case 'eu_mobile':
        return const Color(0xFF4169E1); // Royal Blue
      case 'cash':
        return const Color(0xFF228B22); // Forest Green
      default:
        return AppColors.primary;
    }
  }

  String _formatAccountNumber(String accountNumber) {
    if (accountNumber.length <= 4) return accountNumber;

    // Show only last 4 digits for security
    return '**** **** ${accountNumber.substring(accountNumber.length - 4)}';
  }
}

class AddPaymentMethodSheet extends ConsumerStatefulWidget {
  final domain.PaymentMethod? paymentMethod;

  const AddPaymentMethodSheet({super.key, this.paymentMethod});

  @override
  ConsumerState<AddPaymentMethodSheet> createState() =>
      _AddPaymentMethodSheetState();
}

class _AddPaymentMethodSheetState extends ConsumerState<AddPaymentMethodSheet>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  final _formKey = GlobalKey<FormState>();
  final _displayNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _accountNameController = TextEditingController();

  String _selectedType = 'momo_mtn';
  bool _isDefault = false;

  final List<Map<String, dynamic>> _paymentTypes = [
    {
      'value': 'momo_mtn',
      'name': 'MTN Mobile Money',
      'icon': Icons.phone_android_outlined,
      'color': const Color(0xFFFFD700),
    },
    {
      'value': 'momo_orange',
      'name': 'Orange Money',
      'icon': Icons.phone_android_outlined,
      'color': const Color(0xFFFF8C00),
    },
    {
      'value': 'eu_mobile',
      'name': 'EU Mobile',
      'icon': Icons.phone_android_outlined,
      'color': const Color(0xFF4169E1),
    },
    {
      'value': 'cash',
      'name': 'Espèces à la livraison',
      'icon': Icons.payments_outlined,
      'color': const Color(0xFF228B22),
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    _animationController.forward();

    // Initialize form with existing payment method data
    if (widget.paymentMethod != null) {
      final method = widget.paymentMethod!;
      _selectedType = method.type;
      _displayNameController.text = method.displayName;
      _accountNumberController.text = method.accountNumber ?? '';
      _accountNameController.text = method.accountName ?? '';
      _isDefault = method.isDefault;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _displayNameController.dispose();
    _accountNumberController.dispose();
    _accountNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.paymentMethod != null;

    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            // Handle
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: AppColors.gray.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                  Expanded(
                    child: Text(
                      isEditing
                          ? 'Modifier le moyen de paiement'
                          : 'Ajouter un moyen de paiement',
                      style: AppTextStyles.h2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 48), // Balance the close button
                ],
              ),
            ),

            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Type de paiement', style: AppTextStyles.h3),
                      const SizedBox(height: 12),

                      // Payment type selection
                      ..._paymentTypes.map(
                        (type) => _buildPaymentTypeCard(type),
                      ),

                      const SizedBox(height: 24),

                      TextFormField(
                        controller: _displayNameController,
                        decoration: const InputDecoration(
                          labelText: 'Nom d\'affichage *',
                          hintText: 'Ex: Mon compte MTN',
                          prefixIcon: Icon(Icons.label_outlined),
                        ),
                        validator: (value) {
                          if (value?.trim().isEmpty ?? true) {
                            return 'Veuillez saisir un nom d\'affichage';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      if (_selectedType != 'cash') ...[
                        TextFormField(
                          controller: _accountNumberController,
                          decoration: InputDecoration(
                            labelText: _selectedType.startsWith('momo')
                                ? 'Numéro de téléphone *'
                                : 'Numéro de compte *',
                            hintText: _selectedType.startsWith('momo')
                                ? 'Ex: 6XXXXXXXX'
                                : 'Numéro de compte',
                            prefixIcon: Icon(
                              _selectedType.startsWith('momo')
                                  ? Icons.phone_outlined
                                  : Icons.account_balance_outlined,
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value?.trim().isEmpty ?? true) {
                              return _selectedType.startsWith('momo')
                                  ? 'Veuillez saisir le numéro de téléphone'
                                  : 'Veuillez saisir le numéro de compte';
                            }
                            if (_selectedType.startsWith('momo') &&
                                value!.length < 9) {
                              return 'Numéro de téléphone invalide';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 16),

                        TextFormField(
                          controller: _accountNameController,
                          decoration: const InputDecoration(
                            labelText: 'Nom du titulaire',
                            hintText: 'Nom sur le compte',
                            prefixIcon: Icon(Icons.person_outlined),
                          ),
                        ),
                      ],

                      const SizedBox(height: 16),

                      SwitchListTile(
                        title: const Text('Moyen de paiement par défaut'),
                        subtitle: const Text(
                          'Utiliser ce moyen de paiement par défaut pour les commandes',
                        ),
                        value: _isDefault,
                        onChanged: (value) =>
                            setState(() => _isDefault = value),
                        activeColor: AppColors.primary,
                      ),

                      const SizedBox(height: 32),

                      SizedBox(
                        width: double.infinity,
                        child: AppButton(
                          onPressed: _savePaymentMethod,
                          text: isEditing ? 'Modifier' : 'Ajouter',
                          style: AppButtonStyle.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentTypeCard(Map<String, dynamic> type) {
    final isSelected = _selectedType == type['value'];

    return GestureDetector(
      onTap: () => setState(() => _selectedType = type['value']),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? type['color']
                : AppColors.gray.withValues(alpha: 0.3),
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected
              ? type['color'].withValues(alpha: 0.1)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(type['icon'], color: type['color'], size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                type['name'],
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected ? type['color'] : AppColors.onBackground,
                ),
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle, color: type['color'], size: 20),
          ],
        ),
      ),
    );
  }

  void _savePaymentMethod() {
    if (!_formKey.currentState!.validate()) return;

    final now = DateTime.now();

    if (widget.paymentMethod != null) {
      // Update existing payment method
      final updatedMethod = widget.paymentMethod!.copyWith(
        type: _selectedType,
        label: _displayNameController.text.trim(),
        displayName: _displayNameController.text.trim(),
        accountNumber: _selectedType != 'cash'
            ? _accountNumberController.text.trim()
            : null,
        accountName: _selectedType != 'cash'
            ? _accountNameController.text.trim()
            : null,
        isDefault: _isDefault,
        updatedAt: now,
      );

      if (widget.paymentMethod!.id != null) {
        ref
            .read(profileProvider.notifier)
            .updatePaymentMethod(widget.paymentMethod!.id!, updatedMethod);
      }
    } else {
      // Create new payment method
      final newMethod = domain.PaymentMethod(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        type: _selectedType,
        label: _displayNameController.text.trim(),
        displayName: _displayNameController.text.trim(),
        accountNumber: _selectedType != 'cash'
            ? _accountNumberController.text.trim()
            : null,
        accountName: _selectedType != 'cash'
            ? _accountNameController.text.trim()
            : null,
        isDefault: _isDefault,
        createdAt: now,
        updatedAt: now,
      );

      ref.read(profileProvider.notifier).addPaymentMethod(newMethod);
    }

    Navigator.of(context).pop();
  }
}
