import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuickActionsGrid extends ConsumerWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.flash_on,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Actions rapides',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1.2,
              children: [
                _ActionTile(
                  title: 'Notifications',
                  subtitle: 'Envoyer message',
                  icon: Icons.notifications,
                  color: Colors.blue,
                  onTap: () => _sendNotification(context),
                ),
                _ActionTile(
                  title: 'Utilisateurs',
                  subtitle: 'Gérer comptes',
                  icon: Icons.people_alt,
                  color: Colors.green,
                  onTap: () => _manageUsers(context),
                ),
                _ActionTile(
                  title: 'Restaurants',
                  subtitle: 'Valider nouveaux',
                  icon: Icons.restaurant_menu,
                  color: Colors.orange,
                  onTap: () => _validateRestaurants(context),
                ),
                _ActionTile(
                  title: 'Support Client',
                  subtitle: 'Messages clients',
                  icon: Icons.headset_mic,
                  color: Colors.purple,
                  badge: '12',
                  onTap: () => _viewCustomerSupport(context),
                ),
                _ActionTile(
                  title: 'Rapports',
                  subtitle: 'Générer rapport',
                  icon: Icons.analytics,
                  color: Colors.teal,
                  onTap: () => _generateReports(context),
                ),
                _ActionTile(
                  title: 'Système',
                  subtitle: 'Configuration',
                  icon: Icons.settings,
                  color: Colors.grey,
                  onTap: () => _systemSettings(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _sendNotification(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Envoyer une notification'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Sélectionnez le type de notification:'),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Notification utilisateur'),
              onTap: () {
                Navigator.pop(context);
                _showNotificationForm(context, 'user');
              },
            ),
            ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text('Notification restaurant'),
              onTap: () {
                Navigator.pop(context);
                _showNotificationForm(context, 'restaurant');
              },
            ),
            ListTile(
              leading: const Icon(Icons.delivery_dining),
              title: const Text('Notification livreur'),
              onTap: () {
                Navigator.pop(context);
                _showNotificationForm(context, 'driver');
              },
            ),
            ListTile(
              leading: const Icon(Icons.public),
              title: const Text('Notification globale'),
              onTap: () {
                Navigator.pop(context);
                _showNotificationForm(context, 'global');
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
        ],
      ),
    );
  }

  void _showNotificationForm(BuildContext context, String type) {
    final titleController = TextEditingController();
    final messageController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Notification ${_getTypeLabel(type)}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Titre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: messageController,
              decoration: const InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              // Send notification logic
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notification envoyée!')),
              );
            },
            child: const Text('Envoyer'),
          ),
        ],
      ),
    );
  }

  String _getTypeLabel(String type) {
    switch (type) {
      case 'user':
        return 'utilisateur';
      case 'restaurant':
        return 'restaurant';
      case 'driver':
        return 'livreur';
      case 'global':
        return 'globale';
      default:
        return '';
    }
  }

  void _manageUsers(BuildContext context) {
    // Navigate to user management screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigation vers gestion utilisateurs')),
    );
  }

  void _validateRestaurants(BuildContext context) {
    // Navigate to restaurant validation screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigation vers validation restaurants')),
    );
  }

  void _viewCustomerSupport(BuildContext context) {
    // Navigate to support tickets
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigation vers tickets de support')),
    );
  }

  void _generateReports(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Générer un rapport'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.monetization_on),
              title: const Text('Rapport financier'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Rapport d\'activité utilisateurs'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text('Performance restaurants'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.delivery_dining),
              title: const Text('Performance livreurs'),
              onTap: () => Navigator.pop(context),
            ),
          ],
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

  void _systemSettings(BuildContext context) {
    // Navigate to system settings
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigation vers paramètres système')),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String? badge;
  final VoidCallback onTap;

  const _ActionTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 1,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      color: color,
                      size: 24,
                    ),
                  ),
                  if (badge != null)
                    Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          badge!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}