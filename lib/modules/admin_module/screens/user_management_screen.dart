/// User Management Screen
/// Admin interface for managing users
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:eatfast_mobile/shared/models/user_management.dart';
import '../providers/user_management_provider.dart';
import '../widgets/admin_drawer.dart';

class UserManagementScreen extends ConsumerStatefulWidget {
  const UserManagementScreen({super.key});

  @override
  ConsumerState<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends ConsumerState<UserManagementScreen> {
  final _searchController = TextEditingController();
  UserRole? _selectedRole;
  UserStatus? _selectedStatus;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userManagementState = ref.watch(userManagementProvider);

    return Scaffold(
      drawer: const AdminDrawer(),
      appBar: AppBar(
        title: const Text('Gestion des Utilisateurs'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
            tooltip: 'Filtrer',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(userManagementProvider.notifier).loadUsers();
            },
            tooltip: 'Actualiser',
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher par nom, email ou téléphone...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          ref.read(userManagementProvider.notifier).searchUsers('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              onChanged: (value) {
                // Debounce search
                Future.delayed(const Duration(milliseconds: 500), () {
                  if (_searchController.text == value) {
                    ref.read(userManagementProvider.notifier).searchUsers(value);
                  }
                });
              },
            ),
          ),

          // Active Filters
          if (userManagementState.filterRole != null ||
              userManagementState.filterStatus != null ||
              userManagementState.searchQuery != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (userManagementState.filterRole != null)
                    _buildFilterChip(
                      'Rôle: ${userManagementState.filterRole!.displayName}',
                      () {
                        setState(() => _selectedRole = null);
                        ref.read(userManagementProvider.notifier).applyFilters(
                              role: null,
                              status: userManagementState.filterStatus,
                              searchQuery: userManagementState.searchQuery,
                            );
                      },
                    ),
                  if (userManagementState.filterStatus != null)
                    _buildFilterChip(
                      'Statut: ${userManagementState.filterStatus!.displayName}',
                      () {
                        setState(() => _selectedStatus = null);
                        ref.read(userManagementProvider.notifier).applyFilters(
                              role: userManagementState.filterRole,
                              status: null,
                              searchQuery: userManagementState.searchQuery,
                            );
                      },
                    ),
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _selectedRole = null;
                        _selectedStatus = null;
                        _searchController.clear();
                      });
                      ref.read(userManagementProvider.notifier).clearFilters();
                    },
                    icon: const Icon(Icons.clear_all, size: 16),
                    label: const Text('Effacer tout'),
                  ),
                ],
              ),
            ),

          // User List
          Expanded(
            child: userManagementState.isLoading && userManagementState.users.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : userManagementState.error != null && userManagementState.users.isEmpty
                    ? _buildErrorView(userManagementState.error!)
                    : userManagementState.users.isEmpty
                        ? _buildEmptyView()
                        : RefreshIndicator(
                            onRefresh: () async {
                              ref.read(userManagementProvider.notifier).loadUsers();
                            },
                            child: ListView.builder(
                              padding: const EdgeInsets.all(16),
                              itemCount: userManagementState.users.length,
                              itemBuilder: (context, index) {
                                final user = userManagementState.users[index];
                                return _buildUserCard(context, user);
                              },
                            ),
                          ),
          ),

          // Pagination
          if (userManagementState.users.isNotEmpty)
            _buildPagination(userManagementState),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, VoidCallback onDelete) {
    return Chip(
      label: Text(label),
      deleteIcon: const Icon(Icons.close, size: 18),
      onDeleted: onDelete,
      backgroundColor: Colors.blue[50],
      deleteIconColor: Colors.blue[700],
    );
  }

  Widget _buildUserCard(BuildContext context, UserAccount user) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getRoleColor(user.role),
          child: Text(
            user.name.substring(0, 1).toUpperCase(),
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          user.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.email, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            const SizedBox(height: 4),
            Row(
              children: [
                _buildStatusBadge(user.status),
                const SizedBox(width: 8),
                _buildRoleBadge(user.role),
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) => _handleUserAction(context, user, value),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'view',
              child: Row(
                children: [
                  Icon(Icons.visibility, size: 20),
                  SizedBox(width: 8),
                  Text('Voir détails'),
                ],
              ),
            ),
            if (user.status == UserStatus.active)
              const PopupMenuItem(
                value: 'suspend',
                child: Row(
                  children: [
                    Icon(Icons.block, size: 20, color: Colors.orange),
                    SizedBox(width: 8),
                    Text('Suspendre'),
                  ],
                ),
              ),
            if (user.status == UserStatus.suspended)
              const PopupMenuItem(
                value: 'unsuspend',
                child: Row(
                  children: [
                    Icon(Icons.check_circle, size: 20, color: Colors.green),
                    SizedBox(width: 8),
                    Text('Activer'),
                  ],
                ),
              ),
            if (user.status != UserStatus.banned)
              const PopupMenuItem(
                value: 'ban',
                child: Row(
                  children: [
                    Icon(Icons.cancel, size: 20, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Bannir'),
                  ],
                ),
              ),
            if (user.role != UserRole.admin)
              const PopupMenuItem(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete, size: 20, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Supprimer'),
                  ],
                ),
              ),
          ],
        ),
        onTap: () => _handleUserAction(context, user, 'view'),
      ),
    );
  }

  Widget _buildStatusBadge(UserStatus status) {
    Color color;
    switch (status) {
      case UserStatus.active:
        color = Colors.green;
        break;
      case UserStatus.inactive:
        color = Colors.grey;
        break;
      case UserStatus.suspended:
        color = Colors.orange;
        break;
      case UserStatus.banned:
        color = Colors.red;
        break;
      case UserStatus.pendingVerification:
        color = Colors.blue;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        status.displayName,
        style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildRoleBadge(UserRole role) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: _getRoleColor(role).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        role.displayName,
        style: TextStyle(
          fontSize: 10,
          color: _getRoleColor(role),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Color _getRoleColor(UserRole role) {
    switch (role) {
      case UserRole.admin:
        return Colors.purple;
      case UserRole.restaurantOwner:
        return Colors.orange;
      case UserRole.driver:
        return Colors.green;
      case UserRole.customer:
        return Colors.blue;
      case UserRole.support:
        return Colors.teal;
    }
  }

  Widget _buildErrorView(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Erreur de chargement',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              error,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(userManagementProvider.notifier).loadUsers();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Réessayer'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people_outline, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'Aucun utilisateur trouvé',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Essayez de modifier vos filtres',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPagination(UserManagementState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: state.currentPage > 1
                ? () => ref.read(userManagementProvider.notifier).previousPage()
                : null,
            icon: const Icon(Icons.chevron_left),
            label: const Text('Précédent'),
          ),
          Text(
            'Page ${state.currentPage}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextButton.icon(
            onPressed: state.hasMore
                ? () => ref.read(userManagementProvider.notifier).nextPage()
                : null,
            icon: const Icon(Icons.chevron_right),
            label: const Text('Suivant'),
            iconAlignment: IconAlignment.end,
          ),
        ],
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filtrer les utilisateurs'),
        content: StatefulBuilder(
          builder: (context, setDialogState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Rôle:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: UserRole.values.map((role) {
                    return FilterChip(
                      label: Text(role.displayName),
                      selected: _selectedRole == role,
                      onSelected: (selected) {
                        setDialogState(() {
                          _selectedRole = selected ? role : null;
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                const Text('Statut:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: UserStatus.values.map((status) {
                    return FilterChip(
                      label: Text(status.displayName),
                      selected: _selectedStatus == status,
                      onSelected: (selected) {
                        setDialogState(() {
                          _selectedStatus = selected ? status : null;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(userManagementProvider.notifier).applyFilters(
                    role: _selectedRole,
                    status: _selectedStatus,
                    searchQuery: ref.read(userManagementProvider).searchQuery,
                  );
              Navigator.pop(context);
            },
            child: const Text('Appliquer'),
          ),
        ],
      ),
    );
  }

  void _handleUserAction(BuildContext context, UserAccount user, String action) {
    switch (action) {
      case 'view':
        // TODO: Navigate to user details screen
        context.push('/admin/users/${user.userId}');
        break;
      case 'suspend':
        _showSuspendDialog(context, user);
        break;
      case 'unsuspend':
        _confirmAction(
          context,
          'Activer l\'utilisateur',
          'Êtes-vous sûr de vouloir activer ${user.name}?',
          () async {
            final success = await ref
                .read(userManagementProvider.notifier)
                .unsuspendUser(user.userId);
            if (success && context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Utilisateur activé avec succès'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
        );
        break;
      case 'ban':
        _showBanDialog(context, user);
        break;
      case 'delete':
        _confirmAction(
          context,
          'Supprimer l\'utilisateur',
          'Êtes-vous sûr de vouloir supprimer ${user.name}? Cette action est irréversible.',
          () async {
            final success = await ref
                .read(userManagementProvider.notifier)
                .deleteUser(user.userId);
            if (success && context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Utilisateur supprimé avec succès'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          isDestructive: true,
        );
        break;
    }
  }

  void _showSuspendDialog(BuildContext context, UserAccount user) {
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Suspendre l\'utilisateur'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Suspendre ${user.name}?'),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                labelText: 'Raison de la suspension',
                border: OutlineInputBorder(),
                hintText: 'Expliquez pourquoi...',
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
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () async {
              if (reasonController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Veuillez fournir une raison')),
                );
                return;
              }

              Navigator.pop(context);
              final success = await ref
                  .read(userManagementProvider.notifier)
                  .suspendUser(user.userId, reasonController.text.trim());

              if (success && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Utilisateur suspendu avec succès'),
                    backgroundColor: Colors.orange,
                  ),
                );
              }
            },
            child: const Text('Suspendre'),
          ),
        ],
      ),
    );
  }

  void _showBanDialog(BuildContext context, UserAccount user) {
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Bannir l\'utilisateur'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Bannir définitivement ${user.name}?'),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                labelText: 'Raison du bannissement',
                border: OutlineInputBorder(),
                hintText: 'Expliquez pourquoi...',
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
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              if (reasonController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Veuillez fournir une raison')),
                );
                return;
              }

              Navigator.pop(context);
              final success = await ref
                  .read(userManagementProvider.notifier)
                  .banUser(user.userId, reasonController.text.trim());

              if (success && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Utilisateur banni avec succès'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: const Text('Bannir'),
          ),
        ],
      ),
    );
  }

  void _confirmAction(
    BuildContext context,
    String title,
    String message,
    Future<void> Function() onConfirm, {
    bool isDestructive = false,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            style: isDestructive
                ? ElevatedButton.styleFrom(backgroundColor: Colors.red)
                : null,
            onPressed: () {
              Navigator.pop(context);
              onConfirm();
            },
            child: const Text('Confirmer'),
          ),
        ],
      ),
    );
  }
}
