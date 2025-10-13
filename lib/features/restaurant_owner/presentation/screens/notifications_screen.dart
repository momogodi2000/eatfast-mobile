/// Notifications Screen
/// Displays all notifications for the restaurant owner
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../shared/widgets/loading/app_loading_indicator.dart';
import '../widgets/restaurant_manager_drawer.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  final String restaurantId;

  const NotificationsScreen({
    super.key,
    required this.restaurantId,
  });

  @override
  ConsumerState<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  String _selectedFilter = 'all'; // all, orders, reviews, system
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    setState(() => _isLoading = true);
    // TODO: Load real notifications from repository
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.backgroundGrey,
      drawer: RestaurantManagerDrawer(restaurantId: widget.restaurantId),
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: DesignTokens.primaryColor,
        foregroundColor: DesignTokens.white,
        actions: [
          IconButton(
            onPressed: _markAllAsRead,
            icon: const Icon(Icons.done_all),
            tooltip: 'Tout marquer comme lu',
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'settings',
                child: Row(
                  children: [
                    Icon(Icons.settings, size: 20),
                    SizedBox(width: 8),
                    Text('Paramètres'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'clear',
                child: Row(
                  children: [
                    Icon(Icons.clear_all, size: 20),
                    SizedBox(width: 8),
                    Text('Effacer tout'),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 'settings') {
                _showNotificationSettings();
              } else if (value == 'clear') {
                _showClearConfirmation();
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFilterChips(),
          Expanded(
            child: _isLoading
                ? const Center(child: AppLoadingIndicator())
                : _buildNotificationsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return Container(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      color: DesignTokens.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterChip('Toutes', 'all', Icons.notifications),
            const SizedBox(width: 8),
            _buildFilterChip('Commandes', 'orders', Icons.shopping_bag),
            const SizedBox(width: 8),
            _buildFilterChip('Avis', 'reviews', Icons.star),
            const SizedBox(width: 8),
            _buildFilterChip('Système', 'system', Icons.info),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, String value, IconData icon) {
    final isSelected = _selectedFilter == value;
    return FilterChip(
      avatar: Icon(
        icon,
        size: 18,
        color: isSelected ? DesignTokens.white : DesignTokens.primaryColor,
      ),
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedFilter = value;
        });
      },
      selectedColor: DesignTokens.primaryColor,
      labelStyle: TextStyle(
        color: isSelected ? DesignTokens.white : DesignTokens.textPrimary,
        fontWeight: isSelected ? DesignTokens.fontWeightBold : DesignTokens.fontWeightNormal,
      ),
    );
  }

  Widget _buildNotificationsList() {
    final notifications = _getFilteredNotifications();

    if (notifications.isEmpty) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: _loadNotifications,
      child: ListView.builder(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return _buildNotificationCard(notification);
        },
      ),
    );
  }

  Widget _buildNotificationCard(Map<String, dynamic> notification) {
    final isUnread = notification['isUnread'] as bool;
    final type = notification['type'] as String;

    Color accentColor;
    IconData icon;

    switch (type) {
      case 'order':
        accentColor = DesignTokens.successColor;
        icon = Icons.shopping_bag;
        break;
      case 'review':
        accentColor = DesignTokens.warningColor;
        icon = Icons.star;
        break;
      case 'system':
        accentColor = DesignTokens.infoColor;
        icon = Icons.info;
        break;
      default:
        accentColor = DesignTokens.primaryColor;
        icon = Icons.notifications;
    }

    return Dismissible(
      key: Key(notification['id']),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: DesignTokens.spaceMD),
        decoration: BoxDecoration(
          color: DesignTokens.errorColor,
          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        ),
        child: const Icon(
          Icons.delete,
          color: DesignTokens.white,
        ),
      ),
      onDismissed: (direction) {
        _deleteNotification(notification['id']);
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: DesignTokens.spaceMD),
        elevation: isUnread ? 3 : 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          side: isUnread
              ? BorderSide(color: accentColor, width: 2)
              : BorderSide.none,
        ),
        child: InkWell(
          onTap: () => _handleNotificationTap(notification),
          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          child: Padding(
            padding: const EdgeInsets.all(DesignTokens.spaceMD),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: accentColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: accentColor, size: 24),
                ),
                const SizedBox(width: DesignTokens.spaceMD),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              notification['title'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: isUnread
                                    ? DesignTokens.fontWeightBold
                                    : DesignTokens.fontWeightNormal,
                                color: DesignTokens.textPrimary,
                              ),
                            ),
                          ),
                          if (isUnread)
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: accentColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notification['message'],
                        style: TextStyle(
                          fontSize: 14,
                          color: DesignTokens.textSecondary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: DesignTokens.textTertiary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            notification['time'],
                            style: TextStyle(
                              fontSize: 12,
                              color: DesignTokens.textTertiary,
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
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_off_outlined,
              size: 80,
              color: DesignTokens.textTertiary,
            ),
            const SizedBox(height: DesignTokens.spaceLG),
            Text(
              'Aucune Notification',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: DesignTokens.textSecondary,
                  ),
            ),
            const SizedBox(height: DesignTokens.spaceSM),
            Text(
              'Vous n\'avez aucune notification pour le moment',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: DesignTokens.textTertiary,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleNotificationTap(Map<String, dynamic> notification) {
    // Mark as read
    if (notification['isUnread']) {
      setState(() {
        notification['isUnread'] = false;
      });
    }

    // Handle navigation based on type
    final type = notification['type'];
    switch (type) {
      case 'order':
        // Navigate to order details
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Ouvrir les détails de la commande'),
            duration: Duration(seconds: 1),
          ),
        );
        break;
      case 'review':
        // Navigate to reviews
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Ouvrir les avis'),
            duration: Duration(seconds: 1),
          ),
        );
        break;
      default:
        break;
    }
  }

  void _deleteNotification(String id) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Notification supprimée'),
        action: SnackBarAction(
          label: 'Annuler',
          onPressed: () {
            // Restore notification
          },
        ),
      ),
    );
  }

  void _markAllAsRead() {
    setState(() {
      // Mark all notifications as read
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Toutes les notifications marquées comme lues'),
        backgroundColor: DesignTokens.successColor,
      ),
    );
  }

  void _showNotificationSettings() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(DesignTokens.radiusXL)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(DesignTokens.spaceLG),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: DesignTokens.lightGrey,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: DesignTokens.spaceLG),
            const Text(
              'Paramètres de Notification',
              style: TextStyle(
                fontSize: 18,
                fontWeight: DesignTokens.fontWeightBold,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            SwitchListTile(
              title: const Text('Nouvelles Commandes'),
              subtitle: const Text('Recevoir une notification'),
              value: true,
              onChanged: (value) {},
            ),
            SwitchListTile(
              title: const Text('Nouveaux Avis'),
              subtitle: const Text('Notifications des avis clients'),
              value: true,
              onChanged: (value) {},
            ),
            SwitchListTile(
              title: const Text('Mises à Jour Système'),
              subtitle: const Text('Alertes importantes'),
              value: false,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }

  void _showClearConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Effacer Toutes les Notifications'),
        content: const Text(
          'Êtes-vous sûr de vouloir effacer toutes les notifications?\n\n'
          'Cette action est irréversible.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: DesignTokens.errorColor,
              foregroundColor: DesignTokens.white,
            ),
            onPressed: () {
              Navigator.pop(context);
              _clearAllNotifications();
            },
            child: const Text('Effacer'),
          ),
        ],
      ),
    );
  }

  void _clearAllNotifications() {
    setState(() {
      // Clear all notifications
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Toutes les notifications ont été effacées'),
        backgroundColor: DesignTokens.successColor,
      ),
    );
  }

  List<Map<String, dynamic>> _getFilteredNotifications() {
    final allNotifications = _getMockNotifications();

    if (_selectedFilter == 'all') {
      return allNotifications;
    }

    return allNotifications
        .where((notif) => notif['type'] == _selectedFilter.replaceAll('s', ''))
        .toList();
  }

  List<Map<String, dynamic>> _getMockNotifications() {
    return [
      {
        'id': '1',
        'type': 'order',
        'title': 'Nouvelle Commande',
        'message': 'Commande #12345 - 3 articles pour 15,000 FCFA',
        'time': 'Il y a 5 min',
        'isUnread': true,
      },
      {
        'id': '2',
        'type': 'review',
        'title': 'Nouvel Avis',
        'message': 'Client Jean a laissé un avis 5 étoiles',
        'time': 'Il y a 15 min',
        'isUnread': true,
      },
      {
        'id': '3',
        'type': 'order',
        'title': 'Commande Livrée',
        'message': 'Commande #12344 a été livrée avec succès',
        'time': 'Il y a 1 heure',
        'isUnread': false,
      },
      {
        'id': '4',
        'type': 'system',
        'title': 'Mise à Jour Disponible',
        'message': 'Une nouvelle version de l\'application est disponible',
        'time': 'Il y a 2 heures',
        'isUnread': false,
      },
      {
        'id': '5',
        'type': 'order',
        'title': 'Commande Annulée',
        'message': 'Commande #12343 a été annulée par le client',
        'time': 'Il y a 3 heures',
        'isUnread': false,
      },
      {
        'id': '6',
        'type': 'review',
        'title': 'Réponse Requise',
        'message': 'Marie a posé une question sur votre menu',
        'time': 'Il y a 4 heures',
        'isUnread': true,
      },
      {
        'id': '7',
        'type': 'system',
        'title': 'Rappel',
        'message': 'N\'oubliez pas de mettre à jour vos horaires d\'ouverture',
        'time': 'Hier',
        'isUnread': false,
      },
    ];
  }
}
