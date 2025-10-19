import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:eatfast_mobile/shared/services/orders/domain/models/scheduled_order.dart';
import '../providers/scheduled_orders_provider.dart';
import 'package:eatfast_mobile/shared/services/cart/providers/cart_provider.dart';
import 'package:eatfast_mobile/shared/services/cart/domain/models/cart.dart';

class CreateScheduledOrderDialog extends ConsumerStatefulWidget {
  final ScheduledOrder? existingOrder;

  const CreateScheduledOrderDialog({super.key, this.existingOrder});

  @override
  ConsumerState<CreateScheduledOrderDialog> createState() =>
      _CreateScheduledOrderDialogState();
}

class _CreateScheduledOrderDialogState
    extends ConsumerState<CreateScheduledOrderDialog> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _instructionsController = TextEditingController();

  DateTime? _selectedDateTime;
  bool _isRecurring = false;
  RecurrenceType _recurrenceType = RecurrenceType.weekly;
  int _recurrenceInterval = 1;
  List<int> _selectedDaysOfWeek = [];
  int? _selectedDayOfMonth;
  TimeOfDay? _selectedTime;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  @override
  void dispose() {
    _addressController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  void _initializeForm() {
    if (widget.existingOrder != null) {
      final order = widget.existingOrder!;
      _addressController.text = order.deliveryAddress;
      _instructionsController.text = order.deliveryInstructions ?? '';
      _selectedDateTime = order.scheduledDate;
      _isRecurring = order.isRecurring;

      if (order.recurrencePattern != null) {
        final pattern = order.recurrencePattern!;
        _recurrenceType = pattern.type;
        _recurrenceInterval = pattern.interval;
        _selectedDaysOfWeek = pattern.daysOfWeek ?? [];
        _selectedDayOfMonth = pattern.dayOfMonth;

        if (pattern.timeOfDay != null) {
          final timeParts = pattern.timeOfDay!.split(':');
          _selectedTime = TimeOfDay(
            hour: int.parse(timeParts[0]),
            minute: int.parse(timeParts[1]),
          );
        }
      }
    } else {
      // Default to tomorrow at current time
      _selectedDateTime = DateTime.now().add(const Duration(days: 1));
      _selectedTime = TimeOfDay.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDateTimeSection(),
                      const SizedBox(height: 20),
                      _buildRecurrenceSection(),
                      const SizedBox(height: 20),
                      _buildDeliverySection(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.schedule, color: Theme.of(context).primaryColor),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              widget.existingOrder != null
                  ? 'Modifier la commande programmée'
                  : 'Programmer une commande',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date et heure',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: _selectDate,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        _selectedDateTime != null
                            ? DateFormat(
                                'd MMM yyyy',
                                'fr_FR',
                              ).format(_selectedDateTime!)
                            : 'Sélectionner une date',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: InkWell(
                onTap: _selectTime,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.access_time, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        _selectedTime != null
                            ? _selectedTime!.format(context)
                            : 'Sélectionner l\'heure',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRecurrenceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Récurrence',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Switch(
              value: _isRecurring,
              onChanged: (value) {
                setState(() {
                  _isRecurring = value;
                });
              },
            ),
          ],
        ),
        if (_isRecurring) ...[
          const SizedBox(height: 12),
          _buildRecurrenceOptions(),
        ],
      ],
    );
  }

  Widget _buildRecurrenceOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<RecurrenceType>(
          value: _recurrenceType,
          decoration: const InputDecoration(
            labelText: 'Type de récurrence',
            border: OutlineInputBorder(),
          ),
          items: RecurrenceType.values.map((type) {
            return DropdownMenuItem(value: type, child: Text(type.displayName));
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _recurrenceType = value;
                _selectedDaysOfWeek.clear();
                _selectedDayOfMonth = null;
              });
            }
          },
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Text('Intervalle:'),
            const SizedBox(width: 8),
            SizedBox(
              width: 80,
              child: TextFormField(
                initialValue: _recurrenceInterval.toString(),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 12,
                  ),
                ),
                onChanged: (value) {
                  final interval = int.tryParse(value);
                  if (interval != null && interval > 0) {
                    _recurrenceInterval = interval;
                  }
                },
              ),
            ),
            const SizedBox(width: 8),
            Text(_getIntervalUnit()),
          ],
        ),
        if (_recurrenceType == RecurrenceType.weekly) ...[
          const SizedBox(height: 12),
          _buildDaysOfWeekSelector(),
        ],
        if (_recurrenceType == RecurrenceType.monthly) ...[
          const SizedBox(height: 12),
          _buildDayOfMonthSelector(),
        ],
      ],
    );
  }

  Widget _buildDaysOfWeekSelector() {
    const days = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Jours de la semaine:'),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: List.generate(7, (index) {
            final dayValue = index + 1;
            final isSelected = _selectedDaysOfWeek.contains(dayValue);

            return FilterChip(
              label: Text(days[index]),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedDaysOfWeek.add(dayValue);
                  } else {
                    _selectedDaysOfWeek.remove(dayValue);
                  }
                  _selectedDaysOfWeek.sort();
                });
              },
            );
          }),
        ),
      ],
    );
  }

  Widget _buildDayOfMonthSelector() {
    return Row(
      children: [
        const Text('Jour du mois:'),
        const SizedBox(width: 8),
        SizedBox(
          width: 80,
          child: TextFormField(
            initialValue: _selectedDayOfMonth?.toString() ?? '',
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              hintText: '1-31',
            ),
            onChanged: (value) {
              final day = int.tryParse(value);
              if (day != null && day >= 1 && day <= 31) {
                _selectedDayOfMonth = day;
              } else {
                _selectedDayOfMonth = null;
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDeliverySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Livraison',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _addressController,
          decoration: const InputDecoration(
            labelText: 'Adresse de livraison',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.location_on),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Veuillez entrer une adresse de livraison';
            }
            return null;
          },
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _instructionsController,
          decoration: const InputDecoration(
            labelText: 'Instructions de livraison (optionnel)',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.note),
          ),
          maxLines: 2,
        ),
      ],
    );
  }

  Widget _buildActions() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: _isLoading ? null : _saveScheduledOrder,
              child: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(
                      widget.existingOrder != null ? 'Modifier' : 'Programmer',
                    ),
            ),
          ),
        ],
      ),
    );
  }

  String _getIntervalUnit() {
    switch (_recurrenceType) {
      case RecurrenceType.daily:
        return _recurrenceInterval == 1 ? 'jour' : 'jours';
      case RecurrenceType.weekly:
        return _recurrenceInterval == 1 ? 'semaine' : 'semaines';
      case RecurrenceType.monthly:
        return _recurrenceInterval == 1 ? 'mois' : 'mois';
      case RecurrenceType.custom:
        return 'fois';
    }
  }

  void _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate:
          _selectedDateTime ?? DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      locale: const Locale('fr', 'FR'),
    );

    if (date != null) {
      setState(() {
        _selectedDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          _selectedTime?.hour ?? TimeOfDay.now().hour,
          _selectedTime?.minute ?? TimeOfDay.now().minute,
        );
      });
    }
  }

  void _selectTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        _selectedTime = time;
        if (_selectedDateTime != null) {
          _selectedDateTime = DateTime(
            _selectedDateTime!.year,
            _selectedDateTime!.month,
            _selectedDateTime!.day,
            time.hour,
            time.minute,
          );
        }
      });
    }
  }

  void _saveScheduledOrder() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedDateTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez sélectionner une date et une heure'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_isRecurring &&
        _recurrenceType == RecurrenceType.weekly &&
        _selectedDaysOfWeek.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez sélectionner au moins un jour de la semaine'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final cartState = ref.read(cartProvider);
      Cart? cart;
      if (cartState is CartLoaded) {
        cart = cartState.cart;
      }

      if ((cart == null || cart.items.isEmpty) &&
          widget.existingOrder == null) {
        throw Exception('Le panier est vide');
      }

      RecurrencePattern? recurrencePattern;
      if (_isRecurring) {
        recurrencePattern = RecurrencePattern(
          type: _recurrenceType,
          interval: _recurrenceInterval,
          daysOfWeek: _recurrenceType == RecurrenceType.weekly
              ? _selectedDaysOfWeek
              : null,
          dayOfMonth: _recurrenceType == RecurrenceType.monthly
              ? _selectedDayOfMonth
              : null,
          timeOfDay: _selectedTime != null
              ? '${_selectedTime!.hour}:${_selectedTime!.minute}'
              : null,
        );
      }

      final request = CreateScheduledOrderRequest(
        restaurantId: widget.existingOrder?.restaurantId ?? cart!.restaurantId!,
        items: widget.existingOrder?.items ?? cart?.items ?? [],
        scheduledDate: _selectedDateTime!,
        deliveryAddress: _addressController.text.trim(),
        deliveryInstructions: _instructionsController.text.trim().isNotEmpty
            ? _instructionsController.text.trim()
            : null,
        isRecurring: _isRecurring,
        recurrencePattern: recurrencePattern,
      );

      if (widget.existingOrder != null) {
        await ref
            .read(scheduledOrdersNotifierProvider.notifier)
            .updateScheduledOrder(widget.existingOrder!.id, request);
      } else {
        await ref
            .read(scheduledOrdersNotifierProvider.notifier)
            .createScheduledOrder(request);
      }

      if (mounted) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.existingOrder != null
                  ? 'Commande programmée modifiée avec succès'
                  : 'Commande programmée avec succès',
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $error'),
            backgroundColor: Colors.red,
          ),
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
}
