/// Contact Form Widget for EatFast
/// Aligns with backend validation schemas and public contact endpoints

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/api/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/config/app_config.dart';

class ContactFormWidget extends ConsumerStatefulWidget {
  const ContactFormWidget({super.key});

  @override
  ConsumerState<ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends ConsumerState<ContactFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  String _selectedCategory = 'general';
  String _selectedPriority = 'medium';
  bool _isLoading = false;

  final List<String> _categories = [
    'general',
    'support',
    'technical',
    'billing',
    'partnership',
    'complaint',
    'suggestion',
    'urgent'
  ];

  final List<String> _priorities = [
    'low',
    'medium',
    'high',
    'urgent'
  ];

  @override
  void initState() {
    super.initState();
    _phoneController.text = AppConfig.countryCode;
  }

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
                'Nous contacter',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),

              // Name fields
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(
                        labelText: 'Prénom *',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Le prénom est requis';
                        }
                        if (value.trim().length > 100) {
                          return 'Maximum 100 caractères';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(
                        labelText: 'Nom *',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Le nom est requis';
                        }
                        if (value.trim().length > 100) {
                          return 'Maximum 100 caractères';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email *',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'L\'email est requis';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) {
                    return 'Format d\'email invalide';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Phone (optional)
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Téléphone (optionnel)',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                  helperText: 'Format: +237 6XX XXX XXX',
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    final phoneRegex = RegExp(r'^\+237[679]\d{8}$');
                    if (!phoneRegex.hasMatch(value.replaceAll(' ', ''))) {
                      return 'Format de téléphone invalide';
                    }
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Category and Priority
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedCategory,
                      decoration: const InputDecoration(
                        labelText: 'Catégorie',
                        border: OutlineInputBorder(),
                      ),
                      items: _categories.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(_getCategoryDisplayName(category)),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedPriority,
                      decoration: const InputDecoration(
                        labelText: 'Priorité',
                        border: OutlineInputBorder(),
                      ),
                      items: _priorities.map((priority) {
                        return DropdownMenuItem(
                          value: priority,
                          child: Text(_getPriorityDisplayName(priority)),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedPriority = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Subject
              TextFormField(
                controller: _subjectController,
                decoration: const InputDecoration(
                  labelText: 'Sujet *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Le sujet est requis';
                  }
                  if (value.trim().length < 5) {
                    return 'Le sujet doit contenir au moins 5 caractères';
                  }
                  if (value.trim().length > 255) {
                    return 'Maximum 255 caractères';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Message
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: 'Message *',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: 6,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Le message est requis';
                  }
                  if (value.trim().length < 10) {
                    return 'Le message doit contenir au moins 10 caractères';
                  }
                  if (value.trim().length > 5000) {
                    return 'Maximum 5000 caractères';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Envoyer le message'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getCategoryDisplayName(String category) {
    switch (category) {
      case 'general': return 'Général';
      case 'support': return 'Support';
      case 'technical': return 'Technique';
      case 'billing': return 'Facturation';
      case 'partnership': return 'Partenariat';
      case 'complaint': return 'Réclamation';
      case 'suggestion': return 'Suggestion';
      case 'urgent': return 'Urgent';
      default: return category;
    }
  }

  String _getPriorityDisplayName(String priority) {
    switch (priority) {
      case 'low': return 'Faible';
      case 'medium': return 'Moyenne';
      case 'high': return 'Élevée';
      case 'urgent': return 'Urgente';
      default: return priority;
    }
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final apiClient = ApiClient();

      final response = await apiClient.post(
        ApiConstants.publicContact,
        data: {
          'firstName': _firstNameController.text.trim(),
          'lastName': _lastNameController.text.trim(),
          'email': _emailController.text.trim(),
          'phone': _phoneController.text.isNotEmpty
              ? _phoneController.text.replaceAll(' ', '')
              : null,
          'subject': _subjectController.text.trim(),
          'message': _messageController.text.trim(),
          'category': _selectedCategory,
          'priority': _selectedPriority,
          'source': 'mobile_app',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Message envoyé avec succès! Nous vous répondrons dans les plus brefs délais.'),
              backgroundColor: Colors.green,
            ),
          );

          // Clear form
          _formKey.currentState!.reset();
          _firstNameController.clear();
          _lastNameController.clear();
          _emailController.clear();
          _phoneController.text = AppConfig.countryCode;
          _subjectController.clear();
          _messageController.clear();
          setState(() {
            _selectedCategory = 'general';
            _selectedPriority = 'medium';
          });
        }
      } else {
        throw Exception('Erreur lors de l\'envoi du message');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $e'),
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

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}