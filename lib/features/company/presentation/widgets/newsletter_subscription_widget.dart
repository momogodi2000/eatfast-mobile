/// Newsletter Subscription Widget for EatFast
/// Aligns with backend validation schemas and public newsletter endpoints

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/api/api_client.dart';
import '../../../../core/constants/api_constants.dart';

class NewsletterSubscriptionWidget extends ConsumerStatefulWidget {
  const NewsletterSubscriptionWidget({super.key});

  @override
  ConsumerState<NewsletterSubscriptionWidget> createState() => _NewsletterSubscriptionWidgetState();
}

class _NewsletterSubscriptionWidgetState extends ConsumerState<NewsletterSubscriptionWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  String _selectedCity = 'Yaoundé';
  String _selectedLanguage = 'fr';
  List<String> _selectedInterests = ['promotions'];
  bool _isLoading = false;

  final List<String> _cities = [
    'Yaoundé',
    'Douala',
    'Bafoussam',
    'Bamenda',
    'Autre'
  ];

  final List<String> _languages = ['fr', 'en'];

  final Map<String, String> _interests = {
    'promotions': 'Promotions et offres spéciales',
    'nouveautes': 'Nouveautés et nouveaux restaurants',
    'recettes': 'Recettes et conseils culinaires',
    'evenements': 'Événements et actualités',
    'partenariats': 'Nouveaux partenariats',
    'actualites': 'Actualités EatFast',
    'conseils_nutrition': 'Conseils nutrition et santé',
  };

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
              Row(
                children: [
                  Icon(
                    Icons.email_outlined,
                    color: Theme.of(context).colorScheme.primary,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Newsletter EatFast',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Restez informé(e) de nos dernières offres, nouveautés et événements !',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 16),

              // Email (required)
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

              // Optional name fields
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(
                        labelText: 'Prénom (optionnel)',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value != null && value.trim().length > 100) {
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
                        labelText: 'Nom (optionnel)',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value != null && value.trim().length > 100) {
                          return 'Maximum 100 caractères';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // City and Language
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedCity,
                      decoration: const InputDecoration(
                        labelText: 'Ville',
                        border: OutlineInputBorder(),
                      ),
                      items: _cities.map((city) {
                        return DropdownMenuItem(
                          value: city,
                          child: Text(city),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCity = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedLanguage,
                      decoration: const InputDecoration(
                        labelText: 'Langue',
                        border: OutlineInputBorder(),
                      ),
                      items: _languages.map((lang) {
                        return DropdownMenuItem(
                          value: lang,
                          child: Text(lang == 'fr' ? 'Français' : 'English'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedLanguage = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Interests
              Text(
                'Vos centres d\'intérêt',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              ..._interests.entries.map((entry) {
                return CheckboxListTile(
                  value: _selectedInterests.contains(entry.key),
                  onChanged: (checked) {
                    setState(() {
                      if (checked == true) {
                        _selectedInterests.add(entry.key);
                      } else {
                        _selectedInterests.remove(entry.key);
                      }
                    });
                  },
                  title: Text(entry.value),
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                );
              }),

              const SizedBox(height: 16),

              // Privacy notice
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.privacy_tip, color: Colors.blue[700], size: 16),
                        const SizedBox(width: 6),
                        Text(
                          'Confidentialité',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blue[700],
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Nous respectons votre vie privée. Vous pouvez vous désabonner à tout moment. Vos données ne seront jamais partagées avec des tiers.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue[600],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _isLoading ? null : _submitForm,
                  icon: _isLoading
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.email_outlined),
                  label: const Text('S\'abonner à la newsletter'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedInterests.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez sélectionner au moins un centre d\'intérêt'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final apiClient = ApiClient();

      final response = await apiClient.post(
        ApiConstants.publicNewsletter,
        data: {
          'email': _emailController.text.trim(),
          'firstName': _firstNameController.text.isNotEmpty
              ? _firstNameController.text.trim()
              : null,
          'lastName': _lastNameController.text.isNotEmpty
              ? _lastNameController.text.trim()
              : null,
          'interests': _selectedInterests,
          'city': _selectedCity,
          'language': _selectedLanguage,
          'source': 'mobile_app',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Abonnement réussi! Bienvenue dans la communauté EatFast 🎉'),
              backgroundColor: Colors.green,
            ),
          );

          // Clear form
          _formKey.currentState!.reset();
          _emailController.clear();
          _firstNameController.clear();
          _lastNameController.clear();
          setState(() {
            _selectedCity = 'Yaoundé';
            _selectedLanguage = 'fr';
            _selectedInterests = ['promotions'];
          });
        }
      } else {
        throw Exception('Erreur lors de l\'abonnement');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: ${e.toString().contains('already subscribed') ? 'Vous êtes déjà abonné(e) à notre newsletter' : e}'),
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
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }
}