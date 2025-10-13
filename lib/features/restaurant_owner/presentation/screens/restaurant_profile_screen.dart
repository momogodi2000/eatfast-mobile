/// Restaurant Profile & Settings Screen
/// Allows restaurant owners to manage their restaurant information and settings
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../shared/widgets/loading/app_loading_indicator.dart';
import '../widgets/restaurant_manager_drawer.dart';

class RestaurantProfileScreen extends ConsumerStatefulWidget {
  final String restaurantId;

  const RestaurantProfileScreen({
    super.key,
    required this.restaurantId,
  });

  @override
  ConsumerState<RestaurantProfileScreen> createState() => _RestaurantProfileScreenState();
}

class _RestaurantProfileScreenState extends ConsumerState<RestaurantProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = false;

  // Profile form controllers
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _deliveryRadiusController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _loadRestaurantProfile();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _deliveryRadiusController.dispose();
    super.dispose();
  }

  Future<void> _loadRestaurantProfile() async {
    setState(() => _isLoading = true);

    // TODO: Load actual profile from repository
    // Mock data for now
    _nameController.text = 'Mon Restaurant';
    _descriptionController.text = 'Restaurant de cuisine locale et internationale';
    _phoneController.text = '+237 6XX XX XX XX';
    _emailController.text = 'restaurant@example.com';
    _addressController.text = 'Douala, Cameroun';
    _deliveryRadiusController.text = '5';

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.backgroundGrey,
      drawer: RestaurantManagerDrawer(restaurantId: widget.restaurantId),
      appBar: AppBar(
        title: const Text('Profil Restaurant'),
        backgroundColor: DesignTokens.primaryColor,
        foregroundColor: DesignTokens.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: DesignTokens.white,
          labelColor: DesignTokens.white,
          unselectedLabelColor: DesignTokens.white.withValues(alpha: 0.7),
          isScrollable: true,
          tabs: const [
            Tab(icon: Icon(Icons.info), text: 'Informations'),
            Tab(icon: Icon(Icons.schedule), text: 'Horaires'),
            Tab(icon: Icon(Icons.location_on), text: 'Livraison'),
            Tab(icon: Icon(Icons.settings), text: 'Paramètres'),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: AppLoadingIndicator())
          : TabBarView(
              controller: _tabController,
              children: [
                _buildInformationsTab(),
                _buildBusinessHoursTab(),
                _buildDeliveryTab(),
                _buildSettingsTab(),
              ],
            ),
    );
  }

  Widget _buildInformationsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Photo du Restaurant'),
          const SizedBox(height: DesignTokens.spaceMD),
          _buildRestaurantImage(),
          const SizedBox(height: DesignTokens.spaceXL),

          _buildSectionTitle('Informations Générales'),
          const SizedBox(height: DesignTokens.spaceMD),
          _buildTextField(
            controller: _nameController,
            label: 'Nom du Restaurant',
            icon: Icons.restaurant,
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          _buildTextField(
            controller: _descriptionController,
            label: 'Description',
            icon: Icons.description,
            maxLines: 4,
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          _buildTextField(
            controller: _phoneController,
            label: 'Téléphone',
            icon: Icons.phone,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          _buildTextField(
            controller: _emailController,
            label: 'Email',
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          _buildTextField(
            controller: _addressController,
            label: 'Adresse',
            icon: Icons.location_on,
            maxLines: 2,
          ),
          const SizedBox(height: DesignTokens.spaceXL),

          _buildSectionTitle('Type de Cuisine'),
          const SizedBox(height: DesignTokens.spaceMD),
          _buildCuisineTypeChips(),
          const SizedBox(height: DesignTokens.spaceXL),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _saveProfileInformation,
              style: ElevatedButton.styleFrom(
                backgroundColor: DesignTokens.primaryColor,
                foregroundColor: DesignTokens.white,
                padding: const EdgeInsets.all(DesignTokens.spaceMD),
              ),
              child: const Text('Enregistrer les Modifications'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBusinessHoursTab() {
    final daysOfWeek = [
      'Lundi',
      'Mardi',
      'Mercredi',
      'Jeudi',
      'Vendredi',
      'Samedi',
      'Dimanche',
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Horaires d\'Ouverture'),
          const SizedBox(height: DesignTokens.spaceMD),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
            ),
            child: Column(
              children: daysOfWeek.asMap().entries.map((entry) {
                final index = entry.key;
                final day = entry.value;
                return Column(
                  children: [
                    _buildBusinessHourRow(day),
                    if (index < daysOfWeek.length - 1) const Divider(),
                  ],
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: DesignTokens.spaceLG),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _saveBusinessHours,
              style: ElevatedButton.styleFrom(
                backgroundColor: DesignTokens.primaryColor,
                foregroundColor: DesignTokens.white,
                padding: const EdgeInsets.all(DesignTokens.spaceMD),
              ),
              child: const Text('Enregistrer les Horaires'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Configuration de Livraison'),
          const SizedBox(height: DesignTokens.spaceMD),

          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
            ),
            child: Padding(
              padding: const EdgeInsets.all(DesignTokens.spaceMD),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Rayon de Livraison',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: DesignTokens.fontWeightBold,
                    ),
                  ),
                  const SizedBox(height: DesignTokens.spaceSM),
                  Text(
                    'Définissez la distance maximale pour les livraisons',
                    style: TextStyle(
                      fontSize: 14,
                      color: DesignTokens.textSecondary,
                    ),
                  ),
                  const SizedBox(height: DesignTokens.spaceMD),
                  _buildTextField(
                    controller: _deliveryRadiusController,
                    label: 'Rayon (km)',
                    icon: Icons.social_distance,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: DesignTokens.spaceLG),

          _buildSectionTitle('Zones de Livraison'),
          const SizedBox(height: DesignTokens.spaceMD),
          _buildDeliveryZonesList(),
          const SizedBox(height: DesignTokens.spaceLG),

          _buildSectionTitle('Frais de Livraison'),
          const SizedBox(height: DesignTokens.spaceMD),
          _buildDeliveryFeeCard(),
          const SizedBox(height: DesignTokens.spaceLG),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _saveDeliverySettings,
              style: ElevatedButton.styleFrom(
                backgroundColor: DesignTokens.primaryColor,
                foregroundColor: DesignTokens.white,
                padding: const EdgeInsets.all(DesignTokens.spaceMD),
              ),
              child: const Text('Enregistrer les Paramètres'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Statut du Restaurant'),
          const SizedBox(height: DesignTokens.spaceMD),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
            ),
            child: SwitchListTile(
              title: const Text('Restaurant Ouvert'),
              subtitle: const Text('Accepter les commandes'),
              value: true,
              onChanged: (value) {
                _toggleRestaurantStatus(value);
              },
              secondary: const Icon(Icons.store, color: DesignTokens.successColor),
            ),
          ),
          const SizedBox(height: DesignTokens.spaceLG),

          _buildSectionTitle('Notifications'),
          const SizedBox(height: DesignTokens.spaceMD),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
            ),
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Nouvelles Commandes'),
                  subtitle: const Text('Recevoir une notification'),
                  value: true,
                  onChanged: (value) {},
                  secondary: const Icon(Icons.notifications_active),
                ),
                const Divider(),
                SwitchListTile(
                  title: const Text('Messages Clients'),
                  subtitle: const Text('Notifications de messages'),
                  value: true,
                  onChanged: (value) {},
                  secondary: const Icon(Icons.message),
                ),
                const Divider(),
                SwitchListTile(
                  title: const Text('Avis & Notes'),
                  subtitle: const Text('Nouveaux avis clients'),
                  value: false,
                  onChanged: (value) {},
                  secondary: const Icon(Icons.star),
                ),
              ],
            ),
          ),
          const SizedBox(height: DesignTokens.spaceLG),

          _buildSectionTitle('Méthodes de Paiement'),
          const SizedBox(height: DesignTokens.spaceMD),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
            ),
            child: Column(
              children: [
                CheckboxListTile(
                  title: const Text('Espèces'),
                  subtitle: const Text('Paiement en liquide'),
                  value: true,
                  onChanged: (value) {},
                  secondary: const Icon(Icons.money),
                ),
                const Divider(),
                CheckboxListTile(
                  title: const Text('Mobile Money'),
                  subtitle: const Text('MTN, Orange Money'),
                  value: true,
                  onChanged: (value) {},
                  secondary: const Icon(Icons.phone_android),
                ),
                const Divider(),
                CheckboxListTile(
                  title: const Text('Carte Bancaire'),
                  subtitle: const Text('Visa, Mastercard'),
                  value: true,
                  onChanged: (value) {},
                  secondary: const Icon(Icons.credit_card),
                ),
              ],
            ),
          ),
          const SizedBox(height: DesignTokens.spaceLG),

          _buildSectionTitle('Actions'),
          const SizedBox(height: DesignTokens.spaceMD),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.lock, color: DesignTokens.warningColor),
                  title: const Text('Changer le Mot de Passe'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: _showChangePasswordDialog,
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.help_outline, color: DesignTokens.infoColor),
                  title: const Text('Aide & Support'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: _openSupport,
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.info_outline, color: DesignTokens.primaryColor),
                  title: const Text('À Propos'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: _showAboutDialog,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: DesignTokens.fontWeightBold,
            color: DesignTokens.textPrimary,
          ),
    );
  }

  Widget _buildRestaurantImage() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: DesignTokens.lightGrey,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(DesignTokens.radiusMD),
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.restaurant,
                size: 64,
                color: DesignTokens.textSecondary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(DesignTokens.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _uploadRestaurantImage,
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Prendre une Photo'),
                ),
                ElevatedButton.icon(
                  onPressed: _selectRestaurantImage,
                  icon: const Icon(Icons.photo_library),
                  label: const Text('Galerie'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        ),
        filled: true,
        fillColor: DesignTokens.white,
      ),
    );
  }

  Widget _buildCuisineTypeChips() {
    final cuisineTypes = [
      'Africaine',
      'Européenne',
      'Asiatique',
      'Fast Food',
      'Végétarienne',
      'Halal',
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: cuisineTypes.map((cuisine) {
        return FilterChip(
          label: Text(cuisine),
          selected: cuisine == 'Africaine',
          onSelected: (selected) {},
        );
      }).toList(),
    );
  }

  Widget _buildBusinessHourRow(String day) {
    return ListTile(
      title: Text(day),
      subtitle: const Text('09:00 - 22:00'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Switch(
            value: true,
            onChanged: (value) {},
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _editBusinessHours(day),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryZonesList() {
    final zones = [
      {'name': 'Zone Centre', 'fee': 500},
      {'name': 'Zone Nord', 'fee': 1000},
      {'name': 'Zone Sud', 'fee': 750},
    ];

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Column(
        children: [
          ...zones.asMap().entries.map((entry) {
            final index = entry.key;
            final zone = entry.value;
            return Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.location_on, color: DesignTokens.primaryColor),
                  title: Text(zone['name'] as String),
                  subtitle: Text('${zone['fee']} FCFA'),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _editDeliveryZone(zone),
                  ),
                ),
                if (index < zones.length - 1) const Divider(),
              ],
            );
          }),
          ListTile(
            leading: const Icon(Icons.add_circle, color: DesignTokens.successColor),
            title: const Text(
              'Ajouter une Zone',
              style: TextStyle(color: DesignTokens.successColor),
            ),
            onTap: _addDeliveryZone,
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryFeeCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Frais de Livraison par Défaut',
              style: TextStyle(
                fontSize: 16,
                fontWeight: DesignTokens.fontWeightBold,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceSM),
            TextField(
              decoration: InputDecoration(
                labelText: 'Montant (FCFA)',
                prefixIcon: const Icon(Icons.monetization_on),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            SwitchListTile(
              title: const Text('Livraison Gratuite'),
              subtitle: const Text('Pour les commandes supérieures à un montant'),
              value: false,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }

  // Action Methods
  void _saveProfileInformation() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profil enregistré avec succès'),
        backgroundColor: DesignTokens.successColor,
      ),
    );
  }

  void _saveBusinessHours() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Horaires enregistrés avec succès'),
        backgroundColor: DesignTokens.successColor,
      ),
    );
  }

  void _saveDeliverySettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Paramètres de livraison enregistrés'),
        backgroundColor: DesignTokens.successColor,
      ),
    );
  }

  void _uploadRestaurantImage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Fonctionnalité en cours de développement'),
        backgroundColor: DesignTokens.infoColor,
      ),
    );
  }

  void _selectRestaurantImage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Fonctionnalité en cours de développement'),
        backgroundColor: DesignTokens.infoColor,
      ),
    );
  }

  void _editBusinessHours(String day) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Horaires - $day'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Heure d\'ouverture'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Heure de fermeture'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );
  }

  void _editDeliveryZone(Map<String, dynamic> zone) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Éditer ${zone['name']}'),
        backgroundColor: DesignTokens.infoColor,
      ),
    );
  }

  void _addDeliveryZone() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ajouter une nouvelle zone'),
        backgroundColor: DesignTokens.infoColor,
      ),
    );
  }

  void _toggleRestaurantStatus(bool isOpen) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isOpen ? 'Restaurant ouvert' : 'Restaurant fermé'),
        backgroundColor: isOpen ? DesignTokens.successColor : DesignTokens.warningColor,
      ),
    );
  }

  void _showChangePasswordDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Changer le Mot de Passe'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Ancien mot de passe'),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Nouveau mot de passe'),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirmer le mot de passe'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Changer'),
          ),
        ],
      ),
    );
  }

  void _openSupport() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ouvrir le support'),
        backgroundColor: DesignTokens.infoColor,
      ),
    );
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('À Propos'),
        content: const Text(
          'EatFast Restaurant Manager\nVersion 1.0.0\n\n'
          'Application de gestion pour les restaurants partenaires.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }
}
